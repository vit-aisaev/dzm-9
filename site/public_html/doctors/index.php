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
<main class="vc-main  vc-main--whitebg">
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
    <section class="vc-doctors">
        <div class="vc-doctors__doctor-card">
            <form action="/doctors" class="vc-record__form">
                <div class="vc-doctors__card">
                    <div class="vc-doctors__card-close">
                        <?= file_get_contents('../assets/img/doctors/close.svg'); ?>
                    </div>
                    <div class="vc-doctors__card-title">Карточка врача</div>
                    <div class="vc-doctors__card-header">
                        <div class="vc-doctors__doctor-name">ФИО</div>
                        <div class="vc-search__input-wrapper">
                            <input type="text" class="vc-search__input" placeholder="" name="q" value="Константиновский">
                        </div>
                        <div class="vc-search__inputs">
                            <div class="vc-search__input-wrapper">
                                <input type="text" class="vc-search__input" placeholder="" name="q" value="Петр">
                            </div>
                            <div class="vc-search__input-wrapper">
                                <input type="text" class="vc-search__input" placeholder="" name="q" value="Васильевич">
                            </div>
                        </div>
                    </div>
                    <div class="vc-doctors__checkbox">
                        <label class="vc-record-form__checkbox-wrapper">
                            <input type="checkbox" class="vc-record-form__checkbox" name="agreement">
                            <div class="vc-record-form__checkmark">
                                <?= file_get_contents('../assets/img/record-form/check.svg'); ?>
                            </div>
                        </label>
                        <div class="vc-record-form__checkbox-text">Работает</div>
                    </div>
                    <div class="vc-doctors__doctor-rates">
                        <div class="vc-doctors__doctor-rate">
                            Табельный №
                            <div class="vc-search__input-wrapper  vc-search__input-wrapper--disabled">
                                <input type="text" class="vc-search__input" placeholder="" name="q" value="0001">
                            </div>
                        </div>
                        <div class="vc-doctors__doctor-rate">
                            Ставка
                            <div class="vc-search__select">
                                <input type="hidden" class="vc-search__select-input" name="rate">
                                <div class="vc-search__select-container">
                                    <div class="vc-search__select-header">
                                        <div class="vc-search__select-title">
                                            1
                                        </div>
                                        <div class="vc-search__select-arrow">
                                            <?= file_get_contents('../assets/img/search/arrow.svg'); ?>
                                        </div>
                                    </div>
                                    <div class="vc-search__select-list">
                                        <div class="vc-search__select-item"  data-id="1">1</div>
                                        <div class="vc-search__select-item"  data-id="2">0.5</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vc-doctors__main">
                        <div class="vc-doctors__main-spec">
                            Модальность
                            <div class="vc-search__select">
                                <input type="hidden" class="vc-search__select-input" name="main-spec">
                                <div class="vc-search__select-container">
                                    <div class="vc-search__select-header">
                                        <div class="vc-search__select-title">
                                            РГ
                                        </div>
                                        <div class="vc-search__select-arrow">
                                            <?= file_get_contents('../assets/img/search/arrow.svg'); ?>
                                        </div>
                                    </div>
                                    <div class="vc-search__select-list">
                                        <div class="vc-search__select-item"  data-id="1">КТ</div>
                                        <div class="vc-search__select-item"  data-id="2">МРТ</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="vc-doctors__sec-spec">
                            Дополнительные модальности
                            <div class="vc-doctors__new-spec">
                                <div class="vc-search__select" data-name="sec-spec" data-id="rg">
                                    <input type="hidden" class="vc-search__select-input" name="sec-spec">
                                    <div class="vc-search__select-container">
                                        <div class="vc-search__select-header">
                                            <div class="vc-search__select-title">
                                                РГ
                                            </div>
                                            <div class="vc-search__select-arrow">
                                                <?= file_get_contents('../assets/img/search/arrow.svg'); ?>
                                            </div>
                                        </div>
                                        <div class="vc-search__select-list">
                                            <div class="vc-search__select-item"  data-id="rg">РГ</div>
                                            <div class="vc-search__select-item"  data-id="ct">КТ</div>
                                            <div class="vc-search__select-item"  data-id="mrt">МРТ</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="vc-doctors__new-spec-btn">
                                    Добавить
                                </div>
                            </div>
                            <div class="vc-doctors__spec-list">
                                <div class="vc-doctors__spec"  data-name="ct">
                                    <div class="vc-doctors__spec-head">КТ</div>
                                    <div class="vc-doctors__spec-remove">
                                        <?= file_get_contents('../assets/img/doctors/spec-remove.svg'); ?>
                                    </div>
                                </div>
                                <div class="vc-doctors__spec"  data-name="mmg">
                                    <div class="vc-doctors__spec-head">ММГ</div>
                                    <div class="vc-doctors__spec-remove">
                                        <?= file_get_contents('../assets/img/doctors/spec-remove.svg'); ?>
                                    </div>
                                </div>
                                <div class="vc-doctors__spec"  data-name="flg">
                                    <div class="vc-doctors__spec-head">ФЛГ</div>
                                    <div class="vc-doctors__spec-remove">
                                        <?= file_get_contents('../assets/img/doctors/spec-remove.svg'); ?>
                                    </div>
                                </div>
                                <div class="vc-doctors__spec"  data-name="densinometriya">
                                    <div class="vc-doctors__spec-head">Денситометрия</div>
                                    <div class="vc-doctors__spec-remove">
                                        <?= file_get_contents('../assets/img/doctors/spec-remove.svg'); ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vc-doctors__schedule">
                        <div class="vc-doctors__schedule-item">
                            Время работы
                            <div class="vc-doctors__period">
                                <div class="vc-search__input-wrapper">
                                    <input type="text" class="vc-search__input" placeholder="" name="q" value="8:00">
                                </div>
                                -
                                <div class="vc-search__input-wrapper">
                                    <input type="text" class="vc-search__input" placeholder="" name="q" value="20:30">
                                </div>
                            </div>
                        </div>
                        <div class="vc-doctors__schedule-item">
                            Перерыв
                            <div class="vc-doctors__period">
                                <div class="vc-search__input-wrapper">
                                    <input type="text" class="vc-search__input" placeholder="" name="q" value="30">
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="vc-doctors__graph">
                        <div class="vc-btn  vc-btn--transparent">
                            <?= file_get_contents('../assets/img/doctors/calendar.svg'); ?>
                            График работы
                        </div>
                    </a>
                    <div class="vc-doctors__footer">
                        <div class="vc-doctors__footer-btn  vc-doctors__footer-btn--cancel">
                            <div class="vc-btn  vc-btn--transparent">Отмена</div>
                        </div>
                        <button type="submit" class="vc-doctors__footer-btn">
                            <div class="vc-btn  vc-btn--transparent">Сохранить</div>
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div class="vc-header">
            <div class="vc-header__title">Врачи</div>
            <div class="vc-header__avatar">
                <img src="../assets/img/header/avatar.png" alt="" class="vc-header__avatar-img">
            </div>
        </div>
        <div class="vc-doctors__content">
            <div class="vc-search">
                <div class="vc-doctors__filters-wrapper">
                    <form action="/doctors/" method="get" class="vc-doctors__filters">
                        <div class="vc-search__input-wrapper">
                            <div class="vc-search__icon">
                                <?= file_get_contents('../assets/img/search/search.svg'); ?>
                            </div>
                            <input type="text" class="vc-search__input" placeholder="Поиск" name="name">
                        </div>
                        <div class="vc-search__select">
                            <input type="hidden" class="vc-search__select-input" name="modal">
                            <div class="vc-search__select-container">
                                <div class="vc-search__select-header">
                                    <div class="vc-search__select-title">
                                        Модальность
                                    </div>
                                    <div class="vc-search__select-arrow">
                                        <?= file_get_contents('../assets/img/search/arrow.svg'); ?>
                                    </div>
                                </div>
                                <div class="vc-search__select-list">
                                    <div class="vc-search__select-item"  data-id="rg">РГ</div>
                                    <div class="vc-search__select-item"  data-id="mrt">МРТ</div>
                                </div>
                            </div>
                        </div>
                        <div class="vc-search__select">
                            <input type="hidden" class="vc-search__select-input" name="sub-modal">
                            <div class="vc-search__select-container">
                                <div class="vc-search__select-header">
                                    <div class="vc-search__select-title">
                                        Доп. модальности
                                    </div>
                                    <div class="vc-search__select-arrow">
                                        <?= file_get_contents('../assets/img/search/arrow.svg'); ?>
                                    </div>
                                </div>
                                <div class="vc-search__select-list" multiple="true">
                                    <div class="vc-search__select-item"  data-id="ct">КТ</div>
                                    <div class="vc-search__select-item"  data-id="mmg">ММГ</div>
                                    <div class="vc-search__select-item"  data-id="mrt">МРТ</div>
                                    <div class="vc-search__select-item"  data-id="flg">ФЛГ</div>
                                    <div class="vc-search__select-item"  data-id="den">Денсинометрия</div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="vc-doctors__btn">
                        <div class="vc-btn  vc-btn--transparent">Добавить врача</div>
                    </div>
                </div>
            </div>
            <div class="vc-doctors__list">
                <table class="vc-table">
                    <thead>
                    <tr>
                        <th>№</th>
                        <th>Фамилия Имя Отчество</th>
                        <th>Модальность</th>
                        <th>Дополнительные модальности</th>
                        <th>Ставка</th>
                        <th>Таб. №</th>
                        <th>С</th>
                        <th>До</th>
                        <th>Перерыв</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr onclick="window.location.href='../doctors-detail'; return false" class="vc-doctors__doctor">
                        <th>1</th>
                        <td>
                            <div class="vc-doctors__doctor-name">Петровский Алексей Георгиевич</div>
                        </td>
                        <td>
                            РГ
                        </td>
                        <td>
                            КТ, ММГ, ФЛГ, Денситометрия
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            0001
                        </td>
                        <td>
                            08:00
                        </td>
                        <td>
                            20:30
                        </td>
                        <td>
                            30
                        </td>
                        <td class="vc-doctors__doctor-edit">
                            <?= file_get_contents('../assets/img/doctors/pen.svg'); ?>
                        </td>
                    </tr>
                    <tr onclick="window.location.href='../doctors-detail'; return false" class="vc-doctors__doctor  vc-doctors__doctor--warn">
                        <th>2</th>
                        <td>
                            <div class="vc-doctors__doctor-name">Константиновский Петр Васильевич
                                <?= file_get_contents('../assets/img/doctors/alert.svg'); ?>
                            </div>
                        </td>
                        <td>
                            РГ
                        </td>
                        <td>
                            КТ,МРТ
                        </td>
                        <td>
                            0.5
                        </td>
                        <td>
                            0002
                        </td>
                        <td>
                            08:00
                        </td>
                        <td>
                            14:30
                        </td>
                        <td>
                            30
                        </td>
                        <td>
                            <div class="vc-doctors__doctor-edit">
                                <?= file_get_contents('../assets/img/doctors/pen.svg'); ?>
                            </div>
                        </td>
                    <tr class="vc-doctors__doctor">
                        <th>1</th>
                        <td>
                            <div class="vc-doctors__doctor-name">Петровский Алексей Георгиевич</div>
                        </td>
                        <td>
                            РГ
                        </td>
                        <td>
                            КТ, ММГ, ФЛГ, Денситометрия
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            0001
                        </td>
                        <td>
                            08:00
                        </td>
                        <td>
                            20:30
                        </td>
                        <td>
                            30
                        </td>
                        <td class="vc-doctors__doctor-edit">
                            <?= file_get_contents('../assets/img/doctors/pen.svg'); ?>
                        </td>
                    </tr>
                    <tr onclick="window.location.href='../doctors-detail'; return false" class="vc-doctors__doctor">
                        <th>2</th>
                        <td>
                            <div class="vc-doctors__doctor-name">Петровский Алексей Георгиевич</div>
                        </td>
                        <td>
                            РГ
                        </td>
                        <td>
                            КТ,МРТ
                        </td>
                        <td>
                            0.5
                        </td>
                        <td>
                            0002
                        </td>
                        <td>
                            08:00
                        </td>
                        <td>
                            14:30
                        </td>
                        <td>
                            30
                        </td>
                        <td class="vc-doctors__doctor-edit">
                            <?= file_get_contents('../assets/img/doctors/pen.svg'); ?>
                        </td>
                    </tr>
                    <tr onclick="window.location.href='../doctors-detail'; return false" class="vc-doctors__doctor">
                        <th>1</th>
                        <td>
                            <div class="vc-doctors__doctor-name">Константиновский Петр Васильевич</div>
                        </td>
                        <td>
                            РГ
                        </td>
                        <td>
                            КТ, ММГ, ФЛГ, Денситометрия
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            0001
                        </td>
                        <td>
                            08:00
                        </td>
                        <td>
                            20:30
                        </td>
                        <td>
                            30
                        </td>
                        <td class="vc-doctors__doctor-edit">
                            <?= file_get_contents('../assets/img/doctors/pen.svg'); ?>
                        </td>
                    </tr>
                    <tr onclick="window.location.href='../doctors-detail'; return false" class="vc-doctors__doctor">
                        <th>2</th>
                        <td>
                            <div class="vc-doctors__doctor-name">Петровский Алексей Георгиевич</div>
                        </td>
                        <td>
                            РГ
                        </td>
                        <td>
                            КТ,МРТ
                        </td>
                        <td>
                            0.5
                        </td>
                        <td>
                            0002
                        </td>
                        <td>
                            08:00
                        </td>
                        <td>
                            14:30
                        </td>
                        <td>
                            30
                        </td>
                        <td class="vc-doctors__doctor-edit">
                            <?= file_get_contents('../assets/img/doctors/pen.svg'); ?>
                        </td>
                    </tr>
                    <tr onclick="window.location.href='../doctors-detail'; return false" class="vc-doctors__doctor">
                        <th>1</th>
                        <td>
                            <div class="vc-doctors__doctor-name">Константиновский Петр Васильевич</div>
                        </td>
                        <td>
                            РГ
                        </td>
                        <td>
                            КТ, ММГ, ФЛГ, Денситометрия
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            0001
                        </td>
                        <td>
                            08:00
                        </td>
                        <td>
                            20:30
                        </td>
                        <td>
                            30
                        </td>
                        <td class="vc-doctors__doctor-edit">
                            <?= file_get_contents('../assets/img/doctors/pen.svg'); ?>
                        </td>
                    </tr>
                    <tr onclick="window.location.href='../doctors-detail'; return false" class="vc-doctors__doctor">
                        <th>2</th>
                        <td>
                            <div class="vc-doctors__doctor-name">Петровский Алексей Георгиевич</div>
                        </td>
                        <td>
                            РГ
                        </td>
                        <td>
                            КТ,МРТ
                        </td>
                        <td>
                            0.5
                        </td>
                        <td>
                            0002
                        </td>
                        <td>
                            08:00
                        </td>
                        <td>
                            14:30
                        </td>
                        <td>
                            30
                        </td>
                        <td class="vc-doctors__doctor-edit">
                            <?= file_get_contents('../assets/img/doctors/pen.svg'); ?>
                        </td>
                    </tr>
                    <tr onclick="window.location.href='../doctors-detail'; return false" class="vc-doctors__doctor">
                        <th>1</th>
                        <td>
                            <div class="vc-doctors__doctor-name">Константиновский Петр Васильевич</div>
                        </td>
                        <td>
                            РГ
                        </td>
                        <td>
                            КТ, ММГ, ФЛГ, Денситометрия
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            0001
                        </td>
                        <td>
                            08:00
                        </td>
                        <td>
                            20:30
                        </td>
                        <td>
                            30
                        </td>
                        <td class="vc-doctors__doctor-edit">
                            <?= file_get_contents('../assets/img/doctors/pen.svg'); ?>
                        </td>
                    </tr>
                    <tr onclick="window.location.href='../doctors-detail'; return false" class="vc-doctors__doctor">
                        <th>2</th>
                        <td>
                            <div class="vc-doctors__doctor-name">Петровский Алексей Георгиевич</div>
                        </td>
                        <td>
                            РГ
                        </td>
                        <td>
                            КТ,МРТ
                        </td>
                        <td>
                            0.5
                        </td>
                        <td>
                            0002
                        </td>
                        <td>
                            08:00
                        </td>
                        <td>
                            14:30
                        </td>
                        <td>
                            30
                        </td>
                        <td class="vc-doctors__doctor-edit">
                            <?= file_get_contents('../assets/img/doctors/pen.svg'); ?>
                        </td>
                    </tr>
                    <tr onclick="window.location.href='../doctors-detail'; return false" class="vc-doctors__doctor">
                        <th>1</th>
                        <td>
                            <div class="vc-doctors__doctor-name">Константиновский Петр Васильевич</div>
                        </td>
                        <td>
                            РГ
                        </td>
                        <td>
                            КТ, ММГ, ФЛГ, Денситометрия
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            0001
                        </td>
                        <td>
                            08:00
                        </td>
                        <td>
                            20:30
                        </td>
                        <td>
                            30
                        </td>
                        <td class="vc-doctors__doctor-edit">
                            <?= file_get_contents('../assets/img/doctors/pen.svg'); ?>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</main>
<footer class="vc-footer">
    <div class="vc-preloader"></div>
</footer>
</body>
<link rel="stylesheet" href="../assets/css/app.css">
<script src="../assets/js/app.js"></script>
</html>