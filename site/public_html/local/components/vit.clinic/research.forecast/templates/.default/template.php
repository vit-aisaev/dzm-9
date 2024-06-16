<?php

if (!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) {
    die();
}

use Bitrix\Main\Localization\Loc;
?>

<section class="vc-prediction">
    <div class="vc-header">
        <div class="vc-header__title"><?= Loc::getMessage('VC_SELECT_PLAN'); ?></div>
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
            <img src="<?= SITE_TEMPLATE_PATH.'/assets/img/header/avatar.png'; ?>" alt="" class="vc-header__avatar-img">
        </div>
    </div>
    <div class="vc-prediction__content">
        <div class="vc-center">
            <div class="vc-table">
                <table>
                <div class="vc-table__caption">
                    <div class="vc-table__caption-title"><?= Loc::getMessage('VC_RESEARCH'); ?></div>
                    <div class="vc-table__caption-info">
                        <div class="vc-table__icon vc-table__icon--def">12%</div>
                        <div class="vc-table__icon vc-table__icon--prof">6%</div>
                        <div class="vc-table__caption-info-text">отношение прогноза к факту в %</div>
                    </div>
                </div>
                <thead>
                <tr>
                    <th scope=""><?= Loc::getMessage('VC_WEEK'); ?></th>
                    <th scope="col"><?= Loc::getMessage('VC_DESN_NONE'); ?></th>
                    <th scope="col"><?= Loc::getMessage('VC_KT_NONE'); ?></th>
                    <th scope="col"><?= Loc::getMessage('VC_KT_CE1'); ?></th>
                    <th scope="col"><?= Loc::getMessage('VC_KT_CE2'); ?></th>
                    <th scope="col"><?= Loc::getMessage('VC_MMG_NONE'); ?></th>
                    <th scope="col"><?= Loc::getMessage('VC_MRT_NONE'); ?></th>
                    <th scope="col"><?= Loc::getMessage('VC_MRT_CE1'); ?></th>
                    <th scope="col"><?= Loc::getMessage('VC_MRT_CE2'); ?></th>
                    <th scope="col"><?= Loc::getMessage('VC_RG_NONE'); ?></th>
                    <th scope="col"><?= Loc::getMessage('VC_FLG_NONE'); ?></th>
                </tr>
                </thead>
                <tbody>
                    <?php foreach ($arResult['WEEKS'] as $week => $arResearchAmountGroups): ?>
                        <tr>
                            <th>
                                <?= $week; ?>
                            </th>
                            <?php foreach ($arResearchAmountGroups as $arAmount): ?>
                                <td class="vc-table__data">
                                    <div class="vc-table__data-text">
                                        <?= $arAmount['FORECAST']; ?>
                                    </div>
                                    <?php if ($arAmount['PERCENT_RATIO']): ?>
                                        <div class="vc-table__icon<?php if ($arAmount['PERCENT_RATIO'] < 0) { echo '  vc-table__icon--def'; } else { echo '  vc-table__icon--prof'; } ?>">
                                            <?= abs(round($arAmount['PERCENT_RATIO'])).'%'; ?>
                                        </div>
                                    <?php endif; ?>
                                </td>
                            <?php endforeach; ?>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            </div>
        </div>
        <div class="vc-prediction__submit">
            <a href="#" class="vc-btn">Построить график</a>
        </div>
    </div>
</section>