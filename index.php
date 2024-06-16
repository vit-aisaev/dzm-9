<!doctype html>
<html lang="en">
<head>
    <title>Research</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/site.webmanifest">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="msapplication-TileImage" content="/mstile-144x144.png">
    <meta name="theme-color" content="#ffffff">

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
                <img src="frontend/src/img/sidebar/sidebar-logo.png" class="vc-sidebar__logo" alt="">
            </div>
            <div class="vc-sidebar__menu">
                <a href="./" class="vc-sidebar__menu-item  vc-sidebar__menu-item--selected">
                    <div class="vc-sidebar__menu-icon">
                        <?= file_get_contents('assets/img/sidebar/graph.svg'); ?>
                    </div>
                    <div class="vc-sidebar__menu-text">Прогноз</div>
                </a>
                <a href="./graph" class="vc-sidebar__menu-item">
                    <div class="vc-sidebar__menu-icon">
                        <?= file_get_contents('assets/img/sidebar/calendar.svg'); ?>
                    </div>
                    <div class="vc-sidebar__menu-text">График</div>
                </a>
                <a href="./doctors" class="vc-sidebar__menu-item">
                    <div class="vc-sidebar__menu-icon">
                        <?= file_get_contents('assets/img/sidebar/doctors.svg'); ?>
                    </div>
                    <div class="vc-sidebar__menu-text">Врачи</div>
                </a>
                <a href="#" class="vc-sidebar__menu-item">
                    <div class="vc-sidebar__menu-icon">
                        <?= file_get_contents('assets/img/sidebar/table.svg'); ?>
                    </div>
                    <div class="vc-sidebar__menu-text">Табель</div>
                </a>
            </div>
        </div>
        <section class="vc-prediction">
            <div class="vc-header">
                <div class="vc-header__title">Выбрать план</div>
                <div class="vc-header__select">
                    <div class="vc-search__select">
                        <input type="hidden" class="vc-search__select-input" name="month">
                        <div class="vc-search__select-container">
                            <div class="vc-search__select-header">
                                <div class="vc-search__select-title">
                                    Январь для проверки
                                </div>
                                <div class="vc-search__select-arrow">
                                    <?= file_get_contents('assets/img/search/arrow.svg'); ?>
                                </div>
                            </div>
                            <div class="vc-search__select-list">
                                <div class="vc-search__select-item"  data-id="1">Январь для проверки</div>
                                <div class="vc-search__select-item"  data-id="2">Январь прогнозный</div>
                                <div class="vc-search__select-item"  data-id="3">Февраль прогнозный</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="vc-header__avatar">
                    <img src="assets/img/header/avatar.png" alt="" class="vc-header__avatar-img">
                </div>
            </div>
            <div class="vc-prediction__content">
                <div class="vc-center">
                    <div class="vc-table">
                        <table>
                        <div class="vc-table__caption">
                            <div class="vc-table__caption-title">Количество исследований</div>
                            <div class="vc-table__caption-info">
                                <div class="vc-table__icon vc-table__icon--def">12%</div>
                                <div class="vc-table__icon vc-table__icon--prof">6%</div>
                                <div class="vc-table__caption-info-text">отношение прогноза к факту в %</div>
                            </div>
                        </div>
                        <thead>
                        <tr>
                            <th scope="">№ недели</th>
                            <th scope="col">Денситометрия</th>
                            <th scope="col">КТ</th>
                            <th scope="col">КТ с КУ 1 зона</th>
                            <th scope="col">КТ с КУ 2 и более зон</th>
                            <th scope="col">ММГ</th>
                            <th scope="col">МРТ</th>
                            <th scope="col">МРТ с КУ 1 зона</th>
                            <th scope="col">МРТ с КУ 2 и более зон</th>
                            <th scope="col">РГ</th>
                            <th scope="col">ФЛГ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>1</th>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">1970</div>
                                <div class="vc-table__icon  vc-table__icon--def">12%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">4437</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">508</div>
                                <div class="vc-table__icon  vc-table__icon--prof">7%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">541</div>
                                <div class="vc-table__icon  vc-table__icon--def">14%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">19061</div>
                                <div class="vc-table__icon  vc-table__icon--prof">4%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">1675</div>
                                <div class="vc-table__icon  vc-table__icon--prof">8%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">817</div>
                                <div class="vc-table__icon  vc-table__icon--def">12%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">14</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">67021</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">40364</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                        </tr>
                        <tr>
                            <th>2</th>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">1970</div>
                                <div class="vc-table__icon  vc-table__icon--def">12%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">4437</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">508</div>
                                <div class="vc-table__icon  vc-table__icon--prof">7%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">541</div>
                                <div class="vc-table__icon  vc-table__icon--def">14%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">19061</div>
                                <div class="vc-table__icon  vc-table__icon--prof">4%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">1675</div>
                                <div class="vc-table__icon  vc-table__icon--prof">8%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">817</div>
                                <div class="vc-table__icon  vc-table__icon--def">12%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">14</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">67021</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">40364</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                        </tr>
                        <tr>
                            <th>3</th>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">1970</div>
                                <div class="vc-table__icon  vc-table__icon--def">12%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">4437</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">508</div>
                                <div class="vc-table__icon  vc-table__icon--prof">7%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">541</div>
                                <div class="vc-table__icon  vc-table__icon--def">14%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">19061</div>
                                <div class="vc-table__icon  vc-table__icon--prof">4%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">1675</div>
                                <div class="vc-table__icon  vc-table__icon--prof">8%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">817</div>
                                <div class="vc-table__icon  vc-table__icon--def">12%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">14</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">67021</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">40364</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                        </tr>
                        <tr>
                            <th>4</th>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">1970</div>
                                <div class="vc-table__icon  vc-table__icon--def">12%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">4437</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">508</div>
                                <div class="vc-table__icon  vc-table__icon--prof">7%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">541</div>
                                <div class="vc-table__icon  vc-table__icon--def">14%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">19061</div>
                                <div class="vc-table__icon  vc-table__icon--prof">4%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">1675</div>
                                <div class="vc-table__icon  vc-table__icon--prof">8%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">817</div>
                                <div class="vc-table__icon  vc-table__icon--def">12%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">14</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">67021</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">40364</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                        </tr>
                        <tr>
                            <th>5</th>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">1970</div>
                                <div class="vc-table__icon  vc-table__icon--def">12%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">4437</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">508</div>
                                <div class="vc-table__icon  vc-table__icon--prof">7%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">541</div>
                                <div class="vc-table__icon  vc-table__icon--def">14%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">19061</div>
                                <div class="vc-table__icon  vc-table__icon--prof">4%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">1675</div>
                                <div class="vc-table__icon  vc-table__icon--prof">8%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">817</div>
                                <div class="vc-table__icon  vc-table__icon--def">12%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">14</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">67021</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                            <td class="vc-table__data">
                                <div class="vc-table__data-text">40364</div>
                                <div class="vc-table__icon  vc-table__icon--prof">5%</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
                <div class="vc-prediction__submit">
                    <a href="#" class="vc-btn">Построить график</a>
                </div>
            </div>
        </section>
    </main>
    <footer class="vc-footer">
    </footer>
</body>
<link rel="stylesheet" href="./assets/css/app.css">
<script src="./assets/js/app.js"></script>
</html>