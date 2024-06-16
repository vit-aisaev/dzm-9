<?php

require($_SERVER['DOCUMENT_ROOT'].'/bitrix/header.php');
$APPLICATION->SetTitle('Клиника');
?>

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

<?php require($_SERVER['DOCUMENT_ROOT'].'/bitrix/footer.php') ?>
