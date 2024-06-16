<?php

require($_SERVER['DOCUMENT_ROOT'].'/bitrix/header.php');
$APPLICATION->SetTitle('Клиника');
?>

<?php $APPLICATION->IncludeComponent(
    'vit.clinic:research.forecast',
    '',
    [],
    false
); ?>

<?php require($_SERVER['DOCUMENT_ROOT'].'/bitrix/footer.php') ?>
