<?php

if (!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) {
	die();
}

use Bitrix\Main\Page\Asset;
?>

<!DOCTYPE html>
<html>
	<head>
		<title><?php $APPLICATION->ShowTitle(); ?></title>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="msapplication-TileColor" content="#da532c">
		<meta name="theme-color" content="#ffffff">

        <link rel="apple-touch-icon" sizes="180x180" href="<?= SITE_DIR.'apple-touch-icon.png'; ?>">
        <link rel="icon" type="image/png" sizes="32x32" href="<?= SITE_DIR.'favicon-32x32.png'; ?>">
        <link rel="icon" type="image/png" sizes="16x16" href="<?= SITE_DIR.'favicon-16x16.png'; ?>">
        <link rel="manifest" href="<?= SITE_DIR.'site.webmanifest'; ?>">
        <link rel="mask-icon" href="<?= SITE_DIR.'safari-pinned-tab.svg'; ?>" color="#5bbad5">

        <style>
            :root {
                --vc-primary: #AB4452;
                --vc-black: #212121;
                --vc-white: #ffffff;
                --vc-blue-dark: #2B4460FF;
                --vc-transparent: rgba(0, 0, 0, 0);
            }
        </style>

        <?php
        Asset::getInstance()->addCss(SITE_TEMPLATE_PATH.'/assets/css/app.css');
        Asset::getInstance()->addJs(SITE_TEMPLATE_PATH.'/assets/js/app.js');
        $APPLICATION->ShowHead();
		?>
    </head>
    <body>
        <main class="vc-main">
            <div class="vc-sidebar">
                <div class="vc-sidebar__header">
                    <img src="<?= SITE_TEMPLATE_PATH.'/assets/img/sidebar/sidebar-logo.png'; ?>" class="vc-sidebar__logo" alt="">
                </div>
                <?php $APPLICATION->IncludeComponent('bitrix:menu', 'vc-sidebar', [
                    'ALLOW_MULTI_SELECT' => 'N',
                    'CHILD_MENU_TYPE' => '',
                    'DELAY' => 'N',
                    'MAX_LEVEL' => '1',
                    'MENU_CACHE_GET_VARS' => [],
                    'MENU_CACHE_TIME' => '3600',
                    'MENU_CACHE_TYPE' => 'A',
                    'MENU_CACHE_USE_GROUPS' => 'Y',
                    'ROOT_MENU_TYPE' => 'sidebar',
                    'USE_EXT' => 'N'
                ]); ?>
            </div>

