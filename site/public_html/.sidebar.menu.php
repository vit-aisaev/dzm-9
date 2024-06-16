<?php

$aMenuLinks = [
    [
        'Прогноз',
        SITE_DIR.'',
        [],
        ['ICON' => file_get_contents($_SERVER['DOCUMENT_ROOT'].SITE_TEMPLATE_PATH.'/assets/img/sidebar/graph.svg')],
        ''
    ],
    [
        'График',
        SITE_DIR.'graph/',
        [],
        ['ICON' => file_get_contents($_SERVER['DOCUMENT_ROOT'].SITE_TEMPLATE_PATH.'/assets/img/sidebar/calendar.svg')],
        ''
    ],
    [
        'Врачи',
        SITE_DIR.'doctors/',
        [],
        ['ICON' => file_get_contents($_SERVER['DOCUMENT_ROOT'].SITE_TEMPLATE_PATH.'/assets/img/sidebar/doctors.svg')],
        ''
    ],
    // [
    //     'Табель',
    //     SITE_DIR.'#',
    //     [],
    //     ['ICON' => file_get_contents($_SERVER['DOCUMENT_ROOT'].SITE_TEMPLATE_PATH.'/assets/img/sidebar/table.svg')],
    //     ''
    // ],
];
