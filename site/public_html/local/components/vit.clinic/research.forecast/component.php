<?php

if (!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) {
    die();
}

try {
    $connection = new PDO('pgsql:host='.SCHEDULER_DB_HOST.';dbname='.SCHEDULER_DB_NAME, SCHEDULER_DB_USER, SCHEDULER_DB_PASS);

    $version = 'validation';
    $year = 2024;
    $weekNumStart = 1;
    $weekNumEnd = 5;

    $res = $connection->query("
    SELECT *
    FROM   roentgen.work_plan_summary
    WHERE  year = $year
           AND week >= $weekNumStart
           AND week <= $weekNumEnd
    ORDER  BY week ASC
    ", PDO::FETCH_ASSOC);
    while ($el = $res->fetch()) {
        $arResult['WEEKS'][$el['week']][$el['modality'].$el['contrast_enhancement']]['FORECAST'] = $el['amount'];
    }

    $res = $connection->query("
    SELECT *
    FROM   roentgen.work_summary
    WHERE  year = $year
           AND week >= $weekNumStart
           AND week <= $weekNumEnd
    ORDER  BY week ASC
    ", PDO::FETCH_ASSOC);
    while ($el = $res->fetch()) {
        $arResult['WEEKS'][$el['week']][$el['modality'].$el['contrast_enhancement']]['FACT'] = $el['amount'];
    }

    foreach ($arResult['WEEKS'] as $week => $arResearchAmountGroups) {
        foreach ($arResearchAmountGroups as $modalityEnchancement => $arAmount) {
            if ($arAmount['FACT']) {
                if ($arAmount['FORECAST'] > $arAmount['FACT']) {
                    $arResult['WEEKS'][$week][$modalityEnchancement]['PERCENT_RATIO'] = ($arAmount['FORECAST'] / $arAmount['FACT']);
                } else {
                    $arResult['WEEKS'][$week][$modalityEnchancement]['PERCENT_RATIO'] = -($arAmount['FACT'] / $arAmount['FORECAST']);
                }
            }
        }
    }
} catch (PDOException $e) {

}

$this->IncludeComponentTemplate();