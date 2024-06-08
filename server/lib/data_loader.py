import os
import pandas as pd
import hashlib
import uuid
import random
from datetime import time

from lib.db import DB

XLS_FILEPATH = '/Users/ivan/Documents/CIFROPRO/Проекты/Нейронки/Расписание рентген-центра/'
MODALITIES: list[str] = ['kt', 'mrt', 'rg', 'flg', 'mmg', 'dens']
MODALITIES_MAP = {
    'кт': 'kt',
    'мрт': 'mrt',
    'рг': 'rg',
    'флг': 'flg',
    'ммг': 'mmg',
    'денс': 'dens',
    'денситометрия': 'dens'
}
SCHEDULE_TYPES = ['5/2', '2/2']
DOCTOR_COLUMNS = ['uid', 'name', 'w_modalities', 'schedule_type', 'time_rate', 'day_start_time', 'is_active']


def get_uuid_from_columns(df_row, *args):
    source = "/".join([str(df_row[column_name]) for column_name in args])
    row_hash = hashlib.md5(source.encode('utf-8'))
    return uuid.UUID(row_hash.hexdigest())


def load_summary(tablename, filename, sheetname, version=None):
    """"Загружает понедельный факт или план в разрезе модальностей из Excel"""

    df_src = pd.read_excel(XLS_FILEPATH + filename, sheetname)
    df = df_src.melt(
        id_vars=['year', 'week'], value_vars=MODALITIES,
        var_name='modality', value_name='amount'
    )
    df['contrast_enhancement'] = 'none'

    def enhance(df_src, value_var):
        extra_df = df_src.melt(
            id_vars=['year', 'week'], value_vars=[value_var],
            var_name='modality', value_name='amount'
        )
        extra_df[['modality', 'contrast_enhancement']] = extra_df['modality'].str.split('_', expand=True)
        return extra_df

    for ce in ['mrt_ce1', 'mrt_ce2', 'kt_ce1', 'kt_ce2']:
        df = pd.concat([df, enhance(df_src, ce)])

    df['amount'].fillna(0, inplace=True)
    print(df.head())

    if version:
        df['version'] = version

    # формируем уникальный uid из списка уникальности записи
    unique = ['year', 'week', 'modality', 'contrast_enhancement']
    df['uid'] = df.apply(get_uuid_from_columns, args=tuple(unique), axis=1)

    db = DB()
    db.upsert(df, tablename, unique)
    db.close()


def load_doctor(tablename, filename, sheetname):
    """Заполняет таблицу врачей"""
    df_src = pd.read_excel(XLS_FILEPATH + filename, sheetname)
    print(df_src.head())

    def is_empty(value):
        return pd.isna(value) or value is None or str(value).strip() == ''

    def set_modality_weight(w_modalities, modality_ru, unknown_modalities, weight):
        if modality_ru not in MODALITIES_MAP:
            if modality_ru not in unknown_modalities:
                print(f'Модальность "{modality_ru}" не найдена в словаре.')
                unknown_modalities.append(modality_ru)
            return
        modality = MODALITIES_MAP[modality_ru]
        modality_index: int = modality_indices[modality]
        if w_modalities[modality_index] == 0.0:
            w_modalities[modality_index] = weight

    doctors = []
    unknown_modalities = []
    for i, row in df_src.iterrows():
        modality_ru: str = row['modality']
        if is_empty(modality_ru):
            print('Не задана модальность в строке:', i)
            continue
        uid = uuid.uuid4()
        modality_ru = modality_ru.lower().strip()
        # веса модальностей
        w_modalities = [0 for _ in range(len(MODALITIES))]
        modality_indices = {m: index for index, m in enumerate(MODALITIES)}

        set_modality_weight(w_modalities, modality_ru, unknown_modalities, 1.0)

        # распаковка дополнительных модальностей
        extra_modalities = row['extra_modalities']
        if not is_empty(extra_modalities):
            for em_ru in extra_modalities.split(','):
                em_ru = em_ru.lower().strip()
                set_modality_weight(w_modalities, em_ru, unknown_modalities, 0.5)

        schedule_type = random.choice(SCHEDULE_TYPES)
        day_start_time = time(8, 0, 0)
        is_active = True

        doctors.append([uid, row['name'], w_modalities, schedule_type, row['time_rate'], day_start_time, is_active])

    df = pd.DataFrame(doctors, columns=DOCTOR_COLUMNS)
    print(df.tail())
    print(df.iloc[0])
    unique = ['name']
    db = DB()
    db.upsert(df, tablename, unique)
    db.close()
    print('Сохранено записей:', len(df))


def load_doctor_availability(tablename):
    pass


if __name__ == '__main__':
    os.chdir('..')

    # загрузка факта работ из Excel
    # load_summary('work_summary', 'work_summary.xlsx', 'Chart data')

    # загрузка плана работ из Excel
    load_summary('work_plan_summary', 'work_plan.xlsx', 'Chart data', version='validation')

    # загрузка врачей из Excel
    # load_doctor('doctor', 'Пример табеля.xlsx', 'for_load')

    # генерация таблицы доступности врачей
    load_doctor_availability('doctor_availability')