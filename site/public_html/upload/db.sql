-- Adminer 4.8.1 MySQL 5.7.44 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `b_admin_notify`;
CREATE TABLE `b_admin_notify` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_admin_notify_lang`;
CREATE TABLE `b_admin_notify_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_agent`;
CREATE TABLE `b_agent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(11) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(11) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RETRY_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`),
  KEY `ix_agent_name` (`NAME`(100)),
  KEY `ix_agent_act_period_next_exec` (`ACTIVE`,`IS_PERIOD`,`NEXT_EXEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`, `RETRY_COUNT`) VALUES
(1,	'main',	100,	'\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();',	'Y',	'2024-06-16 15:11:03',	'2024-06-16 15:12:03',	NULL,	60,	'N',	NULL,	'N',	0),
(2,	'main',	100,	'CCaptchaAgent::DeleteOldCaptcha(3600);',	'Y',	'2024-06-16 14:30:14',	'2024-06-16 15:30:14',	NULL,	3600,	'N',	NULL,	'N',	0),
(3,	'main',	100,	'CSiteCheckerTest::CommonTest();',	'Y',	NULL,	'2024-06-17 03:00:00',	NULL,	86400,	'N',	NULL,	'N',	NULL),
(4,	'main',	100,	'CEvent::CleanUpAgent();',	'Y',	NULL,	'2024-06-17 03:10:00',	NULL,	86400,	'N',	NULL,	'N',	NULL),
(5,	'main',	100,	'CUser::CleanUpHitAuthAgent();',	'Y',	NULL,	'2024-06-17 03:15:00',	NULL,	86400,	'N',	NULL,	'N',	NULL),
(6,	'main',	100,	'CUndo::CleanUpOld();',	'Y',	NULL,	'2024-06-17 03:20:00',	NULL,	86400,	'N',	NULL,	'N',	NULL),
(7,	'main',	100,	'CUserCounter::DeleteOld();',	'Y',	NULL,	'2024-06-17 03:25:00',	NULL,	86400,	'N',	NULL,	'N',	NULL),
(8,	'main',	100,	'\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable::deleteOldAgent();',	'Y',	NULL,	'2024-06-17 03:30:00',	NULL,	86400,	'N',	NULL,	'N',	NULL),
(9,	'main',	100,	'CUser::AuthActionsCleanUpAgent();',	'Y',	NULL,	'2024-06-17 04:15:00',	NULL,	86400,	'N',	NULL,	'N',	NULL),
(10,	'main',	100,	'CUser::CleanUpAgent();',	'Y',	NULL,	'2024-06-17 04:20:00',	NULL,	86400,	'N',	NULL,	'N',	NULL),
(11,	'main',	100,	'CUser::DeactivateAgent();',	'Y',	NULL,	'2024-06-17 04:25:00',	NULL,	86400,	'N',	NULL,	'N',	NULL),
(12,	'main',	100,	'CEventLog::CleanUpAgent();',	'Y',	NULL,	'2024-06-17 04:30:00',	NULL,	86400,	'N',	NULL,	'N',	NULL),
(14,	'clouds',	100,	'CCloudStorage::CleanUp();',	'Y',	'2024-06-16 13:28:47',	'2024-06-17 13:28:47',	NULL,	86400,	'N',	NULL,	'N',	0),
(15,	'landing',	100,	'Bitrix\\Landing\\Agent::clearRecycle();',	'Y',	'2024-06-16 13:28:47',	'2024-06-16 15:28:47',	NULL,	7200,	'N',	NULL,	'N',	0),
(16,	'landing',	100,	'Bitrix\\Landing\\Agent::clearFiles(30);',	'Y',	'2024-06-16 14:30:14',	'2024-06-16 15:30:14',	NULL,	3600,	'N',	NULL,	'N',	0),
(17,	'landing',	100,	'Bitrix\\Landing\\Agent::sendRestStatistic();',	'Y',	'2024-06-16 13:28:47',	'2024-06-17 13:28:47',	NULL,	86400,	'N',	NULL,	'N',	0),
(18,	'landing',	100,	'Bitrix\\Landing\\Agent::clearTempFiles();',	'Y',	'2024-06-16 13:28:47',	'2024-06-17 13:28:47',	NULL,	86400,	'N',	NULL,	'N',	0),
(19,	'location',	100,	'\\Bitrix\\Location\\Infrastructure\\DataInstaller::installAreasAgent();',	'Y',	NULL,	'2024-06-16 16:27:49',	NULL,	2,	'N',	NULL,	'N',	NULL),
(20,	'location',	100,	'\\Bitrix\\Location\\Source\\Osm\\Configurer::configure();',	'Y',	NULL,	'2024-06-16 16:27:49',	NULL,	2,	'N',	NULL,	'N',	NULL),
(21,	'messageservice',	100,	'\\Bitrix\\MessageService\\Queue::cleanUpAgent();',	'Y',	'2024-06-16 13:28:47',	'2024-06-17 00:00:00',	NULL,	86400,	'Y',	NULL,	'N',	0),
(22,	'messageservice',	100,	'\\Bitrix\\MessageService\\IncomingMessage::cleanUpAgent();',	'Y',	'2024-06-16 13:28:47',	'2024-06-17 00:00:00',	NULL,	86400,	'Y',	NULL,	'N',	0),
(23,	'rest',	100,	'Bitrix\\Rest\\Marketplace\\Client::getNumUpdates();',	'Y',	'2024-06-16 13:28:47',	'2024-06-17 13:28:47',	NULL,	86400,	'N',	NULL,	'N',	0),
(24,	'rest',	100,	'\\Bitrix\\Rest\\EventOfflineTable::cleanProcessAgent();',	'Y',	'2024-06-16 13:28:47',	'2024-06-17 13:28:47',	NULL,	86400,	'N',	NULL,	'N',	0),
(25,	'rest',	100,	'\\Bitrix\\Rest\\LogTable::cleanUpAgent();',	'Y',	'2024-06-16 13:28:47',	'2024-06-17 13:28:47',	NULL,	86400,	'N',	NULL,	'N',	0),
(26,	'rest',	100,	'\\Bitrix\\Rest\\Configuration\\Helper::sendStatisticAgent();',	'Y',	'2024-06-16 13:28:47',	'2024-06-17 13:28:47',	NULL,	86400,	'N',	NULL,	'N',	0),
(27,	'rest',	100,	'\\Bitrix\\Rest\\UsageStatTable::sendAgent();',	'Y',	'2024-06-16 14:30:14',	'2024-06-16 15:30:14',	NULL,	3600,	'N',	NULL,	'N',	0),
(28,	'rest',	100,	'\\Bitrix\\Rest\\UsageStatTable::cleanUpAgent();',	'Y',	'2024-06-16 14:30:14',	'2024-06-16 15:30:14',	NULL,	3600,	'N',	NULL,	'N',	0),
(29,	'rest',	100,	'\\Bitrix\\Rest\\Marketplace\\Notification::checkAgent();',	'Y',	'2024-06-16 13:28:47',	'2024-06-17 13:28:47',	NULL,	86400,	'N',	NULL,	'N',	0),
(30,	'rest',	100,	'\\Bitrix\\Rest\\Marketplace\\Immune::load();',	'Y',	'2024-06-16 13:28:48',	'2024-06-17 13:28:48',	NULL,	86400,	'N',	NULL,	'N',	0),
(31,	'rest',	100,	'\\Bitrix\\Rest\\Configuration\\Structure::clearContentAgent();',	'Y',	'2024-06-16 13:28:48',	'2024-06-17 13:28:48',	NULL,	86400,	'N',	NULL,	'N',	0),
(32,	'rest',	100,	'\\Bitrix\\Rest\\Helper::recoveryAgents();',	'Y',	'2024-06-16 13:28:48',	'2024-06-23 13:28:48',	NULL,	604800,	'N',	NULL,	'N',	0),
(33,	'search',	10,	'CSearchSuggest::CleanUpAgent();',	'Y',	'2024-06-16 13:28:48',	'2024-06-17 13:28:48',	NULL,	86400,	'N',	NULL,	'N',	0),
(34,	'search',	10,	'CSearchStatistic::CleanUpAgent();',	'Y',	'2024-06-16 13:28:48',	'2024-06-17 13:28:48',	NULL,	86400,	'N',	NULL,	'N',	0),
(35,	'seo',	100,	'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();',	'Y',	'2024-06-16 14:30:15',	'2024-06-16 15:30:15',	NULL,	3600,	'N',	NULL,	'N',	0),
(36,	'seo',	100,	'Bitrix\\Seo\\Adv\\LogTable::clean();',	'Y',	'2024-06-16 13:28:48',	'2024-06-17 13:28:48',	NULL,	86400,	'N',	NULL,	'N',	0),
(37,	'seo',	100,	'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();',	'Y',	'2024-06-16 14:30:15',	'2024-06-16 15:30:15',	NULL,	3600,	'N',	NULL,	'N',	0),
(38,	'ui',	100,	'\\Bitrix\\UI\\FileUploader\\TempFileAgent::clearOldRecords();',	'Y',	'2024-06-16 14:53:42',	'2024-06-16 15:23:42',	NULL,	1800,	'N',	NULL,	'N',	0);

DROP TABLE IF EXISTS `b_app_password`;
CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_b24connector_buttons`;
CREATE TABLE `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_b24connector_button_site`;
CREATE TABLE `b_b24connector_button_site` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUTTON_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BUTTON_ID` (`BUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_bitrixcloud_option`;
CREATE TABLE `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_bitrixcloud_option` (`ID`, `NAME`, `SORT`, `PARAM_KEY`, `PARAM_VALUE`) VALUES
(1,	'backup_quota',	0,	'0',	'0'),
(2,	'backup_total_size',	0,	'0',	'0'),
(3,	'backup_last_backup_time',	0,	'0',	'1718544532'),
(4,	'monitoring_expire_time',	0,	'0',	'1718546335');

DROP TABLE IF EXISTS `b_cache_tag`;
CREATE TABLE `b_cache_tag` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_cache_tag` (`ID`, `SITE_ID`, `CACHE_SALT`, `RELATIVE_PATH`, `TAG`) VALUES
(2,	NULL,	NULL,	'0:1718547000',	'**'),
(8,	's1',	'/e25',	'/s1/bitrix/menu/06f',	'bitrix:menu');

DROP TABLE IF EXISTS `b_captcha`;
CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_checklist`;
CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_clouds_copy_queue`;
CREATE TABLE `b_clouds_copy_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `OP` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SOURCE_BUCKET_ID` int(11) NOT NULL,
  `SOURCE_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `TARGET_BUCKET_ID` int(11) NOT NULL,
  `TARGET_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) NOT NULL DEFAULT '-1',
  `FILE_POS` int(11) NOT NULL DEFAULT '0',
  `FAIL_COUNTER` int(11) NOT NULL DEFAULT '0',
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ERROR_MESSAGE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_clouds_delete_queue`;
CREATE TABLE `b_clouds_delete_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `BUCKET_ID` int(11) NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_clouds_delete_queue_1` (`BUCKET_ID`,`FILE_PATH`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_clouds_file_bucket`;
CREATE TABLE `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` double DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci,
  `FAILOVER_ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_BUCKET_ID` int(11) DEFAULT NULL,
  `FAILOVER_COPY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE_DELAY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_clouds_file_hash`;
CREATE TABLE `b_clouds_file_hash` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `BUCKET_ID` int(11) NOT NULL,
  `FILE_PATH` varchar(760) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `FILE_MTIME` datetime DEFAULT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_clouds_file_hash` (`BUCKET_ID`,`FILE_PATH`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_clouds_file_resize`;
CREATE TABLE `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_clouds_file_save`;
CREATE TABLE `b_clouds_file_save` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `BUCKET_ID` int(11) NOT NULL,
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_clouds_file_upload`;
CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_component_params`;
CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_composite_log`;
CREATE TABLE `b_composite_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `AJAX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `PAGE_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_composite_page`;
CREATE TABLE `b_composite_page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CACHE_KEY` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int(11) NOT NULL DEFAULT '0',
  `REWRITES` int(11) NOT NULL DEFAULT '0',
  `SIZE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_consent_agreement`;
CREATE TABLE `b_consent_agreement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_URL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_AGREEMENT_TEXT_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_consent_field`;
CREATE TABLE `b_consent_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_consent_user_consent`;
CREATE TABLE `b_consent_user_consent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`),
  KEY `IX_CONSENT_USER_CONSENT_USER_ORIGIN` (`USER_ID`,`ORIGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_consent_user_consent_item`;
CREATE TABLE `b_consent_user_consent_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_CONSENT_ID` int(11) NOT NULL,
  `VALUE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_ITEM_AG_ID` (`USER_CONSENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_counter_data`;
CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_culture`;
CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT '1',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHORT_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'n/j/Y',
  `MEDIUM_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j, Y',
  `LONG_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j, Y',
  `FULL_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j, Y',
  `DAY_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j',
  `DAY_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j',
  `DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j',
  `SHORT_DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, F j',
  `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, M j',
  `SHORT_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i a',
  `LONG_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i:s a',
  `AM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'am',
  `PM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pm',
  `NUMBER_THOUSANDS_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `NUMBER_DECIMAL_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `NUMBER_DECIMALS` tinyint(4) DEFAULT '2',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `SHORT_DATE_FORMAT`, `MEDIUM_DATE_FORMAT`, `LONG_DATE_FORMAT`, `FULL_DATE_FORMAT`, `DAY_MONTH_FORMAT`, `DAY_SHORT_MONTH_FORMAT`, `DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT`, `SHORT_TIME_FORMAT`, `LONG_TIME_FORMAT`, `AM_VALUE`, `PM_VALUE`, `NUMBER_THOUSANDS_SEPARATOR`, `NUMBER_DECIMAL_SEPARATOR`, `NUMBER_DECIMALS`) VALUES
(1,	'ru',	'ru',	'DD.MM.YYYY',	'DD.MM.YYYY HH:MI:SS',	'#NAME# #LAST_NAME#',	1,	'UTF-8',	'Y',	'd.m.Y',	'j M Y',	'j F Y',	'l, j F Y',	'j F',	'j M',	'l, j F',	'D, j F',	'D, j M',	'H:i',	'H:i:s',	'am',	'pm',	' ',	',',	2),
(2,	'en',	'en',	'MM/DD/YYYY',	'MM/DD/YYYY H:MI:SS T',	'#NAME# #LAST_NAME#',	0,	'UTF-8',	'Y',	'n/j/Y',	'M j, Y',	'F j, Y',	'l, F j, Y',	'F j',	'M j',	'l, F j',	'D, F j',	'D, M j',	'g:i a',	'g:i:s a',	'am',	'pm',	',',	'.',	2);

DROP TABLE IF EXISTS `b_entity_usage`;
CREATE TABLE `b_entity_usage` (
  `USER_ID` int(11) NOT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID_INT` int(11) NOT NULL DEFAULT '0',
  `PREFIX` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LAST_USE_DATE` datetime NOT NULL,
  PRIMARY KEY (`USER_ID`,`CONTEXT`,`ENTITY_ID`,`ITEM_ID`),
  KEY `IX_ENTITY_USAGE_ITEM_ID_INT` (`ITEM_ID_INT`),
  KEY `IX_ENTITY_USAGE_LAST_USE_DATE` (`LAST_USE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_event`;
CREATE TABLE `b_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(11) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_event_attachment`;
CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_event_log`;
CREATE TABLE `b_event_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  KEY `ix_b_event_log_audit_type_time` (`AUDIT_TYPE_ID`,`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_event_message`;
CREATE TABLE `b_event_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `MESSAGE_PHP`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`, `SITE_TEMPLATE_ID`, `ADDITIONAL_FIELD`, `LANGUAGE_ID`) VALUES
(1,	'2024-06-16 16:27:30',	'NEW_USER',	's1',	'Y',	'#DEFAULT_EMAIL_FROM#',	'#DEFAULT_EMAIL_FROM#',	'#SITE_NAME#: Зарегистрировался новый пользователь',	'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.',	'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.',	'text',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ru'),
(2,	'2024-06-16 16:27:30',	'USER_INFO',	's1',	'Y',	'#DEFAULT_EMAIL_FROM#',	'#EMAIL#',	'#SITE_NAME#: Регистрационная информация',	'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.',	'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.',	'text',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ru'),
(3,	'2024-06-16 16:27:30',	'USER_PASS_REQUEST',	's1',	'Y',	'#DEFAULT_EMAIL_FROM#',	'#EMAIL#',	'#SITE_NAME#: Запрос на смену пароля',	'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.',	'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.',	'text',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ru'),
(4,	'2024-06-16 16:27:30',	'USER_PASS_CHANGED',	's1',	'Y',	'#DEFAULT_EMAIL_FROM#',	'#EMAIL#',	'#SITE_NAME#: Подтверждение смены пароля',	'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.',	'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.',	'text',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ru'),
(5,	'2024-06-16 16:27:30',	'NEW_USER_CONFIRM',	's1',	'Y',	'#DEFAULT_EMAIL_FROM#',	'#EMAIL#',	'#SITE_NAME#: Подтверждение регистрации нового пользователя',	'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.',	'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.',	'text',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ru'),
(6,	'2024-06-16 16:27:30',	'USER_INVITE',	's1',	'Y',	'#DEFAULT_EMAIL_FROM#',	'#EMAIL#',	'#SITE_NAME#: Приглашение на сайт',	'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n',	'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n',	'text',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ru'),
(7,	'2024-06-16 16:27:30',	'FEEDBACK_FORM',	's1',	'Y',	'#DEFAULT_EMAIL_FROM#',	'#EMAIL_TO#',	'#SITE_NAME#: Сообщение из формы обратной связи',	'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.',	'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.',	'text',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ru'),
(8,	'2024-06-16 16:27:30',	'MAIN_MAIL_CONFIRM_CODE',	's1',	'Y',	'#DEFAULT_EMAIL_FROM#',	'#EMAIL_TO#',	'#MESSAGE_SUBJECT#',	'<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>',	'<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>',	'html',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'mail_join',	NULL,	NULL),
(9,	'2024-06-16 16:27:30',	'EVENT_LOG_NOTIFICATION',	's1',	'Y',	'#DEFAULT_EMAIL_FROM#',	'#EMAIL#',	'Оповещение журнала событий: #NAME#',	'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: #AUDIT_TYPE_ID#\nОбъект: #ITEM_ID#\nПользователь: #USER_ID# \nIP-адрес: #REMOTE_ADDR#\nБраузер: #USER_AGENT#\nСтраница: #REQUEST_URI# \n\nКоличество записей: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nПерейти в журнал событий:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#',	'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: <?=$arParams[\"AUDIT_TYPE_ID\"];?>\n\nОбъект: <?=$arParams[\"ITEM_ID\"];?>\n\nПользователь: <?=$arParams[\"USER_ID\"];?> \nIP-адрес: <?=$arParams[\"REMOTE_ADDR\"];?>\n\nБраузер: <?=$arParams[\"USER_AGENT\"];?>\n\nСтраница: <?=$arParams[\"REQUEST_URI\"];?> \n\nКоличество записей: <?=$arParams[\"EVENT_COUNT\"];?> \n\n<?=$arParams[\"ADDITIONAL_TEXT\"];?>\n\n\nПерейти в журнал событий:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams[\"AUDIT_TYPE_ID\"];?>',	'text',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ru'),
(10,	'2024-06-16 16:27:30',	'USER_CODE_REQUEST',	's1',	'Y',	'#DEFAULT_EMAIL_FROM#',	'#EMAIL#',	'#SITE_NAME#: Запрос кода авторизации',	'Используйте для авторизации код:\n\n#CHECKWORD#\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nЛогин: #LOGIN#\n\nСообщение создано автоматически.',	'Используйте для авторизации код:\n\n<?=$arParams[\"CHECKWORD\"];?>\n\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nЛогин: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение создано автоматически.',	'text',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ru'),
(11,	'2024-06-16 16:27:30',	'NEW_DEVICE_LOGIN',	's1',	'Y',	'#DEFAULT_EMAIL_FROM#',	'#EMAIL#',	'Вход с нового устройства',	'Здравствуйте, #NAME#,\n\nНовое устройство авторизовалось под вашим логином #LOGIN#.\n \nУстройство: #DEVICE# \nБраузер: #BROWSER#\nПлатформа: #PLATFORM#\nМестоположение: #LOCATION# (может быть неточным)\nДата: #DATE#\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n',	'Здравствуйте, <?=$arParams[\"NAME\"];?>,\n\nНовое устройство авторизовалось под вашим логином <?=$arParams[\"LOGIN\"];?>.\n \nУстройство: <?=$arParams[\"DEVICE\"];?> \nБраузер: <?=$arParams[\"BROWSER\"];?>\n\nПлатформа: <?=$arParams[\"PLATFORM\"];?>\n\nМестоположение: <?=$arParams[\"LOCATION\"];?> (может быть неточным)\nДата: <?=$arParams[\"DATE\"];?>\n\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n',	'text',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'ru');

DROP TABLE IF EXISTS `b_event_message_attachment`;
CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_event_message_site`;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
(1,	's1'),
(2,	's1'),
(3,	's1'),
(4,	's1'),
(5,	's1'),
(6,	's1'),
(7,	's1'),
(8,	's1'),
(9,	's1'),
(10,	's1'),
(11,	's1');

DROP TABLE IF EXISTS `b_event_type`;
CREATE TABLE `b_event_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(11) NOT NULL DEFAULT '150',
  `EVENT_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`, `EVENT_TYPE`) VALUES
(1,	'ru',	'NEW_USER',	'Зарегистрировался новый пользователь',	'\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n',	1,	'email'),
(2,	'ru',	'USER_INFO',	'Информация о пользователе',	'\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',	2,	'email'),
(3,	'ru',	'NEW_USER_CONFIRM',	'Подтверждение регистрации нового пользователя',	'\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n',	3,	'email'),
(4,	'ru',	'USER_PASS_REQUEST',	'Запрос на смену пароля',	'\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',	4,	'email'),
(5,	'ru',	'USER_PASS_CHANGED',	'Подтверждение смены пароля',	'\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',	5,	'email'),
(6,	'ru',	'USER_INVITE',	'Приглашение на сайт нового пользователя',	'#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n',	6,	'email'),
(7,	'ru',	'FEEDBACK_FORM',	'Отправка сообщения через форму обратной связи',	'#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',	7,	'email'),
(8,	'ru',	'MAIN_MAIL_CONFIRM_CODE',	'Подтверждение email-адреса отправителя',	'\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения',	8,	'email'),
(9,	'ru',	'EVENT_LOG_NOTIFICATION',	'Оповещение журнала событий',	'#EMAIL# - Email получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей',	9,	'email'),
(10,	'ru',	'USER_CODE_REQUEST',	'Запрос кода авторизации',	'#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#LOGIN# - Логин\n#CHECKWORD# - Код для авторизации\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - Email пользователя\n',	10,	'email'),
(11,	'ru',	'NEW_DEVICE_LOGIN',	'Вход с нового устройства',	'#USER_ID# - ID пользователя\n#EMAIL# - Email пользователя\n#LOGIN# - Логин пользователя\n#NAME# - Имя пользователя\n#LAST_NAME# - Фамилия пользователя\n#DEVICE# - Устройство\n#BROWSER# - Браузер\n#PLATFORM# - Платформа\n#USER_AGENT# - User agent\n#IP# - IP-адрес\n#DATE# - Дата\n#COUNTRY# - Страна\n#REGION# - Регион\n#CITY# - Город\n#LOCATION# - Объединенные город, регион, страна\n',	11,	'email'),
(12,	'ru',	'SMS_USER_CONFIRM_NUMBER',	'Подтверждение номера телефона по СМС',	'#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n',	100,	'sms'),
(13,	'ru',	'SMS_USER_RESTORE_PASSWORD',	'Восстановление пароля через СМС',	'#USER_PHONE# - номер телефона\n#CODE# - код для восстановления\n',	100,	'sms'),
(14,	'ru',	'SMS_EVENT_LOG_NOTIFICATION',	'Оповещение журнала событий',	'#PHONE_NUMBER# - Номер телефона получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей',	100,	'sms'),
(15,	'en',	'NEW_USER',	'New user was registered',	'\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n',	1,	'email'),
(16,	'en',	'USER_INFO',	'Account Information',	'\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',	2,	'email'),
(17,	'en',	'NEW_USER_CONFIRM',	'New user registration confirmation',	'\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n',	3,	'email'),
(18,	'en',	'USER_PASS_REQUEST',	'Password Change Request',	'\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',	4,	'email'),
(19,	'en',	'USER_PASS_CHANGED',	'Password Change Confirmation',	'\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',	5,	'email'),
(20,	'en',	'USER_INVITE',	'Invitation of a new site user',	'#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n',	6,	'email'),
(21,	'en',	'FEEDBACK_FORM',	'Sending a message using a feedback form',	'#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address',	7,	'email'),
(22,	'en',	'MAIN_MAIL_CONFIRM_CODE',	'Confirm sender\'s email address',	'\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code',	8,	'email'),
(23,	'en',	'EVENT_LOG_NOTIFICATION',	'Event log notification',	'#EMAIL# - Recipient email\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events',	9,	'email'),
(24,	'en',	'USER_CODE_REQUEST',	'Request for verification code',	'#USER_ID# - user ID\n#STATUS# - Login status\n#LOGIN# - Login\n#CHECKWORD# - Verification code\n#NAME# - First name\n#LAST_NAME# - Last name\n#EMAIL# - User email\n',	10,	'email'),
(25,	'en',	'NEW_DEVICE_LOGIN',	'New device signed in',	'#USER_ID# - User ID\n#EMAIL# - User email:\n#LOGIN# - User login\n#NAME# - User first name\n#LAST_NAME# - User last name\n#DEVICE# - Device\n#BROWSER# - Browser\n#PLATFORM# - Platform\n#USER_AGENT# - User agent\n#IP# - IP address\n#DATE# - Date\n#COUNTRY# - Country\n#REGION# - Region\n#CITY# - City\n#LOCATION# - Full location (city, region, country)\n',	11,	'email'),
(26,	'en',	'SMS_USER_CONFIRM_NUMBER',	'Verify phone number using SMS',	'#USER_PHONE# - phone number\n#CODE# - confirmation code',	100,	'sms'),
(27,	'en',	'SMS_USER_RESTORE_PASSWORD',	'Recover password using SMS',	'#USER_PHONE# - phone number\n#CODE# - recovery confirmation code',	100,	'sms'),
(28,	'en',	'SMS_EVENT_LOG_NOTIFICATION',	'Event log notification',	'#PHONE_NUMBER# - Recipient phone number\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events',	100,	'sms');

DROP TABLE IF EXISTS `b_favorite`;
CREATE TABLE `b_favorite` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(11) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(11) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_file`;
CREATE TABLE `b_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_file_duplicate`;
CREATE TABLE `b_file_duplicate` (
  `DUPLICATE_ID` int(11) NOT NULL,
  `ORIGINAL_ID` int(11) NOT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT '1',
  `ORIGINAL_DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`DUPLICATE_ID`,`ORIGINAL_ID`),
  KEY `ix_file_duplicate_duplicate` (`ORIGINAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_file_hash`;
CREATE TABLE `b_file_hash` (
  `FILE_ID` int(11) NOT NULL,
  `FILE_SIZE` bigint(20) NOT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `ix_file_hash_size_hash` (`FILE_SIZE`,`FILE_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_file_preview`;
CREATE TABLE `b_file_preview` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL,
  `PREVIEW_ID` int(11) DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int(11) DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  KEY `IX_B_FILE_PL_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_file_search`;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_file_version`;
CREATE TABLE `b_file_version` (
  `ORIGINAL_ID` int(11) NOT NULL,
  `VERSION_ID` int(11) NOT NULL,
  `META` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ORIGINAL_ID`),
  UNIQUE KEY `ux_file_version_version` (`VERSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_filters`;
CREATE TABLE `b_filters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_finder_dest`;
CREATE TABLE `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_geoip_handlers`;
CREATE TABLE `b_geoip_handlers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_geoip_handlers` (`ID`, `SORT`, `ACTIVE`, `CLASS_NAME`, `CONFIG`) VALUES
(1,	100,	'Y',	'\\Bitrix\\Main\\Service\\GeoIp\\GeoIP2',	NULL),
(2,	110,	'N',	'\\Bitrix\\Main\\Service\\GeoIp\\MaxMind',	NULL),
(3,	120,	'N',	'\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo',	NULL);

DROP TABLE IF EXISTS `b_geoname`;
CREATE TABLE `b_geoname` (
  `ID` bigint(20) unsigned NOT NULL,
  `LANGUAGE_CODE` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`,`LANGUAGE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_group`;
CREATE TABLE `b_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(11) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `IS_SYSTEM`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
(1,	'2024-06-16 13:27:29',	'Y',	1,	'N',	'Y',	'Администраторы',	'Полный доступ к управлению сайтом.',	NULL,	NULL),
(2,	'2024-06-16 13:27:29',	'Y',	2,	'Y',	'Y',	'Все пользователи (в том числе неавторизованные)',	'Все пользователи, включая неавторизованных.',	NULL,	NULL),
(3,	'2024-06-16 13:27:29',	'Y',	3,	'N',	'Y',	'Пользователи, имеющие право голосовать за рейтинг',	'В эту группу пользователи добавляются автоматически.',	NULL,	'RATING_VOTE'),
(4,	'2024-06-16 13:27:29',	'Y',	4,	'N',	'Y',	'Пользователи имеющие право голосовать за авторитет',	'В эту группу пользователи добавляются автоматически.',	NULL,	'RATING_VOTE_AUTHORITY');

DROP TABLE IF EXISTS `b_group_collection_task`;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_group_subordinate`;
CREATE TABLE `b_group_subordinate` (
  `ID` int(11) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_group_task`;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_hlblock_entity`;
CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_hlblock_entity_lang`;
CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int(11) unsigned NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_hlblock_entity_rights`;
CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `HL_ID` int(11) unsigned NOT NULL,
  `TASK_ID` int(11) unsigned NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_hot_keys`;
CREATE TABLE `b_hot_keys` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
(1,	'Ctrl+Alt+85',	139,	0),
(2,	'Ctrl+Alt+80',	17,	0),
(3,	'Ctrl+Alt+70',	120,	0),
(4,	'Ctrl+Alt+68',	117,	0),
(5,	'Ctrl+Alt+81',	3,	0),
(6,	'Ctrl+Alt+75',	106,	0),
(7,	'Ctrl+Alt+79',	133,	0),
(8,	'Ctrl+Alt+70',	121,	0),
(9,	'Ctrl+Alt+69',	118,	0),
(10,	'Ctrl+Shift+83',	87,	0),
(11,	'Ctrl+Shift+88',	88,	0),
(12,	'Ctrl+Shift+76',	89,	0),
(13,	'Ctrl+Alt+85',	139,	1),
(14,	'Ctrl+Alt+80',	17,	1),
(15,	'Ctrl+Alt+70',	120,	1),
(16,	'Ctrl+Alt+68',	117,	1),
(17,	'Ctrl+Alt+81',	3,	1),
(18,	'Ctrl+Alt+75',	106,	1),
(19,	'Ctrl+Alt+79',	133,	1),
(20,	'Ctrl+Alt+70',	121,	1),
(21,	'Ctrl+Alt+69',	118,	1),
(22,	'Ctrl+Shift+83',	87,	1),
(23,	'Ctrl+Shift+88',	88,	1),
(24,	'Ctrl+Shift+76',	89,	1);

DROP TABLE IF EXISTS `b_hot_keys_code`;
CREATE TABLE `b_hot_keys_code` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
(3,	'CAdminTabControl',	'NextTab();',	'HK_DB_CADMINTC',	'HK_DB_CADMINTC_C',	'tab-container',	'',	0),
(5,	'btn_new',	'var d=BX (\'btn_new\'); if (d) location.href = d.href;',	'HK_DB_BUT_ADD',	'HK_DB_BUT_ADD_C',	'btn_new',	'',	0),
(6,	'btn_excel',	'var d=BX(\'btn_excel\'); if (d) location.href = d.href;',	'HK_DB_BUT_EXL',	'HK_DB_BUT_EXL_C',	'btn_excel',	'',	0),
(7,	'btn_settings',	'var d=BX(\'btn_settings\'); if (d) location.href = d.href;',	'HK_DB_BUT_OPT',	'HK_DB_BUT_OPT_C',	'btn_settings',	'',	0),
(8,	'btn_list',	'var d=BX(\'btn_list\'); if (d) location.href = d.href;',	'HK_DB_BUT_LST',	'HK_DB_BUT_LST_C',	'btn_list',	'',	0),
(9,	'Edit_Save_Button',	'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();',	'HK_DB_BUT_SAVE',	'HK_DB_BUT_SAVE_C',	'Edit_Save_Button',	'',	0),
(10,	'btn_delete',	'var d=BX(\'btn_delete\'); if (d) location.href = d.href;',	'HK_DB_BUT_DEL',	'HK_DB_BUT_DEL_C',	'btn_delete',	'',	0),
(12,	'CAdminFilter',	'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();',	'HK_DB_FLT_FND',	'HK_DB_FLT_FND_C',	'find',	'',	0),
(13,	'CAdminFilter',	'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();',	'HK_DB_FLT_BUT_F',	'HK_DB_FLT_BUT_F_C',	'set_filter',	'',	0),
(14,	'CAdminFilter',	'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();',	'HK_DB_FLT_BUT_CNL',	'HK_DB_FLT_BUT_CNL_C',	'del_filter',	'',	0),
(15,	'bx-panel-admin-button-help-icon-id',	'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;',	'HK_DB_BUT_HLP',	'HK_DB_BUT_HLP_C',	'bx-panel-admin-button-help-icon-id',	'',	0),
(17,	'Global',	'BXHotKeys.ShowSettings();',	'HK_DB_SHW_L',	'HK_DB_SHW_L_C',	'bx-panel-hotkeys',	'',	0),
(19,	'Edit_Apply_Button',	'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();',	'HK_DB_BUT_APPL',	'HK_DB_BUT_APPL_C',	'Edit_Apply_Button',	'',	0),
(20,	'Edit_Cancel_Button',	'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();',	'HK_DB_BUT_CANCEL',	'HK_DB_BUT_CANCEL_C',	'Edit_Cancel_Button',	'',	0),
(54,	'top_panel_org_fav',	'',	'-=AUTONAME=-',	NULL,	'top_panel_org_fav',	NULL,	0),
(55,	'top_panel_module_settings',	'',	'-=AUTONAME=-',	NULL,	'top_panel_module_settings',	'',	0),
(56,	'top_panel_interface_settings',	'',	'-=AUTONAME=-',	NULL,	'top_panel_interface_settings',	'',	0),
(57,	'top_panel_help',	'',	'-=AUTONAME=-',	NULL,	'top_panel_help',	'',	0),
(58,	'top_panel_bizproc_tasks',	'',	'-=AUTONAME=-',	NULL,	'top_panel_bizproc_tasks',	'',	0),
(59,	'top_panel_add_fav',	'',	'-=AUTONAME=-',	NULL,	'top_panel_add_fav',	NULL,	0),
(60,	'top_panel_create_page',	'',	'-=AUTONAME=-',	NULL,	'top_panel_create_page',	'',	0),
(62,	'top_panel_create_folder',	'',	'-=AUTONAME=-',	NULL,	'top_panel_create_folder',	'',	0),
(63,	'top_panel_edit_page',	'',	'-=AUTONAME=-',	NULL,	'top_panel_edit_page',	'',	0),
(64,	'top_panel_page_prop',	'',	'-=AUTONAME=-',	NULL,	'top_panel_page_prop',	'',	0),
(65,	'top_panel_edit_page_html',	'',	'-=AUTONAME=-',	NULL,	'top_panel_edit_page_html',	'',	0),
(67,	'top_panel_edit_page_php',	'',	'-=AUTONAME=-',	NULL,	'top_panel_edit_page_php',	'',	0),
(68,	'top_panel_del_page',	'',	'-=AUTONAME=-',	NULL,	'top_panel_del_page',	'',	0),
(69,	'top_panel_folder_prop',	'',	'-=AUTONAME=-',	NULL,	'top_panel_folder_prop',	'',	0),
(70,	'top_panel_access_folder_new',	'',	'-=AUTONAME=-',	NULL,	'top_panel_access_folder_new',	'',	0),
(71,	'main_top_panel_struct_panel',	'',	'-=AUTONAME=-',	NULL,	'main_top_panel_struct_panel',	'',	0),
(72,	'top_panel_cache_page',	'',	'-=AUTONAME=-',	NULL,	'top_panel_cache_page',	'',	0),
(73,	'top_panel_cache_comp',	'',	'-=AUTONAME=-',	NULL,	'top_panel_cache_comp',	'',	0),
(74,	'top_panel_cache_not',	'',	'-=AUTONAME=-',	NULL,	'top_panel_cache_not',	'',	0),
(75,	'top_panel_edit_mode',	'',	'-=AUTONAME=-',	NULL,	'top_panel_edit_mode',	'',	0),
(76,	'top_panel_templ_site_css',	'',	'-=AUTONAME=-',	NULL,	'top_panel_templ_site_css',	'',	0),
(77,	'top_panel_templ_templ_css',	'',	'-=AUTONAME=-',	NULL,	'top_panel_templ_templ_css',	'',	0),
(78,	'top_panel_templ_site',	'',	'-=AUTONAME=-',	NULL,	'top_panel_templ_site',	'',	0),
(81,	'top_panel_debug_time',	'',	'-=AUTONAME=-',	NULL,	'top_panel_debug_time',	'',	0),
(82,	'top_panel_debug_incl',	'',	'-=AUTONAME=-',	NULL,	'top_panel_debug_incl',	'',	0),
(83,	'top_panel_debug_sql',	'',	'-=AUTONAME=-',	NULL,	'top_panel_debug_sql',	NULL,	0),
(84,	'top_panel_debug_compr',	'',	'-=AUTONAME=-',	NULL,	'top_panel_debug_compr',	'',	0),
(85,	'MTP_SHORT_URI1',	'',	'-=AUTONAME=-',	NULL,	'MTP_SHORT_URI1',	'',	0),
(86,	'MTP_SHORT_URI_LIST',	'',	'-=AUTONAME=-',	NULL,	'MTP_SHORT_URI_LIST',	'',	0),
(87,	'FMST_PANEL_STICKER_ADD',	'',	'-=AUTONAME=-',	NULL,	'FMST_PANEL_STICKER_ADD',	'',	0),
(88,	'FMST_PANEL_STICKERS_SHOW',	'',	'-=AUTONAME=-',	NULL,	'FMST_PANEL_STICKERS_SHOW',	'',	0),
(89,	'FMST_PANEL_CUR_STICKER_LIST',	'',	'-=AUTONAME=-',	NULL,	'FMST_PANEL_CUR_STICKER_LIST',	'',	0),
(90,	'FMST_PANEL_ALL_STICKER_LIST',	'',	'-=AUTONAME=-',	NULL,	'FMST_PANEL_ALL_STICKER_LIST',	'',	0),
(91,	'top_panel_menu',	'var d=BX(\"bx-panel-menu\"); if (d) d.click();',	'-=AUTONAME=-',	NULL,	'bx-panel-menu',	'',	0),
(92,	'top_panel_admin',	'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;',	'-=AUTONAME=-',	NULL,	'bx-panel-admin-tab',	'',	0),
(93,	'admin_panel_site',	'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;',	'-=AUTONAME=-',	NULL,	'bx-panel-view-tab',	'',	0),
(94,	'admin_panel_admin',	'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;',	'-=AUTONAME=-',	NULL,	'bx-panel-admin-tab',	'',	0),
(96,	'top_panel_folder_prop_new',	'',	'-=AUTONAME=-',	NULL,	'top_panel_folder_prop_new',	'',	0),
(97,	'main_top_panel_structure',	'',	'-=AUTONAME=-',	NULL,	'main_top_panel_structure',	'',	0),
(98,	'top_panel_clear_cache',	'',	'-=AUTONAME=-',	NULL,	'top_panel_clear_cache',	'',	0),
(99,	'top_panel_templ',	'',	'-=AUTONAME=-',	NULL,	'top_panel_templ',	'',	0),
(100,	'top_panel_debug',	'',	'-=AUTONAME=-',	NULL,	'top_panel_debug',	'',	0),
(101,	'MTP_SHORT_URI',	'',	'-=AUTONAME=-',	NULL,	'MTP_SHORT_URI',	'',	0),
(102,	'FMST_PANEL_STICKERS',	'',	'-=AUTONAME=-',	NULL,	'FMST_PANEL_STICKERS',	'',	0),
(103,	'top_panel_settings',	'',	'-=AUTONAME=-',	NULL,	'top_panel_settings',	'',	0),
(104,	'top_panel_fav',	'',	'-=AUTONAME=-',	NULL,	'top_panel_fav',	'',	0),
(106,	'Global',	'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';',	'HK_DB_SHW_HK',	'',	'',	'',	0),
(107,	'top_panel_edit_new',	'',	'-=AUTONAME=-',	NULL,	'top_panel_edit_new',	'',	0),
(108,	'FLOW_PANEL_CREATE_WITH_WF',	'',	'-=AUTONAME=-',	NULL,	'FLOW_PANEL_CREATE_WITH_WF',	'',	0),
(109,	'FLOW_PANEL_EDIT_WITH_WF',	'',	'-=AUTONAME=-',	NULL,	'FLOW_PANEL_EDIT_WITH_WF',	'',	0),
(110,	'FLOW_PANEL_HISTORY',	'',	'-=AUTONAME=-',	NULL,	'FLOW_PANEL_HISTORY',	'',	0),
(111,	'top_panel_create_new',	'',	'-=AUTONAME=-',	NULL,	'top_panel_create_new',	'',	0),
(112,	'top_panel_create_folder_new',	'',	'-=AUTONAME=-',	NULL,	'top_panel_create_folder_new',	'',	0),
(116,	'bx-panel-toggle',	'',	'-=AUTONAME=-',	NULL,	'bx-panel-toggle',	'',	0),
(117,	'bx-panel-small-toggle',	'',	'-=AUTONAME=-',	NULL,	'bx-panel-small-toggle',	'',	0),
(118,	'bx-panel-expander',	'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');',	'-=AUTONAME=-',	NULL,	'bx-panel-expander',	'',	0),
(119,	'bx-panel-hider',	'var d=BX(\'bx-panel-hider\'); if (d) d.click();',	'-=AUTONAME=-',	NULL,	'bx-panel-hider',	'',	0),
(120,	'search-textbox-input',	'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}',	'-=AUTONAME=-',	'',	'search',	'',	0),
(121,	'bx-search-input',	'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }',	'-=AUTONAME=-',	'',	'bx-search-input',	'',	0),
(133,	'bx-panel-logout',	'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;',	'-=AUTONAME=-',	'',	'bx-panel-logout',	'',	0),
(135,	'CDialog',	'var d=BX(\'cancel\'); if (d) d.click();',	'HK_DB_D_CANCEL',	'',	'cancel',	'',	0),
(136,	'CDialog',	'var d=BX(\'close\'); if (d) d.click();',	'HK_DB_D_CLOSE',	'',	'close',	'',	0),
(137,	'CDialog',	'var d=BX(\'savebtn\'); if (d) d.click();',	'HK_DB_D_SAVE',	'',	'savebtn',	'',	0),
(138,	'CDialog',	'var d=BX(\'btn_popup_save\'); if (d) d.click();',	'HK_DB_D_EDIT_SAVE',	'',	'btn_popup_save',	'',	0),
(139,	'Global',	'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;',	'HK_DB_SHW_U',	'',	'',	'',	0);

DROP TABLE IF EXISTS `b_iblock`;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `API_CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REST_ON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_api_code` (`API_CODE`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_cache`;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_element`;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_element_iprop`;
CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_element_lock`;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_element_property`;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_val` (`VALUE`(50),`IBLOCK_PROPERTY_ID`,`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_element_right`;
CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_fields`;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_group`;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_iproperty`;
CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_messages`;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_property`;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_property_enum`;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_property_feature`;
CREATE TABLE `b_iblock_property_feature` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FEATURE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_property_feature` (`PROPERTY_ID`,`MODULE_ID`,`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_right`;
CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_rss`;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_section`;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`),
  KEY `ix_iblock_section_left_margin2` (`IBLOCK_ID`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_right_margin2` (`IBLOCK_ID`,`RIGHT_MARGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_section_element`;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_section_iprop`;
CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_section_property`;
CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_section_right`;
CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_sequence`;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_site`;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_iblock_type`;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_type` (`ID`, `SECTIONS`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `IN_RSS`, `SORT`) VALUES
('rest_entity',	'Y',	NULL,	NULL,	'N',	1000);

DROP TABLE IF EXISTS `b_iblock_type_lang`;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_type_lang` (`IBLOCK_TYPE_ID`, `LID`, `NAME`, `SECTION_NAME`, `ELEMENT_NAME`) VALUES
('rest_entity',	'ru',	'Хранилище данных для приложений',	'Разделы',	'Элементы');

DROP TABLE IF EXISTS `b_landing`;
CREATE TABLE `b_landing` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VIEWS` int(18) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `SITEMAP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER_ID` int(18) DEFAULT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `VERSION` int(18) NOT NULL DEFAULT '1',
  `HISTORY_STEP` int(18) NOT NULL DEFAULT '0',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_PUBLIC` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_CODE` (`CODE`),
  KEY `IX_B_LAND_ACTIVE` (`ACTIVE`),
  KEY `IX_B_LAND_DELETED` (`DELETED`),
  KEY `IX_B_LAND_SYS` (`SYS`),
  KEY `IX_B_LAND_XML_ID` (`XML_ID`),
  KEY `IX_B_LAND_SITE_ID` (`SITE_ID`),
  KEY `IX_B_LAND_SITEMAP` (`SITEMAP`),
  KEY `IX_B_LAND_FOLDER` (`FOLDER`),
  KEY `IX_B_LAND_FOLDER_ID` (`FOLDER_ID`),
  FULLTEXT KEY `IX_B_LANDING_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_binding`;
CREATE TABLE `b_landing_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BINDING` (`BINDING_ID`,`BINDING_TYPE`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_B_BINDING_TYPE` (`BINDING_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_block`;
CREATE TABLE `b_landing_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `LID` int(18) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ORIGINAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ANCHOR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT '500',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESIGNED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACCESS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'X',
  `SOURCE_PARAMS` mediumtext COLLATE utf8_unicode_ci,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `ASSETS` text COLLATE utf8_unicode_ci,
  `FAVORITE_META` text COLLATE utf8_unicode_ci,
  `HISTORY_STEP_DESIGNER` int(18) NOT NULL DEFAULT '0',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LID` (`LID`),
  KEY `IX_B_BLOCK_LID_PUBLIC` (`LID`,`PUBLIC`),
  KEY `IX_B_BLOCK_CODE` (`CODE`),
  KEY `IX_B_BLOCK_ACTIVE` (`ACTIVE`),
  KEY `IX_B_BLOCK_PUBLIC` (`PUBLIC`,`DATE_CREATE`),
  KEY `IX_B_BLOCK_DELETED` (`DELETED`),
  FULLTEXT KEY `IX_B_BLOCK_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_block_last_used`;
CREATE TABLE `b_landing_block_last_used` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LU_USER` (`USER_ID`),
  KEY `IX_B_BLOCK_LU_CODE` (`CODE`),
  KEY `IX_B_BLOCK_LU_USER_CODE` (`USER_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_chat`;
CREATE TABLE `b_landing_chat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHAT_ID` int(18) NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AVATAR` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`CHAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_chat_binding`;
CREATE TABLE `b_landing_chat_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `INTERNAL_CHAT_ID` int(18) NOT NULL,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`INTERNAL_CHAT_ID`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_cookies_agreement`;
CREATE TABLE `b_landing_cookies_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE` (`SITE_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_demo`;
CREATE TABLE `b_landing_demo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TPL_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW2X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW3X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` mediumtext COLLATE utf8_unicode_ci,
  `LANG` text COLLATE utf8_unicode_ci,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_DEMO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DEMO_SHOW_IN_LIST` (`SHOW_IN_LIST`),
  KEY `IX_B_DEMO_XML_ID` (`XML_ID`),
  KEY `IX_B_DEMO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_DEMO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_designer_repo`;
CREATE TABLE `b_landing_designer_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT '100',
  `HTML` text COLLATE utf8_unicode_ci NOT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_domain`;
CREATE TABLE `b_landing_domain` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREV_DOMAIN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `PROVIDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FAIL_COUNT` int(2) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_DOMAIN_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DOMAIN_DOMAIN` (`DOMAIN`),
  KEY `IX_B_DOMAIN_PROVIDER` (`PROVIDER`),
  KEY `IX_B_DOMAIN_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_entity_lock`;
CREATE TABLE `b_landing_entity_lock` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LOCK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_TYPE` (`LOCK_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_entity_rights`;
CREATE TABLE `b_landing_entity_rights` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` int(18) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_file`;
CREATE TABLE `b_landing_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `TEMP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_FILE` (`FILE_ID`),
  KEY `IX_TEMP` (`TEMP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_filter_block`;
CREATE TABLE `b_landing_filter_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILTER_ID` int(18) NOT NULL,
  `BLOCK_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_BLOCK` (`FILTER_ID`,`BLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_filter_entity`;
CREATE TABLE `b_landing_filter_entity` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_HASH` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_HASH` (`FILTER_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_folder`;
CREATE TABLE `b_landing_folder` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `INDEX_ID` int(18) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_FOLDER_SITE_ID` (`SITE_ID`),
  KEY `IX_B_FOLDER_ACTIVE` (`ACTIVE`),
  KEY `IX_B_FOLDER_DELETED` (`DELETED`),
  KEY `IX_B_FOLDER_PARENT_ID` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_history`;
CREATE TABLE `b_landing_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `ENTITY_ID` int(18) NOT NULL,
  `ACTION` text COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_PARAMS` text COLLATE utf8_unicode_ci NOT NULL,
  `MULTIPLY_ID` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_HISTORY_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_hook_data`;
CREATE TABLE `b_landing_hook_data` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `HOOK` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `K_HOOK_CODE` (`HOOK`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_placement`;
CREATE TABLE `b_landing_placement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_repo`;
CREATE TABLE `b_landing_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_REPO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_REPO_XML_ID` (`XML_ID`),
  KEY `IX_B_REPO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_REPO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_role`;
CREATE TABLE `b_landing_role` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODES` text COLLATE utf8_unicode_ci,
  `ADDITIONAL_RIGHTS` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_ROLE_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_site`;
CREATE TABLE `b_landing_site` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PAGE',
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_ID` int(18) NOT NULL,
  `SMN_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANDING_ID_INDEX` int(18) DEFAULT NULL,
  `LANDING_ID_404` int(18) DEFAULT NULL,
  `LANDING_ID_503` int(18) DEFAULT NULL,
  `LANG` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SPECIAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VERSION` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE_CODE` (`CODE`),
  KEY `IX_B_SITE_ACTIVE` (`ACTIVE`),
  KEY `IX_B_SITE_DELETED` (`DELETED`),
  KEY `IX_B_SITE_XML_ID` (`XML_ID`),
  KEY `IX_B_SITE_SPECIAL` (`SPECIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_syspage`;
CREATE TABLE `b_landing_syspage` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_ID` (`SITE_ID`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_template`;
CREATE TABLE `b_landing_template` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) DEFAULT '100',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `AREA_COUNT` int(2) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_landing_template` (`ID`, `ACTIVE`, `TITLE`, `SORT`, `XML_ID`, `CONTENT`, `AREA_COUNT`, `CREATED_BY_ID`, `MODIFIED_BY_ID`, `DATE_CREATE`, `DATE_MODIFY`) VALUES
(1,	'Y',	'#EMPTY#',	100,	'empty',	'#CONTENT#',	0,	1,	1,	'2024-06-16 16:27:42',	'2024-06-16 16:27:42'),
(2,	'Y',	'#SIDEBAR_LEFT#',	200,	'sidebar_left',	'<div class=\"landing-layout-flex\">\n								<div class=\"landing-sidebar g-max-width-100x g-overflow-hidden\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>',	1,	1,	1,	'2024-06-16 16:27:42',	'2024-06-16 16:27:42'),
(3,	'Y',	'#SIDEBAR_RIGHT#',	300,	'sidebar_right',	'<div class=\"landing-layout-flex sidebar-right\">\n								<div class=\"landing-sidebar g-max-width-100x\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>',	1,	1,	1,	'2024-06-16 16:27:42',	'2024-06-16 16:27:42'),
(4,	'Y',	'#HEADER_ONLY#',	400,	'header_only',	'<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div>',	1,	1,	1,	'2024-06-16 16:27:42',	'2024-06-16 16:27:42'),
(5,	'Y',	'#HEADER_FOOTER#',	500,	'header_footer',	'<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div> \n							<div class=\"landing-footer\">#AREA_2#</div>',	2,	1,	1,	'2024-06-16 16:27:42',	'2024-06-16 16:27:42'),
(6,	'Y',	'#WITHOUT_LEFT#',	600,	'without_left',	'<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex without-left\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>',	3,	1,	1,	'2024-06-16 16:27:42',	'2024-06-16 16:27:42'),
(7,	'Y',	'#WITHOUT_RIGHT#',	700,	'without_right',	'<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>',	3,	1,	1,	'2024-06-16 16:27:42',	'2024-06-16 16:27:42');

DROP TABLE IF EXISTS `b_landing_template_ref`;
CREATE TABLE `b_landing_template_ref` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `AREA` int(2) NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `K_LANDING_ID` (`LANDING_ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_update_block`;
CREATE TABLE `b_landing_update_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_BLOCK_ID` int(18) DEFAULT '0',
  `PARAMS` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_urlchecker_host`;
CREATE TABLE `b_landing_urlchecker_host` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL,
  `HOST` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_STATUS_HOST` (`STATUS_ID`,`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_urlchecker_status`;
CREATE TABLE `b_landing_urlchecker_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HASH` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_HASH` (`HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_urlchecker_whitelist`;
CREATE TABLE `b_landing_urlchecker_whitelist` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_DOMAIN` (`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_urlrewrite`;
CREATE TABLE `b_landing_urlrewrite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_RULE` (`SITE_ID`,`RULE`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_landing_view`;
CREATE TABLE `b_landing_view` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `VIEWS` int(18) NOT NULL,
  `FIRST_VIEW` datetime NOT NULL,
  `LAST_VIEW` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_VIEW_LIDUID` (`LID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_lang`;
CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
('s1',	1,	'Y',	'Y',	'Сайт по умолчанию',	'/',	NULL,	NULL,	NULL,	NULL,	NULL,	'ru',	'',	'N',	'',	'',	'',	1);

DROP TABLE IF EXISTS `b_language`;
CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  `CODE` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`, `CODE`) VALUES
('en',	2,	'N',	'Y',	'English',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	2,	'en'),
('ru',	1,	'Y',	'Y',	'Russian',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'ru');

DROP TABLE IF EXISTS `b_lang_domain`;
CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_location`;
CREATE TABLE `b_location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SOURCE_CODE` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LATITUDE` decimal(8,6) DEFAULT NULL,
  `LONGITUDE` decimal(9,6) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TYPE` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CODE` (`CODE`),
  UNIQUE KEY `IX_LOC_SE` (`EXTERNAL_ID`,`SOURCE_CODE`),
  KEY `IX_LOC_LAT` (`LATITUDE`),
  KEY `IX_LOC_LON` (`LONGITUDE`),
  KEY `IX_LOC_T` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_location_address`;
CREATE TABLE `b_location_address` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCATION_ID` int(11) DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `LATITUDE` decimal(8,6) DEFAULT NULL,
  `LONGITUDE` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_LOC_BLA_LOC` (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_location_addr_fld`;
CREATE TABLE `b_location_addr_fld` (
  `ADDRESS_ID` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `VALUE` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_NORMALIZED` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_location_addr_link`;
CREATE TABLE `b_location_addr_link` (
  `ADDRESS_ID` int(11) NOT NULL,
  `ENTITY_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ADDRESS_ID`,`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IDX_BLAL_EI_ET` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_location_area`;
CREATE TABLE `b_location_area` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL,
  `GEOMETRY` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TYPE` (`TYPE`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_location_field`;
CREATE TABLE `b_location_field` (
  `LOCATION_ID` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`,`TYPE`),
  KEY `IDX_BLLFL_VAL` (`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_location_hierarchy`;
CREATE TABLE `b_location_hierarchy` (
  `ANCESTOR_ID` int(11) NOT NULL,
  `DESCENDANT_ID` int(11) NOT NULL,
  `LEVEL` int(11) NOT NULL,
  PRIMARY KEY (`ANCESTOR_ID`,`DESCENDANT_ID`),
  KEY `IX_LOC_LH_D` (`DESCENDANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_location_name`;
CREATE TABLE `b_location_name` (
  `LOCATION_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `NAME_NORMALIZED` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LOCATION_ID`,`LANGUAGE_ID`),
  KEY `IX_LOC_LNN` (`NAME_NORMALIZED`(200),`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_location_source`;
CREATE TABLE `b_location_source` (
  `CODE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_location_source` (`CODE`, `NAME`, `CONFIG`) VALUES
('GOOGLE',	'Google',	'a:4:{i:0;a:4:{s:4:\"code\";s:16:\"API_KEY_FRONTEND\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:10;s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"code\";s:15:\"API_KEY_BACKEND\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:20;s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"code\";s:18:\"SHOW_PHOTOS_ON_MAP\";s:4:\"type\";s:4:\"bool\";s:4:\"sort\";i:30;s:5:\"value\";b:1;}i:3;a:4:{s:4:\"code\";s:21:\"USE_GEOCODING_SERVICE\";s:4:\"type\";s:4:\"bool\";s:4:\"sort\";i:40;s:5:\"value\";b:1;}}'),
('OSM',	'OpenStreetMap',	'a:2:{i:0;a:5:{s:4:\"code\";s:11:\"SERVICE_URL\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:10;s:5:\"value\";s:0:\"\";s:10:\"is_visible\";b:1;}i:1;a:5:{s:4:\"code\";s:5:\"TOKEN\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:20;s:5:\"value\";N;s:10:\"is_visible\";b:0;}}');

DROP TABLE IF EXISTS `b_log_notification`;
CREATE TABLE `b_log_notification` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECK_INTERVAL` int(11) DEFAULT NULL,
  `ALERT_COUNT` int(11) DEFAULT NULL,
  `DATE_CHECKED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_log_notification_action`;
CREATE TABLE `b_log_notification_action` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOTIFICATION_ID` int(10) unsigned NOT NULL,
  `NOTIFICATION_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `RECIPIENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_log_notification_action_notification_id` (`NOTIFICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_main_mail_blacklist`;
CREATE TABLE `b_main_mail_blacklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `CATEGORY_ID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_main_mail_sender`;
CREATE TABLE `b_main_mail_sender` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `IS_CONFIRMED` tinyint(4) NOT NULL DEFAULT '0',
  `IS_PUBLIC` tinyint(4) NOT NULL DEFAULT '0',
  `OPTIONS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_main_mail_sender_send_counter`;
CREATE TABLE `b_main_mail_sender_send_counter` (
  `DATE_STAT` date NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(11) NOT NULL,
  PRIMARY KEY (`DATE_STAT`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_medialib_collection`;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_medialib_collection_item`;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_medialib_item`;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_medialib_type`;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
(1,	'image_name',	'image',	'jpg,jpeg,gif,png',	'Y',	'image_desc'),
(2,	'video_name',	'video',	'flv,mp4,wmv',	'Y',	'video_desc'),
(3,	'sound_name',	'sound',	'mp3,wma,aac',	'Y',	'sound_desc');

DROP TABLE IF EXISTS `b_messageservice_incoming_message`;
CREATE TABLE `b_messageservice_incoming_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REQUEST_BODY` longtext COLLATE utf8_unicode_ci,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_MS_INCOMING_MESSAGE_1` (`SENDER_ID`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_messageservice_message`;
CREATE TABLE `b_messageservice_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT '0',
  `MESSAGE_FROM` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_TO` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_HEADERS` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_BODY` longtext COLLATE utf8_unicode_ci NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EXEC_ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `EXTERNAL_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_STATUS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLUSTER_GROUP` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_MESSAGESERVICE_MESSAGE_1` (`DATE_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_2` (`SUCCESS_EXEC`,`CLUSTER_GROUP`),
  KEY `B_MESSAGESERVICE_MESSAGE_3` (`SENDER_ID`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_messageservice_rest_app`;
CREATE TABLE `b_messageservice_rest_app` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `HANDLER` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ADD` datetime DEFAULT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_MESSAGESERVICE_REST_APP_1` (`APP_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_messageservice_rest_app_lang`;
CREATE TABLE `b_messageservice_rest_app_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_module`;
CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
('b24connector',	'2024-06-16 13:27:34'),
('bitrix.sitecorporate',	'2024-06-16 13:27:34'),
('bitrixcloud',	'2024-06-16 13:27:35'),
('clouds',	'2024-06-16 13:27:35'),
('fileman',	'2024-06-16 13:27:36'),
('highloadblock',	'2024-06-16 13:27:37'),
('iblock',	'2024-06-16 13:27:39'),
('landing',	'2024-06-16 13:27:42'),
('location',	'2024-06-16 13:27:47'),
('main',	'2024-06-16 13:27:29'),
('messageservice',	'2024-06-16 13:27:47'),
('perfmon',	'2024-06-16 13:27:48'),
('rest',	'2024-06-16 13:27:49'),
('search',	'2024-06-16 13:27:50'),
('seo',	'2024-06-16 13:27:51'),
('socialservices',	'2024-06-16 13:27:52'),
('translate',	'2024-06-16 13:27:53'),
('ui',	'2024-06-16 13:27:54');

DROP TABLE IF EXISTS `b_module_group`;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_module_to_module`;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `UNIQUE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_module_to_module_unique_id` (`UNIQUE_ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`, `UNIQUE_ID`) VALUES
(1,	'2024-06-16 13:27:29',	100,	'iblock',	'OnIBlockPropertyBuildList',	'main',	'/modules/main/tools/prop_userid.php',	'CIBlockPropertyUserID',	'GetUserTypeDescription',	'',	1,	'2b30c309bf87645959b9bfbed51b49c6'),
(2,	'2024-06-16 13:27:29',	100,	'main',	'OnUserDelete',	'main',	'/modules/main/classes/mysql/favorites.php',	'CFavorites',	'OnUserDelete',	'',	1,	'f437e170e4daf957766b0b0579f08fb4'),
(3,	'2024-06-16 13:27:29',	100,	'main',	'OnLanguageDelete',	'main',	'/modules/main/classes/mysql/favorites.php',	'CFavorites',	'OnLanguageDelete',	'',	1,	'9211999c5cfc3a4d374e4f957d5079f6'),
(4,	'2024-06-16 13:27:29',	100,	'main',	'OnUserDelete',	'main',	'',	'CUserOptions',	'OnUserDelete',	'',	1,	'9ef4e969f975b6425c7113444d210a90'),
(5,	'2024-06-16 13:27:29',	100,	'main',	'OnChangeFile',	'main',	'',	'CMain',	'OnChangeFileComponent',	'',	1,	'332179402f77c4d41c6c2e524acde4d0'),
(6,	'2024-06-16 13:27:30',	100,	'main',	'OnUserTypeRightsCheck',	'main',	'',	'CUser',	'UserTypeRightsCheck',	'',	1,	'e1aae03ea8eb08e7bbb6d8d42cbc2ebe'),
(7,	'2024-06-16 13:27:30',	100,	'main',	'OnUserLogin',	'main',	'',	'UpdateTools',	'CheckUpdates',	'',	1,	'a2986b9f6e9a99c0351c2ba858dafc85'),
(8,	'2024-06-16 13:27:30',	100,	'main',	'OnModuleUpdate',	'main',	'',	'UpdateTools',	'SetUpdateResult',	'',	1,	'f9b70c6a75b6341063b23bde5d32e582'),
(9,	'2024-06-16 13:27:30',	100,	'main',	'OnUpdateCheck',	'main',	'',	'UpdateTools',	'SetUpdateError',	'',	1,	'a0aecef95a192ec3dd134f71f0f4f175'),
(10,	'2024-06-16 13:27:30',	100,	'main',	'OnPanelCreate',	'main',	'',	'CUndo',	'CheckNotifyMessage',	'',	1,	'6476f96ffba6ab2b4a7dbe644f42edf6'),
(11,	'2024-06-16 13:27:30',	100,	'main',	'OnAfterAddRating',	'main',	'',	'CRatingsComponentsMain',	'OnAfterAddRating',	'',	1,	'6122bee2ad083f8f72e35655cee48859'),
(12,	'2024-06-16 13:27:30',	100,	'main',	'OnAfterUpdateRating',	'main',	'',	'CRatingsComponentsMain',	'OnAfterUpdateRating',	'',	1,	'f8f806e33dc35737bdbe6b9bc42626a4'),
(13,	'2024-06-16 13:27:30',	100,	'main',	'OnSetRatingsConfigs',	'main',	'',	'CRatingsComponentsMain',	'OnSetRatingConfigs',	'',	1,	'9244ca7fd6964757ca191c9407cb1218'),
(14,	'2024-06-16 13:27:30',	100,	'main',	'OnGetRatingsConfigs',	'main',	'',	'CRatingsComponentsMain',	'OnGetRatingConfigs',	'',	1,	'd8ae8e1f8889b1fbb6af276fb14c8411'),
(15,	'2024-06-16 13:27:30',	100,	'main',	'OnGetRatingsObjects',	'main',	'',	'CRatingsComponentsMain',	'OnGetRatingObject',	'',	1,	'129315715250c195ee115002b445a156'),
(16,	'2024-06-16 13:27:30',	100,	'main',	'OnGetRatingContentOwner',	'main',	'',	'CRatingsComponentsMain',	'OnGetRatingContentOwner',	'',	1,	'bf1f5deaa1532fe9a28acd6d19d23a80'),
(17,	'2024-06-16 13:27:30',	100,	'main',	'OnAfterAddRatingRule',	'main',	'',	'CRatingRulesMain',	'OnAfterAddRatingRule',	'',	1,	'298e763431f7f7d6c3af9798663f410d'),
(18,	'2024-06-16 13:27:30',	100,	'main',	'OnAfterUpdateRatingRule',	'main',	'',	'CRatingRulesMain',	'OnAfterUpdateRatingRule',	'',	1,	'4ecdc4a15e24c49f0fa8f44064bf1511'),
(19,	'2024-06-16 13:27:30',	100,	'main',	'OnGetRatingRuleObjects',	'main',	'',	'CRatingRulesMain',	'OnGetRatingRuleObjects',	'',	1,	'6ac10928b76183004ba0e88ace0a1b5b'),
(20,	'2024-06-16 13:27:30',	100,	'main',	'OnGetRatingRuleConfigs',	'main',	'',	'CRatingRulesMain',	'OnGetRatingRuleConfigs',	'',	1,	'06769c4f6bbba4fad79c1619a874ee97'),
(21,	'2024-06-16 13:27:30',	100,	'main',	'OnAfterUserAdd',	'main',	'',	'CRatings',	'OnAfterUserRegister',	'',	1,	'ecb9ae0476db69da6c95b06bcb3aebbb'),
(22,	'2024-06-16 13:27:30',	100,	'main',	'OnUserDelete',	'main',	'',	'CRatings',	'OnUserDelete',	'',	1,	'9fe6984fd29b7ab9508ac02c23690094'),
(23,	'2024-06-16 13:27:30',	100,	'main',	'OnAfterGroupAdd',	'main',	'',	'CGroupAuthProvider',	'OnAfterGroupAdd',	'',	1,	'02f2fe70b9068a6b307192321fe74430'),
(24,	'2024-06-16 13:27:30',	100,	'main',	'OnBeforeGroupUpdate',	'main',	'',	'CGroupAuthProvider',	'OnBeforeGroupUpdate',	'',	1,	'ef0f2e4d0ae7bbf59d0798e8078143f9'),
(25,	'2024-06-16 13:27:30',	100,	'main',	'OnBeforeGroupDelete',	'main',	'',	'CGroupAuthProvider',	'OnBeforeGroupDelete',	'',	1,	'd3ec9527c0e77709402a05ae4249afca'),
(26,	'2024-06-16 13:27:30',	100,	'main',	'OnAfterSetUserGroup',	'main',	'',	'CGroupAuthProvider',	'OnAfterSetUserGroup',	'',	1,	'0de6c5b48e9382f6e857d79f76d95f25'),
(27,	'2024-06-16 13:27:30',	100,	'main',	'OnEventLogGetAuditTypes',	'main',	'',	'CEventMain',	'GetAuditTypes',	'',	1,	'ac0b8b7a5e703131a3bd41b4399bc032'),
(28,	'2024-06-16 13:27:30',	100,	'main',	'OnEventLogGetAuditHandlers',	'main',	'',	'CEventMain',	'MakeMainObject',	'',	1,	'1ddb38ccf35a8a9da5d3b2bc80591ad6'),
(29,	'2024-06-16 13:27:30',	100,	'perfmon',	'OnGetTableSchema',	'main',	'',	'CTableSchema',	'OnGetTableSchema',	'',	1,	'c1f65f88d449e8b8a3b7af9d54ef3f50'),
(30,	'2024-06-16 13:27:30',	100,	'sender',	'OnConnectorList',	'main',	'',	'\\Bitrix\\Main\\SenderEventHandler',	'onConnectorListUser',	'',	1,	'8af99568465a1ccdb6a84e868cf5aad8'),
(31,	'2024-06-16 13:27:30',	110,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeString',	'GetUserTypeDescription',	'',	1,	'09f8200652932044934bd3c522e920c5'),
(32,	'2024-06-16 13:27:30',	120,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeInteger',	'GetUserTypeDescription',	'',	1,	'71ef247b3eb3b07e4bd6940791b89497'),
(33,	'2024-06-16 13:27:30',	130,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeDouble',	'GetUserTypeDescription',	'',	1,	'4fe2008255fe567423cc0c2f080ca741'),
(34,	'2024-06-16 13:27:30',	140,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeDateTime',	'GetUserTypeDescription',	'',	1,	'686c0679e60bee52dbcc27f5502277b6'),
(35,	'2024-06-16 13:27:30',	145,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeDate',	'GetUserTypeDescription',	'',	1,	'7e19b5fc5fc48b1cd317a6ac44d84236'),
(36,	'2024-06-16 13:27:30',	150,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeBoolean',	'GetUserTypeDescription',	'',	1,	'4d5e1dd2369089f2db9480549241205f'),
(37,	'2024-06-16 13:27:30',	155,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeUrl',	'GetUserTypeDescription',	'',	1,	'79fcd650625b296abf13216cd5af2428'),
(38,	'2024-06-16 13:27:30',	160,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeFile',	'GetUserTypeDescription',	'',	1,	'67b9a4fbc45240a7887b73e3a246eba0'),
(39,	'2024-06-16 13:27:30',	170,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeEnum',	'GetUserTypeDescription',	'',	1,	'fbebdb289fe38c1fbfeda4d3d8ee43ef'),
(40,	'2024-06-16 13:27:30',	180,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeIBlockSection',	'GetUserTypeDescription',	'',	1,	'2065f8305645790970bac0b99f127f47'),
(41,	'2024-06-16 13:27:30',	190,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeIBlockElement',	'GetUserTypeDescription',	'',	1,	'65bda5818e3545f1683a3ff5271cc891'),
(42,	'2024-06-16 13:27:30',	200,	'main',	'OnUserTypeBuildList',	'main',	'',	'CUserTypeStringFormatted',	'GetUserTypeDescription',	'',	1,	'47e3cf1c280e01dbaed43f9989a6747b'),
(43,	'2024-06-16 13:27:30',	210,	'main',	'OnUserTypeBuildList',	'main',	'',	'\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType',	'getUserTypeDescription',	'',	1,	'719d15ee5f60f6348d2bd6a8911aeed1'),
(44,	'2024-06-16 13:27:30',	100,	'main',	'OnBeforeEndBufferContent',	'main',	'',	'\\Bitrix\\Main\\Analytics\\Counter',	'onBeforeEndBufferContent',	'',	1,	'ff5eb984fe6ce3e8d769bf3ba646b902'),
(45,	'2024-06-16 13:27:30',	100,	'main',	'OnBeforeRestartBuffer',	'main',	'',	'\\Bitrix\\Main\\Analytics\\Counter',	'onBeforeRestartBuffer',	'',	1,	'0782f5a6df6dd52d834caea88c3ba3a7'),
(46,	'2024-06-16 13:27:30',	100,	'main',	'OnFileDelete',	'main',	'',	'\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable',	'onFileDelete',	'',	1,	'54c80cd94412db221338aeb59902f059'),
(47,	'2024-06-16 13:27:30',	100,	'socialnetwork',	'OnSocNetLogDelete',	'main',	'',	'CUserCounter',	'OnSocNetLogDelete',	'',	1,	'33e603755a0bc07abd51a1f8ed52966e'),
(48,	'2024-06-16 13:27:30',	100,	'socialnetwork',	'OnSocNetLogCommentDelete',	'main',	'',	'CUserCounter',	'OnSocNetLogCommentDelete',	'',	1,	'51ee2214895be904a880046f43e84138'),
(49,	'2024-06-16 13:27:30',	100,	'main',	'OnAdminInformerInsertItems',	'main',	'',	'CMpNotifications',	'OnAdminInformerInsertItemsHandlerMP',	'',	1,	'c89c0e94ac1110c334a24c70e1773daa'),
(50,	'2024-06-16 13:27:30',	100,	'rest',	'OnRestServiceBuildDescription',	'main',	'',	'\\Bitrix\\Main\\Rest\\Handlers',	'onRestServiceBuildDescription',	'',	1,	'c0b0c358a21b648d4f9c5d29d17a5ab2'),
(51,	'2024-06-16 13:27:30',	100,	'main',	'OnBeforeUserTypeAdd',	'main',	'',	'\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper',	'OnBeforeUserTypeAdd',	'',	1,	'e204684efc0764af9431ca94b950619a'),
(52,	'2024-06-16 13:27:30',	100,	'main',	'OnAfterUserTypeAdd',	'main',	'',	'\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper',	'onAfterUserTypeAdd',	'',	1,	'50932fb244caf7af686fac906caf3e73'),
(53,	'2024-06-16 13:27:30',	100,	'main',	'OnBeforeUserTypeDelete',	'main',	'',	'\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper',	'OnBeforeUserTypeDelete',	'',	1,	'd22a86deba0ff4bd031d022e331033b4'),
(54,	'2024-06-16 13:27:30',	100,	'main',	'OnAuthProvidersBuildList',	'main',	'',	'\\Bitrix\\Main\\Access\\Auth\\AccessAuthProvider',	'getProviders',	'',	1,	'3a2839dac113bf47bce01812903e768a'),
(55,	'2024-06-16 13:27:30',	100,	'iblock',	'OnBeforeIBlockSectionUpdate',	'main',	'',	'\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler',	'onBeforeIBlockSectionUpdate',	'',	1,	'dde505dba68c59bd4661b7680c329485'),
(56,	'2024-06-16 13:27:30',	100,	'iblock',	'OnBeforeIBlockSectionAdd',	'main',	'',	'\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler',	'onBeforeIBlockSectionAdd',	'',	1,	'd3a665b1890dabbba32ff01e3e46ec57'),
(57,	'2024-06-16 13:27:30',	100,	'iblock',	'OnBeforeIBlockSectionDelete',	'main',	'',	'\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler',	'onBeforeIBlockSectionDelete',	'',	1,	'157add4b02621a60fabf1369c3e7ea9b'),
(58,	'2024-06-16 13:27:30',	100,	'sale',	'OnSaleBasketItemSaved',	'main',	'',	'\\Bitrix\\Main\\Analytics\\Catalog',	'catchCatalogBasket',	'',	2,	'fa4fc3924ff2585e92f8bdabaf287864'),
(59,	'2024-06-16 13:27:30',	100,	'sale',	'OnSaleOrderSaved',	'main',	'',	'\\Bitrix\\Main\\Analytics\\Catalog',	'catchCatalogOrder',	'',	2,	'6b358bb17b30da91b105fb1451ed9aaa'),
(60,	'2024-06-16 13:27:30',	100,	'sale',	'OnSaleOrderPaid',	'main',	'',	'\\Bitrix\\Main\\Analytics\\Catalog',	'catchCatalogOrderPayment',	'',	2,	'8f5ca6e1c5136cb4bbf30474f0ff4183'),
(61,	'2024-06-16 13:27:30',	1000,	'sale',	'onBuildDiscountConditionInterfaceControls',	'main',	'',	'\\Bitrix\\Main\\Discount\\UserConditionControl',	'onBuildDiscountConditionInterfaceControls',	'',	1,	'9f0d91c081704e52b52f540b3acaf52e'),
(62,	'2024-06-16 13:27:30',	100,	'main',	'OnBeforePhpMail',	'main',	'',	'\\Bitrix\\Main\\Mail\\Sender',	'applyCustomSmtp',	'',	2,	'10fbf5b8dec05a02d8d7010e594f16ec'),
(63,	'2024-06-16 13:27:30',	100,	'main',	'OnBuildFilterFactoryMethods',	'main',	'',	'\\Bitrix\\Main\\Filter\\FactoryMain',	'onBuildFilterFactoryMethods',	'',	2,	'19f10c2686a955bd8b8116ea1f1ad829'),
(64,	'2024-06-16 13:27:30',	100,	'main',	'onGetUserFieldValues',	'main',	'',	'\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper',	'onGetUserFieldValues',	'',	2,	'7f9a5e25d638a6bff29f0bf4666da1a9'),
(65,	'2024-06-16 13:27:30',	100,	'main',	'onUpdateUserFieldValues',	'main',	'',	'\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper',	'onUpdateUserFieldValues',	'',	2,	'd78761f994d74258421d271810f03ebf'),
(66,	'2024-06-16 13:27:30',	100,	'main',	'onDeleteUserFieldValues',	'main',	'',	'\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper',	'onDeleteUserFieldValues',	'',	2,	'074b2e25238a00ffc809ad12b609db2c'),
(67,	'2024-06-16 13:27:30',	100,	'main',	'OnAfterUserTypeAdd',	'main',	'',	'\\Bitrix\\Main\\ORM\\Entity',	'onUserTypeChange',	'',	2,	'37b1b1538fa6a6c5f41c9ce4afbf2789'),
(68,	'2024-06-16 13:27:30',	100,	'main',	'OnAfterUserTypeUpdate',	'main',	'',	'\\Bitrix\\Main\\ORM\\Entity',	'onUserTypeChange',	'',	2,	'6a53bbd6e85686f4aa8a69d3d75f7e37'),
(69,	'2024-06-16 13:27:30',	100,	'main',	'OnAfterUserTypeDelete',	'main',	'',	'\\Bitrix\\Main\\ORM\\Entity',	'onUserTypeChange',	'',	2,	'010cc1e3107418a1fd9f9a4cde7d93b9'),
(70,	'2024-06-16 13:27:34',	100,	'main',	'OnBuildGlobalMenu',	'b24connector',	'',	'\\Bitrix\\B24Connector\\Helper',	'onBuildGlobalMenu',	'',	1,	'9c4452a442bacc2d4d70635962485be1'),
(71,	'2024-06-16 13:27:34',	100,	'main',	'OnBeforeProlog',	'b24connector',	'',	'\\Bitrix\\B24Connector\\Helper',	'onBeforeProlog',	'',	1,	'641053ff6ee8ff57518d7c30724530e5'),
(72,	'2024-06-16 13:27:34',	100,	'main',	'OnBeforeProlog',	'bitrix.sitecorporate',	'',	'CSiteCorporate',	'ShowPanel',	'',	1,	'bc7c322534797a9ed3493c40e1b8fdac'),
(73,	'2024-06-16 13:27:35',	100,	'main',	'OnAdminInformerInsertItems',	'bitrixcloud',	'',	'CBitrixCloudBackup',	'OnAdminInformerInsertItems',	'',	1,	'5499039afdd0fdb38d4b245c8b886dcb'),
(74,	'2024-06-16 13:27:35',	100,	'mobileapp',	'OnBeforeAdminMobileMenuBuild',	'bitrixcloud',	'',	'CBitrixCloudMobile',	'OnBeforeAdminMobileMenuBuild',	'',	1,	'5828a8cdb2cc45e2724ef1c76139df88'),
(75,	'2024-06-16 13:27:35',	100,	'main',	'OnEventLogGetAuditTypes',	'clouds',	'',	'CCloudStorage',	'GetAuditTypes',	'',	1,	'da69722ba95497cf263381b46e24df40'),
(76,	'2024-06-16 13:27:35',	90,	'main',	'OnBeforeProlog',	'clouds',	'',	'CCloudStorage',	'OnBeforeProlog',	'',	1,	'f8c39ff182ad873715f10a7091f928a4'),
(77,	'2024-06-16 13:27:35',	100,	'main',	'OnAdminListDisplay',	'clouds',	'',	'CCloudStorage',	'OnAdminListDisplay',	'',	1,	'8ddf4f578e7229a63cba4d2124c7643c'),
(78,	'2024-06-16 13:27:35',	100,	'main',	'OnBuildGlobalMenu',	'clouds',	'',	'CCloudStorage',	'OnBuildGlobalMenu',	'',	1,	'd6d308843a6521ad50bfa230a2fcef8f'),
(79,	'2024-06-16 13:27:35',	100,	'main',	'OnFileSave',	'clouds',	'',	'CCloudStorage',	'OnFileSave',	'',	1,	'1e4f94a842d6166359ed1789a6f21245'),
(80,	'2024-06-16 13:27:35',	100,	'main',	'OnAfterFileSave',	'clouds',	'',	'CCloudStorage',	'OnAfterFileSave',	'',	1,	'c36bae07a3080f9b5bc5d422ec96933f'),
(81,	'2024-06-16 13:27:35',	100,	'main',	'OnGetFileSRC',	'clouds',	'',	'CCloudStorage',	'OnGetFileSRC',	'',	1,	'7ec03b3b7ad3f2f54c1e438a1172e5a8'),
(82,	'2024-06-16 13:27:35',	100,	'main',	'OnFileCopy',	'clouds',	'',	'CCloudStorage',	'OnFileCopy',	'',	1,	'6880b56c76f7d3c5d09f887fca6341ca'),
(83,	'2024-06-16 13:27:35',	100,	'main',	'OnPhysicalFileDelete',	'clouds',	'',	'CCloudStorage',	'OnFileDelete',	'',	1,	'3151c487c747a57d7817f68e97fd1c94'),
(84,	'2024-06-16 13:27:35',	100,	'main',	'OnMakeFileArray',	'clouds',	'',	'CCloudStorage',	'OnMakeFileArray',	'',	1,	'713ea8a7a25764b1af60f7a1ec3032d5'),
(85,	'2024-06-16 13:27:35',	100,	'main',	'OnBeforeResizeImage',	'clouds',	'',	'CCloudStorage',	'OnBeforeResizeImage',	'',	1,	'705cd310c52f9c7e8e0c8a0578a22667'),
(86,	'2024-06-16 13:27:35',	100,	'main',	'OnAfterResizeImage',	'clouds',	'',	'CCloudStorage',	'OnAfterResizeImage',	'',	1,	'a403ad2328227153475df0c478a465cc'),
(87,	'2024-06-16 13:27:35',	100,	'main',	'OnAfterFileDeleteDuplicate',	'clouds',	'',	'CCloudStorage',	'OnAfterFileDeleteDuplicate',	'',	1,	'c5f3eb3991b50d4f80c2ccbdc94f8656'),
(88,	'2024-06-16 13:27:35',	100,	'clouds',	'OnGetStorageService',	'clouds',	'',	'CCloudStorageService_AmazonS3',	'GetObjectInstance',	'',	1,	'a4eb7ed1f50b5931474c565f448a4069'),
(89,	'2024-06-16 13:27:35',	100,	'clouds',	'OnGetStorageService',	'clouds',	'',	'CCloudStorageService_GoogleStorage',	'GetObjectInstance',	'',	1,	'1e559e2225608e8d40eeede5b7526f2a'),
(90,	'2024-06-16 13:27:35',	100,	'clouds',	'OnGetStorageService',	'clouds',	'',	'CCloudStorageService_OpenStackStorage',	'GetObjectInstance',	'',	1,	'5ad09feff5dab28ab571ad034ccdf2ea'),
(91,	'2024-06-16 13:27:35',	100,	'clouds',	'OnGetStorageService',	'clouds',	'',	'CCloudStorageService_RackSpaceCloudFiles',	'GetObjectInstance',	'',	1,	'cc976773610cf809bb56871ac7dd9f01'),
(92,	'2024-06-16 13:27:35',	100,	'clouds',	'OnGetStorageService',	'clouds',	'',	'CCloudStorageService_ClodoRU',	'GetObjectInstance',	'',	1,	'faadad31436e94c420ed787e4424714b'),
(93,	'2024-06-16 13:27:35',	100,	'clouds',	'OnGetStorageService',	'clouds',	'',	'CCloudStorageService_Selectel',	'GetObjectInstance',	'',	1,	'5e63a8eebed42bd099b4a9ef62e8d52b'),
(94,	'2024-06-16 13:27:35',	100,	'clouds',	'OnGetStorageService',	'clouds',	'',	'CCloudStorageService_HotBox',	'GetObjectInstance',	'',	1,	'1913169adcd6d6f3b7fb5f3b70ba1fd8'),
(95,	'2024-06-16 13:27:35',	100,	'clouds',	'OnGetStorageService',	'clouds',	'',	'CCloudStorageService_Yandex',	'GetObjectInstance',	'',	1,	'12bd1d4f0d145d5b1681955612fe61c8'),
(96,	'2024-06-16 13:27:35',	100,	'clouds',	'OnGetStorageService',	'clouds',	'',	'CCloudStorageService_S3',	'GetObjectInstance',	'',	1,	'4af3f0ba1f50ed9be6efcdb55dfbee4e'),
(97,	'2024-06-16 13:27:35',	100,	'perfmon',	'OnGetTableSchema',	'clouds',	'',	'clouds',	'OnGetTableSchema',	'',	1,	'd31a1f80f07441976eb1711db4902a71'),
(98,	'2024-06-16 13:27:36',	100,	'main',	'OnGroupDelete',	'fileman',	'',	'CFileman',	'OnGroupDelete',	'',	1,	'd10f791d422ba0e7551ab267db50404c'),
(99,	'2024-06-16 13:27:36',	100,	'main',	'OnPanelCreate',	'fileman',	'',	'CFileman',	'OnPanelCreate',	'',	1,	'b00a6174fb1763684c299ccf5e054c65'),
(100,	'2024-06-16 13:27:36',	100,	'main',	'OnModuleUpdate',	'fileman',	'',	'CFileman',	'OnModuleUpdate',	'',	1,	'58ae853e2b7c230b5cdb51129efd8a05'),
(101,	'2024-06-16 13:27:36',	100,	'main',	'OnModuleInstalled',	'fileman',	'',	'CFileman',	'ClearComponentsListCache',	'',	1,	'7bdbd354eab11f376fa257a998587277'),
(102,	'2024-06-16 13:27:36',	100,	'iblock',	'OnIBlockPropertyBuildList',	'fileman',	'',	'CIBlockPropertyMapGoogle',	'GetUserTypeDescription',	'',	1,	'd9d06fd05f80b33379359ebd8e36e655'),
(103,	'2024-06-16 13:27:36',	100,	'iblock',	'OnIBlockPropertyBuildList',	'fileman',	'',	'CIBlockPropertyMapYandex',	'GetUserTypeDescription',	'',	1,	'20ca1d02998884b5abec68b32fdb561d'),
(104,	'2024-06-16 13:27:36',	100,	'iblock',	'OnIBlockPropertyBuildList',	'fileman',	'',	'CIBlockPropertyVideo',	'GetUserTypeDescription',	'',	1,	'991c32062e05844708a5cf7aba37bf9a'),
(105,	'2024-06-16 13:27:36',	100,	'main',	'OnUserTypeBuildList',	'fileman',	'',	'CUserTypeVideo',	'GetUserTypeDescription',	'',	1,	'41bc5efb49ebf8d165acd4e4d556f60c'),
(106,	'2024-06-16 13:27:36',	100,	'main',	'OnEventLogGetAuditTypes',	'fileman',	'',	'CEventFileman',	'GetAuditTypes',	'',	1,	'e0a610651ffec1fbddb2f261223fb2e9'),
(107,	'2024-06-16 13:27:36',	100,	'main',	'OnEventLogGetAuditHandlers',	'fileman',	'',	'CEventFileman',	'MakeFilemanObject',	'',	1,	'fbfef1ef99530f6eae191da293f9566c'),
(108,	'2024-06-16 13:27:36',	154,	'main',	'OnUserTypeBuildList',	'fileman',	'',	'\\Bitrix\\Fileman\\UserField\\Address',	'getUserTypeDescription',	'',	1,	'f0583a376e38d3d2675513b1a367ed3c'),
(109,	'2024-06-16 13:27:37',	100,	'main',	'OnBeforeUserTypeAdd',	'highloadblock',	'',	'\\Bitrix\\Highloadblock\\HighloadBlockTable',	'OnBeforeUserTypeAdd',	'',	1,	'f9dcff287cf7753e5c56974d37975507'),
(110,	'2024-06-16 13:27:37',	100,	'main',	'OnAfterUserTypeAdd',	'highloadblock',	'',	'\\Bitrix\\Highloadblock\\HighloadBlockTable',	'onAfterUserTypeAdd',	'',	1,	'd1fa2865e72eca144b964b6fb1eefc15'),
(111,	'2024-06-16 13:27:37',	100,	'main',	'OnBeforeUserTypeDelete',	'highloadblock',	'',	'\\Bitrix\\Highloadblock\\HighloadBlockTable',	'OnBeforeUserTypeDelete',	'',	1,	'1bf13707e1a45b8320c2ecd35534cbb4'),
(112,	'2024-06-16 13:27:37',	100,	'main',	'OnUserTypeBuildList',	'highloadblock',	'',	'CUserTypeHlblock',	'GetUserTypeDescription',	'',	1,	'2ac4a2154f4fd85d67b50f412ed5ed48'),
(113,	'2024-06-16 13:27:37',	100,	'iblock',	'OnIBlockPropertyBuildList',	'highloadblock',	'',	'CIBlockPropertyDirectory',	'GetUserTypeDescription',	'',	1,	'a6f7df502db8a04590e43188d7cbfc99'),
(114,	'2024-06-16 13:27:39',	100,	'main',	'OnGroupDelete',	'iblock',	'',	'CIBlock',	'OnGroupDelete',	'',	1,	'f2320df213f38adf32364d3169d5b197'),
(115,	'2024-06-16 13:27:39',	100,	'main',	'OnBeforeLangDelete',	'iblock',	'',	'CIBlock',	'OnBeforeLangDelete',	'',	1,	'46aef774958db327c1170a12d3a70ee5'),
(116,	'2024-06-16 13:27:39',	100,	'main',	'OnLangDelete',	'iblock',	'',	'CIBlock',	'OnLangDelete',	'',	1,	'861f6ee2ca56bf63c3af07db0553606b'),
(117,	'2024-06-16 13:27:39',	100,	'main',	'OnUserTypeRightsCheck',	'iblock',	'',	'CIBlockSection',	'UserTypeRightsCheck',	'',	1,	'2a6d446893d46f04f2c151f458d2908c'),
(118,	'2024-06-16 13:27:39',	100,	'search',	'OnReindex',	'iblock',	'',	'CIBlock',	'OnSearchReindex',	'',	1,	'c6c8111f129e0eb19e558106e354e6f6'),
(119,	'2024-06-16 13:27:39',	100,	'search',	'OnSearchGetURL',	'iblock',	'',	'CIBlock',	'OnSearchGetURL',	'',	1,	'0ae9fc756bfb1273309240cd8f535672'),
(120,	'2024-06-16 13:27:39',	100,	'main',	'OnEventLogGetAuditTypes',	'iblock',	'',	'CIBlock',	'GetAuditTypes',	'',	1,	'182d19c163e3a5a965bca170c3fb0e83'),
(121,	'2024-06-16 13:27:39',	100,	'main',	'OnEventLogGetAuditHandlers',	'iblock',	'',	'CEventIBlock',	'MakeIBlockObject',	'',	1,	'f7a182e8d9b204970d111e4703b9f523'),
(122,	'2024-06-16 13:27:39',	200,	'main',	'OnGetRatingContentOwner',	'iblock',	'',	'CRatingsComponentsIBlock',	'OnGetRatingContentOwner',	'',	1,	'6da245944e376d586a3fa2aaee02c70b'),
(123,	'2024-06-16 13:27:39',	100,	'main',	'OnTaskOperationsChanged',	'iblock',	'',	'CIBlockRightsStorage',	'OnTaskOperationsChanged',	'',	1,	'01b3f9984fa07b1dfb4bc35d107d5672'),
(124,	'2024-06-16 13:27:39',	100,	'main',	'OnGroupDelete',	'iblock',	'',	'CIBlockRightsStorage',	'OnGroupDelete',	'',	1,	'2dbbccdee3f2e7bd86446bec02be1d54'),
(125,	'2024-06-16 13:27:39',	100,	'main',	'OnUserDelete',	'iblock',	'',	'CIBlockRightsStorage',	'OnUserDelete',	'',	1,	'78f090ee29030c54788098b0782d28f9'),
(126,	'2024-06-16 13:27:39',	100,	'perfmon',	'OnGetTableSchema',	'iblock',	'',	'iblock',	'OnGetTableSchema',	'',	1,	'4b71a345c136beed338aa7137943d80b'),
(127,	'2024-06-16 13:27:39',	100,	'sender',	'OnConnectorList',	'iblock',	'',	'\\Bitrix\\Iblock\\SenderEventHandler',	'onConnectorListIblock',	'',	1,	'3de75587a47352dd3cb6d10866f69385'),
(128,	'2024-06-16 13:27:39',	10,	'iblock',	'OnIBlockPropertyBuildList',	'iblock',	'',	'CIBlockPropertyDate',	'GetUserTypeDescription',	'',	1,	'fa608e2c397b6793c54ad296619a22e2'),
(129,	'2024-06-16 13:27:39',	20,	'iblock',	'OnIBlockPropertyBuildList',	'iblock',	'',	'CIBlockPropertyDateTime',	'GetUserTypeDescription',	'',	1,	'78554c9e3c38ac383d51f0ee4d013120'),
(130,	'2024-06-16 13:27:39',	30,	'iblock',	'OnIBlockPropertyBuildList',	'iblock',	'',	'CIBlockPropertyXmlID',	'GetUserTypeDescription',	'',	1,	'952fe5f2ea67493fb9f9b924ce1b992b'),
(131,	'2024-06-16 13:27:39',	40,	'iblock',	'OnIBlockPropertyBuildList',	'iblock',	'',	'CIBlockPropertyFileMan',	'GetUserTypeDescription',	'',	1,	'fd688441d5e8203751fb47374931e011'),
(132,	'2024-06-16 13:27:39',	50,	'iblock',	'OnIBlockPropertyBuildList',	'iblock',	'',	'CIBlockPropertyHTML',	'GetUserTypeDescription',	'',	1,	'27645f81ce5d6d9f19a47cc171860beb'),
(133,	'2024-06-16 13:27:39',	60,	'iblock',	'OnIBlockPropertyBuildList',	'iblock',	'',	'CIBlockPropertyElementList',	'GetUserTypeDescription',	'',	1,	'c53e9314ae43c30267b32310a02d7df4'),
(134,	'2024-06-16 13:27:39',	70,	'iblock',	'OnIBlockPropertyBuildList',	'iblock',	'',	'CIBlockPropertySequence',	'GetUserTypeDescription',	'',	1,	'3ff9528d1264fc77697248957aafdab5'),
(135,	'2024-06-16 13:27:39',	80,	'iblock',	'OnIBlockPropertyBuildList',	'iblock',	'',	'CIBlockPropertyElementAutoComplete',	'GetUserTypeDescription',	'',	1,	'0d233a1e7a0d6a52a52e13df88291024'),
(136,	'2024-06-16 13:27:39',	90,	'iblock',	'OnIBlockPropertyBuildList',	'iblock',	'',	'CIBlockPropertySKU',	'GetUserTypeDescription',	'',	1,	'8678bc826ced4f66640fba3775b18516'),
(137,	'2024-06-16 13:27:39',	100,	'iblock',	'OnIBlockPropertyBuildList',	'iblock',	'',	'CIBlockPropertySectionAutoComplete',	'GetUserTypeDescription',	'',	1,	'26ff6f651cb94a1fe4ce9827566f0730'),
(138,	'2024-06-16 13:27:39',	100,	'main',	'onVirtualClassBuildList',	'iblock',	'',	'Bitrix\\Iblock\\IblockTable',	'compileAllEntities',	'',	2,	'8a4e85071d25e6ba7f9ed315874c411b'),
(139,	'2024-06-16 13:27:42',	100,	'ai',	'onTuningLoad',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\Ai',	'onTuningLoad',	'',	2,	'64d7f5f3d8a372fb0d441d82a49f369b'),
(140,	'2024-06-16 13:27:42',	100,	'ai',	'onBeforeCompletions',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\Ai',	'onBeforeCompletions',	'',	2,	'9192985f1e2da4ddd7a3328eb95a975e'),
(141,	'2024-06-16 13:27:42',	100,	'crm',	'onAfterCrmCompanyAdd',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\Crm',	'onAfterCompanyChange',	'',	2,	'7e8fed841380d8075d45525f328e8940'),
(142,	'2024-06-16 13:27:42',	100,	'crm',	'onAfterCrmCompanyUpdate',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\Crm',	'onAfterCompanyChange',	'',	2,	'688027a0f389137b02ac0a834f0a8495'),
(143,	'2024-06-16 13:27:42',	100,	'iblock',	'onAfterIBlockSectionDelete',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\Iblock',	'onAfterIBlockSectionDelete',	'',	2,	'ffe8a984ae7ff50064ac74e788a80118'),
(144,	'2024-06-16 13:27:42',	100,	'intranet',	'onBuildBindingMenu',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\Intranet',	'onBuildBindingMenu',	'',	2,	'd5464da9aea2308d3d5f13c2387c4c40'),
(145,	'2024-06-16 13:27:42',	100,	'landing',	'onBuildSourceList',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\Landing',	'onSourceBuildHandler',	'',	2,	'fc391addc82a816df68510b0ae3363a5'),
(146,	'2024-06-16 13:27:42',	100,	'main',	'onBeforeSiteDelete',	'landing',	'',	'\\Bitrix\\Landing\\Site',	'onBeforeMainSiteDelete',	'',	2,	'5faa9b5de931dbb101e2e0aef6fc594b'),
(147,	'2024-06-16 13:27:42',	100,	'main',	'onSiteDelete',	'landing',	'',	'\\Bitrix\\Landing\\Site',	'onMainSiteDelete',	'',	2,	'af029bceca7ea9cc809515e95bd3a710'),
(148,	'2024-06-16 13:27:42',	100,	'main',	'onUserConsentProviderList',	'landing',	'',	'\\Bitrix\\Landing\\Site\\Cookies',	'onUserConsentProviderList',	'',	2,	'f59a96e272348f934d62ba5d3ee79f21'),
(149,	'2024-06-16 13:27:42',	100,	'main',	'OnAfterFileDeleteDuplicate',	'landing',	'',	'\\Bitrix\\Landing\\Update\\Block\\DuplicateImages',	'onAfterFileDeleteDuplicate',	'',	2,	'b80f7597db6200591a0e0e41c14e0ee0'),
(150,	'2024-06-16 13:27:42',	100,	'mobile',	'onMobileMenuStructureBuilt',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\Mobile',	'onMobileMenuStructureBuilt',	'',	2,	'01fd8a44b83b5f7fcd2f36a626657ad0'),
(151,	'2024-06-16 13:27:42',	100,	'rest',	'onRestServiceBuildDescription',	'landing',	'',	'\\Bitrix\\Landing\\Publicaction',	'restBase',	'',	2,	'9af99ddecf2dd8c3c5b14721f23e8fef'),
(152,	'2024-06-16 13:27:42',	100,	'rest',	'onBeforeApplicationUninstall',	'landing',	'',	'\\Bitrix\\Landing\\Publicaction',	'beforeRestApplicationDelete',	'',	2,	'ef1f080a088ad54298a4ba9bf2896313'),
(153,	'2024-06-16 13:27:42',	100,	'rest',	'onRestAppDelete',	'landing',	'',	'\\Bitrix\\Landing\\Publicaction',	'restApplicationDelete',	'',	2,	'031cfc016e3be91368376a391c351dea'),
(154,	'2024-06-16 13:27:42',	100,	'rest',	'onRestApplicationConfigurationGetManifest',	'landing',	'',	'\\Bitrix\\Landing\\Transfer\\AppConfiguration',	'getManifestList',	'',	2,	'b88124aac7c2c8ddecf2ce127a9c6ef8'),
(155,	'2024-06-16 13:27:42',	100,	'rest',	'onRestApplicationConfigurationExport',	'landing',	'',	'\\Bitrix\\Landing\\Transfer\\AppConfiguration',	'onEventExportController',	'',	2,	'917b00a9f82e6b8f7899a6e8c3b22236'),
(156,	'2024-06-16 13:27:42',	100,	'rest',	'onRestApplicationConfigurationGetManifestSetting',	'landing',	'',	'\\Bitrix\\Landing\\Transfer\\AppConfiguration',	'onInitManifest',	'',	2,	'99fa9aa37a23a371cca0153c840c7802'),
(157,	'2024-06-16 13:27:42',	100,	'rest',	'onRestApplicationConfigurationEntity',	'landing',	'',	'\\Bitrix\\Landing\\Transfer\\AppConfiguration',	'getEntityList',	'',	2,	'820df699b9abf22ce0356fc9957be794'),
(158,	'2024-06-16 13:27:42',	100,	'rest',	'onRestApplicationConfigurationImport',	'landing',	'',	'\\Bitrix\\Landing\\Transfer\\AppConfiguration',	'onEventImportController',	'',	2,	'e65daaed01b2c52e6098ee47ddb7f07a'),
(159,	'2024-06-16 13:27:42',	100,	'rest',	'onRestApplicationConfigurationFinish',	'landing',	'',	'\\Bitrix\\Landing\\Transfer\\AppConfiguration',	'onFinish',	'',	2,	'45343e5617dca2ad06a5d13050232caf'),
(160,	'2024-06-16 13:27:42',	100,	'seo',	'onExtensionInstall',	'landing',	'',	'\\Bitrix\\Landing\\Hook\\Page\\PixelFb',	'changeBusinessPixel',	'',	2,	'27bf01f04349ff82ede423de62df5384'),
(161,	'2024-06-16 13:27:42',	100,	'socialnetwork',	'onFillSocNetFeaturesList',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\SocialNetwork',	'onFillSocNetFeaturesList',	'',	2,	'9825d91c89b53b69655aa98ea4f3a6cf'),
(162,	'2024-06-16 13:27:42',	100,	'socialnetwork',	'onFillSocNetMenu',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\SocialNetwork',	'onFillSocNetMenu',	'',	2,	'14ecfb8fb4fc20f22ddb5ac64783461d'),
(163,	'2024-06-16 13:27:42',	100,	'socialnetwork',	'onSocNetGroupDelete',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\SocialNetwork',	'onSocNetGroupDelete',	'',	2,	'78202f1461a8822a105a19f45502c327'),
(164,	'2024-06-16 13:27:42',	100,	'socialnetwork',	'onSocNetFeaturesUpdate',	'landing',	'',	'\\Bitrix\\Landing\\Connector\\SocialNetwork',	'onSocNetFeaturesUpdate',	'',	2,	'd385df085957d9e418b63017d75630fe'),
(165,	'2024-06-16 13:27:47',	100,	'ui',	'onUIFormInitialize',	'location',	'',	'\\Bitrix\\Location\\Infrastructure\\EventHandler',	'onUIFormInitialize',	'',	2,	'462272192a150e16b28f1e1bd33ed62b'),
(166,	'2024-06-16 13:27:47',	100,	'main',	'OnAfterEpilog',	'messageservice',	'',	'\\Bitrix\\MessageService\\Queue',	'run',	'',	1,	'6bcb21b0ccc5ac89d9531ddf8b94683c'),
(167,	'2024-06-16 13:27:47',	100,	'rest',	'OnRestServiceBuildDescription',	'messageservice',	'',	'\\Bitrix\\MessageService\\RestService',	'onRestServiceBuildDescription',	'',	1,	'7524628243223e572590eea87cc03f73'),
(168,	'2024-06-16 13:27:47',	100,	'rest',	'OnRestAppDelete',	'messageservice',	'',	'\\Bitrix\\MessageService\\RestService',	'onRestAppDelete',	'',	1,	'5febc41cd526ecba95dbb4843dd9c134'),
(169,	'2024-06-16 13:27:47',	100,	'rest',	'OnRestAppUpdate',	'messageservice',	'',	'\\Bitrix\\MessageService\\RestService',	'onRestAppUpdate',	'',	1,	'7e77b4d550c200a4ec06872af7857ee6'),
(170,	'2024-06-16 13:27:48',	100,	'perfmon',	'OnGetTableSchema',	'perfmon',	'',	'perfmon',	'OnGetTableSchema',	'',	1,	'3a4da255b44f05899b64e66a40c12662'),
(171,	'2024-06-16 13:27:49',	49,	'main',	'OnBeforeProlog',	'rest',	'',	'CRestEventHandlers',	'OnBeforeProlog',	'',	2,	'395c9c42c3cc9392de1e5887617afe6d'),
(172,	'2024-06-16 13:27:49',	100,	'rest',	'OnRestServiceBuildDescription',	'rest',	'',	'CBitrixRestEntity',	'OnRestServiceBuildDescription',	'',	2,	'f63068b1eb62c36219518206e1e2827c'),
(173,	'2024-06-16 13:27:49',	100,	'rest',	'OnRestServiceBuildDescription',	'rest',	'',	'\\Bitrix\\Rest\\Api\\User',	'onRestServiceBuildDescription',	'',	2,	'c9a03e9019564649e55f5409b661e050'),
(174,	'2024-06-16 13:27:49',	100,	'rest',	'OnRestServiceBuildDescription',	'rest',	'',	'\\Bitrix\\Rest\\Api\\Placement',	'onRestServiceBuildDescription',	'',	2,	'9751a266c2b6f6be5c34b1541bf7c194'),
(175,	'2024-06-16 13:27:49',	100,	'rest',	'OnRestServiceBuildDescription',	'rest',	'',	'\\Bitrix\\Rest\\Api\\Event',	'onRestServiceBuildDescription',	'',	2,	'842ad63f19aff6d810059c7e56739aae'),
(176,	'2024-06-16 13:27:49',	100,	'rest',	'OnRestServiceBuildDescription',	'rest',	'',	'\\Bitrix\\Rest\\Api\\UserFieldType',	'onRestServiceBuildDescription',	'',	2,	'4caf68a5256aabe4abef37f24562e59b'),
(177,	'2024-06-16 13:27:49',	100,	'rest',	'onFindMethodDescription',	'rest',	'',	'\\Bitrix\\Rest\\Engine\\RestManager',	'onFindMethodDescription',	'',	2,	'4d0614f880674af333326dd5ba9b2828'),
(178,	'2024-06-16 13:27:49',	100,	'main',	'OnApplicationsBuildList',	'main',	'modules/rest/lib/apauth/application.php',	'\\Bitrix\\Rest\\APAuth\\Application',	'onApplicationsBuildList',	'',	2,	'9c39129872987f8dcc8baacc0c446ed7'),
(179,	'2024-06-16 13:27:49',	100,	'im',	'OnAfterConfirmNotify',	'rest',	'',	'\\Bitrix\\Rest\\NotifyIm',	'receive',	'',	2,	'2ac9c19fe69d4e106deaa6f4a7a4371b'),
(180,	'2024-06-16 13:27:49',	100,	'rest',	'\\Bitrix\\Rest\\APAuth\\Password::OnDelete',	'rest',	'',	'\\Bitrix\\Rest\\APAuth\\PermissionTable',	'onPasswordDelete',	'',	2,	'f04447ca635f045ec1a64e593964fc90'),
(181,	'2024-06-16 13:27:49',	100,	'perfmon',	'OnGetTableSchema',	'rest',	'',	'rest',	'OnGetTableSchema',	'',	2,	'47a76003c8f9f2d8c820f446e084ff39'),
(182,	'2024-06-16 13:27:49',	100,	'rest',	'OnRestApplicationConfigurationImport',	'rest',	'',	'\\Bitrix\\Rest\\Configuration\\AppConfiguration',	'onEventImportController',	'',	2,	'3fc1dd7e523b33f9d76c19e54d45c2fb'),
(183,	'2024-06-16 13:27:49',	100,	'rest',	'OnRestApplicationConfigurationExport',	'rest',	'',	'\\Bitrix\\Rest\\Configuration\\AppConfiguration',	'onEventExportController',	'',	2,	'b90a349060c693506b740c4d36f75f5f'),
(184,	'2024-06-16 13:27:49',	100,	'rest',	'OnRestApplicationConfigurationClear',	'rest',	'',	'\\Bitrix\\Rest\\Configuration\\AppConfiguration',	'onEventClearController',	'',	2,	'75dccda637a740c033b2d014a84a8009'),
(185,	'2024-06-16 13:27:49',	100,	'rest',	'OnRestApplicationConfigurationEntity',	'rest',	'',	'\\Bitrix\\Rest\\Configuration\\AppConfiguration',	'getEntityList',	'',	2,	'8d83d219eaf2f415d55fb67e221b7c3d'),
(186,	'2024-06-16 13:27:49',	100,	'rest',	'OnRestApplicationConfigurationGetManifest',	'rest',	'',	'\\Bitrix\\Rest\\Configuration\\AppConfiguration',	'getManifestList',	'',	2,	'6ba35b1f4b01d1e358e1b3a79ac437d6'),
(187,	'2024-06-16 13:27:49',	100,	'main',	'OnAfterSetOption_~mp24_paid_date',	'rest',	'',	'\\Bitrix\\Rest\\Marketplace\\Client',	'onChangeSubscriptionDate',	'',	2,	'b6ab5bafe2befd82726761f5a8b38a0b'),
(188,	'2024-06-16 13:27:49',	100,	'rest',	'onRestCheckAuth',	'rest',	'',	'\\Bitrix\\Rest\\OAuth\\Auth',	'onRestCheckAuth',	'',	2,	'70e923729089b8cba69bb3b4311da11e'),
(189,	'2024-06-16 13:27:49',	100,	'rest',	'onRestCheckAuth',	'rest',	'',	'\\Bitrix\\Rest\\APAuth\\Auth',	'onRestCheckAuth',	'',	2,	'3550e6c95772564101770e0c9cb54470'),
(190,	'2024-06-16 13:27:49',	100,	'rest',	'onRestCheckAuth',	'rest',	'',	'\\Bitrix\\Rest\\SessionAuth\\Auth',	'onRestCheckAuth',	'',	2,	'8e33ae5a47b59d21df7d26f916d19e38'),
(191,	'2024-06-16 13:27:49',	100,	'main',	'OnAfterRegisterModule',	'rest',	'',	'\\Bitrix\\Rest\\Engine\\ScopeManager',	'onChangeRegisterModule',	'',	2,	'900fb8bbf0d59d1924bedae5da1b6eb1'),
(192,	'2024-06-16 13:27:49',	100,	'main',	'OnAfterUnRegisterModule',	'rest',	'',	'\\Bitrix\\Rest\\Engine\\ScopeManager',	'onChangeRegisterModule',	'',	2,	'e97e569fe3fc7775aa4ece09cdf209bc'),
(193,	'2024-06-16 13:27:49',	100,	'main',	'OnAfterRegisterModule',	'rest',	'',	'\\Bitrix\\Rest\\Marketplace\\TagTable',	'onAfterRegisterModule',	'',	2,	'80afec537db1eeda99462f0676dbb835'),
(194,	'2024-06-16 13:27:49',	100,	'main',	'OnAfterUnRegisterModule',	'rest',	'',	'\\Bitrix\\Rest\\Marketplace\\TagTable',	'onAfterUnRegisterModule',	'',	2,	'fe9cb5af7e8ca277ca29b4a5423bd08b'),
(195,	'2024-06-16 13:27:50',	100,	'main',	'OnChangePermissions',	'search',	'',	'CSearch',	'OnChangeFilePermissions',	'',	1,	'1c37aedc2ec89f94624291d097fe7adf'),
(196,	'2024-06-16 13:27:50',	100,	'main',	'OnChangeFile',	'search',	'',	'CSearch',	'OnChangeFile',	'',	1,	'd51170fc3433fde7eab8edc1c2b933a0'),
(197,	'2024-06-16 13:27:50',	100,	'main',	'OnGroupDelete',	'search',	'',	'CSearch',	'OnGroupDelete',	'',	1,	'05382d7448b1ba259b89bf9e87e4eb44'),
(198,	'2024-06-16 13:27:50',	100,	'main',	'OnLangDelete',	'search',	'',	'CSearch',	'OnLangDelete',	'',	1,	'15ebda82514af5a966b3466cd26992a4'),
(199,	'2024-06-16 13:27:50',	100,	'main',	'OnAfterUserUpdate',	'search',	'',	'CSearchUser',	'OnAfterUserUpdate',	'',	1,	'9e0cea5039973193afc706ec8978d674'),
(200,	'2024-06-16 13:27:50',	100,	'main',	'OnUserDelete',	'search',	'',	'CSearchUser',	'DeleteByUserID',	'',	1,	'524a910f381ba144bf50caa152222ed6'),
(201,	'2024-06-16 13:27:50',	100,	'cluster',	'OnGetTableList',	'search',	'',	'search',	'OnGetTableList',	'',	1,	'a40ffd36df151e2c0294b5639e81d665'),
(202,	'2024-06-16 13:27:50',	100,	'perfmon',	'OnGetTableSchema',	'search',	'',	'search',	'OnGetTableSchema',	'',	1,	'9c8df2577e0cb80c68afa2030e193efb'),
(203,	'2024-06-16 13:27:50',	90,	'main',	'OnEpilog',	'search',	'',	'CSearchStatistic',	'OnEpilog',	'',	1,	'6b3591ad78ac2a3ce6ad411f0aff47fe'),
(204,	'2024-06-16 13:27:51',	100,	'main',	'OnPanelCreate',	'seo',	'',	'CSeoEventHandlers',	'SeoOnPanelCreate',	'',	2,	'79688b0b4a106b805d09e63ffe88f580'),
(205,	'2024-06-16 13:27:51',	100,	'fileman',	'OnIncludeHTMLEditorScript',	'seo',	'',	'CSeoEventHandlers',	'OnIncludeHTMLEditorScript',	'',	2,	'7995eac5813e40f6b3e82b146631397e'),
(206,	'2024-06-16 13:27:51',	100,	'fileman',	'OnBeforeHTMLEditorScriptRuns',	'seo',	'',	'CSeoEventHandlers',	'OnBeforeHTMLEditorScriptRuns',	'',	2,	'313b34609f1fa34d34cde1c2103c09ff'),
(207,	'2024-06-16 13:27:51',	100,	'iblock',	'OnAfterIBlockSectionAdd',	'seo',	'',	'\\Bitrix\\Seo\\SitemapIblock',	'addSection',	'',	2,	'c61de21b0b0873525fa5c39427324664'),
(208,	'2024-06-16 13:27:51',	100,	'iblock',	'OnAfterIBlockElementAdd',	'seo',	'',	'\\Bitrix\\Seo\\SitemapIblock',	'addElement',	'',	2,	'1b167ab85d6d744bba456e559546f13e'),
(209,	'2024-06-16 13:27:51',	100,	'iblock',	'OnBeforeIBlockSectionDelete',	'seo',	'',	'\\Bitrix\\Seo\\SitemapIblock',	'beforeDeleteSection',	'',	2,	'148ce014df9dd9f99f17ebfc5d766e8a'),
(210,	'2024-06-16 13:27:51',	100,	'iblock',	'OnBeforeIBlockElementDelete',	'seo',	'',	'\\Bitrix\\Seo\\SitemapIblock',	'beforeDeleteElement',	'',	2,	'4b1e9896d9f0aa37a7039a321f25f9a5'),
(211,	'2024-06-16 13:27:51',	100,	'iblock',	'OnAfterIBlockSectionDelete',	'seo',	'',	'\\Bitrix\\Seo\\SitemapIblock',	'deleteSection',	'',	2,	'b699c1c0d6665f9cffe7ff76ab108a24'),
(212,	'2024-06-16 13:27:51',	100,	'iblock',	'OnAfterIBlockElementDelete',	'seo',	'',	'\\Bitrix\\Seo\\SitemapIblock',	'deleteElement',	'',	2,	'ff3a36654015c53890f4cf2204b030c4'),
(213,	'2024-06-16 13:27:51',	100,	'iblock',	'OnBeforeIBlockSectionUpdate',	'seo',	'',	'\\Bitrix\\Seo\\SitemapIblock',	'beforeUpdateSection',	'',	2,	'aa5f8c360ed88eb5e2884c57b6f1f2f3'),
(214,	'2024-06-16 13:27:51',	100,	'iblock',	'OnBeforeIBlockElementUpdate',	'seo',	'',	'\\Bitrix\\Seo\\SitemapIblock',	'beforeUpdateElement',	'',	2,	'a1022e0619263c0e91139fb3f9837085'),
(215,	'2024-06-16 13:27:51',	100,	'iblock',	'OnAfterIBlockSectionUpdate',	'seo',	'',	'\\Bitrix\\Seo\\SitemapIblock',	'updateSection',	'',	2,	'27930cffcd40b84666d0a22e1a953c41'),
(216,	'2024-06-16 13:27:51',	100,	'iblock',	'OnAfterIBlockElementUpdate',	'seo',	'',	'\\Bitrix\\Seo\\SitemapIblock',	'updateElement',	'',	2,	'f0151e07363564774d45acba4100aebe'),
(217,	'2024-06-16 13:27:51',	100,	'forum',	'onAfterTopicAdd',	'seo',	'',	'\\Bitrix\\Seo\\SitemapForum',	'addTopic',	'',	2,	'd4d54756116942c9ee0bda9b31e9d0e7'),
(218,	'2024-06-16 13:27:51',	100,	'forum',	'onAfterTopicUpdate',	'seo',	'',	'\\Bitrix\\Seo\\SitemapForum',	'updateTopic',	'',	2,	'3e0a8569016a4c941f3eb4aa9fca6e8b'),
(219,	'2024-06-16 13:27:51',	100,	'forum',	'onAfterTopicDelete',	'seo',	'',	'\\Bitrix\\Seo\\SitemapForum',	'deleteTopic',	'',	2,	'7f4379c818231561b41589d3de41e36b'),
(220,	'2024-06-16 13:27:51',	100,	'main',	'OnAdminIBlockElementEdit',	'seo',	'',	'\\Bitrix\\Seo\\AdvTabEngine',	'eventHandler',	'',	2,	'c894d167ef03c35375b8eb8f2551a798'),
(221,	'2024-06-16 13:27:51',	100,	'main',	'OnBeforeProlog',	'seo',	'',	'\\Bitrix\\Seo\\AdvSession',	'checkSession',	'',	2,	'5fdf8dd9fd70719e442efcb589175bf0'),
(222,	'2024-06-16 13:27:51',	100,	'sale',	'OnOrderSave',	'seo',	'',	'\\Bitrix\\Seo\\AdvSession',	'onOrderSave',	'',	2,	'07d4ab0b1aa0aa130a0cbc06403f6eae'),
(223,	'2024-06-16 13:27:51',	100,	'sale',	'OnBasketOrder',	'seo',	'',	'\\Bitrix\\Seo\\AdvSession',	'onBasketOrder',	'',	2,	'cf6298b090e92e955b32c358c1d14b25'),
(224,	'2024-06-16 13:27:51',	100,	'sale',	'onSalePayOrder',	'seo',	'',	'\\Bitrix\\Seo\\AdvSession',	'onSalePayOrder',	'',	2,	'745afed820778e33d5cd3e91cbd622f1'),
(225,	'2024-06-16 13:27:51',	100,	'sale',	'onSaleDeductOrder',	'seo',	'',	'\\Bitrix\\Seo\\AdvSession',	'onSaleDeductOrder',	'',	2,	'12861bd5c6c27ffa2abe5cac90ea58d8'),
(226,	'2024-06-16 13:27:51',	100,	'sale',	'onSaleDeliveryOrder',	'seo',	'',	'\\Bitrix\\Seo\\AdvSession',	'onSaleDeliveryOrder',	'',	2,	'ead8fb64fece572d1fabd3d6fd27af27'),
(227,	'2024-06-16 13:27:51',	100,	'sale',	'onSaleStatusOrder',	'seo',	'',	'\\Bitrix\\Seo\\AdvSession',	'onSaleStatusOrder',	'',	2,	'b7b9ac4bbf458d433e1cf3835ff4cb6c'),
(228,	'2024-06-16 13:27:51',	100,	'conversion',	'OnSetDayContextAttributes',	'seo',	'',	'\\Bitrix\\Seo\\ConversionHandler',	'onSetDayContextAttributes',	'',	2,	'c19eb7659342fabc34b953f69e8b9eee'),
(229,	'2024-06-16 13:27:51',	100,	'conversion',	'OnGetAttributeTypes',	'seo',	'',	'\\Bitrix\\Seo\\ConversionHandler',	'onGetAttributeTypes',	'',	2,	'379294eefad289e474bf0c5ce2a281d8'),
(230,	'2024-06-16 13:27:51',	100,	'catalog',	'OnProductUpdate',	'seo',	'',	'\\Bitrix\\Seo\\Adv\\Auto',	'checkQuantity',	'',	2,	'0f4deda4d57adb4389d85a19e5bbcf2b'),
(231,	'2024-06-16 13:27:51',	100,	'catalog',	'OnProductSetAvailableUpdate',	'seo',	'',	'\\Bitrix\\Seo\\Adv\\Auto',	'checkQuantity',	'',	2,	'3d040ae51f0f6a4b2a08be0e6e1494d4'),
(232,	'2024-06-16 13:27:51',	100,	'bitrix24',	'onDomainChange',	'seo',	'',	'\\Bitrix\\Seo\\Service',	'changeRegisteredDomain',	'',	2,	'fcb2dadb8b7ff1863c0ad86320e9e521'),
(233,	'2024-06-16 13:27:52',	100,	'main',	'OnUserDelete',	'socialservices',	'',	'CSocServAuthDB',	'OnUserDelete',	'',	1,	'1f5b8fc024dfdf83952d6c723466cdf5'),
(234,	'2024-06-16 13:27:52',	100,	'main',	'OnAfterUserLogout',	'socialservices',	'',	'CSocServEventHandlers',	'OnUserLogout',	'',	1,	'7e4c40a3ff7cd102879cef10653f97ac'),
(235,	'2024-06-16 13:27:52',	100,	'timeman',	'OnAfterTMReportDailyAdd',	'socialservices',	'',	'CSocServAuthDB',	'OnAfterTMReportDailyAdd',	'',	1,	'a16159f6a90f1b67cb9ec15b0c1bab3a'),
(236,	'2024-06-16 13:27:52',	100,	'timeman',	'OnAfterTMDayStart',	'socialservices',	'',	'CSocServAuthDB',	'OnAfterTMDayStart',	'',	1,	'9567feb38890d6581a3204dc5e65e8b6'),
(237,	'2024-06-16 13:27:52',	100,	'timeman',	'OnTimeManShow',	'socialservices',	'',	'CSocServEventHandlers',	'OnTimeManShow',	'',	1,	'b728f3cea11d374f7638c29f84e8e15e'),
(238,	'2024-06-16 13:27:52',	100,	'main',	'OnFindExternalUser',	'socialservices',	'',	'CSocServAuthDB',	'OnFindExternalUser',	'',	1,	'1ab251d15efc87c5b5cfe6396f5dec1b'),
(239,	'2024-06-16 13:27:52',	100,	'perfmon',	'OnGetTableSchema',	'socialservices',	'',	'socialservices',	'OnGetTableSchema',	'',	1,	'56107bf1a0dcee0db660c0ec27c31c6c'),
(240,	'2024-06-16 13:27:52',	100,	'socialservices',	'OnFindSocialservicesUser',	'socialservices',	'',	'CSocServAuthManager',	'checkOldUser',	'',	1,	'c3d7460e4ef694f5bc53b6a6ad902407'),
(241,	'2024-06-16 13:27:52',	100,	'socialservices',	'OnFindSocialservicesUser',	'socialservices',	'',	'CSocServAuthManager',	'checkAbandonedUser',	'',	1,	'331f99f0b265544c33777c299eab16f6'),
(242,	'2024-06-16 13:27:53',	100,	'main',	'OnPanelCreate',	'translate',	'',	'\\Bitrix\\Translate\\Ui\\Panel',	'onPanelCreate',	'',	1,	'88ecb95eac2e28b80f234bfc8c1cd597'),
(243,	'2024-06-16 13:27:53',	100,	'perfmon',	'OnGetTableSchema',	'translate',	'',	'translate',	'onGetTableSchema',	'',	1,	'00347f45b2f48480b1a521c32036beb5'),
(246,	'2024-06-16 13:27:54',	100,	'main',	'OnUserDelete',	'ui',	'',	'\\Bitrix\\UI\\Integration\\Main\\User',	'onDelete',	'',	2,	'5e748ff204d0dac471be127b136eeb1d'),
(247,	'2024-06-16 13:27:54',	100,	'main',	'OnFileDelete',	'ui',	'',	'\\Bitrix\\UI\\Avatar\\Mask\\Item',	'onFileDelete',	'',	2,	'bdf678d45b7e9f3ce906099a5e4fc975'),
(248,	'2024-06-16 13:27:54',	100,	'rest',	'onRestAppDelete',	'ui',	'',	'\\Bitrix\\UI\\Integration\\Rest\\App',	'onRestAppDelete',	'',	2,	'b213605cfa38675d5e4b60f257f6acce'),
(249,	'2024-06-16 13:27:54',	100,	'rest',	'OnRestAppInstall',	'ui',	'',	'\\Bitrix\\UI\\Integration\\Rest\\App',	'OnRestAppInstall',	'',	2,	'206ce4eafe25cc4b5fbaddfa36eaba47'),
(250,	'2024-06-16 13:27:54',	100,	'rest',	'onRestApplicationConfigurationGetManifest',	'ui',	'',	'\\Bitrix\\UI\\Integration\\Rest\\MaskManifest',	'onRestApplicationConfigurationGetManifest',	'',	2,	'daad84620a1a84daef4884f1162e2099'),
(251,	'2024-06-16 13:27:54',	100,	'rest',	'onRestApplicationConfigurationGetManifestSetting',	'ui',	'',	'\\Bitrix\\UI\\Integration\\Rest\\MaskManifest',	'onRestApplicationConfigurationGetManifestSetting',	'',	2,	'b3290d964ad532e24a892bae6001146c'),
(252,	'2024-06-16 13:27:54',	100,	'rest',	'onRestApplicationConfigurationExport',	'ui',	'',	'\\Bitrix\\UI\\Integration\\Rest\\MaskManifest',	'onRestApplicationConfigurationExport',	'',	2,	'ac9b60f1d69d98c3980413800a3524f7'),
(253,	'2024-06-16 13:27:54',	100,	'rest',	'onRestApplicationConfigurationEntity',	'ui',	'',	'\\Bitrix\\UI\\Integration\\Rest\\MaskManifest',	'onRestApplicationConfigurationEntity',	'',	2,	'8d609b415b9bfa097d137ab69ba6903f'),
(254,	'2024-06-16 13:27:54',	100,	'rest',	'onRestApplicationConfigurationImport',	'ui',	'',	'\\Bitrix\\UI\\Integration\\Rest\\MaskManifest',	'onRestApplicationConfigurationImport',	'',	2,	'b1a5ce1bd868f8c86462c5b60eec1307'),
(255,	'2024-06-16 13:28:44',	100,	'main',	'OnBeforeProlog',	'main',	'/modules/main/install/wizard_sol/panel_button.php',	'CWizardSolPanel',	'ShowPanel',	'',	1,	'bbd7b8c1e518a0b3eae815eb91a95c11');

DROP TABLE IF EXISTS `b_numerator`;
CREATE TABLE `b_numerator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_numerator_code` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_numerator_sequence`;
CREATE TABLE `b_numerator_sequence` (
  `NUMERATOR_ID` int(11) NOT NULL DEFAULT '0',
  `KEY` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NEXT_NUMBER` int(11) DEFAULT NULL,
  `LAST_INVOCATION_TIME` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUMERATOR_ID`,`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_operation`;
CREATE TABLE `b_operation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
(1,	'edit_php',	'main',	NULL,	'module'),
(2,	'view_own_profile',	'main',	NULL,	'module'),
(3,	'edit_own_profile',	'main',	NULL,	'module'),
(4,	'view_all_users',	'main',	NULL,	'module'),
(5,	'view_groups',	'main',	NULL,	'module'),
(6,	'view_tasks',	'main',	NULL,	'module'),
(7,	'view_other_settings',	'main',	NULL,	'module'),
(8,	'view_subordinate_users',	'main',	NULL,	'module'),
(9,	'edit_subordinate_users',	'main',	NULL,	'module'),
(10,	'edit_all_users',	'main',	NULL,	'module'),
(11,	'edit_groups',	'main',	NULL,	'module'),
(12,	'edit_tasks',	'main',	NULL,	'module'),
(13,	'edit_other_settings',	'main',	NULL,	'module'),
(14,	'cache_control',	'main',	NULL,	'module'),
(15,	'lpa_template_edit',	'main',	NULL,	'module'),
(16,	'view_event_log',	'main',	NULL,	'module'),
(17,	'edit_ratings',	'main',	NULL,	'module'),
(18,	'manage_short_uri',	'main',	NULL,	'module'),
(19,	'fm_view_permission',	'main',	NULL,	'file'),
(20,	'fm_view_file',	'main',	NULL,	'file'),
(21,	'fm_view_listing',	'main',	NULL,	'file'),
(22,	'fm_edit_existent_folder',	'main',	NULL,	'file'),
(23,	'fm_create_new_file',	'main',	NULL,	'file'),
(24,	'fm_edit_existent_file',	'main',	NULL,	'file'),
(25,	'fm_create_new_folder',	'main',	NULL,	'file'),
(26,	'fm_delete_file',	'main',	NULL,	'file'),
(27,	'fm_delete_folder',	'main',	NULL,	'file'),
(28,	'fm_edit_in_workflow',	'main',	NULL,	'file'),
(29,	'fm_rename_file',	'main',	NULL,	'file'),
(30,	'fm_rename_folder',	'main',	NULL,	'file'),
(31,	'fm_upload_file',	'main',	NULL,	'file'),
(32,	'fm_add_to_menu',	'main',	NULL,	'file'),
(33,	'fm_download_file',	'main',	NULL,	'file'),
(34,	'fm_lpa',	'main',	NULL,	'file'),
(35,	'fm_edit_permission',	'main',	NULL,	'file'),
(36,	'bitrixcloud_monitoring',	'bitrixcloud',	NULL,	'module'),
(37,	'bitrixcloud_backup',	'bitrixcloud',	NULL,	'module'),
(38,	'clouds_browse',	'clouds',	NULL,	'module'),
(39,	'clouds_upload',	'clouds',	NULL,	'module'),
(40,	'clouds_config',	'clouds',	NULL,	'module'),
(41,	'fileman_view_all_settings',	'fileman',	'',	'module'),
(42,	'fileman_edit_menu_types',	'fileman',	'',	'module'),
(43,	'fileman_add_element_to_menu',	'fileman',	'',	'module'),
(44,	'fileman_edit_menu_elements',	'fileman',	'',	'module'),
(45,	'fileman_edit_existent_files',	'fileman',	'',	'module'),
(46,	'fileman_edit_existent_folders',	'fileman',	'',	'module'),
(47,	'fileman_admin_files',	'fileman',	'',	'module'),
(48,	'fileman_admin_folders',	'fileman',	'',	'module'),
(49,	'fileman_view_permissions',	'fileman',	'',	'module'),
(50,	'fileman_edit_all_settings',	'fileman',	'',	'module'),
(51,	'fileman_upload_files',	'fileman',	'',	'module'),
(52,	'fileman_view_file_structure',	'fileman',	'',	'module'),
(53,	'fileman_install_control',	'fileman',	'',	'module'),
(54,	'medialib_view_collection',	'fileman',	'',	'medialib'),
(55,	'medialib_new_collection',	'fileman',	'',	'medialib'),
(56,	'medialib_edit_collection',	'fileman',	'',	'medialib'),
(57,	'medialib_del_collection',	'fileman',	'',	'medialib'),
(58,	'medialib_access',	'fileman',	'',	'medialib'),
(59,	'medialib_new_item',	'fileman',	'',	'medialib'),
(60,	'medialib_edit_item',	'fileman',	'',	'medialib'),
(61,	'medialib_del_item',	'fileman',	'',	'medialib'),
(62,	'sticker_view',	'fileman',	'',	'stickers'),
(63,	'sticker_edit',	'fileman',	'',	'stickers'),
(64,	'sticker_new',	'fileman',	'',	'stickers'),
(65,	'sticker_del',	'fileman',	'',	'stickers'),
(66,	'hl_element_read',	'highloadblock',	NULL,	'module'),
(67,	'hl_element_write',	'highloadblock',	NULL,	'module'),
(68,	'hl_element_delete',	'highloadblock',	NULL,	'module'),
(69,	'section_read',	'iblock',	NULL,	'iblock'),
(70,	'element_read',	'iblock',	NULL,	'iblock'),
(71,	'section_element_bind',	'iblock',	NULL,	'iblock'),
(72,	'iblock_admin_display',	'iblock',	NULL,	'iblock'),
(73,	'element_edit',	'iblock',	NULL,	'iblock'),
(74,	'element_edit_price',	'iblock',	NULL,	'iblock'),
(75,	'element_delete',	'iblock',	NULL,	'iblock'),
(76,	'element_bizproc_start',	'iblock',	NULL,	'iblock'),
(77,	'section_edit',	'iblock',	NULL,	'iblock'),
(78,	'section_delete',	'iblock',	NULL,	'iblock'),
(79,	'section_section_bind',	'iblock',	NULL,	'iblock'),
(80,	'element_edit_any_wf_status',	'iblock',	NULL,	'iblock'),
(81,	'iblock_edit',	'iblock',	NULL,	'iblock'),
(82,	'iblock_delete',	'iblock',	NULL,	'iblock'),
(83,	'iblock_rights_edit',	'iblock',	NULL,	'iblock'),
(84,	'iblock_export',	'iblock',	NULL,	'iblock'),
(85,	'section_rights_edit',	'iblock',	NULL,	'iblock'),
(86,	'element_rights_edit',	'iblock',	NULL,	'iblock'),
(87,	'landing_read',	'landing',	NULL,	'module'),
(88,	'landing_edit',	'landing',	NULL,	'module'),
(89,	'landing_sett',	'landing',	NULL,	'module'),
(90,	'landing_public',	'landing',	NULL,	'module'),
(91,	'landing_delete',	'landing',	NULL,	'module'),
(92,	'seo_settings',	'seo',	'',	'module'),
(93,	'seo_tools',	'seo',	'',	'module');

DROP TABLE IF EXISTS `b_option`;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`,`NAME`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
('fileman',	'stickers_use_hotkeys',	'N',	NULL,	NULL),
('fileman',	'use_editor_3',	'Y',	NULL,	NULL),
('landing',	'pub_path_s1',	'/lp/',	NULL,	NULL),
('location',	'address_format_code',	'RU',	NULL,	NULL),
('main',	'~crypto_b_socialservices_user',	'a:2:{s:7:\"OATOKEN\";b:1;s:13:\"REFRESH_TOKEN\";b:1;}',	NULL,	NULL),
('main',	'~crypto_b_user_auth_code',	'a:1:{s:10:\"OTP_SECRET\";b:1;}',	NULL,	NULL),
('main',	'~crypto_b_user_phone_auth',	'a:1:{s:10:\"OTP_SECRET\";b:1;}',	NULL,	NULL),
('main',	'~new_license18_0_sign',	'Y',	NULL,	NULL),
('main',	'admin_lid',	'ru',	NULL,	NULL),
('main',	'admin_passwordh',	'FVkQf2YUBgUtCUVcAxcBCgsTAQ==',	NULL,	NULL),
('main',	'control_file_duplicates',	'Y',	NULL,	NULL),
('main',	'email_from',	'a.isaev@vladit.ru',	NULL,	NULL),
('main',	'GROUP_DEFAULT_TASK',	'1',	NULL,	NULL),
('main',	'last_mp_modules_result',	'a:4:{s:10:\"check_date\";i:1718544531;s:13:\"update_module\";a:0:{}s:10:\"end_update\";a:0:{}s:10:\"new_module\";a:0:{}}',	NULL,	NULL),
('main',	'optimize_css_files',	'Y',	NULL,	NULL),
('main',	'optimize_js_files',	'Y',	NULL,	NULL),
('main',	'PARAM_MAX_SITES',	'2',	NULL,	NULL),
('main',	'PARAM_MAX_USERS',	'0',	NULL,	NULL),
('main',	'rating_assign_authority_group',	'4',	NULL,	NULL),
('main',	'rating_assign_authority_group_add',	'2',	NULL,	NULL),
('main',	'rating_assign_authority_group_delete',	'2',	NULL,	NULL),
('main',	'rating_assign_rating_group',	'3',	NULL,	NULL),
('main',	'rating_assign_rating_group_add',	'1',	NULL,	NULL),
('main',	'rating_assign_rating_group_delete',	'1',	NULL,	NULL),
('main',	'rating_assign_type',	'auto',	NULL,	NULL),
('main',	'rating_authority_rating',	'2',	NULL,	NULL),
('main',	'rating_authority_weight_formula',	'Y',	NULL,	NULL),
('main',	'rating_community_authority',	'30',	NULL,	NULL),
('main',	'rating_community_last_visit',	'90',	NULL,	NULL),
('main',	'rating_community_size',	'1',	NULL,	NULL),
('main',	'rating_count_vote',	'10',	NULL,	NULL),
('main',	'rating_normalization',	'10',	NULL,	NULL),
('main',	'rating_normalization_type',	'auto',	NULL,	NULL),
('main',	'rating_self_vote',	'Y',	NULL,	NULL),
('main',	'rating_start_authority',	'3',	NULL,	NULL),
('main',	'rating_text_like_d',	'Это нравится',	NULL,	NULL),
('main',	'rating_text_like_n',	'Не нравится',	NULL,	NULL),
('main',	'rating_text_like_y',	'Нравится',	NULL,	NULL),
('main',	'rating_vote_show',	'Y',	NULL,	NULL),
('main',	'rating_vote_template',	'like',	NULL,	NULL),
('main',	'rating_vote_type',	'like',	NULL,	NULL),
('main',	'rating_vote_weight',	'10',	NULL,	NULL),
('main',	'secure_logout',	'Y',	NULL,	NULL),
('main',	'server_uniq_id',	'hmjb9besoeqriyzj5or4lrkh89r8xfhk',	NULL,	NULL),
('main',	'signer_default_key',	'53a413401a9e9b43227f7de08c65e085f40f9f205f0215c285c513b23ab3099d681ac48cf085a008327ec956cddd3aaa9f898bd038ff32162c2300071a3ea320',	NULL,	NULL),
('main',	'smile_last_update',	'1718544450',	NULL,	NULL),
('main',	'update_site',	'www.1c-bitrix.ru',	NULL,	NULL),
('main',	'update_site_ns',	'Y',	NULL,	NULL),
('main',	'vendor',	'1c_bitrix',	NULL,	NULL),
('messageservice',	'clean_up_period',	'14',	NULL,	NULL),
('perfmon',	'bitrix_optimal',	'N',	NULL,	NULL),
('perfmon',	'mark_db_insert_value',	'288',	NULL,	NULL),
('perfmon',	'mark_db_read_value',	'5 803',	NULL,	NULL),
('perfmon',	'mark_db_update_value',	'292',	NULL,	NULL),
('perfmon',	'mark_php_cpu_value',	'82.4',	NULL,	NULL),
('perfmon',	'mark_php_files_value',	'11 834.2',	NULL,	NULL),
('perfmon',	'mark_php_is_good',	'Y',	NULL,	NULL),
('perfmon',	'mark_php_mail_value',	'0.0155',	NULL,	NULL),
('perfmon',	'mark_php_page_date',	'16.06.2024 16:29:20',	NULL,	NULL),
('perfmon',	'mark_php_page_rate',	'68.97',	NULL,	NULL),
('perfmon',	'mark_php_page_time',	'0.0145',	NULL,	NULL),
('perfmon',	'mark_php_session_time_value',	'0.0001',	NULL,	NULL),
('rest',	'app_immune',	'[\"infoservice.migrator_amocrm\",\"informunity.excel\",\"integrations24ru.pipedrive\",\"integrations24ru.asana\",\"integrations24ru.sugar\",\"bitrix.eshop\",\"bitrix.1cdoc\",\"bitrix.assistant\",\"bitrix.denominationby\",\"bitrix.propertiesbot\",\"bitrix.giphybot\",\"bitrix.1c\",\"bitrix.restapi\",\"bitrix.partnerlandingexport\",\"bitrix.partnerapplication\",\"bitrix.partnerlanding\",\"bitrix.1ctotal\",\"integrations24.pipedrive\",\"integrations24ru.pipedrive\",\"integrations24.zoho\",\"integrations24.asana\",\"integrations24ru.asana\",\"integrations24.sugar\",\"integrations24ru.sugar\",\"integrations24.jira_migration\",\"integrations24.qbinventory\",\"integrations24.zohoinventory\",\"integrations24.trello\",\"integrations24ru.slack_migration\",\"SEVERCODE.trello_migrator\",\"htmls.ms_migrator\",\"integrations24.mns_kazakhstan_poisk_po_bin\",\"integrations24.portal_nalog_gov_by\",\"integrations24ru.microsoft_teams_migration\",\"bitrix.pbi_all\",\"bitrix.pbi_company\",\"bitrix.pbi_company_uf\",\"bitrix.pbi_contact\",\"bitrix.pbi_contact_uf\",\"bitrix.pbi_crm_activity\",\"bitrix.pbi_deal_product_row\",\"bitrix.pbi_deal_stage_history\",\"bitrix.pbi_deals_ru\",\"bitrix.pbi_lead\",\"bitrix.pbi_lead_product_row\",\"bitrix.pbi_lead_uf\",\"bitrix.pbi_leads_ru\",\"bitrix.pbi_socialnetwork_group\",\"bitrix.pbi_telephony\",\"bitrix.pbi_user\",\"bitrix.gds_all\",\"bitrix.gds_company\",\"bitrix.gds_company_uf\",\"bitrix.gds_contact\",\"bitrix.gds_contact_uf\",\"bitrix.gds_crm_activity\",\"bitrix.gds_deal_product_row\",\"bitrix.gds_deal_stage_history\",\"bitrix.gds_deals_ru\",\"bitrix.gds_lead\",\"bitrix.gds_lead_product_row\",\"bitrix.gds_lead_uf\",\"bitrix.gds_leads_ru\",\"bitrix.gds_socialnetwork_group\",\"bitrix.gds_telephony\",\"bitrix.gds_user\",\"bitrix.gds_activity\",\"bitrix.gds_deal_uf\",\"bitrix.gds_telephony_call\",\"itsolutionru.gptconnector\",\"asmo.ai\",\"bitrix.bic_datasets_en\",\"bitrix.bic_datasets_kz\",\"bitrix.bic_datasets_ru\",\"bitrix.bic_deals_en\",\"bitrix.bic_deals_kz\",\"bitrix.bic_deals_ru\",\"bitrix.bic_leads_en\",\"bitrix.bic_leads_kz\",\"bitrix.bic_leads_ru\",\"bitrix.bic_sales_en\",\"bitrix.bic_sales_kz\",\"bitrix.bic_sales_ru\",\"bitrix.bic_sales_struct_en\",\"bitrix.bic_sales_struct_kz\",\"bitrix.bic_sales_struct_ru\",\"bitrix.bic_telephony_en\",\"bitrix.bic_telephony_kz\",\"bitrix.bic_telephony_ru\",\"bitrix.bic_deals_complex\",\"bitrix.bic_general_stat\",\"bitrix.bic_lead_generation\",\"bitrix.kompleksnaya_analitika_sdelok\",\"integrations24.telegram_repost\",\"bitrix.bic_sales_struct_ru\",\"bitrix.bic_sales_ru\",\"bitrix.bic_leads_ru\",\"bitrix.bic_deals_ru\",\"bitrix.bic_datasets_ru\",\"bitrix.bic_datasets_en\",\"bitrix.bic_deals_en\",\"bitrix.bic_leads_en\",\"bitrix.bic_sales_en\",\"bitrix.bic_sales_struct_en\",\"bitrix.bic_datasets_kz\",\"bitrix.bic_deals_kz\",\"bitrix.bic_leads_kz\",\"bitrix.bic_sales_kz\",\"bitrix.bic_sales_struct_kz\",\"bitrix.bic_deals_complex\",\"bitrix.bic_general_stat\",\"bitrix.bic_lead_generation\",\"bitrix.bic_retention\",\"bitrix.bic_abcanalysis\",\"bitrix.bic_bizproc\",\"bitrix.bic_catdeal\",\"bitrix.bic_cohort\",\"bitrix.bic_abcsku\",\"bitrix.bic_telephony\",\"bitrix.khellouin_ru\",\"bitrix.den_zashchitnika_otechestva_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ua\",\"bitrix.den_smekha_ua\",\"bitrix.den_svyatogo_valentina_ua\",\"bitrix.den_vsekh_vlyublyennykh_ua\",\"bitrix.katolicheskaya_paskha_ua\",\"bitrix.novyy_god_ua\",\"bitrix.rozhdestvo_ua\",\"bitrix.valentinov_den_ua\",\"bitrix.pravoslavnaya_paskha_ua\",\"bitrix.chernaya_pyatnitsa_ua\",\"bitrix.khellouin_ua\",\"bitrix.den_zashchitnika_otechestva_3_ru\",\"bitrix.den_zashchitnika_otechestva_ru\",\"bitrix.den_zashchitnika_otechestva_by\",\"bitrix.den_zashchitnika_otechestva_2_by\",\"bitrix.den_zashchitnika_otechestva_3_by\",\"bitrix.den_zashchitnika_otechestva_kz\",\"bitrix.den_zashchitnika_otechestva_2_kz\",\"bitrix.den_zashchitnika_otechestva_3_kz\",\"bitrix.pravoslavnaya_paskha_ru\",\"bitrix.pravoslavnaya_paskha_by\",\"bitrix.pravoslavnaya_paskha_kz\",\"bitrix.den_smekha_ru\",\"bitrix.den_smekha_by\",\"bitrix.den_smekha_kz\",\"bitrix.valentinov_den_ru\",\"bitrix.valentinov_den_by\",\"bitrix.valentinov_den_kz\",\"bitrix.rozhdestvo_ru\",\"bitrix.rozhdestvo_by\",\"bitrix.rozhdestvo_kz\",\"bitrix.novyy_god_ru\",\"bitrix.novyy_god_by\",\"bitrix.novyy_god_kz\",\"bitrix.katolicheskaya_paskha_ru\",\"bitrix.katolicheskaya_paskha_by\",\"bitrix.katolicheskaya_paskha_kz\",\"bitrix.den_vsekh_vlyublyennykh_ru\",\"bitrix.den_vsekh_vlyublyennykh_by\",\"bitrix.den_vsekh_vlyublyennykh_kz\",\"bitrix.den_svyatogo_valentina_ru\",\"bitrix.den_svyatogo_valentina_by\",\"bitrix.den_svyatogo_valentina_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_kz\",\"bitrix.thanksgiving_day_en\",\"bitrix.april_fools_day_en\",\"bitrix.valentine_s_day_en\",\"bitrix.valentine_s_day_2_en\",\"bitrix.valentine_s_day_3_en\",\"bitrix.chernaya_pyatnitsa_ru\",\"bitrix.chernaya_pyatnitsa_by\",\"bitrix.chernaya_pyatnitsa_kz\",\"bitrix.khellouin_by\",\"bitrix.khellouin_kz\",\"bitrix.easter_en\",\"bitrix.halloween_en\",\"bitrix.christmas_en\",\"bitrix.new_year_en\",\"bitrix.black_friday_en\",\"bitrix.kraytvirtualtravel_ru\",\"bitrix.kraytvirtualtravel_by\",\"bitrix.kraytvirtualtravel_kz\",\"bitrix.kraytvirtualtravel_ua\",\"bitrix.kraytnutritionist_ru\",\"bitrix.kraytnutritionist_by\",\"bitrix.delobotcorporatetraining_en\",\"bitrix.delobotblackfriday_en\",\"bitrix.delobotcleaningcompany_en\",\"bitrix.delobotfitness_en\",\"bitrix.delobotfooddelivery_en\",\"bitrix.delobotvisagiste_en\",\"bitrix.delobotpsychologist_en\",\"bitrix.delobotflorist_en\",\"bitrix.delobotdecoration_en\",\"bitrix.delobotcarservice_en\",\"bitrix.kraytagency_en\",\"bitrix.kraytagriculture_en\",\"bitrix.kraytarchitecture_en\",\"bitrix.kraytbusiness_en\",\"bitrix.kraytdelivery_en\",\"bitrix.kraytevents_en\",\"bitrix.kraythalloween_en\",\"bitrix.kraytvetclinic_en\",\"bitrix.kraytmasterforhour_en\",\"bitrix.kraytinstagramcontacts_en\",\"bitrix.kraytinstagramstock_en\",\"bitrix.kraytinstagramtarget_en\",\"bitrix.kraytonlinebabysitter_en\",\"bitrix.kraytpetservice_en\",\"bitrix.kraytsolarenergy_en\",\"bitrix.kraytsportonline_en\",\"bitrix.kraytsummersale_en\",\"bitrix.krayttravelblog_en\",\"bitrix.kraytvebinar_en\",\"bitrix.kraytartificialintelligence_en\",\"bitrix.kraytbakeryproducts_en\",\"bitrix.kraytchildrensschool_en\",\"bitrix.kraytfooddelivery_en\",\"bitrix.kraytfurniture_en\",\"bitrix.kraytvirtualtravel_en\",\"bitrix.kraytyoutubechannel_en\",\"bitrix.kraytknitting_en\",\"bitrix.kraytnutritionist_en\",\"bitrix.kraytnailservice_en\",\"bitrix.kraytmedicine_en\",\"bitrix.kraytprofipage_en\",\"bitrix.kraytsale11_en\",\"bitrix.delobotblackfriday_ua\",\"bitrix.delobotcleaning_ua\",\"bitrix.delobotcorporatetraining_ua\",\"bitrix.delobotfitness_ua\",\"bitrix.delobotfooddelivery_ua\",\"bitrix.delobotvisagiste_ua\",\"bitrix.kraytagency_ua\",\"bitrix.kraytagriculture_ua\",\"bitrix.kraytarchitecture_ua\",\"bitrix.kraytbusiness_ua\",\"bitrix.kraytevents_ua\",\"bitrix.kraythalloween_ua\",\"bitrix.kraytinstagramcontacts_ua\",\"bitrix.kraytinstagramstock_ua\",\"bitrix.kraytinstagramtarget_ua\",\"bitrix.kraytpetservice_ua\",\"bitrix.kraytsolarenergy_ua\",\"bitrix.kraytsummersale_ua\",\"bitrix.krayttravelblog_ua\",\"bitrix.kraytvebinar_ua\",\"bitrix.kraytvetclinic_ua\",\"bitrix.kraytnutritionist_ua\",\"bitrix.kraytnutritionist_kz\",\"bitrix.kraytfurniture_by\",\"bitrix.kraytfurniture_ru\",\"bitrix.kraytfurniture_kz\",\"bitrix.kraytfurniture_ua\",\"bitrix.kraytmedicine_ru\",\"bitrix.kraytmedicine_by\",\"bitrix.kraytmedicine_kz\",\"bitrix.kraytmedicine_ua\",\"bitrix.kraytsale11_ru\",\"bitrix.kraytsale11_by\",\"bitrix.kraytsale11_kz\",\"bitrix.kraytsale11_ua\",\"bitrix.kraytnailservice_ru\",\"bitrix.kraytnailservice_by\",\"bitrix.kraytnailservice_kz\",\"bitrix.kraytnailservice_ua\",\"bitrix.kraytknitting_ru\",\"bitrix.kraytknitting_by\",\"bitrix.kraytknitting_kz\",\"bitrix.kraytknitting_ua\",\"bitrix.kraytfooddelivery_ru\",\"bitrix.kraytfooddelivery_by\",\"bitrix.kraytfooddelivery_kz\",\"bitrix.kraytfooddelivery_ua\",\"bitrix.kraytbakeryproducts_ru\",\"bitrix.kraytbakeryproducts_by\",\"bitrix.kraytbakeryproducts_kz\",\"bitrix.kraytbakeryproducts_ua\",\"bitrix.kraytschoolmusic_ru\",\"bitrix.kraytschoolmusic_by\",\"bitrix.kraytschoolmusic_kz\",\"bitrix.kraytschoolmusic_ua\",\"bitrix.kraytautomechanic_ru\",\"bitrix.kraytautomechanic_by\",\"bitrix.kraytautomechanic_kz\",\"bitrix.kraytautomechanic_ua\",\"bitrix.kraytpresents_ru\",\"bitrix.kraytpresents_by\",\"bitrix.kraytpresents_kz\",\"bitrix.kraytpresents_ua\",\"bitrix.kraytportfoliophotographer_ru\",\"bitrix.kraytportfoliophotographer_by\",\"bitrix.kraytportfoliophotographer_kz\",\"bitrix.kraytportfoliophotographer_ua\",\"bitrix.kraytcrm_ru\",\"bitrix.delobotcleaningcompany_ru\",\"bitrix.delobotblackfriday_ru\",\"bitrix.delobotblackfriday_by\",\"bitrix.delobotblackfriday_kz\",\"bitrix.delobotcleaningcompany_by\",\"bitrix.delobotcleaningcompany_kz\",\"bitrix.delobotcorporatetraining_ru\",\"bitrix.delobotcorporatetraining_by\",\"bitrix.delobotcorporatetraining_kz\",\"bitrix.delobotfitness_ru\",\"bitrix.delobotfitness_by\",\"bitrix.delobotfitness_kz\",\"bitrix.delobotfooddelivery_ru\",\"bitrix.delobotfooddelivery_by\",\"bitrix.delobotfooddelivery_kz\",\"bitrix.delobotvisagiste_ru\",\"bitrix.delobotvisagiste_by\",\"bitrix.delobotvisagiste_kz\",\"bitrix.delobotgiftsforwomensday_ru\",\"bitrix.delobotgiftsforwomensday_by\",\"bitrix.delobotgiftsforwomensday_kz\",\"bitrix.delobotgiftsforwomensday_ua\",\"bitrix.delobotwebdesigner_ru\",\"bitrix.delobotwebdesigner_by\",\"bitrix.delobotwebdesigner_kz\",\"bitrix.delobotwebdesigner_ua\",\"bitrix.delobotatelier_ru\",\"bitrix.delobotatelier_by\",\"bitrix.delobotatelier_kz\",\"bitrix.delobotatelier_ua\",\"bitrix.delobotconstructioncompany_ru\",\"bitrix.delobotconstructioncompany_by\",\"bitrix.delobotconstructioncompany_ua\",\"bitrix.delobotlanguageschool_ru\",\"bitrix.delobotlanguageschool_by\",\"bitrix.delobotlanguageschool_kz\",\"bitrix.delobotlanguageschool_ua\",\"bitrix.delobotcoffee_ru\",\"bitrix.delobotcoffee_by\",\"bitrix.delobotcoffee_kz\",\"bitrix.delobotcoffee_ua\",\"bitrix.kraytcrm_by\",\"bitrix.kraytcrm_kz\",\"bitrix.kraytcrm_ua\",\"bitrix.kraytonlinebabysitter_ru\",\"bitrix.kraytonlinebabysitter_by\",\"bitrix.kraytonlinebabysitter_kz\",\"bitrix.kraytonlinebabysitter_uaa\",\"bitrix.kraytsportonline_ru\",\"bitrix.kraytsportonline_by\",\"bitrix.kraytsportonline_kz\",\"bitrix.kraytsportonline_ua\",\"bitrix.kraytmasterforhour_ru\",\"bitrix.kraytmasterforhour_by\",\"bitrix.kraytmasterforhour_kz\",\"bitrix.kraytmasterforhour_ua\",\"bitrix.kraytdelivery_ru\",\"bitrix.kraytdelivery_by\",\"bitrix.kraytdelivery_kz\",\"bitrix.kraytdelivery_ua\",\"bitrix.kraytrepairservice_ru\",\"bitrix.kraytrepairservice_by\",\"bitrix.kraytrepairservice_kz\",\"bitrix.kraytrepairservice_ua\",\"bitrix.kraytprofipage_ru\",\"bitrix.kraytprofipage_by\",\"bitrix.kraytprofipage_kz\",\"bitrix.kraytprofipage_ua\",\"bitrix.krayttutor_ru\",\"bitrix.krayttutor_by\",\"bitrix.krayttutor_kz\",\"bitrix.krayttutor_ua\",\"bitrix.kraytartificialintelligence_ru\",\"bitrix.kraytartificialintelligence_by\",\"bitrix.kraytartificialintelligence_kz\",\"bitrix.kraytartificialintelligence_ua\",\"bitrix.kraytyoutubechannel_ru\",\"bitrix.kraytyoutubechannel_by\",\"bitrix.kraytyoutubechannel_kz\",\"bitrix.kraytyoutubechannel_ua\",\"bitrix.kraytchildrensschool_ru\",\"bitrix.kraytchildrensschool_by\",\"bitrix.kraytchildrensschool_kz\",\"bitrix.kraytchildrensschool_ua\",\"bitrix.krayttravelagency_ru\",\"bitrix.krayttravelagency_by\",\"bitrix.krayttravelagency_kz\",\"bitrix.krayttravelagency_ua\",\"bitrix.krayttranslator_ru\",\"bitrix.krayttranslator_by\",\"bitrix.krayttranslator_kz\",\"bitrix.krayttranslator_ua\",\"bitrix.kraytstylist_ru\",\"bitrix.kraytstylist_by\",\"bitrix.kraytstylist_kz\",\"bitrix.kraytstylist_ua\",\"bitrix.kraytstretchingstudio_ru\",\"bitrix.kraytstretchingstudio_by\",\"bitrix.kraytstretchingstudio_kz\",\"bitrix.kraytstretchingstudio_ua\",\"bitrix.kraytsportschool_ru\",\"bitrix.kraytsportschool_by\",\"bitrix.kraytsportschool_kz\",\"bitrix.kraytsportschool_ua\",\"bitrix.kraytsitedesigner_ru\",\"bitrix.kraytsitedesigner_by\",\"bitrix.kraytsitedesigner_kz\",\"bitrix.kraytsitedesigner_ua\",\"bitrix.kraytsport_ru\",\"bitrix.kraytsport_by\",\"bitrix.kraytsport_kz\",\"bitrix.kraytsport_ua\",\"bitrix.kraytmobileapp_ru\",\"bitrix.kraytmobileapp_by\",\"bitrix.kraytmobileapp_kz\",\"bitrix.kraytmobileapp_ua\",\"bitrix.kraytrealestate_ru\",\"bitrix.kraytrealestate_by\",\"bitrix.kraytrealestate_kz\",\"bitrix.kraytrealestate_ua\",\"bitrix.delobotnewyearsale_ru\",\"bitrix.delobotnewyearsale_by\",\"bitrix.delobotnewyearsale_kz\",\"bitrix.delobotnewyearsale_ua\",\"bitrix.delobotyoga_ru\",\"bitrix.delobotyoga_by\",\"bitrix.delobotyoga_kz\",\"bitrix.delobotyoga_ua\",\"bitrix.delobotcake_ru\",\"bitrix.delobotcake_by\",\"bitrix.delobotcake_kz\",\"bitrix.delobotcake_ua\",\"bitrix.delobotveterinarian_ru\",\"bitrix.delobotveterinarian_by\",\"bitrix.delobotveterinarian_kz\",\"bitrix.delobotveterinarian_ua\",\"bitrix.delobotpsychologist_ru\",\"bitrix.delobotpsychologist_by\",\"bitrix.delobotpsychologist_kz\",\"bitrix.delobotpsychologist_ua\",\"bitrix.delobotdecoration_ru\",\"bitrix.delobotdecoration_by\",\"bitrix.delobotdecoration_kz\",\"bitrix.delobotdecoration_ua\",\"bitrix.delobotflorist_ru\",\"bitrix.delobotflorist_by\",\"bitrix.delobotflorist_kz\",\"bitrix.delobotflorist_ua\",\"bitrix.delobotcarservice_ru\",\"bitrix.delobotcarservice_by\",\"bitrix.delobotcarservice_kz\",\"bitrix.delobotcarservice_ua\",\"bitrix.delobotcargotransportation_ru\",\"bitrix.delobotcargotransportation_by\",\"bitrix.delobotcargotransportation_kz\",\"bitrix.delobotcargotransportation_ua\",\"bitrix.delobotrealtor_ru\",\"bitrix.delobotrealtor_by\",\"bitrix.delobotrealtor_kz\",\"bitrix.delobotrealtor_ua\",\"bitrix.delobotfurnituremanufacturing_ru\",\"bitrix.delobotfurnituremanufacturing_by\",\"bitrix.delobotfurnituremanufacturing_kz\",\"bitrix.delobotfurnituremanufacturing_ua\",\"bitrix.delobotorganizationofholidays_ru\",\"bitrix.delobotorganizationofholidays_by\",\"bitrix.delobotorganizationofholidays_kz\",\"bitrix.delobotorganizationofholidays_ua\",\"bitrix.delobotconcertannounce_ru\",\"bitrix.delobotconcertannounce_by\",\"bitrix.delobotconcertannounce_kz\",\"bitrix.delobotconcertannounce_ua\",\"bitrix.delobotphotographersservice_ru\",\"bitrix.delobotphotographersservice_by\",\"bitrix.delobotphotographersservice_kz\",\"bitrix.delobotphotographersservice_ua\",\"bitrix.kraytsecurityagency_ru\",\"bitrix.kraytsecurityagency_by\",\"bitrix.kraytsecurityagency_kz\",\"bitrix.kraytsecurityagency_ua\",\"bitrix.kraytrecordingstudio_ru\",\"bitrix.kraytrecordingstudio_by\",\"bitrix.kraytrecordingstudio_kz\",\"bitrix.kraytrecordingstudio_ua\",\"bitrix.kraytrealestateagent_ru\",\"bitrix.kraytrealestateagent_by\",\"bitrix.kraytrealestateagent_kz\",\"bitrix.kraytrealestateagent_ua\",\"bitrix.delobotdecorationhouses_ru\",\"bitrix.delobotdecorationhouses_by\",\"bitrix.delobotdecorationhouses_kz\",\"bitrix.delobotdecorationhouses_ua\",\"bitrix.delobotairconditioners_ru\",\"bitrix.delobotairconditioners_by\",\"bitrix.delobotairconditioners_kz\",\"bitrix.delobotairconditioners_ua\",\"bitrix.delobotdesignworkshop_ru\",\"bitrix.delobotdesignworkshop_by\",\"bitrix.delobotdesignworkshop_kz\",\"bitrix.delobotdesignworkshop_ua\",\"bitrix.delobotcitygreeningproject_ru\",\"bitrix.delobotcitygreeningproject_by\",\"bitrix.delobotcitygreeningproject_kz\",\"bitrix.delobotcitygreeningproject_ua\",\"bitrix.delobotecoproducts_ru\",\"bitrix.delobotecoproducts_by\",\"bitrix.delobotecoproducts_kz\",\"bitrix.delobotecoproducts_ua\",\"bitrix.delobotsoundrecordingservices_ru\",\"bitrix.delobotsoundrecordingservices_by\",\"bitrix.delobotsoundrecordingservices_kz\",\"bitrix.delobotsoundrecordingservices_ua\",\"bitrix.delobotsecurityservice_ru\",\"bitrix.delobotsecurityservice_by\",\"bitrix.delobotsecurityservice_kz\",\"bitrix.delobotsecurityservice_ua\",\"bitrix.delobotsportschool_ru\",\"bitrix.delobotsportschool_by\",\"bitrix.delobotsportschool_kz\",\"bitrix.delobotsportschool_ua\",\"bitrix.delobotfamilyleisure_ru\",\"bitrix.delobotfamilyleisure_by\",\"bitrix.delobotfamilyleisure_kz\",\"bitrix.delobotfamilyleisure_ua\",\"bitrix.delobotdoctortherapist_ru\",\"bitrix.delobotdoctortherapist_by\",\"bitrix.delobotdoctortherapist_kz\",\"bitrix.delobotdoctortherapist_ua\",\"bitrix.kraytagency_ru\",\"bitrix.kraytagency_by\",\"bitrix.kraytagency_kz\",\"bitrix.kraytarchitecture_ru\",\"bitrix.kraytarchitecture_by\",\"bitrix.kraytarchitecture_kz\",\"bitrix.kraytagriculture_ru\",\"bitrix.kraytagriculture_by\",\"bitrix.kraytagriculture_kz\",\"bitrix.kraytbusiness_ru\",\"bitrix.kraytbusiness_by\",\"bitrix.kraytbusiness_kz\",\"bitrix.kraytevents_ru\",\"bitrix.kraytevents_by\",\"bitrix.kraytevents_kz\",\"bitrix.kraythalloween_ru\",\"bitrix.kraythalloween_by\",\"bitrix.kraythalloween_kz\",\"bitrix.kraytinstagramtarget_ru\",\"bitrix.kraytinstagramtarget_by\",\"bitrix.kraytinstagramtarget_kz\",\"bitrix.kraytinstagramcontacts_ru\",\"bitrix.kraytinstagramcontacts_by\",\"bitrix.kraytinstagramcontacts_kz\",\"bitrix.kraytinstagramstock_ru\",\"bitrix.kraytinstagramstock_by\",\"bitrix.kraytinstagramstock_kz\",\"bitrix.kraytpetservice_ru\",\"bitrix.kraytpetservice_by\",\"bitrix.kraytpetservice_kz\",\"bitrix.kraytsolarenergy_ru\",\"bitrix.kraytsolarenergy_by\",\"bitrix.kraytsolarenergy_kz\",\"bitrix.kraytsummersale_ru\",\"bitrix.kraytsummersale_by\",\"bitrix.kraytsummersale_kz\",\"bitrix.krayttravelblog_ru\",\"bitrix.krayttravelblog_by\",\"bitrix.krayttravelblog_kz\",\"bitrix.kraytvebinar_ru\",\"bitrix.kraytvebinar_by\",\"bitrix.kraytvebinar_kz\",\"bitrix.kraytvetclinic_ru\",\"bitrix.kraytvetclinic_by\",\"bitrix.kraytvetclinic_kz\",\"bitrix.kraytrestaurant_ru\",\"bitrix.kraytrestaurant_by\",\"bitrix.kraytrestaurant_kz\",\"bitrix.kraytrestaurant_ua\",\"bitrix.kraytweddingservices_ru\",\"bitrix.kraytweddingservices_by\",\"bitrix.kraytweddingservices_kz\",\"bitrix.kraytweddingservices_ua\",\"bitrix.kraytoptics_ru\",\"bitrix.kraytoptics_by\",\"bitrix.kraytoptics_kz\",\"bitrix.kraytoptics_ua\",\"bitrix.krayt3dprint_ru\",\"bitrix.krayt3dprint_by\",\"bitrix.krayt3dprint_kz\",\"bitrix.krayt3dprint_ua\",\"bitrix.kraytbusinesspremisesdesign_ru\",\"bitrix.kraytbusinesspremisesdesign_by\",\"bitrix.kraytbusinesspremisesdesign_kz\",\"bitrix.kraytbusinesspremisesdesign_ua\",\"bitrix.kraytcentersproject_ru\",\"bitrix.kraytcentersproject_by\",\"bitrix.kraytcentersproject_kz\",\"bitrix.kraytcentersproject_ua\",\"bitrix.kraytcitygreening_ru\",\"bitrix.kraytcitygreening_by\",\"bitrix.kraytcitygreening_kz\",\"bitrix.kraytcitygreening_ua\",\"bitrix.kraytclimatesystems_ru\",\"bitrix.kraytclimatesystems_by\",\"bitrix.kraytclimatesystems_kz\",\"bitrix.kraytclimatesystems_ua\",\"bitrix.kraytclinicmomandbaby_ru\",\"bitrix.kraytclinicmomandbaby_by\",\"bitrix.kraytclinicmomandbaby_kz\",\"bitrix.kraytclinicmomandbaby_ua\",\"bitrix.kraytdesignerclothing_ru\",\"bitrix.kraytdesignerclothing_by\",\"bitrix.kraytdesignerclothing_kz\",\"bitrix.kraytdesignerclothing_ua\",\"bitrix.kraytprivatedoctor_ru\",\"bitrix.kraytprivatedoctor_by\",\"bitrix.kraytprivatedoctor_kz\",\"bitrix.kraytprivatedoctor_ua\",\"bitrix.kraytprintinghouse_ru\",\"bitrix.kraytprintinghouse_by\",\"bitrix.kraytprintinghouse_kz\",\"bitrix.kraytprintinghouse_ua\",\"bitrix.kraytpersonalcoach_ru\",\"bitrix.kraytpersonalcoach_by\",\"bitrix.kraytpersonalcoach_kz\",\"bitrix.kraytpersonalcoach_ua\",\"bitrix.kraytperfumer_ru\",\"bitrix.kraytperfumer_by\",\"bitrix.kraytperfumer_kz\",\"bitrix.kraytperfumer_ua\",\"bitrix.kraytnewsblog_ru\",\"bitrix.kraytnewsblog_by\",\"bitrix.kraytnewsblog_kz\",\"bitrix.kraytnewsblog_ua\",\"bitrix.kraytmakeupstudio_ru\",\"bitrix.kraytmakeupstudio_by\",\"bitrix.kraytmakeupstudio_kz\",\"bitrix.kraytmakeupstudio_ua\",\"bitrix.kraytlawyer_ru\",\"bitrix.kraytlawyer_by\",\"bitrix.kraytlawyer_kz\",\"bitrix.kraytlawyer_ua\",\"bitrix.kraytlandscapedesign_ru\",\"bitrix.kraytlandscapedesign_by\",\"bitrix.kraytlandscapedesign_kz\",\"bitrix.kraytlandscapedesign_ua\",\"bitrix.kraytjewelryrepairshop_ru\",\"bitrix.kraytjewelryrepairshop_by\",\"bitrix.kraytjewelryrepairshop_kz\",\"bitrix.kraytjewelryrepairshop_ua\",\"bitrix.kraytinteriordesign_ru\",\"bitrix.kraytinteriordesign_by\",\"bitrix.kraytinteriordesign_kz\",\"bitrix.kraytinsurancecompany_ru\",\"bitrix.kraytinsurancecompany_kz\",\"bitrix.kraytinsurancecompany_ua\",\"bitrix.kraytillustrator_ru\",\"bitrix.kraytillustrator_by\",\"bitrix.kraytillustrator_kz\",\"bitrix.kraytillustrator_ua\",\"bitrix.kraytgiftsvalentineday_ru\",\"bitrix.kraytgiftsvalentineday_by\",\"bitrix.kraytgiftsvalentineday_kz\",\"bitrix.kraytgiftsvalentineday_ua\",\"bitrix.kraytfebruary23_ru\",\"bitrix.kraytfebruary23_by\",\"bitrix.kraytfebruary23_kz\",\"bitrix.kraytfebruary23_ua\",\"bitrix.kraytequipmentrepair_ru\",\"bitrix.kraytequipmentrepair_by\",\"bitrix.kraytequipmentrepair_kz\",\"bitrix.kraytequipmentrepair_ua\",\"bitrix.kraytdentistry_ru\",\"bitrix.kraytdentistry_by\",\"bitrix.kraytdentistry_kz\",\"bitrix.kraytdentistry_ua\",\"bitrix.kraytdancemarathon_ru\",\"bitrix.kraytdancemarathon_by\",\"bitrix.kraytdancemarathon_kz\",\"bitrix.kraytdancemarathon_ua\",\"bitrix.kraytcourseformothers_ru\",\"bitrix.kraytcourseformothers_by\",\"bitrix.kraytcourseformothers_kz\",\"bitrix.kraytcourseformothers_ua\",\"bitrix.kraytcosmetologist_ru\",\"bitrix.kraytcosmetologist_by\",\"bitrix.kraytcosmetologist_kz\",\"bitrix.kraytcosmetologist_ua\",\"bitrix.kraytconstructionofprivatehouses_ru\",\"bitrix.kraytconstructionofprivatehouses_by\",\"bitrix.kraytconstructionofprivatehouses_kz\",\"bitrix.kraytconstructionofprivatehouses_ua\",\"bitrix.kraytconfectionery_ru\",\"bitrix.kraytconfectionery_by\",\"bitrix.kraytconfectionery_kz\",\"bitrix.kraytconfectionery_ua\",\"bitrix.kraytcoffeehouse_ru\",\"bitrix.kraytcoffeehouse_by\",\"bitrix.kraytcoffeehouse_kz\",\"bitrix.kraytcoffeehouse_ua\",\"bitrix.kraytcleaningservice_ru\",\"bitrix.kraytcleaningservice_by\",\"bitrix.kraytcleaningservice_kz\",\"bitrix.kraytcleaningservice_ua\",\"bitrix.kraytbeautystudio_ru\",\"bitrix.kraytbeautystudio_by\",\"bitrix.kraytbeautystudio_kz\",\"bitrix.kraytbeautystudio_ua\",\"bitrix.kraytbarbershop_ru\",\"bitrix.kraytbarbershop_by\",\"bitrix.kraytartworkshop_by\",\"bitrix.kraytbarbershop_kz\",\"bitrix.kraytbarbershop_ua\",\"bitrix.kraytartworkshop_ru\",\"bitrix.kraytartworkshop_kz\",\"bitrix.kraytartworkshop_ua\",\"bitrix.kraytaprilfoolsdaygifts_ru\",\"bitrix.kraytaprilfoolsdaygifts_by\",\"bitrix.kraytaprilfoolsdaygifts_kz\",\"bitrix.kraytaprilfoolsdaygifts_ua\",\"bitrix.kraytwindowinstallation_ru\",\"bitrix.kraytwindowinstallation_by\",\"bitrix.kraytwindowinstallation_kz\",\"bitrix.kraytwindowinstallation_ua\",\"bitrix.kraytwindowdesign_ru\",\"bitrix.kraytwindowdesign_by\",\"bitrix.kraytwindowdesign_kz\",\"bitrix.kraytwindowdesign_ua\",\"bitrix.krayttelecommunications_ru\",\"bitrix.krayttelecommunications_by\",\"bitrix.krayttelecommunications_kz\",\"bitrix.krayttelecommunications_ua\",\"bitrix.kraytsportsnutritionorder_ru\",\"bitrix.kraytsportsnutritionorder_by\",\"bitrix.kraytsportsnutritionorder_kz\",\"bitrix.kraytsportsnutritionorder_ua\",\"bitrix.kraytreconstructionoffices_ru\",\"bitrix.kraytreconstructionoffices_by\",\"bitrix.kraytreconstructionoffices_kz\",\"bitrix.kraytreconstructionoffices_ua\",\"bitrix.kraytpremisestrade_ru\",\"bitrix.kraytpremisestrade_by\",\"bitrix.kraytpremisestrade_ua\",\"bitrix.kraytinsulationhouses_ru\",\"bitrix.kraytinsulationhouses_by\",\"bitrix.kraytinsulationhouses_kz\",\"bitrix.kraytinsulationhouses_ua\",\"bitrix.kraytinstallsecuritysystems_ru\",\"bitrix.kraytinstallsecuritysystems_by\",\"bitrix.kraytinstallsecuritysystems_kz\",\"bitrix.kraytinstallsecuritysystems_ua\",\"bitrix.kraytinstallbathrooms_ru\",\"bitrix.kraytinstallbathrooms_by\",\"bitrix.kraytinstallbathrooms_kz\",\"bitrix.kraytinstallbathrooms_ua\",\"bitrix.kraythousedesign_ru\",\"bitrix.kraythousedesign_by\",\"bitrix.kraythousedesign_kz\",\"bitrix.kraythousedesign_ua\",\"bitrix.kraythospitalforfamily_ru\",\"bitrix.kraythospitalforfamily_by\",\"bitrix.kraythospitalforfamily_kz\",\"bitrix.kraythospitalforfamily_ua\",\"bitrix.kraythomedecoration_ru\",\"bitrix.kraythomedecoration_by\",\"bitrix.kraythomedecoration_kz\",\"bitrix.kraythomedecoration_ua\",\"bitrix.kraytfurniturettransformer_ru\",\"bitrix.kraytfurniturettransformer_by\",\"bitrix.kraytfurniturettransformer_kz\",\"bitrix.kraytfurniturettransformer_ua\",\"bitrix.kraytfloristics_ru\",\"bitrix.kraytfloristics_by\",\"bitrix.kraytfloristics_kz\",\"bitrix.kraytfloristics_ua\",\"bitrix.kraytfestiveevents_ru\",\"bitrix.kraytfestiveevents_by\",\"bitrix.kraytfestiveevents_kz\",\"bitrix.kraytfestiveevents_ua\",\"bitrix.kraytecogreen_ru\",\"bitrix.kraytecogreen_by\",\"bitrix.kraytecogreen_kz\",\"bitrix.kraytecogreen_ua\",\"bitrix.kraytdoorinstallation_ru\",\"bitrix.kraytdoorinstallation_by\",\"bitrix.kraytdoorinstallation_kz\",\"bitrix.kraytdoorinstallation_ua\",\"bitrix.kraytdoordesign_ru\",\"bitrix.kraytdoordesign_by\",\"bitrix.kraytdoordesign_kz\",\"bitrix.kraytdoordesign_ua\",\"bitrix.kraytdesigningpeopledisabilities_ru\",\"bitrix.kraytdesigningpeopledisabilities_by\",\"bitrix.kraytdesigningpeopledisabilities_kz\",\"bitrix.kraytdesigningpeopledisabilities_ua\",\"bitrix.delobotkindergarten_ru\",\"bitrix.kraytvideostudio_ru\",\"bitrix.kraytlegalservices_ru\",\"bitrix.kraytaccountingservices_ru\",\"bitrix.kraytbookannouncement_ru\",\"bitrix.kraytcharity_ru\",\"bitrix.kraytspa_ru\",\"bitrix.kraythandmadecosmetics_ru\",\"bitrix.delobotmusic_ru\",\"bitrix.kraythotelforanimals_ru\",\"bitrix.kraytcityguide_ru\",\"bitrix.delobotfoodblog_ru\",\"bitrix.delobotgamedeveloper_ru\",\"bitrix.delobotrenovationoffices_ru\",\"bitrix.delobotcourses_ru\",\"bitrix.delobotcityb__beautification_ru\",\"bitrix.delobotaidfund_ru\",\"bitrix.delobotnewsblog_ru\",\"bitrix.delobottransportservices_ru\",\"bitrix.delobotguide_ru\",\"bitrix.delobotnnturalcosmetic_ru\",\"bitrix.delobotboutiqueforsale_ru\",\"bitrix.delobotorganizationweddings_ru\",\"bitrix.delobotbeautyandrecreationcenter_ru\",\"bitrix.delobotwriter_ru\",\"bitrix.kraytotel\",\"bitrix.kraytigrovoyklub\",\"bitrix.kraytbazaotdykha\",\"bitrix.kraytkurspotiktoku\",\"bitrix.kraytkadrovoeagenstvo\",\"bitrix.kraytportfoliomodeli\",\"bitrix.kraytminecraftserver\",\"bitrix.kraytigrovayakompaniya\",\"bitrix.delobotuslugivideoproizvodstva\",\"bitrix.delobotportfolioaktera\",\"bitrix.delobotpub\",\"bitrix.delobotminihotel\",\"bitrix.delobotcamping\",\"bitrix.delobotcafe\",\"bitrix.delobotizgotovlenieduxov\",\"bitrix.delobotbuhgalterskoeobslujivanie\",\"bitrix.delobotarendanedvizimosti\",\"bitrix.delobotalternativnayaenergetika\",\"bitrix.delobotagentstvoponaimy\",\"bitrix.kraytpodarkikjenskomydny\",\"bitrix.kraytinstagramcontacts_ru1\",\"bitrix.kraytinstagramstock_ru1\",\"bitrix.kraytinstagramtarget_ru1\",\"bitrix.kraytkhimchistka\",\"bitrix.krayt_detskaya_odezhda_na_zakaz\",\"bitrix.krayt_retsepty_blyud\",\"bitrix.krayt_detskaya_mebel\",\"bitrix.krayt_biblioteka\",\"bitrix.krayt_pitomnik_rasteniy\",\"bitrix.delobot_lawyer\",\"bitrix.delobot_oformlenie_dverey\",\"bitrix.delobot_montaj_dverey\",\"bitrix.delobot_manicure_and_pedicure\",\"bitrix.delobot_printing_services\",\"bitrix.delobot_plants\",\"bitrix.delobot_nutritionist\",\"bitrix.delobot_designer_tableware\",\"bitrix.delobot_montaj_okon\",\"bitrix.delobot_oformlenie_okon\",\"bitrix.krayt_zhurnalist\",\"bitrix.krayt_tato_salon\",\"bitrix.krayt_massajist\",\"bitrix.krayt_consulting\",\"bitrix.krayt_elektromontazh\",\"bitrix.krayt_rezyume_spetsialista\",\"bitrix.kraytportfoliophotographer\",\"bitrix.kraytbeautystudio_en\",\"bitrix.kraytautomechanic_en\",\"bitrix.kraytequipmentrepair_en\",\"bitrix.delobot_furniture_for_children\",\"bitrix.delobot_architectural_projects\",\"bitrix.delobot_scientists_page\",\"bitrix.delobot_tatoo_studio\",\"bitrix.delobot_journalist_resume\",\"bitrix.delobot_leather_goods\",\"bitrix.delobot_dance_marathon\",\"bitrix.krayt_art_gallery\",\"bitrix.krayt_leather_products\",\"bitrix.krayt_scientific_researcher\",\"bitrix.krayt_bureau_of_architecture\",\"bitrix.krayt_jewelry_designer\",\"bitrix.krayt_food_photographer\",\"bitrix.krayt_acting_studio\",\"bitrix.krayt_farm\",\"bitrix.krayt_fashion_blog\",\"bitrix.krayt_birthday_cakes\",\"bitrix.krayt_plussize_fashion\",\"bitrix.krayt_diving\",\"bitrix.krayt_it_services\",\"bitrix.krayt_beauty_blog\",\"bitrix.krayt_aquarium\",\"bitrix.krayt_sport_blog\",\"bitrix.delobot_online_library\",\"bitrix.delobot_diving_center\",\"bitrix.delobot_designer_jewelry\",\"bitrix.delobot_nail_art_course\",\"bitrix.delobot_art_galery\",\"bitrix.delobot_fashion_for_everyone\",\"bitrix.delobot_handmade_chocolate\",\"bitrix.krayt_chocolate_shop\",\"bitrix.krayt_advertising_agency\",\"bitrix.krayt_asian_food\",\"bitrix.krayt_avtorskiy_master_klass\",\"bitrix.krayt_utilizatsiya_otkhodov\",\"bitrix.krayt_italyanskaya_kukhnya\",\"bitrix.krayt_kurs_po_nogtevomu_servisu\",\"bitrix.krayt_begovoy_klub\",\"bitrix.krayt_gornyy_turizm\",\"bitrix.krayt_biznes_prostranstvo\",\"bitrix.krayt_shkola_iskusstv\",\"bitrix.krayt_onlayn_intensiv_inostrannogo_yazyka\",\"bitrix.delobot_reklama_brenda\",\"bitrix.delobot_italyanskiy_restoran\",\"bitrix.delobot_modnaya_stranichka\",\"bitrix.delobot_fotografiya_edy\",\"bitrix.krayt_pishchevoe_proizvodstvo\",\"bitrix.krayt_appetitnyy_blog\",\"bitrix.krayt_uslugi_remonta\",\"bitrix.krayt_onlayn_kurs_kreativnogo_prodyusera\",\"bitrix.krayt_detskie_prazdniki\",\"bitrix.krayt_svetotekhnika\",\"bitrix.krayt_urbanistika\",\"bitrix.krayt_otdykh_na_prirode\",\"bitrix.krayt_sportivnye_ploshchadki\",\"bitrix.krayt_oborudovanie_dlya_turizma\",\"bitrix.krayt_meksikanskaya_kukhnya\",\"bitrix.delobot_sports_blog_20\",\"bitrix.delobot_aziatskie_blyuda\",\"bitrix.delobot_beauty_blog\",\"bitrix.delobot_meksikanskiy_restoran_2_0\",\"bitrix.delobot_urban_project\",\"bitrix.delobot_drawing_school\",\"bitrix.delobot_tourism\",\"bitrix.delobot_runnig_club\",\"bitrix.delobot_lighting_company\",\"bitrix.delobot_garbage_disposal\",\"bitrix.delobot_master_class\",\"bitrix.delobot_it_outsourcing\",\"bitrix.krayt_rent_car\",\"bitrix.krayt_aviation\",\"bitrix.krayt_street_sport_club\",\"bitrix.krayt_kofemaniya\",\"bitrix.krayt_corporate_events\",\"bitrix.krayt_cooking_school\",\"bitrix.krayt_blacksmith_craft\",\"bitrix.krayt_med_lab\",\"bitrix.krayt_music_studio\",\"bitrix.krayt_web_application_development\",\"bitrix.krayt_tennis_club\",\"bitrix.krayt_bank_services\",\"bitrix.krayt_smart_furniture\",\"bitrix.krayt_dom_pod_klyuch\",\"bitrix.krayt_uslugi_mediatora\",\"bitrix.krayt_child_club\",\"bitrix.delobot_custom_made_cakes\",\"bitrix.delobot_online_yoga_classes\",\"bitrix.krayt_pevitsa\",\"bitrix.krayt_ozelenenie_pomeshcheniy\",\"bitrix.krayt_internet_agentstvo\",\"bitrix.krayt_kinolog\",\"bitrix.krayt_poleznye_sneki\",\"bitrix.krayt_oformlenie_interera\",\"bitrix.delobot_tourist_equipment\",\"bitrix.delobot_creative_producer\",\"bitrix.delobot_aviation_services\",\"bitrix.delobot_blacksmith_services\",\"bitrix.delobot_coffee_subscription\",\"bitrix.delobot_construction_company\",\"bitrix.delobot_business_premises\",\"bitrix.delobot_pet_hotel\",\"bitrix.delobot_food_industry\",\"bitrix.delobot_cars_for_rent\",\"bitrix.krayt_klub_dlya_geymerov\",\"bitrix.krayt_relaks_uslugi\",\"bitrix.krayt_sportivnyy_inventar\",\"bitrix.krayt_universitet\",\"bitrix.delobot_uslugi_kinologa\",\"bitrix.delobot_business_training\",\"bitrix.krayt_vebinar\",\"bitrix.krayt_kurs_po_iskusstvennomu_intellektu\",\"bitrix.delobot_vypechka_na_zakaz\",\"bitrix.delobot_osennaya_rasprodazh\",\"bitrix.krayt_onlayn_shkola_dlya_detey\",\"bitrix.krayt_arkhitekturnaya_kompaniya\",\"bitrix.krayt_den_blagodareniya\",\"bitrix.krayt_uslugi_nyani\",\"bitrix.krayt_uslugi_repetitora\",\"bitrix.krayt_logoped\",\"bitrix.krayt_chyernaya_pyatnitsa\",\"bitrix.krayt_sladosti_na_rozhdestvo\",\"bitrix.krayt_podarki_na_novyy_god\",\"bitrix.delobot_laboratory\",\"bitrix.delobot_street_sports_grounds\",\"bitrix.delobot_about_webinar\",\"bitrix.krayt_dostavka_gruza\",\"bitrix.delobot_online_travel\",\"bitrix.delobot_youtube_channel\",\"bitrix.delobot_interior_design\",\"bitrix.krayt_kursy_po_interesam\",\"bitrix.krayt_zimnyaya_rasprodazha\",\"bitrix.krayt_tsifrovye_kommunikatsii\",\"bitrix.krayt_avtosalon\",\"bitrix.krayt_uslugi_stroitelnoy_kompanii\",\"bitrix.krayt_vysshee_uchebnoe_zavedenie\",\"bitrix.krayt_veterinar\",\"bitrix.krayt_akademiya_iskusstv\",\"bitrix.krayt_master_po_domu\",\"bitrix.krayt_onlayn_trenirovki\",\"bitrix.krayt_apart_otel\",\"bitrix.krayt_tsvety_i_bukety_na_zakaz\",\"bitrix.krayt_biznes_forum\",\"bitrix.krayt_uslugi_stomatologii\",\"bitrix.krayt_uslugi_avtoservisa\",\"bitrix.delobot_winter_sale\",\"bitrix.krayt_christmas_treats\",\"bitrix.krayt_eksperty_tochnogo_zemledeliya\",\"bitrix.krayt_servis_ukhoda_za_domom\",\"bitrix.delobot_repetitor\",\"bitrix.delobot_babysitter_for_children\",\"bitrix.delobot_speech_therapist_services\",\"bitrix.empty_template\",\"bitrix.krayt_gift_wrapping\",\"bitrix.delobot_fitness_clothes\",\"bitrix.delobot_bathroom_renovation\",\"bitrix.delobot_travel_arrangements\",\"bitrix.krayt_music_classes\",\"bitrix.delobot_klinika_dlya_mam_i_detok\",\"bitrix.delobot_bankovskie_uslugi\",\"bitrix.krayt_videoproizvodstvo\",\"bitrix.krayt_manikyur\",\"bitrix.krayt_meditsinskaya_pomoshch_onlayn\",\"bitrix.krayt_oblagorazhivanie_goroda\",\"bitrix.krayt_uslugi_barbershopa\",\"bitrix.krayt_taksi\",\"bitrix.delobot_optika\",\"bitrix.delobot_klinika_stomatologii\",\"bitrix.delobot_konditer\",\"bitrix.delobot_3d_print_services\",\"bitrix.delobot_uslugi_khimchistki\",\"bitrix.delobot_obuchenie_po_iskusstvennomu_intellektu\",\"bitrix.krayt_nutritsiologiya\",\"bitrix.krayt_salon_krasoty\",\"bitrix.krayt_uslugi_perevoda\",\"bitrix.krayt_landshaftnyy_dizayner\",\"bitrix.krayt_mebel_gotovaya_i_na_zakaz\",\"bitrix.krayt_uslugi_yurista\",\"bitrix.krayt_uslugi_po_bukhgalterii\",\"bitrix.krayt_yuvelir\",\"bitrix.krayt_stranichka_s_aktsiey\",\"bitrix.krayt_den_vsekh_vlyublennykh\",\"bitrix.krayt_stranichka_kontaktov\",\"bitrix.krayt_uslugi_massazhista\",\"bitrix.krayt_dostavka_edy_i_napitkov\",\"bitrix.krayt_podarki_na_zhenskiy_den\",\"bitrix.krayt_ekskursii\",\"bitrix.krayt_proizvodstvo_kosmetiki\",\"bitrix.krayt_logistika\",\"bitrix.krayt_fotograf\",\"bitrix.krayt_arenda_zhilya\",\"bitrix.krayt_kliningovye_uslugi\",\"bitrix.krayt_agentstvo_po_naymu\",\"bitrix.krayt_dukhi_na_zakaz\",\"bitrix.delobot_event_anounce\",\"bitrix.delobot_barbershop\",\"bitrix.delobot_italian_cafe\",\"bitrix.delobot_application_development\",\"bitrix.delobot_construction\",\"bitrix.delobot_uslugi_khudozhnika\",\"bitrix.krayt_prepodavatel\",\"bitrix.krayt_dveri_na_zakaz\",\"bitrix.krayt_kursy_po_gotovke\",\"bitrix.krayt_interernyy_dizayn\",\"bitrix.krayt_konsultatsii_po_zdorovyu\",\"bitrix.krayt_uslugi_atele\",\"bitrix.krayt_vizitka\",\"bitrix.krayt_remont_zhilya\",\"bitrix.krayt_voskhozhdenie_s_alpinistami\",\"bitrix.krayt_vesennyaya_rasprodazha\",\"bitrix.krayt_svadebnyy_salon\",\"bitrix.kraytlawyer_en\",\"bitrix.kraytinsurancecompany_en\",\"bitrix.krayt_interior_designer\",\"bitrix.delobot_bank\",\"bitrix.delobot_custom_made_clothes\",\"bitrix.delobot_telemedicine\",\"bitrix.krayt_spetsialist_po_nedvizhimosti\",\"bitrix.krayt_sportzal\",\"bitrix.krayt_mebel\",\"bitrix.krayt_tvorcheskie_kursy\",\"bitrix.krayt_kosmetologiya\",\"bitrix.krayt_remont_bytovoy_tekhniki\",\"bitrix.delobot_stylist_services\",\"bitrix.delobot_holidays_for_children\",\"bitrix.delobot_logistics_services\",\"bitrix.krayt_remont_avto\",\"bitrix.krayt_torgovoe_oborudovanie\",\"bitrix.krayt_rasteniya_i_zhivye_izgorodi\",\"bitrix.krayt_organizatsiya_meropriyatiy\",\"bitrix.krayt_o_psikhologe\",\"bitrix.krayt_prozhivanie_v_otele\",\"bitrix.krayt_dental_clinic\",\"bitrix.krayt_barbershop\",\"bitrix.krayt_personal_stylist\",\"bitrix.delobot_muzykalnaya_shkola\",\"bitrix.delobot_parfumer_services\",\"bitrix.delobot_uslugi_po_upakovke_podarkov\",\"bitrix.delobot_insurance\",\"bitrix.delobot_zabota_o_zhivotnyh\",\"bitrix.delobot_landscape_studio\",\"bitrix.krayt_dizayn_saytov\",\"bitrix.krayt_arenda_tekhniki\",\"bitrix.krayt_kursy_dlya_sotrudnikov\",\"bitrix.krayt_konditsionery_v_dom\",\"bitrix.krayt_promyshlennost\",\"bitrix.krayt_tantsy\",\"bitrix.krayt_pechat_3d_figur\",\"bitrix.krayt_o_biblioteke\",\"bitrix.krayt_vyrashchivanie_zeleni\",\"bitrix.krayt_okhrannye_sistemy\",\"bitrix.krayt_zvukozapis\",\"bitrix.krayt_rasprodazha\",\"bitrix.form_template_with_product_galery_for_social_media\",\"bitrix.form_template_with_offer\",\"bitrix.facebook_form_template_with_offer\",\"bitrix.facebook_form_template_with_product_images\",\"bitrix.facebook_form_template_with_extra_communication_channels\",\"bitrix.shablon_dlya_formy_v_vk_s_kartinkami_tovarov\",\"bitrix.shablon_dlya_formy_v_vk_s_kanalami_svyazi\",\"bitrix.shablon_dlya_formy_v_vk_s_promo_aktsiey\",\"bitrix.form_template_with_offer_for_social_media\",\"bitrix.form_template_with_contacts_for_social_media\",\"bitrix.form_template_with_product_images_for_social_media\",\"bitrix.form_template_with_communication_channels_for_social_media\",\"bitrix.krayt_vypechka\",\"bitrix.krayt_it_spetsialisty\",\"bitrix.krayt_modnyy_konsultant\",\"bitrix.krayt_agentstvo_po_turizmu\",\"bitrix.krayt_uslugi_vizazhista\",\"bitrix.krayt_fotostudiya\",\"bitrix.krayt_vyazanie\",\"bitrix.krayt_blagotvoritelnaya_organizatsiya\",\"bitrix.krayt_uslugi_illyustratora\",\"bitrix.delobot_intensiv_po_inostrannomu_yazyku\",\"bitrix.delobot_uslugi_po_remontu_tekhniki\",\"bitrix.delobot_stranichka_mobilnogo_prilozheniya\",\"bitrix.delobot_kreativnaya_mebel\",\"bitrix.delobot_klub_tsifrovykh_igr\",\"bitrix.delobot_dizayn_dlya_doma\",\"bitrix.krayt_studiya_spa\",\"bitrix.krayt_proekt_po_utepleniyu_doma\",\"bitrix.krayt_klining_kompaniya\",\"bitrix.krayt_arkhitektor\",\"bitrix.krayt_sladosti_na_zakaz\",\"bitrix.krayt_fotografiya\",\"bitrix.krayt_poligraficheskie_uslugi\",\"bitrix.krayt_manikyur_i_pedikyur\",\"bitrix.krayt_vyazanie_2\",\"bitrix.krayt_kofe\",\"bitrix.krayt_obuchenie_muzyke\",\"bitrix.krayt_novosti\",\"bitrix.delobot_spetsialist_po_tekstam\",\"bitrix.delobot_uslugi_elektrika\",\"bitrix.delobot_otslezhivanie_zdorovya\",\"bitrix.delobot_studiya_dlya_aktyerov\",\"bitrix.delobot_uslugi_kosmetologa\",\"bitrix.delobot_kottedzhnyy_posyelok\",\"bitrix.delobot_izdeliya_ot_yuvelira\",\"bitrix.krayt_montazh_panelnykh_domov\",\"bitrix.krayt_masterskaya_tekstilya\",\"bitrix.krayt_razrabotka_igr\",\"bitrix.krayt_organizatsiya_prazdnika\",\"bitrix.krayt_stilnaya_odezhda_na_zakaz\",\"bitrix.krayt_posuda_ot_dizaynera\",\"bitrix.krayt_pomeshchenie_dlya_kovorkinga\",\"bitrix.krayt_shokoladnaya_masterskaya\",\"bitrix.krayt_podbor_personala\",\"bitrix.krayt_uslugi_po_massazhu\",\"bitrix.krayt_prirodnyy_otdykh\",\"bitrix.krayt_agentstvo_po_reklame\",\"bitrix.krayt_stomatolog\",\"bitrix.krayt_povar_konditer\",\"bitrix.krayt_uslugi_po_strakhovaniyu\",\"bitrix.krayt_rasprodazha_osenyu\",\"bitrix.krayt_kukhni_na_zakaz\",\"bitrix.krayt_avtorskie_puteshestviya\",\"bitrix.krayt_remont_gadzhetov\",\"bitrix.krayt_proizvodstvo_produktsii\",\"bitrix.krayt_mezhdunarodnaya_biznes_konferentsiya\",\"bitrix.krayt_studiya_gibkosti\",\"bitrix.krayt_biznes_konsultatsii\",\"bitrix.krayt_brendingovoe_agentstvo\",\"bitrix.krayt_thanksgiving_day\",\"bitrix.krayt_architectural_company\",\"bitrix.krayt_online_school_for_children\",\"bitrix.krayt_ai_course\",\"bitrix.krayt_it_services_2\",\"bitrix.krayt_accounting_services\",\"bitrix.krayt_gaming_club\",\"bitrix.krayt_architectural_company_ru\",\"bitrix.delobot_beauty_blog_en\",\"bitrix.delobot_sladkoe_na_halloween\",\"bitrix.krayt_biznes_ru\",\"bitrix.krayt_business_en\",\"bitrix.krayt_vebinar_ru\",\"bitrix.delobot_music_band\",\"bitrix.delobot_courses\",\"bitrix.delobot_tours\",\"bitrix.krayt_uslugi_okhrany\",\"bitrix.krayt_agentstvo_nedvizhimosti\",\"bitrix.krayt_didzhital_illyustrator\",\"bitrix.krayt_landshaftnyy_dizayn\",\"bitrix.krayt_ochki_i_linzy_na_zakaz\",\"bitrix.krayt_organizatsiya_svadeb\",\"bitrix.krayt_pitanie_s_dietologom\",\"bitrix.krayt_uslugi_logistiki\",\"bitrix.krayt_uslugi_pekarya\",\"bitrix.krayt_uslugi_videostudii\",\"bitrix.krayt_home_construction_company\",\"bitrix.delobot_natural_cosmetics\",\"bitrix.krayt_real_estate_agent\",\"bitrix.krayt_spa_salon\",\"bitrix.krayt_yoga\",\"bitrix.krayt_uslugi_po_makiyajy\",\"bitrix.krayt_uslugi_psikhoterapevta\",\"bitrix.krayt_uslugi_advokat\",\"bitrix.krayt_uchitel_matematiki\",\"bitrix.krayt_portfolio_aktrisy\",\"bitrix.krayt_online_shkola_dlya_detey\",\"bitrix.krayt_odezhda_dlya_fitnesa\",\"bitrix.krayt_obuchenie_sotrudnikov\",\"bitrix.krayt_nabory_pravilnogo_pitaniya\",\"bitrix.krayt_kurs_po_ii\",\"bitrix.krayt_kontsert_gruppy\",\"bitrix.krayt_kokteylnyy_bar\",\"bitrix.krayt_khudozhnik\",\"bitrix.delobot_arenduemaya_tekhnika\",\"bitrix.delobot_franshiza_sportivnykh_zalov\",\"bitrix.delobot_massazh\",\"bitrix.delobot_oborudovanie_dlya_torgovli\",\"bitrix.delobot_remontnye_raboty\",\"bitrix.delobot_uslugi_po_remontu_avto\",\"bitrix.delobot_yuridicheskaya_kompaniya\",\"bitrix.delobot_yuridicheskiy_universitet\",\"bitrix.krayt_kiberponedelnik\",\"bitrix.krayt_koncert_gruppy\",\"bitrix.krayt_kurs_po_neyrosetyam\",\"bitrix.krayt_arenda_nedvizhimosti\",\"bitrix.krayt_nyanya_dlya_detok\",\"bitrix.krayt_uslugi_bukhgalterii\",\"bitrix.krayt_ozelenenie_goroda\",\"bitrix.krayt_proektirovanie_domov\",\"bitrix.krayt_ustanovka_konditsionerov\",\"bitrix.krayt_posuda\",\"bitrix.krayt_furniture_manufacturer\",\"bitrix.krayt_logistics\",\"bitrix.krayt_renovations\",\"bitrix.krayt_travel_agency\",\"bitrix.krayt_electrical_services\",\"bitrix.krayt_home_design_and_construction\",\"bitrix.krayt_legal_services\",\"bitrix.delobot_bathroom_renovations\",\"bitrix.delobot_it_services\",\"bitrix.delobot_konsaltingovaya_kompaniya\",\"bitrix.delobot_branding\",\"bitrix.delobot_mebel_dlya_rabochego_prostranstva\",\"bitrix.delobot_stroitelstvo_zhilya\",\"bitrix.delobot_zubnoy_vrach\",\"bitrix.delobot_furnituremanufacturing_en\",\"bitrix.krayt_university_en\",\"bitrix.delobot_newsblog_en\",\"bitrix.krayt_mobileapp_en\",\"bitrix.krayt_hotel_en\",\"bitrix.krayt_realestate_en\",\"bitrix.delobot_banking_services\",\"bitrix.krayt_website_designer\",\"bitrix.delobot_transport_services\",\"bitrix.krayt_recruitment_agency\",\"bitrix.krayt_camping_retreat\",\"bitrix.delobot_master_na_vse_ruki\",\"bitrix.delobot_apart_gostinitsa\",\"bitrix.delobot_tantsevalnye_kursy\",\"bitrix.delobot_zakaz_dverey\",\"bitrix.delobot_mediator\",\"bitrix.delobot_istoricheskiy_muzey\",\"bitrix.delobot_onlayn_vrach\",\"bitrix.delobot_uslugi_po_reklame\",\"bitrix.delobot_knigi_na_zakaz\",\"bitrix.delobot_avtozapchasti_i_avtoremont\",\"bitrix.delobot_blagotvoritelnyy_fond\",\"bitrix.delobot_it_konferentsiya\",\"bitrix.delobot_strakhovye_uslugi\",\"bitrix.delobot_tatu_i_pirsing\"]',	NULL,	NULL),
('rest',	'entity_iblock_type',	'rest_entity',	NULL,	NULL),
('rest',	'server_path',	'/rest',	NULL,	NULL),
('search',	'dbnode_id',	'N',	NULL,	NULL),
('search',	'dbnode_status',	'ok',	NULL,	NULL),
('search',	'version',	'v2.0',	NULL,	NULL),
('socialservices',	'allow_encrypted_tokens',	'1',	NULL,	NULL),
('socialservices',	'bitrix24net_domain',	'http://dzm-9.webtm.ru',	NULL,	NULL),
('socialservices',	'bitrix24net_id',	'ext.666ee858a908a9.39583436',	NULL,	NULL),
('socialservices',	'bitrix24net_secret',	'bzD2NFMsGvb2mK6k8juYqGTDPAMC4bPPWCl7qa07Xu3fmYbnV1',	NULL,	NULL),
('socialservices',	'google_api_key',	'AIzaSyA7puwZwGDJgOjcAWsFsY7hQcrioC13A18',	NULL,	NULL),
('socialservices',	'google_appid',	'798910771106.apps.googleusercontent.com',	NULL,	NULL);

DROP TABLE IF EXISTS `b_option_site`;
CREATE TABLE `b_option_site` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_site_module_site` (`MODULE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_cache`;
CREATE TABLE `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_cluster`;
CREATE TABLE `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_component`;
CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_error`;
CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_history`;
CREATE TABLE `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_perf_history` (`ID`, `TIMESTAMP_X`, `TOTAL_MARK`, `ACCELERATOR_ENABLED`) VALUES
(1,	'2024-06-16 13:29:20',	68.97,	'Y');

DROP TABLE IF EXISTS `b_perf_hit`;
CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_index_ban`;
CREATE TABLE `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_index_complete`;
CREATE TABLE `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_index_suggest`;
CREATE TABLE `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_index_suggest_sql`;
CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL,
  `SQL_ID` int(11) NOT NULL,
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_sql`;
CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_sql_backtrace`;
CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL,
  `NN` int(18) NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_tab_column_stat`;
CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_tab_stat`;
CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_perf_test`;
CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_perf_test` (`ID`, `REFERENCE_ID`, `NAME`) VALUES
(1,	2,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(2,	3,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(3,	4,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(4,	5,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(5,	6,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(6,	7,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(7,	8,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(8,	9,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(9,	10,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(10,	11,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(11,	12,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(12,	13,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(13,	14,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(14,	15,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(15,	16,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(16,	17,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(17,	18,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(18,	19,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(19,	20,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(20,	21,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(21,	22,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(22,	23,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(23,	24,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(24,	25,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(25,	26,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(26,	27,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(27,	28,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(28,	29,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(29,	30,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(30,	31,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(31,	32,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(32,	33,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(33,	34,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(34,	35,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(35,	36,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(36,	37,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(37,	38,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(38,	39,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(39,	40,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(40,	41,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(41,	42,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(42,	43,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(43,	44,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(44,	45,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(45,	46,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(46,	47,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(47,	48,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(48,	49,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(49,	50,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(50,	51,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(51,	52,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(52,	53,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(53,	54,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(54,	55,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(55,	56,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(56,	57,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(57,	58,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(58,	59,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(59,	60,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(60,	61,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(61,	62,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(62,	63,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(63,	64,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(64,	65,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(65,	66,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(66,	67,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(67,	68,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(68,	69,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(69,	70,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(70,	71,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(71,	72,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(72,	73,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(73,	74,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(74,	75,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(75,	76,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(76,	77,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(77,	78,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(78,	79,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(79,	80,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(80,	81,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(81,	82,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(82,	83,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(83,	84,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(84,	85,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(85,	86,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(86,	87,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(87,	88,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(88,	89,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(89,	90,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(90,	91,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(91,	92,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(92,	93,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(93,	94,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(94,	95,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(95,	96,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(96,	97,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(97,	98,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(98,	99,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(99,	100,	'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(100,	98,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(101,	-1,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(102,	0,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(103,	1,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(104,	2,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(105,	3,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(106,	4,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(107,	5,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(108,	6,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(109,	7,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(110,	8,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(111,	9,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(112,	10,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(113,	11,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(114,	12,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(115,	13,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(116,	14,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(117,	15,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(118,	16,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(119,	17,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(120,	18,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(121,	19,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(122,	20,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(123,	21,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(124,	22,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(125,	23,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(126,	24,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(127,	25,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(128,	26,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(129,	27,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(130,	28,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(131,	29,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(132,	30,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(133,	31,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(134,	32,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(135,	33,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(136,	34,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(137,	35,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(138,	36,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(139,	37,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(140,	38,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(141,	39,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(142,	40,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(143,	41,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(144,	42,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(145,	43,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(146,	44,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(147,	45,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(148,	46,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(149,	47,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(150,	48,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(151,	49,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(152,	50,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(153,	51,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(154,	52,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(155,	53,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(156,	54,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(157,	55,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(158,	56,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(159,	57,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(160,	58,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(161,	59,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(162,	60,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(163,	61,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(164,	62,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(165,	63,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(166,	64,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(167,	65,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(168,	66,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(169,	67,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(170,	68,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(171,	69,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(172,	70,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(173,	71,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(174,	72,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(175,	73,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(176,	74,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(177,	75,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(178,	76,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(179,	77,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(180,	78,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(181,	79,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(182,	80,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(183,	81,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(184,	82,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(185,	83,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(186,	84,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(187,	85,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(188,	86,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(189,	87,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(190,	88,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(191,	89,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(192,	90,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(193,	91,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(194,	92,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(195,	93,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(196,	94,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(197,	95,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(198,	96,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(199,	97,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(200,	98,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(201,	-1,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(202,	0,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(203,	1,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(204,	2,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(205,	3,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(206,	4,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(207,	5,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(208,	6,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(209,	7,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(210,	8,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(211,	9,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(212,	10,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(213,	11,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(214,	12,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(215,	13,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(216,	14,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(217,	15,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(218,	16,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(219,	17,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(220,	18,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(221,	19,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(222,	20,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(223,	21,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(224,	22,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(225,	23,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(226,	24,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(227,	25,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(228,	26,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(229,	27,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(230,	28,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(231,	29,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(232,	30,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(233,	31,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(234,	32,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(235,	33,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(236,	34,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(237,	35,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(238,	36,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(239,	37,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(240,	38,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(241,	39,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(242,	40,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(243,	41,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(244,	42,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(245,	43,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(246,	44,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(247,	45,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(248,	46,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(249,	47,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(250,	48,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(251,	49,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(252,	50,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(253,	51,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(254,	52,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(255,	53,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(256,	54,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(257,	55,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(258,	56,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(259,	57,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(260,	58,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(261,	59,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(262,	60,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(263,	61,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(264,	62,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(265,	63,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(266,	64,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(267,	65,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(268,	66,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(269,	67,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(270,	68,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(271,	69,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(272,	70,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(273,	71,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(274,	72,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(275,	73,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(276,	74,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(277,	75,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(278,	76,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(279,	77,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(280,	78,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(281,	79,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(282,	80,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(283,	81,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(284,	82,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(285,	83,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(286,	84,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(287,	85,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(288,	86,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(289,	87,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(290,	88,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(291,	89,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(292,	90,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(293,	91,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(294,	92,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(295,	93,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(296,	94,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(297,	95,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(298,	96,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(299,	97,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(300,	98,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(301,	-1,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(302,	0,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(303,	1,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(304,	2,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(305,	3,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(306,	4,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(307,	5,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(308,	6,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(309,	7,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(310,	8,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(311,	9,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(312,	10,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(313,	11,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(314,	12,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(315,	13,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(316,	14,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(317,	15,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(318,	16,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(319,	17,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(320,	18,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(321,	19,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(322,	20,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(323,	21,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(324,	22,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(325,	23,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(326,	24,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(327,	25,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(328,	26,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(329,	27,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(330,	28,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(331,	29,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(332,	30,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(333,	31,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(334,	32,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(335,	33,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(336,	34,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(337,	35,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(338,	36,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(339,	37,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(340,	38,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(341,	39,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(342,	40,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(343,	41,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(344,	42,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(345,	43,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(346,	44,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(347,	45,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(348,	46,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(349,	47,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(350,	48,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(351,	49,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(352,	50,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(353,	51,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(354,	52,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(355,	53,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(356,	54,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(357,	55,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(358,	56,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(359,	57,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(360,	58,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(361,	59,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(362,	60,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(363,	61,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(364,	62,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(365,	63,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(366,	64,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(367,	65,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(368,	66,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(369,	67,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(370,	68,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(371,	69,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(372,	70,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(373,	71,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(374,	72,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(375,	73,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(376,	74,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(377,	75,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(378,	76,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(379,	77,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(380,	78,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(381,	79,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(382,	80,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(383,	81,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(384,	82,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(385,	83,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(386,	84,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(387,	85,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(388,	86,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(389,	87,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(390,	88,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(391,	89,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(392,	90,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(393,	91,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(394,	92,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(395,	93,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(396,	94,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(397,	95,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(398,	96,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(399,	97,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(400,	98,	'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');

DROP TABLE IF EXISTS `b_rating`;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
(1,	'N',	'Рейтинг',	'USER',	'SUM',	'2024-06-16 13:27:29',	NULL,	NULL,	'Y',	'N',	'N',	'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),
(2,	'N',	'Авторитет',	'USER',	'SUM',	'2024-06-16 13:27:29',	NULL,	NULL,	'Y',	'Y',	'N',	'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');

DROP TABLE IF EXISTS `b_rating_component`;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rating_component_results`;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rating_prepare`;
CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rating_results`;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rating_rule`;
CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
(1,	'N',	'Добавление в группу пользователей, имеющих право голосовать за рейтинг',	'USER',	'AUTHORITY',	NULL,	'CRatingRulesMain',	'ratingCheck',	'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}',	'ADD_TO_GROUP',	'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}',	'N',	'CRatingRulesMain',	'addToGroup',	'N',	'CRatingRulesMain ',	'addToGroup',	'2024-06-16 13:27:29',	'2024-06-16 13:27:29',	NULL),
(2,	'N',	'Удаление из группы пользователей, не имеющих права голосовать за рейтинг',	'USER',	'AUTHORITY',	NULL,	'CRatingRulesMain',	'ratingCheck',	'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}',	'REMOVE_FROM_GROUP',	'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}',	'N',	'CRatingRulesMain',	'removeFromGroup',	'N',	'CRatingRulesMain ',	'removeFromGroup',	'2024-06-16 13:27:29',	'2024-06-16 13:27:29',	NULL),
(3,	'N',	'Добавление в группу пользователей, имеющих право голосовать за авторитет',	'USER',	'AUTHORITY',	NULL,	'CRatingRulesMain',	'ratingCheck',	'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}',	'ADD_TO_GROUP',	'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}',	'N',	'CRatingRulesMain',	'addToGroup',	'N',	'CRatingRulesMain ',	'addToGroup',	'2024-06-16 13:27:29',	'2024-06-16 13:27:29',	NULL),
(4,	'N',	'Удаление из группы пользователей, не имеющих права голосовать за авторитет',	'USER',	'AUTHORITY',	NULL,	'CRatingRulesMain',	'ratingCheck',	'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}',	'REMOVE_FROM_GROUP',	'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}',	'N',	'CRatingRulesMain',	'removeFromGroup',	'N',	'CRatingRulesMain ',	'removeFromGroup',	'2024-06-16 13:27:29',	'2024-06-16 13:27:29',	NULL),
(5,	'Y',	'Автоматическое голосование за авторитет пользователя',	'USER',	'VOTE',	NULL,	'CRatingRulesMain',	'voteCheck',	'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.1;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.1;}}',	'empty',	'a:0:{}',	'N',	'empty',	'empty',	'N',	'empty ',	'empty',	'2024-06-16 13:27:29',	'2024-06-16 13:27:29',	NULL);

DROP TABLE IF EXISTS `b_rating_rule_vetting`;
CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rating_user`;
CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
(1,	2,	1,	3.0000,	30.0000,	13);

DROP TABLE IF EXISTS `b_rating_vote`;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_10` (`USER_ID`,`OWNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rating_vote_group`;
CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
(5,	1,	'A'),
(1,	1,	'R'),
(3,	1,	'R'),
(2,	3,	'R'),
(4,	3,	'R'),
(6,	4,	'A');

DROP TABLE IF EXISTS `b_rating_voting`;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rating_voting_prepare`;
CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rating_voting_reaction`;
CREATE TABLE `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TOTAL_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rating_weight`;
CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
(1,	-1000000.0000,	1000000.0000,	1.0000,	10);

DROP TABLE IF EXISTS `b_rest_ap`;
CREATE TABLE `b_rest_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_ap` (`USER_ID`,`PASSWORD`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_app`;
CREATE TABLE `b_rest_app` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INSTALLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `URL_DEMO` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_INSTALL` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1',
  `SCOPE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'F',
  `DATE_FINISH` date DEFAULT NULL,
  `IS_TRIALED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SHARED_KEY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `MOBILE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `USER_INSTALL` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app1` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_app_lang`;
CREATE TABLE `b_rest_app_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app_lang1` (`APP_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_app_log`;
CREATE TABLE `b_rest_app_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `APP_ID` int(11) NOT NULL,
  `ACTION_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_app_log1` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_ap_permission`;
CREATE TABLE `b_rest_ap_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD_ID` int(11) NOT NULL,
  `PERM` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_ap_perm1` (`PASSWORD_ID`,`PERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_configuration_storage`;
CREATE TABLE `b_rest_configuration_storage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `CONTEXT` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_event`;
CREATE TABLE `b_rest_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `INTEGRATION_ID` int(11) DEFAULT NULL,
  `OPTIONS` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_app_event` (`APP_ID`,`EVENT_NAME`(50),`EVENT_HANDLER`(180),`USER_ID`,`CONNECTOR_ID`(70)),
  KEY `ix_b_rest_event_event_name` (`EVENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_event_offline`;
CREATE TABLE `b_rest_event_offline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MESSAGE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_DATA` text COLLATE utf8_unicode_ci,
  `EVENT_ADDITIONAL` text COLLATE utf8_unicode_ci,
  `PROCESS_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ERROR` int(3) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_offline1` (`MESSAGE_ID`(50),`APP_ID`,`CONNECTOR_ID`(100),`PROCESS_ID`(50)),
  KEY `ix_b_rest_event_offline2` (`TIMESTAMP_X`),
  KEY `ix_b_rest_event_offline3` (`APP_ID`,`CONNECTOR_ID`),
  KEY `ix_b_rest_event_offline4` (`PROCESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_integration`;
CREATE TABLE `b_rest_integration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `ELEMENT_CODE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `APP_ID` int(11) DEFAULT NULL,
  `SCOPE` text COLLATE utf8_unicode_ci,
  `QUERY` text COLLATE utf8_unicode_ci,
  `OUTGOING_EVENTS` text COLLATE utf8_unicode_ci,
  `OUTGOING_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OUTGOING_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_LIST` text COLLATE utf8_unicode_ci,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_ONLY_API` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BOT_ID` int(11) DEFAULT NULL,
  `BOT_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_log`;
CREATE TABLE `b_rest_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CLIENT_ID` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `SCOPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_AUTH` text COLLATE utf8_unicode_ci,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_STATUS` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_owner_entity`;
CREATE TABLE `b_rest_owner_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_owner_entity` (`ENTITY_TYPE`,`ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_placement`;
CREATE TABLE `b_rest_placement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `USER_ID` int(18) DEFAULT '0',
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `GROUP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `ADDITIONAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OPTIONS` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_placement1` (`APP_ID`,`PLACEMENT`(100),`PLACEMENT_HANDLER`(200)),
  KEY `ix_b_rest_placement3` (`PLACEMENT`(100),`ADDITIONAL`(100)),
  KEY `ix_b_rest_placement4` (`PLACEMENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_placement_lang`;
CREATE TABLE `b_rest_placement_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PLACEMENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `b_rest_placement_lang_unique` (`PLACEMENT_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_stat`;
CREATE TABLE `b_rest_stat` (
  `STAT_DATE` date NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `METHOD_ID` int(11) NOT NULL,
  `HOUR_0` int(11) NOT NULL DEFAULT '0',
  `HOUR_1` int(11) NOT NULL DEFAULT '0',
  `HOUR_2` int(11) NOT NULL DEFAULT '0',
  `HOUR_3` int(11) NOT NULL DEFAULT '0',
  `HOUR_4` int(11) NOT NULL DEFAULT '0',
  `HOUR_5` int(11) NOT NULL DEFAULT '0',
  `HOUR_6` int(11) NOT NULL DEFAULT '0',
  `HOUR_7` int(11) NOT NULL DEFAULT '0',
  `HOUR_8` int(11) NOT NULL DEFAULT '0',
  `HOUR_9` int(11) NOT NULL DEFAULT '0',
  `HOUR_10` int(11) NOT NULL DEFAULT '0',
  `HOUR_11` int(11) NOT NULL DEFAULT '0',
  `HOUR_12` int(11) NOT NULL DEFAULT '0',
  `HOUR_13` int(11) NOT NULL DEFAULT '0',
  `HOUR_14` int(11) NOT NULL DEFAULT '0',
  `HOUR_15` int(11) NOT NULL DEFAULT '0',
  `HOUR_16` int(11) NOT NULL DEFAULT '0',
  `HOUR_17` int(11) NOT NULL DEFAULT '0',
  `HOUR_18` int(11) NOT NULL DEFAULT '0',
  `HOUR_19` int(11) NOT NULL DEFAULT '0',
  `HOUR_20` int(11) NOT NULL DEFAULT '0',
  `HOUR_21` int(11) NOT NULL DEFAULT '0',
  `HOUR_22` int(11) NOT NULL DEFAULT '0',
  `HOUR_23` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`APP_ID`,`STAT_DATE`,`METHOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_stat_app`;
CREATE TABLE `b_rest_stat_app` (
  `APP_ID` int(11) NOT NULL,
  `APP_CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`APP_ID`),
  KEY `ix_b_rest_stat_app_code` (`APP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_stat_method`;
CREATE TABLE `b_rest_stat_method` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `METHOD_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_stat_method` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_usage_entity`;
CREATE TABLE `b_rest_usage_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_usage_entity` (`ENTITY_TYPE`,`ENTITY_ID`,`SUB_ENTITY_TYPE`,`SUB_ENTITY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_rest_usage_stat`;
CREATE TABLE `b_rest_usage_stat` (
  `STAT_DATE` date NOT NULL,
  `ENTITY_ID` int(11) NOT NULL DEFAULT '0',
  `IS_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HOUR_0` int(11) NOT NULL DEFAULT '0',
  `HOUR_1` int(11) NOT NULL DEFAULT '0',
  `HOUR_2` int(11) NOT NULL DEFAULT '0',
  `HOUR_3` int(11) NOT NULL DEFAULT '0',
  `HOUR_4` int(11) NOT NULL DEFAULT '0',
  `HOUR_5` int(11) NOT NULL DEFAULT '0',
  `HOUR_6` int(11) NOT NULL DEFAULT '0',
  `HOUR_7` int(11) NOT NULL DEFAULT '0',
  `HOUR_8` int(11) NOT NULL DEFAULT '0',
  `HOUR_9` int(11) NOT NULL DEFAULT '0',
  `HOUR_10` int(11) NOT NULL DEFAULT '0',
  `HOUR_11` int(11) NOT NULL DEFAULT '0',
  `HOUR_12` int(11) NOT NULL DEFAULT '0',
  `HOUR_13` int(11) NOT NULL DEFAULT '0',
  `HOUR_14` int(11) NOT NULL DEFAULT '0',
  `HOUR_15` int(11) NOT NULL DEFAULT '0',
  `HOUR_16` int(11) NOT NULL DEFAULT '0',
  `HOUR_17` int(11) NOT NULL DEFAULT '0',
  `HOUR_18` int(11) NOT NULL DEFAULT '0',
  `HOUR_19` int(11) NOT NULL DEFAULT '0',
  `HOUR_20` int(11) NOT NULL DEFAULT '0',
  `HOUR_21` int(11) NOT NULL DEFAULT '0',
  `HOUR_22` int(11) NOT NULL DEFAULT '0',
  `HOUR_23` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STAT_DATE`,`ENTITY_ID`),
  KEY `ix_b_rest_usage` (`ENTITY_ID`,`STAT_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_search_content`;
CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_search_content_freq`;
CREATE TABLE `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_search_content_param`;
CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_search_content_right`;
CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_search_content_site`;
CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_search_content_stem`;
CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;


DROP TABLE IF EXISTS `b_search_content_text`;
CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_search_content_title`;
CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;


DROP TABLE IF EXISTS `b_search_custom_rank`;
CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_search_phrase`;
CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_search_stem`;
CREATE TABLE `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_search_suggest`;
CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_search_tags`;
CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;


DROP TABLE IF EXISTS `b_search_user_right`;
CREATE TABLE `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_adv_autolog`;
CREATE TABLE `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT '0',
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_adv_banner`;
CREATE TABLE `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_adv_campaign`;
CREATE TABLE `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_adv_group`;
CREATE TABLE `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_adv_link`;
CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_adv_log`;
CREATE TABLE `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_adv_order`;
CREATE TABLE `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_adv_region`;
CREATE TABLE `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_keywords`;
CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_search_engine`;
CREATE TABLE `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_seo_search_engine` (`ID`, `CODE`, `ACTIVE`, `SORT`, `NAME`, `CLIENT_ID`, `CLIENT_SECRET`, `REDIRECT_URI`, `SETTINGS`) VALUES
(1,	'google',	'Y',	200,	'Google',	'868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com',	'EItMlJpZLC2WRPKB6QsA5bV9',	'urn:ietf:wg:oauth:2.0:oob',	NULL),
(2,	'yandex',	'Y',	300,	'Yandex',	'f848c7bfc1d34a94ba6d05439f81bbd7',	'da0e73b2d9cc4e809f3170e49cb9df01',	'https://oauth.yandex.ru/verification_code',	NULL),
(3,	'yandex_direct',	'Y',	400,	'Yandex.Direct',	'',	'',	'https://oauth.yandex.ru/verification_code',	NULL);

DROP TABLE IF EXISTS `b_seo_service_log`;
CREATE TABLE `b_seo_service_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_service_queue`;
CREATE TABLE `b_seo_service_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `SERVICE_TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_QUEUE_TYPE` (`TYPE`),
  KEY `IX_B_SEO_SERVICE_SERVICE_TYPE_CLIENT_ID` (`SERVICE_TYPE`,`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_service_rtg_queue`;
CREATE TABLE `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCOUNT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PARENT_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_service_subscription`;
CREATE TABLE `b_seo_service_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALLBACK_SERVER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_SUB_1` (`TYPE`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_service_webhook`;
CREATE TABLE `b_seo_service_webhook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_sitemap`;
CREATE TABLE `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_sitemap_entity`;
CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_sitemap_iblock`;
CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_sitemap_runtime`;
CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_seo_yandex_direct_stat`;
CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_short_uri`;
CREATE TABLE `b_short_uri` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(11) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_site_template`;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_site_template` (`ID`, `SITE_ID`, `CONDITION`, `SORT`, `TEMPLATE`) VALUES
(1,	's1',	'',	1,	'vc-personal');

DROP TABLE IF EXISTS `b_smile`;
CREATE TABLE `b_smile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(11) NOT NULL DEFAULT '0',
  `SORT` int(11) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `HIDDEN`, `IMAGE`, `IMAGE_DEFINITION`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
(1,	'S',	2,	100,	':) :-)',	'Y',	'N',	'bx_smile_smile.png',	'UHD',	20,	20),
(2,	'S',	2,	105,	';) ;-)',	'Y',	'N',	'bx_smile_wink.png',	'UHD',	20,	20),
(3,	'S',	2,	110,	':D :-D',	'Y',	'N',	'bx_smile_biggrin.png',	'UHD',	20,	20),
(4,	'S',	2,	115,	'8-)',	'Y',	'N',	'bx_smile_cool.png',	'UHD',	20,	20),
(5,	'S',	2,	120,	':facepalm:',	'Y',	'N',	'bx_smile_facepalm.png',	'UHD',	20,	20),
(6,	'S',	2,	125,	':{} :-{}',	'Y',	'N',	'bx_smile_kiss.png',	'UHD',	20,	20),
(7,	'S',	2,	130,	':( :-(',	'Y',	'N',	'bx_smile_sad.png',	'UHD',	20,	20),
(8,	'S',	2,	135,	':| :-|',	'Y',	'N',	'bx_smile_neutral.png',	'UHD',	20,	20),
(9,	'S',	2,	140,	':oops:',	'Y',	'N',	'bx_smile_redface.png',	'UHD',	20,	20),
(10,	'S',	2,	145,	':cry: :~(',	'Y',	'N',	'bx_smile_cry.png',	'UHD',	20,	20),
(11,	'S',	2,	150,	':evil: >:-<',	'Y',	'N',	'bx_smile_evil.png',	'UHD',	20,	20),
(12,	'S',	2,	155,	':o :-o :shock:',	'Y',	'N',	'bx_smile_eek.png',	'UHD',	20,	20),
(13,	'S',	2,	160,	':/ :-/',	'Y',	'N',	'bx_smile_confuse.png',	'UHD',	20,	20),
(14,	'S',	2,	165,	':idea:',	'Y',	'N',	'bx_smile_idea.png',	'UHD',	20,	20),
(15,	'S',	2,	170,	':?:',	'Y',	'N',	'bx_smile_question.png',	'UHD',	20,	20),
(16,	'S',	2,	175,	':!:',	'Y',	'N',	'bx_smile_exclaim.png',	'UHD',	20,	20),
(17,	'S',	2,	180,	':like:',	'Y',	'N',	'bx_smile_like.png',	'UHD',	20,	20),
(18,	'I',	2,	175,	'ICON_NOTE',	'Y',	'N',	'bx_icon_1.gif',	'SD',	15,	15),
(19,	'I',	2,	180,	'ICON_DIRRECTION',	'Y',	'N',	'bx_icon_2.gif',	'SD',	15,	15),
(20,	'I',	2,	185,	'ICON_IDEA',	'Y',	'N',	'bx_icon_3.gif',	'SD',	15,	15),
(21,	'I',	2,	190,	'ICON_ATTANSION',	'Y',	'N',	'bx_icon_4.gif',	'SD',	15,	15),
(22,	'I',	2,	195,	'ICON_QUESTION',	'Y',	'N',	'bx_icon_5.gif',	'SD',	15,	15),
(23,	'I',	2,	200,	'ICON_BAD',	'Y',	'N',	'bx_icon_6.gif',	'SD',	15,	15),
(24,	'I',	2,	205,	'ICON_GOOD',	'Y',	'N',	'bx_icon_7.gif',	'SD',	15,	15);

DROP TABLE IF EXISTS `b_smile_lang`;
CREATE TABLE `b_smile_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
(1,	'P',	1,	'ru',	'Стандартная галерея'),
(2,	'P',	1,	'en',	'Standard gallery'),
(3,	'G',	2,	'ru',	'Основной набор'),
(4,	'G',	2,	'en',	'Default pack'),
(5,	'S',	1,	'ru',	'С улыбкой'),
(6,	'S',	1,	'en',	'Smile'),
(7,	'S',	2,	'ru',	'Шутливо'),
(8,	'S',	2,	'en',	'Wink'),
(9,	'S',	3,	'ru',	'Широкая улыбка'),
(10,	'S',	3,	'en',	'Big grin'),
(11,	'S',	4,	'ru',	'Здорово'),
(12,	'S',	4,	'en',	'Cool'),
(13,	'S',	5,	'ru',	'Разочарование'),
(14,	'S',	5,	'en',	'Facepalm'),
(15,	'S',	6,	'ru',	'Поцелуй'),
(16,	'S',	6,	'en',	'Kiss'),
(17,	'S',	7,	'ru',	'Печально'),
(18,	'S',	7,	'en',	'Sad'),
(19,	'S',	8,	'ru',	'Скептически'),
(20,	'S',	8,	'en',	'Skeptic'),
(21,	'S',	9,	'ru',	'Смущенный'),
(22,	'S',	9,	'en',	'Embarrassed'),
(23,	'S',	10,	'ru',	'Очень грустно'),
(24,	'S',	10,	'en',	'Crying'),
(25,	'S',	11,	'ru',	'Со злостью'),
(26,	'S',	11,	'en',	'Angry'),
(27,	'S',	12,	'ru',	'Удивленно'),
(28,	'S',	12,	'en',	'Surprised'),
(29,	'S',	13,	'ru',	'Смущенно'),
(30,	'S',	13,	'en',	'Confused'),
(31,	'S',	14,	'ru',	'Идея'),
(32,	'S',	14,	'en',	'Idea'),
(33,	'S',	15,	'ru',	'Вопрос'),
(34,	'S',	15,	'en',	'Question'),
(35,	'S',	16,	'ru',	'Восклицание'),
(36,	'S',	16,	'en',	'Exclamation'),
(37,	'S',	17,	'ru',	'Нравится'),
(38,	'S',	17,	'en',	'Like');

DROP TABLE IF EXISTS `b_smile_set`;
CREATE TABLE `b_smile_set` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(11) NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile_set` (`ID`, `TYPE`, `PARENT_ID`, `STRING_ID`, `SORT`) VALUES
(1,	'P',	0,	'bitrix',	150),
(2,	'G',	1,	'bitrix_main',	150);

DROP TABLE IF EXISTS `b_sms_template`;
CREATE TABLE `b_sms_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SENDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECEIVER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_sms_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_sms_template` (`ID`, `EVENT_NAME`, `ACTIVE`, `SENDER`, `RECEIVER`, `MESSAGE`, `LANGUAGE_ID`) VALUES
(1,	'SMS_USER_CONFIRM_NUMBER',	'Y',	'#DEFAULT_SENDER#',	'#USER_PHONE#',	'Код подтверждения #CODE#',	NULL),
(2,	'SMS_USER_RESTORE_PASSWORD',	'Y',	'#DEFAULT_SENDER#',	'#USER_PHONE#',	'Код для восстановления пароля #CODE#',	NULL),
(3,	'SMS_EVENT_LOG_NOTIFICATION',	'Y',	'#DEFAULT_SENDER#',	'#PHONE_NUMBER#',	'#NAME#: #ADDITIONAL_TEXT# (событий: #EVENT_COUNT#)',	NULL);

DROP TABLE IF EXISTS `b_sms_template_site`;
CREATE TABLE `b_sms_template_site` (
  `TEMPLATE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_sms_template_site` (`TEMPLATE_ID`, `SITE_ID`) VALUES
(1,	's1'),
(2,	's1'),
(3,	's1');

DROP TABLE IF EXISTS `b_sm_version_history`;
CREATE TABLE `b_sm_version_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `VERSIONS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_socialservices_ap`;
CREATE TABLE `b_socialservices_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_socialservices_contact`;
CREATE TABLE `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_socialservices_contact_connect`;
CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_socialservices_message`;
CREATE TABLE `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_socialservices_user`;
CREATE TABLE `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` text COLLATE utf8_unicode_ci,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` text COLLATE utf8_unicode_ci,
  `REFRESH_TOKEN` text COLLATE utf8_unicode_ci,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`),
  KEY `IX_B_SOCIALSERVICES_US_4` (`USER_ID`,`EXTERNAL_AUTH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_socialservices_user_link`;
CREATE TABLE `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_socialservices_zoom_meeting`;
CREATE TABLE `b_socialservices_zoom_meeting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CONFERENCE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFERENCE_EXTERNAL_ID` bigint(20) unsigned NOT NULL,
  `CONFERENCE_PASSWORD` text COLLATE utf8_unicode_ci,
  `JOINED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFERENCE_CREATED` datetime DEFAULT NULL,
  `CONFERENCE_STARTED` datetime DEFAULT NULL,
  `CONFERENCE_ENDED` datetime DEFAULT NULL,
  `DURATION` int(11) DEFAULT NULL,
  `TITLE` text COLLATE utf8_unicode_ci,
  `SHORT_LINK` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_RECORDING` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_1` (`CONFERENCE_EXTERNAL_ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_socialservices_zoom_meeting_recording`;
CREATE TABLE `b_socialservices_zoom_meeting_recording` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXTERNAL_ID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `MEETING_ID` int(11) NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `FILE_TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) NOT NULL,
  `PLAY_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOWNLOAD_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECORDING_TYPE` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `DOWNLOAD_TOKEN` text COLLATE utf8_unicode_ci,
  `PASSWORD` text COLLATE utf8_unicode_ci,
  `FILE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_RECORDING_1` (`MEETING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_sticker`;
CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_sticker_group_task`;
CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_task`;
CREATE TABLE `b_task` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
(1,	'main_denied',	'D',	'main',	'Y',	NULL,	'module'),
(2,	'main_change_profile',	'P',	'main',	'Y',	NULL,	'module'),
(3,	'main_view_all_settings',	'R',	'main',	'Y',	NULL,	'module'),
(4,	'main_view_all_settings_change_profile',	'T',	'main',	'Y',	NULL,	'module'),
(5,	'main_edit_subordinate_users',	'V',	'main',	'Y',	NULL,	'module'),
(6,	'main_full_access',	'W',	'main',	'Y',	NULL,	'module'),
(7,	'fm_folder_access_denied',	'D',	'main',	'Y',	NULL,	'file'),
(8,	'fm_folder_access_read',	'R',	'main',	'Y',	NULL,	'file'),
(9,	'fm_folder_access_write',	'W',	'main',	'Y',	NULL,	'file'),
(10,	'fm_folder_access_full',	'X',	'main',	'Y',	NULL,	'file'),
(11,	'fm_folder_access_workflow',	'U',	'main',	'Y',	NULL,	'file'),
(12,	'bitrixcloud_deny',	'D',	'bitrixcloud',	'Y',	NULL,	'module'),
(13,	'bitrixcloud_control',	'W',	'bitrixcloud',	'Y',	NULL,	'module'),
(14,	'clouds_denied',	'D',	'clouds',	'Y',	NULL,	'module'),
(15,	'clouds_browse',	'F',	'clouds',	'Y',	NULL,	'module'),
(16,	'clouds_upload',	'U',	'clouds',	'Y',	NULL,	'module'),
(17,	'clouds_full_access',	'W',	'clouds',	'Y',	NULL,	'module'),
(18,	'fileman_denied',	'D',	'fileman',	'Y',	'',	'module'),
(19,	'fileman_allowed_folders',	'F',	'fileman',	'Y',	'',	'module'),
(20,	'fileman_full_access',	'W',	'fileman',	'Y',	'',	'module'),
(21,	'medialib_denied',	'D',	'fileman',	'Y',	'',	'medialib'),
(22,	'medialib_view',	'F',	'fileman',	'Y',	'',	'medialib'),
(23,	'medialib_only_new',	'R',	'fileman',	'Y',	'',	'medialib'),
(24,	'medialib_edit_items',	'V',	'fileman',	'Y',	'',	'medialib'),
(25,	'medialib_editor',	'W',	'fileman',	'Y',	'',	'medialib'),
(26,	'medialib_full',	'X',	'fileman',	'Y',	'',	'medialib'),
(27,	'stickers_denied',	'D',	'fileman',	'Y',	'',	'stickers'),
(28,	'stickers_read',	'R',	'fileman',	'Y',	'',	'stickers'),
(29,	'stickers_edit',	'W',	'fileman',	'Y',	'',	'stickers'),
(30,	'hblock_denied',	'D',	'highloadblock',	'Y',	NULL,	'module'),
(31,	'hblock_read',	'R',	'highloadblock',	'Y',	NULL,	'module'),
(32,	'hblock_write',	'W',	'highloadblock',	'Y',	NULL,	'module'),
(33,	'iblock_deny',	'D',	'iblock',	'Y',	NULL,	'iblock'),
(34,	'iblock_read',	'R',	'iblock',	'Y',	NULL,	'iblock'),
(35,	'iblock_element_add',	'E',	'iblock',	'Y',	NULL,	'iblock'),
(36,	'iblock_admin_read',	'S',	'iblock',	'Y',	NULL,	'iblock'),
(37,	'iblock_admin_add',	'T',	'iblock',	'Y',	NULL,	'iblock'),
(38,	'iblock_limited_edit',	'U',	'iblock',	'Y',	NULL,	'iblock'),
(39,	'iblock_full_edit',	'W',	'iblock',	'Y',	NULL,	'iblock'),
(40,	'iblock_full',	'X',	'iblock',	'Y',	NULL,	'iblock'),
(41,	'landing_right_denied',	'D',	'landing',	'Y',	NULL,	'module'),
(42,	'landing_right_read',	'R',	'landing',	'Y',	NULL,	'module'),
(43,	'landing_right_edit',	'U',	'landing',	'Y',	NULL,	'module'),
(44,	'landing_right_sett',	'V',	'landing',	'Y',	NULL,	'module'),
(45,	'landing_right_public',	'W',	'landing',	'Y',	NULL,	'module'),
(46,	'landing_right_delete',	'X',	'landing',	'Y',	NULL,	'module'),
(47,	'seo_denied',	'D',	'seo',	'Y',	'',	'module'),
(48,	'seo_edit',	'F',	'seo',	'Y',	'',	'module'),
(49,	'seo_full_access',	'W',	'seo',	'Y',	'',	'module');

DROP TABLE IF EXISTS `b_task_operation`;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(11) NOT NULL,
  `OPERATION_ID` int(11) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
(2,	2),
(2,	3),
(3,	2),
(3,	4),
(3,	5),
(3,	6),
(3,	7),
(4,	2),
(4,	3),
(4,	4),
(4,	5),
(4,	6),
(4,	7),
(5,	2),
(5,	3),
(5,	5),
(5,	6),
(5,	7),
(5,	8),
(5,	9),
(6,	2),
(6,	3),
(6,	4),
(6,	5),
(6,	6),
(6,	7),
(6,	10),
(6,	11),
(6,	12),
(6,	13),
(6,	14),
(6,	15),
(6,	16),
(6,	17),
(6,	18),
(8,	19),
(8,	20),
(8,	21),
(9,	19),
(9,	20),
(9,	21),
(9,	22),
(9,	23),
(9,	24),
(9,	25),
(9,	26),
(9,	27),
(9,	28),
(9,	29),
(9,	30),
(9,	31),
(9,	32),
(9,	33),
(9,	34),
(10,	19),
(10,	20),
(10,	21),
(10,	22),
(10,	23),
(10,	24),
(10,	25),
(10,	26),
(10,	27),
(10,	28),
(10,	29),
(10,	30),
(10,	31),
(10,	32),
(10,	33),
(10,	34),
(10,	35),
(11,	19),
(11,	20),
(11,	21),
(11,	24),
(11,	28),
(13,	36),
(13,	37),
(15,	38),
(16,	38),
(16,	39),
(17,	38),
(17,	39),
(17,	40),
(19,	43),
(19,	44),
(19,	45),
(19,	46),
(19,	47),
(19,	48),
(19,	49),
(19,	51),
(19,	52),
(20,	41),
(20,	42),
(20,	43),
(20,	44),
(20,	45),
(20,	46),
(20,	47),
(20,	48),
(20,	49),
(20,	50),
(20,	51),
(20,	52),
(20,	53),
(22,	54),
(23,	54),
(23,	55),
(23,	59),
(24,	54),
(24,	59),
(24,	60),
(24,	61),
(25,	54),
(25,	55),
(25,	56),
(25,	57),
(25,	59),
(25,	60),
(25,	61),
(26,	54),
(26,	55),
(26,	56),
(26,	57),
(26,	58),
(26,	59),
(26,	60),
(26,	61),
(28,	62),
(29,	62),
(29,	63),
(29,	64),
(29,	65),
(31,	66),
(32,	67),
(32,	68),
(34,	69),
(34,	70),
(35,	71),
(36,	69),
(36,	70),
(36,	72),
(37,	69),
(37,	70),
(37,	71),
(37,	72),
(38,	69),
(38,	70),
(38,	71),
(38,	72),
(38,	73),
(38,	74),
(38,	75),
(38,	76),
(39,	69),
(39,	70),
(39,	71),
(39,	72),
(39,	73),
(39,	74),
(39,	75),
(39,	76),
(39,	77),
(39,	78),
(39,	79),
(39,	80),
(40,	69),
(40,	70),
(40,	71),
(40,	72),
(40,	73),
(40,	74),
(40,	75),
(40,	76),
(40,	77),
(40,	78),
(40,	79),
(40,	80),
(40,	81),
(40,	82),
(40,	83),
(40,	84),
(40,	85),
(40,	86),
(42,	87),
(43,	88),
(44,	89),
(45,	90),
(46,	91),
(48,	93),
(49,	92),
(49,	93);

DROP TABLE IF EXISTS `b_translate_diff`;
CREATE TABLE `b_translate_diff` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `AGAINST_LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EXCESS_COUNT` int(18) NOT NULL DEFAULT '0',
  `DEFICIENCY_COUNT` int(18) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_DIFF` (`FILE_ID`,`LANG_ID`,`AGAINST_LANG_ID`),
  KEY `IX_TRNSL_DIFF_PATH` (`PATH_ID`,`LANG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_translate_file`;
CREATE TABLE `b_translate_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FULL_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE_COUNT` int(18) NOT NULL DEFAULT '0',
  `INDEXED` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_FL_PATH` (`PATH_ID`,`LANG_ID`),
  KEY `IX_TRNSL_FULL_PATH` (`FULL_PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_translate_path`;
CREATE TABLE `b_translate_path` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) NOT NULL DEFAULT '0',
  `DEPTH_LEVEL` int(18) NOT NULL DEFAULT '0',
  `SORT` int(18) NOT NULL DEFAULT '0',
  `PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IS_LANG` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_DIR` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `OBLIGATORY_LANGS` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEXED` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASSIGNMENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_PTH_NAME` (`PARENT_ID`,`NAME`),
  KEY `IX_TRNSL_PTH_PARENT` (`PARENT_ID`,`IS_DIR`,`IS_LANG`),
  KEY `IX_TRNSL_PTH_PATH` (`PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_translate_path_lang`;
CREATE TABLE `b_translate_path_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_TRNSL_LNG_PATH` (`PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_translate_path_tree`;
CREATE TABLE `b_translate_path_tree` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_ANCESTOR` (`PARENT_ID`,`DEPTH_LEVEL`,`PATH_ID`),
  UNIQUE KEY `IX_TRNSL_DESCENDANT` (`PATH_ID`,`PARENT_ID`,`DEPTH_LEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_translate_phrase`;
CREATE TABLE `b_translate_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PHRASE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_PHR_PATH_CODE` (`PATH_ID`,`LANG_ID`,`CODE`),
  KEY `IX_TRNSL_PHR_PATH` (`PATH_ID`,`CODE`),
  KEY `IX_TRNSL_FILE` (`FILE_ID`),
  FULLTEXT KEY `IXF_TRNSL_PHR` (`PHRASE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;


DROP TABLE IF EXISTS `b_ui_avatar_mask_access`;
CREATE TABLE `b_ui_avatar_mask_access` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int(11) NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_UI_AVATAR_MASK_RIGHT_3` (`ITEM_ID`,`ACCESS_CODE`),
  KEY `B_UI_AVATAR_MASK_RIGHT_1` (`ITEM_ID`),
  KEY `B_UI_AVATAR_MASK_RIGHT_2` (`ACCESS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_ui_avatar_mask_file_deleted`;
CREATE TABLE `b_ui_avatar_mask_file_deleted` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ENTITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_FILE_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_1` (`ENTITY`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_2` (`ITEM_ID`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_3` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_ui_avatar_mask_group`;
CREATE TABLE `b_ui_avatar_mask_group` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_UI_AVATAR_MASK_GROUP_OWNER` (`OWNER_ID`,`OWNER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_ui_avatar_mask_item`;
CREATE TABLE `b_ui_avatar_mask_item` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `GROUP_ID` int(10) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `B_UI_AVATAR_MASK_ITEM_OWNER` (`OWNER_TYPE`,`OWNER_ID`),
  KEY `B_UI_AVATAR_MASK_ITEM_FILE_ID` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_ui_avatar_mask_item_applied_to`;
CREATE TABLE `b_ui_avatar_mask_item_applied_to` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ORIGINAL_FILE_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `b_ui_avatar_mask_item_applied1` (`FILE_ID`,`ITEM_ID`),
  KEY `b_ui_avatar_mask_item_applied2` (`ITEM_ID`),
  KEY `b_ui_avatar_mask_item_applied3` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_ui_avatar_mask_recently_used`;
CREATE TABLE `b_ui_avatar_mask_recently_used` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_UI_AVATAR_MASK_ITEM_R_OWNER` (`ITEM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_ui_entity_editor_config`;
CREATE TABLE `b_ui_entity_editor_config` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CATEGORY` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `CATEGORY` (`CATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_ui_entity_editor_config_ac`;
CREATE TABLE `b_ui_entity_editor_config_ac` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACCESS_CODE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ACCESS_CODE` (`ACCESS_CODE`),
  KEY `CONFIG_ID` (`CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_ui_file_uploader_temp_file`;
CREATE TABLE `b_ui_file_uploader_temp_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GUID` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int(11) DEFAULT NULL,
  `FILENAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SIZE` bigint(20) NOT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MIMETYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RECEIVED_SIZE` bigint(20) NOT NULL DEFAULT '0',
  `WIDTH` int(11) NOT NULL DEFAULT '0',
  `HEIGHT` int(11) NOT NULL DEFAULT '0',
  `BUCKET_ID` int(11) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONTROLLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLOUD` tinyint(1) NOT NULL DEFAULT '0',
  `UPLOADED` tinyint(1) NOT NULL DEFAULT '0',
  `DELETED` tinyint(1) NOT NULL DEFAULT '0',
  `CREATED_BY` int(11) NOT NULL DEFAULT '0',
  `CREATED_AT` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_UI_UPLOADER_GUID` (`GUID`),
  KEY `IX_B_UI_UPLOADER_FILE_ID` (`FILE_ID`),
  KEY `IX_B_UI_UPLOADER_CREATED_AT` (`CREATED_AT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_undo`;
CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_urlpreview_metadata`;
CREATE TABLE `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci,
  `EXTRA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_urlpreview_route`;
CREATE TABLE `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_urlpreview_route` (`ID`, `ROUTE`, `MODULE`, `CLASS`, `PARAMETERS`) VALUES
(1,	'/knowledge/#knowledgeCode#/',	'landing',	'\\Bitrix\\Landing\\Landing\\UrlPreview',	'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:9:\"knowledge\";s:12:\"allowSlashes\";s:1:\"N\";}'),
(2,	'/knowledge/group/#knowledgeCode#/',	'landing',	'\\Bitrix\\Landing\\Landing\\UrlPreview',	'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:5:\"group\";s:12:\"allowSlashes\";s:1:\"N\";}');

DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(11) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(11) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(11) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BLOCKED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PASSWORD_EXPIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`),
  KEY `ix_user_last_login` (`LAST_LOGIN`),
  KEY `ix_user_date_register` (`DATE_REGISTER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`, `BX_USER_ID`, `LANGUAGE_ID`, `BLOCKED`, `PASSWORD_EXPIRED`) VALUES
(1,	'2024-06-16 13:28:44',	'admin',	'$6$7iLc92UUKwJBzy0q$IijcHO8fLczdrP9V7Ybqyoz4lSdMOqhVO8eNQUT0VffxouEDOglAE4FeabLhcVu.uQD4l1Fddqn8weAxCDNc..',	'$6$97NCDfEUeFB0IMPD$RJ4Rwb6bSj61UYO2YV0LJ7Pd639pdIOjXvh.f02PqkaZ14zm7K7G3MWU.WOb8Kx3h0ZqLXiFrhnzL21hbkQaO.',	'Y',	'',	'',	'a.isaev@vladit.ru',	'2024-06-16 13:36:19',	'2024-06-16 13:28:44',	NULL,	NULL,	NULL,	NULL,	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2024-06-16 13:28:44',	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'a183c9eca9c07db6e16da715c5a0bf7a',	NULL,	'N',	'N');

DROP TABLE IF EXISTS `b_user_access`;
CREATE TABLE `b_user_access` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`),
  KEY `ix_ua_provider` (`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_access` (`ID`, `USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
(1,	0,	'group',	'G2'),
(2,	1,	'group',	'G1'),
(3,	1,	'group',	'G3'),
(4,	1,	'group',	'G4'),
(5,	1,	'group',	'G2'),
(9,	1,	'user',	'U1');

DROP TABLE IF EXISTS `b_user_access_check`;
CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ux_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_auth_action`;
CREATE TABLE `b_user_auth_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT '100',
  `ACTION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  KEY `ix_auth_action_date` (`ACTION_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_auth_action` (`ID`, `USER_ID`, `PRIORITY`, `ACTION`, `ACTION_DATE`, `APPLICATION_ID`) VALUES
(1,	1,	200,	'update',	'2024-06-16 16:28:44',	NULL);

DROP TABLE IF EXISTS `b_user_auth_code`;
CREATE TABLE `b_user_auth_code` (
  `USER_ID` int(11) NOT NULL,
  `CODE_TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  `OTP_SECRET` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(11) DEFAULT '0',
  `DATE_SENT` datetime DEFAULT NULL,
  `DATE_RESENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_counter`;
CREATE TABLE `b_user_counter` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(11) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_counter_user_site_code` (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_device`;
CREATE TABLE `b_user_device` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) unsigned NOT NULL,
  `DEVICE_UID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DEVICE_TYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `BROWSER` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PLATFORM` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COOKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_user_device_user` (`USER_ID`,`DEVICE_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_device_login`;
CREATE TABLE `b_user_device_login` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` bigint(20) unsigned NOT NULL,
  `LOGIN_DATE` datetime DEFAULT NULL,
  `IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CITY_GEOID` bigint(20) DEFAULT NULL,
  `REGION_GEOID` bigint(20) DEFAULT NULL,
  `COUNTRY_ISO_CODE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_PASSWORD_ID` bigint(20) unsigned DEFAULT NULL,
  `STORED_AUTH_ID` bigint(20) unsigned DEFAULT NULL,
  `HIT_AUTH_ID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_user_device_login_device` (`DEVICE_ID`),
  KEY `ix_user_device_login_date` (`LOGIN_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_digest`;
CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_field`;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_field_confirm`;
CREATE TABLE `b_user_field_confirm` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `DATE_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ATTEMPTS` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_field_enum`;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_field_lang`;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_field_permission`;
CREATE TABLE `b_user_field_permission` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` tinyint(3) unsigned NOT NULL,
  `USER_FIELD_ID` int(10) unsigned NOT NULL,
  `ACCESS_CODE` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `PERMISSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ENTITY_TYPE_ID`),
  KEY `GROUP_ID` (`USER_FIELD_ID`),
  KEY `PERMISSION_ID` (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_group`;
CREATE TABLE `b_user_group` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
(1,	1,	NULL,	NULL),
(1,	3,	NULL,	NULL),
(1,	4,	NULL,	NULL);

DROP TABLE IF EXISTS `b_user_hit_auth`;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VALID_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_index`;
CREATE TABLE `b_user_index` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_USER_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_DEPARTMENT_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_ADMIN_CONTENT` text COLLATE utf8_unicode_ci,
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_index` (`USER_ID`, `SEARCH_USER_CONTENT`, `SEARCH_DEPARTMENT_CONTENT`, `SEARCH_ADMIN_CONTENT`, `NAME`, `LAST_NAME`, `SECOND_NAME`, `WORK_POSITION`, `UF_DEPARTMENT_NAME`) VALUES
(1,	'001',	'',	'001 vfnri iynqvg n.vfnri@iynqvg.eh nqzva',	'',	'',	'',	'',	'');

DROP TABLE IF EXISTS `b_user_option`;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
(1,	0,	'intranet',	'~gadgets_admin_index',	'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}',	'Y'),
(2,	1,	'admin_panel',	'settings',	'a:1:{s:4:\"edit\";s:3:\"off\";}',	'N'),
(3,	1,	'hot_keys',	'user_defined',	'b:1;',	'N'),
(4,	1,	'favorite',	'favorite_menu',	'a:1:{s:5:\"stick\";s:1:\"N\";}',	'N'),
(5,	1,	'socialservices',	'networkPopup',	'a:1:{s:9:\"showcount\";s:1:\"2\";}',	'N'),
(8,	1,	'admin_menu',	'pos',	'a:1:{s:8:\"sections\";s:11:\"menu_system\";}',	'N'),
(14,	1,	'fileman',	'code_editor',	'a:1:{s:5:\"theme\";s:5:\"light\";}',	'N'),
(16,	1,	'fileman',	'last_pathes',	's:64:\"a:2:{i:0;s:28:\"/local/templates/vc-personal\";i:1;s:7:\"/bitrix\";}\";',	'N');

DROP TABLE IF EXISTS `b_user_password`;
CREATE TABLE `b_user_password` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CHANGE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_user_password_user_date` (`USER_ID`,`DATE_CHANGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_password` (`ID`, `USER_ID`, `PASSWORD`, `DATE_CHANGE`) VALUES
(1,	1,	'$6$7iLc92UUKwJBzy0q$IijcHO8fLczdrP9V7Ybqyoz4lSdMOqhVO8eNQUT0VffxouEDOglAE4FeabLhcVu.uQD4l1Fddqn8weAxCDNc..',	'2024-06-16 16:28:44');

DROP TABLE IF EXISTS `b_user_phone_auth`;
CREATE TABLE `b_user_phone_auth` (
  `USER_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `OTP_SECRET` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(11) DEFAULT '0',
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DATE_SENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `ix_user_phone_auth_number` (`PHONE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_profile_history`;
CREATE TABLE `b_user_profile_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EVENT_TYPE` int(11) DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `UPDATED_BY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_history_user` (`USER_ID`),
  KEY `ix_profile_history_date` (`DATE_INSERT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_profile_record`;
CREATE TABLE `b_user_profile_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HISTORY_ID` int(11) NOT NULL,
  `FIELD` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_session`;
CREATE TABLE `b_user_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_user_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `b_user_stored_auth`;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_stored_auth` (`ID`, `USER_ID`, `DATE_REG`, `LAST_AUTH`, `STORED_HASH`, `TEMP_HASH`, `IP_ADDR`) VALUES
(1,	1,	'2024-06-16 16:28:44',	'2024-06-16 16:28:44',	'wgow3TYKu8MgXSA2bgeBDHJunpLKNsQa',	'N',	3169421336);

-- 2024-06-16 15:13:32
