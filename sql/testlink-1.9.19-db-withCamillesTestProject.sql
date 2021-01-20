-- MySQL dump 10.16  Distrib 10.2.31-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: testlink
-- ------------------------------------------------------
-- Server version	10.2.31-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment_status`
--

DROP TABLE IF EXISTS `assignment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_status`
--

LOCK TABLES `assignment_status` WRITE;
/*!40000 ALTER TABLE `assignment_status` DISABLE KEYS */;
INSERT INTO `assignment_status` VALUES (1,'open'),(2,'closed'),(3,'completed'),(4,'todo_urgent'),(5,'todo');
/*!40000 ALTER TABLE `assignment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_types`
--

DROP TABLE IF EXISTS `assignment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_table` varchar(30) DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_types`
--

LOCK TABLES `assignment_types` WRITE;
/*!40000 ALTER TABLE `assignment_types` DISABLE KEYS */;
INSERT INTO `assignment_types` VALUES (1,'testplan_tcversions','testcase_execution'),(2,'tcversions','testcase_review');
/*!40000 ALTER TABLE `assignment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fk_table` varchar(250) DEFAULT '',
  `title` varchar(250) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `file_name` varchar(250) NOT NULL DEFAULT '',
  `file_path` varchar(250) DEFAULT '',
  `file_size` int(11) NOT NULL DEFAULT 0,
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` longblob DEFAULT NULL,
  `compression_type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `attachments_idx1` (`fk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builds`
--

DROP TABLE IF EXISTS `builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `builds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `release_date` date DEFAULT NULL,
  `closed_on_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`testplan_id`,`name`),
  KEY `testplan_id` (`testplan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Available builds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builds`
--

LOCK TABLES `builds` WRITE;
/*!40000 ALTER TABLE `builds` DISABLE KEYS */;
INSERT INTO `builds` VALUES (1,76,'Monix 3.0','<p>Projet Monix (composants Monix et Morix) dans sa version 3.0</p>\r\n',1,1,NULL,'2020-02-07 23:05:08',NULL,NULL),(3,78,'Monix 3.0','<p>Projet Monix (composants Monix et Morix) dans sa version 3.0.</p>\r\n',1,1,NULL,'2020-02-07 23:07:28',NULL,NULL),(4,79,'Monix 3.0','<p>Projet Monix (composants Monix et Morix) dans sa version 3.0.</p>\r\n',1,1,NULL,'2020-02-07 23:45:34',NULL,NULL);
/*!40000 ALTER TABLE `builds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_build_design_values`
--

DROP TABLE IF EXISTS `cfield_build_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_build_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`node_id`),
  KEY `idx_cfield_build_design_values` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_build_design_values`
--

LOCK TABLES `cfield_build_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_build_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_build_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_design_values`
--

DROP TABLE IF EXISTS `cfield_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`node_id`),
  KEY `idx_cfield_design_values` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_design_values`
--

LOCK TABLES `cfield_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_execution_values`
--

DROP TABLE IF EXISTS `cfield_execution_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_execution_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `execution_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `tcversion_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`execution_id`,`testplan_id`,`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_execution_values`
--

LOCK TABLES `cfield_execution_values` WRITE;
/*!40000 ALTER TABLE `cfield_execution_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_execution_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_node_types`
--

DROP TABLE IF EXISTS `cfield_node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_node_types` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_type_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`node_type_id`),
  KEY `idx_custom_fields_assign` (`node_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_node_types`
--

LOCK TABLES `cfield_node_types` WRITE;
/*!40000 ALTER TABLE `cfield_node_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_testplan_design_values`
--

DROP TABLE IF EXISTS `cfield_testplan_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_testplan_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT 'point to testplan_tcversion id',
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`link_id`),
  KEY `idx_cfield_tplan_design_val` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_testplan_design_values`
--

LOCK TABLES `cfield_testplan_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_testplan_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_testplan_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_testprojects`
--

DROP TABLE IF EXISTS `cfield_testprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_testprojects` (
  `field_id` int(10) unsigned NOT NULL DEFAULT 0,
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `display_order` smallint(5) unsigned NOT NULL DEFAULT 1,
  `location` smallint(5) unsigned NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_design` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_execution` tinyint(1) NOT NULL DEFAULT 0,
  `monitorable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_testprojects`
--

LOCK TABLES `cfield_testprojects` WRITE;
/*!40000 ALTER TABLE `cfield_testprojects` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_testprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codetrackers`
--

DROP TABLE IF EXISTS `codetrackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codetrackers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codetrackers_uidx1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codetrackers`
--

LOCK TABLES `codetrackers` WRITE;
/*!40000 ALTER TABLE `codetrackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `codetrackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(64) NOT NULL DEFAULT '' COMMENT 'label to display on user interface',
  `type` smallint(6) NOT NULL DEFAULT 0,
  `possible_values` varchar(4000) NOT NULL DEFAULT '',
  `default_value` varchar(4000) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `length_min` int(10) NOT NULL DEFAULT 0,
  `length_max` int(10) NOT NULL DEFAULT 0,
  `show_on_design` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1=> show it during specification design',
  `enable_on_design` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1=> user can write/manage it during specification design',
  `show_on_execution` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '1=> show it during test case execution',
  `enable_on_execution` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '1=> user can write/manage it during test case execution',
  `show_on_testplan_design` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `enable_on_testplan_design` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_custom_fields_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_version` (
  `version` varchar(50) NOT NULL DEFAULT 'unknown',
  `upgrade_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES ('DB 1.9.19','2020-02-06 17:41:50','TestLink 1.9.19 Metonic cycle');
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL DEFAULT 0,
  `log_level` smallint(5) unsigned NOT NULL DEFAULT 0,
  `source` varchar(45) DEFAULT NULL,
  `description` text NOT NULL,
  `fired_at` int(10) unsigned NOT NULL DEFAULT 0,
  `activity` varchar(45) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `object_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `fired_at` (`fired_at`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,1,32,'GUI','string \'oauth_login\' is not localized for locale \'fr_FR\'  - using en_GB',1581056882,'LOCALIZATION',0,NULL),(2,2,32,'GUI','string \'oauth_login\' is not localized for locale \'fr_FR\'  - using en_GB',1581085285,'LOCALIZATION',0,NULL),(3,3,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:24:\"camille.constant@eseo.fr\";i:1;s:13:\"192.168.10.83\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085298,'LOGIN',2,'users'),(4,4,2,'GUI','E_NOTICE\nUndefined index: testprojectOptions - in /srv/testlink/lib/general/mainPage.php - Line 283',1581085298,'PHP',0,NULL),(5,4,2,'GUI','E_NOTICE\nTrying to get property of non-object - in /srv/testlink/lib/general/mainPage.php - Line 283',1581085298,'PHP',0,NULL),(6,4,32,'GUI','string \'poweredBy\' is not localized for locale \'fr_FR\'  - using en_GB',1581085298,'LOCALIZATION',0,NULL),(7,4,32,'GUI','string \'system_descr\' is not localized for locale \'fr_FR\'  - using en_GB',1581085298,'LOCALIZATION',0,NULL),(8,4,32,'GUI','string \'href_codetracker_management\' is not localized for locale \'fr_FR\'  - using en_GB',1581085299,'LOCALIZATION',0,NULL),(9,5,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:24:\"frederic.jouault@eseo.fr\";i:1;s:14:\"192.168.10.229\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085440,'LOGIN',3,'users'),(10,6,2,'GUI','E_NOTICE\nUndefined index: testprojectOptions - in /srv/testlink/lib/general/mainPage.php - Line 283',1581085440,'PHP',0,NULL),(11,6,2,'GUI','E_NOTICE\nTrying to get property of non-object - in /srv/testlink/lib/general/mainPage.php - Line 283',1581085440,'PHP',0,NULL),(12,7,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:24:\"camille.constant@eseo.fr\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085579,'LOGOUT',2,'users'),(13,8,32,'GUI','string \'oauth_login\' is not localized for locale \'fr_FR\'  - using en_GB',1581085579,'LOCALIZATION',0,NULL),(14,9,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:13:\"192.168.10.83\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085584,'LOGIN_FAILED',1,'users'),(15,10,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:13:\"192.168.10.83\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085588,'LOGIN',1,'users'),(16,11,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_testproject_created\";s:6:\"params\";a:1:{i:0;s:11:\"Monix-Morix\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085608,'CREATE',1,'testprojects'),(17,11,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:35:\"audit_users_roles_added_testproject\";s:6:\"params\";a:3:{i:0;s:5:\"admin\";i:1;s:11:\"Monix-Morix\";i:2;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085608,'ASSIGN',1,'testprojects'),(18,12,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:24:\"frederic.jouault@eseo.fr\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085794,'LOGOUT',3,'users'),(19,13,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:35:\"audit_users_roles_added_testproject\";s:6:\"params\";a:3:{i:0;s:24:\"camille.constant@eseo.fr\";i:1;s:11:\"Monix-Morix\";i:2;s:11:\"<no rights>\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085796,'ASSIGN',1,'testprojects'),(20,13,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:35:\"audit_users_roles_added_testproject\";s:6:\"params\";a:3:{i:0;s:24:\"frederic.jouault@eseo.fr\";i:1;s:11:\"Monix-Morix\";i:2;s:11:\"<no rights>\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085796,'ASSIGN',1,'testprojects'),(21,14,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:24:\"frederic.jouault@eseo.fr\";i:1;s:14:\"192.168.10.229\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085800,'LOGIN',3,'users'),(22,15,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:35:\"audit_users_roles_added_testproject\";s:6:\"params\";a:3:{i:0;s:24:\"camille.constant@eseo.fr\";i:1;s:11:\"Monix-Morix\";i:2;s:6:\"leader\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085803,'ASSIGN',1,'testprojects'),(23,15,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:35:\"audit_users_roles_added_testproject\";s:6:\"params\";a:3:{i:0;s:24:\"frederic.jouault@eseo.fr\";i:1;s:11:\"Monix-Morix\";i:2;s:11:\"<no rights>\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085803,'ASSIGN',1,'testprojects'),(24,16,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:35:\"audit_users_roles_added_testproject\";s:6:\"params\";a:3:{i:0;s:24:\"camille.constant@eseo.fr\";i:1;s:11:\"Monix-Morix\";i:2;s:6:\"leader\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085805,'ASSIGN',1,'testprojects'),(25,16,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:35:\"audit_users_roles_added_testproject\";s:6:\"params\";a:3:{i:0;s:24:\"frederic.jouault@eseo.fr\";i:1;s:11:\"Monix-Morix\";i:2;s:11:\"<no rights>\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085805,'ASSIGN',1,'testprojects'),(26,17,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:35:\"audit_users_roles_added_testproject\";s:6:\"params\";a:3:{i:0;s:24:\"camille.constant@eseo.fr\";i:1;s:11:\"Monix-Morix\";i:2;s:6:\"leader\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085811,'ASSIGN',1,'testprojects'),(27,17,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:35:\"audit_users_roles_added_testproject\";s:6:\"params\";a:3:{i:0;s:24:\"frederic.jouault@eseo.fr\";i:1;s:11:\"Monix-Morix\";i:2;s:11:\"<no rights>\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085811,'ASSIGN',1,'testprojects'),(28,18,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_role_saved\";s:6:\"params\";a:1:{i:0;s:6:\"leader\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085882,'SAVE',9,'roles'),(29,19,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:24:\"frederic.jouault@eseo.fr\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085896,'LOGOUT',3,'users'),(30,20,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:24:\"frederic.jouault@eseo.fr\";i:1;s:14:\"192.168.10.229\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085897,'LOGIN',3,'users'),(31,21,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:24:\"frederic.jouault@eseo.fr\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085915,'LOGOUT',3,'users'),(32,22,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:24:\"frederic.jouault@eseo.fr\";i:1;s:14:\"192.168.10.229\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085917,'LOGIN',3,'users'),(33,23,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_testproject_saved\";s:6:\"params\";a:1:{i:0;s:11:\"Monix-Morix\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581085997,'UPDATE',1,'testprojects'),(34,24,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086012,'LOGOUT',1,'users'),(35,25,32,'GUI','string \'oauth_login\' is not localized for locale \'fr_FR\'  - using en_GB',1581086012,'LOCALIZATION',0,NULL),(36,26,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:24:\"camille.constant@eseo.fr\";i:1;s:13:\"192.168.10.83\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086025,'LOGIN',2,'users'),(37,27,32,'GUI - Projet ID : 1','string \'poweredBy\' is not localized for locale \'fr_FR\'  - using en_GB',1581086025,'LOCALIZATION',0,NULL),(38,27,32,'GUI - Projet ID : 1','string \'system_descr\' is not localized for locale \'fr_FR\'  - using en_GB',1581086025,'LOCALIZATION',0,NULL),(39,27,32,'GUI - Projet ID : 1','string \'href_codetracker_management\' is not localized for locale \'fr_FR\'  - using en_GB',1581086025,'LOCALIZATION',0,NULL),(40,28,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:24:\"camille.constant@eseo.fr\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086347,'LOGOUT',2,'users'),(41,29,32,'GUI','string \'oauth_login\' is not localized for locale \'fr_FR\'  - using en_GB',1581086347,'LOCALIZATION',0,NULL),(42,30,2,'GUI','E_NOTICE\nUndefined property: stdClass::$reqURI - in /srv/testlink/gui/templates_c/fa3cc26e6520195d93b9b217fa30ce9d794638b5_0.file.lostPassword-model-marcobiedermann.tpl.php - Line 63',1581086358,'PHP',0,NULL),(43,30,2,'GUI','E_NOTICE\nUndefined property: stdClass::$destination - in /srv/testlink/gui/templates_c/fa3cc26e6520195d93b9b217fa30ce9d794638b5_0.file.lostPassword-model-marcobiedermann.tpl.php - Line 65',1581086358,'PHP',0,NULL),(44,31,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:24:\"camille.constant@eseo.fr\";i:1;s:13:\"192.168.10.83\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086477,'LOGIN',2,'users'),(45,32,32,'GUI - Projet ID : 1','string \'poweredBy\' is not localized for locale \'fr_FR\'  - using en_GB',1581086477,'LOCALIZATION',0,NULL),(46,32,32,'GUI - Projet ID : 1','string \'system_descr\' is not localized for locale \'fr_FR\'  - using en_GB',1581086477,'LOCALIZATION',0,NULL),(47,32,32,'GUI - Projet ID : 1','string \'href_codetracker_management\' is not localized for locale \'fr_FR\'  - using en_GB',1581086477,'LOCALIZATION',0,NULL),(48,33,32,'GUI - Projet ID : 1','string \'tcvqty_with_kw\' is not localized for locale \'fr_FR\'  - using en_GB',1581086624,'LOCALIZATION',0,NULL),(49,34,32,'GUI - Projet ID : 1','string \'req_title_lenght_exceeded\' is not localized for locale \'fr_FR\' ',1581086717,'LOCALIZATION',0,NULL),(50,34,32,'GUI - Projet ID : 1','string \'req_docid_lenght_exceeded\' is not localized for locale \'fr_FR\' ',1581086717,'LOCALIZATION',0,NULL),(51,35,32,'GUI - Projet ID : 1','string \'skip_testcase_import\' is not localized for locale \'fr_FR\'  - using en_GB',1581086726,'LOCALIZATION',0,NULL),(52,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_keyword_created\";s:6:\"params\";a:1:{i:0;s:7:\"Nominal\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'CREATE',1,'keywords'),(53,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_keyword_created\";s:6:\"params\";a:1:{i:0;s:10:\"Robustesse\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'CREATE',2,'keywords'),(54,36,32,'GUI - Projet ID : 1','string \'already_exists_skipped\' is not localized for locale \'fr_FR\'  - using en_GB',1581086734,'LOCALIZATION',0,NULL),(55,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:7:\"Nominal\";i:1;s:107:\"/Monix-Morix/TV/CU Utilisateur - Traiter passage en caisse/Monix-1:Saisir l\'identifiant d\'un produit valide\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',13,'nodes_hierarchy'),(56,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:10:\"Robustesse\";i:1;s:111:\"/Monix-Morix/TV/CU Utilisateur - Traiter passage en caisse/Monix-2:Saisir l\'identifiant d\'un produit non valide\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',16,'nodes_hierarchy'),(57,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:25:\"Traiter passage en caisse\";i:1;s:1:\"1\";i:2;s:44:\"Saisir l\'identifiant d\'un produit non valide\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',0,NULL),(58,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:7:\"Nominal\";i:1;s:102:\"/Monix-Morix/TV/CU Utilisateur - Traiter passage en caisse/Monix-3:Ajouter l\'achat d\'un produit valide\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',20,'nodes_hierarchy'),(59,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:25:\"Traiter passage en caisse\";i:1;s:1:\"1\";i:2;s:35:\"Ajouter l\'achat d\'un produit valide\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',0,NULL),(60,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:10:\"Robustesse\";i:1;s:106:\"/Monix-Morix/TV/CU Utilisateur - Traiter passage en caisse/Monix-4:Ajouter l\'achat d\'un produit non valide\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',24,'nodes_hierarchy'),(61,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:25:\"Traiter passage en caisse\";i:1;s:1:\"1\";i:2;s:39:\"Ajouter l\'achat d\'un produit non valide\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',0,NULL),(62,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:7:\"Nominal\";i:1;s:102:\"/Monix-Morix/TV/CU Utilisateur - Traiter passage en caisse/Monix-5:Annuler l\'achat d\'un produit valide\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',28,'nodes_hierarchy'),(63,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:25:\"Traiter passage en caisse\";i:1;s:1:\"1\";i:2;s:35:\"Annuler l\'achat d\'un produit valide\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',0,NULL),(64,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:10:\"Robustesse\";i:1;s:106:\"/Monix-Morix/TV/CU Utilisateur - Traiter passage en caisse/Monix-6:Annuler l\'achat d\'un produit non valide\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',32,'nodes_hierarchy'),(65,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:25:\"Traiter passage en caisse\";i:1;s:1:\"1\";i:2;s:39:\"Annuler l\'achat d\'un produit non valide\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',0,NULL),(66,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:7:\"Nominal\";i:1;s:86:\"/Monix-Morix/TV/CU Utilisateur - Traiter passage en caisse/Monix-7:Clôturer une vente\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',36,'nodes_hierarchy'),(67,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:25:\"Traiter passage en caisse\";i:1;s:1:\"1\";i:2;s:19:\"Clôturer une vente\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',0,NULL),(68,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:7:\"Nominal\";i:1;s:39:\"/Monix-Morix/TI/Monix/Monix-8:MonixTest\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',41,'nodes_hierarchy'),(69,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:7:\"Nominal\";i:1;s:79:\"/Monix-Morix/TI/Morix/Monix-9:Communication protocole Morix (commandes valides)\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',46,'nodes_hierarchy'),(70,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:10:\"Robustesse\";i:1;s:84:\"/Monix-Morix/TI/Morix/Monix-10:Communication protocole Morix (commandes non valides)\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',49,'nodes_hierarchy'),(71,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:7:\"Nominal\";i:1;s:58:\"/Monix-Morix/TU/Monix/monix.model.vente/Monix-11:AchatTest\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',55,'nodes_hierarchy'),(72,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:10:\"Robustesse\";i:1;s:58:\"/Monix-Morix/TU/Monix/monix.model.vente/Monix-11:AchatTest\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',55,'nodes_hierarchy'),(73,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:7:\"Nominal\";i:1;s:62:\"/Monix-Morix/TU/Monix/monix.model.vente/Monix-12:VenteTestMock\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',59,'nodes_hierarchy'),(74,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:10:\"Robustesse\";i:1;s:62:\"/Monix-Morix/TU/Monix/monix.model.vente/Monix-12:VenteTestMock\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',59,'nodes_hierarchy'),(75,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:7:\"Nominal\";i:1;s:50:\"/Monix-Morix/TU/Monix/monix.vue/Monix-13:VueCaisse\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',66,'nodes_hierarchy'),(76,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:10:\"Robustesse\";i:1;s:50:\"/Monix-Morix/TU/Monix/monix.vue/Monix-13:VueCaisse\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',66,'nodes_hierarchy'),(77,36,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_keyword_assigned_tc\";s:6:\"params\";a:3:{i:0;s:7:\"Nominal\";i:1;s:50:\"/Monix-Morix/TU/Monix/monix.vue/Monix-14:VueClient\";i:2;i:1;}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581086734,'ASSIGN',71,'nodes_hierarchy'),(78,37,32,'GUI - Projet ID : 1','string \'obsolete\' is not localized for locale \'fr_FR\'  - using en_GB',1581086871,'LOCALIZATION',0,NULL),(79,38,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:11:\"Monix-Morix\";i:1;s:9:\"Monix 3.0\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581087100,'CREATED',76,'testplans'),(80,38,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:32:\"audit_users_roles_added_testplan\";s:6:\"params\";a:3:{i:0;s:24:\"camille.constant@eseo.fr\";i:1;s:9:\"Monix 3.0\";i:2;s:6:\"leader\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581087100,'ASSIGN',76,'testplans'),(81,39,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TV Monix\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581087728,'SAVE',76,'testplans'),(82,40,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TI Monix\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581087799,'CREATED',77,'testplans'),(83,40,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:32:\"audit_users_roles_added_testplan\";s:6:\"params\";a:3:{i:0;s:24:\"camille.constant@eseo.fr\";i:1;s:8:\"TI Monix\";i:2;s:6:\"leader\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581087799,'ASSIGN',77,'testplans'),(84,41,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TU Monix\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581087839,'CREATED',78,'testplans'),(85,41,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:32:\"audit_users_roles_added_testplan\";s:6:\"params\";a:3:{i:0;s:24:\"camille.constant@eseo.fr\";i:1;s:8:\"TU Monix\";i:2;s:6:\"leader\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581087839,'ASSIGN',78,'testplans'),(86,42,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TV Monix\";i:2;s:9:\"Monix 3.0\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581087908,'CREATE',1,'builds'),(87,43,32,'GUI - Projet ID : 1','string \'code_mgmt\' is not localized for locale \'fr_FR\'  - using en_GB',1581087949,'LOCALIZATION',0,NULL),(88,43,32,'GUI - Projet ID : 1','string \'code_link_tl_to_cts\' is not localized for locale \'fr_FR\'  - using en_GB',1581087949,'LOCALIZATION',0,NULL),(89,43,32,'GUI - Projet ID : 1','string \'testcase_version_operations\' is not localized for locale \'fr_FR\'  - using en_GB',1581087949,'LOCALIZATION',0,NULL),(90,43,32,'GUI - Projet ID : 1','string \'select_keywords\' is not localized for locale \'fr_FR\'  - using en_GB',1581087949,'LOCALIZATION',0,NULL),(91,43,32,'GUI - Projet ID : 1','string \'can_not_delete_a_frozen_relation\' is not localized for locale \'fr_FR\'  - using en_GB',1581087949,'LOCALIZATION',0,NULL),(92,43,32,'GUI - Projet ID : 1','string \'can_not_delete_relation_because_this_is_not_the_latest\' is not localized for locale \'fr_FR\'  - using en_GB',1581087949,'LOCALIZATION',0,NULL),(93,43,32,'GUI - Projet ID : 1','string \'this_tcversion\' is not localized for locale \'fr_FR\'  - using en_GB',1581087949,'LOCALIZATION',0,NULL),(94,43,32,'GUI - Projet ID : 1','string \'can_not_delete_relation_tcversion_frozen\' is not localized for locale \'fr_FR\'  - using en_GB',1581087949,'LOCALIZATION',0,NULL),(95,43,32,'GUI - Projet ID : 1','string \'can_not_delete_relation_related_tcversion_frozen\' is not localized for locale \'fr_FR\'  - using en_GB',1581087949,'LOCALIZATION',0,NULL),(96,44,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TI Monix\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581087975,'SAVE',77,'testplans'),(97,45,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TU Monix\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581087982,'SAVE',78,'testplans'),(98,46,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TV Monix\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581087988,'SAVE',76,'testplans'),(99,47,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TI Monix\";i:2;s:9:\"Monix 3.0\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581088033,'CREATE',2,'builds'),(100,48,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TU Monix\";i:2;s:9:\"Monix 3.0\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581088048,'CREATE',3,'builds'),(101,49,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:50:\"Monix-1 : Saisir l\'identifiant d\'un produit valide\";i:1;s:1:\"1\";i:2;s:37:\"TI Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581088229,'ASSIGN',77,'testplans'),(102,49,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:54:\"Monix-2 : Saisir l\'identifiant d\'un produit non valide\";i:1;s:1:\"1\";i:2;s:37:\"TI Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581088229,'ASSIGN',77,'testplans'),(103,49,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:45:\"Monix-3 : Ajouter l\'achat d\'un produit valide\";i:1;s:1:\"1\";i:2;s:37:\"TI Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581088229,'ASSIGN',77,'testplans'),(104,49,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:49:\"Monix-4 : Ajouter l\'achat d\'un produit non valide\";i:1;s:1:\"1\";i:2;s:37:\"TI Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581088229,'ASSIGN',77,'testplans'),(105,49,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:45:\"Monix-5 : Annuler l\'achat d\'un produit valide\";i:1;s:1:\"1\";i:2;s:37:\"TI Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581088229,'ASSIGN',77,'testplans'),(106,49,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:49:\"Monix-6 : Annuler l\'achat d\'un produit non valide\";i:1;s:1:\"1\";i:2;s:37:\"TI Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581088229,'ASSIGN',77,'testplans'),(107,49,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:29:\"Monix-7 : Clôturer une vente\";i:1;s:1:\"1\";i:2;s:37:\"TI Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581088229,'ASSIGN',77,'testplans'),(108,50,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:37:\"audit_all_user_roles_removed_testplan\";s:6:\"params\";a:1:{i:0;s:8:\"TI Monix\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090282,'ASSIGN',77,'testplans'),(109,50,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_deleted\";s:6:\"params\";a:2:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TI Monix\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090282,'DELETE',77,'testplan'),(110,51,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TI Monix\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090292,'CREATED',79,'testplans'),(111,51,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:32:\"audit_users_roles_added_testplan\";s:6:\"params\";a:3:{i:0;s:24:\"camille.constant@eseo.fr\";i:1;s:8:\"TI Monix\";i:2;s:6:\"leader\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090292,'ASSIGN',79,'testplans'),(112,52,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:11:\"Monix-Morix\";i:1;s:8:\"TI Monix\";i:2;s:9:\"Monix 3.0\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090334,'CREATE',4,'builds'),(113,53,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:19:\"Monix-8 : MonixTest\";i:1;s:1:\"1\";i:2;s:37:\"TI Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090362,'ASSIGN',79,'testplans'),(114,53,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:59:\"Monix-9 : Communication protocole Morix (commandes valides)\";i:1;s:1:\"1\";i:2;s:37:\"TI Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090362,'ASSIGN',79,'testplans'),(115,53,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:64:\"Monix-10 : Communication protocole Morix (commandes non valides)\";i:1;s:1:\"1\";i:2;s:37:\"TI Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090362,'ASSIGN',79,'testplans'),(116,54,2,'GUI - Projet ID : 1','E_NOTICE\nUndefined index: bulk_tester_div - in /srv/testlink/lib/plan/tc_exec_assignment.php - Line 259',1581090386,'PHP',0,NULL),(117,54,32,'GUI - Projet ID : 1','string \'btn_apply_assign\' is not localized for locale \'fr_FR\'  - using en_GB',1581090386,'LOCALIZATION',0,NULL),(118,54,32,'GUI - Projet ID : 1','string \'btn_save_assign\' is not localized for locale \'fr_FR\'  - using en_GB',1581090386,'LOCALIZATION',0,NULL),(119,54,32,'GUI - Projet ID : 1','string \'btn_remove_assignments\' is not localized for locale \'fr_FR\'  - using en_GB',1581090386,'LOCALIZATION',0,NULL),(120,54,32,'GUI - Projet ID : 1','string \'btn_remove_all_users\' is not localized for locale \'fr_FR\'  - using en_GB',1581090386,'LOCALIZATION',0,NULL),(121,54,32,'GUI - Projet ID : 1','string \'user_bulk_action\' is not localized for locale \'fr_FR\'  - using en_GB',1581090386,'LOCALIZATION',0,NULL),(122,54,2,'GUI - Projet ID : 1','E_NOTICE\nUndefined index: no_user_selected - in /srv/testlink/gui/templates_c/fb814e16f4c1173d15e4570695423bd85221f9cb_0.file.tc_exec_assignment_flat.tpl.php - Line 50',1581090386,'PHP',0,NULL),(123,55,2,'GUI - Projet ID : 1','E_NOTICE\nUndefined index: no_user_selected - in /srv/testlink/gui/templates_c/fb814e16f4c1173d15e4570695423bd85221f9cb_0.file.tc_exec_assignment_flat.tpl.php - Line 50',1581090397,'PHP',0,NULL),(124,56,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:20:\"Monix-11 : AchatTest\";i:1;s:1:\"1\";i:2;s:37:\"TU Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090470,'ASSIGN',78,'testplans'),(125,56,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:24:\"Monix-12 : VenteTestMock\";i:1;s:1:\"1\";i:2;s:37:\"TU Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090470,'ASSIGN',78,'testplans'),(126,56,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:20:\"Monix-13 : VueCaisse\";i:1;s:1:\"1\";i:2;s:37:\"TU Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090470,'ASSIGN',78,'testplans'),(127,56,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:20:\"Monix-14 : VueClient\";i:1;s:1:\"1\";i:2;s:37:\"TU Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090470,'ASSIGN',78,'testplans'),(128,57,2,'GUI - Projet ID : 1','E_NOTICE\nUndefined index: bulk_tester_div - in /srv/testlink/lib/plan/tc_exec_assignment.php - Line 259',1581090481,'PHP',0,NULL),(129,57,2,'GUI - Projet ID : 1','E_NOTICE\nUndefined index: no_user_selected - in /srv/testlink/gui/templates_c/fb814e16f4c1173d15e4570695423bd85221f9cb_0.file.tc_exec_assignment_flat.tpl.php - Line 50',1581090481,'PHP',0,NULL),(130,58,2,'GUI - Projet ID : 1','E_NOTICE\nUndefined index: bulk_tester_div - in /srv/testlink/lib/plan/tc_exec_assignment.php - Line 259',1581090489,'PHP',0,NULL),(131,58,2,'GUI - Projet ID : 1','E_NOTICE\nUndefined index: no_user_selected - in /srv/testlink/gui/templates_c/fb814e16f4c1173d15e4570695423bd85221f9cb_0.file.tc_exec_assignment_flat.tpl.php - Line 50',1581090489,'PHP',0,NULL),(132,59,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:50:\"Monix-1 : Saisir l\'identifiant d\'un produit valide\";i:1;s:1:\"1\";i:2;s:37:\"TV Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090512,'ASSIGN',76,'testplans'),(133,59,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:54:\"Monix-2 : Saisir l\'identifiant d\'un produit non valide\";i:1;s:1:\"1\";i:2;s:37:\"TV Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090512,'ASSIGN',76,'testplans'),(134,59,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:45:\"Monix-3 : Ajouter l\'achat d\'un produit valide\";i:1;s:1:\"1\";i:2;s:37:\"TV Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090512,'ASSIGN',76,'testplans'),(135,59,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:49:\"Monix-4 : Ajouter l\'achat d\'un produit non valide\";i:1;s:1:\"1\";i:2;s:37:\"TV Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090512,'ASSIGN',76,'testplans'),(136,59,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:45:\"Monix-5 : Annuler l\'achat d\'un produit valide\";i:1;s:1:\"1\";i:2;s:37:\"TV Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090512,'ASSIGN',76,'testplans'),(137,59,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:49:\"Monix-6 : Annuler l\'achat d\'un produit non valide\";i:1;s:1:\"1\";i:2;s:37:\"TV Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090512,'ASSIGN',76,'testplans'),(138,59,16,'GUI - Projet ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:29:\"Monix-7 : Clôturer une vente\";i:1;s:1:\"1\";i:2;s:37:\"TV Monix - Plateforme:Java 1.8 Oracle\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581090512,'ASSIGN',76,'testplans'),(139,60,32,'GUI - Projet ID : 1','string \'restAPIExecParameters\' is not localized for locale \'fr_FR\'  - using en_GB',1581090546,'LOCALIZATION',0,NULL),(140,61,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:24:\"frederic.jouault@eseo.fr\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581091974,'LOGOUT',3,'users'),(141,62,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"192.168.10.229\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581091978,'LOGIN',1,'users'),(142,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2045',1581091982,'PHP',0,NULL),(143,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2045',1581091982,'PHP',0,NULL),(144,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2046',1581091982,'PHP',0,NULL),(145,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2046',1581091982,'PHP',0,NULL),(146,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2047',1581091982,'PHP',0,NULL),(147,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2047',1581091982,'PHP',0,NULL),(148,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 3265',1581091982,'PHP',0,NULL),(149,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 3265',1581091982,'PHP',0,NULL),(150,64,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_user_pwd_saved\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1581092009,'SAVE',1,'users'),(151,64,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2045',1581092009,'PHP',0,NULL),(152,64,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2045',1581092009,'PHP',0,NULL),(153,64,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2046',1581092009,'PHP',0,NULL),(154,64,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2046',1581092009,'PHP',0,NULL),(155,64,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2047',1581092009,'PHP',0,NULL),(156,64,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 2047',1581092009,'PHP',0,NULL),(157,64,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 3265',1581092009,'PHP',0,NULL),(158,64,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/testlink/locale/ja_JP/strings.txt - Line 3265',1581092009,'PHP',0,NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_bugs`
--

DROP TABLE IF EXISTS `execution_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_bugs` (
  `execution_id` int(10) unsigned NOT NULL DEFAULT 0,
  `bug_id` varchar(64) NOT NULL DEFAULT '0',
  `tcstep_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`execution_id`,`bug_id`,`tcstep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_bugs`
--

LOCK TABLES `execution_bugs` WRITE;
/*!40000 ALTER TABLE `execution_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_tcsteps`
--

DROP TABLE IF EXISTS `execution_tcsteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_tcsteps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `execution_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcstep_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `execution_tcsteps_idx1` (`execution_id`,`tcstep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_tcsteps`
--

LOCK TABLES `execution_tcsteps` WRITE;
/*!40000 ALTER TABLE `execution_tcsteps` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_tcsteps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executions`
--

DROP TABLE IF EXISTS `executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `executions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `build_id` int(10) NOT NULL DEFAULT 0,
  `tester_id` int(10) unsigned DEFAULT NULL,
  `execution_ts` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_number` smallint(5) unsigned NOT NULL DEFAULT 1,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `execution_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `executions_idx1` (`testplan_id`,`tcversion_id`,`platform_id`,`build_id`),
  KEY `executions_idx2` (`execution_type`),
  KEY `executions_idx3` (`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executions`
--

LOCK TABLES `executions` WRITE;
/*!40000 ALTER TABLE `executions` DISABLE KEYS */;
/*!40000 ALTER TABLE `executions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testproject_id` int(10) unsigned NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modification_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `inventory_idx1` (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuetrackers`
--

DROP TABLE IF EXISTS `issuetrackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuetrackers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issuetrackers_uidx1` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuetrackers`
--

LOCK TABLES `issuetrackers` WRITE;
/*!40000 ALTER TABLE `issuetrackers` DISABLE KEYS */;
INSERT INTO `issuetrackers` VALUES (1,'Monix',15,'<issuetracker>\r\n<apikey>cbad97340e49937a4d19ace0973520b2dd6756e6</apikey>\r\n<uribase>https://172.24.2.12</uribase>\r\n<uriview>https://172.24.2.12/issues/</uriview> <!-- for Redmine 1.x add show/ --> \r\n<!-- Project Identifier is NEEDED ONLY if you want to create issues from TL -->\r\n<projectidentifier>monix\r\n</projectidentifier>\r\n</issuetracker>');
/*!40000 ALTER TABLE `issuetrackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword_testproject_id` (`keyword`,`testproject_id`),
  KEY `testproject_id` (`testproject_id`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
INSERT INTO `keywords` VALUES (1,'Nominal',1,'Indique qu\'un test se déroule dans les conditions normales d\'utilisation.'),(2,'Robustesse',1,'Indique qu\'un test se déroule dans des conditions d\'utilisation non attendu (en opposition à nominal). Ce terme peut être précisé (ex: montée en charge, stress, etc.).');
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `latest_req_version`
--

DROP TABLE IF EXISTS `latest_req_version`;
/*!50001 DROP VIEW IF EXISTS `latest_req_version`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `latest_req_version` (
  `req_id` tinyint NOT NULL,
  `version` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_req_version_id`
--

DROP TABLE IF EXISTS `latest_req_version_id`;
/*!50001 DROP VIEW IF EXISTS `latest_req_version_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `latest_req_version_id` (
  `req_id` tinyint NOT NULL,
  `version` tinyint NOT NULL,
  `req_version_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_rspec_revision`
--

DROP TABLE IF EXISTS `latest_rspec_revision`;
/*!50001 DROP VIEW IF EXISTS `latest_rspec_revision`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `latest_rspec_revision` (
  `req_spec_id` tinyint NOT NULL,
  `testproject_id` tinyint NOT NULL,
  `revision` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_tcase_version_id`
--

DROP TABLE IF EXISTS `latest_tcase_version_id`;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `latest_tcase_version_id` (
  `testcase_id` tinyint NOT NULL,
  `version` tinyint NOT NULL,
  `tcversion_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_tcase_version_number`
--

DROP TABLE IF EXISTS `latest_tcase_version_number`;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_number`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `latest_tcase_version_number` (
  `testcase_id` tinyint NOT NULL,
  `version` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `target_date` date DEFAULT NULL,
  `start_date` date NOT NULL,
  `a` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `b` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `c` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_testplan_id` (`name`,`testplan_id`),
  KEY `testplan_id` (`testplan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_types`
--

DROP TABLE IF EXISTS `node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT 'testproject',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_types`
--

LOCK TABLES `node_types` WRITE;
/*!40000 ALTER TABLE `node_types` DISABLE KEYS */;
INSERT INTO `node_types` VALUES (1,'testproject'),(2,'testsuite'),(3,'testcase'),(4,'testcase_version'),(5,'testplan'),(6,'requirement_spec'),(7,'requirement'),(8,'requirement_version'),(9,'testcase_step'),(10,'requirement_revision'),(11,'requirement_spec_revision'),(12,'build'),(13,'platform'),(14,'user');
/*!40000 ALTER TABLE `node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes_hierarchy`
--

DROP TABLE IF EXISTS `nodes_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes_hierarchy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `node_type_id` int(10) unsigned NOT NULL DEFAULT 1,
  `node_order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid_m_nodeorder` (`parent_id`,`node_order`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes_hierarchy`
--

LOCK TABLES `nodes_hierarchy` WRITE;
/*!40000 ALTER TABLE `nodes_hierarchy` DISABLE KEYS */;
INSERT INTO `nodes_hierarchy` VALUES (1,'Monix-Morix',NULL,1,1),(2,'CU Utilisateur',1,6,0),(3,'CU Utilisateur',2,11,0),(4,'Traiter passage en caisse',2,7,1),(5,'',4,8,0),(6,'CU Système',1,6,1),(7,'CU Système',6,11,0),(8,'Détection de déconnexion réseau',6,7,1),(9,'',8,8,0),(10,'TV',1,2,2),(11,'CU Utilisateur - Traiter passage en caisse',10,2,1),(12,'Saisir l\'identifiant d\'un produit valide',11,3,1001),(13,'',12,4,0),(14,'',13,9,0),(15,'Saisir l\'identifiant d\'un produit non valide',11,3,1002),(16,'',15,4,0),(17,'',16,9,0),(18,'',16,9,0),(19,'Ajouter l\'achat d\'un produit valide',11,3,1003),(20,'',19,4,0),(21,'',20,9,0),(22,'',20,9,0),(23,'Ajouter l\'achat d\'un produit non valide',11,3,1004),(24,'',23,4,0),(25,'',24,9,0),(26,'',24,9,0),(27,'Annuler l\'achat d\'un produit valide',11,3,1005),(28,'',27,4,0),(29,'',28,9,0),(30,'',28,9,0),(31,'Annuler l\'achat d\'un produit non valide',11,3,1006),(32,'',31,4,0),(33,'',32,9,0),(34,'',32,9,0),(35,'Clôturer une vente',11,3,1007),(36,'',35,4,0),(37,'',36,9,0),(38,'TI',1,2,3),(39,'Monix',38,2,1),(40,'MonixTest',39,3,1000),(41,'',40,4,0),(42,'',41,9,0),(43,'',41,9,0),(44,'Morix',38,2,2),(45,'Communication protocole Morix (commandes valides)',44,3,0),(46,'',45,4,0),(47,'',46,9,0),(48,'Communication protocole Morix (commandes non valides)',44,3,1001),(49,'',48,4,0),(50,'',49,9,0),(51,'TU',1,2,4),(52,'Monix',51,2,1),(53,'monix.model.vente',52,2,1),(54,'AchatTest',53,3,1000),(55,'',54,4,0),(56,'',55,9,0),(57,'',55,9,0),(58,'VenteTestMock',53,3,1001),(59,'',58,4,0),(60,'',59,9,0),(61,'',59,9,0),(62,'',59,9,0),(63,'',59,9,0),(64,'monix.vue',52,2,2),(65,'VueCaisse',64,3,1000),(66,'',65,4,0),(67,'',66,9,0),(68,'',66,9,0),(69,'',66,9,0),(70,'VueClient',64,3,1001),(71,'',70,4,0),(72,'',71,9,0),(73,'',71,9,0),(74,'',71,9,0),(75,'Morix',51,2,2),(76,'TV Monix',1,5,0),(78,'TU Monix',1,5,0),(79,'TI Monix',1,5,0);
/*!40000 ALTER TABLE `nodes_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_keywords`
--

DROP TABLE IF EXISTS `object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fk_table` varchar(30) DEFAULT '',
  `keyword_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx01_object_keywords` (`fk_id`,`fk_table`,`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_keywords`
--

LOCK TABLES `object_keywords` WRITE;
/*!40000 ALTER TABLE `object_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_platforms` (`testproject_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (1,'Java 1.7 Oracle',1,'<p>\n	Environnement de d&eacute;veloppement et d&#39;ex&eacute;cution pour applications Java version 1.7, fourni par Oracle (JDK et JRE).</p>'),(2,'Java 1.8 Oracle',1,'<p>\n	Environnement de d&eacute;veloppement et d&#39;ex&eacute;cution pour applications Java version 1.8, fourni par Oracle (JDK et JRE).</p>'),(3,'Java 1.6 Sun',1,'<p>\n	Environnement de d&eacute;veloppement et d&#39;ex&eacute;cution pour applications Java version 1.6, fourni par Sun (JDK et JRE).</p>');
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basename` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins_configuration`
--

DROP TABLE IF EXISTS `plugins_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testproject_id` int(11) NOT NULL,
  `config_key` varchar(255) NOT NULL,
  `config_type` int(11) NOT NULL,
  `config_value` varchar(255) NOT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins_configuration`
--

LOCK TABLES `plugins_configuration` WRITE;
/*!40000 ALTER TABLE `plugins_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_coverage`
--

DROP TABLE IF EXISTS `req_coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_coverage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `req_id` int(10) NOT NULL,
  `req_version_id` int(10) NOT NULL,
  `testcase_id` int(10) NOT NULL,
  `tcversion_id` int(10) NOT NULL,
  `link_status` int(11) NOT NULL DEFAULT 1,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `review_requester_id` int(10) unsigned DEFAULT NULL,
  `review_request_ts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_coverage_full_link` (`req_id`,`req_version_id`,`testcase_id`,`tcversion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='relation test case version ** requirement version';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_coverage`
--

LOCK TABLES `req_coverage` WRITE;
/*!40000 ALTER TABLE `req_coverage` DISABLE KEYS */;
INSERT INTO `req_coverage` VALUES (1,4,5,15,16,1,1,2,'2020-02-07 22:45:34',NULL,NULL),(2,4,5,19,20,1,1,2,'2020-02-07 22:45:34',NULL,NULL),(3,4,5,23,24,1,1,2,'2020-02-07 22:45:34',NULL,NULL),(4,4,5,27,28,1,1,2,'2020-02-07 22:45:34',NULL,NULL),(5,4,5,31,32,1,1,2,'2020-02-07 22:45:34',NULL,NULL),(6,4,5,35,36,1,1,2,'2020-02-07 22:45:34',NULL,NULL);
/*!40000 ALTER TABLE `req_coverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_monitor`
--

DROP TABLE IF EXISTS `req_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_monitor` (
  `req_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `testproject_id` int(11) NOT NULL,
  PRIMARY KEY (`req_id`,`user_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_monitor`
--

LOCK TABLES `req_monitor` WRITE;
/*!40000 ALTER TABLE `req_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_relations`
--

DROP TABLE IF EXISTS `req_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `relation_type` smallint(5) unsigned NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_relations`
--

LOCK TABLES `req_relations` WRITE;
/*!40000 ALTER TABLE `req_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_revisions`
--

DROP TABLE IF EXISTS `req_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_revisions` (
  `parent_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `req_doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_revisions_uidx1` (`parent_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_revisions`
--

LOCK TABLES `req_revisions` WRITE;
/*!40000 ALTER TABLE `req_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_specs`
--

DROP TABLE IF EXISTS `req_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_specs` (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL,
  `doc_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_spec_uk1` (`doc_id`,`testproject_id`),
  KEY `testproject_id` (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dev. Documents (e.g. System Requirements Specification)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_specs`
--

LOCK TABLES `req_specs` WRITE;
/*!40000 ALTER TABLE `req_specs` DISABLE KEYS */;
INSERT INTO `req_specs` VALUES (6,1,'Monix-CU-S'),(2,1,'Monix-CU-U');
/*!40000 ALTER TABLE `req_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_specs_revisions`
--

DROP TABLE IF EXISTS `req_specs_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_specs_revisions` (
  `parent_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `total_req` int(10) NOT NULL DEFAULT 0,
  `status` int(10) unsigned DEFAULT 1,
  `type` char(1) DEFAULT NULL,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_specs_revisions_uidx1` (`parent_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_specs_revisions`
--

LOCK TABLES `req_specs_revisions` WRITE;
/*!40000 ALTER TABLE `req_specs_revisions` DISABLE KEYS */;
INSERT INTO `req_specs_revisions` VALUES (2,3,1,'Monix-CU-U','CU Utilisateur','\n<p>\n	Ce dossier contient tous les CU du dossier de sp&eacute;cification de Monix li&eacute;s &agrave; l&#39;utilisateur.</p>\n',0,1,'2','Dossier d’exigence créé',2,'2020-02-07 22:45:17',NULL,'2020-02-07 14:45:17'),(6,7,1,'Monix-CU-S','CU Système','\n<p>\n	Ce dossier contient tous les CU du dossier de sp&eacute;cification de Monix li&eacute;s au syst&egrave;me.</p>\n',0,1,'3','Dossier d’exigence créé',2,'2020-02-07 22:45:17',NULL,'2020-02-07 14:45:17');
/*!40000 ALTER TABLE `req_specs_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_versions`
--

DROP TABLE IF EXISTS `req_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_versions` (
  `id` int(10) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `log_message` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_versions`
--

LOCK TABLES `req_versions` WRITE;
/*!40000 ALTER TABLE `req_versions` DISABLE KEYS */;
INSERT INTO `req_versions` VALUES (5,1,1,'\n<p>\n	Un client passe en caisse. Ses produits sont enregistr&eacute;s. Le client paye. La vente est cl&ocirc;tur&eacute;e. Le stock est mis &agrave; jour.</p>\n','W','3',1,1,7,2,'2020-02-07 22:45:17',NULL,'2020-02-07 14:45:17','Exigence créée'),(9,1,1,'\n<p>\n	Le syst&egrave;me pr&eacute;vient l&#39;utilisateur de toute d&eacute;connexion r&eacute;seau et bascule l&#39;IHM dans un mode qui ne permet aucune tentative de modification sur la base de donn&eacute;es.</p>\n','D','7',1,1,1,2,'2020-02-07 22:45:17',NULL,'2020-02-07 14:45:17','Exigence créée');
/*!40000 ALTER TABLE `req_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reqmgrsystems`
--

DROP TABLE IF EXISTS `reqmgrsystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reqmgrsystems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reqmgrsystems_uidx1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reqmgrsystems`
--

LOCK TABLES `reqmgrsystems` WRITE;
/*!40000 ALTER TABLE `reqmgrsystems` DISABLE KEYS */;
/*!40000 ALTER TABLE `reqmgrsystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirements` (
  `id` int(10) unsigned NOT NULL,
  `srs_id` int(10) unsigned NOT NULL,
  `req_doc_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `requirements_req_doc_id` (`srs_id`,`req_doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES (4,2,'CU 1.1'),(8,6,'CU 2.1');
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rights_descr` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (53,'cfield_assignment'),(18,'cfield_management'),(17,'cfield_view'),(51,'codetracker_management'),(52,'codetracker_view'),(22,'events_mgt'),(54,'exec_assign_testcases'),(36,'exec_delete'),(35,'exec_edit_notes'),(49,'exec_ro_access'),(41,'exec_testcases_assigned_to_me'),(31,'issuetracker_management'),(32,'issuetracker_view'),(29,'keyword_assignment'),(9,'mgt_modify_key'),(12,'mgt_modify_product'),(11,'mgt_modify_req'),(7,'mgt_modify_tc'),(48,'mgt_plugins'),(16,'mgt_testplan_create'),(30,'mgt_unfreeze_req'),(13,'mgt_users'),(20,'mgt_view_events'),(8,'mgt_view_key'),(10,'mgt_view_req'),(6,'mgt_view_tc'),(21,'mgt_view_usergroups'),(50,'monitor_requirement'),(24,'platform_management'),(25,'platform_view'),(26,'project_inventory_management'),(27,'project_inventory_view'),(33,'reqmgrsystem_management'),(34,'reqmgrsystem_view'),(28,'req_tcase_link_management'),(14,'role_management'),(19,'system_configuration'),(47,'testcase_freeze'),(43,'testplan_add_remove_platforms'),(2,'testplan_create_build'),(1,'testplan_execute'),(3,'testplan_metrics'),(40,'testplan_milestone_overview'),(4,'testplan_planning'),(45,'testplan_set_urgent_testcases'),(46,'testplan_show_testcases_newest_versions'),(37,'testplan_unlink_executed_testcases'),(44,'testplan_update_linked_testcase_versions'),(5,'testplan_user_role_assignment'),(38,'testproject_delete_executed_testcases'),(39,'testproject_edit_executed_testcases'),(42,'testproject_metrics_dashboard'),(23,'testproject_user_role_assignment'),(15,'user_role_assignment');
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_assignments`
--

DROP TABLE IF EXISTS `risk_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `node_id` int(10) unsigned NOT NULL DEFAULT 0,
  `risk` char(1) NOT NULL DEFAULT '2',
  `importance` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id`),
  UNIQUE KEY `risk_assignments_tplan_node_id` (`testplan_id`,`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_assignments`
--

LOCK TABLES `risk_assignments` WRITE;
/*!40000 ALTER TABLE `risk_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_rights`
--

DROP TABLE IF EXISTS `role_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_rights` (
  `role_id` int(10) NOT NULL DEFAULT 0,
  `right_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`,`right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_rights`
--

LOCK TABLES `role_rights` WRITE;
/*!40000 ALTER TABLE `role_rights` DISABLE KEYS */;
INSERT INTO `role_rights` VALUES (4,3),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,28),(4,29),(4,30),(4,50),(5,3),(5,6),(5,8),(6,1),(6,2),(6,3),(6,6),(6,7),(6,8),(6,9),(6,11),(6,25),(6,27),(6,28),(6,29),(6,30),(6,50),(7,1),(7,3),(7,6),(7,8),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(8,11),(8,12),(8,13),(8,14),(8,15),(8,16),(8,17),(8,18),(8,19),(8,20),(8,21),(8,22),(8,23),(8,24),(8,25),(8,26),(8,27),(8,28),(8,29),(8,30),(8,31),(8,32),(8,33),(8,34),(8,35),(8,36),(8,37),(8,38),(8,39),(8,40),(8,41),(8,42),(8,43),(8,44),(8,45),(8,46),(8,47),(8,48),(8,50),(8,51),(8,52),(8,53),(8,54),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(9,10),(9,11),(9,16),(9,24),(9,25),(9,26),(9,27),(9,28),(9,29),(9,30),(9,35),(9,41),(9,43),(9,44),(9,47),(9,50),(9,54);
/*!40000 ALTER TABLE `role_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_rights_roles_descr` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'<reserved system role 1>',NULL),(2,'<reserved system role 2>',NULL),(3,'<no rights>',NULL),(4,'test designer',NULL),(5,'guest',NULL),(6,'senior tester',NULL),(7,'tester',NULL),(8,'admin',NULL),(9,'leader','');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcsteps`
--

DROP TABLE IF EXISTS `tcsteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcsteps` (
  `id` int(10) unsigned NOT NULL,
  `step_number` int(11) NOT NULL DEFAULT 1,
  `actions` text DEFAULT NULL,
  `expected_results` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcsteps`
--

LOCK TABLES `tcsteps` WRITE;
/*!40000 ALTER TABLE `tcsteps` DISABLE KEYS */;
INSERT INTO `tcsteps` VALUES (14,1,'<p>\n	<strong>(0) Vue caisse</strong> :<br />\n	Saisie $id&rarr;&lt;identifiant produit&gt;</p>\n<p>\n	Perte focus &lt;identifiant produit&gt;</p>\n','<p>\n	<strong>(1) Vue caisse</strong> :<br />\n	&lt;libell&eacute; produit&gt;&larr;libelle Produit($id)<br />\n	&lt;prix&gt;&larr;prix Produit($id)</p>\n',1,2),(17,1,'<p>\n	<strong>(0) Vue caisse</strong> :<br />\n	Saisie $id&rarr; &lt;identifiant produit&gt;</p>\n<p>\n	Perte focus &lt;identifiant produit&gt;</p>\n','<p>\n	<strong>(1) [Article non identifi&eacute;] Vue caisse</strong> :<br />\n	&lt;libell&eacute; produit&gt;&larr;&rdquo;Produit inconnu&rdquo;</p>\n',1,2),(18,2,'','',1,1),(21,1,'<p>\n	<strong>(2) Vue caisse</strong> :<br />\n	Saisie $qtt&rarr;&lt;quantit&eacute;&gt;</p>\n','',1,2),(22,2,'<p>\n	<strong>(3) Vue caisse</strong> :<br />\n	Clique [Ajouter]</p>\n','<p>\n	<strong>(5) Vue caisse </strong>:<br />\n	&lt;informations vente&gt;&larr;&quot;+ produit $id &times; $qtt &times; prix Produit($id)&quot;</p>\n<p>\n	<strong>Vue client</strong> :<br />\n	&lt;ticket client&gt;&larr;+ &quot;produit $id &times; $qtt &times; prix Produit($id)&quot;</p>\n<p>\n	<strong>(6) Vue caisse</strong> :<br />\n	&lt;prix total&gt; += $qtt * prix Produit($id)</p>\n<p>\n	<strong>Vue client</strong> :<br />\n	&lt;prix total&gt; += $qtt * prix Produit($id)</p>\n',1,2),(25,1,'<p>\n	<strong>(2) Vue caisse</strong> :<br />\n	Saisie $qtt&rarr;&lt;quantit&eacute;&gt;</p>\n','',1,2),(26,2,'<p>\n	<strong>(3) Vue caisse</strong> :<br />\n	Clique [Ajouter]</p>\n','<p>\n	<strong>(5) [Article non identifi&eacute;] Vue caisse</strong> :<br />\n	&lt;informations vente&gt;&larr;&rdquo;Achat impossible&rdquo;</p>\n',1,2),(29,1,'<p>\n	<strong>(2) Vue caisse</strong> :<br />\n	Saisie $qtt&rarr;&lt;quantit&eacute;&gt;</p>\n','',1,2),(30,2,'<p>\n	<strong>(3) [Annulation d&rsquo;un produit]</strong> <strong>Vue caisse</strong> :<br />\n	Clique [Enlever]</p>\n','<p>\n	<strong>(5) Vue caisse</strong> :<br />\n	&lt;informations vente&gt;&larr; &rdquo;- produit $id &times; $qtt &times; prix Produit($id)&rdquo;</p>\n<p>\n	<strong>Vue client</strong> :<br />\n	&lt;ticket client&gt;&larr;+&rdquo;produit $id &times; -$qtt &times; prix Produit($id)&rdquo;</p>\n<p>\n	<strong>(6) Vue caisse</strong> :<br />\n	&lt;prix total&gt; -= $qtt * prix Produit($id)</p>\n<p>\n	<strong>Vue client</strong> :<br />\n	&lt;prix total&gt; -= $qtt * prix Produit($id)</p>\n',1,2),(33,1,'<p>\n	<strong>(2) Vue caisse</strong> :<br />\n	Saisie $qtt&rarr;&lt;quantit&eacute;&gt;</p>\n','',1,2),(34,2,'<p>\n	<strong>(3) [Annulation d&rsquo;un produit] Vue caisse</strong> :<br />\n	Clique [Enlever]</p>\n','<p>\n	<strong>(5) [Article non identifi&eacute;] Vue caisse</strong> :<br />\n	&lt;informations vente&gt;&larr;&rdquo;Achat impossible&rdquo;</p>\n',1,2),(37,1,'<p>\n	<strong>(7) Vue caisse</strong> :<br />\n	Clique [Fin de la vente]</p>\n','<p>\n	<strong>(9) Vue stock</strong> :<br />\n	&forall; Produit($id) &lt;quantit&eacute;&gt; &plusmn;= $qtt</p>\n',1,2),(42,1,'<p>\n	testAchatProduits()</p>\n','<p>\n	test PASS</p>\n',1,2),(43,2,'<p>\n	testAnnulationProduit()</p>\n','<p>\n	test PASS</p>\n',1,2),(47,1,'<p>\n	<strong>JMeter</strong> :</p>\n<p>\n	Lancer Groupe d&#39;unit&eacute;s de tests nominaux du serveur</p>\n','<p>\n	<strong>JMeter</strong> : <strong>Arbre de r&eacute;sultats</strong></p>\n<p>\n	Tous les indicateurs verts</p>\n<p>\n	&nbsp;</p>\n',1,2),(50,1,'<p>\n	<strong>JMeter</strong> :</p>\n<p>\n	Lancer Groupe d&#39;unit&eacute;s de tests de robustesse du serveur</p>\n','<p>\n	<strong>JMeter</strong> : <strong>Arbre de r&eacute;sultats</strong></p>\n<p>\n	Tous les indicateurs verts</p>\n',1,2),(56,1,'<p>\n	testIncrementQuantite()</p>\n','<p>\n	test PASS</p>\n',1,2),(57,2,'<p>\n	testDecrementeQuantite()</p>\n','<p>\n	test PASS</p>\n',1,2),(60,1,'<p>\n	testAjouteAchatProduit_exception_AchatImpossibleException()</p>\n','<p>\n	test PASS</p>\n',1,2),(61,2,'<p>\n	testAjouteAchatProduit_ajout()</p>\n','<p>\n	test PASS</p>\n',1,2),(62,3,'<p>\n	&nbsp;testAjouteAchatProduit_increment()</p>\n','<p>\n	test PASS</p>\n',1,2),(63,4,'<p>\n	testClotureVente()</p>\n','<p>\n	test PASS</p>\n',1,2),(67,1,'<p>\n	testInitialiseVue()</p>\n','<p>\n	test PASS</p>\n',1,2),(68,2,'<p>\n	testFocusLost_produitNonValide()</p>\n','<p>\n	test PASS</p>\n',1,2),(69,3,'<p>\n	testFocusLost_produitValide()</p>\n','<p>\n	test PASS</p>\n',1,2),(72,1,'<p>\n	testInitialiseVue()</p>\n','<p>\n	test PASS</p>\n',1,2),(73,2,'<p>\n	testVenteChange_1()</p>\n','<p>\n	test PASS</p>\n',1,2),(74,3,'<p>\n	testVenteChange_2()</p>\n','<p>\n	test PASS</p>\n',1,2);
/*!40000 ALTER TABLE `tcsteps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcversions`
--

DROP TABLE IF EXISTS `tcversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcversions` (
  `id` int(10) unsigned NOT NULL,
  `tc_external_id` int(10) unsigned DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `layout` smallint(5) unsigned NOT NULL DEFAULT 1,
  `status` smallint(5) unsigned NOT NULL DEFAULT 1,
  `summary` text DEFAULT NULL,
  `preconditions` text DEFAULT NULL,
  `importance` smallint(5) unsigned NOT NULL DEFAULT 2,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updater_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `estimated_exec_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcversions`
--

LOCK TABLES `tcversions` WRITE;
/*!40000 ALTER TABLE `tcversions` DISABLE KEYS */;
INSERT INTO `tcversions` VALUES (13,1,1,1,7,'<p>\n	V&eacute;rification de la saisie de l&#39;identifiant d&#39;un produit valide.</p>\n','<p>\n	Monix est lanc&eacute; et connect&eacute; &agrave; Morix.</p>\n',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:10:41',1,1,2,NULL),(16,2,1,1,7,'<p>\n	V&eacute;rification de la saisie de l&#39;identifiant d&#39;un produit non-valide (non pr&eacute;sent dans la base de donn&eacute;es).</p>\n','<p>\n	Monix est lanc&eacute; et connect&eacute; &agrave; Morix.</p>\n',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:10:53',1,1,2,NULL),(20,3,1,1,7,'<p>\n	V&eacute;rifie que l&#39;achat d&#39;un produit pr&eacute;sent dans la base de donn&eacute;e est possible.</p>\n','<p>\n	Saisir l&#39;identifiant d&#39;un produit valide.</p>\n',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:01',1,1,2,NULL),(24,4,1,1,7,'<p>\n	V&eacute;rifie que l&#39;achat d&#39;un produit non pr&eacute;sent dans la base de donn&eacute;es est impossible.</p>\n','<p>\n	Saisir l&#39;identifiant d&#39;un produit non-valide.</p>\n',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:05',1,1,2,NULL),(28,5,1,1,7,'<p>\n	V&eacute;rifie l&#39;annulation possible de l&#39;achat d&#39;un produit pr&eacute;sent dans la base de donn&eacute;es.</p>\n','<p>\n	Saisir l&#39;identifiant d&#39;un produit valide.</p>\n',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:10',1,1,2,NULL),(32,6,1,1,7,'<p>\n	V&eacute;rifie l&#39;annulation impossible de l&#39;achat d&#39;un produit non pr&eacute;sent dans la base de donn&eacute;es.</p>\n','<p>\n	Saisir l&#39;identifiant d&#39;un produit non valide.</p>\n',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:14',1,1,2,NULL),(36,7,1,1,7,'<p>\n	V&eacute;rifie la cl&ocirc;ture d&#39;une vente.</p>\n','<p>\n	Ajouter l&#39;achat d&#39;un produit ou Annuler l&#39;achat d&#39;un produit.</p>\n',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:18',1,1,2,NULL),(41,8,1,1,7,'<p>\n	Test du composant Monix (int&eacute;gration de l&#39;ensemble des classes).</p>\n<p>\n	Utilisation des frameworks JUnit (code TI boite grise) et Jemmy (IHM).</p>\n','',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:26',1,1,2,1.00),(46,9,1,1,7,'<p>\n	Valide la communication avec le composant serveur Morix sur la base du protocole d&eacute;fini.</p>\n<p>\n	Utilisation de JMeter.</p>\n','<p>\n	Le composant Morix est lanc&eacute; et en &eacute;coute sur le r&eacute;seau.</p>\n',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:32',1,1,2,1.00),(49,10,1,1,7,'<p>\n	Valide la communication avec le composant serveur Morix sur la base du protocole d&eacute;fini.</p>\n<p>\n	Utilisation de JMeter.</p>\n','<p>\n	Le composant Morix est lanc&eacute; et en &eacute;coute sur le r&eacute;seau.</p>\n',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:35',1,1,2,1.00),(55,11,1,1,7,'<p>\n	Test case JUnit AchatTest.</p>\n<p>\n	Utilisation du framework JUnit (TU).</p>\n','',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:45',1,1,2,NULL),(59,12,1,1,7,'<p>\n	Test case JUnit VenteTestMock.</p>\n<p>\n	Utilisation du framework JUnit (TU) et Easymock (bouchonnage).</p>\n','',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:49',1,1,2,NULL),(66,13,1,1,7,'<p>\n	Test case JUnit VueCaisse.</p>\n<p>\n	Utilisation des frameworks JUnit (TU), Easymock (bouchonnage) et Jemmy (IHM).</p>\n','',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:55',1,1,2,NULL),(71,14,1,1,7,'<p>\n	Test case JUnit VueClient.</p>\n<p>\n	Utilisation des frameworks JUnit (TU), Easymock (bouchonnage) et Jemmy (IHM).</p>\n','',2,2,'2020-02-07 22:45:34',2,'2020-02-07 23:11:58',1,1,2,NULL);
/*!40000 ALTER TABLE `tcversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `tcversions_without_keywords`
--

DROP TABLE IF EXISTS `tcversions_without_keywords`;
/*!50001 DROP VIEW IF EXISTS `tcversions_without_keywords`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `tcversions_without_keywords` (
  `testcase_id` tinyint NOT NULL,
  `id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `testcase_keywords`
--

DROP TABLE IF EXISTS `testcase_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testcase_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `keyword_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx01_testcase_keywords` (`testcase_id`,`tcversion_id`,`keyword_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_keywords`
--

LOCK TABLES `testcase_keywords` WRITE;
/*!40000 ALTER TABLE `testcase_keywords` DISABLE KEYS */;
INSERT INTO `testcase_keywords` VALUES (1,12,13,1),(2,15,16,2),(3,19,20,1),(4,23,24,2),(5,27,28,1),(6,31,32,2),(7,35,36,1),(8,40,41,1),(9,45,46,1),(10,48,49,2),(11,54,55,1),(12,54,55,2),(13,58,59,1),(14,58,59,2),(15,65,66,1),(16,65,66,2),(17,70,71,1);
/*!40000 ALTER TABLE `testcase_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_relations`
--

DROP TABLE IF EXISTS `testcase_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `link_status` tinyint(1) NOT NULL DEFAULT 1,
  `relation_type` smallint(5) unsigned NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_relations`
--

LOCK TABLES `testcase_relations` WRITE;
/*!40000 ALTER TABLE `testcase_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_script_links`
--

DROP TABLE IF EXISTS `testcase_script_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_script_links` (
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `project_key` varchar(64) NOT NULL,
  `repository_name` varchar(64) NOT NULL,
  `code_path` varchar(255) NOT NULL,
  `branch_name` varchar(64) DEFAULT NULL,
  `commit_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`tcversion_id`,`project_key`,`repository_name`,`code_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_script_links`
--

LOCK TABLES `testcase_script_links` WRITE;
/*!40000 ALTER TABLE `testcase_script_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_script_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplan_platforms`
--

DROP TABLE IF EXISTS `testplan_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplan_platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL,
  `platform_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_testplan_platforms` (`testplan_id`,`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Connects a testplan with platforms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplan_platforms`
--

LOCK TABLES `testplan_platforms` WRITE;
/*!40000 ALTER TABLE `testplan_platforms` DISABLE KEYS */;
INSERT INTO `testplan_platforms` VALUES (1,76,2),(2,78,2),(4,79,2);
/*!40000 ALTER TABLE `testplan_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplan_tcversions`
--

DROP TABLE IF EXISTS `testplan_tcversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplan_tcversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `node_order` int(10) unsigned NOT NULL DEFAULT 1,
  `urgency` smallint(5) NOT NULL DEFAULT 2,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `testplan_tcversions_tplan_tcversion` (`testplan_id`,`tcversion_id`,`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplan_tcversions`
--

LOCK TABLES `testplan_tcversions` WRITE;
/*!40000 ALTER TABLE `testplan_tcversions` DISABLE KEYS */;
INSERT INTO `testplan_tcversions` VALUES (8,79,41,10000,2,2,2,'2020-02-07 23:46:02'),(9,79,46,0,2,2,2,'2020-02-07 23:46:02'),(10,79,49,10010,2,2,2,'2020-02-07 23:46:02'),(11,78,55,10000,2,2,2,'2020-02-07 23:47:50'),(12,78,59,10010,2,2,2,'2020-02-07 23:47:50'),(13,78,66,10000,2,2,2,'2020-02-07 23:47:50'),(14,78,71,10010,2,2,2,'2020-02-07 23:47:50'),(15,76,13,10010,2,2,2,'2020-02-07 23:48:32'),(16,76,16,10020,2,2,2,'2020-02-07 23:48:32'),(17,76,20,10030,2,2,2,'2020-02-07 23:48:32'),(18,76,24,10040,2,2,2,'2020-02-07 23:48:32'),(19,76,28,10050,2,2,2,'2020-02-07 23:48:32'),(20,76,32,10060,2,2,2,'2020-02-07 23:48:32'),(21,76,36,10070,2,2,2,'2020-02-07 23:48:32');
/*!40000 ALTER TABLE `testplan_tcversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplans`
--

DROP TABLE IF EXISTS `testplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplans` (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `api_key` varchar(64) NOT NULL DEFAULT '829a2ded3ed0829a2dedd8ab81dfa2c77e8235bc3ed0d8ab81dfa2c77e8235bc',
  PRIMARY KEY (`id`),
  UNIQUE KEY `testplans_api_key` (`api_key`),
  KEY `testplans_testproject_id_active` (`testproject_id`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplans`
--

LOCK TABLES `testplans` WRITE;
/*!40000 ALTER TABLE `testplans` DISABLE KEYS */;
INSERT INTO `testplans` VALUES (76,1,'<p>Tests de validation du projet Monix dans la version 1&nbsp;des sp&eacute;cifications.</p>',1,1,0,'02f869f146178863bf9fe1e76c6b00dfd9e5599fefae7d13b528bade012fbc3b'),(78,1,'<p>Tests unitaires sur le projet Monix dans la version 1&nbsp;des sp&eacute;cifications.&nbsp;</p>',1,1,0,'d00060ddd9200f112a68f1d4496ff12aa2a3942b3a3704421e7111a13dbab52d'),(79,1,'<p>Tests d&#39;int&eacute;gration du projet Monix dans la version 1&nbsp;des sp&eacute;cifications (composants concern&eacute;s : Monix et Morix).&nbsp;</p>',1,1,0,'e59b06d51e9fa8e4f94dc71063c211c98f1fba0ddfba1bbe376c1bc5c00364d8');
/*!40000 ALTER TABLE `testplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_codetracker`
--

DROP TABLE IF EXISTS `testproject_codetracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testproject_codetracker` (
  `testproject_id` int(10) unsigned NOT NULL,
  `codetracker_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_codetracker`
--

LOCK TABLES `testproject_codetracker` WRITE;
/*!40000 ALTER TABLE `testproject_codetracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `testproject_codetracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_issuetracker`
--

DROP TABLE IF EXISTS `testproject_issuetracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testproject_issuetracker` (
  `testproject_id` int(10) unsigned NOT NULL,
  `issuetracker_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_issuetracker`
--

LOCK TABLES `testproject_issuetracker` WRITE;
/*!40000 ALTER TABLE `testproject_issuetracker` DISABLE KEYS */;
INSERT INTO `testproject_issuetracker` VALUES (1,1);
/*!40000 ALTER TABLE `testproject_issuetracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_reqmgrsystem`
--

DROP TABLE IF EXISTS `testproject_reqmgrsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testproject_reqmgrsystem` (
  `testproject_id` int(10) unsigned NOT NULL,
  `reqmgrsystem_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_reqmgrsystem`
--

LOCK TABLES `testproject_reqmgrsystem` WRITE;
/*!40000 ALTER TABLE `testproject_reqmgrsystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `testproject_reqmgrsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testprojects`
--

DROP TABLE IF EXISTS `testprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testprojects` (
  `id` int(10) unsigned NOT NULL,
  `notes` text DEFAULT NULL,
  `color` varchar(12) NOT NULL DEFAULT '#9BD',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `option_reqs` tinyint(1) NOT NULL DEFAULT 0,
  `option_priority` tinyint(1) NOT NULL DEFAULT 0,
  `option_automation` tinyint(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `prefix` varchar(16) NOT NULL,
  `tc_counter` int(10) unsigned NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `issue_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `code_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `reqmgr_integration_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `api_key` varchar(64) NOT NULL DEFAULT '0d8ab81dfa2c77e8235bc829a2ded3edfa2c78235bc829a27eded3ed0d8ab81d',
  PRIMARY KEY (`id`),
  UNIQUE KEY `testprojects_prefix` (`prefix`),
  UNIQUE KEY `testprojects_api_key` (`api_key`),
  KEY `testprojects_id_active` (`id`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testprojects`
--

LOCK TABLES `testprojects` WRITE;
/*!40000 ALTER TABLE `testprojects` DISABLE KEYS */;
INSERT INTO `testprojects` VALUES (1,'','',1,0,0,0,'O:8:\"stdClass\":4:{s:19:\"requirementsEnabled\";i:1;s:19:\"testPriorityEnabled\";i:1;s:17:\"automationEnabled\";i:1;s:16:\"inventoryEnabled\";i:1;}','Monix',14,0,1,0,0,'aaf57aeb789801c1a61780e1bd43276fec4125f8165828765b44d0c728d5bc20');
/*!40000 ALTER TABLE `testprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testsuites`
--

DROP TABLE IF EXISTS `testsuites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testsuites` (
  `id` int(10) unsigned NOT NULL,
  `details` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testsuites`
--

LOCK TABLES `testsuites` WRITE;
/*!40000 ALTER TABLE `testsuites` DISABLE KEYS */;
INSERT INTO `testsuites` VALUES (10,'<p>\n	Dossier contenant tous les tests de validation du projet.</p>\n'),(11,'<p>\n	Cette s&eacute;quence de test correspond &agrave; la validation du CU Traiter passage en caisse.</p>\n<p>\n	L&#39;ensemble des tests doit &ecirc;tre ex&eacute;cut&eacute; avec la base de donn&eacute;es renseign&eacute;e avec les donn&eacute;es jointes (stock.sql, cf. proc&eacute;dure renseignement de la base de donn&eacute;es).</p>\n'),(38,'<p>\n	Tests d&#39;int&eacute;gration des composants Monix et Morix.</p>\n'),(39,'<p>\n	Test d&#39;int&eacute;gration du composant Monix.</p>\n'),(44,'<p>\n	Test d&#39;int&eacute;gration du composant Morix</p>\n'),(51,'<p>\n	Tests unitaires du projet Monix (composants Monix et Morix)</p>\n'),(52,'<p>\n	Tests unitaires du composant Monix</p>\n'),(53,'<p>\n	Tests unitaires du package monix.model.vente</p>\n'),(64,'<p>\n	Tests unitaires du package monix.vue</p>\n'),(75,'<p>\n	Tests unitaires du composant Morix</p>\n');
/*!40000 ALTER TABLE `testsuites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_templates`
--

DROP TABLE IF EXISTS `text_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_templates` (
  `id` int(10) unsigned NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `template_data` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `idx_text_templates` (`type`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Global Project Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_templates`
--

LOCK TABLES `text_templates` WRITE;
/*!40000 ALTER TABLE `text_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `text_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_point` varchar(45) NOT NULL DEFAULT '',
  `start_time` int(10) unsigned NOT NULL DEFAULT 0,
  `end_time` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `session_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'/login.php',1581056882,1581056882,0,NULL),(2,'/login.php',1581085285,1581085285,0,NULL),(3,'/login.php',1581085298,1581085298,2,'729b6d84e4a4a1f6ef76e8df5e0ce130'),(4,'/lib/general/mainPage.php',1581085298,1581085299,2,'729b6d84e4a4a1f6ef76e8df5e0ce130'),(5,'/login.php',1581085440,1581085440,3,'b6ec52a088c1b0ca8db97bc06b372f61'),(6,'/lib/general/mainPage.php',1581085440,1581085440,3,'b6ec52a088c1b0ca8db97bc06b372f61'),(7,'/logout.php',1581085579,1581085579,2,'729b6d84e4a4a1f6ef76e8df5e0ce130'),(8,'/login.php',1581085579,1581085579,0,NULL),(9,'/login.php',1581085584,1581085584,0,NULL),(10,'/login.php',1581085588,1581085588,1,'663a3735360f46466399ed46d3e67918'),(11,'/lib/project/projectEdit.php',1581085608,1581085608,1,'663a3735360f46466399ed46d3e67918'),(12,'/logout.php',1581085794,1581085794,3,'b6ec52a088c1b0ca8db97bc06b372f61'),(13,'/lib/usermanagement/usersAssign.php',1581085796,1581085796,1,'663a3735360f46466399ed46d3e67918'),(14,'/login.php',1581085800,1581085800,3,'b5dad5af628aa7ebc500d331caeeac64'),(15,'/lib/usermanagement/usersAssign.php',1581085803,1581085803,1,'663a3735360f46466399ed46d3e67918'),(16,'/lib/usermanagement/usersAssign.php',1581085805,1581085805,1,'663a3735360f46466399ed46d3e67918'),(17,'/lib/usermanagement/usersAssign.php',1581085811,1581085811,1,'663a3735360f46466399ed46d3e67918'),(18,'/lib/usermanagement/rolesEdit.php',1581085882,1581085882,1,'663a3735360f46466399ed46d3e67918'),(19,'/logout.php',1581085896,1581085896,3,'b5dad5af628aa7ebc500d331caeeac64'),(20,'/login.php',1581085897,1581085897,3,'edd3f7f8bd5c5ea76148fb1f7bf2f766'),(21,'/logout.php',1581085915,1581085915,3,'edd3f7f8bd5c5ea76148fb1f7bf2f766'),(22,'/login.php',1581085917,1581085917,3,'ecdea67c2aca64d601043739ed7a5895'),(23,'/lib/project/projectEdit.php',1581085997,1581085997,1,'663a3735360f46466399ed46d3e67918'),(24,'/logout.php',1581086012,1581086012,1,'663a3735360f46466399ed46d3e67918'),(25,'/login.php',1581086012,1581086012,0,NULL),(26,'/login.php',1581086025,1581086025,2,'dcef688a77e814dfdbfc9473286a3f7e'),(27,'/lib/general/mainPage.php',1581086025,1581086025,2,'dcef688a77e814dfdbfc9473286a3f7e'),(28,'/logout.php',1581086347,1581086347,2,'dcef688a77e814dfdbfc9473286a3f7e'),(29,'/login.php',1581086347,1581086347,0,NULL),(30,'/lostPassword.php',1581086358,1581086358,0,NULL),(31,'/login.php',1581086477,1581086477,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(32,'/lib/general/mainPage.php',1581086477,1581086477,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(33,'/lib/keywords/keywordsView.php',1581086624,1581086624,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(34,'/lib/requirements/reqImport.php',1581086717,1581086717,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(35,'/lib/testcases/tcImport.php',1581086726,1581086726,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(36,'/lib/testcases/tcImport.php',1581086734,1581086734,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(37,'/lib/requirements/reqView.php',1581086871,1581086871,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(38,'/lib/plan/planEdit.php',1581087100,1581087100,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(39,'/lib/plan/planEdit.php',1581087728,1581087728,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(40,'/lib/plan/planEdit.php',1581087799,1581087799,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(41,'/lib/plan/planEdit.php',1581087839,1581087839,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(42,'/lib/plan/buildEdit.php',1581087908,1581087908,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(43,'/lib/testcases/archiveData.php',1581087949,1581087949,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(44,'/lib/plan/planEdit.php',1581087975,1581087975,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(45,'/lib/plan/planEdit.php',1581087982,1581087982,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(46,'/lib/plan/planEdit.php',1581087988,1581087988,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(47,'/lib/plan/buildEdit.php',1581088033,1581088033,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(48,'/lib/plan/buildEdit.php',1581088048,1581088048,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(49,'/lib/plan/planAddTC.php',1581088229,1581088229,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(50,'/lib/plan/planEdit.php',1581090282,1581090282,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(51,'/lib/plan/planEdit.php',1581090292,1581090293,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(52,'/lib/plan/buildEdit.php',1581090334,1581090334,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(53,'/lib/plan/planAddTC.php',1581090362,1581090362,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(54,'/lib/plan/tc_exec_assignment.php',1581090386,1581090386,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(55,'/lib/plan/tc_exec_assignment.php',1581090397,1581090397,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(56,'/lib/plan/planAddTC.php',1581090470,1581090470,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(57,'/lib/plan/tc_exec_assignment.php',1581090481,1581090481,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(58,'/lib/plan/tc_exec_assignment.php',1581090489,1581090489,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(59,'/lib/plan/planAddTC.php',1581090512,1581090512,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(60,'/lib/execute/execDashboard.php',1581090546,1581090546,2,'8f3ea450f97e322a56083fa22eeb6b8e'),(61,'/logout.php',1581091974,1581091974,3,'ecdea67c2aca64d601043739ed7a5895'),(62,'/login.php',1581091978,1581091978,1,'b28773800640e83eb6ad4f89f27d2ff3'),(63,'/lib/usermanagement/userInfo.php',1581091982,1581091982,1,'b28773800640e83eb6ad4f89f27d2ff3'),(64,'/lib/usermanagement/userInfo.php',1581092009,1581092009,1,'b28773800640e83eb6ad4f89f27d2ff3');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_assignments`
--

DROP TABLE IF EXISTS `user_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT 1,
  `feature_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned DEFAULT 0,
  `build_id` int(10) unsigned DEFAULT 0,
  `deadline_ts` datetime DEFAULT NULL,
  `assigner_id` int(10) unsigned DEFAULT 0,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(10) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `user_assignments_feature_id` (`feature_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_assignments`
--

LOCK TABLES `user_assignments` WRITE;
/*!40000 ALTER TABLE `user_assignments` DISABLE KEYS */;
INSERT INTO `user_assignments` VALUES (8,1,8,2,4,NULL,2,'2020-02-07 23:46:37',1),(9,1,9,2,4,NULL,2,'2020-02-07 23:46:37',1),(10,1,10,2,4,NULL,2,'2020-02-07 23:46:37',1),(11,1,11,2,3,NULL,2,'2020-02-07 23:47:50',1),(12,1,12,2,3,NULL,2,'2020-02-07 23:47:50',1),(13,1,13,2,3,NULL,2,'2020-02-07 23:47:50',1),(14,1,14,2,3,NULL,2,'2020-02-07 23:47:50',1),(15,1,15,2,1,NULL,2,'2020-02-07 23:48:32',1),(16,1,16,2,1,NULL,2,'2020-02-07 23:48:32',1),(17,1,17,2,1,NULL,2,'2020-02-07 23:48:32',1),(18,1,18,2,1,NULL,2,'2020-02-07 23:48:32',1),(19,1,19,2,1,NULL,2,'2020-02-07 23:48:32',1),(20,1,20,2,1,NULL,2,'2020-02-07 23:48:32',1),(21,1,21,2,1,NULL,2,'2020-02-07 23:48:32',1);
/*!40000 ALTER TABLE `user_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_group` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_assign`
--

DROP TABLE IF EXISTS `user_group_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_assign` (
  `usergroup_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `idx_user_group_assign` (`usergroup_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_assign`
--

LOCK TABLES `user_group_assign` WRITE;
/*!40000 ALTER TABLE `user_group_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_testplan_roles`
--

DROP TABLE IF EXISTS `user_testplan_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_testplan_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`testplan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_testplan_roles`
--

LOCK TABLES `user_testplan_roles` WRITE;
/*!40000 ALTER TABLE `user_testplan_roles` DISABLE KEYS */;
INSERT INTO `user_testplan_roles` VALUES (2,76,9),(2,78,9),(2,79,9);
/*!40000 ALTER TABLE `user_testplan_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_testproject_roles`
--

DROP TABLE IF EXISTS `user_testproject_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_testproject_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testproject_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_testproject_roles`
--

LOCK TABLES `user_testproject_roles` WRITE;
/*!40000 ALTER TABLE `user_testproject_roles` DISABLE KEYS */;
INSERT INTO `user_testproject_roles` VALUES (1,1,8),(2,1,9),(3,1,3);
/*!40000 ALTER TABLE `user_testproject_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `role_id` int(10) unsigned NOT NULL DEFAULT 0,
  `email` varchar(100) NOT NULL DEFAULT '',
  `first` varchar(50) NOT NULL DEFAULT '',
  `last` varchar(50) NOT NULL DEFAULT '',
  `locale` varchar(10) NOT NULL DEFAULT 'en_GB',
  `default_testproject_id` int(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `script_key` varchar(32) DEFAULT NULL,
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `auth_method` varchar(10) DEFAULT '',
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login` (`login`),
  UNIQUE KEY `users_cookie_string` (`cookie_string`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='User information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','46ff3ef0acab9521f180fdd41900f84d',8,'','Testlink','Administrator','en_GB',NULL,1,NULL,'49ddac550c0f26dc3b428b1c62688d40a1db051d1519dd3198994a881cc241e1','','2020-02-06 17:41:50',NULL),(2,'camille.constant@eseo.fr','77add1d5f41223d5582fca736a5cb335',5,'Camille.Constant@eseo.fr','Camille','Constant','fr_FR',NULL,1,NULL,'075d4680cb8c7192d4954a1d79a68c9231888bec177f67dc8ad1c98d6600fe08','LDAP','2020-02-07 14:21:38',NULL),(3,'frederic.jouault@eseo.fr','77add1d5f41223d5582fca736a5cb335',5,'Frederic.JOUAULT@eseo.fr','Frédéric','JOUAULT','en_GB',NULL,1,NULL,'8806c722cf62b5310619393c4935d7709c65628feda29f92c82f02d79d393fe0','LDAP','2020-02-07 14:24:00',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `latest_req_version`
--

/*!50001 DROP TABLE IF EXISTS `latest_req_version`*/;
/*!50001 DROP VIEW IF EXISTS `latest_req_version`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_req_version` AS select `RQ`.`id` AS `req_id`,max(`RQV`.`version`) AS `version` from ((`nodes_hierarchy` `NHRQV` join `requirements` `RQ` on(`RQ`.`id` = `NHRQV`.`parent_id`)) join `req_versions` `RQV` on(`RQV`.`id` = `NHRQV`.`id`)) group by `RQ`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_req_version_id`
--

/*!50001 DROP TABLE IF EXISTS `latest_req_version_id`*/;
/*!50001 DROP VIEW IF EXISTS `latest_req_version_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_req_version_id` AS select `LRQVN`.`req_id` AS `req_id`,`LRQVN`.`version` AS `version`,`REQV`.`id` AS `req_version_id` from ((`latest_req_version` `LRQVN` join `nodes_hierarchy` `NHRQV` on(`NHRQV`.`parent_id` = `LRQVN`.`req_id`)) join `req_versions` `REQV` on(`REQV`.`id` = `NHRQV`.`id` and `REQV`.`version` = `LRQVN`.`version`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_rspec_revision`
--

/*!50001 DROP TABLE IF EXISTS `latest_rspec_revision`*/;
/*!50001 DROP VIEW IF EXISTS `latest_rspec_revision`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_rspec_revision` AS select `RSR`.`parent_id` AS `req_spec_id`,`RS`.`testproject_id` AS `testproject_id`,max(`RSR`.`revision`) AS `revision` from (`req_specs_revisions` `RSR` join `req_specs` `RS` on(`RS`.`id` = `RSR`.`parent_id`)) group by `RSR`.`parent_id`,`RS`.`testproject_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_tcase_version_id`
--

/*!50001 DROP TABLE IF EXISTS `latest_tcase_version_id`*/;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_tcase_version_id` AS select `LTCVN`.`testcase_id` AS `testcase_id`,`LTCVN`.`version` AS `version`,`TCV`.`id` AS `tcversion_id` from ((`latest_tcase_version_number` `LTCVN` join `nodes_hierarchy` `NHTCV` on(`NHTCV`.`parent_id` = `LTCVN`.`testcase_id`)) join `tcversions` `TCV` on(`TCV`.`id` = `NHTCV`.`id` and `TCV`.`version` = `LTCVN`.`version`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_tcase_version_number`
--

/*!50001 DROP TABLE IF EXISTS `latest_tcase_version_number`*/;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_number`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_tcase_version_number` AS select `NH_TC`.`id` AS `testcase_id`,max(`TCV`.`version`) AS `version` from ((`nodes_hierarchy` `NH_TC` join `nodes_hierarchy` `NH_TCV` on(`NH_TCV`.`parent_id` = `NH_TC`.`id`)) join `tcversions` `TCV` on(`NH_TCV`.`id` = `TCV`.`id`)) group by `NH_TC`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tcversions_without_keywords`
--

/*!50001 DROP TABLE IF EXISTS `tcversions_without_keywords`*/;
/*!50001 DROP VIEW IF EXISTS `tcversions_without_keywords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tcversions_without_keywords` AS select `NHTCV`.`parent_id` AS `testcase_id`,`NHTCV`.`id` AS `id` from `nodes_hierarchy` `NHTCV` where `NHTCV`.`node_type_id` = 4 and !exists(select 1 from `testcase_keywords` `TCK` where `TCK`.`tcversion_id` = `NHTCV`.`id` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-07 16:23:55
