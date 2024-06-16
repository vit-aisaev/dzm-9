<?php

if (!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) {
    die();
}
$this->setFrameMode(true);
?>

<div class="vc-sidebar__menu">
    <?php foreach ($arResult as $arItem): ?>
        <a href="<?= $arItem['LINK']; ?>" class="vc-sidebar__menu-item<?php if ($arItem['SELECTED']) { echo '  vc-sidebar__menu-item--selected'; } ?>">
            <div class="vc-sidebar__menu-icon">
                <?= $arItem['PARAMS']['ICON']; ?>
            </div>
            <div class="vc-sidebar__menu-text">
                <?= $arItem['TEXT']; ?>
            </div>
        </a>
    <?php endforeach; ?>
</div>