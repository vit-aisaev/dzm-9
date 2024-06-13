import calendar
from datetime import datetime, timedelta


def get_weekday(dt):
    """Возвращает номер недели в году по дате"""
    return dt.isocalendar()[2]  # datetime.IsoCalendarDate(year=2024, week=1, weekday=1)


def time_to_interval(t):
    """Конвертирует объект time в timedelta"""
    return datetime.combine(datetime.min, t) - datetime.min


def time_to_second(t):
    """Конвертирует объект time в количество секунд (float)"""
    interval = time_to_interval(t)
    return interval.seconds


def get_time_chunck(time_value, percent):
    """Уменьшает время time в заданной пропорции percent"""
    # конвертируем время в интервал
    td = time_to_interval(time_value)
    tds = timedelta(seconds=int(td.seconds * percent))
    return (datetime.min + tds).time()


