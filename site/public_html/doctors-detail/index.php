<!doctype html>
<html lang="en">
    <head>
        <title>Document</title>

        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <style>
            :root {
                --vc-primary: #AB4452;
                --vc-black: #212121;
                --vc-white: #ffffff;
                --vc-blue-dark: #2B4460FF;
                --vc-transparent: rgba(0, 0, 0, 0);
            }
        </style>


    </head>
    <body>
        <main class="vc-main">
            <div class="vc-sidebar">
                <div class="vc-sidebar__header">
                    <img src="../assets/img/sidebar/sidebar-logo.png" class="vc-sidebar__logo" alt="">
                </div>
                <div class="vc-sidebar__menu">
                    <a href="../" class="vc-sidebar__menu-item">
                        <div class="vc-sidebar__menu-icon">
                            <?= file_get_contents('../assets/img/sidebar/graph.svg'); ?>
                        </div>
                        <div class="vc-sidebar__menu-text">Прогноз</div>
                    </a>
                    <a href="../graph" class="vc-sidebar__menu-item">
                        <div class="vc-sidebar__menu-icon">
                            <?= file_get_contents('../assets/img/sidebar/calendar.svg'); ?>
                        </div>
                        <div class="vc-sidebar__menu-text">График</div>
                    </a>
                    <a href="../doctors" class="vc-sidebar__menu-item  vc-sidebar__menu-item--selected">
                        <div class="vc-sidebar__menu-icon">
                            <?= file_get_contents('../assets/img/sidebar/doctors.svg'); ?>
                        </div>
                        <div class="vc-sidebar__menu-text">Врачи</div>
                    </a>
                    <a href="#" class="vc-sidebar__menu-item">
                        <div class="vc-sidebar__menu-icon">
                            <?= file_get_contents('../assets/img/sidebar/table.svg'); ?>
                        </div>
                        <div class="vc-sidebar__menu-text">Табель</div>
                    </a>
                </div>
            </div>
            <section class="vc-doctors-detail">
                <div class="vc-header">
                    <a href="../doctors" class="vc-header__arrow">
                        <?= file_get_contents('../assets/img/doctors/arrow-left.svg'); ?>
                    </a>
                    <div class="vc-header__title">Константиновский Петр Васильевич</div>
                    <div class="vc-header__avatar">
                        <img src="../assets/img/header/avatar.png" alt="" class="vc-header__avatar-img">
                    </div>
                </div>
                <div class="vc-doctors-detail__content">
                    <div class="vc-schedule">
                        <div class="vc-schedule__header">
                            <div class="vc-schedule__title">Расписание</div>
                            <div class="vc-search__select">
                                    <input type="hidden" class="vc-search__select-input" name="month">
                                    <div class="vc-search__select-container">
                                        <div class="vc-search__select-header">
                                            <div class="vc-search__select-title">
                                                Январь, 2024
                                            </div>
                                            <div class="vc-search__select-arrow">
                                                <?= file_get_contents('../assets/img/search/arrow.svg'); ?>
                                            </div>
                                        </div>
                                        <div class="vc-search__select-list">
                                            <div class="vc-search__select-item"  data-id="1">Январь, 2024</div>
                                            <div class="vc-search__select-item"  data-id="2">Февраль, 2024</div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <div class="vc-schedule__week">
                            <div class="vc-schedule__week-item">Понедельник</div>
                            <div class="vc-schedule__week-item">Вторник</div>
                            <div class="vc-schedule__week-item">Среда</div>
                            <div class="vc-schedule__week-item">Четверг</div>
                            <div class="vc-schedule__week-item">Пятница</div>
                            <div class="vc-schedule__week-item">Суббота</div>
                            <div class="vc-schedule__week-item">Воскресенье</div>
                        </div>
                        <div class="vc-schedule__list">
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">1</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--selected">
                                <div class="vc-schedule__day">2</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">3</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">4</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">5</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--weekend">
                                <div class="vc-schedule__day">6</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__info">Выходной</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--weekend">
                                <div class="vc-schedule__day">7</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__info">Выходной</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">8</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--sick">
                                <div class="vc-schedule__day">9</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__info  vc-schedule__info--sick">Больничный</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--sick">
                                <div class="vc-schedule__day">10</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__info  vc-schedule__info--sick">Больничный</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--sick">
                                <div class="vc-schedule__day">11</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__info  vc-schedule__info--sick">Больничный</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">12</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--weekend">
                                <div class="vc-schedule__day">13</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__info">Выходной</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--weekend">
                                <div class="vc-schedule__day">14</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__info">Выходной</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">15</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">16</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">17</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">18</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">19</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--weekend">
                                <div class="vc-schedule__day">20</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__info">Выходной</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--weekend">
                                <div class="vc-schedule__day">21</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__info">Выходной</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">22</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">23</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">24</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">25</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">26</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--weekend">
                                <div class="vc-schedule__day">27</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__info">Выходной</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item  vc-schedule__item--weekend">
                                <div class="vc-schedule__day">28</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__info">Выходной</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">29</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                            <div class="vc-schedule__item">
                                <div class="vc-schedule__day">30</div>
                                <div class="vc-schedule__item-events">
                                    <div class="vc-schedule__item-event" data-name="rg">6</div>
                                    <div class="vc-schedule__item-event" data-name="mrt">12</div>
                                    <div class="vc-schedule__item-event" data-name="ct">7</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vc-card">
                        <div class="vc-card__header">
                            2 февраля 2024
                            <div class="vc-card__date">Рабочий день</div>
                        </div>
                        <div class="vc-card__schedule">
                            <div class="vc-card__schedule-item">
                                <div class="vc-card__item-name">График работы</div>
                                <div class="vc-card__schedule-time">8:00 - 20:30</div>
                            </div>
                            <div class="vc-card__schedule-item">
                                <div class="vc-card__item-name">Перерыв</div>
                                <div class="vc-card__schedule-time">14:00 - 14:30</div>
                            </div>
                        </div>
                        <div class="vc-card__research">
                            <div class="vc-card__item-name">Исследования</div>
                            <div class="vc-card__research-items">
                                <div class="vc-card__research-item" data-name="rg">РГ 6</div>
                                <div class="vc-card__research-item" data-name="mrt">МРТ 12</div>
                                <div class="vc-card__research-item" data-name="ct">КТ 7</div>
                            </div>
                        </div>
                        <form action="/card" class="vc-record-form__form">
                            <div class="vc-card__thing">
                                <div class="vc-card__thing-header">
                                    <div class="vc-card__item-name">Непредвиденное обстоятельство</div>
                                    <div class="vc-search__select"  data-name="thing">
                                        <input type="hidden" class="vc-search__select-input" name="thing">
                                        <div class="vc-search__select-container">
                                            <div class="vc-search__select-header">
                                                <div class="vc-search__select-title">
                                                    Выбрать
                                                </div>
                                                <div class="vc-search__select-arrow">
                                                    <?= file_get_contents('../assets/img/search/arrow.svg'); ?>
                                                </div>
                                            </div>
                                            <div class="vc-search__select-list">
                                                <div class="vc-search__select-item"  data-id="1">Отпуск за свой счет</div>
                                                <div class="vc-search__select-item"  data-id="2">Больничный</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="vc-card__thing-main">
                                    <div class="vc-card__item-name">Выбрать дату или период</div>
                                    <div class="vc-search__select">
                                        <input type="hidden" class="vc-search__select-input" name="period" value="">
                                        <div class="vc-search__select-container">
                                            <div class="vc-search__select-header">
                                                <div class="vc-search__select-title">
                                                    Период
                                                </div>
                                                <div class="vc-search__select-arrow">
                                                    <?= file_get_contents('../assets/img/search/arrow.svg'); ?>
                                                </div>
                                            </div>
                                            <div class="vc-search__select-list">
                                                <div class="vc-search__select-item"  data-id="1">Текущая неделя</div>
                                                <div class="vc-search__select-item"  data-id="2">Текущий месяц</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="vc-card__thing-period">
                                        <div class="vc-record-form__datetime<?php if ($error) echo '  error'; ?>">
                                            <input
                                                    type="text"
                                                    name="start"
                                                    class="vc-record-form__datetime-input  js-date-mask"
                                                    value=""
                                                    placeholder=""
                                            >
                                        </div>
                                        -
                                        <div class="vc-record-form__datetime<?php if ($error) echo '  error'; ?>">
                                            <input
                                                    type="text"
                                                    name="end"
                                                    class="vc-record-form__datetime-input  js-date-mask"
                                                    value=""
                                                    placeholder=""
                                            >
                                        </div>
                                    </div>
                                </div>
                                <div class="vc-card__thing-footer">
                                    <div class="vc-card__btn  vc-card__btn--close">
                                        <div class="vc-btn  vc-btn--transparent">Отмена</div>
                                    </div>
                                    <button type="submit" class="vc-card__btn">
                                        <div class="vc-btn  vc-btn--transparent">Сохранить</div>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </main>
    </body>
    <link rel="stylesheet" href="../assets/css/app.css">
    <script src="../assets/js/app.js"></script>
</html>