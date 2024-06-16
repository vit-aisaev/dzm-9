<?php

if (!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) {
    die();
}

$connection = new PDO('pgsql:host='.SCHEDULER_DB_HOST.';dbname='.SCHEDULER_DB_NAME, SCHEDULER_DB_USER, SCHEDULER_DB_PASS);

$sql = '
SELECT *
FROM work_plan_summary';

foreach ($conn->query($sql) as $row) {
    $arResult[] = $row;
}