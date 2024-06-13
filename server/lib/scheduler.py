import numpy as np

import os
from datetime import datetime, timedelta
import calendar
import pandas as pd
import numpy as np
from lib.timeutils import time_to_interval, time_to_second
from lib.dataloader import get_schedule, generate_schedule, get_month_layout, \
    DOCTOR_COLUMNS, DB_SCHEMA, MODALITIES
from lib.db import DB, get_all


class Scheduler:

    """
    Класс представляет популяцию расписания работы врачей на месяц.
    Основной объект v_bot - матрица: (bot_id, doctor_id, day_number, modality) = time_volume
    Вектор весов модальностей v_mod - main_modality: (bot_id, doctor_id, modality) = 1.0 / 0.8 / 0.0
    Вектор доступности v_avail - (bot_id, doctor_id, day_number) = -1, 0, 1
    Вектор врачей v_doctor - (bot_id, doctor_id, props) = any
    """

    def __init__(self, month_start, n_generations):
        self.n_generations = n_generations

        # получаем таблицу врачей
        db = DB()
        q = (f"SELECT id, {', '.join(DOCTOR_COLUMNS)}"
             f" FROM {DB_SCHEMA}.doctor"
             f" WHERE is_active"
             f" ORDER BY id"
             )
        with db.get_cursor() as cursor:
            cursor.execute(q)
            doctors: pd.DataFrame = get_all(cursor)
        self.doctors = doctors

        # создание вектора весов модальностей врачей: (num_doctors, num_mods)
        mod_np = np.array(MODALITIES)
        mod_template = np.zeros((len(MODALITIES)))
        mod_list = []

        def set_mod(row):
            mod = mod_template.copy()
            if len(row['modalities']) > 0:
                _, indices, _ = np.intersect1d(mod_np, row['modalities'], return_indices=True)
                mod[indices] = 0.8
            main_mod = np.where(mod_np == row['main_modality'])
            mod[main_mod] = 1.0
            mod_list.append(mod)

        doctors.apply(set_mod, axis=1)
        v_mod = np.array(mod_list)
        print(f'v_mod: {v_mod.shape}')
        # print(v_mod[:5])
        self.v_mod = v_mod
        self.v_avail = None
        self.v_bot = None
        self.v_doctor = None

        self.month_layout = get_month_layout(month_start)
        """
        source_df = get_schedule('base', month_start, data_layer='day_modality')
        source_df = source_df[source_df['availability'] == 1]
        source_df.drop(['name', 'availability'], axis=1, inplace=True)

        # переводим время в количество секунд (float)
        def to_second(t):
            interval = time_to_interval(t)
            return interval.seconds
        source_df['time_volume'] = source_df['time_volume'].apply(to_second)

        day_source = []
        num_days = calendar.monthrange(month_start.year, month_start.month)[1]
        for day in range(num_days):
            day_date = month_start + timedelta(days=day)
            day_df = source_df[source_df['day'] == day_date].drop(columns=['day'])
            day_df = day_df.pivot(columns=['modality'], index=['doctor_id'], values=['time_volume'])
            # print(day_df)
            source = day_df.values.copy()
            day_source.append(source)
            # print(f'source shape: {source.shape}')
        print('Получено расписаний:', len(day_source))
        self.day_source = day_source
        """

    def initialize(self, n_bots=1):
        settings = {
            'output_format': 'bot',
            'random_schedule_type': True
        }
        num_mods = len(MODALITIES)
        bot_list = []
        avail_list = []
        v_doctor = None
        for bot_number in range(n_bots):

            # выход: [doctor_id, day_number, availability, time_volume]
            src_df, doctor_data = generate_schedule(self.doctors, self.month_layout, settings)
            src_df['time_volume'] = src_df['time_volume'].apply(lambda s: s.seconds)
            # print(f'src_df:\n{src_df.head()}')
            # print(src_df.iloc[0])
            doctor_np = np.array(doctor_data)
            doctor_np = np.expand_dims(doctor_np, axis=0)
            v_doctor = doctor_np if v_doctor is None else np.vstack([v_doctor, doctor_np])

            base_df = src_df.pivot(columns=['day_number'], index=['doctor_id'], values=['time_volume'])
            # print(f'base_df:\n{base_df.head()}')
            bot = base_df.to_numpy(copy=True, dtype=np.float32)
            # раскрываем расписание врача по модальностям: (num_doctors, num_mods, num_days)
            bot = np.repeat(bot[:, np.newaxis, :], num_mods, axis=1)
            print(f'bot: {bot.shape}')
            # оставляем всё рабочее время на основной модальности
            bot[self.v_mod < 1.] = 0.
            bot_list.append(bot)
            # for i in [0, 2]:
            #     print(f'doctor: {i}')
            #     for j in range(num_mods):
            #         print(f'mod: {j}')
            #         print(bot[i, j])
            # print(f'bot:\n{bot[0:num_mods:2]}')

            avail_df = src_df.pivot(columns=['day_number'], index=['doctor_id'], values=['availability'])
            avail_list.append(avail_df.to_numpy(dtype=np.float32, copy=True))
            # print(avail_df.head())

        # вектор доступности врачей
        self.v_avail = np.array(avail_list)
        print(f'v_avail: {self.v_avail.shape}')
        self.v_bot = np.array(bot_list)
        print(f'v_bot: {self.v_bot.shape}')
        self.v_doctor = np.array(v_doctor)
        print(f'v_doctor: {self.v_doctor.shape}')
        # print(self.v_doctor[0, :10])

    def evaluate(self):

        time_pw = 10  # степень функции для оценки нормы рабочего времени в рамках дня
        main_mod_k = 1.5

        self.v_bot[0, 0, 0, 0:5] = 20000.
        self.v_bot[0, 0, 0, 6:8] = 1000.
        self.v_bot[0, 2, 0, 3:5] = 50000.

        f_mod = self.v_mod[np.newaxis, :, :, np.newaxis] > 0.
        f_main_mod = self.v_mod[np.newaxis, :, :, np.newaxis] > 0.99
        f_noworks = np.isclose(self.v_bot, 0.)
        f_day_time_norm = self.v_doctor[:, :, 0, np.newaxis, np.newaxis]

        v_scores = np.zeros(self.v_bot.shape)
        # оценка отдельного рабочего дня врача в рамках модальности:
        # если работ нет - ставим 1
        v_scores[f_noworks & f_mod] = 1.
        # есть работы по своим модальностям
        work_frame = np.bitwise_and(np.invert(f_noworks), f_mod)
        # отбираем работы со временем меньше нормативного
        # оценку 1 получают работы по модальности не превышающие нормативное время
        # v_scores[indices] = np.power(
        #     self.v_bot / self.v_doctor[:, :, 0, np.newaxis, np.newaxis] * 2 - 1, time_pw
        # )[indices]
        v_scores[work_frame & (self.v_bot <= f_day_time_norm)] = 1.
        print(f'v_scores:\n{v_scores.shape}')
        # отбираем работы по модальности со временем больше нормативного - они получают убывающую оценку
        indices = np.bitwise_and(work_frame, self.v_bot > f_day_time_norm)
        v_scores[indices] = np.power(
            -2. + self.v_bot / f_day_time_norm, time_pw
        )[indices]
        print(f'indices:\n{indices.shape}')
        print(f'v_scores:\n{v_scores.shape}')

        # добавляем оценку за работы по основной модальности
        v_scores[work_frame & f_main_mod] *= main_mod_k

        # добавляем оценку рабочего дня
        v_scores = np.sum(self.v_bot, axis=2, keepdims=True)

        for i in [0, 2]:
            print(f'doctor: {i}')
            for j in range(6):
                print(f'mod: {j}')
                print(v_scores[0, i, j])

    def select(self):
        pass

    def mate(self):
        pass

    def mutate(self):
        pass

    def run(self):

        self.initialize(n_bots=self.n_generations)

        for generation in range(self.n_generations):
            # print(f'Поколение #{generation}')
            # вычисляем оценку ботов
            self.evaluate()
            # производим отбор
            self.select()
            # добавляем случайных ботов
            # self.initialize()
            # скрещиваем ботов
            self.mate()
            # производим мутацию
            self.mutate()


if __name__ == '__main__':
    os.chdir('..')

    month_start = datetime(2024, 1, 1)

    scheduler = Scheduler(
        month_start,
        n_generations=1
    )
    scheduler.run()

    # schedule = get_schedule('base', month_start, data_layer='day')
    # schedule = get_schedule('base', month_start, data_layer='day_modality')
    # schedule = get_schedule('base', month_start, data_layer='day_modality_ce')
    # print(schedule.head(20))
