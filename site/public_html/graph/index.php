<?php

require($_SERVER['DOCUMENT_ROOT'].'/bitrix/header.php');
$APPLICATION->SetTitle('График');
?>

<section class="vc-graph">
    <div class="vc-header">
        <div class="vc-header__top">
            <div class="vc-header__title">График на февраль 2024</div>
            <div class="vc-header__avatar">
                <img src="<?= SITE_TEMPLATE_PATH.'/assets/img/header/avatar.png'; ?>" alt="" class="vc-header__avatar-img">
            </div>
        </div>
        <div class="vc-header__bot">
            <div class="vc-graph__notification    vc-graph__notification--red">
                <div class="vc-graph__notification-icon">
                    <?= file_get_contents('../assets/img/graph/alert.svg'); ?>
                </div>
                <div class="vc-graph__notification-info">
                    <div class="vc-graph__notification-title">Дефицит ресурсов</div>
                    <div class="vc-graph__notification-subtitle">Количество исследований превышает доступные часы специалистов.</div>
                </div>
            </div>
            <div class="vc-graph__notification    vc-graph__notification--green">
                <div class="vc-graph__notification-icon">
                    <?= file_get_contents('../assets/img/graph/star.svg'); ?>
                </div>
                <div class="vc-graph__notification-info">
                    <div class="vc-graph__notification-title">Рекомендация</div>
                    <div class="vc-graph__notification-subtitle">Вызвать из отпуска 2 сотрудников на 1 день</div>
                </div>
                <div class="vc-graph__notification-btn">
                    <div class="vc-btn  vc-btn--transparent">Применить</div>
                </div>
            </div>
        </div>
    </div>
    <div class="vc-graph__content">
        <div class="vc-tabs">
            <div class="vc-graph__tabs">
                <div class="vc-graph__cap">
                    <div class="vc-graph__cap-info">
                        <div class="vc-graph__icon">КТ 2</div>
                        — дефицит врачей
                    </div>
                    <div class="vc-graph__cap-info">
                        <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                        — профицит врачей
                    </div>
                </div>
                <div class="vc-tabs__header">
                    <div class="vc-tabs__tab  vc-tabs__tab--active" data-name="resourses">Дефицит ресурсов</div>
                    <div class="vc-tabs__tab" data-name="doctors">Загрузка врачей</div>
                </div>
            </div>
            <div class="vc-tabs__content  vc-tabs__content--active" data-name="resourses">
                <div class="vc-graph__list">
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">1</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">
                            <div class="vc-graph__day-alert">
                                <?= file_get_contents('../assets/img/graph/day-alert.svg'); ?>
                            </div>
                            2
                        </div>
                        <div class="vc-graph__events">
                            <div class="vc-graph__icon">КТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                            <div class="vc-graph__icon">ФЛГ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">МРТ 4</div>
                            <div class="vc-graph__icon">МРТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">Ден 4</div>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">3</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">4</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">5</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">
                            <div class="vc-graph__day-alert">
                                <?= file_get_contents('../assets/img/graph/day-alert.svg'); ?>
                            </div>
                            6
                        </div>
                        <div class="vc-graph__events">
                            <div class="vc-graph__icon">КТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                            <div class="vc-graph__icon">ФЛГ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">МРТ 4</div>
                            <div class="vc-graph__icon">МРТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">Ден 4</div>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">7</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">8</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">9</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">10</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">11</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">
                            <div class="vc-graph__day-alert">
                                <?= file_get_contents('../assets/img/graph/day-alert.svg'); ?>
                            </div>
                            12
                        </div>
                        <div class="vc-graph__events">
                            <div class="vc-graph__icon">КТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                            <div class="vc-graph__icon">ФЛГ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">МРТ 4</div>
                            <div class="vc-graph__icon">МРТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">Ден 4</div>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">13</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">14</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">15</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">16</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">
                            <div class="vc-graph__day-alert">
                                <?= file_get_contents('../assets/img/graph/day-alert.svg'); ?>
                            </div>
                            17
                        </div>
                        <div class="vc-graph__events">
                            <div class="vc-graph__icon">КТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                            <div class="vc-graph__icon">ФЛГ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">МРТ 4</div>
                            <div class="vc-graph__icon">МРТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">Ден 4</div>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">
                            <div class="vc-graph__day-alert">
                                <?= file_get_contents('../assets/img/graph/day-alert.svg'); ?>
                            </div>
                            18
                        </div>
                        <div class="vc-graph__events">
                            <div class="vc-graph__icon">КТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                            <div class="vc-graph__icon">ФЛГ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">МРТ 4</div>
                            <div class="vc-graph__icon">МРТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">Ден 4</div>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">19</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">20</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">21</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">22</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">
                            <div class="vc-graph__day-alert">
                                <?= file_get_contents('../assets/img/graph/day-alert.svg'); ?>
                            </div>
                            23
                        </div>
                        <div class="vc-graph__events">
                            <div class="vc-graph__icon">КТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                            <div class="vc-graph__icon">ФЛГ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">МРТ 4</div>
                            <div class="vc-graph__icon">МРТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">Ден 4</div>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">24</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">25</div>
                        <div class="vc-graph__events">
                            <?= file_get_contents('../assets/img/graph/checked.svg'); ?>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">
                            <div class="vc-graph__day-alert">
                                <?= file_get_contents('../assets/img/graph/day-alert.svg'); ?>
                            </div>
                            26
                        </div>
                        <div class="vc-graph__events">
                            <div class="vc-graph__icon">КТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                            <div class="vc-graph__icon">ФЛГ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">МРТ 4</div>
                            <div class="vc-graph__icon">МРТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">Ден 4</div>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">
                            <div class="vc-graph__day-alert">
                                <?= file_get_contents('../assets/img/graph/day-alert.svg'); ?>
                            </div>
                            27
                        </div>
                        <div class="vc-graph__events">
                            <div class="vc-graph__icon">КТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                            <div class="vc-graph__icon">ФЛГ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">МРТ 4</div>
                            <div class="vc-graph__icon">МРТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">Ден 4</div>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">
                            <div class="vc-graph__day-alert">
                                <?= file_get_contents('../assets/img/graph/day-alert.svg'); ?>
                            </div>
                            28
                        </div>
                        <div class="vc-graph__events">
                            <div class="vc-graph__icon">КТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                            <div class="vc-graph__icon">ФЛГ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">МРТ 4</div>
                            <div class="vc-graph__icon">МРТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">Ден 4</div>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">
                            <div class="vc-graph__day-alert">
                                <?= file_get_contents('../assets/img/graph/day-alert.svg'); ?>
                            </div>
                            29
                        </div>
                        <div class="vc-graph__events">
                            <div class="vc-graph__icon">КТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                            <div class="vc-graph__icon">ФЛГ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">МРТ 4</div>
                            <div class="vc-graph__icon">МРТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">Ден 4</div>
                        </div>
                    </div>
                    <div class="vc-graph__item">
                        <div class="vc-graph__day">
                            <div class="vc-graph__day-alert">
                                <?= file_get_contents('../assets/img/graph/day-alert.svg'); ?>
                            </div>
                            30
                        </div>
                        <div class="vc-graph__events">
                            <div class="vc-graph__icon">КТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">РГ 4</div>
                            <div class="vc-graph__icon">ФЛГ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">МРТ 4</div>
                            <div class="vc-graph__icon">МРТ 2</div>
                            <div class="vc-graph__icon  vc-graph__icon--orange">Ден 4</div>
                        </div>
                </div>
                </div>
            </div>
            <div class="vc-tabs__content" data-name="doctors">
                <div class="vc-graph__doctors-list">
                    <div class="vc-graph__doctors-day">
                        <div class="vc-graph__doctors-day-title">1 пн</div>
                        <div class="vc-graph__doctors-count">
                            <div class="vc-graph__day-count" data-name="rg">РГ 97 врача</div>
                            <div class="vc-graph__day-count" data-name="ct">КТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mrt">МРТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mmg">ММГ 26 врача</div>
                            <div class="vc-graph__day-count" data-name="flg">ФЛГ 49 врача</div>
                            <div class="vc-graph__day-count" data-name="den">ДЕН 63 врача</div>
                        </div>
                    </div>
                    <div class="vc-graph__doctors-day">
                        <div class="vc-graph__doctors-day-title">2 вт</div>
                        <div class="vc-graph__doctors-count">
                            <div class="vc-graph__day-count" data-name="rg">РГ 97 врача</div>
                            <div class="vc-graph__day-count" data-name="ct">КТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mrt">МРТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mmg">ММГ 26 врача</div>
                            <div class="vc-graph__day-count" data-name="flg">ФЛГ 49 врача</div>
                            <div class="vc-graph__day-count" data-name="den">ДЕН 63 врача</div>
                        </div>
                    </div>
                    <div class="vc-graph__doctors-day">
                        <div class="vc-graph__doctors-day-title">3 ср</div>
                        <div class="vc-graph__doctors-count">
                            <div class="vc-graph__day-count" data-name="rg">РГ 97 врача</div>
                            <div class="vc-graph__day-count" data-name="ct">КТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mrt">МРТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mmg">ММГ 26 врача</div>
                            <div class="vc-graph__day-count" data-name="flg">ФЛГ 49 врача</div>
                            <div class="vc-graph__day-count" data-name="den">ДЕН 63 врача</div>
                        </div>
                    </div>
                    <div class="vc-graph__doctors-day">
                        <div class="vc-graph__doctors-day-title">4 чт</div>
                        <div class="vc-graph__doctors-count">
                            <div class="vc-graph__day-count" data-name="rg">РГ 97 врача</div>
                            <div class="vc-graph__day-count" data-name="ct">КТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mrt">МРТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mmg">ММГ 26 врача</div>
                            <div class="vc-graph__day-count" data-name="flg">ФЛГ 49 врача</div>
                            <div class="vc-graph__day-count" data-name="den">ДЕН 63 врача</div>
                        </div>
                    </div>
                    <div class="vc-graph__doctors-day">
                        <div class="vc-graph__doctors-day-title">5 пт</div>
                        <div class="vc-graph__doctors-count">
                            <div class="vc-graph__day-count" data-name="rg">РГ 97 врача</div>
                            <div class="vc-graph__day-count" data-name="ct">КТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mrt">МРТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mmg">ММГ 26 врача</div>
                            <div class="vc-graph__day-count" data-name="flg">ФЛГ 49 врача</div>
                            <div class="vc-graph__day-count" data-name="den">ДЕН 63 врача</div>
                        </div>
                    </div>
                    <div class="vc-graph__doctors-day">
                        <div class="vc-graph__doctors-day-title">6 сб</div>
                        <div class="vc-graph__doctors-count">
                            <div class="vc-graph__day-count" data-name="rg">РГ 97 врача</div>
                            <div class="vc-graph__day-count" data-name="ct">КТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mrt">МРТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mmg">ММГ 26 врача</div>
                            <div class="vc-graph__day-count" data-name="flg">ФЛГ 49 врача</div>
                            <div class="vc-graph__day-count" data-name="den">ДЕН 63 врача</div>
                        </div>
                    </div>
                    <div class="vc-graph__doctors-day">
                        <div class="vc-graph__doctors-day-title">7 вс</div>
                        <div class="vc-graph__doctors-count">
                            <div class="vc-graph__day-count" data-name="rg">РГ 97 врача</div>
                            <div class="vc-graph__day-count" data-name="ct">КТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mrt">МРТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mmg">ММГ 26 врача</div>
                            <div class="vc-graph__day-count" data-name="flg">ФЛГ 49 врача</div>
                            <div class="vc-graph__day-count" data-name="den">ДЕН 63 врача</div>
                        </div>
                    </div>
                    <div class="vc-graph__doctors-day">
                        <div class="vc-graph__doctors-day-title">8 пн</div>
                        <div class="vc-graph__doctors-count">
                            <div class="vc-graph__day-count" data-name="rg">РГ 97 врача</div>
                            <div class="vc-graph__day-count" data-name="ct">КТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mrt">МРТ 24 врача</div>
                            <div class="vc-graph__day-count" data-name="mmg">ММГ 26 врача</div>
                            <div class="vc-graph__day-count" data-name="flg">ФЛГ 49 врача</div>
                            <div class="vc-graph__day-count" data-name="den">ДЕН 63 врача</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="vc-alert">
        <div class="vc-alert__info">
            <div class="vc-alert__icon">
                <?= file_get_contents('../assets/img/alert/ring.svg'); ?>
            </div>
            <div class="vc-alert__main">
                <div class="vc-alert__text">
                    Специалист:  <b>Константиновский Петр Васильевич</b>
                </div>
                <div class="vc-alert__text">
                    Обстоятельство: отпуск за свой счет, 2 февраля - 4 февраля
                </div>
            </div>
            <div class="vc-alert__confirmation">
                <div class="vc-alert__confirmation-text">
                    Утвердить ?
                </div>
                <div class="vc-alert__confirtation">
                    <?= file_get_contents('../assets/img/alert/confirm.svg'); ?>
                    <?= file_get_contents('../assets/img/alert/disconfirm.svg'); ?>
                </div>
            </div>
        </div>
        <div class="vc-alert__arrows">
            <div class="vc-alert__arrow  vc-alert__arrow--disabled">
                <?= file_get_contents('../assets/img/alert/arrow-left.svg'); ?>
            </div>
            <div class="vc-alert__arrow">
                <?= file_get_contents('../assets/img/alert/arrow-right.svg'); ?>
            </div>
        </div>
    </div>
</section>

<?php require($_SERVER['DOCUMENT_ROOT'].'/bitrix/footer.php') ?>
