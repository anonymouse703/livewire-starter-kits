-- MySQL dump 10.17  Distrib 10.3.25-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hmsdb
-- ------------------------------------------------------
-- Server version	10.3.25-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_account_classes`
--

DROP TABLE IF EXISTS `tb_account_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_account_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `description` varchar(100) CHARACTER SET latin1 NOT NULL,
  `shortdescription` varchar(50) CHARACTER SET latin1 NOT NULL,
  `transactionmodule` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`subscription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_account_classes`
--

LOCK TABLES `tb_account_classes` WRITE;
/*!40000 ALTER TABLE `tb_account_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_account_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_account_details`
--

DROP TABLE IF EXISTS `tb_account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_account_details` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `client` int(10) unsigned NOT NULL,
  `accountclass` int(10) unsigned NOT NULL,
  `accounttype` int(10) unsigned NOT NULL,
  `accountentry` int(10) unsigned NOT NULL,
  `accountno` int(10) unsigned NOT NULL,
  `transactionrefno` int(10) unsigned DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`client`,`accountclass`,`accounttype`,`accountentry`,`accountno`,`controlno`,`subscription`),
  KEY `account_details_controlno_foreign` (`controlno`),
  KEY `account_details_subscription_foreign` (`subscription`),
  KEY `account_details_accountclass_foreign` (`accountclass`),
  KEY `account_details_accounttype_foreign` (`accounttype`),
  KEY `account_details_accountentry_foreign` (`accountentry`),
  KEY `account_details_accountno_foreign` (`accountno`),
  CONSTRAINT `account_details_accountclass_foreign` FOREIGN KEY (`accountclass`) REFERENCES `tb_account_classes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `account_details_accountentry_foreign` FOREIGN KEY (`accountentry`) REFERENCES `tb_account_entries` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `account_details_accountno_foreign` FOREIGN KEY (`accountno`) REFERENCES `tb_accounts` (`accountno`) ON UPDATE CASCADE,
  CONSTRAINT `account_details_accounttype_foreign` FOREIGN KEY (`accounttype`) REFERENCES `tb_account_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `account_details_client_foreign` FOREIGN KEY (`client`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `account_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_transaction_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_account_details`
--

LOCK TABLES `tb_account_details` WRITE;
/*!40000 ALTER TABLE `tb_account_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_account_entries`
--

DROP TABLE IF EXISTS `tb_account_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_account_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) CHARACTER SET latin1 NOT NULL,
  `shortdescription` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_account_entries`
--

LOCK TABLES `tb_account_entries` WRITE;
/*!40000 ALTER TABLE `tb_account_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_account_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_account_summary`
--

DROP TABLE IF EXISTS `tb_account_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_account_summary` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `client` int(10) unsigned NOT NULL,
  `accountclass` int(10) unsigned NOT NULL,
  `accounttype` int(10) unsigned NOT NULL,
  `accountentry` int(10) unsigned NOT NULL,
  `accountno` int(10) unsigned NOT NULL,
  `transactionrefno` int(10) unsigned DEFAULT NULL,
  `user` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`client`,`accounttype`,`accountentry`,`accountno`,`accountclass`,`controlno`,`subscription`),
  KEY `account_summary_controlno_foreign` (`controlno`),
  KEY `account_summary_subscription_foreign` (`subscription`),
  KEY `account_summary_accountclass_foreign` (`accountclass`),
  KEY `account_summary_accounttype_foreign` (`accounttype`),
  KEY `account_summary_accountentry_foreign` (`accountentry`),
  KEY `account_summary_accountno_foreign` (`accountno`),
  KEY `account_summary_user_foreign` (`user`),
  CONSTRAINT `account_summary_accountclass_foreign` FOREIGN KEY (`accountclass`) REFERENCES `tb_account_classes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `account_summary_accountentry_foreign` FOREIGN KEY (`accountentry`) REFERENCES `tb_account_entries` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `account_summary_accountno_foreign` FOREIGN KEY (`accountno`) REFERENCES `tb_accounts` (`accountno`) ON UPDATE CASCADE,
  CONSTRAINT `account_summary_accounttype_foreign` FOREIGN KEY (`accounttype`) REFERENCES `tb_account_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `account_summary_client_foreign` FOREIGN KEY (`client`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `account_summary_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_transaction_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_summary_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `account_summary_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_account_summary`
--

LOCK TABLES `tb_account_summary` WRITE;
/*!40000 ALTER TABLE `tb_account_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_account_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_account_types`
--

DROP TABLE IF EXISTS `tb_account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_account_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `module` int(10) unsigned NOT NULL,
  `accountclass` int(10) unsigned NOT NULL,
  `accountcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(100) CHARACTER SET latin1 NOT NULL,
  `shortdesc` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`subscription`,`module`),
  KEY `account_types_subscription_foreign` (`subscription`),
  KEY `account_types_module_foreign` (`module`),
  KEY `account_types_accountclass_foreign` (`accountclass`),
  CONSTRAINT `account_types_accountclass_foreign` FOREIGN KEY (`accountclass`) REFERENCES `tb_account_classes` (`id`),
  CONSTRAINT `account_types_module_foreign` FOREIGN KEY (`module`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `account_types_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_account_types`
--

LOCK TABLES `tb_account_types` WRITE;
/*!40000 ALTER TABLE `tb_account_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_accounts`
--

DROP TABLE IF EXISTS `tb_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_accounts` (
  `subscription` int(10) unsigned NOT NULL,
  `accountno` int(10) unsigned NOT NULL,
  `accountclass` int(10) unsigned NOT NULL,
  `accounttype` int(10) unsigned NOT NULL,
  `client` int(10) unsigned NOT NULL,
  `transactionrefno` int(10) unsigned DEFAULT NULL,
  `user` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`accountno`,`accounttype`,`client`,`accountclass`,`subscription`),
  KEY `accounts_subscription_foreign` (`subscription`),
  KEY `accounts_accountclass_foreign` (`accountclass`),
  KEY `accounts_accounttype_foreign` (`accounttype`),
  KEY `accounts_client_foreign` (`client`),
  KEY `accounts_user_foreign` (`user`),
  CONSTRAINT `accounts_accountclass_foreign` FOREIGN KEY (`accountclass`) REFERENCES `tb_account_classes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `accounts_accounttype_foreign` FOREIGN KEY (`accounttype`) REFERENCES `tb_account_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `accounts_client_foreign` FOREIGN KEY (`client`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `accounts_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `accounts_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_accounts`
--

LOCK TABLES `tb_accounts` WRITE;
/*!40000 ALTER TABLE `tb_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_activity_log`
--

DROP TABLE IF EXISTS `tb_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_activity_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_activity_log`
--

LOCK TABLES `tb_activity_log` WRITE;
/*!40000 ALTER TABLE `tb_activity_log` DISABLE KEYS */;
INSERT INTO `tb_activity_log` VALUES (1,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-05-22 16:54:42','2018-05-22 16:54:42'),(2,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2018-05-22 16:56:56','2018-05-22 16:56:56'),(3,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2018-05-22 17:21:45','2018-05-22 17:21:45'),(4,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2018-05-22 21:39:43','2018-05-22 21:39:43'),(5,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2018-05-23 01:31:38','2018-05-23 01:31:38'),(6,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-05-23 05:03:22','2018-05-23 05:03:22'),(7,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-05-23 11:27:18','2018-05-23 11:27:18'),(8,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2018-05-23 11:27:51','2018-05-23 11:27:51'),(9,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-05-23 13:05:32','2018-05-23 13:05:32'),(10,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-01 18:54:56','2018-06-01 18:54:56'),(11,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2018-06-01 18:55:03','2018-06-01 18:55:03'),(12,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-02 11:10:20','2018-06-02 11:10:20'),(13,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2018-06-02 11:10:38','2018-06-02 11:10:38'),(14,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-02 11:11:32','2018-06-02 11:11:32'),(15,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-03 14:31:54','2018-06-03 14:31:54'),(16,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-04 03:10:53','2018-06-04 03:10:53'),(17,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2018-06-04 03:16:41','2018-06-04 03:16:41'),(18,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2018-06-04 03:39:18','2018-06-04 03:39:18'),(19,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-04 08:15:55','2018-06-04 08:15:55'),(20,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-08 11:09:01','2018-06-08 11:09:01'),(21,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-09 11:43:17','2018-06-09 11:43:17'),(22,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-11 11:18:18','2018-06-11 11:18:18'),(23,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2018-06-11 11:33:57','2018-06-11 11:33:57'),(24,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-13 09:35:39','2018-06-13 09:35:39'),(25,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-13 09:38:04','2018-06-13 09:38:04'),(26,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-14 09:00:54','2018-06-14 09:00:54'),(27,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-18 00:26:09','2018-06-18 00:26:09'),(28,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-20 15:44:42','2018-06-20 15:44:42'),(29,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2018-06-20 15:48:22','2018-06-20 15:48:22'),(30,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-06-21 12:56:47','2018-06-21 12:56:47'),(31,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-07-08 01:45:50','2018-07-08 01:45:50'),(32,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2018-07-08 01:46:20','2018-07-08 01:46:20'),(33,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-07-08 01:46:32','2018-07-08 01:46:32'),(34,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2018-07-08 03:51:31','2018-07-08 03:51:31'),(35,'crm_webapp_activity','Request show role listing',NULL,NULL,1,'App\\User','[]','2018-07-08 03:55:54','2018-07-08 03:55:54'),(36,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-07-08 10:53:38','2018-07-08 10:53:38'),(37,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-07-08 10:56:44','2018-07-08 10:56:44'),(38,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2018-07-08 10:56:53','2018-07-08 10:56:53'),(39,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2018-07-08 10:57:02','2018-07-08 10:57:02'),(40,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-08-24 11:30:32','2018-08-24 11:30:32'),(41,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-08-24 11:33:17','2018-08-24 11:33:17'),(42,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-08-24 17:17:45','2018-08-24 17:17:45'),(43,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2018-08-24 17:18:04','2018-08-24 17:18:04'),(44,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-08-24 17:18:39','2018-08-24 17:18:39'),(45,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-08-25 10:09:02','2018-08-25 10:09:02'),(46,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2018-08-25 12:14:18','2018-08-25 12:14:18'),(47,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-10-03 15:50:27','2020-10-03 15:50:27'),(48,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-03 10:45:58','2020-11-03 10:45:58'),(49,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2020-11-03 10:50:42','2020-11-03 10:50:42'),(50,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-03 10:51:59','2020-11-03 10:51:59'),(51,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2020-11-03 10:52:05','2020-11-03 10:52:05'),(52,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-03 11:47:43','2020-11-03 11:47:43'),(53,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-03 15:42:19','2020-11-03 15:42:19'),(54,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-05 08:51:27','2020-11-05 08:51:27'),(55,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-05 13:41:57','2020-11-05 13:41:57'),(56,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-06 11:18:54','2020-11-06 11:18:54'),(57,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-06 11:41:15','2020-11-06 11:41:15'),(58,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-07 09:58:59','2020-11-07 09:58:59'),(59,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2020-11-07 10:06:48','2020-11-07 10:06:48'),(60,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-07 11:19:37','2020-11-07 11:19:37'),(61,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-07 17:18:23','2020-11-07 17:18:23'),(62,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-07 17:30:55','2020-11-07 17:30:55'),(63,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2020-11-07 17:35:59','2020-11-07 17:35:59'),(64,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2020-11-07 17:37:37','2020-11-07 17:37:37'),(65,'crm_webapp_activity','User superadmin logout!',NULL,NULL,1,'App\\User','[]','2020-11-07 17:39:03','2020-11-07 17:39:03'),(66,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-07 17:39:10','2020-11-07 17:39:10'),(67,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-08 16:55:19','2020-11-08 16:55:19'),(68,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-09 09:43:42','2020-11-09 09:43:42'),(69,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-09 09:53:47','2020-11-09 09:53:47'),(70,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-09 11:32:02','2020-11-09 11:32:02'),(71,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-09 16:05:47','2020-11-09 16:05:47'),(72,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2020-11-09 16:07:17','2020-11-09 16:07:17'),(73,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-10 10:10:03','2020-11-10 10:10:03'),(74,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-12 11:29:40','2020-11-12 11:29:40'),(75,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-19 08:17:53','2020-11-19 08:17:53'),(76,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-19 08:47:44','2020-11-19 08:47:44'),(77,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-19 16:03:39','2020-11-19 16:03:39'),(78,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-20 08:47:14','2020-11-20 08:47:14'),(79,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-20 13:29:13','2020-11-20 13:29:13'),(80,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-21 11:08:48','2020-11-21 11:08:48'),(81,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-21 17:09:04','2020-11-21 17:09:04'),(82,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-11-28 17:32:13','2020-11-28 17:32:13'),(83,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-12-01 09:44:01','2020-12-01 09:44:01'),(84,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-12-07 13:34:16','2020-12-07 13:34:16'),(85,'crm_webapp_activity','Request show role listing',NULL,NULL,2,'App\\User','[]','2020-12-07 14:06:47','2020-12-07 14:06:47'),(86,'crm_webapp_activity','Request show role listing',NULL,NULL,2,'App\\User','[]','2020-12-07 14:07:00','2020-12-07 14:07:00'),(87,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-12-09 15:30:17','2020-12-09 15:30:17'),(88,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2020-12-14 09:01:16','2020-12-14 09:01:16'),(89,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-05 14:08:57','2021-01-05 14:08:57'),(90,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-01-05 14:09:07','2021-01-05 14:09:07'),(91,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-05 14:09:27','2021-01-05 14:09:27'),(92,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-01-05 14:09:34','2021-01-05 14:09:34'),(93,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-05 14:26:34','2021-01-05 14:26:34'),(94,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-05 20:50:43','2021-01-05 20:50:43'),(95,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-06 08:20:48','2021-01-06 08:20:48'),(96,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-01-06 08:56:30','2021-01-06 08:56:30'),(97,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-06 08:56:34','2021-01-06 08:56:34'),(98,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-06 09:18:31','2021-01-06 09:18:31'),(99,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-06 09:53:09','2021-01-06 09:53:09'),(100,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-01-06 10:03:49','2021-01-06 10:03:49'),(101,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-06 10:03:50','2021-01-06 10:03:50'),(102,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-06 10:04:18','2021-01-06 10:04:18'),(103,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-06 13:18:43','2021-01-06 13:18:43'),(104,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-06 13:20:21','2021-01-06 13:20:21'),(105,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-06 13:59:17','2021-01-06 13:59:17'),(106,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-09 09:30:47','2021-01-09 09:30:47'),(107,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2021-01-09 10:16:55','2021-01-09 10:16:55'),(108,'crm_webapp_activity','Request show role listing',NULL,NULL,1,'App\\User','[]','2021-01-09 10:41:36','2021-01-09 10:41:36'),(109,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2021-01-09 10:50:01','2021-01-09 10:50:01'),(110,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2021-01-09 10:57:17','2021-01-09 10:57:17'),(111,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2021-01-09 11:06:57','2021-01-09 11:06:57'),(112,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-09 11:17:31','2021-01-09 11:17:31'),(113,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-09 13:47:05','2021-01-09 13:47:05'),(114,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-09 16:35:02','2021-01-09 16:35:02'),(115,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-11 10:13:35','2021-01-11 10:13:35'),(116,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-11 12:56:37','2021-01-11 12:56:37'),(117,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-11 12:59:52','2021-01-11 12:59:52'),(118,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-01-11 13:01:06','2021-01-11 13:01:06'),(119,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-01-23 16:43:59','2021-01-23 16:43:59'),(120,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-02-06 19:15:38','2021-02-06 19:15:38'),(121,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-02-06 19:15:44','2021-02-06 19:15:44'),(122,'crm_webapp_activity','User superadmin login',NULL,NULL,1,'App\\User','[]','2021-02-06 19:15:53','2021-02-06 19:15:53'),(123,'crm_webapp_activity','User superadmin logout!',NULL,NULL,1,'App\\User','[]','2021-02-06 19:16:50','2021-02-06 19:16:50'),(124,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-02-06 19:16:52','2021-02-06 19:16:52'),(125,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-06-24 10:54:41','2021-06-24 10:54:41'),(126,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-06-24 11:04:51','2021-06-24 11:04:51'),(127,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-06-30 09:28:21','2021-06-30 09:28:21'),(128,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-06-30 10:04:08','2021-06-30 10:04:08'),(129,'crm_webapp_activity','User bcti.tagbi login',NULL,NULL,5,'App\\User','[]','2021-06-30 10:04:21','2021-06-30 10:04:21'),(130,'crm_webapp_activity','User bcti.tagbi logout!',NULL,NULL,5,'App\\User','[]','2021-06-30 10:04:37','2021-06-30 10:04:37'),(131,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-06-30 10:04:43','2021-06-30 10:04:43'),(132,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-06-30 10:05:57','2021-06-30 10:05:57'),(133,'crm_webapp_activity','User bcti.tagbi login',NULL,NULL,5,'App\\User','[]','2021-06-30 10:06:06','2021-06-30 10:06:06'),(134,'crm_webapp_activity','User bcti.tagbi logout!',NULL,NULL,5,'App\\User','[]','2021-06-30 10:06:15','2021-06-30 10:06:15'),(135,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-06-30 10:06:22','2021-06-30 10:06:22'),(136,'crm_webapp_activity','Request show role listing',NULL,NULL,2,'App\\User','[]','2021-06-30 10:06:32','2021-06-30 10:06:32'),(137,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-06-30 10:07:36','2021-06-30 10:07:36'),(138,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-06-30 10:08:01','2021-06-30 10:08:01'),(139,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-06-30 10:10:52','2021-06-30 10:10:52'),(140,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-06-30 10:11:03','2021-06-30 10:11:03'),(141,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-06-30 10:22:15','2021-06-30 10:22:15'),(142,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-06-30 13:51:56','2021-06-30 13:51:56'),(143,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-06-30 16:14:55','2021-06-30 16:14:55'),(144,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-01 08:07:09','2021-07-01 08:07:09'),(145,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-01 11:12:05','2021-07-01 11:12:05'),(146,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-07-01 12:33:49','2021-07-01 12:33:49'),(147,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-02 06:55:18','2021-07-02 06:55:18'),(148,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-03 07:52:55','2021-07-03 07:52:55'),(149,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-04 06:54:06','2021-07-04 06:54:06'),(150,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-05 08:08:01','2021-07-05 08:08:01'),(151,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-08 06:51:48','2021-07-08 06:51:48'),(152,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-08 10:20:45','2021-07-08 10:20:45'),(153,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-07-08 11:37:36','2021-07-08 11:37:36'),(154,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-08 14:26:20','2021-07-08 14:26:20'),(155,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-09 08:11:34','2021-07-09 08:11:34'),(156,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-07-09 15:13:33','2021-07-09 15:13:33'),(157,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-07-09 17:05:31','2021-07-09 17:05:31'),(158,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-10 13:21:16','2021-07-10 13:21:16'),(159,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-12 06:57:04','2021-07-12 06:57:04'),(160,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-12 14:05:01','2021-07-12 14:05:01'),(161,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-07-12 15:13:42','2021-07-12 15:13:42'),(162,'crm_webapp_activity','User admin logout!',NULL,NULL,2,'App\\User','[]','2021-07-12 15:13:47','2021-07-12 15:13:47'),(163,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-12 16:53:44','2021-07-12 16:53:44'),(164,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-12 19:41:42','2021-07-12 19:41:42'),(165,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-07-13 10:33:26','2021-07-13 10:33:26'),(166,'crm_webapp_activity','User admin login',NULL,NULL,2,'App\\User','[]','2021-07-13 15:05:45','2021-07-13 15:05:45'),(167,'crm_webapp_activity','User bcti-tagbi login',NULL,NULL,7,'App\\User','[]','2021-07-14 08:37:50','2021-07-14 08:37:50');
/*!40000 ALTER TABLE `tb_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_activity_log_descriptions`
--

DROP TABLE IF EXISTS `tb_activity_log_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_activity_log_descriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ids` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fields` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_activity_log_descriptions`
--

LOCK TABLES `tb_activity_log_descriptions` WRITE;
/*!40000 ALTER TABLE `tb_activity_log_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_activity_log_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_activity_logs`
--

DROP TABLE IF EXISTS `tb_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_activity_logs` (
  `subscription_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `package` int(11) NOT NULL,
  `store` int(11) DEFAULT NULL,
  `descInfo` int(10) unsigned NOT NULL,
  `reference_id` int(11) NOT NULL,
  `value_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_activity_logs`
--

LOCK TABLES `tb_activity_logs` WRITE;
/*!40000 ALTER TABLE `tb_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_address_type_fields`
--

DROP TABLE IF EXISTS `tb_address_type_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_address_type_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_type` int(10) unsigned NOT NULL,
  `address_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_address_type_fields`
--

LOCK TABLES `tb_address_type_fields` WRITE;
/*!40000 ALTER TABLE `tb_address_type_fields` DISABLE KEYS */;
INSERT INTO `tb_address_type_fields` VALUES (1,1,'pres_street','Street Address'),(2,1,'pres_brgy','Barangay Address'),(3,1,'pres_city','City Address'),(4,1,'pres_prov','Provincial Address'),(5,2,'prov_street','Street Address'),(6,2,'prov_brgy','Barangay Address'),(7,2,'prov_city','City Address'),(8,2,'prov_prov','Provincial Address'),(9,3,'birth_street','Street Address'),(10,3,'birth_brgy','Barangay Address'),(11,3,'birth_city','City Address'),(12,3,'birth_prov','Provincial Address');
/*!40000 ALTER TABLE `tb_address_type_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_address_types`
--

DROP TABLE IF EXISTS `tb_address_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_address_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_address_types`
--

LOCK TABLES `tb_address_types` WRITE;
/*!40000 ALTER TABLE `tb_address_types` DISABLE KEYS */;
INSERT INTO `tb_address_types` VALUES (1,'Present Address'),(2,'Provincial Address'),(3,'Birth Place');
/*!40000 ALTER TABLE `tb_address_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_authors`
--

DROP TABLE IF EXISTS `tb_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_authors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_authors`
--

LOCK TABLES `tb_authors` WRITE;
/*!40000 ALTER TABLE `tb_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_backups`
--

DROP TABLE IF EXISTS `tb_backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_backups`
--

LOCK TABLES `tb_backups` WRITE;
/*!40000 ALTER TABLE `tb_backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_bed_types`
--

DROP TABLE IF EXISTS `tb_bed_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_bed_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bed_types`
--

LOCK TABLES `tb_bed_types` WRITE;
/*!40000 ALTER TABLE `tb_bed_types` DISABLE KEYS */;
INSERT INTO `tb_bed_types` VALUES (1,'Ordinary Foam',NULL,NULL),(2,'Thick Foam',NULL,NULL),(3,'N/A',NULL,NULL);
/*!40000 ALTER TABLE `tb_bed_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_benefit_frequencies`
--

DROP TABLE IF EXISTS `tb_benefit_frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_benefit_frequencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_benefit_frequencies`
--

LOCK TABLES `tb_benefit_frequencies` WRITE;
/*!40000 ALTER TABLE `tb_benefit_frequencies` DISABLE KEYS */;
INSERT INTO `tb_benefit_frequencies` VALUES (1,'1st Payroll'),(2,'2nd Payroll'),(3,'3rd Payroll'),(4,'Every Payroll'),(5,'Daily');
/*!40000 ALTER TABLE `tb_benefit_frequencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_billing`
--

DROP TABLE IF EXISTS `tb_billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_billing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reservation_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `amount_payable` decimal(8,2) NOT NULL,
  `payment_form` int(10) unsigned DEFAULT NULL,
  `payment_status` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_reservation_id_foreign` (`reservation_id`),
  KEY `billing_client_id_foreign` (`client_id`),
  KEY `billing_payment_form_foreign` (`payment_form`),
  KEY `billing_payment_status_foreign` (`payment_status`),
  KEY `billing_status_foreign` (`status`),
  CONSTRAINT `billing_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `tb_clients` (`id`),
  CONSTRAINT `billing_payment_form_foreign` FOREIGN KEY (`payment_form`) REFERENCES `tb_payment_forms` (`id`),
  CONSTRAINT `billing_payment_status_foreign` FOREIGN KEY (`payment_status`) REFERENCES `tb_payment_statuses` (`id`),
  CONSTRAINT `billing_reservation_id_foreign` FOREIGN KEY (`reservation_id`) REFERENCES `tb_reservations` (`id`),
  CONSTRAINT `billing_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_billing`
--

LOCK TABLES `tb_billing` WRITE;
/*!40000 ALTER TABLE `tb_billing` DISABLE KEYS */;
INSERT INTO `tb_billing` VALUES (1,18,12,1000.00,NULL,2,1,'2021-01-06 08:58:39','2021-01-06 08:58:39'),(2,19,13,1000.00,NULL,1,1,'2021-01-06 10:13:31','2021-01-06 10:14:17');
/*!40000 ALTER TABLE `tb_billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_billing_details`
--

DROP TABLE IF EXISTS `tb_billing_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_billing_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `billing_id` int(10) unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_details_billing_id_foreign` (`billing_id`),
  CONSTRAINT `billing_details_billing_id_foreign` FOREIGN KEY (`billing_id`) REFERENCES `tb_billing` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_billing_details`
--

LOCK TABLES `tb_billing_details` WRITE;
/*!40000 ALTER TABLE `tb_billing_details` DISABLE KEYS */;
INSERT INTO `tb_billing_details` VALUES (1,1,'401 - Deluxe Room',1.00,1000.00,'2021-01-06 08:58:39','2021-01-06 08:58:39'),(2,2,'401 - Deluxe Room',1.00,1000.00,'2021-01-06 10:13:31','2021-01-06 10:13:31');
/*!40000 ALTER TABLE `tb_billing_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_business_types`
--

DROP TABLE IF EXISTS `tb_business_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_business_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_business_types`
--

LOCK TABLES `tb_business_types` WRITE;
/*!40000 ALTER TABLE `tb_business_types` DISABLE KEYS */;
INSERT INTO `tb_business_types` VALUES (1,'Agriculture & Forestry/Wildlife','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Business & Information','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Construction/Utilities/Contracting','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Education','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Finance & Insurance','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'Food & Hospitality','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'Gaming','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'Health Services','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'Motor Vehicle','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'Natural Resources/Environmental','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'Others','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'Personal Services','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'Real Estate & Housing','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'Safety/Security & Legal','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'Transportation','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_business_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_client_employee_histories`
--

DROP TABLE IF EXISTS `tb_client_employee_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_client_employee_histories` (
  `client` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `subscription` int(10) unsigned NOT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `effective` date NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_client_employee_histories`
--

LOCK TABLES `tb_client_employee_histories` WRITE;
/*!40000 ALTER TABLE `tb_client_employee_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_client_employee_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_clients`
--

DROP TABLE IF EXISTS `tb_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middlename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suffix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(10) unsigned DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barangay` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clients_gender_foreign` (`gender`),
  KEY `clients_status_foreign` (`status`),
  KEY `clients_user_foreign` (`user`),
  CONSTRAINT `clients_gender_foreign` FOREIGN KEY (`gender`) REFERENCES `tb_gender` (`id`),
  CONSTRAINT `clients_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `clients_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_clients`
--

LOCK TABLES `tb_clients` WRITE;
/*!40000 ALTER TABLE `tb_clients` DISABLE KEYS */;
INSERT INTO `tb_clients` VALUES (1,'Barack','o','Obama','Jr.','barackobama@gmail.com','09348593485',NULL,1,'Wall St.','Brgy Taclobo','Cebu City','Cebu','2018-06-12',1,2,'2018-06-04 03:16:01','2018-06-04 03:35:50'),(2,'Juan',NULL,'Dela Cruz','Jr.','juan@gmail.com','0948593458',NULL,1,'Wall St.','Sambag I','Cebu City','Cebu','2018-06-30',1,2,'2018-06-04 03:38:53','2018-06-04 03:38:53'),(3,'jun',NULL,'requino',NULL,'junrequino@gmail.com','09255017027',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2018-06-11 11:17:32','2018-06-11 11:17:32'),(4,'SAdam',NULL,'Hussain',NULL,'blahdahjack@gmail.com','123123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2018-06-13 09:37:35','2018-06-13 09:37:35'),(5,'Sample',NULL,'Sample',NULL,'sample@gmail.com','123123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2018-06-14 09:21:19','2018-06-14 09:21:19'),(6,'test',NULL,'test',NULL,'test@test','test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2018-06-18 00:39:24','2018-06-18 00:39:24'),(7,'Rachle',NULL,'NAVARRO',NULL,'NAVARRORACHLE@YAHOO.COM','09778550733',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2018-06-20 15:44:18','2018-06-20 15:44:18'),(8,'Jane',NULL,'doe',NULL,'janedoe@test.com','094589438545',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2018-08-24 17:17:33','2018-08-24 17:17:33'),(9,'ANGOL',NULL,'VERGARA',NULL,'ANGOL@GMAIL.COM','091234567890',NULL,1,NULL,NULL,NULL,NULL,'2020-12-09',2,2,'2020-11-03 07:41:31','2020-12-09 15:31:32'),(10,'Lito',NULL,'Cesar',NULL,'joselito.cesar@gmail.com','09075319079',NULL,1,NULL,NULL,NULL,NULL,'1987-01-19',1,2,'2020-11-05 05:41:27','2020-11-07 10:05:13'),(11,'Rey Mark','La bada','Engada',NULL,'rey@gmail.com','09123334941',NULL,1,'No street','Tubtobon','Sibulan','Negros Oriental','1994-10-29',1,2,'2020-12-07 13:45:39','2020-12-07 13:45:39'),(12,'Dreamerson',NULL,'GARAY',NULL,'dreamersonlaurongaray@gmail.com','09976084039',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-01-06 00:30:09','2021-01-06 00:30:09'),(13,'analyn',NULL,'pamaylaon',NULL,'analynpamaylaon@yahoo.com','09355514241',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-01-06 02:08:20','2021-01-06 02:08:20'),(14,'analyn','a','pamalayon',NULL,'analynpamaylaon@yahoo.com','09971809359',NULL,2,'loay','concipcion','tagb','bohol','2021-06-17',1,2,'2021-01-06 10:19:11','2021-01-06 10:19:11'),(15,'Borces/testing',NULL,'reydellio',NULL,'reyborces@gmail.com','09075319079',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-06-30 01:59:33','2021-06-30 01:59:33'),(16,'testing','m','client',NULL,'borcesrey@gmail.com','09075319079',NULL,1,NULL,'vissara','Tagbilaran','Bohol','2010-07-05',1,7,'2021-06-30 10:37:56','2021-06-30 10:37:56'),(17,'REY',NULL,'TAMPOGAO',NULL,'boholcooptouristinn@gmail.com','09518990582',NULL,1,NULL,'TALOTO','TAGBILARAN','BOHOL','2021-09-11',1,7,'2021-06-30 16:34:07','2021-06-30 16:34:07'),(18,'REY',NULL,'TAMPOGAO',NULL,'boholcooptouristinn@gmail.com','09518990582',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-06-30 09:41:35','2021-06-30 09:41:35'),(19,'Stefanny','sayson','Cabilao',NULL,'boholcooptouristinn@gmail.com','09518990582',NULL,2,NULL,NULL,'ubay','BOHOL','1994-09-23',1,7,'2021-07-01 12:06:02','2021-07-01 12:08:24'),(20,'jessa  mae',NULL,'gallemit',NULL,'boholcooptouristinn@gmail.com','09386998740',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-01 22:58:47','2021-07-01 22:58:47'),(21,'bryan',NULL,'merciano',NULL,'boholcooptouristinn@gmail.com','09676308291',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-07 22:58:26','2021-07-07 22:58:26'),(22,'ELIZA','sayson','ESCABASA',NULL,NULL,'09518990582',NULL,2,'POB UBOS ST.','TALOTO','TAGBILARAN','BOHOL','1994-09-16',1,7,'2021-07-08 11:17:09','2021-07-08 11:17:09'),(23,'ELIZA',NULL,'ESCABASA',NULL,'boholcooptouristinn@gmail.com','09518990582',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-08 03:57:57','2021-07-08 03:57:57'),(24,'bryan',NULL,'merciano',NULL,'boholcooptouristinn@gmail.com','09676308291',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-08 04:02:13','2021-07-08 04:02:13'),(25,'FLORDELIS',NULL,'BERTUMEN',NULL,'boholcooptouristinn@gmail.com','09984604749',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-08 09:51:57','2021-07-08 09:51:57'),(26,'ELIZA',NULL,'ESCABAS',NULL,'boholcooptouristinn@gmail.com','09519312782',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-08 09:55:27','2021-07-08 09:55:27'),(27,'bryan',NULL,'merciano',NULL,'boholcooptouristinn@gmail.com','09676308291',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-10 05:22:59','2021-07-10 05:22:59'),(28,'ELIZA',NULL,'ESCABASA',NULL,'boholcooptouristinn@gmail.com','09518990582',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-10 05:25:56','2021-07-10 05:25:56'),(29,'jean',NULL,'gallerto',NULL,'boholcooptouristinn@gmail.com','09355269395',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-10 05:28:33','2021-07-10 05:28:33'),(30,'ELIZA',NULL,'ESCABASA',NULL,'boholcooptouristinn@gmail.com','09518990582',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-10 05:30:12','2021-07-10 05:30:12'),(31,'bryan',NULL,'merciano',NULL,'boholcooptouristinn@gmail.com','09676308291',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-10 05:35:32','2021-07-10 05:35:32'),(32,'FLORDELIS',NULL,'bertumen',NULL,'boholcooptouristinn@gmail.com','09984604749',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-10 05:38:41','2021-07-10 05:38:41'),(33,'FLORDELIS',NULL,'gallerto',NULL,'boholcooptouristinn@gmail.com','09355269395',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-10 05:42:08','2021-07-10 05:42:08'),(34,'FLORDELIS',NULL,'gallerto',NULL,'boholcooptouristinn@gmail.com','09355269395',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-10 05:43:55','2021-07-10 05:43:55'),(35,'FLORDELIS',NULL,'gallerto',NULL,'boholcooptouristinn@gmail.com','09355269395',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-10 05:46:39','2021-07-10 05:46:39'),(36,'RAYMOND',NULL,'ALAMPAYAN',NULL,'boholcooptouristinn@gmail.com','09354599085',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-11 22:58:42','2021-07-11 22:58:42'),(37,'RAYMOND',NULL,'ALAMPAYAN',NULL,'boholcooptouristinn@gmail.com','09354599085',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-11 23:03:34','2021-07-11 23:03:34'),(38,'RAYMOND',NULL,'ALAMPAYAN',NULL,'boholcooptouristinn@gmail.com','09354599085',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-11 23:18:38','2021-07-11 23:18:38'),(39,'STA. RITA',NULL,'BUILDERS',NULL,'boholcooptouristinn@gmail.com','09676308291',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2021-07-12 11:41:27','2021-07-12 11:41:27');
/*!40000 ALTER TABLE `tb_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comments`
--

DROP TABLE IF EXISTS `tb_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `classification` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sq_id` int(10) unsigned NOT NULL,
  `reply` int(11) NOT NULL DEFAULT 0,
  `replied` int(11) NOT NULL DEFAULT 0,
  `history` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_status_id_foreign` (`status_id`),
  KEY `comments_file_id_foreign` (`file_id`),
  KEY `comments_sq_id_foreign` (`sq_id`),
  CONSTRAINT `comments_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `tb_files` (`id`),
  CONSTRAINT `comments_sq_id_foreign` FOREIGN KEY (`sq_id`) REFERENCES `tb_shipping_requests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comments`
--

LOCK TABLES `tb_comments` WRITE;
/*!40000 ALTER TABLE `tb_comments` DISABLE KEYS */;
INSERT INTO `tb_comments` VALUES (3,2,'test',NULL,1,NULL,NULL,NULL,'2018-04-24 23:48:10','2018-05-06 17:20:45',4,0,0,NULL,'2018-05-06 17:20:45'),(4,2,'test',NULL,9,NULL,NULL,NULL,'2018-05-07 09:44:38','2018-05-12 07:35:14',9,2,0,NULL,NULL),(5,3,'ok',NULL,1,NULL,NULL,NULL,'2018-05-12 07:17:23','2018-05-12 07:36:08',10,2,0,NULL,NULL),(6,2,'thanks',NULL,1,NULL,NULL,NULL,'2018-05-12 07:21:36','2018-05-12 07:36:08',10,2,0,NULL,NULL),(7,2,'Reopened',NULL,9,NULL,NULL,NULL,'2018-05-12 07:27:58','2018-05-12 07:35:14',9,2,0,'history',NULL),(8,2,'test',NULL,9,NULL,NULL,NULL,'2018-05-12 07:31:16','2018-05-12 07:35:14',9,2,0,NULL,NULL),(9,2,'Your SKU: 234234, buyer_id: 24234 Cancel Order',NULL,1,NULL,NULL,NULL,'2018-05-12 07:32:18','2018-05-16 14:47:26',7,2,1,NULL,NULL),(10,2,'test',NULL,2,NULL,NULL,NULL,'2018-05-12 07:32:37','2018-05-16 14:47:26',7,2,1,NULL,NULL),(11,3,'test',NULL,9,NULL,NULL,NULL,'2018-05-12 07:35:14','2018-05-12 07:35:14',9,2,0,NULL,NULL),(12,2,'Reopened',NULL,1,NULL,NULL,NULL,'2018-05-12 07:36:08','2018-05-12 07:36:08',10,2,0,'history',NULL),(13,2,'Closed',NULL,10,NULL,NULL,NULL,'2018-05-12 16:59:07','2018-05-12 16:59:07',9,2,0,'history',NULL),(14,2,'Reopened',NULL,9,NULL,NULL,NULL,'2018-05-12 16:59:34','2018-05-16 14:47:26',7,2,1,'history',NULL),(15,2,'na',NULL,10,NULL,NULL,NULL,'2018-05-12 17:46:57','2018-05-16 14:47:26',7,2,1,NULL,NULL),(16,2,'Reopened',NULL,9,NULL,NULL,NULL,'2018-05-12 17:47:41','2018-05-16 14:47:26',7,2,1,'history',NULL),(17,2,'test',NULL,9,10,NULL,NULL,'2018-05-12 17:48:38','2018-05-16 14:47:26',7,2,1,NULL,NULL),(18,2,'4',NULL,9,NULL,NULL,NULL,'2018-05-12 17:50:50','2018-05-16 14:47:26',7,2,1,'history',NULL),(19,2,'2',NULL,9,NULL,NULL,NULL,'2018-05-12 17:51:23','2018-05-16 14:47:26',7,2,1,'history',NULL),(20,2,'订单未更新（Pre-Shipment）',NULL,9,NULL,NULL,NULL,'2018-05-12 17:54:25','2018-05-16 14:47:26',7,2,1,'history',NULL),(21,2,'test',NULL,9,NULL,NULL,NULL,'2018-05-16 14:47:26','2018-05-16 14:47:26',7,1,0,NULL,NULL);
/*!40000 ALTER TABLE `tb_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_data_types`
--

DROP TABLE IF EXISTS `tb_data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_data_types`
--

LOCK TABLES `tb_data_types` WRITE;
/*!40000 ALTER TABLE `tb_data_types` DISABLE KEYS */;
INSERT INTO `tb_data_types` VALUES (1,'String','string'),(2,'Integer','int'),(3,'Decimal','float');
/*!40000 ALTER TABLE `tb_data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_deduction_details`
--

DROP TABLE IF EXISTS `tb_deduction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_deduction_details` (
  `controlno` int(10) unsigned NOT NULL,
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `particular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  PRIMARY KEY (`controlno`,`subscription`,`employee`,`particular`),
  KEY `deduction_details_subscription_foreign` (`subscription`),
  KEY `deduction_details_employee_foreign` (`employee`),
  CONSTRAINT `deduction_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_deduction_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deduction_details_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `deduction_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_deduction_details`
--

LOCK TABLES `tb_deduction_details` WRITE;
/*!40000 ALTER TABLE `tb_deduction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_deduction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_deduction_institutions`
--

DROP TABLE IF EXISTS `tb_deduction_institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_deduction_institutions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `system_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sequence` smallint(6) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `deduction_institutions_subscription_foreign` (`subscription`),
  KEY `deduction_institutions_user_foreign` (`user`),
  CONSTRAINT `deduction_institutions_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `deduction_institutions_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_deduction_institutions`
--

LOCK TABLES `tb_deduction_institutions` WRITE;
/*!40000 ALTER TABLE `tb_deduction_institutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_deduction_institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_deduction_summary`
--

DROP TABLE IF EXISTS `tb_deduction_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_deduction_summary` (
  `controlno` int(10) unsigned NOT NULL,
  `subscription` int(10) unsigned NOT NULL,
  `store` int(10) unsigned NOT NULL DEFAULT 0,
  `payroll_period` int(10) unsigned DEFAULT NULL,
  `period` date NOT NULL,
  `payrollstart` date NOT NULL,
  `payrollend` date NOT NULL,
  `deduction_institution` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `posted_by` int(10) unsigned DEFAULT NULL,
  `posted_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`,`subscription`,`store`,`period`,`payrollstart`,`payrollend`,`deduction_institution`,`status`),
  KEY `deduction_summary_subscription_foreign` (`subscription`),
  KEY `deduction_summary_deduction_institution_foreign` (`deduction_institution`),
  KEY `deduction_summary_user_foreign` (`user`),
  KEY `deduction_summary_status_foreign` (`status`),
  KEY `deduction_summary_posted_by_foreign` (`posted_by`),
  KEY `deduction_summary_payroll_period_foreign` (`payroll_period`),
  CONSTRAINT `deduction_summary_deduction_institution_foreign` FOREIGN KEY (`deduction_institution`) REFERENCES `tb_deduction_institutions` (`id`),
  CONSTRAINT `deduction_summary_payroll_period_foreign` FOREIGN KEY (`payroll_period`) REFERENCES `tb_payroll_period_summary` (`id`),
  CONSTRAINT `deduction_summary_posted_by_foreign` FOREIGN KEY (`posted_by`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `deduction_summary_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_transaction_tags` (`id`),
  CONSTRAINT `deduction_summary_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `deduction_summary_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_deduction_summary`
--

LOCK TABLES `tb_deduction_summary` WRITE;
/*!40000 ALTER TABLE `tb_deduction_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_deduction_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_deduction_types`
--

DROP TABLE IF EXISTS `tb_deduction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_deduction_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortdesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sysgen` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `deduction_types_subscription_foreign` (`subscription`),
  KEY `deduction_types_user_foreign` (`user`),
  KEY `deduction_types_status_foreign` (`status`),
  CONSTRAINT `deduction_types_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `deduction_types_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `deduction_types_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_deduction_types`
--

LOCK TABLES `tb_deduction_types` WRITE;
/*!40000 ALTER TABLE `tb_deduction_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_deduction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_delivery_details`
--

DROP TABLE IF EXISTS `tb_delivery_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_delivery_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controlno` int(11) unsigned zerofill NOT NULL,
  `product` int(11) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `quantity` mediumint(9) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`controlno`,`product`) USING BTREE,
  KEY `delivery_details_controlno_foreign` (`controlno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_delivery_details`
--

LOCK TABLES `tb_delivery_details` WRITE;
/*!40000 ALTER TABLE `tb_delivery_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_delivery_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_delivery_summary`
--

DROP TABLE IF EXISTS `tb_delivery_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_delivery_summary` (
  `controlno` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `deliverynumber` int(11) unsigned zerofill NOT NULL,
  `transactionrefno` int(11) NOT NULL,
  `transactiontype` int(11) NOT NULL,
  `entrytype` int(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `deliverydate` date NOT NULL,
  `remarks` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_delivery_summary`
--

LOCK TABLES `tb_delivery_summary` WRITE;
/*!40000 ALTER TABLE `tb_delivery_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_delivery_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_departments`
--

DROP TABLE IF EXISTS `tb_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `device_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_departments`
--

LOCK TABLES `tb_departments` WRITE;
/*!40000 ALTER TABLE `tb_departments` DISABLE KEYS */;
INSERT INTO `tb_departments` VALUES (1,2,'CEBU - 138 BNB Funzone','9',2,1,'2017-04-28 20:14:54','2017-04-28 20:14:54'),(2,2,'CEBU - T. Padilla Office','8',2,1,'2017-04-28 20:15:37','2017-04-28 20:15:37'),(3,1,'CEBU - SM Seaside - iTech','',2,1,'2017-04-28 20:15:44','2017-04-28 20:15:44'),(4,2,'CEBU - Bibo 1','11',2,1,'2017-04-28 20:15:51','2017-04-28 20:15:51'),(5,2,'CEBU - Bibo 3','12',2,1,'2017-04-28 20:15:57','2017-04-28 20:15:57'),(6,1,'BACOLOD - Digital Village','50',2,1,'2017-04-28 20:16:04','2017-04-29 03:57:39'),(7,2,'BACOLOD - Bibo','51',2,1,'2017-04-28 20:16:11','2017-04-28 20:16:11'),(8,1,'BACOLOD - GameOne','54',2,1,'2017-04-28 20:16:21','2017-04-28 20:16:21'),(9,2,'ILOILO - Bibo','52',2,1,'2017-04-28 20:16:29','2017-04-28 20:16:29'),(10,1,'ILOILO - iTech','53',2,1,'2017-04-28 20:16:37','2017-04-28 20:16:37'),(11,1,'ILOILO - PlayNation','55',2,1,'2017-04-28 20:16:46','2017-04-28 20:16:46'),(12,1,'MANILA - Calamba - iTech','100',2,1,'2017-04-28 20:17:03','2017-04-28 20:17:03'),(13,1,'MANILA - SM BF - iTech','101',2,1,'2017-04-28 20:17:12','2017-04-28 20:17:12'),(14,1,'MANILA - G4 - iTech','102',2,1,'2017-04-28 20:17:22','2017-04-28 20:17:22'),(15,1,'MANILA - Market Market - iTech','103',2,1,'2017-04-28 20:17:31','2017-04-28 20:17:31'),(16,2,'MANILA - SM North - Denki','104',2,1,'2017-04-28 20:17:38','2017-04-28 20:17:38'),(17,2,'MANILA - Bibo SM North','105',2,1,'2017-04-28 20:17:45','2017-04-28 20:17:45'),(18,1,'MANILA - Fairview G1 D1','106',2,1,'2017-04-28 20:17:52','2017-04-28 20:17:52'),(19,1,'MANILA - GameOne Greenhills','107',2,1,'2017-04-28 20:18:05','2017-04-28 20:18:05'),(20,2,'CEBU - Bibo SM Seaside','1',2,1,'2017-04-29 03:12:03','2017-04-29 03:12:03'),(21,1,'CEBU - Ayala iTech',NULL,2,1,'2017-04-29 03:34:35','2017-04-29 03:34:35'),(22,1,'CEBU - SM Digital Village',NULL,2,1,'2017-04-29 03:36:36','2017-04-29 03:36:36'),(23,1,'CEBU - Ayala Digital Village',NULL,2,1,'2017-04-29 03:36:51','2017-04-29 03:36:51'),(24,1,'CEBU - SM Cebu Gaming',NULL,2,1,'2017-04-29 03:39:58','2017-04-29 03:39:58'),(25,1,'CEBU - SM Cebu - iTech',NULL,2,1,'2017-04-29 03:41:42','2017-04-29 03:41:42'),(26,1,'MANILA - SM North Edsa - iTech',NULL,2,1,'2017-04-29 03:44:21','2017-04-29 03:44:21'),(27,1,'Digital Village',NULL,2,1,'2017-04-29 03:52:34','2017-04-29 03:52:34');
/*!40000 ALTER TABLE `tb_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_divisions`
--

DROP TABLE IF EXISTS `tb_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_divisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_divisions`
--

LOCK TABLES `tb_divisions` WRITE;
/*!40000 ALTER TABLE `tb_divisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_document_author`
--

DROP TABLE IF EXISTS `tb_document_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_document_author` (
  `document_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`document_id`,`author_id`),
  KEY `ordinance_author_author_id_foreign` (`author_id`),
  CONSTRAINT `ordinance_author_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `tb_authors` (`id`),
  CONSTRAINT `ordinance_author_ordinance_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `tb_documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_document_author`
--

LOCK TABLES `tb_document_author` WRITE;
/*!40000 ALTER TABLE `tb_document_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_document_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_document_categories`
--

DROP TABLE IF EXISTS `tb_document_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_document_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_document_categories`
--

LOCK TABLES `tb_document_categories` WRITE;
/*!40000 ALTER TABLE `tb_document_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_document_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_document_logs`
--

DROP TABLE IF EXISTS `tb_document_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_document_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordinance_logs_ordinance_foreign` (`document`),
  KEY `ordinance_logs_user_foreign` (`user`),
  CONSTRAINT `ordinance_logs_ordinance_foreign` FOREIGN KEY (`document`) REFERENCES `tb_documents` (`id`),
  CONSTRAINT `ordinance_logs_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_document_logs`
--

LOCK TABLES `tb_document_logs` WRITE;
/*!40000 ALTER TABLE `tb_document_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_document_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_document_types`
--

DROP TABLE IF EXISTS `tb_document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_document_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_document_types`
--

LOCK TABLES `tb_document_types` WRITE;
/*!40000 ALTER TABLE `tb_document_types` DISABLE KEYS */;
INSERT INTO `tb_document_types` VALUES (1,'Ordinance'),(2,'Resolution');
/*!40000 ALTER TABLE `tb_document_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_documents`
--

DROP TABLE IF EXISTS `tb_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `document_type` int(10) unsigned NOT NULL,
  `category` int(10) unsigned DEFAULT NULL,
  `src_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `approved_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordinances_status_foreign` (`status`),
  KEY `ordinances_user_foreign` (`user`),
  KEY `ordinances_category_foreign` (`category`),
  KEY `documents_document_type_foreign` (`document_type`),
  CONSTRAINT `documents_document_type_foreign` FOREIGN KEY (`document_type`) REFERENCES `tb_document_types` (`id`),
  CONSTRAINT `ordinances_category_foreign` FOREIGN KEY (`category`) REFERENCES `tb_document_categories` (`id`),
  CONSTRAINT `ordinances_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `ordinances_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_documents`
--

LOCK TABLES `tb_documents` WRITE;
/*!40000 ALTER TABLE `tb_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dtr_activities`
--

DROP TABLE IF EXISTS `tb_dtr_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dtr_activities` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `activity_type` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `activity_at` datetime NOT NULL,
  `terminal` int(10) unsigned NOT NULL DEFAULT 0,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subscription`,`controlno`,`activity_type`,`employee`,`activity_at`,`terminal`,`status`),
  KEY `dtr_activities_controlno_foreign` (`controlno`),
  KEY `dtr_activities_activity_type_foreign` (`activity_type`),
  KEY `dtr_activities_employee_foreign` (`employee`),
  KEY `dtr_activities_status_foreign` (`status`),
  CONSTRAINT `dtr_activities_activity_type_foreign` FOREIGN KEY (`activity_type`) REFERENCES `tb_dtr_activity_types` (`id`),
  CONSTRAINT `dtr_activities_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_dtr_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dtr_activities_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `dtr_activities_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `dtr_activities_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dtr_activities`
--

LOCK TABLES `tb_dtr_activities` WRITE;
/*!40000 ALTER TABLE `tb_dtr_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dtr_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dtr_activity_categories`
--

DROP TABLE IF EXISTS `tb_dtr_activity_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dtr_activity_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `dtr_activity_categories_subscription_foreign` (`subscription`),
  KEY `dtr_activity_categories_user_foreign` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dtr_activity_categories`
--

LOCK TABLES `tb_dtr_activity_categories` WRITE;
/*!40000 ALTER TABLE `tb_dtr_activity_categories` DISABLE KEYS */;
INSERT INTO `tb_dtr_activity_categories` VALUES (1,1,'Online Productive',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1,'Offline Productive',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1,'Online Non-Productive',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,1,'Offline Non-Productive',2,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_dtr_activity_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dtr_activity_record_types`
--

DROP TABLE IF EXISTS `tb_dtr_activity_record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dtr_activity_record_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dtr_activity_record_types`
--

LOCK TABLES `tb_dtr_activity_record_types` WRITE;
/*!40000 ALTER TABLE `tb_dtr_activity_record_types` DISABLE KEYS */;
INSERT INTO `tb_dtr_activity_record_types` VALUES (1,'ON'),(2,'OFF');
/*!40000 ALTER TABLE `tb_dtr_activity_record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dtr_activity_types`
--

DROP TABLE IF EXISTS `tb_dtr_activity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dtr_activity_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `activity_category` int(10) unsigned NOT NULL,
  `activity_record_type` int(10) unsigned NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `dtr_activity_types_subscription_foreign` (`subscription`),
  KEY `dtr_activity_types_activity_category_foreign` (`activity_category`),
  KEY `dtr_activity_types_activity_record_type_foreign` (`activity_record_type`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dtr_activity_types`
--

LOCK TABLES `tb_dtr_activity_types` WRITE;
/*!40000 ALTER TABLE `tb_dtr_activity_types` DISABLE KEYS */;
INSERT INTO `tb_dtr_activity_types` VALUES (1,1,1,1,'Clock In 1','clock_in_1','2016-07-29 05:15:23','2016-07-29 05:15:23'),(2,1,1,2,'Clock Out 1','clock_out_1','2016-07-29 05:15:23','2016-07-29 05:15:23'),(3,1,1,1,'Clock In 2','clock_in_2','2016-07-29 05:15:23','2016-07-29 05:15:23'),(4,1,1,2,'Clock Out 2','clock_out_2','2016-07-29 05:15:23','2016-07-29 05:15:23'),(5,1,1,1,'Clock In 3','clock_in_3','2016-07-29 05:15:23','2016-07-29 05:15:23'),(6,1,1,2,'Clock Out 3','clock_out_3','2016-07-29 05:15:23','2016-07-29 05:15:23'),(7,1,1,1,'Clock In 4','clock_in_4','2016-07-29 05:15:23','2016-07-29 05:15:23'),(8,1,1,2,'Clock Out 4','clock_out_4','2016-07-29 05:15:23','2016-07-29 05:15:23'),(9,1,1,1,'Clock In 5','clock_in_5','2016-07-29 05:15:23','2016-07-29 05:15:23'),(10,1,1,2,'Clock Out 5','clock_out_5','2016-07-29 05:15:23','2016-07-29 05:15:23'),(11,2,1,1,'Clock In 1','clock_in_1','2016-07-29 05:15:23','2016-07-29 05:15:23'),(12,2,1,2,'Clock Out 1','clock_out_1','2016-07-29 05:15:23','2016-07-29 05:15:23'),(13,2,1,1,'Clock In 2','clock_in_2','2016-07-29 05:15:23','2016-07-29 05:15:23'),(14,2,1,2,'Clock Out 2','clock_out_2','2016-07-29 05:15:23','2016-07-29 05:15:23'),(15,2,1,1,'Clock In 3','clock_in_3','2016-07-29 05:15:23','2016-07-29 05:15:23'),(16,2,1,2,'Clock Out 3','clock_out_3','2016-07-29 05:15:23','2016-07-29 05:15:23'),(17,2,1,1,'Clock In 4','clock_in_4','2016-07-29 05:15:23','2016-07-29 05:15:23'),(18,2,1,2,'Clock Out 4','clock_out_4','2016-07-29 05:15:23','2016-07-29 05:15:23'),(19,2,1,1,'Clock In 5','clock_in_5','2016-07-29 05:15:23','2016-07-29 05:15:23'),(20,2,1,2,'Clock Out 5','clock_out_5','2016-07-29 05:15:23','2016-07-29 05:15:23');
/*!40000 ALTER TABLE `tb_dtr_activity_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dtr_details`
--

DROP TABLE IF EXISTS `tb_dtr_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dtr_details` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `activity_date` date NOT NULL DEFAULT '0000-00-00',
  `workhours` decimal(9,2) DEFAULT NULL,
  `night_diff` decimal(9,2) DEFAULT NULL,
  `night_diff_overtime` decimal(9,2) NOT NULL,
  `late` decimal(9,2) DEFAULT NULL,
  `undertime` decimal(9,2) DEFAULT NULL,
  `overtime` decimal(9,2) DEFAULT NULL,
  `holiday_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`subscription`,`controlno`,`employee`,`activity_date`),
  KEY `dtr_details_controlno_foreign` (`controlno`),
  KEY `dtr_details_employee_foreign` (`employee`),
  KEY `dtr_details_holiday_id_foreign` (`holiday_id`),
  CONSTRAINT `dtr_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_dtr_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dtr_details_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `dtr_details_holiday_id_foreign` FOREIGN KEY (`holiday_id`) REFERENCES `tb_holidays` (`id`),
  CONSTRAINT `dtr_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dtr_details`
--

LOCK TABLES `tb_dtr_details` WRITE;
/*!40000 ALTER TABLE `tb_dtr_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dtr_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dtr_file_types`
--

DROP TABLE IF EXISTS `tb_dtr_file_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dtr_file_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dtr_file_types`
--

LOCK TABLES `tb_dtr_file_types` WRITE;
/*!40000 ALTER TABLE `tb_dtr_file_types` DISABLE KEYS */;
INSERT INTO `tb_dtr_file_types` VALUES (1,'Excel (Default)','xlsd'),(2,'Excel (Zkteco)','xlsz'),(3,'Text','txt');
/*!40000 ALTER TABLE `tb_dtr_file_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dtr_holidays`
--

DROP TABLE IF EXISTS `tb_dtr_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dtr_holidays` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `work_hours` decimal(9,2) NOT NULL,
  `night_diff` decimal(9,2) NOT NULL,
  `night_diff_overtime` decimal(9,2) NOT NULL,
  `late` decimal(9,2) NOT NULL,
  `undertime` decimal(9,2) NOT NULL,
  `overtime` decimal(9,2) NOT NULL,
  `work_date` date NOT NULL,
  `holiday_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subscription`,`controlno`,`employee`,`work_date`,`holiday_id`),
  KEY `dtr_holidays_controlno_foreign` (`controlno`),
  KEY `dtr_holidays_employee_foreign` (`employee`),
  KEY `dtr_holidays_holiday_id_foreign` (`holiday_id`),
  CONSTRAINT `dtr_holidays_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_dtr_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dtr_holidays_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `dtr_holidays_holiday_id_foreign` FOREIGN KEY (`holiday_id`) REFERENCES `tb_holidays` (`id`),
  CONSTRAINT `dtr_holidays_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dtr_holidays`
--

LOCK TABLES `tb_dtr_holidays` WRITE;
/*!40000 ALTER TABLE `tb_dtr_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dtr_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dtr_summary`
--

DROP TABLE IF EXISTS `tb_dtr_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dtr_summary` (
  `controlno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `payroll_period` int(10) unsigned DEFAULT NULL,
  `period` date NOT NULL,
  `payrollstart` date NOT NULL,
  `payrollend` date NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`),
  KEY `dtr_summary_subscription_foreign` (`subscription`),
  KEY `dtr_summary_user_foreign` (`user`),
  KEY `dtr_summary_status_foreign` (`status`),
  KEY `dtr_summary_payroll_period_foreign` (`payroll_period`),
  CONSTRAINT `dtr_summary_payroll_period_foreign` FOREIGN KEY (`payroll_period`) REFERENCES `tb_payroll_period_summary` (`id`),
  CONSTRAINT `dtr_summary_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_transaction_tags` (`id`),
  CONSTRAINT `dtr_summary_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `dtr_summary_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dtr_summary`
--

LOCK TABLES `tb_dtr_summary` WRITE;
/*!40000 ALTER TABLE `tb_dtr_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dtr_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_accounts`
--

DROP TABLE IF EXISTS `tb_ebay_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auth_token` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_session_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(10) unsigned NOT NULL,
  `last_sync_at` datetime DEFAULT NULL,
  `token_expiration_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_accounts`
--

LOCK TABLES `tb_ebay_accounts` WRITE;
/*!40000 ALTER TABLE `tb_ebay_accounts` DISABLE KEYS */;
INSERT INTO `tb_ebay_accounts` VALUES (4,'mastahed','','AgAAAA**AQAAAA**aAAAAA**TCOaWg**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6AFlYOjCJmHogmdj6x9nY+seQ**qioEAA**AAMAAA**oL3SoB+ffTu8YFakdH2hf27T6YkJ/mSzI7Q3TATbWqBsXoeBHE/3/LYfqE/pJq3qO/yGc9r6zPr4ogihGlrQIlsxSd1QltS3gXim3GssnA1JcYyVXQLRHI2qP4HiQUKHgra4GxIbKLe2ENR6IQmGZWlg6etbpoDnYjFQvBu3WiOVZ+/UpTjGTexRvqzImoa1tnttF+7zDoyWmgHDaJYaI1U50QI/6MmYG/nKck0E2PaBoaO8nCHAoU2QIwMBf/0YyPfH1FKpBroZkUMApcZfDzFgo42yko/v2oCSl7tIXxrSWnTcltMc78+fYcU09JuLkPhIX4N3FBJ4Ouzuv7Rv+yy/9DidmELBe+LZ5IxIxDYBzjf6+iLOFsEAWMYbbddMdIIAGkl/CaCYQ+UvX85/RqFS0G999mCSEfg4wmeLJ82GZVcZfFW1KvLUL9rtKQsjBEQW7lVhKwzrQAUiXMJVWlSf/GncLbiKmRPvlfnoTpVX0GWe6yHBBRbD9xmmo7RHBnpLTIXqdNNRnu936LyJBIa/cnQhE2FwW5KuY7YKfvb9ioY8zhPxeFSke1MtYh4+KIw9OkJ09DeYmJWedBYEmFxqPbPHPyWGAbnZKqnzGho8+6aOOpf//MSFZzZpuxoFdhr/4bzMdKDB0KGliE+br4jbNeSniZ14wl7yRoa4RgNpaelxFWqBN9kRW45IoAoMg/N/Cmx0fLAAtQiGYnWEhMDCYWISBqTHzof8ohnFOYFbFoW/4DQmOW9h9Jhxki/0','7379979bf34d9f698b15c32330f2b2ad',2,'2018-04-12 05:12:36','1970-01-01 00:00:00','2018-02-24 09:21:29','2018-04-12 20:05:12'),(12,'dumaguetsupermarke-0','','AgAAAA**AQAAAA**aAAAAA**31qaWg**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6ADlYKgC5aGqAmdj6x9nY+seQ**qioEAA**AAMAAA**ji3x/Xy2wzjNy4ntjtGK8xQit1NPoTEh1ZNjyuxEvkwGpp4JmoKvXV2RlKyyrfnHPESjBBegh+4M9CmvwKr0XSy5tZ/jeIYL8z+lFor9+eXZzJ5l6FCZAYXbIEgQ1VuY0uHF7XLFPhODT5K3uMDKTInSos3Apy8a3fKTdeMihjo+haoMrvPugkqdfqu5Xxy01xa7zmw/4ct39BmvFj/n9gE3Uq24P5c7RIa9k9qbrg/Vj72ZqN7hWllT5AwTUnNTEf07raxaw0z2oi6amzXJjurMH7M6P1cy36mvRXV3EEz5QsEolNdhvO8PGu+oBItYQkOusKaefeU8FGaoyFcDXcRDPAqprhJm3zjaffrpIc6b3k61gCK/1C7ES2Sde5dImAjHPL79hU/sFtNqzgJ1R7Pab5S6daERbqNn5i5agtINxEoj4A314ZE2uwUoQDA5SSwyulJeY7+2AXlkOkZ11d5S1KR34xii2P9fKkCMAf7b4xUePq3nq5LAdBXjV++q9oczSNLy2e8rZ1iQUhYWUBaODNe9b90iZLIePM5MBEFzCOvTG6KIDJogicuNOOZbPs51l4LzR257/FG8Yk3E1vFYjNJNr1UgWWKirkASWLcgKdNDevhsf9tGbOQ6rKw3mxo00BksCy7/Cln1rGKadqjtApcfv0RPCt6wCfaPv5y/hNf5Unwt4kvXJHM1AZEpEGlW/oWh89vHvWwbbgrTaX0bhTNO/Lq+CeHBEAVT9JKzB3TB+6g+vFEhp4mAixXJ','qioEAA**eb2f563f1610aad98773c413ffff558d',2,'2018-03-06 15:29:40','2019-08-24 11:44:41','2018-03-01 20:07:18','2018-04-12 20:09:01'),(13,'case hub','',NULL,'qioEAA**fa4c94db1610a9e2b8773e37ffff3993',2,NULL,NULL,'2018-03-06 14:52:58','2018-05-03 13:11:33'),(14,'i-gadgets-usa',NULL,'AgAAAA**AQAAAA**aAAAAA**tkyeWg**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6AGlIOkAJWKpg6dj6x9nY+seQ**qioEAA**AAMAAA**Ik94FZdV8U/wFpZCHtBlw7paFrRJNeYCe61wXPz4VT1BHfb1lr5wEl9v8BjMLSUtNozI0mevIY5mO6g3cjVoSQpx7N8kb3zH2mLQ0Q4+cEIwy2vzFjpABCu82vXAvNj4S6ysegAUvZs//oX73VSG7OGVCyx3N/gZpTIGXICXeL1UuwpaUB+NTSkvZ1qTz5/TNHI7hpXjKvN26XxjFWHpJJoTNCG4X1IdEpIUpVMdp8of0bxROHh6uMgo9sVXNENaypRgj1ePsa/CTMacHQDaiz7F8PfjD4vomAGb8piyTxElpAjXJG08PFq61409bEjZFjVjggZx8+sQggewkUpGhh5iRcETzDgNx7wWF4Ipio8onsQqb11xEtRlRQNs3FHrSvgIHmlQy3piha57IkRnuJHPKaue3Y7G/gStnDsuts0dixxEcBIdwcY47oZuiJLgMPdIBExXWWMHc2LN+F5aMn/trBM56qQ+SRq6l5SfJJ6hSk6z+BGGyT6L8867AfgS99ZanGXH8Obr/jfsFe5q5RVbBLxXFX324XQYObi9iEC+U5xO7PEs11tBqIs+NSc+osAz8F81Nb+Kd3A7jEfZm90dKsfY3x6E3Ml3J8FocaGBG/ke3nDBLWPFkIf9rTm48ym5ti5Eb4W+7y1PD9Y/Jg4UEVKyft2YpxDGnZzMpgsQyNZchTucknhQjYZ18CMk/RQcnWEUhQK9RV4XMgaAlw0njwUhqlOGKXqqKlLagPm9xKMowpCWCO35NmbBarPc','qioEAA**fa5aced11610ad79a6b4eb14ffff2a47',1,'2018-05-12 04:22:20','2019-08-28 08:09:26','2018-03-06 15:08:30','2018-05-12 04:22:20'),(15,'i-bucks',NULL,'AgAAAA**AQAAAA**aAAAAA**t1WeWg**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6AGlIOpDJKDpg2dj6x9nY+seQ**qioEAA**AAMAAA**/gYGacWjH8E/V/yeDDeh+uBppN9aJM33qc9iB09hK/Xaqiia6JgjIV8qMV9viAlgZkEloQ9Z2uPyjmokcaZCvRqPcMfcaEjPQV4RYFEelnvuq2WOjvxOu9T7E7at9TPrwQu5C1SH2WM232g6pDubDh7WooNOOS9NX/6keUuZDb21hjRkPv5irrjGUdz2/4ACandoAfbZ5u5Hb7C6untQ17prVRRkDDQHqMbAoCtodM5Ml1A+QoQEmLGCzrYN1fqbocC2o9pqp+8D9nM3QnYJ+Hqa6e6Ga4iMPGGDwwyT+JdbaNamiAeFj/2NEaEaqh2dupDtqHSiqDEqQkVzjFrVK8rS28HayP0J5s+asY4ioJaHAgNsdvkEPKH4wg7arX8Oty2gfHUX88AYWMG1y8brKhhk2pMyQEbeYW1NwCUmD8Fbr0WxHqaBgd+QoqeDvHAzlz+HRV8vdGV3DD4qcoRuSYb8PX86/3rQBPtihDp3C6i920wBEh5Pq9kL+HBviBTQb4N5+C9/+2fR5pOuAeyNFbYE0/egy1n4YQEXO1VCPKSzX7/GNjMfMrP63b95xfjRxOU0M0nyn2ARd4zTLGyPIG9J2mSP8kOx573/GRma0OGsrzMWIYubWsSqS5IIZyOU20o73Z2BlogUpOJiHYxVGI0iEkXYs6DA+8jfpnV9UQzUlJ0P030Sd4Pq+jiMs+/qps9PZwHon4hDI2/Yj2KWCk77M2I9WrC9oYHfOxT+GMo9PUgvJQyOHkuhd0hUwX6U','qioEAA**fa7cb77d1610ab693657de37ffffd4a2',1,'2018-05-12 04:23:47','2019-08-28 08:47:51','2018-03-06 15:45:33','2018-05-12 04:23:47'),(16,'mastahed','',NULL,'qioEAA**04c7ebcb1630a994a9c5a365ffff27ea',2,NULL,NULL,'2018-04-27 09:46:44','2018-04-27 09:46:44'),(17,'test','',NULL,NULL,0,NULL,NULL,'2018-05-12 16:34:26','2018-05-12 16:34:26'),(18,'Sample account','',NULL,NULL,0,NULL,NULL,'2018-05-12 17:07:22','2018-05-12 17:07:22');
/*!40000 ALTER TABLE `tb_ebay_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_dispute_messages`
--

DROP TABLE IF EXISTS `tb_ebay_dispute_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_dispute_messages` (
  `ebay_resolution_id` int(10) unsigned NOT NULL,
  `message_id` int(11) DEFAULT NULL,
  `message_source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_created_at` datetime DEFAULT NULL,
  `message_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `ebay_dispute_messages_ebay_resolution_id_foreign` (`ebay_resolution_id`),
  CONSTRAINT `ebay_dispute_messages_ebay_resolution_id_foreign` FOREIGN KEY (`ebay_resolution_id`) REFERENCES `tb_ebay_resolution_center` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_dispute_messages`
--

LOCK TABLES `tb_ebay_dispute_messages` WRITE;
/*!40000 ALTER TABLE `tb_ebay_dispute_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_dispute_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_dispute_resolutions`
--

DROP TABLE IF EXISTS `tb_ebay_dispute_resolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_dispute_resolutions` (
  `ebay_resolution_id` int(10) unsigned NOT NULL,
  `dispute_resolution_record_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dispute_resolution_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolution_at` datetime DEFAULT NULL,
  KEY `ebay_dispute_resolutions_ebay_resolution_id_foreign` (`ebay_resolution_id`),
  CONSTRAINT `ebay_dispute_resolutions_ebay_resolution_id_foreign` FOREIGN KEY (`ebay_resolution_id`) REFERENCES `tb_ebay_resolution_center` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_dispute_resolutions`
--

LOCK TABLES `tb_ebay_dispute_resolutions` WRITE;
/*!40000 ALTER TABLE `tb_ebay_dispute_resolutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_dispute_resolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_feedback_details`
--

DROP TABLE IF EXISTS `tb_ebay_feedback_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_feedback_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ebay_account_id` int(10) unsigned NOT NULL,
  `commenting_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feedback_rating_star` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `commenting_user_score` int(11) NOT NULL,
  `comment_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_time` datetime NOT NULL,
  `comment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feedback_response` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `followup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `item_price` decimal(9,2) NOT NULL DEFAULT 0.00,
  `item_currency_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `comment_replaced` tinyint(1) DEFAULT 0,
  `response_replaced` tinyint(1) DEFAULT 0,
  `followup_replaced` tinyint(1) DEFAULT 0,
  `countable` tinyint(1) DEFAULT 0,
  `feedback_revised` tinyint(1) DEFAULT 0,
  `order_line_item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ebay_feedback_details_user_foreign` (`user`),
  KEY `ebay_feedback_details_ebay_account_id_foreign` (`ebay_account_id`),
  CONSTRAINT `ebay_feedback_details_ebay_account_id_foreign` FOREIGN KEY (`ebay_account_id`) REFERENCES `tb_ebay_accounts` (`id`),
  CONSTRAINT `ebay_feedback_details_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_feedback_details`
--

LOCK TABLES `tb_ebay_feedback_details` WRITE;
/*!40000 ALTER TABLE `tb_ebay_feedback_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_feedback_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_feedback_summary`
--

DROP TABLE IF EXISTS `tb_ebay_feedback_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_feedback_summary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ebay_account_id` int(10) unsigned NOT NULL,
  `FeedbackScore` int(11) NOT NULL,
  `BR_7` int(11) NOT NULL,
  `BR_30` int(11) NOT NULL,
  `BR_180` int(11) NOT NULL,
  `NEG_0` int(11) NOT NULL,
  `NEG_30` int(11) NOT NULL,
  `NEG_180` int(11) NOT NULL,
  `NEG_365` int(11) NOT NULL,
  `NEU_0` int(11) NOT NULL,
  `NEU_30` int(11) NOT NULL,
  `NEU_180` int(11) NOT NULL,
  `NEU_365` int(11) NOT NULL,
  `POS_0` int(11) NOT NULL,
  `POS_30` int(11) NOT NULL,
  `POS_180` int(11) NOT NULL,
  `POS_365` int(11) NOT NULL,
  `TF_30` int(11) NOT NULL,
  `TF_180` int(11) NOT NULL,
  `TF_365` int(11) NOT NULL,
  `NeutralCommentCountFromSuspendedUsers` int(11) NOT NULL,
  `UniqueNegativeFeedbackCount` int(11) NOT NULL,
  `UniquePositiveFeedbackCount` int(11) NOT NULL,
  `UniqueNeutralFeedbackCount` int(11) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ebay_feedback_summary_ebay_account_id_foreign` (`ebay_account_id`),
  KEY `ebay_feedback_summary_user_foreign` (`user`),
  CONSTRAINT `ebay_feedback_summary_ebay_account_id_foreign` FOREIGN KEY (`ebay_account_id`) REFERENCES `tb_ebay_accounts` (`id`),
  CONSTRAINT `ebay_feedback_summary_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_feedback_summary`
--

LOCK TABLES `tb_ebay_feedback_summary` WRITE;
/*!40000 ALTER TABLE `tb_ebay_feedback_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_feedback_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_message_contents`
--

DROP TABLE IF EXISTS `tb_ebay_message_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_message_contents` (
  `ebay_message_id` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `ebay_message_contents_ebay_message_id_foreign` (`ebay_message_id`),
  CONSTRAINT `ebay_message_contents_ebay_message_id_foreign` FOREIGN KEY (`ebay_message_id`) REFERENCES `tb_ebay_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_message_contents`
--

LOCK TABLES `tb_ebay_message_contents` WRITE;
/*!40000 ALTER TABLE `tb_ebay_message_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_message_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_messages`
--

DROP TABLE IF EXISTS `tb_ebay_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ebay_account_id` int(10) unsigned NOT NULL,
  `send_to_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_message_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `flagged` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `replied` tinyint(1) DEFAULT NULL,
  `item_end_time` datetime DEFAULT NULL,
  `item_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` int(10) unsigned NOT NULL,
  `message_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ebay_messages_user_foreign` (`user`),
  KEY `ebay_messages_ebay_account_id_foreign` (`ebay_account_id`),
  CONSTRAINT `ebay_messages_ebay_account_id_foreign` FOREIGN KEY (`ebay_account_id`) REFERENCES `tb_ebay_accounts` (`id`),
  CONSTRAINT `ebay_messages_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_messages`
--

LOCK TABLES `tb_ebay_messages` WRITE;
/*!40000 ALTER TABLE `tb_ebay_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_order_checkout_statuses`
--

DROP TABLE IF EXISTS `tb_ebay_order_checkout_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_order_checkout_statuses` (
  `ebay_order_id` int(10) unsigned NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified_at` datetime NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_instrument` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `ebay_order_checkout_statuses_ebay_order_id_foreign` (`ebay_order_id`),
  CONSTRAINT `ebay_order_checkout_statuses_ebay_order_id_foreign` FOREIGN KEY (`ebay_order_id`) REFERENCES `tb_ebay_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_order_checkout_statuses`
--

LOCK TABLES `tb_ebay_order_checkout_statuses` WRITE;
/*!40000 ALTER TABLE `tb_ebay_order_checkout_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_order_checkout_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_order_external_transactions`
--

DROP TABLE IF EXISTS `tb_ebay_order_external_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_order_external_transactions` (
  `ebay_order_id` int(10) unsigned NOT NULL,
  `external_transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_transaction_time` datetime DEFAULT NULL,
  `fee_or_credit_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_or_refund_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_transaction_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  KEY `ebay_order_external_transactions_ebay_order_id_foreign` (`ebay_order_id`),
  CONSTRAINT `ebay_order_external_transactions_ebay_order_id_foreign` FOREIGN KEY (`ebay_order_id`) REFERENCES `tb_ebay_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_order_external_transactions`
--

LOCK TABLES `tb_ebay_order_external_transactions` WRITE;
/*!40000 ALTER TABLE `tb_ebay_order_external_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_order_external_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_order_payment_methods`
--

DROP TABLE IF EXISTS `tb_ebay_order_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_order_payment_methods` (
  `ebay_order_id` int(10) unsigned NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `ebay_order_payment_methods_ebay_order_id_foreign` (`ebay_order_id`),
  CONSTRAINT `ebay_order_payment_methods_ebay_order_id_foreign` FOREIGN KEY (`ebay_order_id`) REFERENCES `tb_ebay_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_order_payment_methods`
--

LOCK TABLES `tb_ebay_order_payment_methods` WRITE;
/*!40000 ALTER TABLE `tb_ebay_order_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_order_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_order_shipment_tracking_details`
--

DROP TABLE IF EXISTS `tb_ebay_order_shipment_tracking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_order_shipment_tracking_details` (
  `ebay_order_id` int(10) unsigned NOT NULL,
  `shipping_carrier_used` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipment_tracking_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `country_of_origin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  KEY `ebay_order_shipment_tracking_details_ebay_order_id_foreign` (`ebay_order_id`),
  CONSTRAINT `ebay_order_shipment_tracking_details_ebay_order_id_foreign` FOREIGN KEY (`ebay_order_id`) REFERENCES `tb_ebay_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_order_shipment_tracking_details`
--

LOCK TABLES `tb_ebay_order_shipment_tracking_details` WRITE;
/*!40000 ALTER TABLE `tb_ebay_order_shipment_tracking_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_order_shipment_tracking_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_order_shipping_addresses`
--

DROP TABLE IF EXISTS `tb_ebay_order_shipping_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_order_shipping_addresses` (
  `ebay_order_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_or_province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_owner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_address_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `ebay_order_shipping_addresses_ebay_order_id_foreign` (`ebay_order_id`),
  CONSTRAINT `ebay_order_shipping_addresses_ebay_order_id_foreign` FOREIGN KEY (`ebay_order_id`) REFERENCES `tb_ebay_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_order_shipping_addresses`
--

LOCK TABLES `tb_ebay_order_shipping_addresses` WRITE;
/*!40000 ALTER TABLE `tb_ebay_order_shipping_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_order_shipping_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_order_shipping_package_info`
--

DROP TABLE IF EXISTS `tb_ebay_order_shipping_package_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_order_shipping_package_info` (
  `ebay_order_id` int(10) unsigned NOT NULL,
  `shipping_tracking_event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_min_delivery_time` datetime DEFAULT NULL,
  `scheduled_max_delivery_time` datetime DEFAULT NULL,
  `est_min_delivery_time` datetime DEFAULT NULL,
  `est_max_delivery_time` datetime DEFAULT NULL,
  `actual_delivery_time` datetime DEFAULT NULL,
  `handle_by_time` datetime DEFAULT NULL,
  `est_min_delivery_time_native` datetime DEFAULT NULL,
  `est_max_delivery_time_native` datetime DEFAULT NULL,
  KEY `ebay_order_shipping_package_info_ebay_order_id_foreign` (`ebay_order_id`),
  CONSTRAINT `ebay_order_shipping_package_info_ebay_order_id_foreign` FOREIGN KEY (`ebay_order_id`) REFERENCES `tb_ebay_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_order_shipping_package_info`
--

LOCK TABLES `tb_ebay_order_shipping_package_info` WRITE;
/*!40000 ALTER TABLE `tb_ebay_order_shipping_package_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_order_shipping_package_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_order_shipping_services`
--

DROP TABLE IF EXISTS `tb_ebay_order_shipping_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_order_shipping_services` (
  `ebay_order_id` int(10) unsigned NOT NULL,
  `shipping_service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_service_cost_currency_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_service_cost` decimal(9,2) NOT NULL,
  KEY `ebay_order_shipping_services_ebay_order_id_foreign` (`ebay_order_id`),
  CONSTRAINT `ebay_order_shipping_services_ebay_order_id_foreign` FOREIGN KEY (`ebay_order_id`) REFERENCES `tb_ebay_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_order_shipping_services`
--

LOCK TABLES `tb_ebay_order_shipping_services` WRITE;
/*!40000 ALTER TABLE `tb_ebay_order_shipping_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_order_shipping_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_order_transactions`
--

DROP TABLE IF EXISTS `tb_ebay_order_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_order_transactions` (
  `ebay_order_id` int(10) unsigned NOT NULL,
  `buyer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_VATTax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_site` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_condition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `compatibility_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compatibility_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity_purchased` int(11) NOT NULL,
  `payment_hold_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inquiry_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_price_currency_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_price` decimal(9,2) NOT NULL,
  `final_value_fee_currency_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_value_fee` decimal(9,2) NOT NULL,
  `order_line_item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extended_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ebay_plus_transaction` tinyint(1) NOT NULL,
  `guaranteed_shipping` tinyint(1) NOT NULL,
  `guaranteed_delivery` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  KEY `ebay_order_transactions_ebay_order_id_foreign` (`ebay_order_id`),
  CONSTRAINT `ebay_order_transactions_ebay_order_id_foreign` FOREIGN KEY (`ebay_order_id`) REFERENCES `tb_ebay_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_order_transactions`
--

LOCK TABLES `tb_ebay_order_transactions` WRITE;
/*!40000 ALTER TABLE `tb_ebay_order_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_order_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_orders`
--

DROP TABLE IF EXISTS `tb_ebay_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ebay_account` int(10) unsigned NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adjustment_amount_currency_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adjustment_amount` decimal(9,2) NOT NULL,
  `amount_paid_currency_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_paid` decimal(9,2) NOT NULL,
  `amount_saved_currency_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_saved` decimal(9,2) NOT NULL,
  `subtotal_currency_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(9,2) NOT NULL,
  `total_currency_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(9,2) NOT NULL,
  `buyer_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_at` datetime DEFAULT NULL,
  `integrated_merchant_credit_card_enabled` tinyint(1) NOT NULL,
  `EIAS_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_hold_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_multi_leg_shipping` tinyint(1) NOT NULL,
  `seller_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_EIAS_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancel_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extended_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contains_ebay_plus_transaction` tinyint(1) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ebay_orders_ebay_account_foreign` (`ebay_account`),
  KEY `ebay_orders_user_foreign` (`user`),
  CONSTRAINT `ebay_orders_ebay_account_foreign` FOREIGN KEY (`ebay_account`) REFERENCES `tb_ebay_accounts` (`id`),
  CONSTRAINT `ebay_orders_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_orders`
--

LOCK TABLES `tb_ebay_orders` WRITE;
/*!40000 ALTER TABLE `tb_ebay_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ebay_resolution_center`
--

DROP TABLE IF EXISTS `tb_ebay_resolution_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ebay_resolution_center` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ebay_account` int(10) unsigned NOT NULL,
  `dispute_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_record_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_party_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_party_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_quantity` smallint(6) NOT NULL,
  `item_site` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_condition_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_condition_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_explanation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_credit_eligibility` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_created_at` datetime NOT NULL,
  `dispute_modified_at` datetime NOT NULL,
  `order_line_item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ebay_resolution_center_user_foreign` (`user`),
  CONSTRAINT `ebay_resolution_center_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ebay_resolution_center`
--

LOCK TABLES `tb_ebay_resolution_center` WRITE;
/*!40000 ALTER TABLE `tb_ebay_resolution_center` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ebay_resolution_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_address`
--

DROP TABLE IF EXISTS `tb_employee_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_address` (
  `subscription` int(10) unsigned NOT NULL,
  `store` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `address_type` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`employee`,`address_type`,`subscription`,`store`),
  KEY `employee_address_type_address_type_foreign` (`address_type`),
  KEY `employee_address_subscription_foreign` (`subscription`),
  KEY `employee_address_store_foreign` (`store`),
  KEY `employee_address_user_foreign` (`user`),
  CONSTRAINT `employee_address_address_type_foreign` FOREIGN KEY (`address_type`) REFERENCES `tb_address_type_fields` (`id`),
  CONSTRAINT `employee_address_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `employee_address_store_foreign` FOREIGN KEY (`store`) REFERENCES `tb_stores` (`id`),
  CONSTRAINT `employee_address_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `employee_address_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_address`
--

LOCK TABLES `tb_employee_address` WRITE;
/*!40000 ALTER TABLE `tb_employee_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_benefits`
--

DROP TABLE IF EXISTS `tb_employee_benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_benefits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `misc_benefit` int(10) unsigned NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `frequency` int(10) unsigned NOT NULL,
  `entry_type` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employee_benefits_misc_benefit_foreign` (`misc_benefit`),
  KEY `employee_benefits_user_foreign` (`user`),
  KEY `employee_benefits_employee_foreign` (`employee`),
  KEY `employee_benefits_entry_type_foreign` (`entry_type`),
  KEY `employee_benefits_frequency_foreign` (`frequency`),
  KEY `employee_benefits_status_foreign` (`status`),
  KEY `employee_benefits_subscription_foreign` (`subscription`),
  CONSTRAINT `employee_benefits_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_benefits_entry_type_foreign` FOREIGN KEY (`entry_type`) REFERENCES `tb_glentry_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_benefits_frequency_foreign` FOREIGN KEY (`frequency`) REFERENCES `tb_benefit_frequencies` (`id`),
  CONSTRAINT `employee_benefits_misc_benefit_foreign` FOREIGN KEY (`misc_benefit`) REFERENCES `tb_misc_benefits` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_benefits_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `employee_benefits_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `employee_benefits_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_benefits`
--

LOCK TABLES `tb_employee_benefits` WRITE;
/*!40000 ALTER TABLE `tb_employee_benefits` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_benefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_contacts`
--

DROP TABLE IF EXISTS `tb_employee_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_contacts` (
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relationship` int(10) unsigned NOT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subscription`,`employee`,`relationship`),
  KEY `employee_contacts_employee_foreign` (`employee`),
  KEY `employee_contacts_relationship_foreign` (`relationship`),
  KEY `employee_contacts_user_foreign` (`user`),
  CONSTRAINT `employee_contacts_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_contacts_relationship_foreign` FOREIGN KEY (`relationship`) REFERENCES `tb_relationships` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_contacts_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_contacts_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_contacts`
--

LOCK TABLES `tb_employee_contacts` WRITE;
/*!40000 ALTER TABLE `tb_employee_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_deductions`
--

DROP TABLE IF EXISTS `tb_employee_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_deductions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `deduction_type` int(10) unsigned NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `balance` decimal(9,2) NOT NULL,
  `deduction_amount` decimal(9,2) NOT NULL,
  `frequency` int(10) unsigned NOT NULL,
  `approved_at` datetime NOT NULL,
  `first_payment_at` datetime NOT NULL,
  `last_payment_at` datetime NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employee_deductions_subscription_foreign` (`subscription`),
  KEY `employee_deductions_employee_foreign` (`employee`),
  KEY `employee_deductions_deduction_type_foreign` (`deduction_type`),
  KEY `employee_deductions_frequency_foreign` (`frequency`),
  KEY `employee_deductions_user_foreign` (`user`),
  KEY `employee_deductions_status_foreign` (`status`),
  CONSTRAINT `employee_deductions_deduction_type_foreign` FOREIGN KEY (`deduction_type`) REFERENCES `tb_deduction_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_deductions_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_deductions_frequency_foreign` FOREIGN KEY (`frequency`) REFERENCES `tb_benefit_frequencies` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_deductions_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_deductions_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_deductions_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_deductions`
--

LOCK TABLES `tb_employee_deductions` WRITE;
/*!40000 ALTER TABLE `tb_employee_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_dependents`
--

DROP TABLE IF EXISTS `tb_employee_dependents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_dependents` (
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `priority` smallint(6) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relationship` int(10) unsigned NOT NULL,
  `birthdate` date NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`subscription`,`employee`,`priority`,`relationship`),
  KEY `employee_dependents_employee_foreign` (`employee`),
  KEY `employee_dependents_relationship_foreign` (`relationship`),
  KEY `employee_dependents_user_foreign` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_dependents`
--

LOCK TABLES `tb_employee_dependents` WRITE;
/*!40000 ALTER TABLE `tb_employee_dependents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_dependents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_disciplinary_actions`
--

DROP TABLE IF EXISTS `tb_employee_disciplinary_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_disciplinary_actions` (
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `policy` int(10) unsigned NOT NULL,
  `submitted_at` date NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `offenses` smallint(6) NOT NULL,
  `penalty` int(10) unsigned NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `noofdays` smallint(6) NOT NULL,
  `remarks` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`subscription`,`employee`,`policy`,`submitted_at`),
  KEY `employee_disciplinary_actions_employee_foreign` (`employee`),
  KEY `employee_disciplinary_actions_policy_foreign` (`policy`),
  KEY `employee_disciplinary_actions_user_foreign` (`user`),
  KEY `employee_disciplinary_actions_penalty_foreign` (`penalty`),
  CONSTRAINT `employee_disciplinary_actions_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `employee_disciplinary_actions_penalty_foreign` FOREIGN KEY (`penalty`) REFERENCES `tb_penalty_types` (`id`),
  CONSTRAINT `employee_disciplinary_actions_policy_foreign` FOREIGN KEY (`policy`) REFERENCES `tb_policies` (`id`),
  CONSTRAINT `employee_disciplinary_actions_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `employee_disciplinary_actions_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_disciplinary_actions`
--

LOCK TABLES `tb_employee_disciplinary_actions` WRITE;
/*!40000 ALTER TABLE `tb_employee_disciplinary_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_disciplinary_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_levels`
--

DROP TABLE IF EXISTS `tb_employee_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_levels`
--

LOCK TABLES `tb_employee_levels` WRITE;
/*!40000 ALTER TABLE `tb_employee_levels` DISABLE KEYS */;
INSERT INTO `tb_employee_levels` VALUES (1,1,'General Manager',1,2,'2017-04-28 20:19:05','2017-04-28 20:19:05'),(2,1,'Officer-In-Charge (OIC)',1,2,'2017-04-28 20:19:16','2017-04-28 20:19:16'),(3,1,'Supervisor',1,2,'2017-04-28 20:19:24','2017-04-28 20:19:24'),(4,1,'Staff',1,2,'2017-04-28 20:19:37','2017-04-28 20:19:37');
/*!40000 ALTER TABLE `tb_employee_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_medical_history`
--

DROP TABLE IF EXISTS `tb_employee_medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_medical_history` (
  `subscription` int(10) unsigned NOT NULL,
  `client` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `medical_type` int(10) unsigned NOT NULL,
  `submitted_at` date NOT NULL,
  `expiry_at` date NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`subscription`,`client`,`employee`,`medical_type`),
  KEY `employee_medical_history_client_foreign` (`client`),
  KEY `employee_medical_history_employee_foreign` (`employee`),
  KEY `employee_medical_history_medical_type_foreign` (`medical_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_medical_history`
--

LOCK TABLES `tb_employee_medical_history` WRITE;
/*!40000 ALTER TABLE `tb_employee_medical_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_medical_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_position`
--

DROP TABLE IF EXISTS `tb_employee_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_position` (
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`subscription`,`employee`,`position`,`status`),
  KEY `employee_position_employee_foreign` (`employee`),
  KEY `employee_position_position_foreign` (`position`),
  KEY `employee_position_status_foreign` (`status`),
  KEY `employee_position_user_foreign` (`user`),
  CONSTRAINT `employee_position_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `employee_position_position_foreign` FOREIGN KEY (`position`) REFERENCES `tb_employee_positions` (`id`),
  CONSTRAINT `employee_position_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `employee_position_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `employee_position_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_position`
--

LOCK TABLES `tb_employee_position` WRITE;
/*!40000 ALTER TABLE `tb_employee_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_positions`
--

DROP TABLE IF EXISTS `tb_employee_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_positions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_positions`
--

LOCK TABLES `tb_employee_positions` WRITE;
/*!40000 ALTER TABLE `tb_employee_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_registration_codes`
--

DROP TABLE IF EXISTS `tb_employee_registration_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_registration_codes` (
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `code` int(10) unsigned NOT NULL,
  `used` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subscription`,`employee`,`code`,`used`),
  KEY `employee_registration_codes_employee_foreign` (`employee`),
  CONSTRAINT `employee_registration_codes_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `employee_registration_codes_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_registration_codes`
--

LOCK TABLES `tb_employee_registration_codes` WRITE;
/*!40000 ALTER TABLE `tb_employee_registration_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_registration_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_salary_rates`
--

DROP TABLE IF EXISTS `tb_employee_salary_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_salary_rates` (
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `salarygrade` int(10) unsigned NOT NULL,
  `manual_rate` decimal(9,2) NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT 0,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`subscription`,`employee`,`salarygrade`,`status`,`created_at`),
  KEY `employee_salary_rates_employee_foreign` (`employee`),
  KEY `employee_salary_rates_user_foreign` (`user`),
  KEY `employee_salary_rates_status_foreign` (`status`),
  CONSTRAINT `employee_salary_rates_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `employee_salary_rates_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `employee_salary_rates_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_salary_rates`
--

LOCK TABLES `tb_employee_salary_rates` WRITE;
/*!40000 ALTER TABLE `tb_employee_salary_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_salary_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_schedules`
--

DROP TABLE IF EXISTS `tb_employee_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_schedules` (
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `schedule` int(10) unsigned NOT NULL,
  `s_date` date NOT NULL,
  `auto_overtime` tinyint(4) NOT NULL,
  `is_rest_day` tinyint(4) NOT NULL,
  KEY `employee_schedules_subscription_foreign` (`subscription`),
  KEY `employee_schedules_employee_foreign` (`employee`),
  KEY `employee_schedules_schedule_foreign` (`schedule`),
  CONSTRAINT `employee_schedules_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `employee_schedules_schedule_foreign` FOREIGN KEY (`schedule`) REFERENCES `tb_schedule_templates` (`id`),
  CONSTRAINT `employee_schedules_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_schedules`
--

LOCK TABLES `tb_employee_schedules` WRITE;
/*!40000 ALTER TABLE `tb_employee_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_shifts`
--

DROP TABLE IF EXISTS `tb_employee_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_shifts` (
  `subscription` int(10) unsigned NOT NULL DEFAULT 0,
  `employee` int(10) unsigned NOT NULL DEFAULT 0,
  `dtr_activity_type` int(10) unsigned NOT NULL,
  `auto_overtime` tinyint(4) NOT NULL,
  `is_rest_day` tinyint(4) NOT NULL,
  `s_date` date NOT NULL DEFAULT '0000-00-00',
  `s_time` time NOT NULL,
  PRIMARY KEY (`subscription`,`employee`,`dtr_activity_type`,`s_date`,`s_time`),
  KEY `employee_shifts_employee_foreign` (`employee`),
  KEY `employee_shifts_dtr_activity_type_foreign` (`dtr_activity_type`),
  CONSTRAINT `employee_shifts_dtr_activity_type_foreign` FOREIGN KEY (`dtr_activity_type`) REFERENCES `tb_dtr_activity_types` (`id`),
  CONSTRAINT `employee_shifts_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `employee_shifts_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_shifts`
--

LOCK TABLES `tb_employee_shifts` WRITE;
/*!40000 ALTER TABLE `tb_employee_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_statuses`
--

DROP TABLE IF EXISTS `tb_employee_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_statuses`
--

LOCK TABLES `tb_employee_statuses` WRITE;
/*!40000 ALTER TABLE `tb_employee_statuses` DISABLE KEYS */;
INSERT INTO `tb_employee_statuses` VALUES (1,1,'Abandonment','label label-danger',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(2,1,'Apprentice','label label-warning',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(3,1,'Contractual','label label-primary',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(4,1,'Inactive','label label-default',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(5,1,'Maternity Leave','label label-default',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(6,1,'Probationary','label label-warning',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(7,1,'Project Based','label label-primary',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(8,1,'Regular','label label-success',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(9,1,'Rehired','label label-warning',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(10,1,'Reliever','label label-info',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(11,1,'Resigned','label label-danger',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(12,1,'Summer Job','label label-default',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(13,1,'Temporary Employee','label label-warning',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(14,1,'Terminated','label label-danger',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(15,2,'Abandonment','label label-danger',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(16,2,'Apprentice','label label-warning',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(17,2,'Contractual','label label-primary',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(18,2,'Inactive','label label-default',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(19,2,'Maternity Leave','label label-default',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(20,2,'Probationary','label label-warning',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(21,2,'Project Based','label label-primary',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(22,2,'Regular','label label-success',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(23,2,'Rehired','label label-warning',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(24,2,'Reliever','label label-info',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(25,2,'Resigned','label label-danger',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(26,2,'Summer Job','label label-default',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(27,2,'Temporary Employee','label label-warning',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45'),(28,2,'Terminated','label label-danger',1,1,'2016-03-03 19:46:45','2016-03-03 19:46:45');
/*!40000 ALTER TABLE `tb_employee_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_trainings`
--

DROP TABLE IF EXISTS `tb_employee_trainings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_trainings` (
  `employee` int(10) unsigned NOT NULL,
  `training` int(10) unsigned NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`employee`,`training`),
  KEY `employee_trainings_training_foreign` (`training`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_trainings`
--

LOCK TABLES `tb_employee_trainings` WRITE;
/*!40000 ALTER TABLE `tb_employee_trainings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_trainings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_user`
--

DROP TABLE IF EXISTS `tb_employee_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_user` (
  `subscription` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subscription`,`employee_id`,`user_id`),
  KEY `employee_user_user_id_foreign` (`user_id`),
  KEY `employee_user_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_user_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `employee_user_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `employee_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_user`
--

LOCK TABLES `tb_employee_user` WRITE;
/*!40000 ALTER TABLE `tb_employee_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employee_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employees`
--

DROP TABLE IF EXISTS `tb_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `client` int(10) unsigned NOT NULL,
  `store` int(10) unsigned NOT NULL,
  `old_employee_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `suffix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `gender` int(10) unsigned NOT NULL,
  `hireddate` date NOT NULL,
  `separateddate` date NOT NULL,
  `postgraduate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `college` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vocational` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secondary` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elementary` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `skills` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dtr_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taxidnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sssnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `philhealthnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pagibignumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `atmbankcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `atmnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payfrequency` int(11) NOT NULL,
  `witholdingtax` int(11) NOT NULL,
  `ssspremium` int(11) NOT NULL,
  `philhealth` int(11) NOT NULL,
  `hdmf` int(11) NOT NULL,
  `spousename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dependents` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spouse_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` int(11) NOT NULL,
  `employeelevel` int(11) NOT NULL,
  `vlcredits` int(11) NOT NULL,
  `slcredits` int(11) NOT NULL,
  `time_setting` int(10) unsigned DEFAULT NULL,
  `schedule_template` int(10) unsigned DEFAULT NULL,
  `no_work_no_pay` tinyint(4) DEFAULT NULL,
  `paid_break` tinyint(4) DEFAULT NULL,
  `auto_clock_in` tinyint(4) DEFAULT NULL,
  `auto_clock_out` tinyint(4) DEFAULT NULL,
  `auto_overtime` tinyint(4) DEFAULT NULL,
  `height` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `marital_status` int(11) NOT NULL,
  `citizenship` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `religion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bloodtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remarks` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `areacode` smallint(6) NOT NULL,
  `zipcode` smallint(6) NOT NULL,
  `contactnum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobilenumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `payment_mode` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`subscription`,`client`,`store`),
  KEY `employees_subscription_foreign` (`subscription`),
  KEY `employees_status_foreign` (`status`),
  KEY `employees_schedule_template_foreign` (`schedule_template`),
  KEY `employees_payment_mode_foreign` (`payment_mode`),
  CONSTRAINT `employees_payment_mode_foreign` FOREIGN KEY (`payment_mode`) REFERENCES `tb_payment_mode` (`id`),
  CONSTRAINT `employees_schedule_template_foreign` FOREIGN KEY (`schedule_template`) REFERENCES `tb_schedule_templates` (`id`),
  CONSTRAINT `employees_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_employee_statuses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employees_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employees`
--

LOCK TABLES `tb_employees` WRITE;
/*!40000 ALTER TABLE `tb_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_entry_types`
--

DROP TABLE IF EXISTS `tb_entry_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_entry_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortdesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transactionmodule` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_entry_types`
--

LOCK TABLES `tb_entry_types` WRITE;
/*!40000 ALTER TABLE `tb_entry_types` DISABLE KEYS */;
INSERT INTO `tb_entry_types` VALUES (1,'General Journal','GJ',0),(2,'Payment Receipt','PR',0),(3,'Withdrawal','WD',3),(4,'Disbursement','DB',3),(5,'Cash Transfer From / To','CTFT',3),(6,'Delivery Receipt','DR',11),(7,'Reverse Delivery Entry','RDE',11),(8,'Cancel Delivery Entry','CDE',11),(9,'POS Receipt','POS',3),(10,'POS Reverse','POSRV',3),(11,'Stock Transfer To','STT',11),(12,'Stock Transfer From','STF',11);
/*!40000 ALTER TABLE `tb_entry_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_events`
--

DROP TABLE IF EXISTS `tb_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_user_foreign` (`user`),
  CONSTRAINT `events_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_events`
--

LOCK TABLES `tb_events` WRITE;
/*!40000 ALTER TABLE `tb_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_failed_jobs`
--

DROP TABLE IF EXISTS `tb_failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_failed_jobs`
--

LOCK TABLES `tb_failed_jobs` WRITE;
/*!40000 ALTER TABLE `tb_failed_jobs` DISABLE KEYS */;
INSERT INTO `tb_failed_jobs` VALUES (11,'database','default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayOrdersJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayOrdersJob\",\"command\":\"O:27:\\\"App\\\\Jobs\\\\StoreEbayOrdersJob\\\":14:{s:40:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:34:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000order\\\";N;s:40:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000ebay_config\\\";N;s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000trading_service\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:13;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}','Illuminate\\Queue\\MaxAttemptsExceededException: App\\Jobs\\StoreEbayOrdersJob has been attempted too many times or run too long. The job may have previously timed out. in /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:396\nStack trace:\n#0 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(316): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#1 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(272): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#2 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(229): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#3 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#4 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#5 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#6 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#7 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#9 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/Container.php(564): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#10 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#11 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#12 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#13 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Application.php(865): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#14 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Application.php(241): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#15 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Application.php(143): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Console/Application.php(89): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /Users/mastahed/Projects/ebay-crm/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 {main}','2018-05-21 13:08:48'),(12,'database','default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\",\"command\":\"O:37:\\\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\\":15:{s:50:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:54:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000trading_service\\\";N;s:50:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000ebay_config\\\";N;s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000order\\\";N;s:56:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000resolution_center\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:16;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}','Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to undefined method App\\Jobs\\StoreEbayResolutionCenterJob::getDisputeDetails() in /Users/mastahed/Projects/ebay-crm/app/Jobs/StoreEbayResolutionCenterJob.php:135\nStack trace:\n#0 /Users/mastahed/Projects/ebay-crm/app/Jobs/StoreEbayResolutionCenterJob.php(78): App\\Jobs\\StoreEbayResolutionCenterJob->store(Object(App\\EbayAccount), Object(DTS\\eBaySDK\\Trading\\Types\\DisputeArrayType))\n#1 [internal function]: App\\Jobs\\StoreEbayResolutionCenterJob->handle()\n#2 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#3 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/Container.php(564): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#7 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\StoreEbayResolutionCenterJob))\n#8 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(104): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\StoreEbayResolutionCenterJob))\n#9 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(49): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\StoreEbayResolutionCenterJob), false)\n#11 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(83): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#12 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(322): Illuminate\\Queue\\Jobs\\Job->fire()\n#13 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(272): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#14 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(229): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#15 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#16 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#17 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#18 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#19 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#20 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#21 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/Container.php(564): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#22 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#23 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#24 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#25 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Application.php(865): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#26 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Application.php(241): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#27 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Application.php(143): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Console/Application.php(89): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /Users/mastahed/Projects/ebay-crm/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 {main}','2018-05-21 13:09:22'),(13,'database','default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\",\"command\":\"O:37:\\\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\\":15:{s:50:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:54:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000trading_service\\\";N;s:50:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000ebay_config\\\";N;s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000order\\\";N;s:56:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000resolution_center\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:8;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}','Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to undefined method App\\Jobs\\StoreEbayResolutionCenterJob::getDisputeDetails() in /Users/mastahed/Projects/ebay-crm/app/Jobs/StoreEbayResolutionCenterJob.php:135\nStack trace:\n#0 /Users/mastahed/Projects/ebay-crm/app/Jobs/StoreEbayResolutionCenterJob.php(78): App\\Jobs\\StoreEbayResolutionCenterJob->store(Object(App\\EbayAccount), Object(DTS\\eBaySDK\\Trading\\Types\\DisputeArrayType))\n#1 [internal function]: App\\Jobs\\StoreEbayResolutionCenterJob->handle()\n#2 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#3 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/Container.php(564): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#7 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\StoreEbayResolutionCenterJob))\n#8 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(104): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\StoreEbayResolutionCenterJob))\n#9 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(49): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\StoreEbayResolutionCenterJob), false)\n#11 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(83): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#12 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(322): Illuminate\\Queue\\Jobs\\Job->fire()\n#13 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(272): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#14 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(229): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#15 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#16 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#17 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#18 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#19 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#20 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#21 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Container/Container.php(564): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#22 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#23 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#24 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#25 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Application.php(865): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#26 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Application.php(241): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#27 /Users/mastahed/Projects/ebay-crm/vendor/symfony/console/Application.php(143): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Console/Application.php(89): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /Users/mastahed/Projects/ebay-crm/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /Users/mastahed/Projects/ebay-crm/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 {main}','2018-05-21 13:09:25');
/*!40000 ALTER TABLE `tb_failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_files`
--

DROP TABLE IF EXISTS `tb_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_files`
--

LOCK TABLES `tb_files` WRITE;
/*!40000 ALTER TABLE `tb_files` DISABLE KEYS */;
INSERT INTO `tb_files` VALUES (1,'logo2.png',4714,'2018-03-31 16:01:54','2018-03-31 16:01:54'),(2,'logo2.png',4714,'2018-03-31 16:02:45','2018-03-31 16:02:45'),(3,'logo1.png',1113,'2018-03-31 16:05:27','2018-03-31 16:05:27'),(4,'2go.png',4101,'2018-04-24 23:11:15','2018-04-24 23:11:15'),(5,'2go.png',4101,'2018-04-24 23:41:48','2018-04-24 23:41:48'),(6,'1rose.jpg',193709,'2018-04-24 23:45:42','2018-04-24 23:45:42'),(7,'Screen Shot 2018-05-13 at 1.53.34 PM.png',121836,'2018-05-12 07:09:24','2018-05-12 07:09:24'),(8,'Screen Shot 2018-05-14 at 11.21.28 AM.png',151498,'2018-05-12 07:24:06','2018-05-12 07:24:06'),(9,'https://i.ebayimg.com/00/s/MTAwMFgxMDAw/z/k24AAOSwgd1auw58/$_12.JPG?set_id=880000500F',0,'2018-05-12 17:07:22','2018-05-12 17:07:22'),(10,'Screen Shot 2018-05-13 at 1.53.34 PM.png',121836,'2018-05-12 17:48:38','2018-05-12 17:48:38'),(11,'https://i.ebayimg.com/00/s/NjAwWDYwMA==/z/l1IAAOSwxX1ZzJgl/$_12.PNG?set_id=880000500F',0,'2018-05-12 18:05:53','2018-05-12 18:05:53'),(12,'1rose.jpg',193709,'2018-05-12 18:12:07','2018-05-12 18:12:07'),(13,'https://i.ebayimg.com/00/s/MTAwMFgxMDAw/z/k24AAOSwgd1auw58/$_12.JPG?set_id=880000500F',0,'2018-05-12 18:32:47','2018-05-12 18:32:47');
/*!40000 ALTER TABLE `tb_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fix_asset_categories`
--

DROP TABLE IF EXISTS `tb_fix_asset_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_fix_asset_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fix_asset_categories`
--

LOCK TABLES `tb_fix_asset_categories` WRITE;
/*!40000 ALTER TABLE `tb_fix_asset_categories` DISABLE KEYS */;
INSERT INTO `tb_fix_asset_categories` VALUES (1,'Appliances / Electronic Devices And Accessories'),(2,'Buildings'),(3,'Computer Accessories'),(4,'Computer Servers and Firewalls'),(5,'Computer Software'),(6,'Computer Unit / Laptops'),(7,'Furnitures and Fixtures'),(8,'Land'),(9,'Machineries and Heavy Equipment'),(10,'Mobile Phones and Accessories'),(11,'Network Equipment / LAN Equipment'),(12,'Office Equipment'),(13,'Office Supplies'),(14,'Printers'),(15,'Projectors and Accessories'),(16,'Tablets / Gadgets and Accessories'),(17,'Telephone and Faxes'),(18,'Vehicles');
/*!40000 ALTER TABLE `tb_fix_asset_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fix_asset_logs`
--

DROP TABLE IF EXISTS `tb_fix_asset_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_fix_asset_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fix_asset_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fix_asset_logs_fix_asset_id_foreign` (`fix_asset_id`),
  KEY `fix_asset_logs_employee_id_foreign` (`employee_id`),
  KEY `fix_asset_logs_status_id_foreign` (`status_id`),
  KEY `fix_asset_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `fix_asset_logs_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `fix_asset_logs_fix_asset_id_foreign` FOREIGN KEY (`fix_asset_id`) REFERENCES `tb_fix_assets` (`id`),
  CONSTRAINT `fix_asset_logs_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `tb_fix_asset_statuses` (`id`),
  CONSTRAINT `fix_asset_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fix_asset_logs`
--

LOCK TABLES `tb_fix_asset_logs` WRITE;
/*!40000 ALTER TABLE `tb_fix_asset_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_fix_asset_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fix_asset_statuses`
--

DROP TABLE IF EXISTS `tb_fix_asset_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_fix_asset_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fix_asset_statuses`
--

LOCK TABLES `tb_fix_asset_statuses` WRITE;
/*!40000 ALTER TABLE `tb_fix_asset_statuses` DISABLE KEYS */;
INSERT INTO `tb_fix_asset_statuses` VALUES (1,'Active','label label-success'),(2,'Damaged','label label-danger'),(3,'Lost','label label-danger'),(4,'Transferred','label label-warning'),(5,'Borrowed','label label-warning'),(6,'For Repair - Supplier','label label-primary'),(7,'For Repair - Technician','label label-primary'),(8,'Sold','label label-default');
/*!40000 ALTER TABLE `tb_fix_asset_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fix_asset_transfer_types`
--

DROP TABLE IF EXISTS `tb_fix_asset_transfer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_fix_asset_transfer_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fix_asset_transfer_types`
--

LOCK TABLES `tb_fix_asset_transfer_types` WRITE;
/*!40000 ALTER TABLE `tb_fix_asset_transfer_types` DISABLE KEYS */;
INSERT INTO `tb_fix_asset_transfer_types` VALUES (1,'Transfer'),(2,'Repair'),(3,'Dispose');
/*!40000 ALTER TABLE `tb_fix_asset_transfer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fix_asset_transfers`
--

DROP TABLE IF EXISTS `tb_fix_asset_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_fix_asset_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee` int(10) unsigned NOT NULL,
  `transferred_at` date NOT NULL,
  `transfer_type` int(10) unsigned NOT NULL,
  `quantity` decimal(9,2) NOT NULL,
  `unit` int(10) unsigned NOT NULL,
  `item` int(10) unsigned NOT NULL,
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `transfer_to` int(10) unsigned NOT NULL,
  `book_value` decimal(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fix_asset_transfers_employee_foreign` (`employee`),
  KEY `fix_asset_transfers_transfer_type_foreign` (`transfer_type`),
  KEY `fix_asset_transfers_unit_foreign` (`unit`),
  KEY `fix_asset_transfers_item_foreign` (`item`),
  KEY `fix_asset_transfers_transfer_to_foreign` (`transfer_to`),
  CONSTRAINT `fix_asset_transfers_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `fix_asset_transfers_item_foreign` FOREIGN KEY (`item`) REFERENCES `tb_fix_assets` (`id`),
  CONSTRAINT `fix_asset_transfers_transfer_to_foreign` FOREIGN KEY (`transfer_to`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `fix_asset_transfers_transfer_type_foreign` FOREIGN KEY (`transfer_type`) REFERENCES `tb_fix_asset_transfer_types` (`id`),
  CONSTRAINT `fix_asset_transfers_unit_foreign` FOREIGN KEY (`unit`) REFERENCES `tb_units` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fix_asset_transfers`
--

LOCK TABLES `tb_fix_asset_transfers` WRITE;
/*!40000 ALTER TABLE `tb_fix_asset_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_fix_asset_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fix_assets`
--

DROP TABLE IF EXISTS `tb_fix_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_fix_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee` int(10) unsigned NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serial_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `acquired_at` date NOT NULL,
  `received_at` date NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `remarks` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fix_assets_employee_foreign` (`employee`),
  KEY `fix_assets_category_foreign` (`category`),
  KEY `fix_assets_status_foreign` (`status`),
  CONSTRAINT `fix_assets_category_foreign` FOREIGN KEY (`category`) REFERENCES `tb_fix_asset_categories` (`id`),
  CONSTRAINT `fix_assets_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `fix_assets_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_fix_asset_statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fix_assets`
--

LOCK TABLES `tb_fix_assets` WRITE;
/*!40000 ALTER TABLE `tb_fix_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_fix_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_front_office_settings`
--

DROP TABLE IF EXISTS `tb_front_office_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_front_office_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_front_office_settings`
--

LOCK TABLES `tb_front_office_settings` WRITE;
/*!40000 ALTER TABLE `tb_front_office_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_front_office_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_front_office_transactions`
--

DROP TABLE IF EXISTS `tb_front_office_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_front_office_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controlno` int(11) unsigned zerofill NOT NULL,
  `client` int(11) unsigned zerofill NOT NULL,
  `transactionrefno` int(11) unsigned zerofill NOT NULL,
  `transactiontype` int(11) NOT NULL,
  `receiptno` int(11) unsigned zerofill NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `front_office_transactions_controlno_foreign` (`controlno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_front_office_transactions`
--

LOCK TABLES `tb_front_office_transactions` WRITE;
/*!40000 ALTER TABLE `tb_front_office_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_front_office_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gender`
--

DROP TABLE IF EXISTS `tb_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gender` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gender`
--

LOCK TABLES `tb_gender` WRITE;
/*!40000 ALTER TABLE `tb_gender` DISABLE KEYS */;
INSERT INTO `tb_gender` VALUES (1,'Male'),(2,'Female');
/*!40000 ALTER TABLE `tb_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gl_details`
--

DROP TABLE IF EXISTS `tb_gl_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gl_details` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned zerofill NOT NULL,
  `accountclass` int(10) unsigned NOT NULL,
  `accounttype` int(10) unsigned NOT NULL,
  `accountentry` int(10) unsigned NOT NULL,
  `client` int(10) unsigned zerofill NOT NULL,
  `glaccount` int(11) NOT NULL,
  `glamount` decimal(9,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`,`accountclass`,`accounttype`,`accountentry`,`client`,`glaccount`,`subscription`),
  KEY `gl_details_controlno_foreign` (`controlno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gl_details`
--

LOCK TABLES `tb_gl_details` WRITE;
/*!40000 ALTER TABLE `tb_gl_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_gl_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gl_summary`
--

DROP TABLE IF EXISTS `tb_gl_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gl_summary` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned zerofill NOT NULL,
  `client` int(10) unsigned zerofill NOT NULL,
  `transactionrefno` int(11) unsigned zerofill NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`,`client`,`transactionrefno`,`subscription`),
  KEY `gl_summary_controlno_foreign` (`controlno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gl_summary`
--

LOCK TABLES `tb_gl_summary` WRITE;
/*!40000 ALTER TABLE `tb_gl_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_gl_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_glaccount_levels`
--

DROP TABLE IF EXISTS `tb_glaccount_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_glaccount_levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_glaccount_levels`
--

LOCK TABLES `tb_glaccount_levels` WRITE;
/*!40000 ALTER TABLE `tb_glaccount_levels` DISABLE KEYS */;
INSERT INTO `tb_glaccount_levels` VALUES (1,'Summary'),(2,'Detail');
/*!40000 ALTER TABLE `tb_glaccount_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_glaccount_types`
--

DROP TABLE IF EXISTS `tb_glaccount_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_glaccount_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_glaccount_types`
--

LOCK TABLES `tb_glaccount_types` WRITE;
/*!40000 ALTER TABLE `tb_glaccount_types` DISABLE KEYS */;
INSERT INTO `tb_glaccount_types` VALUES (1,'Assets','asset'),(2,'Liabilities','liability'),(3,'Equity','equity'),(4,'Revenues','revenue'),(5,'Expenses','expense'),(6,'Net Income','net-income');
/*!40000 ALTER TABLE `tb_glaccount_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_glaccounts`
--

DROP TABLE IF EXISTS `tb_glaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_glaccounts` (
  `subscription` int(10) unsigned NOT NULL,
  `gltype` int(10) unsigned NOT NULL,
  `glsummary` int(10) unsigned NOT NULL DEFAULT 0,
  `glaccount` int(10) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gllevel` int(10) unsigned NOT NULL,
  `seqno` int(11) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`gltype`,`glaccount`,`gllevel`,`seqno`,`glsummary`,`subscription`),
  KEY `glaccount` (`glaccount`),
  KEY `glaccounts_subscription_foreign` (`subscription`),
  KEY `glaccounts_gllevel_foreign` (`gllevel`),
  KEY `glaccounts_user_foreign` (`user`),
  KEY `glaccounts_status_foreign` (`status`),
  CONSTRAINT `glaccounts_gllevel_foreign` FOREIGN KEY (`gllevel`) REFERENCES `tb_glaccount_levels` (`id`),
  CONSTRAINT `glaccounts_gltype_foreign` FOREIGN KEY (`gltype`) REFERENCES `tb_glaccount_types` (`id`),
  CONSTRAINT `glaccounts_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `glaccounts_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `glaccounts_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_glaccounts`
--

LOCK TABLES `tb_glaccounts` WRITE;
/*!40000 ALTER TABLE `tb_glaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_glaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_glcontrols`
--

DROP TABLE IF EXISTS `tb_glcontrols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_glcontrols` (
  `subscription` int(10) unsigned NOT NULL,
  `accountclass` int(10) unsigned NOT NULL,
  `accounttype` int(10) unsigned NOT NULL,
  `accountentry` int(10) unsigned NOT NULL,
  `glaccount` int(10) unsigned NOT NULL,
  `glentrytype` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`accountclass`,`accounttype`,`glaccount`,`accountentry`,`glentrytype`,`subscription`),
  KEY `glcontrols_subscription_foreign` (`subscription`),
  KEY `glcontrols_accounttype_foreign` (`accounttype`),
  KEY `glcontrols_accountentry_foreign` (`accountentry`),
  KEY `glcontrols_glaccount_foreign` (`glaccount`),
  KEY `glcontrols_glentrytype_foreign` (`glentrytype`),
  KEY `glcontrols_user_foreign` (`user`),
  CONSTRAINT `glcontrols_accountclass_foreign` FOREIGN KEY (`accountclass`) REFERENCES `tb_account_classes` (`id`),
  CONSTRAINT `glcontrols_accountentry_foreign` FOREIGN KEY (`accountentry`) REFERENCES `tb_account_entries` (`id`),
  CONSTRAINT `glcontrols_accounttype_foreign` FOREIGN KEY (`accounttype`) REFERENCES `tb_account_types` (`id`),
  CONSTRAINT `glcontrols_glaccount_foreign` FOREIGN KEY (`glaccount`) REFERENCES `tb_glaccounts` (`glaccount`),
  CONSTRAINT `glcontrols_glentrytype_foreign` FOREIGN KEY (`glentrytype`) REFERENCES `tb_glentry_types` (`id`),
  CONSTRAINT `glcontrols_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `glcontrols_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_glcontrols`
--

LOCK TABLES `tb_glcontrols` WRITE;
/*!40000 ALTER TABLE `tb_glcontrols` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_glcontrols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_glentry_types`
--

DROP TABLE IF EXISTS `tb_glentry_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_glentry_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `operation` smallint(6) NOT NULL,
  `shortdesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_glentry_types`
--

LOCK TABLES `tb_glentry_types` WRITE;
/*!40000 ALTER TABLE `tb_glentry_types` DISABLE KEYS */;
INSERT INTO `tb_glentry_types` VALUES (1,'DEBIT - Accumulated',1,'DBA'),(2,'CREDIT - Accumulated',-1,'CDA'),(3,'DEBIT - Cut Off',1,'DBC'),(4,'CREDIT - Cut Off',-1,'CDC'),(5,'DEBIT - Setup Date',-1,'DBS'),(6,'CREDIT - Setup Date',-1,'CDS');
/*!40000 ALTER TABLE `tb_glentry_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hdmf_settings`
--

DROP TABLE IF EXISTS `tb_hdmf_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_hdmf_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minbracket` decimal(9,2) NOT NULL,
  `maxbracket` decimal(9,2) NOT NULL,
  `employeeshare` decimal(9,2) NOT NULL,
  `employershare` decimal(9,2) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `hdmf_settings_subscription_foreign` (`subscription`),
  KEY `hdmf_settings_user_foreign` (`user`),
  KEY `hdmf_settings_status_foreign` (`status`),
  CONSTRAINT `hdmf_settings_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `hdmf_settings_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `hdmf_settings_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hdmf_settings`
--

LOCK TABLES `tb_hdmf_settings` WRITE;
/*!40000 ALTER TABLE `tb_hdmf_settings` DISABLE KEYS */;
INSERT INTO `tb_hdmf_settings` VALUES (1,1,'1','1,500 and below',0.00,1500.00,2.00,1.00,1,1,'2016-11-17 02:19:38','2016-11-17 02:19:38'),(2,1,'2','Above 1,500',1500.01,9999999.99,2.00,2.00,1,1,'2016-11-17 02:21:00','2016-11-17 02:21:00'),(3,2,'1','1,500 and below',0.00,1500.00,2.00,1.00,1,1,'2016-11-17 02:19:38','2016-11-17 02:19:38'),(4,2,'2','Above 1,500',1500.01,9999999.99,2.00,2.00,1,1,'2016-11-17 02:21:00','2016-11-17 02:21:00');
/*!40000 ALTER TABLE `tb_hdmf_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hold_ship`
--

DROP TABLE IF EXISTS `tb_hold_ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_hold_ship` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ebay_item` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ebay_account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `edited_note` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hold_ship`
--

LOCK TABLES `tb_hold_ship` WRITE;
/*!40000 ALTER TABLE `tb_hold_ship` DISABLE KEYS */;
INSERT INTO `tb_hold_ship` VALUES (1,'239847234','72398472947','street-moda','4',1,'Out of Stock','2018-02-26 12:36:17','2018-03-04 04:37:30'),(2,'029384092','345345345','user-101','4',1,'Out of Stock','2018-03-03 20:48:56','2018-03-04 00:48:08'),(3,'JJ-5D29-1573-22 ','132288420154','lorna_anne80','4',1,'can tell buyer return back,still oos,can change color to ship , wait have stock or change to other listing with same price in the store(can change red or gold)','2018-03-06 14:22:57','2018-03-06 14:22:57');
/*!40000 ALTER TABLE `tb_hold_ship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_holiday_types`
--

DROP TABLE IF EXISTS `tb_holiday_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_holiday_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_holiday_types`
--

LOCK TABLES `tb_holiday_types` WRITE;
/*!40000 ALTER TABLE `tb_holiday_types` DISABLE KEYS */;
INSERT INTO `tb_holiday_types` VALUES (1,'N/A','na'),(2,'Legal Holiday','legal'),(3,'Special Non-Working Holiday','special'),(4,'Regular Holiday','regular'),(5,'Rest Day','rest'),(6,'Special  Holiday + Rest Day','special_rest'),(7,'Regular Holiday + Rest Day','regular_rest'),(8,'Double Holiday','double'),(9,'Double Holiday + Rest Day','double_rest'),(10,'Legal Holiday + Rest Day','legal_rest');
/*!40000 ALTER TABLE `tb_holiday_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_holidays`
--

DROP TABLE IF EXISTS `tb_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `h_year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `h_date` date NOT NULL,
  `h_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `h_type` int(10) unsigned DEFAULT NULL,
  `is_double_pay` smallint(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `holidays_subscription_foreign` (`subscription`),
  KEY `holidays_h_type_foreign` (`h_type`),
  CONSTRAINT `holidays_h_type_foreign` FOREIGN KEY (`h_type`) REFERENCES `tb_holiday_types` (`id`),
  CONSTRAINT `holidays_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_holidays`
--

LOCK TABLES `tb_holidays` WRITE;
/*!40000 ALTER TABLE `tb_holidays` DISABLE KEYS */;
INSERT INTO `tb_holidays` VALUES (2,1,'2017','2017-01-01','New Years Day',4,0,'2017-03-24 02:46:04','2017-03-24 02:46:32'),(3,1,'2017','2017-01-02','Public Holiday',3,0,'2017-03-24 02:47:37','2017-03-24 02:47:37'),(4,1,'2017','2017-01-28','Chinese New Year',3,0,'2017-03-24 02:48:03','2017-03-24 02:48:03'),(5,1,'2017','2017-02-25','People Power Revolution',3,0,'2017-03-24 02:48:31','2017-03-24 02:48:31'),(6,1,'2017','2017-04-09','Day of Valor',4,1,'2017-03-24 02:48:56','2017-05-08 07:30:58'),(7,1,'2017','2017-04-13','Maundy Thursday',4,1,'2017-03-24 02:49:17','2017-05-08 07:33:00'),(8,1,'2017','2017-04-14','Good Friday',4,0,'2017-03-24 02:49:43','2017-03-24 02:49:43'),(9,1,'2017','2017-04-15','Black Saturday',3,0,'2017-03-24 02:50:07','2017-03-24 02:50:07'),(10,1,'2017','2017-05-01','Labor Day',4,0,'2017-03-24 02:50:30','2017-03-24 02:50:30'),(11,1,'2017','2017-06-12','Independence Day',4,0,'2017-03-24 02:50:59','2017-03-24 02:50:59'),(12,1,'2017','2017-06-26','Eid ul-Fitr',3,0,'2017-03-24 02:51:41','2017-03-24 02:51:41'),(13,1,'2017','2017-08-19','Manuel Quezon Birthday',3,0,'2017-03-24 02:52:16','2017-03-24 02:52:16'),(14,1,'2017','2017-08-21','Ninoy Aquino Day',3,0,'2017-03-24 02:52:38','2017-03-24 02:52:38'),(15,1,'2017','2017-08-28','National Heroes Day',4,0,'2017-03-24 02:53:06','2017-03-24 02:53:06'),(16,1,'2017','2017-09-01','Eid al-Adha',3,0,'2017-03-24 02:53:50','2017-03-24 02:53:50'),(17,1,'2017','2017-10-31','Public Holiday',3,0,'2017-03-24 02:54:18','2017-03-24 02:54:18'),(18,1,'2017','2017-11-01','All Saints Day',3,0,'2017-03-24 02:54:43','2017-03-24 02:54:43'),(19,1,'2017','2017-11-30','Bonifacio Day',4,0,'2017-03-24 02:55:06','2017-03-24 02:55:06'),(20,1,'2017','2017-12-25','Christmas Day',4,0,'2017-03-24 02:55:28','2017-03-24 02:55:28'),(21,1,'2017','2017-12-30','Rizal Day',4,0,'2017-03-24 02:55:49','2017-03-24 02:55:49'),(22,1,'2017','2017-12-31','New Year\'s Eve',3,0,'2017-03-24 02:56:06','2017-03-24 02:56:06'),(23,1,'2017','2017-12-24','Christmas Eve',3,0,'2017-03-24 02:56:29','2017-03-24 02:56:29');
/*!40000 ALTER TABLE `tb_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_brands`
--

DROP TABLE IF EXISTS `tb_inventory_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=726 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_brands`
--

LOCK TABLES `tb_inventory_brands` WRITE;
/*!40000 ALTER TABLE `tb_inventory_brands` DISABLE KEYS */;
INSERT INTO `tb_inventory_brands` VALUES (1,'Generic'),(2,'555'),(3,'Selecta'),(4,'Tanduay'),(5,'Emperador'),(6,'Barcelona'),(7,'Boracay'),(8,'Cossack'),(9,'Jamaica'),(10,'London'),(11,'NESTLE'),(12,'Globalwinds'),(13,'ARIEL'),(14,'Dental-B'),(15,'Magnolia'),(16,'Joyce'),(17,'Purefoods'),(18,'BONUX'),(19,'Rejoice'),(20,'Camay'),(21,'Safeguard'),(22,'Tide'),(23,'Downy'),(24,'Gillette'),(25,'Head&Shoulder'),(26,'Vicks'),(27,'Whisper'),(28,'Zest'),(29,'Pampers'),(30,'Joy'),(31,'Mr.Clean'),(32,'Olay'),(33,'Pantene'),(34,'Oral-b'),(35,'Best Foods'),(36,'Axe'),(37,'Champion Detergent'),(38,'Del'),(39,'Knorr'),(40,'Block&White'),(41,'Coffeemate'),(42,'Breeze'),(43,'Clear'),(44,'Kitkat'),(45,'Rexona'),(46,'Close-up'),(47,'Magic Sarap'),(48,'Maggisavorclassis'),(49,'Maggi'),(50,'CreamSilk'),(51,'Domex'),(52,'Dove'),(53,'GreenCross'),(54,'Sunsilk'),(55,'Surf'),(56,'Eskinol'),(57,'Fissan'),(58,'Ladys Choice'),(59,'Lipton'),(60,'Master'),(61,'Pepsodent'),(62,'Ponds'),(63,'Vaseline'),(64,'Lipton'),(65,'Royal'),(66,'Monde'),(67,'Angel'),(68,'Argentina'),(69,'Century'),(70,'Fresca'),(71,'Lucky 7'),(72,'Goya'),(73,'EL REAL'),(74,'Delfi'),(75,'harvey'),(76,'Chips Delight'),(77,'Greenex'),(78,'Dairy Best'),(79,'Diabetasol'),(80,'Lewis & Pearl'),(81,'WRIGLEYS'),(82,'Galinco'),(83,'Extra'),(84,'Farmtown'),(85,'Hello'),(86,'Zonrox'),(87,'La Pacita'),(88,'Lea & Perrins'),(89,'Mitra'),(90,'Nestea'),(91,'nescafedecaf'),(92,'Nivea'),(93,'Bactidol'),(94,'Band Aid'),(95,'Carefree'),(96,'Clean&Clear'),(97,'Johnson'),(98,'Ovaltine'),(99,'Presco'),(100,'Cola Candy'),(101,'Listerine'),(102,'Modess'),(103,'Saji'),(104,'Salongpas'),(105,'Smileys'),(106,'Sugus'),(107,'Pinakurat'),(108,'Toiley'),(109,'Jummy'),(110,'Cdo Foods'),(111,'Del Monte'),(112,'Nizoral'),(113,'Wyeth'),(114,'Amigo'),(116,'Fresh Nature'),(117,'Giv'),(118,'Scotch Brite'),(119,'Birch Tree'),(120,'Nice'),(121,'Blue bay'),(122,'Century tuna'),(123,'Deemah'),(124,'Doa Elena'),(125,'Drypers'),(126,'Seorita'),(127,'Sunkiss'),(128,'Wings'),(129,'Emperor'),(130,'H&Y'),(131,'Good Life'),(132,'AlactaGrow'),(133,'ENFAGROW'),(134,'ENFAKID'),(135,'ENFAMAMA'),(136,'ENERFILL'),(137,'FLORENCE'),(138,'GARNIER'),(139,'FRANZIA'),(140,'GATSBY'),(141,'ENFALAC'),(142,'ENFAPRO'),(144,'Lactum'),(145,'SUSTAGEN'),(146,'FUNDADOR'),(147,'VINO FONTANA'),(148,'ALFONSO'),(149,'EXCELENTE'),(150,'GarudaFood'),(151,'Gloripan'),(152,'Golden'),(153,'Hakone'),(154,'Hershey'),(155,'Jolly'),(156,'Maximo'),(157,'SWAN'),(158,'TOYU'),(159,'MARSHIES'),(160,'MAY'),(161,'IDEAL'),(162,'INDOCAFE'),(163,'JELLYBEE'),(164,'Triple A'),(165,'Loreal'),(166,'La Filipina'),(167,'Revive'),(168,'Markenburg'),(169,'Family'),(170,'Marca Leon'),(171,'Miko'),(172,'Motts'),(173,'Neo'),(174,'Old Orchid'),(175,'Perla'),(177,'Markenburg'),(178,'Queensland'),(179,'Softee'),(180,'Star jelly'),(181,'Lights&Scents'),(182,'Swift'),(183,'Tena'),(184,'TinTin'),(185,'Ulalammm'),(186,'Welch'),(187,'Wow'),(188,'Arcemar'),(189,'RDL'),(190,'ACS'),(191,'PSWRI'),(192,'Piprime'),(193,'Andoks'),(194,'Astring O Sol'),(195,'Atami'),(196,'Baguio'),(197,'Cdo'),(198,'Calpol'),(199,'Ajinomoto'),(200,'Anointed'),(201,'Kimberly-Clark'),(202,'Family Brand'),(203,'Fiona'),(204,'Firefly'),(205,'URC'),(206,'Grips'),(208,'Highland'),(209,'Huggies'),(210,'Kwik'),(211,'Mothers Best'),(212,'Kendi Mint'),(213,'Kleen'),(214,'Mead Johnson'),(215,'Maskape'),(216,'Mothers Best'),(217,'Mojitos'),(218,'Mompo'),(219,'LaLa'),(220,'Mr.Jelly'),(221,'Paul Masson'),(222,'San Marino'),(223,'Sea Quest'),(224,'Sensodyne'),(225,'Scotts'),(226,'Wattle Valley'),(227,'White Rabbit'),(228,'TWINS'),(229,'Sisters'),(230,'Jimms'),(231,'HydroGel'),(232,'Gelle'),(233,'Cherub'),(234,'Boss'),(235,'Biogenic'),(236,'Bambini'),(237,'ABC'),(238,'BERKS'),(239,'Big Munch'),(240,'Cheez Whiz'),(241,'Chips Ahoy'),(242,'Calumet'),(243,'Eden'),(244,'Halls'),(245,'Jelly yum'),(246,'Kraft'),(247,'Alcoplus'),(248,'M-150'),(249,'Maxwell'),(250,'Mayo Real'),(251,'Minola'),(252,'Miracle Whip'),(253,'Rainbow Magic'),(254,'Super Crunch'),(255,'Toblerone'),(256,'Ricoa'),(257,'Commonwealth'),(258,'Silka'),(259,'Widemind'),(260,'Wellmade'),(261,'Virginia'),(265,'Extract'),(267,'Darling Foods'),(268,'Reylens'),(269,'Aldritz'),(270,'Convoy'),(271,'Prime'),(272,'Mickey'),(273,'Pakyaw'),(274,'Right Choice'),(275,'Super Tibay'),(276,'MX3'),(277,'Unilab'),(278,'Coca Cola'),(279,'Baby joy'),(280,'Empress'),(281,'Farlin'),(282,'Kleenex'),(283,'Kotex'),(284,'newtex'),(285,'Purity'),(286,'advance'),(287,'bayer'),(288,'Chooga'),(289,'Fiesta'),(290,'Fruit Basket'),(291,'Frutti'),(292,'Gefi'),(293,'Homi'),(294,'Mugo'),(295,'Hobe'),(296,'Rackey'),(297,'Sunkist'),(298,'Wrinkles'),(299,'YSU'),(300,'Pionner'),(301,'Perfect'),(302,'bensdorp'),(303,'Fres & Natural'),(304,'fresh'),(305,'fresh'),(306,'kami'),(307,'Sweet baby'),(308,'Flour'),(309,'Diamond'),(310,'Armak'),(311,'Mauripan'),(312,'Focus'),(313,'NECO'),(314,'Slers'),(315,'PANASONIC'),(316,'SHER'),(317,'SHERIDAN'),(318,'Sheridan'),(319,'SHALDAN'),(320,'shertox'),(321,'singer'),(322,'super'),(323,'zebra'),(324,'suretite'),(325,'dairychamp'),(326,'DONPEPE'),(327,'GILBEYS'),(328,'MEGA'),(329,'DON PEPE'),(330,'DAIRY CHAMP'),(331,'ISLAND MIXERS'),(332,'JOHNNIE WALKER'),(333,'NOVELLINO'),(334,'ROBUST'),(335,'TITA ELY'),(336,'ALASKA'),(337,'ALPINE'),(338,'CARNATION'),(339,'COWBELL'),(340,'LIBERTY'),(341,'MILKMAID'),(342,'BANQUET'),(343,'LAMI'),(344,'LIBBYS'),(345,'MALING'),(346,'PHILIPS'),(347,'POCARI'),(348,'RUFINA'),(349,'SPAM'),(350,'TULIP'),(351,'Golden Glow'),(352,'DMPI'),(353,'Dari Creme'),(354,'JellyAce'),(355,'Sunpride'),(356,'San Miguel Beer'),(357,'SUREQUICK'),(358,'GINEBRA'),(359,'ALBATROSS'),(360,'Ansell'),(361,'MIRINDA'),(362,'Apollo'),(363,'Baby Flo'),(364,'Anlene'),(365,'Anchor'),(366,'Anmum'),(367,'trust pills'),(368,'Frenzy'),(369,'Garnier'),(370,'M&M'),(371,'Quaker'),(372,'Snickers'),(373,'Premiere'),(374,'racumin'),(375,'trust'),(376,'cleene'),(377,'RAM'),(378,'PHILUSA'),(379,'Splash'),(380,'beng-beng'),(381,'energen'),(382,'fres'),(383,'gandour'),(384,'goody'),(385,'kopiko'),(386,'grandour'),(387,'GV Cosmetics    '),(388,'3Q'),(389,'Absolute'),(390,'PMFTC'),(391,'Besuto'),(392,'BREEDER'),(393,'Cobra'),(394,'Colgate'),(395,'Datu Puti'),(396,'Bioderm'),(397,'EIGHT O CLOCK'),(398,'Energizer'),(399,'Extra joss'),(400,'Gard'),(401,'Gatorade'),(402,'Lucky Me'),(403,'M.Y. San'),(404,'Mama Sita'),(405,'angel soft'),(406,'BLOOMS'),(407,'CHARM'),(408,'DENTA CARE'),(409,'DOCTOR J'),(410,'EMI'),(411,'Maxx'),(412,'Nissin'),(413,'Fuego'),(414,'Guitar'),(415,'Heno De Pravia'),(416,'Soft White'),(417,'Softips'),(418,'UFC'),(419,'Regent'),(420,'Suysing'),(421,'Silver Swan'),(422,'CHAMPI'),(423,'CHOCO'),(424,'FROOTY'),(425,'FRUTOS'),(426,'ICOOL'),(427,'PINTOORA'),(428,'YAKEE'),(429,'VFRESH'),(430,'SO LUCKY'),(431,'Snitch'),(432,'Sprite'),(433,'Sunshine'),(434,'lipovitan'),(435,'unicare'),(436,'chum'),(437,'tender love'),(438,'Vitamilk'),(439,'JGemR'),(440,'Wilkins'),(441,'Rice'),(442,'Sugar'),(443,'Winston'),(444,'Magnum'),(445,'dairy'),(446,'GRO TALL'),(447,'Pepsi Products'),(448,'Pacific Meat'),(449,'Bounty Fresh'),(450,'Gama Fresh'),(451,'Ellestreque'),(452,'baygon'),(453,'CREAM'),(454,'LA VICTORIA'),(455,'EVEREADY'),(456,'fighter'),(457,'Schick'),(458,'Kingroy'),(459,'Mj Foods'),(460,'Marvels'),(461,'Mighty'),(462,'Duck'),(463,'Glade'),(464,'Kiwi'),(465,'Mr. Muscle'),(466,'Pork Meat'),(467,'OFF'),(468,'Oro RL'),(469,'Majical'),(470,'Barako Bull'),(471,'Cali'),(472,'Longkou'),(473,'Panda'),(474,'Queen J'),(475,'Absolute'),(476,'Summit'),(477,'Torino'),(478,'Manhu'),(479,'Amoren'),(480,'Arm & Hammer'),(481,'Rebisco'),(482,'Oishi'),(483,'CHEEZE-IT'),(484,'Clover'),(485,'Gardenia'),(486,'CHAMPION'),(487,'Humpy Dumpy'),(488,'Ideal'),(489,'Vjandep'),(490,'Rich'),(491,'longi'),(492,'Mexicorn'),(493,'Moby'),(494,'Nagaraya'),(495,'Oheya'),(496,'Peewee'),(497,'Peony'),(498,'Mccormick'),(499,'Ri-chee'),(500,'Rin-bee'),(501,'Stateline'),(502,'Yaki'),(503,'Ascof'),(504,'Superot'),(505,'BOY BAWANG'),(506,'CARONIA'),(507,'Limac'),(508,'Goodtime'),(509,'Honnee Pie'),(510,'Jhonnie Walker'),(511,'Lucky Strike'),(512,'Pall Mall'),(513,'Tita Ely'),(514,'Kettle'),(515,'Mr. Gulaman'),(516,'Dr.Kaufmann'),(517,'OMNI'),(518,'Maxman'),(519,'Youngs Town'),(520,'La Rosse'),(521,'IPI'),(522,'Bulldog'),(523,'Epoxy'),(524,'Rugby'),(525,'Vulca Seal'),(526,'Sako Bag'),(527,'Lemon Square'),(528,'Ampalaya Plus'),(529,'BL'),(530,'ETS'),(531,'JADE'),(532,'Jojis Delight'),(533,'Andale'),(534,'AQFRESH'),(535,'Fidel'),(536,'Phillips'),(537,'bingo'),(538,'ALVEDON'),(539,'Gardan'),(540,'Imodium'),(541,'Lomotil'),(542,'Medgen'),(543,'Lysol'),(544,'Mortein'),(545,'Bonamine'),(546,'Potencee'),(547,'Strepsils'),(548,'Tempra'),(549,'Propan'),(550,'Whiteflower'),(551,'Betadine'),(552,'Ensure'),(553,'FLANAX'),(554,'GAIN'),(555,'GROW'),(556,'ISOMIL'),(557,'Glucerna'),(558,'PEDIASURE'),(559,'Pedialyte'),(560,'Ponstan'),(561,'Abott'),(562,'Ajax'),(563,'Axion'),(564,'Palmolive'),(565,'Tender Care'),(566,'Crispy Fry'),(567,'ACE'),(568,'Cricket'),(569,'Yakult'),(570,'Unipak'),(571,'Cheers'),(573,'Ellips'),(574,'Femme'),(575,'Sanicare'),(576,'Tisyu'),(577,'Danes'),(578,'Eye Mo'),(579,'Guard'),(580,'Polident'),(581,'Ribena'),(582,'Samba'),(583,'Splenda'),(584,'Kwell'),(585,'Softbroom'),(586,'Sumilao'),(587,'RCGM'),(588,'Arlani'),(589,'NANA&DADAS'),(590,'BUGAS'),(591,'MILK BAR'),(592,'Tita Viz'),(593,'Miracle'),(594,'Canisios'),(595,'Sweet Bites'),(596,'LPG'),(597,'Gildelicious'),(598,'Cimagala'),(599,'Arnoco'),(600,'J&P'),(601,'PISCOR'),(602,'Netbag'),(603,'Pop-Corn'),(604,'Fresh Egg'),(605,'Blue Cow'),(606,'Daisy'),(607,'Isda'),(608,'Vegetables'),(609,'Nitz'),(610,'ATE LOUELA'),(611,'Hapee'),(612,'Charmee'),(613,'KIRKLAND'),(614,'Defence'),(615,'Truong Son'),(616,'Royale'),(617,'Gold Cup'),(618,'EQ'),(619,'Nips'),(620,'Caress'),(621,'Caress'),(622,'Fern-c'),(623,'PHAREX'),(624,'San mig'),(625,'Dragon'),(626,'YIMCHER'),(627,'Gluta'),(628,'VITAPLUS'),(629,'RUB'),(630,'Maxi-Peel'),(631,'TIWI'),(632,'Belo'),(633,'Baby fit'),(634,'nursy'),(635,'grand'),(636,'Grace'),(637,'myra'),(638,'BUG-OFF'),(639,'Abbys'),(640,'dazz'),(641,'kakas'),(642,'Everclean'),(643,'Bcc'),(644,'ARMADA'),(645,'SAGO'),(646,'Kung Fu'),(647,'LIVEN'),(648,'VYAN'),(649,'LUFFAH'),(650,'HYACINTH'),(651,'Alliance Global'),(652,'Longaniza'),(653,'Feedpro'),(654,'Toothpick'),(655,'host'),(656,'siopao'),(657,'Best'),(658,'Dings'),(659,'MANGO'),(660,'PINANGGA'),(661,'Wandah'),(662,'Jersey'),(663,'GOOLIAT'),(664,'Ebisen'),(665,'JVANS'),(666,'Fanta-Sea'),(667,'Licealiz'),(668,'Plemex'),(669,'ProKids'),(670,'Queen Mani'),(671,'Recent'),(672,'Sasas'),(673,'TEMPURA'),(674,'GCM'),(675,'Chatlet'),(676,'CHOCO MANI'),(677,'BROCOLLI'),(678,'BEYBIKO'),(679,'Babywipes'),(680,'Insenso'),(681,'Conzace'),(682,'ROYU'),(683,'SOLBAC'),(684,'DONEWELL'),(685,'Pledge'),(686,'DRYGOODS'),(687,'EG Pharma'),(688,'Kratos'),(689,'Heinz'),(690,'Megaplas'),(691,'Damie'),(692,'Oracare'),(693,'LECHON'),(694,'ESSENSA'),(695,'DEARBC'),(696,'CALLA'),(697,'BIG ABBY\'S'),(698,'NSS'),(699,'Bacchus'),(700,'VIEVANRHAY'),(701,'CONVENIENCE STORE ITEMS'),(702,'POMELO DAVAO'),(703,'VANISH'),(704,'attact'),(705,'BETET'),(706,'SENNA'),(707,'Victoria'),(708,'GLEAM'),(709,'ECOBAG'),(710,'PASCUAL'),(711,'kapatagan'),(712,'LADONAESPANOLA'),(713,'BEEHIVE'),(714,'HAPPYONE'),(715,'CHERIFER'),(716,'CENTRUM'),(717,'COFFEE'),(718,'LES\'BREAD & PASTRIES'),(719,'JM PASTRIES'),(720,'SUTLA'),(721,'sunbest'),(722,'SUNCRAFT'),(723,'SIXFORTUNE'),(724,'kojic'),(725,'GENACOL');
/*!40000 ALTER TABLE `tb_inventory_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_categories`
--

DROP TABLE IF EXISTS `tb_inventory_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_categories`
--

LOCK TABLES `tb_inventory_categories` WRITE;
/*!40000 ALTER TABLE `tb_inventory_categories` DISABLE KEYS */;
INSERT INTO `tb_inventory_categories` VALUES (1,'Consumables'),(2,'Redeemables');
/*!40000 ALTER TABLE `tb_inventory_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_classes`
--

DROP TABLE IF EXISTS `tb_inventory_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=757 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_classes`
--

LOCK TABLES `tb_inventory_classes` WRITE;
/*!40000 ALTER TABLE `tb_inventory_classes` DISABLE KEYS */;
INSERT INTO `tb_inventory_classes` VALUES (1,'Children\'s Wear'),(4,'Softdrinks'),(5,'Juices & Teas'),(6,'Energy Drinks'),(7,'Powdered Milk'),(8,'Maternal Milk'),(9,'Decoratives'),(11,'Tobacco'),(12,'Laundry Soap Bar'),(13,'Laundry Soap Granules (powder)'),(14,'Corned Beef'),(15,'Gauze Pad'),(16,'Sardines'),(17,'Hair Treatment'),(18,'Fries'),(19,'Crackers'),(20,'Ladies wear'),(21,'Grain'),(22,'handkerchief'),(23,'Pretzels'),(24,'Cream-Filled'),(25,'Batteries'),(26,'Electrical Supply'),(27,'Chips'),(28,'Flashlights'),(30,'Cables & Wires'),(31,'Plug'),(32,'Sockets'),(33,'Noozles'),(34,'Fuse'),(35,'Baked'),(36,'Tapes'),(37,'Bread'),(38,'Pipes'),(39,'Film'),(40,'Diskette'),(41,'Nacho'),(42,'TV'),(43,'Players'),(44,'Rings/Curls'),(45,'Radio'),(46,'Speaker'),(47,'Amplifier'),(48,'Microphone'),(49,'Mineral water'),(50,'Distilled water'),(51,'Adult'),(52,'Infant'),(53,'Grade III'),(54,'Lesson Plan'),(55,'Papers'),(56,'Yogurt'),(57,'Infant Milk'),(58,'Panty Liners'),(59,'Non Wing'),(60,'With Wings'),(61,'Overnight Use'),(62,'Butter'),(63,'Margarine'),(64,'Condensed Milk'),(65,'Evaporated Milk'),(66,'Nata de Coco'),(67,'Adult Milk'),(68,'Pasteurized Milk'),(69,'Mayonnaise/Salad Dressing'),(70,'Kaong'),(71,'Cookies'),(72,'Chicharon'),(73,'Bread'),(74,'Sandwich Spread'),(75,'Toasted Muffins'),(76,'Cotton Buds'),(77,'Toasted Bread'),(78,'Absorbent cotton'),(79,'Filter'),(80,'Cotton balls'),(81,'Cotton rolls'),(83,'Sandals'),(84,'Fabric Softener'),(85,'Slippers'),(86,'Shoes'),(87,'Diesel'),(88,'Gas'),(89,'Air & Fabric Freshener'),(90,'Floor Wax'),(91,'Mosquito Killers'),(92,'Bugs and Cockroach killers'),(93,'Bleach'),(94,'Muriatic Acid'),(95,'Disinfectant'),(96,'Shoe Polish'),(97,'Ointments & Creams'),(98,'Contraceptives'),(99,'For Cough'),(100,'Pain Relievers'),(101,'Vitamins'),(102,'Nasal-decongestant'),(103,'Aceite de Alcanforado'),(104,'Providine'),(105,'Salicylic Acid'),(106,'Acetone'),(107,'Agua Oxynada'),(108,'Liniment'),(109,'Plastic Strips'),(110,'band-aid'),(111,'Hooks'),(112,'Earings'),(113,'Necklace'),(114,'Wristwatch'),(115,'Hair Accessories'),(116,'Bracelets'),(117,'Wallet'),(118,'Ribbon'),(119,'Bags'),(120,'Nail Polish'),(121,'Nail Brush'),(122,'Nail Cutter'),(123,'Dried Fish'),(124,'Hammer'),(125,'Hand Saw'),(126,'Shovels'),(127,'Nails'),(128,'Chains'),(129,'Pork Meat'),(130,'Beef'),(131,'Chicken'),(132,'Fish Cracker'),(133,'Ice Cream'),(134,'Pellets'),(135,'Hot Dogs'),(136,'Mash'),(137,'Patties'),(138,'Ham'),(139,'Cabbage'),(140,'Carrots'),(141,'Longanisa'),(142,'Onion'),(143,'Garlic'),(144,'Tocino'),(145,'Squash'),(146,'Tapa'),(147,'Ginger'),(148,'Tuna'),(149,'Potato'),(150,'Embutido'),(151,'Butter Creams'),(152,'Beans'),(153,'Chicken Meat'),(154,'Cooking Oil'),(155,'Sauce'),(156,'Sotanghon'),(157,'Broth Cubes'),(158,'Breading and Coating Mix'),(159,'Pancit Canton'),(160,'Seasoning Mix'),(161,'Bihon'),(162,'Vinegar/Suka'),(163,'Recipe Mix'),(164,'Spaghetti Pasta'),(165,'Salt'),(166,'Elbow Macaroni'),(167,'Sauce'),(168,'Pasta Italiana'),(169,'Misua'),(170,'Mushrooms'),(171,'Odong'),(172,'Garbanzos'),(173,'Young Corn'),(174,'Wine'),(175,'Tomato Paste'),(176,'Brandy'),(177,'Black Peas'),(178,'Rhum'),(179,'Green Peas'),(180,'Vodka'),(181,'Vino'),(182,'Pork & Beans'),(183,'Gin'),(184,'Squid'),(185,'Tuna'),(186,'Cocktail Drinks'),(187,'Beer'),(188,'Beef Loaf'),(189,'Sausage'),(190,'Luncheon Meat'),(191,'Nutri-bread'),(192,'Carne Norte'),(194,'Lechon Paksiw'),(195,'Mechado'),(196,'Hopia'),(197,'Oyster Sause'),(198,'Ketchup'),(199,'Bread Sticks'),(200,'Vinegar'),(201,'Recipe Mix'),(202,'Hostias'),(203,'Canned Goods'),(204,'Pasta'),(205,'Cologne'),(206,'Facial Powder'),(207,'Marshmallows'),(208,'Gel'),(209,'Menthol'),(210,'Coffee'),(211,'Milk Chocolate'),(213,'Lotion'),(214,'Oil'),(215,'Facial Creams'),(216,'Body Spray'),(217,'Beauty Soap'),(218,'Chewing Gums/Gumlets'),(219,'Shampoo'),(220,'Conditioner'),(221,'Hot Oil'),(222,'Milk Chocolate'),(223,'Vermicelli'),(224,'Chocolate Balls'),(225,'Tawas'),(226,'Deodorant'),(227,'Choco Bars'),(228,'Chewy Butters'),(229,'Nail Polish Remover'),(230,'Choco-Coated'),(231,'Cuticle Remover'),(232,'Cookies'),(233,'Crackers'),(234,'Intimate Wash'),(235,'Lip Balm'),(236,'Conditioner'),(237,'Moisturizer'),(238,'Shampoo w/ Conditioner'),(239,'Make-up kits'),(240,'Shampoo w/out Conditioner'),(241,'Rice'),(242,'Egg'),(243,'Charcoal'),(244,'Bedsheets'),(245,'Pillow Case'),(246,'Blanket'),(247,'Floor Mat'),(248,'Door Mat'),(249,'Strainer'),(250,'Wall Clock'),(252,'Hangers & Clips'),(253,'Vase'),(254,'Figurines'),(255,'Frames'),(256,'Mirror'),(257,'Trash Bag'),(258,'Cleaning Tools'),(259,'Belt'),(260,'Umbrella'),(261,'Dolls'),(262,'Cars'),(263,'Bath'),(264,'Beach'),(265,'Shawl'),(266,'Face'),(267,'Guitar'),(268,'Cooking Utensils'),(269,'Glassware'),(270,'Utensils'),(273,'Disinfectant'),(274,'Anti-Infectant'),(275,'seeds'),(276,'fighting cock clove'),(277,'Glass Cleaner'),(278,'Dishwashing Paste, Liquid & Bar'),(279,'Cleansing Agent'),(280,'Body Powder'),(281,'Toothpaste'),(282,'Mouthwash'),(283,'Floss and Toothpick'),(284,'Toothbrush'),(285,'Bleach'),(286,'Milk'),(287,'Feeding Bottles'),(288,'Facial Cleanser'),(289,'Candle'),(290,'Ice Bag and Wrapper'),(291,'Laundry Liquids'),(292,'Diapers'),(293,'Nipple'),(294,'Mouth Wash'),(295,'Fabric Conditioner'),(296,'Baby Powder'),(297,'Foot Powder'),(298,'Milk Bath'),(299,'Pull-Up Tissues'),(300,'Bathroom Tissues'),(301,'Paper Plate'),(302,'Plastic Cups'),(303,'Disposable Utensils'),(304,'Breast Pump'),(305,'Nasal Aspirator'),(306,'Cheese'),(307,'Table Napkins'),(309,'Hotdog Tray'),(310,'Baking Cup'),(311,'Teether'),(312,'Pacifier'),(313,'Notebook'),(314,'Cup Noodles'),(316,'Refined Sugar'),(317,'Mascuvado Sugar'),(318,'Brown Sugar'),(319,'Confectioner'),(320,'Desicated'),(321,'Powdered Chocolate'),(322,'Noodles'),(323,'Safety Matches'),(324,'Styro'),(325,'Drinking Straw'),(326,'Popsicle Sticks'),(327,'Trash Bag'),(328,'Straw Thread'),(329,'Food Storage'),(330,'Surgical Gloves'),(331,'All-Purpose Gloves'),(332,'Vanilla'),(333,'Flour and Baking'),(334,'Vanilla'),(335,'Yeast'),(336,'Baking Powder'),(337,'Metal Polish'),(338,'Salted Fish and Shells'),(339,'Gulaman'),(340,'Cornstarch'),(341,'Canned and Packed'),(342,'Cream Milk'),(343,'Instant Soup'),(344,'Liqueur'),(345,'Spaghetti Sauce'),(346,'Tomato Sauce'),(347,'Banana Ketchup'),(348,'Tomato Ketchup'),(349,'Lime'),(350,'Fruit Cocktails'),(351,'Whiskey'),(352,'Yoghurt Drink'),(353,'Pickles'),(354,'Brush'),(355,'Sisig'),(356,'Flavored Water'),(357,'Juice'),(358,'Soda'),(359,'Cocoa'),(360,'Choco/Milk Tetra Packs'),(361,'Liver Spread'),(362,'Iced Tea'),(363,'Lihia Water'),(364,'Miki'),(365,'Cocoa Powder'),(366,'Perfume'),(367,'Tapes'),(368,'Crepe Paper'),(369,'Crayons'),(370,'Writing Book'),(371,'Writing Book'),(372,'Theme Book'),(373,'Foil'),(374,'Booklet'),(375,'Envelope'),(376,'Folder'),(377,'Baby Wash'),(378,'Fruit-Flavored Candies'),(379,'Assorted Biscuits'),(380,'Oats'),(382,'Cream-Filled'),(383,'Salabat'),(384,'Cerelac'),(385,'Chocolate'),(386,'Delicacies'),(387,'Peanut'),(388,'Butter Caramel'),(389,'Wafer'),(390,'Bread Sticks'),(391,'Creamer'),(393,'Facial Wash'),(394,'Cola Candy'),(395,'Toasted Bread'),(396,'Capsules'),(397,'Food Supplement'),(398,'Tablets'),(399,'Balm'),(400,'Cereal'),(401,'Chorizo'),(402,'Franks'),(403,'Squid & Fish Balls'),(404,'Sausage'),(405,'Bacon'),(406,'Antimotility'),(407,'Granules'),(408,'Corned Beef'),(409,'Juices'),(410,'Fruits'),(411,'Ice Pops'),(412,'Patis'),(413,'Choco Milk Bars'),(414,'Choco Wafer'),(415,'Choco Milk Wafers'),(416,'Milk Bars'),(417,'Grahams'),(418,'Creamy Choco'),(419,'Shampoo'),(420,'Liquid Soap'),(421,'Soap Bar'),(422,'Chocolate Rolls'),(423,'Medical Aparatus'),(424,'Eyedrops'),(425,'Medicated Patch'),(426,'Syrup'),(427,'Oral Drops'),(428,'Cards'),(429,'Bandage'),(430,'Facial Tissues'),(431,'Jelly'),(432,'Net Bag'),(433,'Meat Loaf'),(434,'Choco Drinks'),(435,'Sponge and Scrubbing Pad'),(436,'Creams'),(437,'Sharpener'),(438,'Ruler'),(440,'Rugby'),(441,'Raisins'),(442,'Raisins'),(443,'Insenso'),(444,'Smoke belching'),(445,'powdered candy'),(446,'Car Freshener'),(447,'Blade'),(448,'Razors'),(449,'Macaroni'),(450,'Sealant'),(451,'Paper Bag'),(452,'Fruits'),(453,'Flavored Pops'),(454,'Sago'),(455,'beef meat'),(456,'DMPI MEAT'),(457,'PORK MEAT LOCAL'),(458,'Lumpia Wrapper'),(459,'Lumpia'),(460,'Broom & Scrub'),(461,'Liver'),(462,'Frozen Goods'),(463,'mosquitoes,flies and cockroaches'),(464,'mosquitoes,flies and cockroaches'),(465,'mosquitoes,flies and cockroaches'),(466,'pesticide'),(467,'Pinoy Sisig'),(468,'Vegetable Oil'),(469,'Sprayer'),(470,'Pot'),(471,'Dog Food'),(472,'Hair Color Cream'),(473,'Marker'),(475,'Empty Sack'),(476,'Empty Carton'),(477,'Dried fish'),(478,'Glue'),(479,'Dry Peas'),(480,'Corn'),(481,'Hair Polish'),(482,'Exfoliant'),(483,'bond paper'),(484,'Colored Paper'),(485,'Cartolina'),(486,'Glue'),(487,'Paste'),(488,'Pencil'),(489,'Eraser'),(490,'Clear book'),(491,'Gelatin'),(492,'Gelatin'),(493,'Stickglue'),(494,'Aniel'),(495,'Rice'),(496,'Feminine Wipes'),(497,'Baby Wipes'),(498,'Jam & Jellies'),(499,'Peanut Spread'),(500,'Soup'),(501,'Salad Macaroni'),(502,'Astringent'),(503,'Spaghetti Meat'),(504,'Bicol Express'),(505,'Manila Paper'),(506,'Facial Moisturizer'),(507,'Plovoron'),(508,'Polvoron'),(509,'Index Card'),(510,'Others'),(511,'Chicharon'),(512,'Pop-Corn'),(513,'Franks'),(514,'Meatballs'),(515,'Fruits & Vegetables'),(516,'Pliers'),(517,'Crushed'),(518,'Cereal Drinks'),(519,'Cellphone Cards'),(520,'LPG'),(521,'Baby bath'),(522,'Baby powder'),(524,'beer'),(525,'beer'),(526,'Processed Meats'),(527,'vegetables'),(528,'Ammonia'),(529,'Baby stag'),(530,'Petroleum Jelly'),(531,'Milk dispenser'),(532,'Medicine Feeder'),(533,'Blades'),(534,'Fly paper'),(536,'Egg Noodles'),(537,'Lamps'),(538,'Body wash'),(539,'milk products'),(540,'Paper napkins'),(541,'Paper Towel'),(543,'Isda'),(544,'Fish'),(545,'Board'),(546,'CHUNKS'),(547,'macaroni'),(548,'PINEAPPLE CANNED'),(549,'TIDBITS'),(550,'FRUIT COCKTAIL'),(551,'MIXED FRUIT'),(552,'SWEETENER'),(553,'MOP'),(554,'Ballpen'),(555,'chunky'),(556,'luncheon beef'),(557,'pork adobo'),(558,'pork adobo'),(559,'PORK ADOBO'),(560,'RAISINS'),(561,'almonds'),(562,'Wipes'),(563,'Hair Spray'),(565,'Palina'),(566,'Switch'),(567,'Junction Box & Cover'),(568,'Circuits'),(569,'Sterilized'),(570,'Corn'),(571,'tomato paste'),(572,'Lozenges'),(573,'Shampoo'),(574,'Alcohol'),(575,'Cheese Spread'),(576,'daily quezo'),(577,'MULTI-VITAMIN'),(578,'tequila'),(579,'LIGHTER'),(580,'Adobo'),(581,'Cotton pads'),(582,'Facial scrub'),(583,'flourescent starter'),(584,'price label'),(585,'Cocker\'s Case'),(586,'Cockers Case'),(587,'CD/DVD'),(588,'Tomato paste'),(589,'All-Purpose Cream'),(590,'Noodles'),(591,'Bell Pepper'),(592,'COCONUT'),(593,'Beans'),(595,'Viands'),(596,'Flourescent fixture'),(597,'Pineapple'),(598,'ICE POPS'),(599,'Bottle/Case Charges'),(600,'Pacas'),(601,'Whole'),(602,'DURIAN'),(603,'Waterer'),(604,'Crumbles'),(605,'Medicine'),(606,'Cosmetics'),(607,'Herbal Products'),(608,'Purified Water'),(609,'Dispenser'),(610,'Ready-made documents'),(611,'Fastener'),(612,'Pins'),(613,'Scissors'),(614,'Soap'),(615,'Cheese Powder'),(616,'Starter'),(617,'RECEPTACLE'),(618,'Outlet'),(619,'TOYS & OCCASSIONAL ITEMS'),(621,'biscuits'),(622,'biscuits'),(623,'banana'),(624,'Barbecue stick'),(625,'ballast'),(626,'Cellophane'),(627,'Stove'),(628,'Luncheon Meat'),(629,'Nuggets'),(630,'Candies'),(631,'Feeder'),(632,'Delicacies'),(634,'Sisig'),(635,'LOLLIPOPS'),(636,'yema'),(637,'Saging'),(638,'Lubi'),(639,'Albatross'),(641,'Vitamins'),(642,'Suspension'),(643,'Dog foods'),(644,'Dry goods'),(645,'Concentrate'),(646,'Afritada'),(647,'Family milk'),(648,'Nuts'),(649,'Creams'),(650,'Baby Lotion'),(651,'RTD milk'),(652,'Adaptor'),(653,'Plywood'),(654,'Soy sauce'),(655,'fresh pineapple'),(656,'Pregnancy test'),(657,'Extension Cord'),(658,'Chips'),(659,'Empty bottles'),(660,'Bagoong'),(661,'Mackerel'),(662,'Food Coloring'),(663,'Empty Containers'),(664,'scrap plastic'),(665,'Herbal products'),(666,'Dynapharm'),(667,'Pacific meat'),(668,'Slimming coffee/tea'),(669,'Nestle'),(670,'Selecta'),(671,'Magnolia'),(672,'Creamline'),(673,'Hair treatment'),(674,'Cdo'),(675,'Cdo'),(676,'Cdo Hotdog'),(677,'Purefoods'),(678,'SUNPRIDE'),(679,'VIRGINIA'),(680,'DARLING FOODS'),(681,'Royale'),(682,'Cat food'),(683,'Hand Sanitizer'),(684,'Car Accesories'),(685,'Shell Product'),(686,'Insect Repellent Lotion'),(687,'Swift'),(688,'soda'),(689,'hand soap'),(690,'Barcelona'),(691,'DETERGENT POWDER'),(692,'DETERGENT'),(693,'Sanitary Napkin'),(694,'Seasoning'),(695,'Baby Oil'),(696,'Olive'),(697,'Bread Crumbs'),(698,'Canned Fruits'),(699,'Adult Diaper'),(700,'Instant viand'),(701,'Manzanilla'),(702,'Hotcake Mix'),(704,'Drinking Water'),(705,'Alcoholic Drinks'),(706,'Chicken loaf'),(707,'Cigarrettes'),(708,'Aluminum Foil'),(709,'Bulb'),(710,'Veterinary Products'),(711,'Fresh Milk'),(712,'CUP CAKE'),(713,'Mamon'),(714,'Cleanser & Sprayer'),(715,'Gargle'),(716,'Skin Cleanser'),(717,'Toothpick'),(718,'Furniture Polish'),(719,'Consignment Goods'),(720,'BULAD'),(721,'Animal Medicine'),(722,'spray'),(723,'Spot Corrector'),(724,'Facial Toner'),(725,'Office & School Supplies'),(726,'Footware/Rain Gear'),(727,'Electrical/Hardware/Gardening'),(728,'Kitchen/Household Wares'),(729,'Electronic Gadgets/Accesories'),(730,'Men\'s Wear'),(732,'Men\'s & Lady\'s Accesories'),(735,'Textile/Curtains'),(736,'Sewing Notions'),(739,'Religious Items'),(740,'Infant wear'),(741,'DG Cosmetics'),(744,'Sports apparel/Accessories'),(745,'DG Consignment'),(746,'Prunes'),(747,'Plastic twine'),(748,'LECHON'),(749,'LOAD'),(750,'CONVENIENCE STORE ITEMS'),(751,'DG ICECREAM'),(752,'SLERS'),(753,'THERMOMETER'),(754,'coconutpowder'),(755,'CLINGWRAP'),(756,'DEL MONTE PRODUCTS');
/*!40000 ALTER TABLE `tb_inventory_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_group_item`
--

DROP TABLE IF EXISTS `tb_inventory_group_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_group_item` (
  `group_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  KEY `inventory_group_item_group_id_foreign` (`group_id`),
  KEY `inventory_group_item_item_id_foreign` (`item_id`),
  CONSTRAINT `inventory_group_item_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `tb_inventory_groups` (`id`),
  CONSTRAINT `inventory_group_item_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `tb_inventory_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_group_item`
--

LOCK TABLES `tb_inventory_group_item` WRITE;
/*!40000 ALTER TABLE `tb_inventory_group_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_inventory_group_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_groups`
--

DROP TABLE IF EXISTS `tb_inventory_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_groups_user_foreign` (`user`),
  KEY `inventory_groups_status_foreign` (`status`),
  CONSTRAINT `inventory_groups_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `inventory_groups_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_groups`
--

LOCK TABLES `tb_inventory_groups` WRITE;
/*!40000 ALTER TABLE `tb_inventory_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_inventory_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_item_types`
--

DROP TABLE IF EXISTS `tb_inventory_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_item_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_item_types`
--

LOCK TABLES `tb_inventory_item_types` WRITE;
/*!40000 ALTER TABLE `tb_inventory_item_types` DISABLE KEYS */;
INSERT INTO `tb_inventory_item_types` VALUES (1,'Inventory',''),(2,'Consignment',''),(3,'Dry Goods','');
/*!40000 ALTER TABLE `tb_inventory_item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_items`
--

DROP TABLE IF EXISTS `tb_inventory_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `points` decimal(9,2) DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL,
  `average_cost` decimal(9,2) DEFAULT 0.00,
  `order_cost` decimal(9,2) DEFAULT 0.00,
  `retail_price` decimal(9,2) DEFAULT 0.00,
  `wholesale_price` decimal(9,2) DEFAULT 0.00,
  `quantity` decimal(9,2) DEFAULT 0.00,
  `auto_fill_quantity` tinyint(1) DEFAULT 0,
  `item_type` int(10) unsigned NOT NULL,
  `vendor` int(10) unsigned NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_size` smallint(6) DEFAULT 0,
  `item_unit` int(10) unsigned NOT NULL,
  `item_brand` int(10) unsigned NOT NULL,
  `item_class` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_items_category_foreign` (`category`),
  CONSTRAINT `inventory_items_category_foreign` FOREIGN KEY (`category`) REFERENCES `tb_inventory_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_items`
--

LOCK TABLES `tb_inventory_items` WRITE;
/*!40000 ALTER TABLE `tb_inventory_items` DISABLE KEYS */;
INSERT INTO `tb_inventory_items` VALUES (1,1,'Tokens',NULL,NULL,NULL,NULL,1.00,0.00,0.00,0.00,0.00,0.00,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL),(2,1,'Socks',NULL,NULL,NULL,NULL,2.00,0.00,0.00,0.00,0.00,0.00,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL),(3,1,'Tickets',NULL,NULL,NULL,NULL,1.50,0.00,0.00,0.00,0.00,0.00,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL),(4,1,'Bibo Cards',NULL,NULL,NULL,NULL,10.00,0.00,0.00,0.00,0.00,0.00,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL),(5,1,'Piso',NULL,NULL,NULL,NULL,1.00,0.00,0.00,0.00,0.00,0.00,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL),(6,1,'Piso - Machine Initial',NULL,NULL,NULL,NULL,1.00,0.00,0.00,0.00,0.00,0.00,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL),(7,1,'Water',NULL,NULL,NULL,NULL,15.00,0.00,0.00,0.00,0.00,0.00,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL),(8,1,'Token-Gold',NULL,NULL,NULL,NULL,1.00,0.00,0.00,0.00,0.00,0.00,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL),(9,1,'Bibo Cards-VIP',NULL,NULL,NULL,NULL,10.00,0.00,0.00,0.00,0.00,0.00,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL),(10,1,'Denki Cards',NULL,NULL,NULL,NULL,10.00,0.00,0.00,0.00,0.00,0.00,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL),(11,2,'Toy',NULL,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `tb_inventory_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_transaction_types`
--

DROP TABLE IF EXISTS `tb_inventory_transaction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_transaction_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_transaction_types`
--

LOCK TABLES `tb_inventory_transaction_types` WRITE;
/*!40000 ALTER TABLE `tb_inventory_transaction_types` DISABLE KEYS */;
INSERT INTO `tb_inventory_transaction_types` VALUES (1,'Stock Out'),(2,'Stock In');
/*!40000 ALTER TABLE `tb_inventory_transaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_transactions`
--

DROP TABLE IF EXISTS `tb_inventory_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `department` int(10) unsigned DEFAULT NULL,
  `type` int(10) unsigned NOT NULL,
  `item` int(10) unsigned NOT NULL,
  `quantity` decimal(9,2) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_transactions_type_foreign` (`type`),
  KEY `inventory_transactions_item_foreign` (`item`),
  KEY `inventory_transactions_user_foreign` (`user`),
  KEY `inventory_transactions_subscription_foreign` (`subscription`),
  KEY `inventory_transactions_department_foreign` (`department`),
  CONSTRAINT `inventory_transactions_department_foreign` FOREIGN KEY (`department`) REFERENCES `tb_departments` (`id`),
  CONSTRAINT `inventory_transactions_item_foreign` FOREIGN KEY (`item`) REFERENCES `tb_inventory_items` (`id`),
  CONSTRAINT `inventory_transactions_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `inventory_transactions_type_foreign` FOREIGN KEY (`type`) REFERENCES `tb_inventory_transaction_types` (`id`),
  CONSTRAINT `inventory_transactions_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_transactions`
--

LOCK TABLES `tb_inventory_transactions` WRITE;
/*!40000 ALTER TABLE `tb_inventory_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_inventory_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_vendors`
--

DROP TABLE IF EXISTS `tb_inventory_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_vendors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `user` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_vendors`
--

LOCK TABLES `tb_inventory_vendors` WRITE;
/*!40000 ALTER TABLE `tb_inventory_vendors` DISABLE KEYS */;
INSERT INTO `tb_inventory_vendors` VALUES (1,'Default','','','','',1,2,'2018-06-24 10:58:36','2018-06-24 10:58:36');
/*!40000 ALTER TABLE `tb_inventory_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_invoice_details`
--

DROP TABLE IF EXISTS `tb_invoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_invoice_details` (
  `controlno` int(10) unsigned NOT NULL,
  `subscription` int(10) unsigned NOT NULL,
  `client` int(10) unsigned NOT NULL,
  `item` int(10) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` decimal(9,2) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `tax` decimal(9,2) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `invoice_details_controlno_foreign` (`controlno`),
  KEY `invoice_details_subscription_foreign` (`subscription`),
  KEY `invoice_details_client_foreign` (`client`),
  CONSTRAINT `invoice_details_client_foreign` FOREIGN KEY (`client`) REFERENCES `tb_clients` (`id`),
  CONSTRAINT `invoice_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_invoice_summary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoice_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_invoice_details`
--

LOCK TABLES `tb_invoice_details` WRITE;
/*!40000 ALTER TABLE `tb_invoice_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_invoice_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_invoice_summary`
--

DROP TABLE IF EXISTS `tb_invoice_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_invoice_summary` (
  `id` int(10) unsigned NOT NULL,
  `subscription` int(10) unsigned NOT NULL,
  `client` int(10) unsigned NOT NULL,
  `order_no` bigint(20) NOT NULL DEFAULT 0,
  `invoice_at` date NOT NULL,
  `payment_due_at` date NOT NULL,
  `remarks` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`subscription`,`client`,`order_no`,`invoice_at`,`payment_due_at`),
  KEY `invoice_summary_subscription_foreign` (`subscription`),
  KEY `invoice_summary_client_foreign` (`client`),
  KEY `invoice_summary_user_foreign` (`user`),
  KEY `invoice_summary_status_foreign` (`status`),
  CONSTRAINT `invoice_summary_client_foreign` FOREIGN KEY (`client`) REFERENCES `tb_clients` (`id`),
  CONSTRAINT `invoice_summary_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `invoice_summary_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `invoice_summary_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_invoice_summary`
--

LOCK TABLES `tb_invoice_summary` WRITE;
/*!40000 ALTER TABLE `tb_invoice_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_invoice_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_job_statuses`
--

DROP TABLE IF EXISTS `tb_job_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_job_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `progress_now` int(11) NOT NULL DEFAULT 0,
  `progress_max` int(11) NOT NULL DEFAULT 0,
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'queued',
  `input` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `output` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_statuses_job_id_index` (`job_id`),
  KEY `job_statuses_type_index` (`type`),
  KEY `job_statuses_queue_index` (`queue`),
  KEY `job_statuses_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_job_statuses`
--

LOCK TABLES `tb_job_statuses` WRITE;
/*!40000 ALTER TABLE `tb_job_statuses` DISABLE KEYS */;
INSERT INTO `tb_job_statuses` VALUES (1,'1','App\\Jobs\\StoreEbayMyMessagesJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 10:35:36','2018-05-21 11:03:02','2018-05-21 11:02:56','2018-05-21 11:03:02'),(2,'2','App\\Jobs\\StoreEbayMemberMessagesJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 10:35:36','2018-05-21 11:03:03','2018-05-21 11:03:03','2018-05-21 11:03:03'),(3,'3','App\\Jobs\\StoreEbayMyMessagesJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 10:35:36','2018-05-21 11:03:05','2018-05-21 11:03:03','2018-05-21 11:03:05'),(4,'4','App\\Jobs\\StoreEbayMemberMessagesJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 10:35:36','2018-05-21 11:03:06','2018-05-21 11:03:06','2018-05-21 11:03:06'),(5,'5','App\\Jobs\\StoreEbayOrdersJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 10:35:36','2018-05-21 11:03:38','2018-05-21 11:03:06','2018-05-21 11:03:38'),(6,'18','App\\Jobs\\StoreEbayOrdersJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 10:35:36','2018-05-21 13:10:16','2018-05-21 13:09:25','2018-05-21 13:10:16'),(7,'7','App\\Jobs\\StoreEbayResolutionCenterJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 10:35:36','2018-05-21 11:20:37','2018-05-21 11:20:35','2018-05-21 11:20:37'),(8,'17','App\\Jobs\\StoreEbayResolutionCenterJob','default',1,0,0,'failed',NULL,NULL,'2018-05-21 10:35:36','2018-05-21 13:09:25','2018-05-21 13:09:22','2018-05-21 13:09:25'),(9,'9','App\\Jobs\\StoreEbayMyMessagesJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 12:33:05','2018-05-21 13:00:36','2018-05-21 13:00:25','2018-05-21 13:00:36'),(10,'10','App\\Jobs\\StoreEbayMemberMessagesJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 12:33:05','2018-05-21 13:00:36','2018-05-21 13:00:36','2018-05-21 13:00:36'),(11,'11','App\\Jobs\\StoreEbayMyMessagesJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 12:33:05','2018-05-21 13:00:41','2018-05-21 13:00:37','2018-05-21 13:00:41'),(12,'12','App\\Jobs\\StoreEbayMemberMessagesJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 12:33:05','2018-05-21 13:00:41','2018-05-21 13:00:41','2018-05-21 13:00:41'),(13,'13','App\\Jobs\\StoreEbayOrdersJob','default',2,0,0,'failed',NULL,NULL,'2018-05-21 12:33:05','2018-05-21 13:08:48','2018-05-21 13:08:48','2018-05-21 13:08:48'),(14,'14','App\\Jobs\\StoreEbayOrdersJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 12:33:05','2018-05-21 13:09:17','2018-05-21 13:08:48','2018-05-21 13:09:17'),(15,'15','App\\Jobs\\StoreEbayResolutionCenterJob','default',1,0,0,'finished',NULL,NULL,'2018-05-21 12:33:05','2018-05-21 13:09:19','2018-05-21 13:09:17','2018-05-21 13:09:19'),(16,'16','App\\Jobs\\StoreEbayResolutionCenterJob','default',1,0,0,'failed',NULL,NULL,'2018-05-21 12:33:05','2018-05-21 13:09:22','2018-05-21 13:09:20','2018-05-21 13:09:22'),(17,NULL,'App\\Jobs\\StoreEbayMyMessagesJob',NULL,0,0,0,'queued',NULL,NULL,'2018-05-21 18:08:17','2018-05-21 18:08:17',NULL,NULL),(18,NULL,'App\\Jobs\\StoreEbayMemberMessagesJob',NULL,0,0,0,'queued',NULL,NULL,'2018-05-21 18:08:17','2018-05-21 18:08:17',NULL,NULL),(19,NULL,'App\\Jobs\\StoreEbayMyMessagesJob',NULL,0,0,0,'queued',NULL,NULL,'2018-05-21 18:08:17','2018-05-21 18:08:17',NULL,NULL),(20,NULL,'App\\Jobs\\StoreEbayMemberMessagesJob',NULL,0,0,0,'queued',NULL,NULL,'2018-05-21 18:08:17','2018-05-21 18:08:17',NULL,NULL),(21,NULL,'App\\Jobs\\StoreEbayOrdersJob',NULL,0,0,0,'queued',NULL,NULL,'2018-05-21 18:08:17','2018-05-21 18:08:17',NULL,NULL),(22,NULL,'App\\Jobs\\StoreEbayOrdersJob',NULL,0,0,0,'queued',NULL,NULL,'2018-05-21 18:08:17','2018-05-21 18:08:17',NULL,NULL),(23,NULL,'App\\Jobs\\StoreEbayResolutionCenterJob',NULL,0,0,0,'queued',NULL,NULL,'2018-05-21 18:08:17','2018-05-21 18:08:17',NULL,NULL),(24,NULL,'App\\Jobs\\StoreEbayResolutionCenterJob',NULL,0,0,0,'queued',NULL,NULL,'2018-05-21 18:08:17','2018-05-21 18:08:17',NULL,NULL),(25,NULL,'App\\Jobs\\StoreEbayFeedbackJob',NULL,0,0,0,'queued',NULL,NULL,'2018-05-21 18:08:17','2018-05-21 18:08:17',NULL,NULL),(26,NULL,'App\\Jobs\\StoreEbayFeedbackJob',NULL,0,0,0,'queued',NULL,NULL,'2018-05-21 18:08:17','2018-05-21 18:08:17',NULL,NULL);
/*!40000 ALTER TABLE `tb_job_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_jobs`
--

DROP TABLE IF EXISTS `tb_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_jobs`
--

LOCK TABLES `tb_jobs` WRITE;
/*!40000 ALTER TABLE `tb_jobs` DISABLE KEYS */;
INSERT INTO `tb_jobs` VALUES (1,'default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayMyMessagesJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayMyMessagesJob\",\"command\":\"O:31:\\\"App\\\\Jobs\\\\StoreEbayMyMessagesJob\\\":15:{s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMyMessagesJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:38:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMyMessagesJob\\u0000today\\\";N;s:46:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMyMessagesJob\\u0000ebay_messages\\\";N;s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMyMessagesJob\\u0000ebay_config\\\";N;s:48:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMyMessagesJob\\u0000trading_service\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:17;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}',0,NULL,1526897297,1526897297),(2,'default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayMemberMessagesJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayMemberMessagesJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\\":16:{s:48:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:42:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000today\\\";N;s:50:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000ebay_messages\\\";N;s:48:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000ebay_config\\\";N;s:52:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000trading_service\\\";N;s:48:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000page_number\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:18;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}',0,NULL,1526897297,1526897297),(3,'default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayMyMessagesJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayMyMessagesJob\",\"command\":\"O:31:\\\"App\\\\Jobs\\\\StoreEbayMyMessagesJob\\\":15:{s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMyMessagesJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:38:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMyMessagesJob\\u0000today\\\";N;s:46:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMyMessagesJob\\u0000ebay_messages\\\";N;s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMyMessagesJob\\u0000ebay_config\\\";N;s:48:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMyMessagesJob\\u0000trading_service\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:19;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}',0,NULL,1526897297,1526897297),(4,'default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayMemberMessagesJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayMemberMessagesJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\\":16:{s:48:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:42:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000today\\\";N;s:50:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000ebay_messages\\\";N;s:48:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000ebay_config\\\";N;s:52:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000trading_service\\\";N;s:48:\\\"\\u0000App\\\\Jobs\\\\StoreEbayMemberMessagesJob\\u0000page_number\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:20;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}',0,NULL,1526897297,1526897297),(5,'default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayOrdersJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayOrdersJob\",\"command\":\"O:27:\\\"App\\\\Jobs\\\\StoreEbayOrdersJob\\\":14:{s:40:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:34:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000order\\\";N;s:40:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000ebay_config\\\";N;s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000trading_service\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:21;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}',0,NULL,1526897297,1526897297),(6,'default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayOrdersJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayOrdersJob\",\"command\":\"O:27:\\\"App\\\\Jobs\\\\StoreEbayOrdersJob\\\":14:{s:40:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:34:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000order\\\";N;s:40:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000ebay_config\\\";N;s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayOrdersJob\\u0000trading_service\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:22;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}',0,NULL,1526897297,1526897297),(7,'default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\",\"command\":\"O:37:\\\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\\":15:{s:50:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:54:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000trading_service\\\";N;s:50:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000ebay_config\\\";N;s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000order\\\";N;s:56:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000resolution_center\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:23;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}',0,NULL,1526897297,1526897297),(8,'default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\",\"command\":\"O:37:\\\"App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\\":15:{s:50:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:54:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000trading_service\\\";N;s:50:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000ebay_config\\\";N;s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000order\\\";N;s:56:\\\"\\u0000App\\\\Jobs\\\\StoreEbayResolutionCenterJob\\u0000resolution_center\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:24;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}',0,NULL,1526897297,1526897297),(9,'default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayFeedbackJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayFeedbackJob\",\"command\":\"O:29:\\\"App\\\\Jobs\\\\StoreEbayFeedbackJob\\\":15:{s:42:\\\"\\u0000App\\\\Jobs\\\\StoreEbayFeedbackJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayFeedbackJob\\u0000ebay_feedback\\\";N;s:47:\\\"\\u0000App\\\\Jobs\\\\StoreEbayFeedbackJob\\u0000feedback_details\\\";N;s:42:\\\"\\u0000App\\\\Jobs\\\\StoreEbayFeedbackJob\\u0000ebay_config\\\";N;s:46:\\\"\\u0000App\\\\Jobs\\\\StoreEbayFeedbackJob\\u0000trading_service\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:25;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}',0,NULL,1526897297,1526897297),(10,'default','{\"displayName\":\"App\\\\Jobs\\\\StoreEbayFeedbackJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StoreEbayFeedbackJob\",\"command\":\"O:29:\\\"App\\\\Jobs\\\\StoreEbayFeedbackJob\\\":15:{s:42:\\\"\\u0000App\\\\Jobs\\\\StoreEbayFeedbackJob\\u0000ebayAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\EbayAccount\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:44:\\\"\\u0000App\\\\Jobs\\\\StoreEbayFeedbackJob\\u0000ebay_feedback\\\";N;s:47:\\\"\\u0000App\\\\Jobs\\\\StoreEbayFeedbackJob\\u0000feedback_details\\\";N;s:42:\\\"\\u0000App\\\\Jobs\\\\StoreEbayFeedbackJob\\u0000ebay_config\\\";N;s:46:\\\"\\u0000App\\\\Jobs\\\\StoreEbayFeedbackJob\\u0000trading_service\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}s:11:\\\"\\u0000*\\u0000statusId\\\";i:26;s:14:\\\"\\u0000*\\u0000progressNow\\\";i:0;s:14:\\\"\\u0000*\\u0000progressMax\\\";i:0;}\"}}',0,NULL,1526897297,1526897297);
/*!40000 ALTER TABLE `tb_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_laboratory_details`
--

DROP TABLE IF EXISTS `tb_laboratory_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_laboratory_details` (
  `id` int(11) unsigned zerofill NOT NULL,
  `client` int(11) unsigned zerofill NOT NULL,
  `transactionrefno` int(11) unsigned zerofill NOT NULL,
  `accountclass` int(11) NOT NULL,
  `accounttype` int(11) unsigned NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `transactiontag` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`client`,`transactionrefno`,`accounttype`,`accountclass`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_laboratory_details`
--

LOCK TABLES `tb_laboratory_details` WRITE;
/*!40000 ALTER TABLE `tb_laboratory_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_laboratory_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_laboratory_results`
--

DROP TABLE IF EXISTS `tb_laboratory_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_laboratory_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `laboratoryid` int(11) NOT NULL,
  `client` int(11) unsigned zerofill NOT NULL,
  `resultcategory` int(11) NOT NULL,
  `resulttype` int(11) NOT NULL,
  `resultvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_laboratory_results`
--

LOCK TABLES `tb_laboratory_results` WRITE;
/*!40000 ALTER TABLE `tb_laboratory_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_laboratory_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_laboratory_summary`
--

DROP TABLE IF EXISTS `tb_laboratory_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_laboratory_summary` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `client` int(11) unsigned zerofill NOT NULL,
  `transactionrefno` int(11) unsigned zerofill NOT NULL,
  `transactiontype` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`client`,`transactionrefno`,`transactiontype`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_laboratory_summary`
--

LOCK TABLES `tb_laboratory_summary` WRITE;
/*!40000 ALTER TABLE `tb_laboratory_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_laboratory_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_leave_transactions`
--

DROP TABLE IF EXISTS `tb_leave_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_leave_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `leavetype` int(10) unsigned NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dayoption` enum('WD','AM','PM') COLLATE utf8_unicode_ci NOT NULL,
  `iswholeday` int(11) NOT NULL,
  `holidays` int(11) NOT NULL,
  `supervisor` int(10) unsigned DEFAULT NULL,
  `supervisor_status` int(10) unsigned DEFAULT NULL,
  `supervisor_approved_at` datetime NOT NULL,
  `manager` int(10) unsigned DEFAULT NULL,
  `manager_status` int(10) unsigned DEFAULT NULL,
  `manager_approved_at` datetime NOT NULL,
  `user` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `leave_transactions_employee_foreign` (`employee`),
  KEY `leave_transactions_subscription_foreign` (`subscription`),
  KEY `leave_transactions_leavetype_foreign` (`leavetype`),
  KEY `manager_status` (`manager_status`),
  KEY `supervisor_status` (`supervisor_status`),
  KEY `supervisor` (`supervisor`),
  KEY `manager` (`manager`),
  KEY `leave_transactions_user_foreign` (`user`),
  CONSTRAINT `leave_transactions_leavetype_foreign` FOREIGN KEY (`leavetype`) REFERENCES `tb_leave_types` (`id`),
  CONSTRAINT `leave_transactions_manager_foreign` FOREIGN KEY (`manager`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `leave_transactions_manager_status_foreign` FOREIGN KEY (`manager_status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `leave_transactions_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `leave_transactions_supervisor_foreign` FOREIGN KEY (`supervisor`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `leave_transactions_supervisor_status_foreign` FOREIGN KEY (`supervisor_status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `leave_transactions_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `tb_leave_transactions_ibfk_1` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_leave_transactions`
--

LOCK TABLES `tb_leave_transactions` WRITE;
/*!40000 ALTER TABLE `tb_leave_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_leave_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_leave_types`
--

DROP TABLE IF EXISTS `tb_leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_leave_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `is_with_pay` smallint(6) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_payroll_included` smallint(6) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `leave_types_subscription_foreign` (`subscription`),
  KEY `leave_types_user_foreign` (`user`),
  CONSTRAINT `leave_types_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `leave_types_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_leave_types`
--

LOCK TABLES `tb_leave_types` WRITE;
/*!40000 ALTER TABLE `tb_leave_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_loan_details`
--

DROP TABLE IF EXISTS `tb_loan_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_loan_details` (
  `controlno` int(10) unsigned NOT NULL,
  `subscription` int(10) unsigned NOT NULL,
  `documentno` int(11) NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `client` int(11) NOT NULL,
  `accountno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  PRIMARY KEY (`controlno`,`subscription`,`documentno`,`employee`),
  KEY `loan_details_subscription_foreign` (`subscription`),
  KEY `loan_details_employee_foreign` (`employee`),
  CONSTRAINT `loan_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_loan_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_details_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `loan_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_loan_details`
--

LOCK TABLES `tb_loan_details` WRITE;
/*!40000 ALTER TABLE `tb_loan_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_loan_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_loan_summary`
--

DROP TABLE IF EXISTS `tb_loan_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_loan_summary` (
  `controlno` int(10) unsigned NOT NULL,
  `subscription` int(10) unsigned NOT NULL,
  `documentno` int(11) NOT NULL,
  `store` int(10) unsigned NOT NULL,
  `period` date NOT NULL,
  `payrollstart` date NOT NULL,
  `payrollend` date NOT NULL,
  `deduction_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `posted_by` int(10) unsigned NOT NULL,
  `posted_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`,`subscription`,`documentno`,`store`,`period`),
  KEY `loan_summary_subscription_foreign` (`subscription`),
  KEY `loan_summary_store_foreign` (`store`),
  KEY `loan_summary_user_foreign` (`user`),
  CONSTRAINT `loan_summary_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `loan_summary_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_loan_summary`
--

LOCK TABLES `tb_loan_summary` WRITE;
/*!40000 ALTER TABLE `tb_loan_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_loan_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_marital_statuses`
--

DROP TABLE IF EXISTS `tb_marital_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_marital_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_marital_statuses`
--

LOCK TABLES `tb_marital_statuses` WRITE;
/*!40000 ALTER TABLE `tb_marital_statuses` DISABLE KEYS */;
INSERT INTO `tb_marital_statuses` VALUES (1,'Single'),(2,'Married'),(3,'Widowed'),(4,'Separated'),(5,'Divorced'),(6,'N/A');
/*!40000 ALTER TABLE `tb_marital_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_math_operators`
--

DROP TABLE IF EXISTS `tb_math_operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_math_operators` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_math_operators`
--

LOCK TABLES `tb_math_operators` WRITE;
/*!40000 ALTER TABLE `tb_math_operators` DISABLE KEYS */;
INSERT INTO `tb_math_operators` VALUES (1,'Add','+'),(2,'Subtract','-'),(3,'Multiply','*'),(4,'Divide','/'),(5,'Open Parenthesis','('),(6,'Close Parenthesis',')');
/*!40000 ALTER TABLE `tb_math_operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medical_types`
--

DROP TABLE IF EXISTS `tb_medical_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_medical_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medical_types`
--

LOCK TABLES `tb_medical_types` WRITE;
/*!40000 ALTER TABLE `tb_medical_types` DISABLE KEYS */;
INSERT INTO `tb_medical_types` VALUES (1,'Xray',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Urine',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Hepa',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Health card',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Drug test',2,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_medical_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_memorandums`
--

DROP TABLE IF EXISTS `tb_memorandums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_memorandums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `memorandums_user_foreign` (`user`),
  KEY `memorandums_subscription_foreign` (`subscription`),
  KEY `memorandums_status_foreign` (`status`),
  CONSTRAINT `memorandums_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `memorandums_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `memorandums_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_memorandums`
--

LOCK TABLES `tb_memorandums` WRITE;
/*!40000 ALTER TABLE `tb_memorandums` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_memorandums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sequence` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,'Dashboard','dashboard','fa fa-dashboard',1,1,'0000-00-00 00:00:00','2018-03-30 21:12:36'),(2,'Clients','clients','fa fa-users',2,1,'0000-00-00 00:00:00','2018-06-04 03:16:57'),(3,'Sales','#','fa fa-money',4,1,'0000-00-00 00:00:00','2017-02-13 15:00:07'),(4,'Accounting','#','fa fa-book',7,1,'0000-00-00 00:00:00','2017-02-13 13:59:33'),(5,'AR / Loans','#','fa fa-flag',5,1,'0000-00-00 00:00:00','2017-02-13 13:44:36'),(6,'Purchases','#','fa fa-shopping-cart',6,1,'0000-00-00 00:00:00','2017-02-13 15:02:12'),(7,'Payroll','#','fa fa-tasks',8,1,'0000-00-00 00:00:00','2015-12-05 18:15:51'),(8,'Reports','#','fa fa-line-chart',13,1,'0000-00-00 00:00:00','2021-01-09 11:04:31'),(9,'Setup','#','fa fa-gear',15,1,'0000-00-00 00:00:00','2018-03-17 11:34:26'),(10,'System','#','fa fa-wrench',15,1,'0000-00-00 00:00:00','2018-03-04 03:10:16'),(11,'Inventory','inventory','fa fa-truck',12,1,'0000-00-00 00:00:00','2018-07-08 11:02:16'),(12,'Employee','#','fa fa-users',7,1,'0000-00-00 00:00:00','2017-04-26 20:28:46'),(13,'Office','#','fa fa-briefcase',10,1,'0000-00-00 00:00:00','2017-04-26 20:35:11'),(14,'Asset Mgt','#','fa fa-desktop',11,1,'0000-00-00 00:00:00','2017-04-26 20:22:09'),(15,'Subscriptions','subscriptions','fa fa-shopping-cart',3,1,'2015-11-25 17:53:16','2017-02-13 14:00:44'),(16,'Billing','billing','fa fa-newspaper-o',2,1,'2015-12-05 18:17:58','2018-07-08 10:58:19'),(18,'Card Retailers','retailers','ion ion-card',9,1,'2017-02-13 14:59:28','2017-10-11 09:13:09'),(19,'Employee Settings','#','ion ion-settings',16,1,'2017-04-13 09:45:39','2017-04-13 10:30:07'),(20,'Gov\'t Setup','#','ion ion-settings',17,1,'2017-04-13 10:14:20','2017-04-13 10:20:29'),(21,'Messages','messages','fa fa-inbox',10,2,'2018-02-16 19:22:50','2018-05-22 16:41:50'),(22,'Shipping 缺货','shipping-requests','fa fa-truck',9,2,'2018-02-26 12:16:12','2018-05-22 16:41:35'),(23,'Paypal Transactions','paypal-transactions','fa fa-paypal',14,1,'2018-03-01 06:08:29','2018-05-22 16:53:13'),(24,'Orders','orders','fa fa-shopping-cart',12,2,'2018-03-02 10:24:24','2018-05-22 16:42:00'),(25,'Resolution Center','resolution-center','fa fa-life-saver',13,2,'2018-03-17 11:33:44','2018-05-22 16:42:11'),(26,'Feedback','feedback','fa fa-comments',13,2,'2018-04-08 20:22:51','2018-05-22 16:42:18'),(27,'Rooms','rooms','fa fa-bed',2,1,'2018-05-22 16:51:08','2018-05-22 16:51:08'),(28,'Reservations','reservations','fa fa-folder',3,1,'2018-05-22 16:51:34','2018-05-23 01:33:29'),(29,'Parking','parking','fa fa-car',5,1,'2018-05-22 16:57:38','2018-05-22 16:57:38'),(30,'Restaurant','restaurant','fa fa-cutlery',6,1,'2018-05-22 16:59:31','2018-05-22 16:59:31'),(31,'Events','events','fa fa-futbol-o',5,1,'2018-05-22 21:41:20','2018-05-22 21:41:20'),(32,'Calendar','calendar','fa fa-calendar',6,1,'2018-05-23 01:32:15','2018-05-23 01:32:15'),(33,'Check-In Reports','check-in-reports','fa fa-address-book',4,2,'2020-11-07 17:38:27','2021-01-09 10:57:27'),(34,'Room Rules','room-rules','fa fa-ban',7,1,'2020-11-07 17:38:58','2020-11-07 17:38:58'),(35,'Room Categories','room-categories','fa fa-bed',7,1,'2021-02-06 19:16:46','2021-02-06 19:16:46');
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu_submenu`
--

DROP TABLE IF EXISTS `tb_menu_submenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_menu_submenu` (
  `menu_id` int(10) unsigned NOT NULL,
  `submenu_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`menu_id`,`submenu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu_submenu`
--

LOCK TABLES `tb_menu_submenu` WRITE;
/*!40000 ALTER TABLE `tb_menu_submenu` DISABLE KEYS */;
INSERT INTO `tb_menu_submenu` VALUES (3,77),(3,78),(3,79),(3,80),(4,5),(4,17),(4,73),(4,74),(6,28),(6,81),(6,82),(7,32),(7,37),(7,53),(7,55),(7,60),(8,98),(8,111),(9,9),(9,10),(9,11),(9,28),(9,61),(9,65),(9,66),(9,67),(9,70),(9,71),(9,72),(9,87),(9,88),(9,89),(9,95),(9,96),(9,97),(9,99),(9,101),(9,104),(9,105),(10,22),(10,23),(10,57),(10,59),(10,106),(12,38),(12,39),(12,40),(12,41),(12,51),(12,54),(13,42),(13,43),(14,44),(14,45),(14,46),(19,33),(19,62),(19,63),(19,68),(19,91),(20,34),(20,35),(20,36),(20,64),(20,86);
/*!40000 ALTER TABLE `tb_menu_submenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_message_temp_categories`
--

DROP TABLE IF EXISTS `tb_message_temp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_message_temp_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_message_temp_categories`
--

LOCK TABLES `tb_message_temp_categories` WRITE;
/*!40000 ALTER TABLE `tb_message_temp_categories` DISABLE KEYS */;
INSERT INTO `tb_message_temp_categories` VALUES (1,'Hold Shipping',NULL,NULL),(2,'Shipping Queries',NULL,NULL),(3,'Messages',NULL,NULL),(4,'Orders',NULL,NULL),(5,'Feedback',NULL,NULL),(6,'Auto Reply',NULL,NULL);
/*!40000 ALTER TABLE `tb_message_temp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_message_template`
--

DROP TABLE IF EXISTS `tb_message_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_message_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_message_template`
--

LOCK TABLES `tb_message_template` WRITE;
/*!40000 ALTER TABLE `tb_message_template` DISABLE KEYS */;
INSERT INTO `tb_message_template` VALUES (1,'Thank you Message','Thank you very much.',3,'2018-03-03 18:04:48','2018-03-04 04:23:17'),(2,'Change Order','Change color',2,'2018-03-03 18:04:48','2018-03-04 04:19:44'),(3,'OOS','Out of Stock',1,'2018-03-03 18:04:48','2018-03-04 00:24:14'),(4,'Separate Shipping','because lose weight, we need separate 3 orders to ship',1,'2018-03-04 04:17:08','2018-03-04 04:17:08'),(5,'Item Change','can tell buyer return back,still oos , wait have stock or change to other listing with same price in the store',1,'2018-03-04 04:17:46','2018-03-04 04:17:46'),(6,'Ok To Ship','OK TO SHIP',2,'2018-03-04 04:18:35','2018-03-04 04:18:35'),(7,'Tracking and Ship Date','Tracking and Ship Date',2,'2018-03-04 04:20:37','2018-03-04 04:20:37'),(8,'Pre Shipment','Pre Shipment',2,'2018-03-04 04:20:51','2018-03-04 04:20:51'),(9,'Confirm the Address','Please confirm the address',2,'2018-03-04 04:21:27','2018-03-04 04:21:27'),(10,'Hold','Hold',2,'2018-03-04 04:22:02','2018-03-04 04:22:02'),(11,'Change Address','Change Address',2,'2018-03-04 04:22:16','2018-03-04 04:22:16'),(12,'Cancel Order','Cancel Order',2,'2018-03-04 04:22:31','2018-03-04 04:22:31'),(13,'Replacement','Replacement',2,'2018-03-04 04:22:42','2018-03-04 04:22:42'),(14,'OOS','Out of stock',2,'2018-03-04 04:22:58','2018-03-04 04:22:58'),(15,'Shipped','has been shipped.',3,'2018-04-12 23:50:09','2018-04-12 23:50:09');
/*!40000 ALTER TABLE `tb_message_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_message_to_multiple`
--

DROP TABLE IF EXISTS `tb_message_to_multiple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_message_to_multiple` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_to_multiple_buyer_id_foreign` (`buyer_id`),
  CONSTRAINT `message_to_multiple_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `tb_ebay_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_message_to_multiple`
--

LOCK TABLES `tb_message_to_multiple` WRITE;
/*!40000 ALTER TABLE `tb_message_to_multiple` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_message_to_multiple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_migrations`
--

DROP TABLE IF EXISTS `tb_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_migrations`
--

LOCK TABLES `tb_migrations` WRITE;
/*!40000 ALTER TABLE `tb_migrations` DISABLE KEYS */;
INSERT INTO `tb_migrations` VALUES ('2014_10_14_115449_create_client_table',1),('2014_10_14_131235_create_gender_table',2),('2014_10_14_132803_create_marital_statuses_table',3),('2014_10_14_132917_create_statuses_table',4),('2014_10_14_133008_create_users_table',4),('2014_10_14_133458_update_users_table',5),('2014_10_15_033448_create_transaction_summary_table',6),('2014_10_15_034234_create_transaction_details_table',6),('2014_10_15_041912_create_transaction_modules_table',7),('2014_10_15_041934_create_transaction_types_table',7),('2014_10_15_042020_create_payment_forms_table',7),('2014_10_15_042047_create_transaction_tags_table',7),('2014_10_15_043213_update_transaction_tags_table',8),('2014_10_15_060030_create_glaccount_levels_table',9),('2014_10_15_060051_create_glaccount_types_table',9),('2014_10_15_060109_create_glaccounts_table',9),('2014_10_15_065136_alter_glaccounts_table',10),('2014_10_15_143913_create_glcontrol_table',11),('2014_10_15_144615_alter_account_types_table',12),('2014_10_17_022907_add_new_column_transaction_tags',13),('2014_10_17_105948_create_transdetails_fkeys',14),('2014_10_17_122945_create_transtype_fkeys',15),('2014_10_17_150005_entrust_setup_tables',16),('2014_10_18_014313_add_class_column_to_roles',17),('2014_10_18_014942_add_class_column_to_permissions',18),('2014_10_21_223010_create_laboratory_summary_table',19),('2014_10_21_223034_create_laboratory_details_table',19),('2014_10_21_231014_create_laboratory_details_fkeys',19),('2014_10_22_001247_add_new_column_account_classes',20),('2014_10_22_024510_alter_table_laboratory_summary',20),('2014_10_22_024630_alter_table_laboratory_details_transtag',20),('2014_10_23_124905_add_new_status_column_trans_type',21),('2014_10_23_145718_add_refno_trans_dtl',22),('2014_10_23_204830_add_updated_at_trans_dtls',23),('2014_10_23_224222_add_glaccount_user_table',24),('2014_10_27_113030_add_updated_at_column_accounts',25),('2014_10_28_154849_gl_sum_table',26),('2014_10_28_160627_gl_details_table',26),('2014_10_28_223948_add_accountclass_trans_details',27),('2014_10_28_224940_add_account_class_laboratory_details',28),('2014_10_28_225347_account_sum_details_fkeys',29),('2014_10_28_225630_gl_sum_details_fkeys',30),('2014_10_29_172808_updated_at_column_trans_sum',31),('2014_10_29_194942_add_columns_gl_summary',32),('2014_10_30_004526_account_entry_glcontrol',33),('2014_10_30_010058_create_table_sub_accounts',34),('2014_10_30_010113_create_table_sub_account_types',34),('2014_10_30_111648_create_table_glentry_types',35),('2014_10_30_112037_add_glentry_type_glcontrols',36),('2014_10_30_172656_add_trans_module_acct_types',37),('2014_10_30_194222_add_acct_class_accounts',38),('2014_10_30_194552_add_acct_class_account_sum',39),('2014_10_30_201306_add_updated_at_account_sum_dtl',40),('2014_11_04_161933_create_front_office_table',41),('2014_11_04_162016_create_front_office_settings_table',41),('2014_11_07_144949_add_column_users_table',42),('2014_11_11_110728_add_control_no_front_office',43),('2014_11_13_143236_create_table_result_settings',44),('2014_11_13_145210_create_table_result_controls',45),('2014_11_13_150620_create_table_result_categories',45),('2014_11_13_152427_add_category_column_result_settings',46),('2014_11_13_164332_rename_result_settings_table',47),('2014_11_13_222130_create_laboratory_results_table',48),('2014_11_15_174905_add_sequence_column_tr_modules',49),('2014_11_17_110105_create_table_units',50),('2014_11_17_112937_create_table_supplier',51),('2014_11_17_124051_create_table_products',52),('2014_11_17_133740_create_table_product_price',53),('2014_11_17_134115_create_table_product_supplier',53),('2014_11_17_135546_create_table_product_transactions',53),('2014_11_17_145133_create_table_business_type',54),('2014_11_17_153720_add_supplierdate_col',55),('2014_11_18_134257_create_entry_types_table',56),('2014_11_18_141726_create_delivery_summary_table',57),('2014_11_18_141744_create_delivery_details_table',57),('2014_11_18_144208_add_delivery_dtl_fkeys',58),('2014_11_20_224522_add_location_products',59),('2014_11_21_111610_add_cols_supplier',60),('2014_11_25_134632_create_price_types_table',61),('2014_11_25_135109_add_price_type_cols_product_price',61),('2014_11_28_153150_add_unticost_delivery_details',62),('2014_12_02_151531_add_cols_product_trans',63),('2014_12_05_001134_add_avatar_col_users',64),('2014_12_06_150730_create_employees_table',65),('2014_12_06_154907_create_league_table',66),('2014_12_06_155403_create_trainer_table',67),('2014_12_06_155720_create_emptype_table',67),('2014_12_06_183556_create_league_time_settings_table',68),('2014_12_06_210313_create_league_time_records_table',69),('2014_12_06_210939_create_time_record_types_table',69),('2014_12_07_120802_create_league_user_table',70),('2014_12_18_162333_add_columns_products_table',71),('2014_12_31_112405_add_backups_table',72),('2015_01_07_002114_add_column_account_classes',72),('2015_01_10_230304_add_system_table',72),('2015_02_10_141619_add_employee_table',73),('2015_02_10_152218_create_salary_grade_table',74),('2015_02_11_134646_create_table_philhealth_settings',75),('2015_02_11_134831_add_code_column_salary_grades',75),('2015_02_11_140320_create_sss_premium_settings_table',76),('2015_02_11_220205_create_pay_frequencies_table',77),('2015_02_11_223612_create_employee_statuses_table',78),('2015_02_11_232248_create_employee_salary_grade_table',79),('2015_02_12_103734_create_payroll_settigs_table',80),('2015_02_12_144049_create_witholding_tax_table',81),('2015_02_12_144215_create_witholding_tax_details_table',81),('2015_02_12_231908_add_columns_employees_table',82),('2015_02_13_020034_create_departments_table',83),('2015_02_13_234928_add_column_witholding_tax_details',84),('2015_02_14_103208_create_leave_transactions_table',85),('2015_02_14_112148_create_leave_types_table',85),('2015_02_14_130412_create_overtime_transactions_table',86),('2015_02_14_130457_create_overtime_types_table',86),('2015_02_17_000155_create_overtime_rates_table',87),('2015_02_17_114125_create_undertime_transactions_table',88),('2015_02_17_163729_create_employee_positions_table',89),('2015_02_17_164723_create_employee_levels_table',89),('2015_02_18_000410_create_employee_position_table',90),('2015_02_18_115406_add_vlsl_columns',91),('2015_02_18_213341_remove_auto_increment_employees_table',92),('2015_02_18_220000_add_fkeys_conn_employees_table',93),('2015_02_18_221640_add_fkeys_leave_overtime_undertime_table',94),('2015_02_18_224220_add_employee_level_column',95),('2015_02_18_235601_add_employee_column_users_table',96),('2015_03_10_225014_create_table_memorandums',97),('2015_03_10_225209_create_productivity_transactions',98),('2015_03_10_225444_add_user_column_memorandums',99),('2015_03_10_230951_create_policies_and_resolutions_table',100),('2015_03_18_191252_create_payroll_summary',101),('2015_03_18_191314_create_payroll_details',101),('2015_03_18_224507_create_fkeys_payroll_details',102),('2015_03_21_114955_add_explanation_payroll_summary',103),('2015_03_21_144050_add_post_columns_payroll_summary',104),('2015_03_22_195237_add_period_column_payroll_summary',105),('2015_04_06_112133_add_monthly_rate_column_sal_grade',106),('2015_06_08_144212_add_fix_asset_types',107),('2015_06_08_144611_add_request_types',108),('2015_06_08_162054_add_pr_transactions_table',109),('2015_06_08_170815_add_employee_prtrans',110),('2015_06_08_171459_modify_employee_prtrans',111),('2015_06_09_134645_rename_pr_trans',112),('2015_06_09_134903_remove_columns_prtrans',113),('2015_06_09_135146_add_pr_summary_table',114),('2015_06_09_141758_add_controlno_pr_details',115),('2015_06_09_142353_alter_pr_details',116),('2015_06_09_143251_add_fkeys_pr_trans',117),('2015_06_09_151833_add_column_prsummary',118),('2015_06_10_104815_add_priority_table',119),('2015_06_10_110748_add_sr_statuses_table',120),('2015_06_10_111607_add_sr_trans_table',121),('2015_06_10_113001_rename_sr_table',122),('2015_06_10_151613_add_fa_categories_table',123),('2015_10_14_073811_add_company_name_client_table',124),('2015_10_14_083618_create_stores_table',125),('2015_10_14_083853_add_fkeys_store_client_table',126),('2015_10_20_070534_entrust_setup_tables',127),('2015_10_23_053039_add_class_column_permissions',128),('2015_10_23_053413_add_class_column_roles',128),('2015_10_26_052413_add_depstore_employees_table',129),('2015_10_30_152715_add_store_column_payroll_summary',130),('2015_10_30_175544_add_code_stores_table',131),('2015_10_30_184051_create_dtr_summary_table',132),('2015_10_30_184112_create_dtr_details_table',132),('2015_10_31_013952_add_leaves_dtr_details_table',133),('2015_11_11_025119_add_education_columns_employee_table',134),('2015_11_11_041435_add_other_info_columns_employee_table',135),('2015_11_11_055719_add_avatar_employees',136),('2015_11_18_035633_add_packages_table',137),('2015_11_19_034614_create_subscriptions_table',138),('2015_11_19_042510_create_employee_user_table',139),('2015_11_19_042728_add_primary_employee_user_table',140),('2015_11_19_042821_drop_employee_column_users_table',141),('2015_11_19_060615_add_status_column_subscriptions_table',142),('2015_11_19_095415_create_sessions_table',143),('2015_11_23_062038_rename_description_col_modules_types_table',144),('2015_11_23_073648_add_module_type_table',145),('2015_11_23_085718_add_timestamps_modules_types_table',146),('2015_11_24_024428_add_role_menu_table',147),('2015_11_24_084837_add_role_submenu_table',148),('2015_11_25_030946_remove_transactionmodule_col_transaction_types_table',149),('2015_11_26_042317_add_fkeys_subscriptions_table',150),('2015_11_26_054457_add_fkeys_role_menu_table',151),('2015_11_26_055003_add_fkeys_role_submenu_table',152),('2015_11_26_071644_add_subscription_clients_table',153),('2015_11_26_084312_add_image_clients_table',154),('2015_11_27_033540_add_subscription_client_table',155),('2015_11_27_034543_remove_subscription_col_client_table',156),('2015_11_27_082717_add_subscription_employee_table',157),('2015_11_27_090034_add_subscription_stores_table',158),('2015_11_26_035645_add_employee_code_table',159),('2015_11_28_024958_add_fkeys_employee_user_table',159),('2015_11_28_041546_add_store_employee_table',160),('2015_12_03_030933_add_subscription_user_table',161),('2015_12_03_061338_add_store_user_table',162),('2015_11_28_025656_add_activity_logs_table',163),('2015_12_07_062324_add_access_roles_table',163),('2015_12_07_070611_add_access_permissions_table',164),('2015_12_07_121406_add_subscription_admin_table',165),('2015_12_07_130736_add_user_roles_table',166),('2015_12_12_065632_add_role_package_table',167),('2015_12_11_034628_create_store_payroll_summary_table',168),('2015_12_11_035535_create_store_payroll_detail_table',168),('2015_12_11_035720_create_store_payroll_overtime_table',168),('2015_12_13_085856_add_user_timestamps_departments_table',169),('2015_12_13_093058_add_store_department_table',170),('2015_12_14_062250_add_user_status_timestamps_overtime_types_table',171),('2015_12_14_080608_add_store_overtime_types_table',172),('2015_12_15_054757_add_columns_sss_premium_table',173),('2015_12_15_080047_add_column_philhealth_settings_table',174),('2015_12_14_025110_add_sequence_column_store_payroll_details_table',175),('2015_12_14_043639_create_store_payroll_sources_table',175),('2015_12_14_070836_rename_store_payroll_summary_table_to_store_pdr_summary_table',175),('2015_12_14_071041_rename_store_payroll_details_to_store_pdr_details_table',175),('2015_12_14_071200_rename_store_payroll_overtime_to_store_pdr_overtime_table',175),('2015_12_14_071353_rename_store_payroll_source_to_pdr_sources_table',175),('2015_12_14_071619_rename_from_tag_store_pdr_summary_table',175),('2015_12_14_071826_rename_from_tag_column_store_pdr_details_table',175),('2015_12_14_071937_rename_from_tag_column_store_pdr_overtime_table',175),('2015_12_16_074348_add_employee_cola_table',176),('2015_12_18_030053_add_report_columns_table',177),('2015_12_18_054622_add_report_formats_table',178),('2015_12_18_060409_add_data_types_table',179),('2015_12_18_060426_add_math_operators',179),('2015_12_18_064731_add_columns_report_columns_table',180),('2015_12_18_072530_add_report_format_column_table',181),('2015_12_18_092358_add_report_types_table',182),('2015_12_18_150529_add_store_report_type_table',183),('2015_12_19_115541_add_sequence_col_rf_col_table',184),('2015_12_16_085856_create_store_loans_summary_table',185),('2015_12_16_090824_create_store_loans_details_table',185),('2015_12_17_032211_rename_user_column_store_loans_summary_table',185),('2015_12_17_032427_add_postedby_user_column_store_loans_summary_table',185),('2015_12_17_035619_add_sequence_column_store_loans_details_table',185),('2015_12_17_053421_create_store_billing_table',185),('2015_12_17_060737_add_timestamps_column_store_billing_table',185),('2015_12_19_010811_add_sequence_column_store_overtime_type_table',185),('2015_12_22_072210_rename_and_add_columns_employee_code_table',185),('2015_12_23_021620_add_status_column_employee_levels_table',186),('2015_12_23_023612_add_status_column_employee_statusses',186),('2015_12_23_025528_add_status_column_employee_positions_table',186),('2015_12_23_071218_add_policies_table',186),('2015_12_23_073533_add_penalty_types_table',186),('2015_12_23_091824_add_disciplinary_actions_table',187),('2015_12_27_151501_add_divisions_table',187),('2015_12_27_154634_add_user_column_clients_table',188),('2015_12_23_055320_add_area_column_stores_table',189),('2015_12_23_055621_create_store_area_table',189),('2015_12_23_072251_add_contract_expiry_column_clients_table',189),('2015_12_27_162033_drop_store_areas_table',190),('2015_12_27_163111_rename_area_col_stores_table',191),('2015_12_28_055141_add_columns_employee_table',192),('2015_12_28_055735_add_address_types_table',192),('2015_12_28_055833_add_employee_address_type',192),('2015_12_28_101156_drop_primary_employees_table',193),('2015_12_28_055747_add_status_column_divisions_table',194),('2015_12_28_094212_add_user_column_employee_status_position_level_table',194),('2015_12_29_031641_add_address_type_columns_table',194),('2016_01_02_015654_drop_add_fkeys_employee_address_table',195),('2016_01_02_015938_add_address_fkeys_employee_address_table',196),('2016_01_03_144720_add_client_store_fkeys_employees_table',197),('2016_01_05_064648_drop_pkeys_employee_position_table',198),('2016_01_05_065655_add_pkeys_employee_position',199),('2016_01_05_072002_add_employee_fkey_emp_position_table',200),('2016_01_06_060139_drop_cols_employee_salary_grade',201),('2016_01_06_070923_add_employee_salary_rate_table',202),('2016_01_06_031558_add_class_package_store_activity_logs_table',203),('2016_01_14_021327_add_subscription_effdate_store_employee_table',204),('2016_01_13_012458_create_notification_table',205),('2016_01_15_085343_create_activity_log_description_table',205),('2016_01_15_085946_drop_column_description_activity_logs_table',205),('2016_01_16_062234_add_ids_column_activity_log_description_table',205),('2016_01_28_074507_drop_fkey_store_employee',206),('2016_01_30_020622_create_client_employee_history_table',206),('2016_02_02_064038_create_employee_medical_histories',206),('2016_02_02_074051_create_medical_type_table',206),('2016_02_03_061554_add_fkey_employee_medical_histories_table',206),('2016_02_03_064303_create_trainings_table',206),('2016_02_03_070246_create_employee_trainings_table',206),('2016_02_05_070727_add_fkeys_store_employee_table',207),('2016_02_16_061420_create_pdr_tables',208),('2016_02_27_152107_add_subscription_fkeys_pdr_tables',209),('2016_03_01_040759_add_oldempid_employee_table',210),('2016_03_03_033044_add_company_code_clients_table',211),('2016_03_10_045753_add_columns_overtime_types_table',212),('2016_03_10_050742_adds_fkey_overtime_types_table',213),('2016_03_15_042149_add_atmbankcode_employees_table',214),('2016_03_16_123050_add_table_misc_benefits',215),('2016_03_17_050849_drop_employee_cola_table',216),('2016_03_17_051014_add_employee_benefits_table',217),('2016_03_19_182217_add_benefit_frequencies_table',218),('2016_03_19_183255_add_frequency_emp_benefits_table',219),('2016_03_21_143719_add_loans_summary_table',220),('2016_03_21_145124_add_loan_details_table',220),('2016_03_22_064513_add_fkeys_loans_table',221),('2016_03_23_030519_add_clientid_col_loan_details',222),('2016_03_24_034148_add_relationships_table',223),('2016_03_24_045943_add_employee_dependents_table',224),('2016_03_24_142106_add_operation_glentry_type',225),('2016_03_25_040033_add_user_emp_position_table',226),('2016_03_25_071741_alter_medical_history_table',227),('2016_03_25_072109_add_new_medical_history_table',228),('2016_03_26_005305_add_client_emp_disc_table',229),('2016_03_26_014958_add_user_emp_address',230),('2016_03_27_073034_drop_fkeys_employees_table',231),('2016_04_05_054918_add_religion_table',232),('2016_04_07_181009_add_code_relationships_table',232),('2016_04_07_181514_add_employee_contacts_table',232),('2016_04_08_150728_add_fkey_loan_details',233),('2016_04_14_081908_add_columns_payroll_details_table',234),('2016_04_14_083335_alter_payroll_summary_table',235),('2016_04_14_090643_alter_payroll_details_table',236),('2016_04_15_015245_add_columns_payroll_details',237),('2016_04_15_022928_add_payroll_trans_details_table',238),('2016_04_15_023800_add_fkeys_payroll_trans_details_table',239),('2016_04_15_160823_add_settings_fields_table',240),('2016_04_15_163843_alter_system_settings_table',241),('2016_04_15_182559_alter_empreg_codes_table',242),('2016_04_16_041404_add_subscription_activity_logs_table',243),('2016_04_16_042213_add_subscription_notfis_table',244),('2016_04_16_063032_add_loggedin_users_table',245),('2016_04_17_115445_add_subscriptino_account_classes_table',246),('2016_04_17_133255_add_subscription_glaccounts_table',247),('2016_04_17_134423_add_subscriptino_glcontrols_table',248),('2016_04_17_140939_add_subscription_account_types_table',249),('2016_04_17_141631_add_subscription_trans_summary_table',250),('2016_04_17_142700_add_subscription_trans_details',251),('2016_04_17_144531_add_subscription_accounts_table',252),('2016_04_17_144944_add_subscription_acct_summary',253),('2016_04_17_145856_add_subscription_acct_details',254),('2016_04_17_151025_add_subscription_glsummary',255),('2016_04_17_151508_add_subscription_gldetails',256),('2016_04_18_054640_add_modules_table',257),('2016_04_18_132002_add_columns_accttypes_table',258),('2016_04_18_134839_add_fkeys_acct_types_table',259),('2016_04_18_150054_add_fkeys_glcontrols_table',260),('2016_04_18_153340_add_account_type_module_table',261),('2016_04_18_161443_add_payroll_acct_details_table',262),('2016_04_20_031247_add_fkey_trans_summary_table',263),('2016_04_20_031605_add_fkey_trans_details_table',264),('2016_04_20_033015_add_fkeys_accounts_table',265),('2016_04_20_033238_add_fkeys_account_summary_table',266),('2016_04_20_033711_add_fkeys_account_details_table',267),('2016_04_20_050918_add_fkeys_pdr_summary_table',268),('2016_04_20_051300_add_fkeys_pdr_details_table',269),('2016_04_20_052742_add_fkeys_pdr_overtime_table',270),('2016_04_22_144209_add_fkeys_employees',271),('2016_04_23_153051_add_payroll_conditions_table',272),('2016_04_23_163206_add_payroll_periods_table',273),('2016_04_23_170605_add_payroll_period_details_table',274),('2016_04_23_171519_rename_condition_period_summary_table',275),('2016_04_26_113901_add_open_column_payroll_period_summary',276),('2016_04_28_044821_add_account_code_accttypes_table',277),('2016_04_28_045212_drop_glacct_fkey_accttypes_table',278),('2016_04_29_071912_add_deduction_types',279),('2016_04_29_080439_add_employee_deductions_table',280),('2016_05_02_134016_add_subscription_on_custom_reports_table',281),('2016_05_03_074117_add_explanation_transsummary_table',282),('2016_05_03_151858_add_is_open_col_payperiod_dtl_table',283),('2016_05_04_052559_remove_source_pdr_summary',284),('2016_05_07_134330_add_subscription_roles_table',285),('2016_05_08_121853_add_subscription_philhealth_table',286),('2016_05_08_123217_add_subscription_sss_table',287),('2016_05_08_131254_add_subscription_departments_table',288),('2016_05_08_132816_add_subscription_emp_levels_table',289),('2016_05_08_134035_add_subscription_emp_status_table',290),('2016_05_08_160450_add_subscription_emp_pos_table',291),('2016_05_10_025619_add_permission_package_table',292),('2016_05_12_141422_add_user_employee_rates_table',293),('2016_05_12_152531_remove_client_emprates_pos_table',294),('2016_05_12_163511_add_subscription_store_empuser_table',295),('2016_05_15_142213_add_time_settings_table',296),('2016_05_15_150219_add_time_setting_employees_table',297),('2016_05_16_074908_add_condition_payroll_summary_table',298),('2016_05_16_174841_add_other_earnings_paydetails_table',299),('2016_06_09_134151_add_has_account_col_report_columns_table',300),('2016_06_13_053403_add_subscription_leave_table',301),('2016_06_13_054252_add_fkeys_leave_table',302),('2016_06_14_054647_add_subscription_overtime_table',303),('2016_06_14_080941_add_subscription_undertime_table',304),('2016_06_15_072324_create_shifts_table',305),('2016_06_16_130507_create_weekdays_table',306),('2016_06_16_132543_create_schedule_templates_table',307),('2016_06_16_133940_create_schedule_details_table',307),('2016_06_16_151755_add_schedule_temp_employees_table',308),('2016_06_22_063920_add_sched_info_columns_employee_table',309),('2016_06_25_010951_alter_dtr_summary_table',310),('2016_06_25_045223_create_dtr_activity_cat_table',311),('2016_06_25_045435_create_dtr_activity_types_table',311),('2016_06_25_054535_create_dtr_activities_table',312),('2016_06_25_102332_drop_dtr_summary_table',313),('2016_06_25_102629_create_new_dtr_summary_table',314),('2016_06_25_103425_add_controlno_dtr_activities_table',315),('2016_06_25_162811_alter_status_relations_dtr_summary_table',316),('2016_06_25_173217_drop_dtr_details_table',317),('2016_06_25_173617_create_new_dtr_details_table',318),('2016_06_27_154641_create_dtr_activity_record_types_table',319),('2016_06_27_154846_add_act_record_type_column',320),('2016_06_28_200421_add_drop_activity_dt_columns',321),('2016_06_29_213714_create_subscription_report_type_table',322),('2016_07_03_030448_rename_reghours_dtr_details',323),('2016_07_06_003557_add_fkeys_payroll_tables',324),('2016_07_21_120344_drop_store_foreign_payroll_summary',325),('2016_07_28_150755_add_fkeys_store_report_type_table',326),('2016_07_28_170903_add_code_dtr_activity_types_table',327),('2016_07_30_150358_create_payroll_benefit_details_table',328),('2016_07_30_150419_create_payroll_deduction_details_table',328),('2016_07_31_014836_add_subscription_salary_grades_table',329),('2016_07_31_015248_add_fkeys_salary_grades_table',330),('2016_08_02_132740_add_is_included_field_overtime_types_table',331),('2016_08_05_235511_add_user_users_table',332),('2016_08_15_173530_add_break_hours_overtime_table',333),('2016_08_16_151753_add_subscription_leave_types',334),('2016_08_16_214030_add_subscription_pay_frequencies_table',335),('2016_08_16_220029_add_report_column_pay_frequency_table',336),('2016_08_26_205205_add_deduction_institutions_table',337),('2016_08_27_011321_add_deduction_summary_table',338),('2016_08_27_012628_add_deduction_details_table',339),('2016_09_05_113830_add_access_settings_fields_table',340),('2016_09_05_144347_add_payroll_condition_report_columns_table',341),('2016_09_12_115810_rename_loans_deductions_payroll_details_table',342),('2016_10_04_120457_remove_status_foreign_salary_rates_table',343),('2016_10_12_233426_add_slugs_subscription_table',344),('2016_10_12_233449_add_slugs_stores_table',344),('2016_10_12_233644_add_slugs_employees_table',344),('2016_11_04_161314_add_break_hours_shifts_table',345),('2016_11_08_012004_add_shift_activities_table',346),('2016_11_10_231005_add_threshold_report_columns',347),('2016_11_16_131417_add_hdmf_settings_table',348),('2016_11_22_232503_add_subscription_wtax_table',349),('2016_11_26_105721_create_payment_mode_table',349),('2016_11_26_105737_add_payment_mode_column',349),('2016_11_27_000805_add_mandatory_repo_columns',349),('2016_12_01_134923_add_check_threshold_col_rep_cols',349),('2016_12_06_124914_add_is_percentage_report_columns_table',349),('2016_12_06_193611_add_gross_pay_col_payroll_details_table',349),('2016_12_16_162545_create_store_type_table',349),('2016_12_16_162627_add_store_type_column',349),('2016_12_20_202730_make_status_nullable_store_employee',349),('2017_01_09_170213_add_client_transsum_table',350),('2017_01_26_184041_add_fa_statuses',351),('2017_01_26_185116_add_fa_table',352),('2017_01_27_043553_add_fa_transfer_types',353),('2017_01_27_060902_add_fa_transfers',354),('2017_01_27_131138_add_fa_logs',355),('2017_01_27_232932_remove_unique_role_name',356),('2017_01_30_063910_add_purpose_pr_details',357),('2017_01_30_072220_rename_controlno_prsummary',358),('2017_01_31_040038_rename_transtype_table',359),('2017_01_31_040235_add_transaction_types_table',360),('2017_01_31_040510_add_transaction_category_table',361),('2017_01_31_042654_add_transactions_table',362),('2017_01_31_064523_add_class_trans_types_tablel',363),('2017_01_31_102755_add_code_glacct_types',364),('2017_02_03_040554_add_subscription_service_requests_table',365),('2017_02_03_081910_add_subscription_file_memo',366),('2017_02_03_122715_add_subscriptio_pars',367),('2017_02_14_221449_add_invoice_table',368),('2017_02_14_222200_add_invoice_details_table',368),('2017_03_02_222739_create_pos_transaction_summaries_table',369),('2017_03_02_222747_create_pos_transaction_details_table',369),('2017_01_27_233335_drop_unique_role_name',370),('2017_02_16_102812_add_column_input_type_on_settings_field',370),('2017_02_17_134909_add_logo_column_to_subscription_table',370),('2017_02_27_221458_create_payroll_items_table',370),('2017_02_27_224556_add_payroll_item_column_report_columns',370),('2017_02_28_103716_add_payroll_item_paccount_details',370),('2017_03_03_140325_add_frequency_period_summary',370),('2017_03_15_065208_add_payroll_period_dtr_summary',370),('2017_03_15_070153_add_payroll_period_deductions',370),('2017_03_15_111210_add_payroll_period_payroll_summary',370),('2017_03_15_162907_remove_condition_period_payroll_summary',371),('2017_03_15_163149_add_condition_period_payroll_summary',372),('2017_03_17_053706_create_holidays_table',373),('2017_03_17_054113_create_holiday_types_table',373),('2017_03_24_164845_add_user_leave_table',374),('2017_03_24_173045_add_user_overtime_table',375),('2017_03_24_173141_add_user_undertime_table',375),('2017_04_26_011606_create_inventory_items_table',376),('2017_04_26_013150_create_inventory_transactions_table',377),('2017_04_26_013407_create_inventory_transaction_types_table',378),('2017_04_26_033834_create_stock_unit_types_table',379),('2017_03_29_154138_add_night_diff_dtr_details',380),('2017_03_29_160546_add_night_shift_option',380),('2017_03_29_164454_create_night_differentials_table',380),('2017_03_30_145457_add_code_holiday_types',380),('2017_04_20_220224_create_employee_shifts_table',380),('2017_04_28_084030_add_columns_inventory_trans_table',380),('2017_04_26_034156_create_stock_transfers_table',381),('2017_04_28_031132_add_amount_inv_items_tbl',381),('2017_04_28_141116_drp_emp_add_dep_inv_trans',382),('2017_04_28_163213_add_dtr_file_types_tbl',383),('2017_05_11_133232_add_dtr_id_employees_tbl',384),('2017_05_11_151046_add_fkeys_stock_xfer_tbl',385),('2017_05_18_120246_create_stock_transfer_logs_table',386),('2017_05_19_091654_create_stock_transfer_logtypes_table',387),('2017_05_19_091811_add_log_type_st_xfer_logs',388),('2017_05_25_084728_create_d_t_r_holidays_table',389),('2017_05_25_140019_add_supplier_st_xfer_tbl',390),('2017_05_25_170324_add_controlno_stock_xfer_tbl',391),('2017_06_06_080939_add_device_id_dpt_tbl',392),('2017_06_06_144943_add_activity_date_holiday_dtr_dtl_tbl',393),('2017_05_02_151922_alter_employee_shifts_tbl',394),('2017_05_02_215337_drop_replace_primary_keys_emp_shifts_tbl',394),('2017_05_06_231758_add_nwnp_emp_tbl',394),('2017_05_10_082549_add_dtr_holidays_tbl',395),('2017_05_10_093041_add_holiday_type_ot_types_tbl',395),('2017_05_15_113431_add_nd_ot_dtr_details_tbl',395),('2017_05_15_113557_add_nd_ot_dtr_holidays_tbl',395),('2017_05_23_223310_add_date_dtr_dtls_tbl',396),('2017_05_24_001253_change_primary_key_dtr_dtls_tbl',397),('2017_05_27_171244_add_holiday_tag_dtr_dtls_tbl',398),('2017_05_29_154424_add_rd_status_employee_shifts_tbl',398),('2017_06_16_145556_add_auto_ot_emp_shifts_tbl',399),('2017_06_19_200428_add_hdmf_employees_tbl',399),('2017_06_25_202724_create_payroll_payables_table',399),('2017_06_25_222307_add_13thmo_comp_pay_period_tbl',399),('2017_06_27_180744_create_employee_schedules_table',400),('2017_06_28_233251_create_inventory_categories_table',401),('2017_06_28_234205_add_category_inv_items_tbl',402),('2017_06_29_150517_add_code_pts_inv_items_tbl',403),('2017_09_12_130658_create_product_codes_table',404),('2017_09_12_130821_create_product_code_categories_table',404),('2017_09_12_213550_add_amount_product_codes_tbl',405),('2017_09_13_091459_create_product_code_uploads_table',406),('2017_09_13_171730_add_fkey_code_categories',407),('2017_09_13_214502_add_product_code_product_trans_tbl',408),('2017_09_13_221840_add_card_no_product_trans_tbl',409),('2017_09_13_150404_create_retail_transactions_table',410),('2017_09_13_232736_add_is_used_col_prod_trans_tbl',411),('2017_09_19_232624_add_product_trans_id_ret_trans_tbl',412),('2017_09_22_175325_add_branch_rtl_trans_tbl',413),('2017_10_10_204325_add_inv_date_no_prod_trans_tbl',414),('2017_10_10_204845_add_batch_no_prod_uploads_tbl',415),('2017_10_11_102827_add_department_users_table',416),('2014_10_12_000000_create_users_table',417),('2014_10_12_100000_create_password_resets_table',417),('2018_02_07_124905_hold_ship',418),('2018_02_07_144105_template_message',418),('2018_02_22_213846_rename_menu_columns',418),('2018_02_23_133949_create_ebay_accounts_table',419),('2018_02_23_111618_ship_queries',420),('2018_02_23_124250_create_activity_log_table',420),('2018_02_26_222232_create_ebay_messages_table',421),('2018_02_07_144105_message_template',422),('2018_02_28_151654_comments_table',422),('2018_03_02_154458_add_ebay_account_id',423),('2018_03_03_185731_add_sync_date_ebay_accts_tbl',424),('2018_02_07_151329_add_column_key_message_template',425),('2018_03_03_141824_message_temp_categories',425),('2018_02_23_111618_shipping_requests',426),('2018_03_05_132048_add_column_key_message_template',426),('2018_03_07_145355_request_types',426),('2018_03_08_131543_request_classification',426),('2018_03_08_131921_add_column_key_classification_id',426),('2018_03_12_153150_add_column_comments',427),('2018_03_13_161537_files',428),('2018_03_13_161822_add_column_key_file_id_shipping_requests',428),('2018_03_16_212254_create_ebay_orders_table',429),('2018_03_17_160303_add_item_image_transactions',430),('2018_03_16_173341_create_notifications_table',431),('2018_03_23_150658_create_user_ebay_accounts_table',432),('2018_03_30_200520_add_soft_delete_ebay_messages',433),('2018_03_31_142303_create_table_message_to_multiple',434),('2018_03_31_163425_add__column_key_user_id_shipping_request',434),('2018_04_01_162900_add_sku_ebay_message_table',435),('2018_04_07_212457_add_sender_email',436),('2018_04_01_170014_change_comment_column_to_nullable',437),('2018_04_08_182228_create_ebay_resolution_centers_table',437),('2018_04_08_190832_create_ebay_dispute_resolutions_table',437),('2018_04_08_190853_create_ebay_dispute_messages_table',437),('2018_04_11_111317_create_ebay_feedback_summaries_table',438),('2018_04_11_111326_create_ebay_feedback_details_table',438),('2018_04_12_101934_alter_shipping_request_tbl',439),('2018_04_13_115917_make_nullable_file_sr_table',440),('2018_04_24_212829_add_compatibility_columns_ebay_trans',441),('2018_04_15_110336_add_column_comments_file_id',442),('2018_04_15_143236_add_column_shipping_for_message',442),('2018_04_16_193706_add_column_key_on_comments_classification',442),('2018_04_21_162434_alter_table_comments_sq_id',443),('2018_04_25_093048_add_message_status_columns',444),('2018_04_28_121929_alter_table_add_cascade_on_commnet_column_sq_id',445),('2018_04_29_094119_alte_table_add_cascade_on_shipping_colimn_file_id',445),('2018_04_29_153205_create_comments_shipping_unread',445),('2018_04_30_065543_add_column_user_who_reply_on_comments',445),('2018_05_02_223939_rename_column_on_comments',446),('2018_05_02_230309_add_column_comment_replied',447),('2018_05_05_103654_add_column_deleted_at_on_shipping',448),('2018_05_05_143437_add_column_on_comments_deleted_at',448),('2018_05_08_123218_create_ebay_message_contents_table',449),('2018_05_08_131239_add_column_on_comment_history',450),('2018_05_12_102632_alter_table_nullable_request_types',451),('2018_05_12_113146_add_nullable_clumn_for_manual_ebay_account',452),('2018_05_13_121657_add_condition_columns_resolution_center_tbl',452),('2018_05_13_160216_remove_columns_resolution_center_tbl',453),('2018_05_13_161704_make_column_nullable',454),('2018_05_14_153224_alter_item_price_columns',455),('2018_05_14_180144_create_ebay_order_external_transactions_table',456),('2018_05_14_144048_add_column_sold_date_on_shipping_request',457),('2018_05_16_134042_create_paypal_accounts_table',458),('2018_05_16_135607_add_column_on_shipping_if_new',459),('2018_05_20_201533_create_jobs_table',460),('2018_05_20_201558_create_failed_jobs_table',460),('2017_05_01_000000_create_job_statuses_table',461),('2018_05_22_173453_create_room_amenities_table',462),('2018_05_22_173508_create_room_rules_table',462),('2018_05_22_173531_create_room_cancellations_table',462),('2018_05_22_174106_create_rooms_table',463),('2018_05_22_182749_create_bed_types_table',464),('2018_05_22_182800_create_room_categories_table',464),('2018_05_22_192259_create_room_amenity_keys_table',465),('2018_05_22_192306_create_room_rule_keys_table',465),('2018_05_22_203431_create_room_services_table',466),('2018_05_22_203632_create_room_service_keys_table',466),('2018_05_22_210906_create_payment_statuses_table',467),('2018_05_22_211251_create_reservations_table',468),('2018_05_22_212020_create_reservation_room_service_keys_table',469),('2018_05_22_215821_create_reservation_categories_table',470),('2018_05_22_215846_add_reservation_category_reservations_table',471),('2018_05_22_223057_create_room_images_table',472),('2018_05_23_002226_add_room_number_rooms_tbl',473),('2018_05_23_005221_add_auto_increment_room_image_tbl',474),('2018_05_23_010749_drop_room_reservations',475),('2018_05_23_011123_create_reservation_room_keys_table',476),('2018_05_23_015913_create_restaurant_menus_table',477),('2018_05_23_021900_create_restaurant_orders_table',478),('2018_05_23_021933_create_restaurant_order_menu_keys_table',478),('2018_05_23_021947_create_restaurant_order_service_keys_table',478),('2018_05_23_025347_add_columns_order_menu_keys',479),('2016_06_01_000001_create_oauth_auth_codes_table',480),('2016_06_01_000002_create_oauth_access_tokens_table',480),('2016_06_01_000003_create_oauth_refresh_tokens_table',480),('2016_06_01_000004_create_oauth_clients_table',480),('2016_06_01_000005_create_oauth_personal_access_clients_table',480),('2018_06_03_112219_create_events_table',480),('2018_06_04_011845_drop_clients_tbl',481),('2018_06_04_012105_create_clients_table',481),('2018_06_22_233016_add_availability_status_rooms_tbl',482),('2018_06_24_095102_create_inventory_item_types_table',482),('2018_06_24_100437_create_inventory_vendors_table',482),('2018_06_24_102532_create_inventory_brands_table',482),('2018_06_24_103738_create_inventory_classes_table',482),('2018_06_24_112636_alter_inventory_items_tbl',483),('2018_06_24_132653_create_inventory_groups_table',483),('2018_06_24_143735_create_inventory_group_item_tbl',483),('2018_06_24_150926_create_room_inventory_group_keys_table',483),('2020_11_21_134945_create_billing_table',484),('2020_11_21_140127_create_billing_details_table',484),('2020_11_21_152142_nullable_payment_form_billing_table',484),('2020_11_21_155328_add_status_billing_table',484),('2021_01_30_135255_add_cols_room_categories_table',485),('2021_01_30_135910_create_room_category_images_table',485),('2021_02_07_154035_add_room_category_id_to_reservations_table',486);
/*!40000 ALTER TABLE `tb_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_misc_benefits`
--

DROP TABLE IF EXISTS `tb_misc_benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_misc_benefits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `misc_benefits_subscription_foreign` (`subscription`),
  KEY `misc_benefits_status_foreign` (`status`),
  KEY `misc_benefits_user_foreign` (`user`),
  CONSTRAINT `misc_benefits_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `misc_benefits_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `misc_benefits_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_misc_benefits`
--

LOCK TABLES `tb_misc_benefits` WRITE;
/*!40000 ALTER TABLE `tb_misc_benefits` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_misc_benefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module_account_type`
--

DROP TABLE IF EXISTS `tb_module_account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_module_account_type` (
  `subscription` int(10) unsigned NOT NULL,
  `module` int(10) unsigned NOT NULL,
  `reference_id` int(10) unsigned NOT NULL,
  `accounttype` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`subscription`,`module`,`reference_id`,`accounttype`),
  KEY `module_account_type_module_foreign` (`module`),
  KEY `module_account_type_accounttype_foreign` (`accounttype`),
  KEY `module_account_type_user_foreign` (`user`),
  CONSTRAINT `module_account_type_accounttype_foreign` FOREIGN KEY (`accounttype`) REFERENCES `tb_account_types` (`id`),
  CONSTRAINT `module_account_type_module_foreign` FOREIGN KEY (`module`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `module_account_type_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `module_account_type_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module_account_type`
--

LOCK TABLES `tb_module_account_type` WRITE;
/*!40000 ALTER TABLE `tb_module_account_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_module_account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_modules`
--

DROP TABLE IF EXISTS `tb_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_modules`
--

LOCK TABLES `tb_modules` WRITE;
/*!40000 ALTER TABLE `tb_modules` DISABLE KEYS */;
INSERT INTO `tb_modules` VALUES (1,'Front Office','FO',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Back Office','BO',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'AR/Loans','ARL',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Payroll','PAYR',1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_night_differentials`
--

DROP TABLE IF EXISTS `tb_night_differentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_night_differentials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` decimal(9,2) NOT NULL,
  `holiday_type` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `night_differentials_subscription_foreign` (`subscription`),
  KEY `night_differentials_holiday_type_foreign` (`holiday_type`),
  CONSTRAINT `night_differentials_holiday_type_foreign` FOREIGN KEY (`holiday_type`) REFERENCES `tb_holiday_types` (`id`),
  CONSTRAINT `night_differentials_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_night_differentials`
--

LOCK TABLES `tb_night_differentials` WRITE;
/*!40000 ALTER TABLE `tb_night_differentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_night_differentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_notifications`
--

DROP TABLE IF EXISTS `tb_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_notifications`
--

LOCK TABLES `tb_notifications` WRITE;
/*!40000 ALTER TABLE `tb_notifications` DISABLE KEYS */;
INSERT INTO `tb_notifications` VALUES ('00cc8d69-c4d9-464b-b083-e8148967897b','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"9\"}',NULL,'2018-05-12 07:31:16','2018-05-12 07:31:16'),('04ce9e06-2a0b-4b47-82b6-dcfd2d958dc7','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-12 17:48:38','2018-05-12 17:48:38'),('04e80834-389f-489a-aa91-9d230aeaac85','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-16 14:47:26','2018-05-16 14:47:26'),('0911b395-2145-4940-8f37-f6c9700fca8a','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-12 17:48:38','2018-05-12 17:48:38'),('10a46fd5-29c6-41e1-a32f-00b94717b048','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-12 17:46:57','2018-05-12 17:46:57'),('12a6a8fa-fcaa-4ca2-b59d-a909be6e7680','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-16 14:47:26','2018-05-16 14:47:26'),('1946b9f1-2ca0-488a-9385-d496740fe37c','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-16 14:47:26','2018-05-16 14:47:26'),('37f2cc13-4d4f-407a-b9aa-a3ae20106861','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-16 14:47:26','2018-05-16 14:47:26'),('3ae2649f-1983-47f5-84b6-e326b665985e','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-12 07:32:37','2018-05-12 07:32:37'),('3bfa9b31-a47b-4b68-a4d4-a154f9e20b43','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-16 14:47:26','2018-05-16 14:47:26'),('4a6a7c39-92ae-4947-b206-04a6614eb75a','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"9\"}',NULL,'2018-05-12 07:31:16','2018-05-12 07:31:16'),('5037fc18-a56c-4dc1-813e-3a61c2e654b6','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-12 17:48:38','2018-05-12 17:48:38'),('5f1ee53c-79d0-456f-b650-51abea4983ba','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-16 14:47:26','2018-05-16 14:47:26'),('6d15f4dd-65c7-4a92-9885-ed3ee6c5974f','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"9\"}',NULL,'2018-05-12 07:35:14','2018-05-12 07:35:14'),('943a4f2e-8023-45ef-93c1-fcb330ee8099','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-16 14:47:26','2018-05-16 14:47:26'),('a066851d-7581-4df2-a6bd-33a681a9ab81','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"9\"}',NULL,'2018-05-12 07:35:14','2018-05-12 07:35:14'),('c834a366-21e8-4ad1-a544-5360f9122f67','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"user_id\":2}','2018-04-24 23:45:15','2018-04-12 23:56:08','2018-04-24 23:45:15'),('c8a6d251-9ffb-495b-84b3-dcc30f512403','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-16 14:47:26','2018-05-16 14:47:26'),('dad36bae-c090-40cc-94c3-65894bdad14f','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-12 17:46:57','2018-05-12 17:46:57'),('e15e46e5-52c3-4854-a121-f410832fae2c','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"9\"}',NULL,'2018-05-12 07:35:14','2018-05-12 07:35:14'),('e540b6a6-eb3f-4d68-bb95-028048238951','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-12 17:48:38','2018-05-12 17:48:38'),('ea05eb9b-afa0-4cf7-864b-4388f1ceb1d8','App\\Notifications\\CommentsNotification','App\\User',3,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"10\"}',NULL,'2018-05-12 07:21:36','2018-05-12 07:21:36'),('ef826f05-0858-4f9f-ad46-7344c5a83511','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-16 14:47:26','2018-05-16 14:47:26'),('f056095b-b9df-4f3a-a133-6d2fde9cca70','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-12 17:46:57','2018-05-12 17:46:57'),('f719799d-4001-4c16-bafd-6f3761068247','App\\Notifications\\CommentsNotification','App\\User',2,'{\"data\":\"You have a comment notification\",\"shipping_id\":\"7\"}',NULL,'2018-05-12 17:48:38','2018-05-12 17:48:38');
/*!40000 ALTER TABLE `tb_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_oauth_access_tokens`
--

DROP TABLE IF EXISTS `tb_oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`),
  KEY `oauth_access_tokens_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_oauth_access_tokens`
--

LOCK TABLES `tb_oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `tb_oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_oauth_auth_codes`
--

DROP TABLE IF EXISTS `tb_oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_oauth_auth_codes`
--

LOCK TABLES `tb_oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `tb_oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_oauth_clients`
--

DROP TABLE IF EXISTS `tb_oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_oauth_clients`
--

LOCK TABLES `tb_oauth_clients` WRITE;
/*!40000 ALTER TABLE `tb_oauth_clients` DISABLE KEYS */;
INSERT INTO `tb_oauth_clients` VALUES (1,NULL,'HMS ADMIN Personal Access Client','CLcrsYSEIKDRYq62nRFjnn121SfCwTkjDCemTQWU','http://localhost',1,0,0,'2018-06-03 14:39:02','2018-06-03 14:39:02'),(2,NULL,'HMS ADMIN Password Grant Client','IHOdN4tzBGvLPh79HpGP7EUffmijnRqedhzBE698','http://localhost',0,1,0,'2018-06-03 14:39:02','2018-06-03 14:39:02');
/*!40000 ALTER TABLE `tb_oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `tb_oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_oauth_personal_access_clients`
--

LOCK TABLES `tb_oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `tb_oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `tb_oauth_personal_access_clients` VALUES (1,1,'2018-06-03 14:39:02','2018-06-03 14:39:02');
/*!40000 ALTER TABLE `tb_oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `tb_oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_oauth_refresh_tokens`
--

LOCK TABLES `tb_oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `tb_oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_overtime_rates`
--

DROP TABLE IF EXISTS `tb_overtime_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_overtime_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `overtimetype` int(11) NOT NULL,
  `rate` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_overtime_rates`
--

LOCK TABLES `tb_overtime_rates` WRITE;
/*!40000 ALTER TABLE `tb_overtime_rates` DISABLE KEYS */;
INSERT INTO `tb_overtime_rates` VALUES (1,1,0.10),(2,2,0.10),(3,3,1.25),(4,4,1.30),(5,5,1.69),(6,6,1.30),(7,7,1.69),(8,8,0.10),(9,9,1.00),(10,10,2.60),(11,11,0.10);
/*!40000 ALTER TABLE `tb_overtime_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_overtime_transactions`
--

DROP TABLE IF EXISTS `tb_overtime_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_overtime_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `overtimetype` int(10) unsigned NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `break_time` decimal(5,2) NOT NULL,
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `supervisor` int(10) unsigned DEFAULT NULL,
  `supervisor_status` int(10) unsigned NOT NULL,
  `supervisor_approved_at` datetime NOT NULL,
  `manager` int(10) unsigned DEFAULT NULL,
  `manager_status` int(10) unsigned NOT NULL,
  `manager_approved_at` datetime NOT NULL,
  `user` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `overtime_transactions_employee_foreign` (`employee`),
  KEY `overtime_transactions_subscription_foreign` (`subscription`),
  KEY `overtime_transactions_overtimetype_foreign` (`overtimetype`),
  KEY `supervisor` (`supervisor`),
  KEY `supervisor_status` (`supervisor_status`),
  KEY `manager` (`manager`),
  KEY `manager_status` (`manager_status`),
  KEY `overtime_transactions_user_foreign` (`user`),
  CONSTRAINT `overtime_transactions_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `overtime_transactions_manager_foreign` FOREIGN KEY (`manager`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `overtime_transactions_manager_status_foreign` FOREIGN KEY (`manager_status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `overtime_transactions_overtimetype_foreign` FOREIGN KEY (`overtimetype`) REFERENCES `tb_overtime_types` (`id`),
  CONSTRAINT `overtime_transactions_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `overtime_transactions_supervisor_foreign` FOREIGN KEY (`supervisor`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `overtime_transactions_supervisor_status_foreign` FOREIGN KEY (`supervisor_status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `overtime_transactions_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_overtime_transactions`
--

LOCK TABLES `tb_overtime_transactions` WRITE;
/*!40000 ALTER TABLE `tb_overtime_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_overtime_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_overtime_types`
--

DROP TABLE IF EXISTS `tb_overtime_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_overtime_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate` decimal(9,2) NOT NULL,
  `holiday_type` int(10) unsigned DEFAULT NULL,
  `regular_hours` int(11) NOT NULL,
  `sequence` smallint(6) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `is_payroll_included` smallint(6) NOT NULL,
  `is_billing_included` smallint(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `overtime_types_subscription_foreign` (`subscription`),
  KEY `overtime_types_user_foreign` (`user`),
  KEY `overtime_types_holiday_type_foreign` (`holiday_type`),
  CONSTRAINT `overtime_types_holiday_type_foreign` FOREIGN KEY (`holiday_type`) REFERENCES `tb_holiday_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_overtime_types`
--

LOCK TABLES `tb_overtime_types` WRITE;
/*!40000 ALTER TABLE `tb_overtime_types` DISABLE KEYS */;
INSERT INTO `tb_overtime_types` VALUES (1,1,'NSLH','Night Shift Legal Holiday',20.00,NULL,0,14,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:48:31'),(2,1,'NSLHOT','Night Shift Legal Holiday Overtime',26.00,NULL,0,15,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:48:49'),(3,1,'RDLHOT','Rest Day Legal Holiday Overtime',338.00,NULL,0,9,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:50:04'),(4,1,'NSRDLH','Night Shift Rest Day Legal Holiday',26.00,NULL,0,16,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:50:32'),(5,1,'NSRD','Night Shift Rest Day',13.00,NULL,0,22,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:44:58'),(6,1,'RD','Rest Day',30.00,NULL,0,2,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:44:21'),(7,1,'RGOT','Regular Overtime',125.00,NULL,0,1,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:42:50'),(8,1,'RDLH','Rest Day Legal Holiday',160.00,NULL,0,8,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:49:16'),(9,1,'NSRDOT','Night Shift Rest Day Overtime',16.00,NULL,0,23,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:45:19'),(10,1,'NSR','Night Shift Regular',10.00,NULL,0,12,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:43:35'),(11,1,'LHOT','Legal Holiday Overtime',260.00,NULL,0,5,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:48:09'),(12,1,'NSROT','Night Shift Regular Overtime',12.50,NULL,0,13,2,0,1,1,'2015-12-14 19:43:49','2015-12-14 19:43:49'),(13,1,'RDOT','Rest Day Overtime',169.00,NULL,0,3,2,0,1,1,'2015-12-14 19:44:38','2015-12-14 19:44:38'),(14,1,'LH','Legal Holiday',100.00,NULL,0,4,2,0,1,1,'2015-12-14 19:45:43','2015-12-14 19:45:43'),(15,1,'NSRDLHOT','Night Shift Rest Day Legal Holiday Overtime',33.00,NULL,0,17,2,0,1,1,'2015-12-14 19:50:46','2015-12-14 19:50:46'),(16,1,'SH','Special Holiday',30.00,NULL,0,6,2,0,1,1,'2015-12-14 19:50:59','2015-12-14 19:50:59'),(17,1,'SHOT','Special Holiday Overtime',169.00,NULL,0,7,2,0,1,1,'2015-12-14 19:51:10','2015-12-14 19:51:10'),(18,1,'NSSH','Night Shift Special Holiday',13.00,NULL,0,18,2,0,1,1,'2015-12-14 19:51:24','2015-12-14 19:51:24'),(19,1,'NSSHOT','Night Shift Special Holiday Overtime',16.00,NULL,0,19,2,0,1,1,'2015-12-14 19:51:37','2015-12-14 19:51:37'),(20,1,'RDSH','Rest Day Special Holiday',50.00,NULL,0,10,2,0,1,1,'2015-12-14 19:51:47','2015-12-14 19:51:47'),(21,1,'RDSHOT','Rest Day Special Holiday Overtime',195.00,NULL,0,11,2,0,1,1,'2015-12-14 19:52:01','2015-12-14 19:52:01'),(22,1,'NSRDSH','Night Shift Rest Day Special Holiday',15.00,NULL,0,20,2,0,1,1,'2015-12-14 19:52:17','2015-12-14 19:52:17'),(23,1,'NSRDSHOT','Night Shift Rest Day Special Holiday Overtime',19.50,NULL,0,21,2,0,1,1,'2015-12-14 19:52:30','2015-12-14 19:52:30'),(24,2,'NSLH','Night Shift Legal Holiday',20.00,1,0,14,2,1,0,0,'2015-12-15 03:29:58','2017-06-07 15:55:30'),(25,2,'NSLHOT','Night Shift Legal Holiday Overtime',26.00,1,0,15,2,1,0,0,'2015-12-15 03:29:58','2017-06-07 15:55:38'),(26,2,'RDLHOT','Rest Day Legal Holiday Overtime',338.00,1,0,9,2,1,0,0,'2015-12-15 03:29:58','2017-06-07 15:59:40'),(27,2,'NSRDLH','Night Shift Rest Day Legal Holiday',26.00,1,0,16,2,1,0,0,'2015-12-15 03:29:58','2017-06-07 15:56:04'),(28,2,'NSRD','Night Shift Rest Day',13.00,1,0,22,2,1,0,0,'2015-12-15 03:29:58','2017-06-07 15:55:54'),(29,2,'RD','Rest Day',30.00,NULL,0,2,2,1,1,1,'2015-12-15 03:29:58','2015-12-14 19:44:21'),(30,2,'RGOT','Regular Overtime',125.00,1,0,1,2,1,0,0,'2015-12-15 03:29:58','2017-06-29 10:43:14'),(31,2,'RDLH','Rest Day Legal Holiday',160.00,1,0,8,2,1,0,0,'2015-12-15 03:29:58','2017-06-07 15:59:30'),(32,2,'NSRDOT','Night Shift Rest Day Overtime',16.00,1,0,23,2,1,0,0,'2015-12-15 03:29:58','2017-06-07 15:56:21'),(33,2,'NSR','Night Shift Regular',10.00,1,0,12,2,1,0,0,'2015-12-15 03:29:58','2017-06-07 15:55:46'),(34,2,'LHOT','Legal Holiday Overtime',260.00,1,0,5,2,1,0,0,'2015-12-15 03:29:58','2017-06-07 15:59:13'),(35,2,'NSROT','Night Shift Regular Overtime',12.50,1,0,13,2,0,0,0,'2015-12-14 19:43:49','2017-06-07 15:56:49'),(36,2,'RDOT','Rest Day Overtime',169.00,NULL,0,3,2,0,1,1,'2015-12-14 19:44:38','2015-12-14 19:44:38'),(37,2,'LH','Legal Holiday',100.00,1,0,4,2,0,0,0,'2015-12-14 19:45:43','2017-06-07 15:59:04'),(38,2,'NSRDLHOT','Night Shift Rest Day Legal Holiday Overtime',33.00,1,0,17,2,0,0,0,'2015-12-14 19:50:46','2017-06-07 15:56:13'),(39,2,'SH','Special Holiday',30.00,NULL,0,6,2,0,1,1,'2015-12-14 19:50:59','2015-12-14 19:50:59'),(40,2,'SHOT','Special Holiday Overtime',169.00,NULL,0,7,2,0,1,1,'2015-12-14 19:51:10','2015-12-14 19:51:10'),(41,2,'NSSH','Night Shift Special Holiday',13.00,1,0,18,2,0,0,0,'2015-12-14 19:51:24','2017-06-07 15:56:58'),(42,2,'NSSHOT','Night Shift Special Holiday Overtime',16.00,1,0,19,2,0,0,0,'2015-12-14 19:51:37','2017-06-07 15:57:10'),(43,2,'RDSH','Rest Day Special Holiday',50.00,NULL,0,10,2,0,1,1,'2015-12-14 19:51:47','2015-12-14 19:51:47'),(44,2,'RDSHOT','Rest Day Special Holiday Overtime',195.00,NULL,0,11,2,0,1,1,'2015-12-14 19:52:01','2015-12-14 19:52:01'),(45,2,'NSRDSH','Night Shift Rest Day Special Holiday',15.00,1,0,20,2,0,0,0,'2015-12-14 19:52:17','2017-06-07 15:56:29'),(46,2,'NSRDSHOT','Night Shift Rest Day Special Holiday Overtime',19.50,1,0,21,2,0,0,0,'2015-12-14 19:52:30','2017-06-07 15:56:39'),(47,1,'RGH','Regular Holiday',100.00,4,0,1,2,1,1,1,'2015-12-14 19:52:30','0000-00-00 00:00:00'),(48,1,'OT','Ordinary Overtime',125.00,4,0,1,2,1,1,1,'2015-12-14 19:52:30','0000-00-00 00:00:00'),(49,1,'NSO','Night Shift Ordinary',10.00,4,0,12,2,1,1,1,'2015-12-14 19:52:30','0000-00-00 00:00:00'),(50,2,'RGH','Regular Holiday',100.00,4,0,1,2,1,1,1,'2015-12-14 19:52:30','0000-00-00 00:00:00'),(51,2,'OT','Ordinary Overtime',125.00,4,0,1,2,1,1,1,'2015-12-14 19:52:30','0000-00-00 00:00:00'),(52,2,'NSO','Night Shift Ordinary',10.00,4,0,12,2,1,1,1,'2015-12-14 19:52:30','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_overtime_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_packages`
--

DROP TABLE IF EXISTS `tb_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `information` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_packages`
--

LOCK TABLES `tb_packages` WRITE;
/*!40000 ALTER TABLE `tb_packages` DISABLE KEYS */;
INSERT INTO `tb_packages` VALUES (1,'Basic Package','Quickstart package for small and medium businesses with direct employees.','Php125.00 / employee *',125.00,'{\"No. of Employees\":\"<span class=\\\"pull-right badge bg-blue\\\">Unlimited</span>\",\"Users\":\"<span class=\\\"pull-right badge bg-aqua\\\">Unlimited</span>\",\"No. of Clients\":\"<span class=\\\"pull-right badge bg-red\\\">N/A</span>\",\"No. of Stores\":\"<span class=\\\"pull-right badge bg-red\\\">N/A</span>\"}','bg-yellow','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Professional Package','Ultimate package for a company with multiple stores or branches.','Php155.00 / employee *',155.00,'{\"No. of Employees\":\"<span class=\\\"pull-right badge bg-blue\\\">Unlimited</span>\",\"Users\":\"<span class=\\\"pull-right badge bg-aqua\\\">Unlimited</span>\",\"No. of Clients\":\"<span class=\\\"pull-right badge bg-red\\\">N/A</span>\",\"No. of Stores\":\"<span class=\\\"pull-right badge bg-red\\\">Unlimited</span>\"}','bg-green','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Enterprise Package','Enterprise Solutions for businesses that manages multi-store clients.','Php200.00 / employee *',200.00,'{\"No. of Employees\":\"<span class=\\\"pull-right badge bg-blue\\\">Unlimited</span>\",\"Users\":\"<span class=\\\"pull-right badge bg-aqua\\\">Unlimited</span>\",\"No. of Clients\":\"<span class=\\\"pull-right badge bg-red\\\">Unlimited</span>\",\"No. of Stores\":\"<span class=\\\"pull-right badge bg-red\\\">Unlimited</span>\"}','bg-red','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_password_resets`
--

DROP TABLE IF EXISTS `tb_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_password_resets`
--

LOCK TABLES `tb_password_resets` WRITE;
/*!40000 ALTER TABLE `tb_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pay_frequencies`
--

DROP TABLE IF EXISTS `tb_pay_frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pay_frequencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pay_frequencies`
--

LOCK TABLES `tb_pay_frequencies` WRITE;
/*!40000 ALTER TABLE `tb_pay_frequencies` DISABLE KEYS */;
INSERT INTO `tb_pay_frequencies` VALUES (1,1,'Daily'),(2,1,'Weekly'),(3,1,'Semi-Monthly'),(4,1,'Monthly'),(5,1,'NA'),(6,2,'Daily'),(7,2,'Weekly'),(8,2,'Semi-Monthly'),(9,2,'Monthly'),(10,2,'NA'),(11,3,'NA'),(12,3,'Daily'),(13,3,'Weekly'),(14,3,'Semi-Monthly'),(15,3,'Monthly');
/*!40000 ALTER TABLE `tb_pay_frequencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payment_forms`
--

DROP TABLE IF EXISTS `tb_payment_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payment_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payment_forms`
--

LOCK TABLES `tb_payment_forms` WRITE;
/*!40000 ALTER TABLE `tb_payment_forms` DISABLE KEYS */;
INSERT INTO `tb_payment_forms` VALUES (1,'Cash'),(2,'Check'),(3,'Credit Card'),(4,'Paypal');
/*!40000 ALTER TABLE `tb_payment_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payment_mode`
--

DROP TABLE IF EXISTS `tb_payment_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payment_mode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payment_mode`
--

LOCK TABLES `tb_payment_mode` WRITE;
/*!40000 ALTER TABLE `tb_payment_mode` DISABLE KEYS */;
INSERT INTO `tb_payment_mode` VALUES (1,'Monthly');
/*!40000 ALTER TABLE `tb_payment_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payment_statuses`
--

DROP TABLE IF EXISTS `tb_payment_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payment_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payment_statuses`
--

LOCK TABLES `tb_payment_statuses` WRITE;
/*!40000 ALTER TABLE `tb_payment_statuses` DISABLE KEYS */;
INSERT INTO `tb_payment_statuses` VALUES (1,'Paid'),(2,'Pending');
/*!40000 ALTER TABLE `tb_payment_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paypal_accounts`
--

DROP TABLE IF EXISTS `tb_paypal_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_paypal_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_accounts_status_foreign` (`status`),
  KEY `paypal_accounts_user_foreign` (`user`),
  CONSTRAINT `paypal_accounts_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `paypal_accounts_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paypal_accounts`
--

LOCK TABLES `tb_paypal_accounts` WRITE;
/*!40000 ALTER TABLE `tb_paypal_accounts` DISABLE KEYS */;
INSERT INTO `tb_paypal_accounts` VALUES (1,'edryanalburo@gmail.com','','',2,2,'2018-05-16 14:05:24','2018-05-16 14:05:24');
/*!40000 ALTER TABLE `tb_paypal_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_account_details`
--

DROP TABLE IF EXISTS `tb_payroll_account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_account_details` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `accounttype` int(10) unsigned NOT NULL,
  `payroll_item` int(10) unsigned DEFAULT NULL,
  `value` decimal(9,2) NOT NULL,
  PRIMARY KEY (`subscription`,`controlno`,`employee`,`accounttype`),
  KEY `payroll_account_details_employee_foreign` (`employee`),
  KEY `payroll_account_details_accounttype_foreign` (`accounttype`),
  KEY `payroll_account_details_controlno_foreign` (`controlno`),
  KEY `payroll_account_details_payroll_item_foreign` (`payroll_item`),
  CONSTRAINT `payroll_account_details_accounttype_foreign` FOREIGN KEY (`accounttype`) REFERENCES `tb_account_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payroll_account_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_payroll_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payroll_account_details_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payroll_account_details_payroll_item_foreign` FOREIGN KEY (`payroll_item`) REFERENCES `tb_payroll_items` (`id`),
  CONSTRAINT `payroll_account_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_account_details`
--

LOCK TABLES `tb_payroll_account_details` WRITE;
/*!40000 ALTER TABLE `tb_payroll_account_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payroll_account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_benefit_trans_details`
--

DROP TABLE IF EXISTS `tb_payroll_benefit_trans_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_benefit_trans_details` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `reference_id` int(10) unsigned NOT NULL,
  `column_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_value` decimal(9,2) NOT NULL,
  PRIMARY KEY (`subscription`,`controlno`,`employee`,`reference_id`),
  KEY `payroll_benefit_trans_details_controlno_foreign` (`controlno`),
  KEY `payroll_benefit_trans_details_employee_foreign` (`employee`),
  KEY `payroll_benefit_trans_details_reference_id_foreign` (`reference_id`),
  CONSTRAINT `payroll_benefit_trans_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_payroll_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payroll_benefit_trans_details_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `payroll_benefit_trans_details_reference_id_foreign` FOREIGN KEY (`reference_id`) REFERENCES `tb_employee_benefits` (`id`),
  CONSTRAINT `payroll_benefit_trans_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_benefit_trans_details`
--

LOCK TABLES `tb_payroll_benefit_trans_details` WRITE;
/*!40000 ALTER TABLE `tb_payroll_benefit_trans_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payroll_benefit_trans_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_conditions`
--

DROP TABLE IF EXISTS `tb_payroll_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_conditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_conditions`
--

LOCK TABLES `tb_payroll_conditions` WRITE;
/*!40000 ALTER TABLE `tb_payroll_conditions` DISABLE KEYS */;
INSERT INTO `tb_payroll_conditions` VALUES (1,'1st Payroll'),(2,'2nd Payroll');
/*!40000 ALTER TABLE `tb_payroll_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_deduction_trans_details`
--

DROP TABLE IF EXISTS `tb_payroll_deduction_trans_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_deduction_trans_details` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `reference_id` int(10) unsigned NOT NULL,
  `column_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_value` decimal(9,2) NOT NULL,
  PRIMARY KEY (`subscription`,`controlno`,`employee`,`reference_id`),
  KEY `payroll_deduction_trans_details_controlno_foreign` (`controlno`),
  KEY `payroll_deduction_trans_details_employee_foreign` (`employee`),
  KEY `payroll_deduction_trans_details_reference_id_foreign` (`reference_id`),
  CONSTRAINT `payroll_deduction_trans_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_payroll_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payroll_deduction_trans_details_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `payroll_deduction_trans_details_reference_id_foreign` FOREIGN KEY (`reference_id`) REFERENCES `tb_employee_deductions` (`id`),
  CONSTRAINT `payroll_deduction_trans_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_deduction_trans_details`
--

LOCK TABLES `tb_payroll_deduction_trans_details` WRITE;
/*!40000 ALTER TABLE `tb_payroll_deduction_trans_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payroll_deduction_trans_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_details`
--

DROP TABLE IF EXISTS `tb_payroll_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_details` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `noofhours` decimal(9,2) NOT NULL,
  `monthlyrate` decimal(9,2) NOT NULL,
  `basicsalary` decimal(9,2) NOT NULL,
  `leavewithpay` decimal(9,2) NOT NULL,
  `miscplus` decimal(9,2) NOT NULL,
  `miscothers` decimal(9,2) NOT NULL,
  `otherearnings` decimal(9,2) NOT NULL,
  `allowances` decimal(9,2) NOT NULL,
  `grosspay` decimal(9,2) NOT NULL,
  `premiums` decimal(9,2) NOT NULL,
  `taxableincome` decimal(9,2) NOT NULL,
  `witholdingtax` decimal(9,2) NOT NULL,
  `deductions` decimal(9,2) NOT NULL,
  `otherdeductions` decimal(9,2) NOT NULL,
  `adjustments` decimal(9,2) NOT NULL,
  `netpay` decimal(9,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`subscription`,`controlno`,`employee`),
  KEY `payroll_details_employee_foreign` (`employee`),
  KEY `payroll_details_controlno_foreign` (`controlno`),
  CONSTRAINT `payroll_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_payroll_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payroll_details_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payroll_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_details`
--

LOCK TABLES `tb_payroll_details` WRITE;
/*!40000 ALTER TABLE `tb_payroll_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payroll_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_items`
--

DROP TABLE IF EXISTS `tb_payroll_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `payroll_items_subscription_foreign` (`subscription`),
  KEY `payroll_items_status_foreign` (`status`),
  KEY `payroll_items_user_foreign` (`user`),
  CONSTRAINT `payroll_items_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `payroll_items_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `payroll_items_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_items`
--

LOCK TABLES `tb_payroll_items` WRITE;
/*!40000 ALTER TABLE `tb_payroll_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payroll_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_period_details`
--

DROP TABLE IF EXISTS `tb_payroll_period_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_period_details` (
  `summary_id` int(10) unsigned NOT NULL,
  `subscription` int(10) unsigned NOT NULL,
  `store` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `is_open` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`summary_id`,`subscription`,`store`,`status`),
  KEY `payroll_period_details_subscription_foreign` (`subscription`),
  KEY `payroll_period_details_store_foreign` (`store`),
  KEY `payroll_period_details_status_foreign` (`status`),
  CONSTRAINT `payroll_period_details_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_transaction_tags` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payroll_period_details_store_foreign` FOREIGN KEY (`store`) REFERENCES `tb_stores` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payroll_period_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payroll_period_details_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `tb_payroll_period_summary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_period_details`
--

LOCK TABLES `tb_payroll_period_details` WRITE;
/*!40000 ALTER TABLE `tb_payroll_period_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payroll_period_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_period_summary`
--

DROP TABLE IF EXISTS `tb_payroll_period_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_period_summary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `period` date NOT NULL,
  `payroll_condition` int(10) unsigned NOT NULL,
  `payroll_frequency` int(10) unsigned DEFAULT NULL,
  `payrollstart` date NOT NULL,
  `payrollend` date NOT NULL,
  `compute_13thmonth` smallint(6) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `is_open` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `payroll_period_summary_subscription_foreign` (`subscription`),
  KEY `payroll_period_summary_user_foreign` (`user`),
  KEY `payroll_period_summary_status_foreign` (`status`),
  KEY `payroll_period_summary_payroll_condition_foreign` (`payroll_condition`),
  KEY `payroll_period_summary_payroll_frequency_foreign` (`payroll_frequency`),
  CONSTRAINT `payroll_period_summary_payroll_condition_foreign` FOREIGN KEY (`payroll_condition`) REFERENCES `tb_payroll_conditions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payroll_period_summary_payroll_frequency_foreign` FOREIGN KEY (`payroll_frequency`) REFERENCES `tb_pay_frequencies` (`id`),
  CONSTRAINT `payroll_period_summary_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_transaction_tags` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payroll_period_summary_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payroll_period_summary_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_period_summary`
--

LOCK TABLES `tb_payroll_period_summary` WRITE;
/*!40000 ALTER TABLE `tb_payroll_period_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payroll_period_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_redeemables`
--

DROP TABLE IF EXISTS `tb_payroll_redeemables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_redeemables` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  PRIMARY KEY (`subscription`,`controlno`,`employee`,`period`),
  KEY `payroll_redeemables_controlno_foreign` (`controlno`),
  KEY `payroll_redeemables_employee_foreign` (`employee`),
  KEY `payroll_redeemables_period_foreign` (`period`),
  CONSTRAINT `payroll_redeemables_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_payroll_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payroll_redeemables_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `payroll_redeemables_period_foreign` FOREIGN KEY (`period`) REFERENCES `tb_payroll_period_summary` (`id`),
  CONSTRAINT `payroll_redeemables_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_redeemables`
--

LOCK TABLES `tb_payroll_redeemables` WRITE;
/*!40000 ALTER TABLE `tb_payroll_redeemables` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payroll_redeemables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_settings`
--

DROP TABLE IF EXISTS `tb_payroll_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_settings`
--

LOCK TABLES `tb_payroll_settings` WRITE;
/*!40000 ALTER TABLE `tb_payroll_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payroll_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_summary`
--

DROP TABLE IF EXISTS `tb_payroll_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_summary` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `store` int(10) unsigned DEFAULT NULL,
  `payroll_period` int(10) unsigned DEFAULT NULL,
  `payroll_condition` int(10) unsigned NOT NULL DEFAULT 0,
  `period` date DEFAULT NULL,
  `payrollstart` date DEFAULT NULL,
  `payrollend` date DEFAULT NULL,
  `user` int(10) unsigned DEFAULT NULL,
  `status` int(10) unsigned NOT NULL,
  `explanation` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `posted_by` int(10) unsigned DEFAULT NULL,
  `posted_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`subscription`,`controlno`,`payroll_condition`,`status`),
  KEY `payroll_summary_payroll_condition_foreign` (`payroll_condition`),
  KEY `payroll_summary_user_foreign` (`user`),
  KEY `payroll_summary_status_foreign` (`status`),
  KEY `payroll_summary_posted_by_foreign` (`posted_by`),
  KEY `controlno` (`controlno`),
  KEY `payroll_summary_payroll_period_foreign` (`payroll_period`),
  CONSTRAINT `payroll_summary_payroll_condition_foreign` FOREIGN KEY (`payroll_condition`) REFERENCES `tb_payroll_conditions` (`id`),
  CONSTRAINT `payroll_summary_payroll_period_foreign` FOREIGN KEY (`payroll_period`) REFERENCES `tb_payroll_period_summary` (`id`),
  CONSTRAINT `payroll_summary_posted_by_foreign` FOREIGN KEY (`posted_by`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `payroll_summary_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_transaction_tags` (`id`),
  CONSTRAINT `payroll_summary_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `payroll_summary_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_summary`
--

LOCK TABLES `tb_payroll_summary` WRITE;
/*!40000 ALTER TABLE `tb_payroll_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payroll_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payroll_trans_details`
--

DROP TABLE IF EXISTS `tb_payroll_trans_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payroll_trans_details` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `report_column` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `report_column_id` int(10) unsigned NOT NULL,
  `column_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`subscription`,`controlno`,`employee`,`report_column`,`report_column_id`,`column_value`),
  KEY `payroll_trans_details_employee_foreign` (`employee`),
  KEY `payroll_trans_details_report_column_id_foreign` (`report_column_id`),
  KEY `payroll_trans_details_controlno_foreign` (`controlno`),
  CONSTRAINT `payroll_trans_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_payroll_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payroll_trans_details_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payroll_trans_details_report_column_id_foreign` FOREIGN KEY (`report_column_id`) REFERENCES `tb_report_columns` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payroll_trans_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payroll_trans_details`
--

LOCK TABLES `tb_payroll_trans_details` WRITE;
/*!40000 ALTER TABLE `tb_payroll_trans_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payroll_trans_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pdr_details`
--

DROP TABLE IF EXISTS `tb_pdr_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pdr_details` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` bigint(20) unsigned NOT NULL,
  `documentno` bigint(20) unsigned NOT NULL,
  `store` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `workhours` decimal(9,2) NOT NULL,
  `excesshours` decimal(9,2) NOT NULL,
  `AWOP` decimal(9,2) NOT NULL,
  `late` decimal(9,2) NOT NULL,
  `from_user` int(11) NOT NULL,
  `by_user` int(11) NOT NULL,
  `taxi_allo` decimal(9,2) NOT NULL,
  `EDA` decimal(9,2) NOT NULL,
  `source` int(10) unsigned NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sequence` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`,`documentno`,`store`,`employee`,`subscription`,`source`),
  KEY `pdr_details_subscription_foreign` (`subscription`),
  KEY `pdr_details_store_foreign` (`store`),
  KEY `pdr_details_employee_foreign` (`employee`),
  CONSTRAINT `pdr_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_pdr_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pdr_details_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `pdr_details_store_foreign` FOREIGN KEY (`store`) REFERENCES `tb_stores` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `pdr_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pdr_details`
--

LOCK TABLES `tb_pdr_details` WRITE;
/*!40000 ALTER TABLE `tb_pdr_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pdr_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pdr_overtime`
--

DROP TABLE IF EXISTS `tb_pdr_overtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pdr_overtime` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` bigint(20) unsigned NOT NULL,
  `documentno` bigint(20) unsigned NOT NULL,
  `store` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `overtime_type` int(10) unsigned NOT NULL,
  `value` decimal(9,2) NOT NULL,
  `source` int(10) unsigned NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`controlno`,`documentno`,`store`,`employee`,`overtime_type`,`subscription`,`source`),
  KEY `pdr_overtime_store_foreign` (`store`),
  KEY `pdr_overtime_employee_foreign` (`employee`),
  KEY `pdr_overtime_overtime_type_foreign` (`overtime_type`),
  KEY `pdr_overtime_subscription_foreign` (`subscription`),
  KEY `pdr_overtime_source_foreign` (`source`),
  CONSTRAINT `pdr_overtime_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_pdr_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pdr_overtime_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `pdr_overtime_overtime_type_foreign` FOREIGN KEY (`overtime_type`) REFERENCES `tb_overtime_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `pdr_overtime_source_foreign` FOREIGN KEY (`source`) REFERENCES `tb_pdr_sources` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `pdr_overtime_store_foreign` FOREIGN KEY (`store`) REFERENCES `tb_stores` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `pdr_overtime_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pdr_overtime`
--

LOCK TABLES `tb_pdr_overtime` WRITE;
/*!40000 ALTER TABLE `tb_pdr_overtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pdr_overtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pdr_sources`
--

DROP TABLE IF EXISTS `tb_pdr_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pdr_sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pdr_sources`
--

LOCK TABLES `tb_pdr_sources` WRITE;
/*!40000 ALTER TABLE `tb_pdr_sources` DISABLE KEYS */;
INSERT INTO `tb_pdr_sources` VALUES (1,'Store','2016-05-04 22:29:11','2016-05-04 22:29:11'),(2,'Manila','2016-05-04 22:29:11','2016-05-04 22:29:11'),(3,'Adjustments','2016-05-04 22:29:11','2016-05-04 22:29:11');
/*!40000 ALTER TABLE `tb_pdr_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pdr_summary`
--

DROP TABLE IF EXISTS `tb_pdr_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pdr_summary` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` bigint(20) unsigned NOT NULL,
  `documentno` bigint(20) unsigned NOT NULL,
  `store` int(10) unsigned NOT NULL,
  `period` date NOT NULL,
  `payrollstart` date NOT NULL,
  `payrollend` date NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`,`documentno`,`store`,`period`,`subscription`),
  KEY `pdr_summary_subscription_foreign` (`subscription`),
  KEY `pdr_summary_user_foreign` (`user`),
  KEY `pdr_summary_status_foreign` (`status`),
  KEY `pdr_summary_store_foreign` (`store`),
  CONSTRAINT `pdr_summary_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_transaction_tags` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `pdr_summary_store_foreign` FOREIGN KEY (`store`) REFERENCES `tb_stores` (`id`),
  CONSTRAINT `pdr_summary_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `pdr_summary_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pdr_summary`
--

LOCK TABLES `tb_pdr_summary` WRITE;
/*!40000 ALTER TABLE `tb_pdr_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pdr_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_penalty_types`
--

DROP TABLE IF EXISTS `tb_penalty_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_penalty_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_penalty_types`
--

LOCK TABLES `tb_penalty_types` WRITE;
/*!40000 ALTER TABLE `tb_penalty_types` DISABLE KEYS */;
INSERT INTO `tb_penalty_types` VALUES (1,'Corrective Counselling',2),(2,'Suspension',2),(3,'Second Written Warning',2),(4,'Dismissal',2),(5,'First Written Warning',2),(6,'Preventive Suspension',2);
/*!40000 ALTER TABLE `tb_penalty_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_permission_package`
--

DROP TABLE IF EXISTS `tb_permission_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_permission_package` (
  `permission_id` int(10) unsigned NOT NULL,
  `package_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`package_id`),
  KEY `permission_package_package_id_foreign` (`package_id`),
  CONSTRAINT `permission_package_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `tb_packages` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `permission_package_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `tb_permissions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permission_package`
--

LOCK TABLES `tb_permission_package` WRITE;
/*!40000 ALTER TABLE `tb_permission_package` DISABLE KEYS */;
INSERT INTO `tb_permission_package` VALUES (4,1),(4,2),(4,3),(5,1),(5,2),(5,3),(6,1),(6,2),(6,3),(8,3),(9,3),(10,3),(11,3),(13,2),(13,3),(17,1),(17,2),(17,3),(18,1),(18,2),(18,3),(19,1),(19,2),(19,3),(20,1),(20,2),(20,3),(26,1),(27,1),(27,2),(27,3),(28,1),(28,2),(28,3),(29,1),(29,2),(29,3),(30,1),(30,2),(30,3),(31,1),(31,2),(31,3),(32,1),(32,2),(32,3),(33,1),(33,2),(33,3),(37,1),(37,2),(37,3),(38,1),(38,2),(38,3),(39,1),(39,2),(39,3),(40,3),(41,3),(42,1),(42,2),(42,3),(43,1),(43,2),(43,3),(44,1),(44,2),(44,3),(45,1),(45,2),(45,3),(47,1),(47,2),(47,3),(48,2),(48,3),(50,1),(50,2),(50,3),(52,2),(52,3),(53,2),(53,3),(54,2),(54,3),(55,2),(55,3),(56,2),(56,3),(57,2),(57,3),(58,2),(58,3),(59,1),(59,2),(59,3),(60,1),(60,2),(60,3),(62,1),(62,2),(62,3),(63,1),(63,2),(63,3),(64,1),(64,2),(64,3),(65,3),(76,1),(76,2),(76,3),(77,1),(77,2),(77,3),(78,1),(78,2),(78,3),(79,1),(79,2),(79,3),(81,1),(81,2),(81,3),(82,1),(82,2),(82,3),(83,1),(83,2),(83,3),(85,1),(85,2),(85,3),(86,1),(86,2),(86,3),(88,1),(88,2),(88,3),(89,1),(89,2),(89,3),(90,1),(90,2),(90,3),(93,1),(93,2),(93,3),(94,1),(94,2),(94,3),(95,1),(95,2),(95,3),(96,1),(96,2),(96,3),(97,1),(97,2),(97,3),(99,1),(99,2),(99,3),(100,1),(100,2),(100,3),(102,1),(102,2),(102,3),(104,1),(104,2),(104,3),(106,1),(106,2),(106,3),(109,1),(109,2),(109,3),(110,1),(110,2),(110,3),(111,1),(111,2),(111,3),(112,1),(112,2),(112,3),(113,1),(113,2),(113,3),(114,1),(114,2),(114,3),(115,1),(115,2),(115,3),(116,1),(116,2),(116,3),(117,1),(117,2),(117,3),(118,1),(118,2),(118,3),(119,1),(119,2),(119,3),(120,1),(120,2),(120,3),(121,1),(121,2),(121,3),(122,2),(122,3),(124,1),(124,2),(124,3),(125,1),(125,2),(125,3),(126,1),(127,1),(128,1),(128,2),(128,3),(129,1),(129,2),(129,3),(130,1),(130,2),(130,3),(132,1),(132,2),(132,3),(133,2),(133,3),(134,2),(134,3),(135,2),(135,3),(136,1),(136,2),(136,3),(139,1),(139,2),(139,3),(141,1),(141,2),(141,3),(142,1),(142,2),(142,3),(143,1),(143,2),(143,3),(144,1),(144,2),(144,3),(145,1),(145,2),(145,3),(146,1),(146,2),(146,3),(147,1),(147,2),(147,3),(148,1),(148,2),(148,3),(149,1),(149,2),(149,3),(150,1),(151,1),(151,2),(151,3),(152,1),(152,2),(152,3),(153,1),(153,2),(153,3),(154,1),(154,2),(154,3),(155,1),(155,2),(155,3),(156,1),(156,2),(156,3),(157,1),(157,2),(157,3),(158,1),(158,2),(158,3),(159,1),(159,2),(159,3),(160,1),(160,2),(160,3),(161,1),(161,2),(161,3),(162,1),(162,2),(162,3),(163,1),(163,2),(163,3),(164,1),(164,2),(164,3),(165,1),(165,2),(165,3),(172,1),(172,2),(172,3),(173,1),(173,2),(173,3),(174,1),(174,2),(174,3),(175,1),(175,2),(175,3),(176,1),(176,2),(176,3),(177,1),(177,2),(177,3),(178,1),(178,2),(178,3),(179,1),(179,2),(179,3),(180,1),(180,2),(180,3);
/*!40000 ALTER TABLE `tb_permission_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_permission_role`
--

DROP TABLE IF EXISTS `tb_permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `tb_permissions` (`id`),
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permission_role`
--

LOCK TABLES `tb_permission_role` WRITE;
/*!40000 ALTER TABLE `tb_permission_role` DISABLE KEYS */;
INSERT INTO `tb_permission_role` VALUES (1,1),(1,5),(2,1),(2,5),(3,1),(3,5),(4,1),(4,5),(5,1),(5,5),(6,1),(6,5),(7,1),(7,5),(8,1),(8,5),(9,1),(9,5),(10,1),(10,5),(11,1),(11,5),(12,1),(13,1),(14,1),(15,1),(16,1),(16,5),(17,1),(17,5),(18,1),(18,5),(19,1),(19,5),(20,1),(20,5),(21,1),(21,5),(22,1),(22,5),(23,1),(23,5),(24,1),(24,5),(25,1),(25,5),(26,1),(26,5),(27,1),(27,5),(28,1),(28,5),(29,1),(29,5),(30,1),(30,5),(31,1),(31,5),(32,5),(33,5),(34,1),(34,5),(35,1),(35,5),(36,1),(36,5),(37,1),(37,4),(37,5),(38,1),(38,5),(39,1),(39,4),(39,5),(40,1),(40,5),(41,1),(41,5),(42,1),(42,5),(43,1),(43,5),(44,1),(44,5),(45,1),(45,5),(46,1),(46,5),(47,1),(47,5),(49,5),(50,1),(50,4),(50,5),(51,1),(51,5),(59,5),(60,5),(61,5),(62,5),(63,5),(64,5),(66,5),(67,1),(67,5),(68,5),(69,1),(69,5),(70,1),(70,5),(71,1),(71,5),(73,1),(73,5),(74,5),(76,5),(77,5),(78,5),(79,5),(80,5),(81,5),(82,5),(83,5),(84,5),(85,5),(86,5),(87,5),(88,5),(89,5),(90,5),(91,5),(92,5),(93,5),(94,5),(95,5),(96,5),(97,5),(98,5),(99,5),(100,5),(101,5),(102,5),(103,5),(104,5),(105,5),(106,5),(107,5),(109,5),(110,5),(111,5),(112,5),(113,5),(114,5),(115,5),(116,5),(117,5),(118,5),(119,5),(121,5),(122,5),(123,5),(124,5),(125,1),(125,5),(126,5),(127,5),(128,5),(129,5),(130,5),(136,5),(139,5),(140,5),(141,5),(142,5),(143,5),(144,5),(145,5),(146,5),(147,5),(148,5),(149,5),(150,5),(151,5),(152,5),(153,5),(154,5),(155,5),(156,5),(157,5),(158,5),(159,5),(160,5),(161,5),(162,5),(163,5),(164,5),(165,5),(166,5),(167,5),(168,5),(169,5),(170,5),(172,4),(173,4),(174,2),(174,4),(174,6),(175,2),(175,4),(175,6),(176,2),(176,4),(176,6),(177,2),(180,4),(182,2),(183,2),(183,7),(184,2),(184,7),(185,2),(186,2),(187,2),(188,2),(189,2),(190,2),(191,2),(192,2),(193,2),(193,3),(194,2),(195,2),(195,3),(196,2),(196,3),(197,2),(197,3),(198,2),(198,3),(199,2),(200,2);
/*!40000 ALTER TABLE `tb_permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_permissions`
--

DROP TABLE IF EXISTS `tb_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access` smallint(6) NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permissions`
--

LOCK TABLES `tb_permissions` WRITE;
/*!40000 ALTER TABLE `tb_permissions` DISABLE KEYS */;
INSERT INTO `tb_permissions` VALUES (1,'user.create','Create New User','Create New User',1,'label label-danger','2015-10-23 17:47:22','2015-12-08 02:29:12'),(2,'user.update','Update User','Update User',1,'label label-warning','2015-10-23 17:49:06','2015-12-08 02:29:25'),(3,'user.index','List Users','List Users',1,'label label-default','2015-10-23 17:49:23','2015-12-08 02:29:19'),(4,'leave.approve','Approve Leave','Access that can approve leave applications',1,'label label-danger','2015-11-12 16:40:51','2015-12-07 20:11:34'),(5,'leave.create','Create Leave','Create leave application',1,'label label-warning','2015-11-12 19:34:36','2015-12-08 02:24:20'),(6,'leave.index','List leave applications','Listing of leave applications',1,'label label-success','2015-11-12 19:47:59','2015-12-08 02:24:27'),(7,'dashboard','Dashboard','View Dashboard',0,'label label-warning','2015-12-07 20:22:39','2015-12-07 20:22:39'),(8,'client.index','List Clients','Show List of Clients',1,'label label-default','2015-12-07 20:24:00','2015-12-08 02:21:32'),(9,'client.create','Create Client','Create New Client',1,'label label-danger','2015-12-07 20:24:21','2015-12-08 02:20:56'),(10,'client.edit','Edit Client','Edit Client (View only)',1,'label label-success','2015-12-07 20:26:48','2015-12-08 02:21:13'),(11,'client.update','Update Client','Update Changes to client info',1,'label label-info','2015-12-07 20:27:17','2015-12-08 02:21:41'),(12,'store.create','Create new Store','Create new Store',1,'label label-warning','2015-12-07 20:28:05','2015-12-08 02:28:14'),(13,'store.show','Show Store Info','Show store information',1,'label label-success','2015-12-07 20:28:59','2015-12-08 19:04:01'),(14,'store.edit','Edit Store ','Edit store (View only)',1,'label label-success','2015-12-07 20:30:03','2015-12-08 02:28:29'),(15,'store.update','Update Store ','Update changes to store info',1,'label label-success','2015-12-07 20:30:24','2015-12-08 02:28:51'),(16,'employee.index','List Employees','List Employees',1,'label label-default','2015-12-07 20:31:10','2015-12-08 02:22:59'),(17,'employee.create','Create Employee','Create New Employee',1,'label label-info','2015-12-07 20:31:56','2015-12-08 02:22:20'),(18,'employee.edit','Edit Employee','Edit Employee (view only)',1,'label label-primary','2015-12-07 20:33:58','2015-12-08 02:22:48'),(19,'employee.update','Update Employee','Update changes to employee info',1,'label label-danger','2015-12-07 20:34:35','2015-12-08 02:23:45'),(20,'employee.search','Search Employees','Allow user to search employees',1,'label label-primary','2015-12-07 20:35:01','2015-12-08 02:23:06'),(21,'employee.store.append','Append Employee to Store','Allow user to add Employees to Store',1,'label label-danger','2015-12-07 20:36:27','2015-12-08 02:23:34'),(22,'payroll.salarygrade','Add/Edit/Update Salary Grade','Add/Edit/Update Salary Grade',0,'label label-success','2015-12-07 20:38:11','2015-12-07 20:38:11'),(23,'payroll.philhealth','Add/Edit/Update PhilHealth','Add/Edit/Update PhilHealth',0,'label label-primary','2015-12-07 20:38:41','2015-12-07 20:38:41'),(24,'payroll.sss','Add/Edit/Update SSS Premium','Add/Edit/Update SSS Premium',0,'label label-default','2015-12-07 20:40:38','2015-12-07 20:40:38'),(25,'payroll.witholdingtax','Add/Edit/Update Witholding Tax Table','Add/Edit/Update Witholding Tax Table',0,'label label-primary','2015-12-07 20:41:08','2015-12-07 20:41:08'),(26,'payroll.dtr','Access DTR Module','Access DTR Module',1,'label label-danger','2015-12-07 20:41:47','2016-05-10 16:25:42'),(27,'payroll.netpay','Access Payroll Net Pay','Access Payroll Net Pay',1,'label label-danger','2015-12-07 20:42:12','2015-12-13 23:35:59'),(28,'overtime.index','List Overtime Applications','List Overtime Applications',1,'label label-default','2015-12-07 20:42:47','2015-12-08 02:24:54'),(29,'overtime.create','Create Overtime','Create overtime application',1,'label label-danger','2015-12-07 20:43:24','2015-12-08 02:24:41'),(30,'undertime.index','List undertime applications','Listing of undertime applications',1,'label label-success','2015-12-07 20:44:23','2015-12-08 02:29:05'),(31,'undertime.create','Create Undertime','Create Undertime',1,'label label-primary','2015-12-07 20:44:54','2015-12-08 02:28:58'),(32,'view.payslips','List Employee Pay Slips','Show current and previous payslips of the currently logged in or selected employee',1,'label label-info','2015-12-07 20:45:41','2016-09-06 09:56:59'),(33,'payslip.show','Show Pay Slip','Show payslip info of the currently logged in employee',1,'label label-primary','2015-12-07 20:46:06','2015-12-08 02:26:49'),(34,'role.access','Access to Roles module','Access to Roles module',1,'label label-danger','2015-12-07 20:49:38','2015-12-08 02:27:50'),(35,'menu.access','Access to Menu module','Access to Menu modulef',0,'label label-success','2015-12-07 20:50:39','2015-12-07 20:50:39'),(36,'submenu.access','Access to Sub Menu module','Access to Sub Menu module',0,'label label-default','2015-12-07 20:50:59','2015-12-07 20:50:59'),(37,'access.profile','Show Profile','Show User Profile',1,'label label-info','2015-12-07 20:51:46','2015-12-08 02:15:30'),(38,'account.create','Create New Package','Create New Package / subscription',1,'label label-info','2015-12-07 20:52:41','2015-12-08 02:18:49'),(39,'account.show','Account Timeline','Show Account Timeline',1,'label label-default','2015-12-07 20:53:39','2015-12-08 02:19:20'),(40,'account.clients','Account Clients','Show clients from selected account/subscription',1,'label label-danger','2015-12-07 20:54:09','2015-12-08 02:16:20'),(41,'account.stores','Account Stores','Show stores from selected account',1,'label label-primary','2015-12-07 20:54:48','2015-12-08 02:19:26'),(42,'account.employees','Account Employees','Show employees from selected account',1,'label label-danger','2015-12-07 20:55:15','2015-12-08 02:18:55'),(43,'account.users','Account Users','Show users from selected account',1,'label label-danger','2015-12-07 20:55:35','2015-12-08 02:20:34'),(44,'account.settings','Account Settings','Show settings from selected account',1,'label label-info','2015-12-07 20:56:03','2015-12-08 02:19:02'),(45,'account.update','Update Account / Subscription','Save changes on account / subscription info',1,'label label-danger','2015-12-07 20:56:38','2015-12-08 02:19:42'),(46,'permission.access','Access Permission Module','Access Permission Module',0,'label label-primary','2015-12-07 21:18:48','2015-12-07 21:18:48'),(47,'account.billing','Account Billing ','Access billing transaction on selected subscription',1,'label label-danger','2015-12-08 01:34:43','2015-12-08 02:16:04'),(48,'view.stores','Show Assigned Stores (Store Admins)','Show assigned store (Store Admins)',1,'label label-primary','2015-12-08 02:04:05','2016-04-16 02:28:36'),(49,'user.edit','Edit User','Edit User (View only)',1,'label label-primary','2015-12-08 02:53:39','2015-12-08 02:54:21'),(50,'view.subscriptions','Subscription List','Subscription List',1,'label label-danger','2015-12-09 20:39:21','2016-06-13 17:11:32'),(51,'view.invoices','Subscription Invoice List','Subscription Invoice Listing',0,'label label-warning','2015-12-09 20:40:49','2016-04-16 02:28:13'),(52,'store.employees','Store Employees','Show list of store employees',1,'label label-warning','2015-12-09 23:01:36','2015-12-09 23:09:02'),(53,'store.payroll','Store Payroll','Show store payroll transactions',1,'label label-primary','2015-12-09 23:02:18','2015-12-09 23:09:10'),(54,'store.deductions','Store Deductions','Show uploaded deduction transactions from the selected store',1,'label label-danger','2015-12-09 23:03:10','2016-09-05 21:10:46'),(55,'store.pdr','Store Payroll Data Report (PDR)','Show store payroll data report transactions',1,'label label-warning','2015-12-09 23:04:07','2015-12-09 23:09:20'),(56,'store.dtr','Store Daily Time Record (DTR)','Show daily time record from the selected store',1,'label label-default','2015-12-09 23:05:09','2015-12-09 23:08:56'),(57,'store.billing','Store Billing','Show store billing transactions',1,'label label-primary','2015-12-09 23:05:52','2015-12-09 23:08:49'),(58,'store.settings','Store Settings ','Show store settings',1,'label label-primary','2015-12-09 23:06:32','2015-12-09 23:09:31'),(59,'employee.edit.id','Edit Employee ID','Allow user to edit employee ID',1,'label label-info','2015-12-09 23:19:22','2015-12-10 00:34:01'),(60,'employee.edit.firstname','Edit Employee First Name','Allow user to edit employee\'s first name',1,'label label-info','2015-12-10 00:33:50','2015-12-10 00:34:08'),(61,'employee.edit.middlename','Edit Employee Middle Name','allow user to edit employee\'s middle name',1,'label label-success','2015-12-10 00:35:32','2015-12-10 00:36:15'),(62,'employee.edit.lastname','Edit Employee Last Name','Allow user to edit employee\'s lastname',1,'label label-default','2015-12-10 00:38:36','2015-12-10 00:38:36'),(63,'department.access','Department Access','Access to department module',1,'label label-info','2015-12-13 21:44:59','2015-12-13 21:45:42'),(64,'department.search','Search Department','Allow search of departments to append',1,'label label-info','2015-12-13 22:19:09','2015-12-13 22:19:09'),(65,'department.store.append','Add New Department to Store','Allow add new department to selected store',1,'label label-danger','2015-12-13 22:19:41','2015-12-13 22:19:41'),(66,'overtime.type.access','Access Overtime Types','Allow access to overtime types module',1,'label label-default','2015-12-14 18:51:51','2015-12-14 18:51:51'),(67,'report.column.access','Report Column Access','Access to report column module',0,'label label-warning','2015-12-18 15:49:56','2015-12-18 15:49:56'),(68,'report.designer.access','Report Designer','Access to report designing module',1,'label label-success','2015-12-18 15:50:30','2015-12-18 15:50:30'),(69,'report.type.access','Report Type','Access to report type module',0,'label label-default','2015-12-18 22:17:38','2015-12-18 22:17:38'),(70,'users.access','Overall User List','Access to User Listing',0,'label label-primary','2015-12-28 06:26:47','2015-12-28 06:26:47'),(71,'user.search','Search User','Allow search on users',0,'label label-success','2016-01-04 02:39:33','2016-01-04 02:39:33'),(72,'user.append.store','Add Store User','Allow adding of user to stores',0,'label label-danger','2016-01-04 02:40:10','2016-01-04 02:40:10'),(73,'user.append.subscription','Add Subscription User','Allow to add user to subscriptions',0,'label label-warning','2016-01-04 02:40:48','2016-01-04 02:40:48'),(74,'employee.edit.suffix','Edit Employee Suffix','Allow edit on employee suffix',1,'label label-default','2016-01-11 15:46:32','2016-01-11 15:46:32'),(75,'pdr.batch.upload','Batch PDR Upload','Batch PDR Upload',1,'label label-primary','2016-03-10 17:46:51','2016-03-10 17:46:51'),(76,'employee.edit.salary-history','Edit Salary History','Edit Salary History',1,'label label-danger','2016-03-15 18:55:35','2016-03-15 18:55:35'),(77,'employee.edit.position-history','Edit Position History','Edit Position History',1,'label label-success','2016-03-15 18:58:59','2016-03-15 18:58:59'),(78,'employee.edit.disciplinary-action','Edit Disciplinary Actions','Edit Disciplinary Actions',1,'label label-default','2016-03-15 19:03:37','2016-03-15 19:03:37'),(79,'employee.edit.benefits','Edit Employee Benefits','Edit Employee Benefits',1,'label label-info','2016-03-23 18:59:01','2016-03-23 18:59:01'),(80,'employee.edit.medical-history','Edit Employee Medical History','Edit Employee Medical History',1,'label label-danger','2016-03-23 19:17:18','2016-03-23 19:17:18'),(81,'employee.edit.appraisal','Edit Employee Appraisal','Edit Employee Appraisal',1,'label label-primary','2016-03-23 19:17:43','2016-03-23 19:17:43'),(82,'employee.edit.education','Edit Employee Education','Edit Employee Education',1,'label label-warning','2016-03-23 19:30:25','2016-03-23 19:30:25'),(83,'employee.edit.identification','Edit Employee Identification numbers','Edit Employee Identification numbers',1,'label label-primary','2016-03-23 19:32:17','2016-03-23 19:32:17'),(84,'employee.edit.training','Edit Employee Training','Edit Employee Training',1,'label label-warning','2016-03-23 19:32:51','2016-03-23 19:32:51'),(85,'employee.edit.store-history','Edit Employee Store History','Edit Employee Store History',1,'label label-primary','2016-03-23 19:33:21','2016-05-13 01:27:28'),(86,'employee.edit.hireddate','Edit Employee Hired Date','Edit Employee Hired Date',1,'label label-info','2016-03-23 19:36:14','2016-03-23 19:36:14'),(87,'employee.edit.separateddate','Edit Employee Separate Date','Edit Employee Separate Date',1,'label label-success','2016-03-23 19:36:54','2016-03-23 19:36:54'),(88,'employee.edit.employee-status','Edit Employee Status','Edit Employee Status',1,'label label-danger','2016-03-23 19:46:06','2016-03-23 19:46:06'),(89,'employee.edit.department','Edit Employee Department','Edit Employee Department',1,'label label-primary','2016-03-23 19:46:40','2016-03-23 19:46:40'),(90,'employee.edit.employee-level','Edit Employee Level','Edit Employee Level',1,'label label-info','2016-03-23 19:47:19','2016-03-23 19:47:19'),(91,'employee.edit.vlcredits','Edit Employee VL Credits','Edit Employee VL Credits',1,'label label-success','2016-03-23 19:47:50','2016-03-23 19:47:50'),(92,'employee.edit.slcredits','Edit Employee SL Credits','Edit Employee SL Credits',1,'label label-success','2016-03-23 19:48:07','2016-03-23 19:48:07'),(93,'employee.edit.pay-frequency','Edit Employee Pay Frequency','Edit Employee Pay Frequency',1,'label label-danger','2016-03-23 19:48:39','2016-03-23 19:48:39'),(94,'employee.edit.witholdingtax','Edit Employee Witholding Tax','Edit Employee Witholding Tax',1,'label label-success','2016-03-23 19:49:03','2016-03-23 19:49:03'),(95,'employee.edit.ssspremium','Edit Employee SSS Premium','Edit Employee SSS Premium',1,'label label-default','2016-03-23 19:49:31','2016-03-23 19:49:31'),(96,'employee.edit.philhealth','Edit Employee PhilHealth','Edit Employee PhilHealth',1,'label label-warning','2016-03-23 19:49:57','2016-03-23 19:49:57'),(97,'employee.edit.height','Edit Employee Height','Edit Employee Height',1,'label label-primary','2016-03-23 19:50:16','2016-03-23 19:50:16'),(98,'employee.edit.weight','Edit Employee Weight','Edit Employee Weight',1,'label label-success','2016-03-23 19:50:52','2016-03-23 19:50:52'),(99,'employee.edit.marital-status','Edit Employee Marital Status','Edit Employee Marital Status',1,'label label-success','2016-03-23 19:51:19','2016-03-23 19:51:19'),(100,'employee.edit.citizenship','Edit Employee Citizenship','Edit Employee Citizenship',1,'label label-info','2016-03-23 19:51:41','2016-03-23 19:51:41'),(101,'employee.edit.religion','Edit Employee Religion','Edit Employee Religion',1,'label label-warning','2016-03-23 19:51:58','2016-03-23 19:51:58'),(102,'employee.edit.bloodtype','Edit Employee Blood Type','Edit Employee Blood Type',1,'label label-warning','2016-03-23 19:52:31','2016-03-23 19:52:31'),(103,'employee.edit.spouse-name','Edit Employee Spouse Name','Edit Employee Spouse Name',1,'label label-info','2016-03-23 19:53:19','2016-03-23 19:53:19'),(104,'employee.edit.dependents','Edit Employee Dependents','Edit Employee Dependents',1,'label label-success','2016-03-23 19:53:34','2016-03-23 19:53:34'),(105,'employee.edit.spouse-contact','Edit Employee Spouse Contact','Edit Employee Spouse Contact',1,'label label-success','2016-03-23 19:54:30','2016-03-23 19:54:30'),(106,'employee.edit.dependent-table','Edit Employee Dependents Table','Edit Employee Dependents Table',1,'label label-default','2016-03-23 19:55:19','2016-03-23 19:55:19'),(107,'employee.edit.remarks','Edit Employee Remarks','Edit Employee Remarks',1,'label label-info','2016-03-23 19:56:19','2016-03-23 19:56:19'),(109,'employee.edit.birthdate','Edit Employee Birthdate','Edit Employee Birthdate',1,'label label-primary','2016-03-23 20:08:38','2016-03-23 20:08:38'),(110,'employee.edit.contactnum','Edit Employee Contact Number','Edit Employee Contact Number',1,'label label-default','2016-03-23 20:09:03','2016-03-23 20:09:03'),(111,'employee.edit.gender','Edit Employee Gender','Edit Employee Gender',1,'label label-success','2016-03-23 20:09:39','2016-03-23 20:09:39'),(112,'employee.edit.image','Edit Employee Image','Edit Employee Image',1,'label label-info','2016-03-23 20:10:02','2016-03-23 20:10:02'),(113,'employee.edit.atm-number','Edit Employee ATM Number','Edit Employee ATM Number',1,'label label-success','2016-03-23 20:17:29','2016-03-23 20:17:29'),(114,'employee.edit.tax-id-number','Edit Employee Tax ID Number','Edit Employee Tax ID Number',1,'label label-warning','2016-03-23 20:17:53','2016-03-23 20:17:53'),(115,'employee.edit.sss-number','Edit Employee SSS Number','Edit Employee SSS Number',1,'label label-info','2016-03-23 20:18:21','2016-03-23 20:18:21'),(116,'employee.edit.philhealth-number','Edit Employee PhilHealth Number','Edit Employee PhilHealth Number',1,'label label-danger','2016-03-23 20:18:42','2016-03-23 20:18:42'),(117,'employee.edit.pagibig-number','Edit Employee Pag-ibig Number','Edit Employee Pag-ibig Number',1,'label label-info','2016-03-23 20:19:02','2016-03-23 20:19:02'),(118,'employee.edit.misc.benefits','Edit Employee Misc. Benefits','Edit Employee Misc. Benefits',1,'label label-default','2016-03-25 02:05:07','2016-03-25 02:05:07'),(119,'employee.edit.addresses','Edit Employee Addresses','Edit Employee Addresses',1,'label label-info','2016-03-26 13:29:40','2016-03-26 13:29:40'),(120,'list.all.stores','Allow user to list all stores','Allow user to list all stores',1,'label label-default','2016-03-27 19:52:52','2016-03-27 19:52:52'),(121,'employee.send.registration.codes','Send Registration Codes to an Employee','Send Registration Codes to an Employee',1,'label label-default','2016-04-15 21:36:15','2016-04-15 21:36:15'),(122,'batch.process','Allow user to do batch processing on payroll','Allow user to do batch processing on payroll',1,'label label-primary','2016-04-16 02:29:27','2016-04-24 03:06:15'),(123,'view.account.settings','Allow user to view their account settings','Allow user to view their account settings',0,'label label-info','2016-04-16 02:29:55','2016-04-16 02:29:55'),(124,'view.accounts','Show employee accounts','show employee accounts',1,'label label-info','2016-04-20 14:09:21','2016-04-20 14:09:21'),(125,'view.timeline','allow user to view timeline','allow user to view timeline',1,'label label-primary','2016-04-20 14:15:42','2016-04-20 14:15:42'),(126,'payroll.compute','Access to employee payroll under basic package','Access to employee payroll under basic package',1,'label label-success','2016-04-23 05:45:05','2016-06-15 04:27:39'),(127,'payroll.deductions','Access to employee deductions under basic package','Access to employee deductions under basic package',1,'label label-primary','2016-04-23 05:45:30','2016-08-27 12:33:28'),(128,'view.payroll.periods','Allow user to open/close payroll periods','Allow user to open/close payroll periods',1,'label label-danger','2016-04-24 03:18:56','2016-05-04 13:42:00'),(129,'approve.payroll.period','Allow user to approve payroll periods','Allow user to approve payroll periods',1,'label label-default','2016-04-24 05:56:16','2016-04-24 05:56:16'),(130,'create.payroll.period','Allow user to create new payroll period','Allow user to create new payroll period',1,'label label-danger','2016-04-24 06:00:03','2016-04-24 06:00:03'),(131,'manual.pdr','Access to encode PDR manually','Access to encode PDR manually',1,'label label-info','2016-04-28 02:19:23','2016-04-28 02:19:23'),(132,'import.pdr','Access to import PDR excel file','Access to import PDR excel file',1,'label label-info','2016-04-28 02:19:48','2016-04-28 02:19:48'),(133,'download.pdr.form','Allow user to download PDR form in excel format','Allow user to download PDR form in excel format',1,'label label-primary','2016-04-28 02:20:58','2016-04-28 02:20:58'),(134,'approve.pdr','Allow user to approve PDR after checking','Allow user to approve PDR after checking',1,'label label-danger','2016-04-28 03:45:01','2016-04-28 03:45:01'),(135,'cancel.pdr','Allow user to cancel PDR if found incorrect','Allow user to cancel PDR if found incorrect',1,'label label-danger','2016-04-28 03:45:30','2016-04-28 03:45:30'),(136,'view.reports','Allow user to access reporting','Allow user to access reporting',1,'label label-danger','2016-05-04 13:42:33','2016-05-04 13:42:33'),(137,'store.adjustments','Store Adjustments','Store Adjustments',1,'label label-success','2016-05-04 16:15:34','2016-05-04 16:15:34'),(139,'employee.report','Allow user to generate employee reports','Allow user to generate employee reports',1,'label label-default','2016-05-05 04:03:12','2016-05-05 04:03:12'),(140,'add.role','Allow admin to create roles','Allow admin to create roles',0,'label label-info','2016-05-08 01:52:51','2016-05-08 01:52:51'),(141,'employee.edit.time-settings','Edit Employee Time Settings/Sched','Edit Employee Time Settings/Sched',1,'label label-success','2016-05-16 02:58:26','2016-05-16 02:58:26'),(142,'leave.update','Update Leave','Update Leave Application',1,'label label-primary','2016-06-14 16:16:25','2016-06-14 16:16:25'),(143,'overtime.approve','Approve Overtime','Approve Overtime Applications',1,'label label-warning','2016-06-14 19:17:15','2016-06-14 19:17:15'),(144,'overtime.update','Update Overtime','Update Overtime Application',1,'label label-warning','2016-06-14 19:57:08','2016-06-14 19:57:08'),(145,'undertime.approve','Approve Undertime','Approve Undertime Applications',1,'label label-primary','2016-06-14 20:33:48','2016-06-14 20:33:48'),(146,'undertime.update','Update Undertime','Update Undertime Application',1,'label label-warning','2016-06-14 20:34:24','2016-06-14 20:34:24'),(147,'employee.edit.schedule-template','Edit Employee Schedule Template','Edit Employee Schedule Template',1,'label label-warning','2016-06-17 03:15:44','2016-06-17 03:15:44'),(148,'post.payroll','Post Payroll Transaction','Post Payroll Transaction',1,'label label-success','2016-07-19 09:43:20','2016-07-19 09:43:20'),(149,'employee.search.all','Search All Employees','Allow user to search all employees under his/her assigned subscription',1,'label label-default','2016-07-25 19:23:12','2016-07-25 19:23:12'),(150,'approve.dtr','Allow user to approve DTR','Allow user to approve DTR',1,'label label-primary','2016-07-30 07:55:20','2016-07-30 07:55:20'),(151,'leave.cancel','Cancel Leave','Cancel Leave Applications',1,'label label-primary','2017-01-29 18:48:18','2017-01-29 18:48:18'),(152,'overtime.cancel','Cancel Overtime','Cancel Overtime',1,'label label-default','2017-01-29 19:49:50','2017-01-29 19:49:50'),(153,'undertime.cancel','Cancel Undertime','Cancel Undertime',1,'label label-info','2017-01-30 21:47:55','2017-01-30 21:47:55'),(154,'purchase.request.approve','Approve Purchase Requests','Approve Purchase Requests',1,'label label-danger','2017-01-31 09:56:35','2017-01-31 09:56:35'),(155,'purchase.request.cancel','Cancel Purchase Request','Cancel Purchase Request',1,'label label-info','2017-01-31 09:57:09','2017-01-31 09:57:09'),(156,'service.request.approve','Approve Service Request','Approve Service Request',1,'label label-primary','2017-01-31 09:57:31','2017-01-31 09:57:31'),(157,'service.request.cancel','Cancel Service Request','Cancel Service Request',1,'label label-primary','2017-01-31 09:57:55','2017-01-31 09:57:55'),(158,'memorandum.create','Create New Memorandum','Create New Memorandum',1,'label label-success','2017-02-04 11:51:09','2017-02-04 11:51:09'),(159,'memorandum.edit','Edit Memorandum','Edit Memorandum',1,'label label-danger','2017-02-04 12:19:57','2017-02-04 12:19:57'),(160,'memorandum.approve','Approve Memorandum','Approve Memorandum',1,'label label-default','2017-02-04 12:20:24','2017-02-04 12:20:24'),(161,'memorandum.cancel','Cancel Memorandum','Cancel Memorandum',1,'label label-default','2017-02-04 12:23:28','2017-02-04 12:23:28'),(162,'policy.resolution.create','Create New Policy and Resolution','Create New Policy and Resolution',1,'label label-default','2017-02-04 17:31:59','2017-02-04 17:31:59'),(163,'policy.resolution.edit','Edit Policy / Resolution','Edit Policy / Resolution',1,'label label-success','2017-02-04 17:32:28','2017-02-04 17:34:16'),(164,'policy.resolution.approve','Approve Policy / Resolution','Approve Policy / Resolution',1,'label label-default','2017-02-04 17:32:53','2017-02-04 17:33:06'),(165,'policy.resolution.cancel','Cancel Policy / Resolution','Cancel Policy / Resolution',1,'label label-primary','2017-02-04 17:33:34','2017-02-04 17:33:49'),(166,'employee.contribution.report','Employee Contribution Report','Employee Contribution Report',1,'label label-danger','2017-03-15 04:11:05','2017-03-15 04:11:05'),(167,'payroll.factor.report','Payroll Factor Report','Payroll Factor Report',1,'label label-danger','2017-03-15 04:11:23','2017-03-15 04:11:23'),(168,'payroll.summary','Payroll Summary Report','Payroll Summary Report',1,'label label-info','2017-03-15 04:11:41','2017-03-15 04:11:41'),(169,'custom.report','Custom Report','Custom Report',1,'label label-success','2017-03-15 04:12:18','2017-03-15 04:12:18'),(170,'payslip.report','Payslip Report','Payslip Report',1,'label label-danger','2017-03-15 04:12:34','2017-03-15 04:12:34'),(171,'remittance.accounting.report','Remittance Accounting Report','Remittance Accounting Report',1,'label label-primary','2017-03-15 04:13:09','2017-03-15 04:13:09'),(172,'receive.item.from.store','Receive Item from Store','Receive Item from Store',1,'label label-primary','2017-05-19 07:13:46','2017-05-19 08:00:25'),(173,'decline.item.from.store','Decline Item from Store','Decline Item from Store',1,'label label-default','2017-05-19 07:14:08','2017-05-19 08:00:54'),(174,'add.stock.transfer.log','Add Stock Transfer Log','Add Stock Transfer Log',1,'label label-info','2017-05-19 07:14:45','2017-05-19 07:14:45'),(175,'view.stock.transfer.log','View Stock Transfer Logs','View Stock Transfer Logs',1,'label label-info','2017-05-19 07:15:04','2017-05-19 07:15:04'),(176,'edit.stock.transfer.log','Edit Stock Transfer Logs','Edit Stock Transfer Logs',1,'label label-danger','2017-05-19 07:15:31','2017-05-19 07:15:31'),(177,'delete.stock.transfer.log','Delete Stock Transfer Logs','Delete Stock Transfer Logs',1,'label label-default','2017-05-19 07:15:51','2017-05-19 07:15:51'),(178,'edit.stock.transfer','Edit Stock Transfers','Edit Stock Transfers',1,'label label-info','2017-05-19 07:16:43','2017-05-19 07:16:43'),(179,'add.stock.transfer','Add Stock Transfers','Add Stock Transfers',1,'label label-warning','2017-05-19 07:16:59','2017-05-19 07:16:59'),(180,'receive.item.from.warehouse','Receive Item from Warehouse','Receive Item from Warehouse',1,'label label-danger','2017-05-19 08:36:44','2017-05-19 08:36:44'),(181,'receive.item.from.supplier','Receive Item from Supplier','Receive Item from Supplier',0,'label label-info','2017-05-19 08:37:23','2017-05-19 08:37:23'),(182,'recent.messages','Check Recent Messages','Check Recent Messages',0,'0','2018-05-06 21:15:08','2018-05-06 21:31:26'),(183,'resolved.messages','Check Resolved Messages','Check Resolved Messages',0,'0','2018-05-06 21:29:20','2018-05-06 21:31:41'),(184,'pending.messages','Pending Messages',NULL,0,'0','2018-05-06 21:33:45','2018-05-06 21:33:45'),(185,'unread.messages','Unread messages',NULL,0,'0','2018-05-06 21:33:59','2018-05-06 21:33:59'),(186,'inbox.messages','Inbox Messages',NULL,0,'0','2018-05-06 21:34:10','2018-05-06 21:34:10'),(187,'buyer.messages','Buyer Messages',NULL,0,'0','2018-05-06 21:34:22','2018-05-06 21:34:22'),(188,'ebay.messages','Ebay Messages',NULL,0,'0','2018-05-06 21:34:36','2018-05-06 21:34:36'),(189,'sent.messages','Sent Messages',NULL,0,'0','2018-05-06 21:34:48','2018-05-06 21:34:48'),(190,'trash.messages','Trash Messages',NULL,0,'0','2018-05-06 21:34:57','2018-05-06 21:34:57'),(191,'add.shipping','add.shipping','add.shipping',0,'0','2018-05-12 07:02:55','2018-05-12 07:02:55'),(192,'edit.shipping','edit.shipping','edit.shipping',0,'0','2018-05-12 07:03:10','2018-05-12 07:03:10'),(193,'view.shipping','view.shipping','view.shipping',0,'0','2018-05-12 07:03:24','2018-05-12 07:03:24'),(194,'delete.shipping','delete.shipping','delete.shipping',0,'0','2018-05-12 07:03:38','2018-05-12 07:03:38'),(195,'add.oos','add.oos','add.oos',0,'0','2018-05-12 07:03:50','2018-05-12 07:03:50'),(196,'edit.oos','edit.oos','edit.oos',0,'0','2018-05-12 07:04:01','2018-05-12 07:04:01'),(197,'view.oos','view.oos','view.oos',0,'0','2018-05-12 07:04:14','2018-05-12 07:04:14'),(198,'delete.oos','delete.oos','delete.oos',0,'0','2018-05-12 07:04:29','2018-05-12 07:04:29'),(199,'reopen.resolve','reopen.resolve','reopen.resolve',0,'0','2018-05-12 07:06:41','2018-05-12 07:06:41'),(200,'close.on.comment','close.on.comment','close.on.comment',0,'0','2018-05-12 17:46:24','2018-05-12 17:46:24');
/*!40000 ALTER TABLE `tb_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_philhealth_settings`
--

DROP TABLE IF EXISTS `tb_philhealth_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_philhealth_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minbracket` decimal(9,2) NOT NULL,
  `maxbracket` decimal(9,2) NOT NULL,
  `salary_credit` decimal(9,2) NOT NULL,
  `employeeshare` decimal(9,2) NOT NULL,
  `employershare` decimal(9,2) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`subscription`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_philhealth_settings`
--

LOCK TABLES `tb_philhealth_settings` WRITE;
/*!40000 ALTER TABLE `tb_philhealth_settings` DISABLE KEYS */;
INSERT INTO `tb_philhealth_settings` VALUES (1,1,'1','8,999.99** and below',0.01,8999.99,8000.00,100.00,100.00,2,0,'2015-02-13 15:25:31','2016-05-09 00:39:41'),(2,1,'2','9,000.00 - 9,999.99',9000.00,9999.99,9000.00,112.50,112.50,2,0,'2015-02-13 15:26:37','2015-12-15 21:22:48'),(3,1,'3','10,000.00 - 10,999.99',10000.00,10999.99,10000.00,125.00,125.00,2,0,'2015-02-13 15:27:02','2015-12-15 21:23:16'),(4,1,'4','11,000.00 - 11,999.99',11000.00,11999.99,11000.00,137.50,137.50,2,0,'2015-02-13 15:27:29','2015-12-15 21:23:38'),(5,1,'5','12,000.00 - 12,999.99',12000.00,12999.99,12000.00,150.00,150.00,2,0,'2015-02-13 15:27:54','2015-12-15 21:24:15'),(6,1,'6','13,000.00 - 13,999.99',13000.00,13999.99,13000.00,162.50,162.50,2,0,'2015-02-13 15:28:14','2015-12-15 21:24:36'),(7,1,'7','14,000.00 - 14,999.99',14000.00,14999.99,14000.00,175.00,175.00,2,0,'2015-02-13 15:28:32','2015-12-15 21:25:02'),(8,1,'8','15,000.00 - 15,999.99',15000.00,15999.99,15000.00,187.50,187.50,2,0,'2015-02-13 15:28:48','2015-12-15 21:25:21'),(9,1,'9','16,000.00 - 16,999.99',16000.00,16999.99,16000.00,200.00,200.00,2,0,'2015-02-13 15:29:07','2015-12-15 21:25:50'),(10,1,'10','17,000.00 - 17,999.99',17000.00,17999.99,17000.00,212.50,212.50,2,0,'2015-02-13 15:29:26','2015-12-15 21:26:11'),(11,1,'11','18,000.00 - 18,999.99',18000.00,18999.99,18000.00,225.00,225.00,2,0,'2015-02-13 15:29:42','2015-12-15 21:26:31'),(12,1,'12','19,000.00 - 19,999.99',19000.00,19999.99,19000.00,237.50,237.50,2,0,'2015-02-13 15:30:01','2015-12-15 21:26:51'),(13,1,'13','20,000.00 - 20,999.99',20000.00,20999.99,20000.00,250.00,250.00,2,0,'2015-02-13 15:30:23','2015-12-15 21:27:10'),(14,1,'14','21,000.00 - 21,999.99',21000.00,21999.99,21000.00,262.50,262.50,2,0,'2015-02-13 15:30:44','2015-12-15 21:27:29'),(15,1,'15','22,000.00 - 22,999.99',22000.00,22999.99,22000.00,275.00,275.00,2,0,'2015-02-13 15:31:03','2015-12-15 21:27:52'),(16,1,'16','23,000.00 - 23,999.99',23000.00,23999.99,23000.00,287.50,287.50,2,0,'2015-02-13 15:31:26','2015-12-15 21:28:12'),(17,1,'17','24,000.00 - 24,999.99',24000.00,24999.99,24000.00,300.00,300.00,2,0,'2015-02-13 15:31:40','2015-12-15 21:28:30'),(18,1,'18','25,000.00 - 25,999.99',25000.00,25999.99,25000.00,312.50,312.50,2,0,'2015-02-13 15:31:58','2015-12-15 21:28:52'),(19,1,'19','26,000.00 - 26,999.99',26000.00,26999.99,26000.00,325.00,325.00,2,0,'2015-02-13 15:32:13','2015-12-15 21:29:11'),(20,1,'20','27,000.00 - 27,999.99',27000.00,27999.99,27000.00,337.50,337.50,2,0,'2015-02-13 15:32:28','2015-12-15 21:29:31'),(21,1,'21','28,000.00 - 28,999.99',28000.00,28999.99,28000.00,350.00,350.00,2,0,'2015-02-13 15:32:44','2015-12-15 21:29:56'),(22,1,'22','29,000.00 - 29,999.99',29000.00,29999.99,29000.00,362.50,362.50,2,0,'2015-02-13 15:33:04','2015-12-15 21:30:15'),(23,1,'23','30,000.00 - 30,999.99',30000.00,30999.99,30000.00,375.00,375.00,2,0,'2015-02-13 15:33:26','2015-12-15 21:30:33'),(24,1,'24','31,000.00 - 31,999.99',31000.00,31999.99,31000.00,387.50,387.50,2,0,'2015-02-13 15:33:41','2015-12-15 21:30:52'),(25,1,'25','32,000.00 - 32,999.99',32000.00,32999.99,32000.00,400.00,400.00,2,0,'2015-02-13 15:34:05','2015-12-15 21:31:18'),(26,1,'26','33,000.00 - 33,999.99',33000.00,33999.99,33000.00,412.50,412.50,2,0,'2015-02-13 15:34:23','2015-12-15 21:31:43'),(27,1,'27','34,000.00 - 34,999.99',34000.00,34999.99,34000.00,425.00,425.00,2,0,'2015-02-13 15:34:48','2015-12-15 21:32:22'),(28,1,'28','35,000.00 and up',35000.00,999999.00,35000.00,437.50,437.50,2,0,'2015-02-13 15:35:07','2015-12-15 21:32:49'),(29,2,'1','8,999.99** and below',0.01,8999.99,8000.00,100.00,100.00,2,0,'2015-02-13 15:25:31','2016-05-09 00:39:41'),(30,2,'2','9,000.00 - 9,999.99',9000.00,9999.99,9000.00,112.50,112.50,2,0,'2015-02-13 15:26:37','2015-12-15 21:22:48'),(31,2,'3','10,000.00 - 10,999.99',10000.00,10999.99,10000.00,125.00,125.00,2,0,'2015-02-13 15:27:02','2015-12-15 21:23:16'),(32,2,'4','11,000.00 - 11,999.99',11000.00,11999.99,11000.00,137.50,137.50,2,0,'2015-02-13 15:27:29','2015-12-15 21:23:38'),(33,2,'5','12,000.00 - 12,999.99',12000.00,12999.99,12000.00,150.00,150.00,2,0,'2015-02-13 15:27:54','2015-12-15 21:24:15'),(34,2,'6','13,000.00 - 13,999.99',13000.00,13999.99,13000.00,162.50,162.50,2,0,'2015-02-13 15:28:14','2015-12-15 21:24:36'),(35,2,'7','14,000.00 - 14,999.99',14000.00,14999.99,14000.00,175.00,175.00,2,0,'2015-02-13 15:28:32','2015-12-15 21:25:02'),(36,2,'8','15,000.00 - 15,999.99',15000.00,15999.99,15000.00,187.50,187.50,2,0,'2015-02-13 15:28:48','2015-12-15 21:25:21'),(37,2,'9','16,000.00 - 16,999.99',16000.00,16999.99,16000.00,200.00,200.00,2,0,'2015-02-13 15:29:07','2015-12-15 21:25:50'),(38,2,'10','17,000.00 - 17,999.99',17000.00,17999.99,17000.00,212.50,212.50,2,0,'2015-02-13 15:29:26','2015-12-15 21:26:11'),(39,2,'11','18,000.00 - 18,999.99',18000.00,18999.99,18000.00,225.00,225.00,2,0,'2015-02-13 15:29:42','2015-12-15 21:26:31'),(40,2,'12','19,000.00 - 19,999.99',19000.00,19999.99,19000.00,237.50,237.50,2,0,'2015-02-13 15:30:01','2015-12-15 21:26:51'),(41,2,'13','20,000.00 - 20,999.99',20000.00,20999.99,20000.00,250.00,250.00,2,0,'2015-02-13 15:30:23','2015-12-15 21:27:10'),(42,2,'14','21,000.00 - 21,999.99',21000.00,21999.99,21000.00,262.50,262.50,2,0,'2015-02-13 15:30:44','2015-12-15 21:27:29'),(43,2,'15','22,000.00 - 22,999.99',22000.00,22999.99,22000.00,275.00,275.00,2,0,'2015-02-13 15:31:03','2015-12-15 21:27:52'),(44,2,'16','23,000.00 - 23,999.99',23000.00,23999.99,23000.00,287.50,287.50,2,0,'2015-02-13 15:31:26','2015-12-15 21:28:12'),(45,2,'17','24,000.00 - 24,999.99',24000.00,24999.99,24000.00,300.00,300.00,2,0,'2015-02-13 15:31:40','2015-12-15 21:28:30'),(46,2,'18','25,000.00 - 25,999.99',25000.00,25999.99,25000.00,312.50,312.50,2,0,'2015-02-13 15:31:58','2015-12-15 21:28:52'),(47,2,'19','26,000.00 - 26,999.99',26000.00,26999.99,26000.00,325.00,325.00,2,0,'2015-02-13 15:32:13','2015-12-15 21:29:11'),(48,2,'20','27,000.00 - 27,999.99',27000.00,27999.99,27000.00,337.50,337.50,2,0,'2015-02-13 15:32:28','2015-12-15 21:29:31'),(49,2,'21','28,000.00 - 28,999.99',28000.00,28999.99,28000.00,350.00,350.00,2,0,'2015-02-13 15:32:44','2015-12-15 21:29:56'),(50,2,'22','29,000.00 - 29,999.99',29000.00,29999.99,29000.00,362.50,362.50,2,0,'2015-02-13 15:33:04','2015-12-15 21:30:15'),(51,2,'23','30,000.00 - 30,999.99',30000.00,30999.99,30000.00,375.00,375.00,2,0,'2015-02-13 15:33:26','2015-12-15 21:30:33'),(52,2,'24','31,000.00 - 31,999.99',31000.00,31999.99,31000.00,387.50,387.50,2,0,'2015-02-13 15:33:41','2015-12-15 21:30:52'),(53,2,'25','32,000.00 - 32,999.99',32000.00,32999.99,32000.00,400.00,400.00,2,0,'2015-02-13 15:34:05','2015-12-15 21:31:18'),(54,2,'26','33,000.00 - 33,999.99',33000.00,33999.99,33000.00,412.50,412.50,2,0,'2015-02-13 15:34:23','2015-12-15 21:31:43'),(55,2,'27','34,000.00 - 34,999.99',34000.00,34999.99,34000.00,425.00,425.00,2,0,'2015-02-13 15:34:48','2015-12-15 21:32:22'),(56,2,'28','35,000.00 and up',35000.00,999999.00,35000.00,437.50,437.50,2,0,'2015-02-13 15:35:07','2015-12-15 21:32:49');
/*!40000 ALTER TABLE `tb_philhealth_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_policies`
--

DROP TABLE IF EXISTS `tb_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_policies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_policies`
--

LOCK TABLES `tb_policies` WRITE;
/*!40000 ALTER TABLE `tb_policies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_policies_resolutions`
--

DROP TABLE IF EXISTS `tb_policies_resolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_policies_resolutions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `policies_resolutions_subscription_foreign` (`subscription`),
  KEY `policies_resolutions_status_foreign` (`status`),
  KEY `policies_resolutions_user_foreign` (`user`),
  CONSTRAINT `policies_resolutions_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `policies_resolutions_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `policies_resolutions_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_policies_resolutions`
--

LOCK TABLES `tb_policies_resolutions` WRITE;
/*!40000 ALTER TABLE `tb_policies_resolutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_policies_resolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pos_transaction_details`
--

DROP TABLE IF EXISTS `tb_pos_transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pos_transaction_details` (
  `summary_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` decimal(9,2) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  KEY `pos_transaction_details_summary_id_foreign` (`summary_id`),
  KEY `pos_transaction_details_product_id_foreign` (`product_id`),
  CONSTRAINT `pos_transaction_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `tb_products` (`id`),
  CONSTRAINT `pos_transaction_details_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `tb_pos_transaction_summary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pos_transaction_details`
--

LOCK TABLES `tb_pos_transaction_details` WRITE;
/*!40000 ALTER TABLE `tb_pos_transaction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pos_transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pos_transaction_summary`
--

DROP TABLE IF EXISTS `tb_pos_transaction_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pos_transaction_summary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client` int(10) unsigned DEFAULT NULL,
  `transaction_type` int(10) unsigned NOT NULL,
  `receiptno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_form` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_transaction_summary_client_foreign` (`client`),
  KEY `pos_transaction_summary_transaction_type_foreign` (`transaction_type`),
  KEY `pos_transaction_summary_payment_form_foreign` (`payment_form`),
  KEY `pos_transaction_summary_user_foreign` (`user`),
  KEY `pos_transaction_summary_status_foreign` (`status`),
  CONSTRAINT `pos_transaction_summary_client_foreign` FOREIGN KEY (`client`) REFERENCES `tb_clients` (`id`),
  CONSTRAINT `pos_transaction_summary_payment_form_foreign` FOREIGN KEY (`payment_form`) REFERENCES `tb_payment_forms` (`id`),
  CONSTRAINT `pos_transaction_summary_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `pos_transaction_summary_transaction_type_foreign` FOREIGN KEY (`transaction_type`) REFERENCES `tb_transaction_types` (`id`),
  CONSTRAINT `pos_transaction_summary_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pos_transaction_summary`
--

LOCK TABLES `tb_pos_transaction_summary` WRITE;
/*!40000 ALTER TABLE `tb_pos_transaction_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pos_transaction_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pr_details`
--

DROP TABLE IF EXISTS `tb_pr_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pr_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `summary_id` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `requesttype` int(10) unsigned NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `purpose` longtext COLLATE utf8_unicode_ci NOT NULL,
  `quantity` decimal(9,2) NOT NULL,
  `unit` int(10) unsigned NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `pr_details_employee_foreign` (`employee`),
  KEY `pr_details_controlno_foreign` (`summary_id`),
  KEY `pr_details_requesttype_foreign` (`requesttype`),
  KEY `pr_details_unit_foreign` (`unit`),
  CONSTRAINT `pr_details_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `pr_details_requesttype_foreign` FOREIGN KEY (`requesttype`) REFERENCES `tb_request_types` (`id`),
  CONSTRAINT `pr_details_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `tb_pr_summary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pr_details_unit_foreign` FOREIGN KEY (`unit`) REFERENCES `tb_units` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pr_details`
--

LOCK TABLES `tb_pr_details` WRITE;
/*!40000 ALTER TABLE `tb_pr_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pr_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pr_summary`
--

DROP TABLE IF EXISTS `tb_pr_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pr_summary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `delivery_at` date NOT NULL,
  `remarks` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `supervisor` int(10) unsigned DEFAULT NULL,
  `supervisor_status` int(10) unsigned DEFAULT NULL,
  `supervisor_approved_at` datetime DEFAULT NULL,
  `manager` int(10) unsigned DEFAULT NULL,
  `manager_status` int(10) unsigned DEFAULT NULL,
  `manager_approved_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pr_summary_employee_foreign` (`employee`),
  KEY `pr_summary_subscription_foreign` (`subscription`),
  KEY `pr_summary_supervisor_foreign` (`supervisor`),
  KEY `pr_summary_manager_foreign` (`manager`),
  KEY `pr_summary_supervisor_status_foreign` (`supervisor_status`),
  KEY `pr_summary_manager_status_foreign` (`manager_status`),
  CONSTRAINT `pr_summary_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `pr_summary_manager_foreign` FOREIGN KEY (`manager`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `pr_summary_manager_status_foreign` FOREIGN KEY (`manager_status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `pr_summary_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `pr_summary_supervisor_foreign` FOREIGN KEY (`supervisor`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `pr_summary_supervisor_status_foreign` FOREIGN KEY (`supervisor_status`) REFERENCES `tb_statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pr_summary`
--

LOCK TABLES `tb_pr_summary` WRITE;
/*!40000 ALTER TABLE `tb_pr_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pr_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_price_types`
--

DROP TABLE IF EXISTS `tb_price_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_price_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_price_types`
--

LOCK TABLES `tb_price_types` WRITE;
/*!40000 ALTER TABLE `tb_price_types` DISABLE KEYS */;
INSERT INTO `tb_price_types` VALUES (1,'Retail Price','label label-success'),(2,'Wholesale Price','label label-danger'),(3,'Unit Cost','label label-warning');
/*!40000 ALTER TABLE `tb_price_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_code_categories`
--

DROP TABLE IF EXISTS `tb_product_code_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_code_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_code_categories`
--

LOCK TABLES `tb_product_code_categories` WRITE;
/*!40000 ALTER TABLE `tb_product_code_categories` DISABLE KEYS */;
INSERT INTO `tb_product_code_categories` VALUES (1,'GAMECLUB'),(2,'ITUNES'),(3,'BATTLENET'),(4,'PSN'),(5,'STEAM'),(6,'ESHOP'),(7,'XBOX LIVE'),(8,'GOOGLE PLAY'),(9,'PC GAMES');
/*!40000 ALTER TABLE `tb_product_code_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_code_uploads`
--

DROP TABLE IF EXISTS `tb_product_code_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_code_uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `batch_no` smallint(6) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `product_code_uploads_user_foreign` (`user`),
  CONSTRAINT `product_code_uploads_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_code_uploads`
--

LOCK TABLES `tb_product_code_uploads` WRITE;
/*!40000 ALTER TABLE `tb_product_code_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_code_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_codes`
--

DROP TABLE IF EXISTS `tb_product_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `category` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `product_codes_category_foreign` (`category`),
  CONSTRAINT `product_codes_category_foreign` FOREIGN KEY (`category`) REFERENCES `tb_product_code_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_codes`
--

LOCK TABLES `tb_product_codes` WRITE;
/*!40000 ALTER TABLE `tb_product_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_price`
--

DROP TABLE IF EXISTS `tb_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product` int(11) unsigned NOT NULL,
  `pricetype` int(11) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `unit` int(11) NOT NULL,
  `effectivitydate` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `product_price_product_foreign` (`product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_price`
--

LOCK TABLES `tb_product_price` WRITE;
/*!40000 ALTER TABLE `tb_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_stocks`
--

DROP TABLE IF EXISTS `tb_product_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_stocks` (
  `product` int(10) unsigned NOT NULL,
  `stocks` decimal(9,2) DEFAULT NULL,
  KEY `product_stocks_product_foreign` (`product`),
  CONSTRAINT `product_stocks_product_foreign` FOREIGN KEY (`product`) REFERENCES `tb_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_stocks`
--

LOCK TABLES `tb_product_stocks` WRITE;
/*!40000 ALTER TABLE `tb_product_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_supplier`
--

DROP TABLE IF EXISTS `tb_product_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_supplier` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product` int(11) unsigned NOT NULL,
  `supplier` int(11) unsigned NOT NULL,
  `startdate` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `product_supplier_product_foreign` (`product`),
  KEY `product_supplier_supplier_foreign` (`supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_supplier`
--

LOCK TABLES `tb_product_supplier` WRITE;
/*!40000 ALTER TABLE `tb_product_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_transactions`
--

DROP TABLE IF EXISTS `tb_product_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_transactions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `controlno` int(11) unsigned zerofill NOT NULL,
  `transactionrefno` int(11) unsigned zerofill NOT NULL,
  `transactiontype` int(11) NOT NULL,
  `entrytype` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `product` int(11) unsigned NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_number` bigint(20) NOT NULL,
  `product_code` int(10) unsigned DEFAULT NULL,
  `card_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_used` smallint(6) DEFAULT NULL,
  `pricetype` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `remarks` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`controlno`,`transactionrefno`,`transactiontype`,`entrytype`,`client`,`product`) USING BTREE,
  KEY `product_transactions_product_code_foreign` (`product_code`),
  KEY `product_transactions_controlno_foreign` (`controlno`),
  CONSTRAINT `product_transactions_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_product_code_uploads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_transactions_product_code_foreign` FOREIGN KEY (`product_code`) REFERENCES `tb_product_codes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_transactions`
--

LOCK TABLES `tb_product_transactions` WRITE;
/*!40000 ALTER TABLE `tb_product_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_productivity_transactions`
--

DROP TABLE IF EXISTS `tb_productivity_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_productivity_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transactiontype` int(11) NOT NULL,
  `supervisor` int(11) NOT NULL,
  `supervisor_status` int(11) NOT NULL,
  `supervisor_approved_at` datetime NOT NULL,
  `manager` int(11) NOT NULL,
  `manager_status` int(11) NOT NULL,
  `manager_approved_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_productivity_transactions`
--

LOCK TABLES `tb_productivity_transactions` WRITE;
/*!40000 ALTER TABLE `tb_productivity_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_productivity_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_products`
--

DROP TABLE IF EXISTS `tb_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `accountclass` int(11) NOT NULL,
  `glaccount` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `partnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serialnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lotnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expirydate` date NOT NULL,
  `max` int(11) NOT NULL,
  `min` int(11) NOT NULL,
  `orderpoint` int(11) NOT NULL,
  `remarks` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_products`
--

LOCK TABLES `tb_products` WRITE;
/*!40000 ALTER TABLE `tb_products` DISABLE KEYS */;
INSERT INTO `tb_products` VALUES (1,0,0,'W01','Website - 1 Page','','','','','','','','','0000-00-00',0,0,0,'',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_relationships`
--

DROP TABLE IF EXISTS `tb_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_relationships` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_relationships`
--

LOCK TABLES `tb_relationships` WRITE;
/*!40000 ALTER TABLE `tb_relationships` DISABLE KEYS */;
INSERT INTO `tb_relationships` VALUES (1,'Grand Mother','GM',1,1),(2,'Grand Father','GF',1,1),(3,'Mother','M',1,1),(4,'Father','F',1,1),(5,'Sister','S',1,1),(6,'Brother','B',1,1),(7,'Wife','W',1,1),(8,'Daughter','D',1,1),(9,'Son','S',1,1),(10,'Guardian','G',1,1),(11,'Others','',1,1),(12,'Husband','H',1,1),(13,'Uncle','U',1,1);
/*!40000 ALTER TABLE `tb_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_religions`
--

DROP TABLE IF EXISTS `tb_religions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_religions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_religions`
--

LOCK TABLES `tb_religions` WRITE;
/*!40000 ALTER TABLE `tb_religions` DISABLE KEYS */;
INSERT INTO `tb_religions` VALUES (1,'','RC'),(2,'',''),(3,'','ISL'),(4,'','JEW'),(5,'','O'),(6,'','PRO'),(7,'','INC'),(8,'','EVA'),(9,'','BPT'),(10,'','AGL'),(11,'','PIC'),(12,'','SDA'),(13,'','COC'),(14,'','4Q'),(15,'','EPS'),(16,'','A'),(17,'','PNT'),(18,'','FM'),(19,'','LDS'),(20,'','AL'),(21,'','FIL');
/*!40000 ALTER TABLE `tb_religions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_report_column_pay_frequency`
--

DROP TABLE IF EXISTS `tb_report_column_pay_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_report_column_pay_frequency` (
  `subscription` int(10) unsigned NOT NULL,
  `report_column` int(10) unsigned NOT NULL,
  `pay_frequency` int(10) unsigned NOT NULL,
  `formula` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  KEY `report_column_pay_frequency_subscription_foreign` (`subscription`),
  KEY `report_column_pay_frequency_report_column_foreign` (`report_column`),
  KEY `report_column_pay_frequency_pay_frequency_foreign` (`pay_frequency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_report_column_pay_frequency`
--

LOCK TABLES `tb_report_column_pay_frequency` WRITE;
/*!40000 ALTER TABLE `tb_report_column_pay_frequency` DISABLE KEYS */;
INSERT INTO `tb_report_column_pay_frequency` VALUES (1,103,1,'((work.hours * basic.rate) / 8) + (((work.hours) * (cola.rate / 8)) - (tardy * (cola.rate / 8 / 60))) + ((tardy * basic.rate) / 8 / 60)',1),(1,103,3,'(basic.rate / 2) - (tardy * ((basic.rate / 2) / 13) / 8 / 60)',1),(1,99,1,'(((work.hours * basic.rate) / 8) + (((work.hours) * (cola.rate / 8)) - (tardy * (cola.rate / 8 / 60))) + (total.overtime)) - ((tardy * basic.rate) / 8 / 60)',1),(1,99,3,'((basic.rate / 2) + (total.overtime)) - (tardy * ((basic.rate / 2) / 13) / 8 / 60)',1),(1,99,5,'(((basic.rate / 13) / 8) + (total.overtime)) - (tardy * (basic.rate / 13) / 8)',1),(1,89,1,'(tardy * basic.rate) / 8 / 60',1),(1,89,3,'(tardy * ((basic.rate / 2) / 13)) / 8 / 60',1),(1,105,1,'((((work.hours * basic.rate) / 8) - ((tardy * basic.rate) / 8 / 60)) * 1) / 12',1),(1,105,3,'basic.rate',1),(1,88,1,'(basic.rate * work.days)',1),(1,88,3,'(basic.rate / 2)',1),(1,102,1,'((work.hours * basic.rate) / 8) - ((tardy * basic.rate) / 8 / 60)',1),(1,102,3,'(basic.rate / 2) - (tardy * ((basic.rate / 2) / 13) / 8 / 60)',1),(2,129,6,'(basic.rate * work.days)',1),(2,129,8,'(basic.rate / 2)',1),(2,144,6,'((work.hours * basic.rate) / 8) + (((work.hours) * (cola.rate / 8)) - (tardy * (cola.rate / 8 / 60))) + ((tardy * basic.rate) / 8 / 60)',1),(2,144,8,'(basic.rate / 2) - (tardy * ((basic.rate / 2) / 13) / 8 / 60)',1),(2,140,6,'(((work.hours * basic.rate) / 8) + (((work.hours) * (cola.rate / 8)) - (tardy * (cola.rate / 8 / 60))) + (total.overtime)) - ((tardy * basic.rate) / 8 / 60)',1),(2,140,8,'((basic.rate / 2) + (total.overtime)) - (tardy * ((basic.rate / 2) / 13) / 8 / 60)',1),(2,140,10,'(((basic.rate / 13) / 8) + (total.overtime)) - (tardy * (basic.rate / 13) / 8)',1),(2,130,6,'(tardy * basic.rate) / 8 / 60',1),(2,130,8,'(tardy * ((basic.rate / 2) / 13)) / 8 / 60',1),(2,146,6,'((((work.hours * basic.rate) / 8) - ((tardy * basic.rate) / 8 / 60)) * 1) / 12',1),(2,146,8,'basic.rate',1),(2,143,6,'((work.hours * basic.rate) / 8) - ((tardy * basic.rate) / 8 / 60)',1),(2,143,8,'(basic.rate / 2) - (tardy * ((basic.rate / 2) / 13) / 8 / 60)',1);
/*!40000 ALTER TABLE `tb_report_column_pay_frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_report_columns`
--

DROP TABLE IF EXISTS `tb_report_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_report_columns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `threshold` decimal(8,2) DEFAULT NULL,
  `use_percentage` smallint(6) DEFAULT NULL,
  `check_threshold` smallint(6) DEFAULT NULL,
  `data_type` int(10) unsigned NOT NULL,
  `formula` longtext COLLATE utf8_unicode_ci NOT NULL,
  `access` int(11) NOT NULL,
  `has_account` int(11) NOT NULL,
  `payroll_item` int(10) unsigned DEFAULT NULL,
  `is_mandatory` smallint(6) DEFAULT NULL,
  `payroll_condition` int(10) unsigned DEFAULT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `report_columns_payroll_item_foreign` (`payroll_item`),
  CONSTRAINT `report_columns_payroll_item_foreign` FOREIGN KEY (`payroll_item`) REFERENCES `tb_payroll_items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_report_columns`
--

LOCK TABLES `tb_report_columns` WRITE;
/*!40000 ALTER TABLE `tb_report_columns` DISABLE KEYS */;
INSERT INTO `tb_report_columns` VALUES (1,NULL,'work.hours','Work Hours','','0',NULL,NULL,NULL,1,'',1,0,NULL,NULL,NULL,1,1,'2015-12-18 16:07:50','2015-12-18 20:00:54'),(2,NULL,'employee.id','Employee ID','','',NULL,NULL,NULL,1,'',1,0,NULL,NULL,NULL,1,1,'2015-12-18 18:39:32','2015-12-22 04:46:48'),(3,NULL,'employee.name','Employee Name','','',NULL,NULL,NULL,1,'',1,0,NULL,NULL,NULL,1,1,'2015-12-18 18:39:47','2015-12-22 04:46:56'),(5,NULL,'basic.rate','Basic Rate','','0',NULL,NULL,NULL,3,'',1,0,NULL,NULL,NULL,1,1,'2016-01-08 18:38:44','2016-01-08 18:38:44'),(6,NULL,'tardy','Tardy (Minutes)','','0',NULL,NULL,NULL,1,'',1,0,NULL,NULL,NULL,1,1,'2016-01-08 19:02:23','2016-01-08 19:02:23'),(12,NULL,'cola.rate','Daily Cola Rate','','0',NULL,NULL,NULL,3,'',1,0,NULL,NULL,NULL,1,1,'2016-02-21 05:24:12','2016-02-21 05:24:12'),(88,1,'basic.pay','Basic Pay','','0',0.00,0,0,3,'',0,0,NULL,1,0,2,1,'2016-05-09 03:24:55','2016-12-27 13:14:49'),(89,1,'tardiness.deductions','Tardiness Deductions','','0',0.00,0,0,3,'',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 11:06:50'),(90,1,'reg.pay','Regular Pay','','',NULL,NULL,NULL,3,'',0,0,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,1,'net.pay','Net Pay','','0',15.00,1,1,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-17 21:45:13'),(92,1,'overtime.types','Overtime Types','','0',NULL,NULL,NULL,3,'',0,0,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(93,1,'cola.pay','Cola Pay','','0',NULL,NULL,NULL,3,'',0,0,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(94,1,'deductions','Loan Deductions','','0',0.00,0,0,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2017-03-17 07:21:52'),(95,1,'sss.premium.ee','SSS Premium (Employee)','','0',0.00,0,0,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-17 21:57:44'),(96,1,'philhealth.premium.ee','PhilHealth Premium (Employee)','','0',0.00,0,0,3,'',0,1,NULL,0,0,2,1,'0000-00-00 00:00:00','2016-12-17 21:58:51'),(97,1,'hdmf.premium.ee','HDMF Premium (Employee)','','0',0.00,0,0,3,'',0,1,NULL,0,0,2,1,'0000-00-00 00:00:00','2016-12-17 21:59:09'),(98,1,'ecc.premium','ECC Premium','','0',NULL,NULL,NULL,3,'',0,1,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(99,1,'sss.base','SSS Base','','0',0.00,0,0,3,'',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 10:59:59'),(100,1,'total.overtime','Total Overtime','','0',0.00,0,0,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 11:11:42'),(101,1,'other.deductions','Other Deductions','','0',NULL,NULL,NULL,3,'',0,1,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(102,1,'philhealth.base','PhilHealth Base','','0.00',0.00,0,0,3,'',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2017-06-01 09:21:25'),(103,1,'hdmf.base','HDMF Base','','0',0.00,0,0,3,'',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 10:59:19'),(104,1,'taxable.income','Taxable Income','','0',0.00,0,0,3,'((basic.pay + total.overtime) - (total.undertime + (sss.premium.ee + ecc.premium + philhealth.premium.ee + hdmf.premium.ee)))',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-17 22:00:24'),(105,1,'13th.month','13th Month','','0',0.00,0,0,3,'',0,1,NULL,1,999,2,1,'0000-00-00 00:00:00','2017-03-17 01:21:25'),(106,1,'leave.incentives','Leave Incentives','','0',0.00,0,0,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-10 17:25:09'),(107,1,'witholding.tax','Witholding Tax','','0',0.00,0,0,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 11:13:33'),(108,1,'other.earnings','Other Earnings','','0',NULL,NULL,NULL,3,'',0,1,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(109,1,'total.leave','Total Leave','','0',NULL,NULL,NULL,3,'',0,0,NULL,NULL,0,2,1,'0000-00-00 00:00:00','2016-07-31 16:14:02'),(110,1,'total.miscplus','Total Misc Plus','','0',0.00,0,0,3,'total.overtime',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 11:10:17'),(111,1,'total.miscothers','Total Misc Others','','0',0.00,0,0,3,'total.undertime',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 11:13:19'),(112,1,'total.premiums','Total Premiums','','0',0.00,0,0,3,'(sss.premium.ee + philhealth.premium.ee + hdmf.premium.ee)',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2017-05-30 20:53:45'),(113,1,'gross.pay','Gross Pay','','0',0.00,0,0,3,'(basic.pay + total.overtime + total.leave + other.earnings)',0,0,NULL,1,0,2,0,'2016-11-12 00:21:26','2017-05-30 20:45:55'),(114,1,'transaction_summary.controlno','Control No.','','0',0.00,NULL,NULL,1,'',0,0,NULL,NULL,0,2,0,'2016-11-26 21:47:50','2016-11-27 14:09:43'),(115,1,'posted_at','Posted Date','','',0.00,NULL,NULL,1,'',0,0,NULL,NULL,0,2,0,'2016-11-26 22:32:29','2016-11-27 13:46:40'),(116,1,'status','Status','','',0.00,NULL,NULL,1,'',0,0,NULL,NULL,0,2,0,'2016-11-27 08:53:04','2016-11-27 18:49:24'),(117,1,'debit','Debit','','',0.00,NULL,NULL,1,'',0,0,NULL,NULL,0,2,0,'2016-11-27 14:02:48','2016-11-27 18:55:23'),(118,1,'clientname','Client Name','','',0.00,NULL,NULL,1,'',0,0,NULL,0,0,2,0,'2016-11-27 14:10:16','2016-11-27 20:58:15'),(119,1,'description','Account Description','','',0.00,NULL,NULL,1,'',0,0,NULL,NULL,0,2,0,'2016-11-27 14:16:43','2016-11-27 14:17:04'),(120,1,'credit','Credit','','',0.00,NULL,NULL,1,'',0,0,NULL,NULL,0,2,0,'2016-11-27 18:55:36','2016-11-27 18:55:36'),(121,1,'total.deductions','Total Deductions','','',0.00,NULL,NULL,1,'(deductions + other.deductions)',0,0,NULL,0,0,2,0,'2016-12-01 18:51:03','2016-12-01 19:05:24'),(122,1,'sss.premium.er','SSS Premium (Employer)','','0',0.00,0,0,3,'',0,0,NULL,0,0,2,0,'2016-12-17 22:02:17','2016-12-17 22:02:17'),(123,1,'philhealth.premium.er','PhilHealth Premium (Employer)','','0',0.00,0,0,3,'',0,0,NULL,0,999,2,0,'2016-12-17 22:08:33','2016-12-17 22:08:33'),(124,1,'hdmf.premium.er','HDMF Premium (Employer)','','0',0.00,0,0,1,'',0,0,NULL,1,999,2,0,'2016-12-17 22:16:52','2016-12-17 22:16:52'),(127,1,'total.undertime','Total Undertime','','0',0.00,0,0,3,'',0,0,NULL,0,0,2,0,'2017-03-24 20:36:01','2017-03-24 20:36:01'),(128,1,'work.days','Work Days','','0',0.00,0,0,3,'',1,0,NULL,0,999,1,0,'2017-05-10 07:08:51','2017-05-10 07:08:51'),(129,2,'basic.pay','Basic Pay','','0',0.00,0,0,3,'',0,0,NULL,1,0,2,1,'2016-05-09 03:24:55','2017-06-07 06:50:11'),(130,2,'tardiness.deductions','Tardiness Deductions','','0',0.00,0,0,3,'',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 11:06:50'),(131,2,'reg.pay','Regular Pay','','',NULL,NULL,NULL,3,'',0,0,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(132,2,'net.pay','Net Pay','','0',15.00,1,1,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-17 21:45:13'),(133,2,'overtime.types','Overtime Types','','0',NULL,NULL,NULL,3,'',0,0,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(134,2,'cola.pay','Cola Pay','','0',NULL,NULL,NULL,3,'',0,0,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(135,2,'deductions','Loan Deductions','','0',0.00,0,0,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2017-03-17 07:21:52'),(136,2,'sss.premium.ee','SSS Premium (Employee)','','0',0.00,0,0,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-17 21:57:44'),(137,2,'philhealth.premium.ee','PhilHealth Premium (Employee)','','0',0.00,0,0,3,'',0,1,NULL,0,0,2,1,'0000-00-00 00:00:00','2016-12-17 21:58:51'),(138,2,'hdmf.premium.ee','HDMF Premium (Employee)','','0',0.00,0,0,3,'',0,1,NULL,0,0,2,1,'0000-00-00 00:00:00','2016-12-17 21:59:09'),(139,2,'ecc.premium','ECC Premium','','0',NULL,NULL,NULL,3,'',0,1,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(140,2,'sss.base','SSS Base','','0',0.00,0,0,3,'',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 10:59:59'),(141,2,'total.overtime','Total Overtime','','0',0.00,0,0,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 11:11:42'),(142,2,'other.deductions','Other Deductions','','0',NULL,NULL,NULL,3,'',0,1,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(143,2,'philhealth.base','PhilHealth Base','','0.00',0.00,0,0,3,'',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2017-06-01 09:21:25'),(144,2,'hdmf.base','HDMF Base','','0',0.00,0,0,3,'',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 10:59:19'),(145,2,'taxable.income','Taxable Income','','0',0.00,0,0,3,'((basic.pay + total.overtime) - (total.undertime + (sss.premium.ee + ecc.premium + philhealth.premium.ee + hdmf.premium.ee)))',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-17 22:00:24'),(146,2,'13th.month','13th Month','','0',0.00,0,0,3,'',0,1,NULL,1,999,2,1,'0000-00-00 00:00:00','2017-03-17 01:21:25'),(147,2,'leave.incentives','Leave Incentives','','0',0.00,0,0,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-10 17:25:09'),(148,2,'witholding.tax','Witholding Tax','','0',0.00,0,0,3,'',0,1,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 11:13:33'),(149,2,'other.earnings','Other Earnings','','0',NULL,NULL,NULL,3,'',0,1,NULL,NULL,0,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(150,2,'total.leave','Total Leave','','0',NULL,NULL,NULL,3,'',0,0,NULL,NULL,0,2,1,'0000-00-00 00:00:00','2016-07-31 16:14:02'),(151,2,'total.miscplus','Total Misc Plus','','0',0.00,0,0,3,'total.overtime',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 11:10:17'),(152,2,'total.miscothers','Total Misc Others','','0',0.00,0,0,3,'total.undertime',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2016-12-07 11:13:19'),(153,2,'total.premiums','Total Premiums','','0',0.00,0,0,3,'(sss.premium.ee + philhealth.premium.ee + hdmf.premium.ee)',0,0,NULL,1,0,2,1,'0000-00-00 00:00:00','2017-05-30 20:53:45'),(154,2,'gross.pay','Gross Pay','','0',0.00,0,0,3,'(basic.pay + total.overtime + total.leave + other.earnings)',0,0,NULL,1,0,2,0,'2016-11-12 00:21:26','2017-05-30 20:45:55'),(155,2,'transaction_summary.controlno','Control No.','','0',0.00,NULL,NULL,2,'',0,0,NULL,NULL,0,2,0,'2016-11-26 21:47:50','2016-11-27 14:09:43'),(156,2,'posted_at','Posted Date','','',0.00,NULL,NULL,2,'',0,0,NULL,NULL,0,2,0,'2016-11-26 22:32:29','2016-11-27 13:46:40'),(157,2,'status','Status','','',0.00,NULL,NULL,2,'',0,0,NULL,NULL,0,2,0,'2016-11-27 08:53:04','2016-11-27 18:49:24'),(158,2,'debit','Debit','','',0.00,NULL,NULL,2,'',0,0,NULL,NULL,0,2,0,'2016-11-27 14:02:48','2016-11-27 18:55:23'),(159,2,'clientname','Client Name','','',0.00,NULL,NULL,2,'',0,0,NULL,0,0,2,0,'2016-11-27 14:10:16','2016-11-27 20:58:15'),(160,2,'description','Account Description','','',0.00,NULL,NULL,2,'',0,0,NULL,NULL,0,2,0,'2016-11-27 14:16:43','2016-11-27 14:17:04'),(161,2,'credit','Credit','','',0.00,NULL,NULL,2,'',0,0,NULL,NULL,0,2,0,'2016-11-27 18:55:36','2016-11-27 18:55:36'),(162,2,'total.deductions','Total Deductions','','',0.00,NULL,NULL,2,'(deductions + other.deductions)',0,0,NULL,0,0,2,0,'2016-12-01 18:51:03','2016-12-01 19:05:24'),(163,2,'sss.premium.er','SSS Premium (Employer)','','0',0.00,0,0,3,'',0,0,NULL,0,0,2,0,'2016-12-17 22:02:17','2016-12-17 22:02:17'),(164,2,'philhealth.premium.er','PhilHealth Premium (Employer)','','0',0.00,0,0,3,'',0,0,NULL,0,999,2,0,'2016-12-17 22:08:33','2016-12-17 22:08:33'),(165,2,'hdmf.premium.er','HDMF Premium (Employer)','','0',0.00,0,0,2,'',0,0,NULL,1,999,2,0,'2016-12-17 22:16:52','2016-12-17 22:16:52'),(166,2,'total.undertime','Total Undertime','','0',0.00,0,0,3,'',0,0,NULL,0,0,2,0,'2017-03-24 20:36:01','2017-03-24 20:36:01'),(167,2,'work.days','Work Days','','0',0.00,0,0,3,'',1,0,NULL,0,999,1,0,'2017-05-10 07:08:51','2017-05-10 07:08:51');
/*!40000 ALTER TABLE `tb_report_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_report_format_column`
--

DROP TABLE IF EXISTS `tb_report_format_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_report_format_column` (
  `subscription_id` int(10) unsigned NOT NULL,
  `report_format_id` int(10) unsigned NOT NULL,
  `report_column_id` int(10) unsigned NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`report_format_id`,`report_column_id`,`subscription_id`),
  KEY `report_format_column_report_column_id_foreign` (`report_column_id`),
  KEY `report_format_column_subscription_id_foreign` (`subscription_id`),
  CONSTRAINT `report_format_column_report_column_id_foreign` FOREIGN KEY (`report_column_id`) REFERENCES `tb_report_columns` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `report_format_column_report_format_id_foreign` FOREIGN KEY (`report_format_id`) REFERENCES `tb_report_formats` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `report_format_column_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_report_format_column`
--

LOCK TABLES `tb_report_format_column` WRITE;
/*!40000 ALTER TABLE `tb_report_format_column` DISABLE KEYS */;
INSERT INTO `tb_report_format_column` VALUES (1,1,1,3),(1,1,2,1),(1,1,3,2),(1,1,6,4),(1,1,88,5),(1,1,89,6),(1,1,91,28),(1,1,92,8),(1,1,94,27),(1,1,95,13),(1,1,96,17),(1,1,97,20),(1,1,98,15),(1,1,99,12),(1,1,100,9),(1,1,101,26),(1,1,102,16),(1,1,103,19),(1,1,104,24),(1,1,107,25),(1,1,108,11),(1,1,109,10),(1,1,112,22),(1,1,113,23),(1,1,122,14),(1,1,123,18),(1,1,124,21),(1,1,127,10),(2,2,1,3),(2,2,2,1),(2,2,3,2),(2,2,5,5),(2,2,6,21),(2,2,128,4),(2,2,129,6),(2,2,130,22),(2,2,132,24),(2,2,133,6),(2,2,136,12),(2,2,137,15),(2,2,138,18),(2,2,140,11),(2,2,141,7),(2,2,142,23),(2,2,143,14),(2,2,144,17),(2,2,149,9),(2,2,153,20),(2,2,154,10),(2,2,163,13),(2,2,164,16),(2,2,165,19),(2,2,166,8);
/*!40000 ALTER TABLE `tb_report_format_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_report_formats`
--

DROP TABLE IF EXISTS `tb_report_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_report_formats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_report_formats`
--

LOCK TABLES `tb_report_formats` WRITE;
/*!40000 ALTER TABLE `tb_report_formats` DISABLE KEYS */;
INSERT INTO `tb_report_formats` VALUES (1,1,'Net Pay Report',1,51,'2016-11-22 21:50:57','2016-11-22 21:50:57'),(2,2,'Net Pay Report',1,2,'2017-06-06 23:33:10','2017-06-06 23:33:10');
/*!40000 ALTER TABLE `tb_report_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_report_types`
--

DROP TABLE IF EXISTS `tb_report_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_report_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_report_types`
--

LOCK TABLES `tb_report_types` WRITE;
/*!40000 ALTER TABLE `tb_report_types` DISABLE KEYS */;
INSERT INTO `tb_report_types` VALUES (1,'netpay','Net Pay Report',1,1,'2015-12-18 22:32:39','2015-12-18 22:33:38');
/*!40000 ALTER TABLE `tb_report_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_request_classifications`
--

DROP TABLE IF EXISTS `tb_request_classifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_request_classifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_request_classifications`
--

LOCK TABLES `tb_request_classifications` WRITE;
/*!40000 ALTER TABLE `tb_request_classifications` DISABLE KEYS */;
INSERT INTO `tb_request_classifications` VALUES (1,'Hold Shipping'),(2,'Shipping Request');
/*!40000 ALTER TABLE `tb_request_classifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_request_type`
--

DROP TABLE IF EXISTS `tb_request_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_request_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_request_type`
--

LOCK TABLES `tb_request_type` WRITE;
/*!40000 ALTER TABLE `tb_request_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_request_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_request_types`
--

DROP TABLE IF EXISTS `tb_request_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_request_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortdesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_request_types`
--

LOCK TABLES `tb_request_types` WRITE;
/*!40000 ALTER TABLE `tb_request_types` DISABLE KEYS */;
INSERT INTO `tb_request_types` VALUES (1,'Fix Asset','FA'),(2,'Supply','S');
/*!40000 ALTER TABLE `tb_request_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_reservation_categories`
--

DROP TABLE IF EXISTS `tb_reservation_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_reservation_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_reservation_categories`
--

LOCK TABLES `tb_reservation_categories` WRITE;
/*!40000 ALTER TABLE `tb_reservation_categories` DISABLE KEYS */;
INSERT INTO `tb_reservation_categories` VALUES (1,'Personal / Private'),(2,'Event');
/*!40000 ALTER TABLE `tb_reservation_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_reservation_room_keys`
--

DROP TABLE IF EXISTS `tb_reservation_room_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_reservation_room_keys` (
  `reservation_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  KEY `reservation_room_keys_reservation_id_foreign` (`reservation_id`),
  KEY `reservation_room_keys_room_id_foreign` (`room_id`),
  CONSTRAINT `reservation_room_keys_reservation_id_foreign` FOREIGN KEY (`reservation_id`) REFERENCES `tb_reservations` (`id`),
  CONSTRAINT `reservation_room_keys_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `tb_rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_reservation_room_keys`
--

LOCK TABLES `tb_reservation_room_keys` WRITE;
/*!40000 ALTER TABLE `tb_reservation_room_keys` DISABLE KEYS */;
INSERT INTO `tb_reservation_room_keys` VALUES (8,3),(9,1),(10,3),(6,1),(11,2),(12,1),(13,1),(14,2),(16,1),(15,3),(17,2),(18,1),(19,1),(20,1),(22,2),(23,2),(21,1),(24,2),(26,1),(25,1),(27,1),(28,2),(29,1),(30,1),(31,1),(32,2),(33,1),(34,1);
/*!40000 ALTER TABLE `tb_reservation_room_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_reservation_room_service_keys`
--

DROP TABLE IF EXISTS `tb_reservation_room_service_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_reservation_room_service_keys` (
  `reservation_id` int(10) unsigned NOT NULL,
  `room_service_id` int(10) unsigned NOT NULL,
  KEY `reservation_room_service_keys_reservation_id_foreign` (`reservation_id`),
  KEY `reservation_room_service_keys_room_service_id_foreign` (`room_service_id`),
  CONSTRAINT `reservation_room_service_keys_reservation_id_foreign` FOREIGN KEY (`reservation_id`) REFERENCES `tb_reservations` (`id`),
  CONSTRAINT `reservation_room_service_keys_room_service_id_foreign` FOREIGN KEY (`room_service_id`) REFERENCES `tb_room_services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_reservation_room_service_keys`
--

LOCK TABLES `tb_reservation_room_service_keys` WRITE;
/*!40000 ALTER TABLE `tb_reservation_room_service_keys` DISABLE KEYS */;
INSERT INTO `tb_reservation_room_service_keys` VALUES (5,1),(20,2);
/*!40000 ALTER TABLE `tb_reservation_room_service_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_reservations`
--

DROP TABLE IF EXISTS `tb_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_reservations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client` int(10) unsigned NOT NULL,
  `room_category_id` int(10) unsigned DEFAULT NULL,
  `reservation_category_id` int(10) unsigned NOT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `payment_method` int(10) unsigned NOT NULL,
  `payment_status` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservations_client_foreign` (`client`),
  KEY `reservations_payment_method_foreign` (`payment_method`),
  KEY `reservations_payment_status_foreign` (`payment_status`),
  KEY `reservations_status_foreign` (`status`),
  KEY `reservations_reservation_category_id_foreign` (`reservation_category_id`),
  KEY `reservations_room_category_id_foreign` (`room_category_id`),
  CONSTRAINT `reservations_client_foreign` FOREIGN KEY (`client`) REFERENCES `tb_clients` (`id`),
  CONSTRAINT `reservations_payment_method_foreign` FOREIGN KEY (`payment_method`) REFERENCES `tb_payment_forms` (`id`),
  CONSTRAINT `reservations_payment_status_foreign` FOREIGN KEY (`payment_status`) REFERENCES `tb_payment_statuses` (`id`),
  CONSTRAINT `reservations_reservation_category_id_foreign` FOREIGN KEY (`reservation_category_id`) REFERENCES `tb_reservation_categories` (`id`),
  CONSTRAINT `reservations_room_category_id_foreign` FOREIGN KEY (`room_category_id`) REFERENCES `tb_room_categories` (`id`),
  CONSTRAINT `reservations_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_reservations`
--

LOCK TABLES `tb_reservations` WRITE;
/*!40000 ALTER TABLE `tb_reservations` DISABLE KEYS */;
INSERT INTO `tb_reservations` VALUES (6,2,NULL,1,'2017-05-05','2017-05-05',1,1,2,2,'2018-05-22 22:19:20','2018-06-13 09:42:47'),(7,1,NULL,2,'2018-05-05','2018-05-06',1,1,1,2,'2018-05-22 22:20:01','2018-05-22 22:20:01'),(8,1,NULL,1,'2018-06-13','2018-06-15',1,2,2,2,'2018-06-04 03:16:01','2021-06-24 11:34:28'),(9,3,NULL,1,'2018-06-11','2018-06-11',1,2,2,2,'2018-06-11 11:17:32','2021-06-24 11:34:49'),(10,4,NULL,1,'2018-06-14','2018-06-14',1,1,1,2,'2018-06-13 09:37:35','2018-06-13 09:42:41'),(11,5,NULL,1,'2018-06-14','2018-06-14',1,2,2,2,'2018-06-14 09:21:19','2021-06-24 11:35:12'),(12,6,NULL,1,'2018-06-06','2018-06-04',1,2,2,2,'2018-06-18 00:39:24','2021-06-24 11:35:44'),(13,7,NULL,1,'2018-06-21','2018-06-23',1,2,2,2,'2018-06-20 15:44:18','2021-06-24 11:35:07'),(14,8,NULL,1,'2018-08-25','2018-08-26',1,2,2,2,'2018-08-24 17:17:33','2021-06-24 11:34:33'),(15,9,NULL,1,'2020-12-05','2021-01-09',1,1,1,2,'2020-11-03 07:41:31','2020-11-07 10:00:21'),(16,10,NULL,1,'2020-11-09','2020-11-10',1,2,2,2,'2020-11-05 05:41:27','2021-07-01 15:58:51'),(17,9,NULL,2,'2020-12-24','2020-12-24',1,1,1,2,'2020-12-07 13:56:42','2020-12-09 15:33:19'),(18,12,NULL,1,'2021-01-07','2021-01-08',1,2,2,2,'2021-01-06 00:30:09','2021-07-01 15:59:18'),(19,13,NULL,1,'2021-01-11','2021-01-12',1,2,2,2,'2021-01-06 02:08:20','2021-07-01 15:59:10'),(20,13,NULL,1,NULL,NULL,1,1,1,2,'2021-01-06 10:33:56','2021-01-06 10:33:56'),(21,15,1,1,'2021-06-30','2021-07-01',1,1,1,7,'2021-06-30 01:59:33','2021-06-30 10:26:07'),(22,18,1,1,'2021-06-30','2021-07-01',1,1,1,7,'2021-06-30 09:41:35','2021-06-30 17:42:02'),(23,19,NULL,1,'2021-07-01','2021-07-02',1,1,1,7,'2021-07-01 12:16:36','2021-07-01 12:16:36'),(24,20,2,1,'2021-07-02','2021-07-03',1,1,1,7,'2021-07-01 22:58:47','2021-07-02 06:59:13'),(25,21,1,1,'2021-07-08','2021-07-08',1,1,1,7,'2021-07-07 22:58:26','2021-07-08 07:04:17'),(26,23,1,1,'2021-07-07','2021-07-09',1,1,1,7,'2021-07-08 03:57:57','2021-07-08 11:58:41'),(27,24,1,1,'2021-07-08','2021-07-09',1,1,1,7,'2021-07-08 04:02:13','2021-07-08 12:02:42'),(28,25,2,1,'2021-07-08','2021-07-09',1,1,1,7,'2021-07-08 09:51:57','2021-07-08 17:52:56'),(29,26,1,1,'2021-07-08','2021-07-10',1,1,1,7,'2021-07-08 09:55:27','2021-07-08 18:12:39'),(30,27,1,1,'2021-07-09','2021-07-10',1,1,1,7,'2021-07-10 05:22:59','2021-07-10 13:24:57'),(31,28,1,1,'2021-07-09','2021-07-10',1,1,1,7,'2021-07-10 05:25:56','2021-07-10 13:26:48'),(32,29,2,1,'2021-07-08','2021-07-09',1,1,1,7,'2021-07-10 05:28:33','2021-07-10 13:28:58'),(33,30,1,1,'2021-07-10','2021-07-11',1,1,1,7,'2021-07-10 05:30:12','2021-07-10 13:30:35'),(34,31,1,1,'2021-07-10','2021-07-11',1,1,1,7,'2021-07-10 05:35:32','2021-07-10 13:36:08'),(35,32,2,1,'2021-07-08','2021-07-09',1,2,1,2,'2021-07-10 05:38:41','2021-07-10 05:38:41'),(36,33,2,1,'2021-07-09','2021-07-10',1,2,1,2,'2021-07-10 05:42:08','2021-07-10 05:42:08'),(37,34,2,1,'2021-07-09','2021-07-10',1,2,1,2,'2021-07-10 05:43:55','2021-07-10 05:43:55'),(38,35,2,1,'2021-07-09','2021-07-10',1,2,1,2,'2021-07-10 05:46:39','2021-07-10 05:46:39'),(39,36,2,1,'2021-07-11','2021-07-12',1,2,1,2,'2021-07-11 22:58:42','2021-07-11 22:58:42'),(40,37,2,1,'2021-07-11','2021-07-12',1,2,1,2,'2021-07-11 23:03:34','2021-07-11 23:03:34'),(41,38,2,1,'2021-07-11','2021-07-12',1,2,1,2,'2021-07-11 23:18:38','2021-07-11 23:18:38'),(42,39,1,1,'2021-07-12','2021-07-13',1,2,1,2,'2021-07-12 11:41:27','2021-07-12 11:41:27');
/*!40000 ALTER TABLE `tb_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_restaurant_menu`
--

DROP TABLE IF EXISTS `tb_restaurant_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_restaurant_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_menu_user_foreign` (`user`),
  KEY `restaurant_menu_status_foreign` (`status`),
  CONSTRAINT `restaurant_menu_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `restaurant_menu_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_restaurant_menu`
--

LOCK TABLES `tb_restaurant_menu` WRITE;
/*!40000 ALTER TABLE `tb_restaurant_menu` DISABLE KEYS */;
INSERT INTO `tb_restaurant_menu` VALUES (1,'Water','Water',20.00,'',2,1,NULL,NULL),(2,'Pizza','Pizza',200.00,'',2,1,NULL,NULL),(3,'Crispy Pata','Crispy Pata',400.00,'',2,1,NULL,NULL),(4,'Chopsuey','Chopsuey',200.00,'',2,1,NULL,NULL);
/*!40000 ALTER TABLE `tb_restaurant_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_restaurant_order_menu_keys`
--

DROP TABLE IF EXISTS `tb_restaurant_order_menu_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_restaurant_order_menu_keys` (
  `restaurant_order_id` int(10) unsigned NOT NULL,
  `restaurant_menu_id` int(10) unsigned NOT NULL,
  `order_qty` decimal(9,2) DEFAULT 0.00,
  `order_price` decimal(9,2) DEFAULT 0.00,
  KEY `restaurant_order_menu_keys_restaurant_order_id_foreign` (`restaurant_order_id`),
  KEY `restaurant_order_menu_keys_restaurant_menu_id_foreign` (`restaurant_menu_id`),
  CONSTRAINT `restaurant_order_menu_keys_restaurant_menu_id_foreign` FOREIGN KEY (`restaurant_menu_id`) REFERENCES `tb_restaurant_menu` (`id`),
  CONSTRAINT `restaurant_order_menu_keys_restaurant_order_id_foreign` FOREIGN KEY (`restaurant_order_id`) REFERENCES `tb_restaurant_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_restaurant_order_menu_keys`
--

LOCK TABLES `tb_restaurant_order_menu_keys` WRITE;
/*!40000 ALTER TABLE `tb_restaurant_order_menu_keys` DISABLE KEYS */;
INSERT INTO `tb_restaurant_order_menu_keys` VALUES (1,1,2.00,20.00),(1,3,1.00,400.00),(2,1,0.00,0.00);
/*!40000 ALTER TABLE `tb_restaurant_order_menu_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_restaurant_order_service_keys`
--

DROP TABLE IF EXISTS `tb_restaurant_order_service_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_restaurant_order_service_keys` (
  `restaurant_order_id` int(10) unsigned NOT NULL,
  `room_service_id` int(10) unsigned NOT NULL,
  KEY `restaurant_order_service_keys_restaurant_order_id_foreign` (`restaurant_order_id`),
  KEY `restaurant_order_service_keys_room_service_id_foreign` (`room_service_id`),
  CONSTRAINT `restaurant_order_service_keys_restaurant_order_id_foreign` FOREIGN KEY (`restaurant_order_id`) REFERENCES `tb_restaurant_orders` (`id`),
  CONSTRAINT `restaurant_order_service_keys_room_service_id_foreign` FOREIGN KEY (`room_service_id`) REFERENCES `tb_room_services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_restaurant_order_service_keys`
--

LOCK TABLES `tb_restaurant_order_service_keys` WRITE;
/*!40000 ALTER TABLE `tb_restaurant_order_service_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_restaurant_order_service_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_restaurant_orders`
--

DROP TABLE IF EXISTS `tb_restaurant_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_restaurant_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client` int(10) unsigned DEFAULT NULL,
  `room` int(10) unsigned DEFAULT NULL,
  `total_amt` decimal(9,2) NOT NULL,
  `payment_method` int(10) unsigned NOT NULL,
  `payment_status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_orders_client_foreign` (`client`),
  KEY `restaurant_orders_room_foreign` (`room`),
  KEY `restaurant_orders_payment_method_foreign` (`payment_method`),
  KEY `restaurant_orders_payment_status_foreign` (`payment_status`),
  KEY `restaurant_orders_user_foreign` (`user`),
  CONSTRAINT `restaurant_orders_client_foreign` FOREIGN KEY (`client`) REFERENCES `tb_clients` (`id`),
  CONSTRAINT `restaurant_orders_payment_method_foreign` FOREIGN KEY (`payment_method`) REFERENCES `tb_payment_forms` (`id`),
  CONSTRAINT `restaurant_orders_payment_status_foreign` FOREIGN KEY (`payment_status`) REFERENCES `tb_payment_statuses` (`id`),
  CONSTRAINT `restaurant_orders_room_foreign` FOREIGN KEY (`room`) REFERENCES `tb_rooms` (`id`),
  CONSTRAINT `restaurant_orders_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_restaurant_orders`
--

LOCK TABLES `tb_restaurant_orders` WRITE;
/*!40000 ALTER TABLE `tb_restaurant_orders` DISABLE KEYS */;
INSERT INTO `tb_restaurant_orders` VALUES (1,NULL,NULL,100.00,1,1,2,'2018-05-23 02:33:47','2018-05-23 02:33:47'),(2,NULL,2,40.00,1,1,2,'2018-05-23 03:41:22','2018-05-23 03:41:22');
/*!40000 ALTER TABLE `tb_restaurant_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_result_categories`
--

DROP TABLE IF EXISTS `tb_result_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_result_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_result_categories`
--

LOCK TABLES `tb_result_categories` WRITE;
/*!40000 ALTER TABLE `tb_result_categories` DISABLE KEYS */;
INSERT INTO `tb_result_categories` VALUES (1,'Blood Sugar','2014-11-14 05:12:45','2014-11-14 05:12:45'),(2,'Kidney Function','2014-11-14 05:13:08','2014-11-14 05:13:08'),(3,'Liver Function','2014-11-14 05:16:59','2014-11-14 05:16:59'),(4,'Lipid Profile','2014-11-14 05:19:18','2014-11-14 05:19:18'),(5,'Electrolytes','2014-11-14 05:20:24','2014-11-14 05:20:24'),(6,'Physical','2014-11-14 05:20:55','2014-11-14 05:20:55'),(7,'Chemical','2014-11-14 05:47:49','2014-11-14 05:47:49'),(8,'Microscopic','2014-11-14 06:31:58','2014-11-14 06:31:58'),(9,'Pregnancy Test','2014-11-14 06:35:44','2014-11-14 06:35:44'),(10,'Routine','2014-11-14 06:36:26','2014-11-14 06:36:26');
/*!40000 ALTER TABLE `tb_result_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_result_controls`
--

DROP TABLE IF EXISTS `tb_result_controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_result_controls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accountclass` int(11) NOT NULL,
  `accounttype` int(11) NOT NULL,
  `resultcategory` int(11) NOT NULL,
  `resulttype` int(11) NOT NULL,
  `normalvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`accountclass`,`accounttype`,`resultcategory`,`resulttype`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_result_controls`
--

LOCK TABLES `tb_result_controls` WRITE;
/*!40000 ALTER TABLE `tb_result_controls` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_result_controls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_result_types`
--

DROP TABLE IF EXISTS `tb_result_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_result_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resultcategory` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`resultcategory`,`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_result_types`
--

LOCK TABLES `tb_result_types` WRITE;
/*!40000 ALTER TABLE `tb_result_types` DISABLE KEYS */;
INSERT INTO `tb_result_types` VALUES (1,1,'Fasting','','2014-11-14 03:38:48','2014-11-14 05:12:45'),(2,1,'2-hrs PPBS','','2014-11-14 03:39:02','2014-11-14 05:14:08'),(3,1,'Random','','2014-11-14 03:39:09','2014-11-14 05:14:29'),(4,1,'HbAIC','','2014-11-14 03:39:17','2014-11-14 05:16:23'),(5,2,'Creatinine','','2014-11-14 03:39:35','2014-11-14 05:13:08'),(6,2,'BUN','','2014-11-14 03:39:39','2014-11-14 05:16:39'),(7,2,'Uric Acid','','2014-11-14 03:39:44','2014-11-14 05:16:48'),(8,3,'Total (Bilirubin)','','2014-11-14 03:39:58','2014-11-14 05:16:59'),(9,3,'Direct (Bilirubin)','','2014-11-14 03:40:11','2014-11-14 05:17:08'),(10,3,'Indirect (Bilirubin)','','2014-11-14 03:40:16','2014-11-14 05:17:16'),(11,3,'Total (Serum Protein)','','2014-11-14 03:40:47','2014-11-14 05:17:25'),(12,3,'Albumin (Serum Protein)','','2014-11-14 03:40:56','2014-11-14 05:17:50'),(13,3,'Globulin (Serum Protein)','','2014-11-14 03:41:01','2014-11-14 05:18:00'),(14,3,'A/G Ratio (Serum Protein)','','2014-11-14 03:41:09','2014-11-14 05:18:26'),(15,3,'SGPT','','2014-11-14 03:41:22','2014-11-14 05:18:35'),(16,3,'SGOT','','2014-11-14 03:41:26','2014-11-14 05:18:43'),(17,3,'Alk. Phos.','','2014-11-14 03:41:32','2014-11-14 05:18:51'),(18,4,'HDL-Cholesterol','','2014-11-14 03:43:05','2014-11-14 05:19:18'),(19,4,'Triglycerides','','2014-11-14 03:43:14','2014-11-14 05:19:29'),(20,4,'Total Cholesterol','','2014-11-14 03:43:24','2014-11-14 05:19:39'),(21,4,'LDL - Cholesterol','','2014-11-14 03:43:34','2014-11-14 05:19:48'),(22,4,'TC/HDL Ratio','','2014-11-14 03:45:08','2014-11-14 05:20:03'),(23,5,'Sodium','','2014-11-14 03:45:16','2014-11-14 05:20:24'),(24,5,'Potassium','','2014-11-14 03:45:21','2014-11-14 05:20:33'),(27,5,'Calcium','','2014-11-14 03:47:34','2014-11-14 05:20:41'),(28,6,'Color (Physical)','','2014-11-14 04:52:11','2014-11-14 05:20:55'),(29,6,'Transparency','','2014-11-14 05:04:56','2014-11-14 05:21:21'),(30,6,'Specific Gravity','','2014-11-14 05:21:44','2014-11-14 05:21:44'),(31,7,'Glucose','','2014-11-14 05:47:49','2014-11-14 05:47:49'),(32,7,'Bilirubin','','2014-11-14 06:30:30','2014-11-14 06:30:30'),(33,7,'Ketone','','2014-11-14 06:30:38','2014-11-14 06:30:38'),(34,7,'Blood','','2014-11-14 06:30:56','2014-11-14 06:30:56'),(35,7,'pH','','2014-11-14 06:31:03','2014-11-14 06:31:03'),(36,7,'Protein','','2014-11-14 06:31:11','2014-11-14 06:31:11'),(37,7,'Urobilinogen','','2014-11-14 06:31:20','2014-11-14 06:31:20'),(38,7,'Nitrites','','2014-11-14 06:31:28','2014-11-14 06:31:28'),(39,7,'Leucocytes','','2014-11-14 06:31:37','2014-11-14 06:31:37'),(40,8,'WBC (HPF)','','2014-11-14 06:31:58','2014-11-14 06:31:58'),(41,8,'RBC (HPF)','','2014-11-14 06:32:56','2014-11-14 06:32:56'),(42,8,'Epith. Cells (HPF)','','2014-11-14 06:33:09','2014-11-14 06:33:09'),(43,8,'Bacteria (HPF)','','2014-11-14 06:33:22','2014-11-14 06:33:22'),(44,8,'Cast/s (LPF)','','2014-11-14 06:33:38','2014-11-14 06:33:58'),(45,8,'Crystal/s (LPF)','','2014-11-14 06:34:19','2014-11-14 06:34:19'),(46,8,'Amorphous Materials (HPF)','','2014-11-14 06:34:57','2014-11-14 06:34:57'),(47,8,'Mucus Thread (HPF)','','2014-11-14 06:35:07','2014-11-14 06:35:07'),(48,9,'Remarks','','2014-11-14 06:35:44','2014-11-14 06:35:44'),(49,10,'Consistency','','2014-11-14 06:36:26','2014-11-14 06:36:26'),(51,10,'Red Cells','','2014-11-14 06:37:57','2014-11-14 06:37:57'),(52,10,'Pus Cells','','2014-11-14 06:38:06','2014-11-14 06:38:06'),(53,10,'Ascaris','','2014-11-14 06:38:17','2014-11-14 06:38:17'),(54,10,'Trichuris','','2014-11-14 06:38:25','2014-11-14 06:38:25'),(55,10,'Amoeba','','2014-11-14 06:38:39','2014-11-14 06:38:39'),(56,10,'Hookworm','','2014-11-14 06:38:46','2014-11-14 06:38:46'),(57,10,'Occult Blood','','2014-11-14 06:38:55','2014-11-14 06:38:55'),(58,10,'Color (Routine)','','2014-11-14 12:55:02','2014-11-14 12:55:02');
/*!40000 ALTER TABLE `tb_result_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_retail_transactions`
--

DROP TABLE IF EXISTS `tb_retail_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_retail_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department` int(10) unsigned DEFAULT NULL,
  `product_trans_id` int(10) unsigned DEFAULT NULL,
  `product_code` int(10) unsigned NOT NULL,
  `buyers_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `tag` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `retail_transactions_product_code_foreign` (`product_code`),
  KEY `retail_transactions_tag_foreign` (`tag`),
  KEY `retail_transactions_user_foreign` (`user`),
  KEY `retail_transactions_product_trans_id_foreign` (`product_trans_id`),
  KEY `retail_transactions_department_foreign` (`department`),
  CONSTRAINT `retail_transactions_department_foreign` FOREIGN KEY (`department`) REFERENCES `tb_departments` (`id`),
  CONSTRAINT `retail_transactions_product_code_foreign` FOREIGN KEY (`product_code`) REFERENCES `tb_product_codes` (`id`),
  CONSTRAINT `retail_transactions_product_trans_id_foreign` FOREIGN KEY (`product_trans_id`) REFERENCES `tb_product_transactions` (`id`),
  CONSTRAINT `retail_transactions_tag_foreign` FOREIGN KEY (`tag`) REFERENCES `tb_transaction_tags` (`id`),
  CONSTRAINT `retail_transactions_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_retail_transactions`
--

LOCK TABLES `tb_retail_transactions` WRITE;
/*!40000 ALTER TABLE `tb_retail_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_retail_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_menu`
--

DROP TABLE IF EXISTS `tb_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_menu` (
  `menu_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `sequence` smallint(10) DEFAULT NULL,
  PRIMARY KEY (`menu_id`,`role_id`),
  KEY `role_menu_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_menu`
--

LOCK TABLES `tb_role_menu` WRITE;
/*!40000 ALTER TABLE `tb_role_menu` DISABLE KEYS */;
INSERT INTO `tb_role_menu` VALUES (1,1,1),(1,2,1),(2,2,2),(8,2,13),(9,1,15),(9,2,15),(10,1,15),(10,2,15),(11,2,12),(15,1,3),(16,2,2),(18,6,9),(18,7,9),(18,8,9),(21,2,10),(21,3,10),(21,4,10),(22,3,9),(22,4,9),(23,2,14),(23,4,14),(24,2,12),(24,4,12),(25,2,13),(26,2,13),(26,3,13),(26,4,13),(27,2,2),(28,2,3),(29,2,5),(30,2,6),(31,2,5),(32,2,6),(33,2,4),(34,2,7),(35,2,7);
/*!40000 ALTER TABLE `tb_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_package`
--

DROP TABLE IF EXISTS `tb_role_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_package` (
  `role_id` int(10) unsigned NOT NULL,
  `package_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`package_id`),
  KEY `role_package_package_id_foreign` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_package`
--

LOCK TABLES `tb_role_package` WRITE;
/*!40000 ALTER TABLE `tb_role_package` DISABLE KEYS */;
INSERT INTO `tb_role_package` VALUES (2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(5,1),(5,2),(5,3),(6,1),(6,2),(6,3),(7,1),(7,2),(7,3),(8,1),(8,2),(8,3);
/*!40000 ALTER TABLE `tb_role_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_submenu`
--

DROP TABLE IF EXISTS `tb_role_submenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_submenu` (
  `submenu_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`submenu_id`,`role_id`),
  KEY `role_submenu_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_submenu`
--

LOCK TABLES `tb_role_submenu` WRITE;
/*!40000 ALTER TABLE `tb_role_submenu` DISABLE KEYS */;
INSERT INTO `tb_role_submenu` VALUES (9,1),(9,2),(9,6),(9,7),(10,1),(10,2),(11,1),(11,2),(13,1),(23,1),(32,2),(33,2),(34,2),(35,2),(38,2),(38,3),(39,2),(39,3),(40,2),(40,3),(41,3),(44,3),(46,3),(51,3),(54,3),(57,1),(59,1),(62,2),(63,2),(64,2),(68,2),(86,2),(90,2),(91,2),(92,2),(92,3),(93,2),(93,3),(93,4),(94,2),(95,6),(95,7),(96,6),(96,7),(97,6),(97,7),(98,2),(99,6),(99,7),(100,6),(100,7),(102,2),(102,3),(102,4),(103,2),(103,3),(103,4),(106,1),(106,2),(107,2),(108,2),(109,2),(110,2),(111,2);
/*!40000 ALTER TABLE `tb_role_submenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_user`
--

DROP TABLE IF EXISTS `tb_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_user`
--

LOCK TABLES `tb_role_user` WRITE;
/*!40000 ALTER TABLE `tb_role_user` DISABLE KEYS */;
INSERT INTO `tb_role_user` VALUES (1,1),(2,2),(3,3),(4,4),(5,3),(5,7),(6,2),(7,2),(7,3),(7,4),(8,3),(8,4),(8,6),(9,8),(10,6),(11,8);
/*!40000 ALTER TABLE `tb_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_roles`
--

DROP TABLE IF EXISTS `tb_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access` smallint(6) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_roles`
--

LOCK TABLES `tb_roles` WRITE;
/*!40000 ALTER TABLE `tb_roles` DISABLE KEYS */;
INSERT INTO `tb_roles` VALUES (1,0,'superadmin','Super Administrator','Super Man',0,1,'label label-danger','2015-11-13 09:23:09','2015-12-28 17:39:21'),(2,0,'administrator','Administrator','Registrant / IT Admin',0,1,'label label-primary','2015-10-24 07:52:40','2016-01-04 16:41:22'),(3,1,'manufacturer','Manufacturer','Manufacturer Access',0,2,'label label-danger','2017-04-26 20:21:10','2018-03-03 20:46:54'),(4,1,'crm','CRM','CRM Access',0,2,'label label-primary','2017-05-19 07:12:46','2018-03-03 20:47:08'),(5,NULL,'hr.manager','HR Manager','HR Manager',1,1,'label label-primary','2017-08-10 12:19:58','2017-08-10 14:39:17'),(6,NULL,'encoder','encoder','Access encoding area only.',0,0,'label label-danger','2018-04-26 20:12:11','2018-04-26 20:12:11'),(7,NULL,'supervisor','Supervisor','Supervisor',0,0,'label label-danger','2018-05-08 13:36:30','2018-05-08 13:36:30');
/*!40000 ALTER TABLE `tb_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_amenities`
--

DROP TABLE IF EXISTS `tb_room_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_room_amenities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_amenities`
--

LOCK TABLES `tb_room_amenities` WRITE;
/*!40000 ALTER TABLE `tb_room_amenities` DISABLE KEYS */;
INSERT INTO `tb_room_amenities` VALUES (1,'Wifi','FREE',NULL,NULL),(2,'Elevator','Yes',NULL,NULL),(3,'Hair Dryer','Yes',NULL,NULL),(4,'Air Con','Yes',NULL,NULL),(5,'Parking','Yes',NULL,NULL),(6,'Safety Box','Yes',NULL,NULL),(7,'Television','Yes',NULL,NULL),(8,'Smoke detector','Yes',NULL,NULL),(9,'Carbon monoxide detector','Yes',NULL,NULL);
/*!40000 ALTER TABLE `tb_room_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_amenity_keys`
--

DROP TABLE IF EXISTS `tb_room_amenity_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_room_amenity_keys` (
  `room_id` int(10) unsigned NOT NULL,
  `amenity_id` int(10) unsigned NOT NULL,
  KEY `room_amenity_keys_room_id_foreign` (`room_id`),
  KEY `room_amenity_keys_amenity_id_foreign` (`amenity_id`),
  CONSTRAINT `room_amenity_keys_amenity_id_foreign` FOREIGN KEY (`amenity_id`) REFERENCES `tb_room_amenities` (`id`),
  CONSTRAINT `room_amenity_keys_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `tb_rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_amenity_keys`
--

LOCK TABLES `tb_room_amenity_keys` WRITE;
/*!40000 ALTER TABLE `tb_room_amenity_keys` DISABLE KEYS */;
INSERT INTO `tb_room_amenity_keys` VALUES (3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(4,1),(4,4),(4,5),(4,7),(4,8),(1,1),(1,4),(1,5),(1,7),(1,8),(2,1),(2,4),(2,5),(2,7),(2,8),(5,1),(5,4),(5,7),(5,8);
/*!40000 ALTER TABLE `tb_room_amenity_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_cancellations`
--

DROP TABLE IF EXISTS `tb_room_cancellations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_room_cancellations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_cancellations`
--

LOCK TABLES `tb_room_cancellations` WRITE;
/*!40000 ALTER TABLE `tb_room_cancellations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_room_cancellations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_categories`
--

DROP TABLE IF EXISTS `tb_room_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_room_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_price` decimal(9,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_categories`
--

LOCK TABLES `tb_room_categories` WRITE;
/*!40000 ALTER TABLE `tb_room_categories` DISABLE KEYS */;
INSERT INTO `tb_room_categories` VALUES (1,'DELUXE',NULL,NULL,NULL,'2021-07-01 13:46:09'),(2,'Standard Room',NULL,900.00,NULL,'2021-07-01 15:55:10'),(3,'Presidential',NULL,NULL,NULL,NULL),(4,'Event Hall',NULL,NULL,NULL,NULL),(5,'2 Single Bed Room',NULL,NULL,'2021-07-01 15:48:20','2021-07-01 15:48:20');
/*!40000 ALTER TABLE `tb_room_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_category_images`
--

DROP TABLE IF EXISTS `tb_room_category_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_room_category_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_category_id` int(10) unsigned NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_category_images_room_category_id_foreign` (`room_category_id`),
  CONSTRAINT `room_category_images_room_category_id_foreign` FOREIGN KEY (`room_category_id`) REFERENCES `tb_room_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_category_images`
--

LOCK TABLES `tb_room_category_images` WRITE;
/*!40000 ALTER TABLE `tb_room_category_images` DISABLE KEYS */;
INSERT INTO `tb_room_category_images` VALUES (2,2,'1625125894-205740283_247498710472794_6099354371463943703_n.jpg','2021-07-01 15:51:34','2021-07-01 15:51:34');
/*!40000 ALTER TABLE `tb_room_category_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_images`
--

DROP TABLE IF EXISTS `tb_room_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_room_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_images_room_id_foreign` (`room_id`),
  CONSTRAINT `room_images_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `tb_rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_images`
--

LOCK TABLES `tb_room_images` WRITE;
/*!40000 ALTER TABLE `tb_room_images` DISABLE KEYS */;
INSERT INTO `tb_room_images` VALUES (21,3,'Instagram--4.jpg'),(24,4,'2 SINGLE BED.jpg'),(26,1,'207047316_241293224163218_8241442281648428490_n.jpg'),(27,2,'205611495_841448443156543_4746028007543542359_n.jpg');
/*!40000 ALTER TABLE `tb_room_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_inventory_group_keys`
--

DROP TABLE IF EXISTS `tb_room_inventory_group_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_room_inventory_group_keys` (
  `room_id` int(10) unsigned NOT NULL,
  `inventory_group_id` int(10) unsigned NOT NULL,
  KEY `room_inventory_group_keys_room_id_foreign` (`room_id`),
  KEY `room_inventory_group_keys_inventory_group_id_foreign` (`inventory_group_id`),
  CONSTRAINT `room_inventory_group_keys_inventory_group_id_foreign` FOREIGN KEY (`inventory_group_id`) REFERENCES `tb_inventory_groups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `room_inventory_group_keys_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `tb_rooms` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_inventory_group_keys`
--

LOCK TABLES `tb_room_inventory_group_keys` WRITE;
/*!40000 ALTER TABLE `tb_room_inventory_group_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_room_inventory_group_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_rule_keys`
--

DROP TABLE IF EXISTS `tb_room_rule_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_room_rule_keys` (
  `room_id` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  KEY `room_rule_keys_room_id_foreign` (`room_id`),
  KEY `room_rule_keys_rule_id_foreign` (`rule_id`),
  CONSTRAINT `room_rule_keys_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `tb_rooms` (`id`),
  CONSTRAINT `room_rule_keys_rule_id_foreign` FOREIGN KEY (`rule_id`) REFERENCES `tb_room_rules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_rule_keys`
--

LOCK TABLES `tb_room_rule_keys` WRITE;
/*!40000 ALTER TABLE `tb_room_rule_keys` DISABLE KEYS */;
INSERT INTO `tb_room_rule_keys` VALUES (3,1),(4,1),(1,1),(2,1),(5,1),(5,2);
/*!40000 ALTER TABLE `tb_room_rule_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_rules`
--

DROP TABLE IF EXISTS `tb_room_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_room_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_rules`
--

LOCK TABLES `tb_room_rules` WRITE;
/*!40000 ALTER TABLE `tb_room_rules` DISABLE KEYS */;
INSERT INTO `tb_room_rules` VALUES (1,'No Smoking','',NULL,NULL),(2,'No Drinking of alcoholic',' ','2020-12-07 14:03:48','2020-12-07 14:03:48');
/*!40000 ALTER TABLE `tb_room_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_service_keys`
--

DROP TABLE IF EXISTS `tb_room_service_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_room_service_keys` (
  `room_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  KEY `room_service_keys_room_id_foreign` (`room_id`),
  KEY `room_service_keys_service_id_foreign` (`service_id`),
  CONSTRAINT `room_service_keys_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `tb_rooms` (`id`),
  CONSTRAINT `room_service_keys_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `tb_room_services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_service_keys`
--

LOCK TABLES `tb_room_service_keys` WRITE;
/*!40000 ALTER TABLE `tb_room_service_keys` DISABLE KEYS */;
INSERT INTO `tb_room_service_keys` VALUES (4,1),(1,1),(2,3),(5,3);
/*!40000 ALTER TABLE `tb_room_service_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_services`
--

DROP TABLE IF EXISTS `tb_room_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_room_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_services`
--

LOCK TABLES `tb_room_services` WRITE;
/*!40000 ALTER TABLE `tb_room_services` DISABLE KEYS */;
INSERT INTO `tb_room_services` VALUES (1,'Car Park','Php20/Night',20.00,NULL,NULL),(2,'Room Service','40 / delivery',0.00,NULL,NULL),(3,'Cleaning Service','FREE',0.00,NULL,NULL);
/*!40000 ALTER TABLE `tb_room_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_rooms`
--

DROP TABLE IF EXISTS `tb_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_price` decimal(9,2) NOT NULL,
  `extra_person_charge` decimal(9,2) NOT NULL,
  `cleaning_fee` decimal(9,2) NOT NULL,
  `weekly_discount` decimal(9,2) NOT NULL,
  `monthly_discount` decimal(9,2) NOT NULL,
  `bathrooms` smallint(6) NOT NULL,
  `bed_type` int(10) unsigned NOT NULL,
  `bedrooms` smallint(6) NOT NULL,
  `beds` smallint(6) NOT NULL,
  `check_in_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pet_ownership` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adults_capacity` smallint(6) NOT NULL,
  `children_capacity` smallint(6) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `availability_status` int(10) unsigned NOT NULL DEFAULT 11,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_user_foreign` (`user`),
  KEY `rooms_status_foreign` (`status`),
  KEY `rooms_availability_status_foreign` (`availability_status`),
  CONSTRAINT `rooms_availability_status_foreign` FOREIGN KEY (`availability_status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `rooms_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `rooms_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_rooms`
--

LOCK TABLES `tb_rooms` WRITE;
/*!40000 ALTER TABLE `tb_rooms` DISABLE KEYS */;
INSERT INTO `tb_rooms` VALUES (1,'015','TAGBILARAN',1,'Donec sed odio dui. Donec sed odio dui. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Etiam porta sem malesuada magna mollis euismod. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Etiam porta sem malesuada magna mollis euismod. Maecenas sed diam eget risus varius blandit sit amet non magna.Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec sed odio dui. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Etiam porta sem malesuada magna mollis euismod. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Etiam porta sem malesuada magna mollis euismod. Maecenas sed diam eget risus varius blandit sit amet non magna.Praesent commodo cursus magna, vel scelerisque nisl consectetur et.',1200.00,400.00,0.00,0.00,0.00,1,1,1,1,'Anytime after 2PM','10AM','Dog(s) and cat(s)',1,1,7,1,11,'2018-05-22 18:40:25','2021-07-10 13:32:13'),(2,'10','valencia',2,'Standard Room is good for 2 persons only. Comes with Flat Screen TV, Hot & Cold Shower, and a Private Comfort Room.',900.00,400.00,0.00,0.00,0.00,1,3,1,1,'2:00 PM','12:00 NN','n/a',2,2,7,1,11,'2018-05-22 22:16:09','2021-07-10 13:40:13'),(3,'502','Presidential Suite',3,'This is our most comfortable room.',10000.00,1000.00,200.00,0.00,0.00,1,2,2,2,'12noon','12noon','Yes',3,3,2,1,11,'2018-05-23 00:06:30','2018-05-23 00:31:50'),(4,'Surigao','Single Bed Room',1,'Can add extra person upon request',750.00,250.00,150.00,5.00,10.00,1,1,1,1,'12:00 NN','12:00 NN','n/a',1,1,7,1,11,'2020-12-07 13:50:45','2021-06-30 16:18:36'),(5,'001','Barkadahan',2,'Good  for 6 room',1200.00,200.00,50.00,10.00,20.00,1,1,5,6,'12:00','12:00','n/a',6,6,2,1,11,'2021-07-13 10:52:16','2021-07-13 10:52:16');
/*!40000 ALTER TABLE `tb_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_salary_grades`
--

DROP TABLE IF EXISTS `tb_salary_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_salary_grades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `monthlyrate` decimal(9,2) NOT NULL,
  `workingdays` int(11) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `salary_grades_subscription_foreign` (`subscription`),
  KEY `salary_grades_status_foreign` (`status`),
  KEY `salary_grades_user_foreign` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_salary_grades`
--

LOCK TABLES `tb_salary_grades` WRITE;
/*!40000 ALTER TABLE `tb_salary_grades` DISABLE KEYS */;
INSERT INTO `tb_salary_grades` VALUES (1,2,'SG 1 S1','Salary Grade 1 Step 1',8287.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(2,2,'SG 1 S2','Salary Grade 1 Step 2',8393.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(3,2,'SG 1 S3','Salary Grade 1 Step 3',8501.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(4,2,'SG 1 S4','Salary Grade 1 Step 4',8610.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(5,2,'SG 1 S5','Salary Grade 1 Step 5',8721.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(6,2,'SG 1 S6','Salary Grade 1 Step 6',8834.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(7,2,'SG 1 S7','Salary Grade 1 Step 7',8948.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(8,2,'SG 1 S8','Salary Grade 1 Step 8',9064.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(9,2,'SG 2 S1','Salary Grade 2 Step 1',8932.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(10,2,'SG 2 S2','Salary Grade 2 Step 2',9047.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(11,2,'SG 2 S3','Salary Grade 2 Step 3',9162.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(12,2,'SG 2 S4','Salary Grade 2 Step 4',9281.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(13,2,'SG 2 S5','Salary Grade 2 Step 5',9400.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(14,2,'SG 2 S6','Salary Grade 2 Step 6',9522.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(15,2,'SG 2 S7','Salary Grade 2 Step 7',9646.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(16,2,'SG 2 S8','Salary Grade 2 Step 8',9772.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(17,2,'SG 3 S1','Salary Grade 3 Step 1',9628.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(18,2,'SG 3 S2','Salary Grade 3 Step 2',9751.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(19,2,'SG 3 S3','Salary Grade 3 Step 3',9876.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(20,2,'SG 3 S4','Salary Grade 3 Step 4',10004.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(21,2,'SG 3 S5','Salary Grade 3 Step 5',10133.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(22,2,'SG 3 S6','Salary Grade 3 Step 6',10265.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(23,2,'SG 3 S7','Salary Grade 3 Step 7',10398.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(24,2,'SG 3 S8','Salary Grade 3 Step 8',10534.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(25,2,'SG 4 S1','Salary Grade 4 Step 1',10358.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(26,2,'SG 4 S2','Salary Grade 4 Step 2',10491.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(27,2,'SG 4 S3','Salary Grade 4 Step 3',10626.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(28,2,'SG 4 S4','Salary Grade 4 Step 4',10763.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(29,2,'SG 4 S5','Salary Grade 4 Step 5',10904.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(30,2,'SG 4 S6','Salary Grade 4 Step 6',11045.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(31,2,'SG 4 S7','Salary Grade 4 Step 7',11189.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(32,2,'SG 4 S8','Salary Grade 4 Step 8',11335.00,26,1,2,'2015-02-12 09:23:10','2015-02-12 09:23:10'),(33,2,'SG 5 S1','Salary Grade 5 Step 1',12300.00,0,1,2,'2015-10-22 18:19:13','2015-10-22 18:19:13'),(34,2,'SG 5 S2','Salary Grade 5 Step 2',12670.00,26,1,2,'2015-10-22 18:20:35','2015-10-22 18:20:35'),(35,2,'SG 5 S3','Salary Grade 5 Step 3',12930.00,26,1,2,'2016-07-31 22:02:01','2016-07-31 22:14:33'),(36,2,'SG 5 S 4','Salary Grade 5 Step 4',13110.00,26,1,2,'2016-07-31 22:03:31','2016-07-31 22:03:31');
/*!40000 ALTER TABLE `tb_salary_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_schedule_details`
--

DROP TABLE IF EXISTS `tb_schedule_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_schedule_details` (
  `subscription` int(10) unsigned NOT NULL,
  `schedule_template` int(10) unsigned NOT NULL,
  `weekday` int(10) unsigned NOT NULL,
  `shift` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subscription`,`schedule_template`,`weekday`,`shift`),
  KEY `schedule_details_schedule_template_foreign` (`schedule_template`),
  KEY `schedule_details_weekday_foreign` (`weekday`),
  KEY `schedule_details_shift_foreign` (`shift`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_schedule_details`
--

LOCK TABLES `tb_schedule_details` WRITE;
/*!40000 ALTER TABLE `tb_schedule_details` DISABLE KEYS */;
INSERT INTO `tb_schedule_details` VALUES (1,18,1,5),(1,18,2,5),(1,18,3,5),(1,18,4,5),(1,18,5,5),(1,18,6,5),(1,18,7,5),(1,20,1,6),(1,20,2,6),(1,20,3,6),(1,20,4,6),(1,20,5,6),(1,20,6,6),(1,20,7,6),(1,21,1,7),(1,21,2,7),(1,21,3,7),(1,21,4,7),(1,21,5,7),(1,21,6,7),(1,21,7,7),(2,1,1,1),(2,1,2,1),(2,1,3,1),(2,1,4,1),(2,1,5,1),(2,1,6,1),(2,2,1,2),(2,2,2,2),(2,2,3,2),(2,2,4,2),(2,2,5,2),(2,2,6,2),(2,2,7,2),(2,3,1,3),(2,3,2,3),(2,3,3,3),(2,3,4,3),(2,3,5,3),(2,3,6,3),(2,3,7,3),(5,4,2,12),(5,4,3,12),(5,4,4,12),(5,4,5,12),(5,4,6,12),(5,4,7,12),(5,5,1,12),(5,5,3,12),(5,5,4,12),(5,5,5,12),(5,5,6,12),(5,6,1,12),(5,6,2,12),(5,6,4,12),(5,6,5,12),(5,6,6,12),(5,7,1,12),(5,7,2,12),(5,7,3,12),(5,7,5,12),(5,7,6,12),(5,8,1,12),(5,8,2,12),(5,8,3,12),(5,8,4,12),(5,8,6,12),(5,9,1,12),(5,9,2,12),(5,9,3,12),(5,9,4,12),(5,9,5,12),(5,10,1,12),(5,10,2,12),(5,10,3,12),(5,10,4,12),(5,10,5,12),(5,10,6,12),(5,11,2,13),(5,11,3,13),(5,11,4,13),(5,11,5,13),(5,11,6,13),(5,12,1,13),(5,12,3,13),(5,12,4,13),(5,12,5,13),(5,12,6,13),(5,13,1,13),(5,13,2,13),(5,13,4,13),(5,13,5,13),(5,13,6,13),(5,14,1,13),(5,14,2,13),(5,14,3,13),(5,14,5,13),(5,14,6,13),(5,15,1,13),(5,15,2,13),(5,15,3,13),(5,15,4,13),(5,15,6,13),(5,16,1,13),(5,16,2,13),(5,16,3,13),(5,16,4,13),(5,16,5,13),(5,17,1,13),(5,17,2,13),(5,17,3,13),(5,17,4,13),(5,17,5,13),(5,17,6,13);
/*!40000 ALTER TABLE `tb_schedule_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_schedule_templates`
--

DROP TABLE IF EXISTS `tb_schedule_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_schedule_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `schedule_templates_subscription_foreign` (`subscription`),
  KEY `schedule_templates_status_foreign` (`status`),
  KEY `schedule_templates_user_foreign` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_schedule_templates`
--

LOCK TABLES `tb_schedule_templates` WRITE;
/*!40000 ALTER TABLE `tb_schedule_templates` DISABLE KEYS */;
INSERT INTO `tb_schedule_templates` VALUES (1,2,'Opening (9:45am - 7:15pm)',1,2,'2016-06-17 02:59:25','2017-06-07 08:39:13'),(2,2,'Closing (11:45am - 9:15pm)',1,2,'2016-06-22 03:39:10','2017-06-07 08:39:37'),(3,2,'Full-Shift (9:45am - 9:15pm)',1,2,'2016-06-22 11:06:13','2017-06-07 08:40:02'),(18,1,'Opening (9:45am - 7:15pm)',1,2,'2017-05-25 08:58:11','2017-06-23 16:00:02'),(19,3,'Mon-Sat (Regular)',1,2,'2017-06-07 10:23:39','2017-06-07 10:23:39'),(20,1,'Closing (11:45am - 9:15pm)',1,2,'2017-06-23 16:00:31','2017-06-23 16:00:31'),(21,1,'Full-Shift (9:45am - 9:15pm)',1,2,'2017-06-23 16:02:43','2017-06-23 16:02:43');
/*!40000 ALTER TABLE `tb_schedule_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_service_request_priorities`
--

DROP TABLE IF EXISTS `tb_service_request_priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_service_request_priorities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_service_request_priorities`
--

LOCK TABLES `tb_service_request_priorities` WRITE;
/*!40000 ALTER TABLE `tb_service_request_priorities` DISABLE KEYS */;
INSERT INTO `tb_service_request_priorities` VALUES (1,'High Priority','HP'),(2,'Medium Priority','MP'),(3,'Low Priority','LP');
/*!40000 ALTER TABLE `tb_service_request_priorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_service_request_statuses`
--

DROP TABLE IF EXISTS `tb_service_request_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_service_request_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_service_request_statuses`
--

LOCK TABLES `tb_service_request_statuses` WRITE;
/*!40000 ALTER TABLE `tb_service_request_statuses` DISABLE KEYS */;
INSERT INTO `tb_service_request_statuses` VALUES (1,'Open','label label-success'),(2,'Closed','label label-danger'),(3,'On Hold','label label-primary'),(4,'Pending','label label-warning');
/*!40000 ALTER TABLE `tb_service_request_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_service_requests`
--

DROP TABLE IF EXISTS `tb_service_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_service_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `employee` int(10) unsigned DEFAULT NULL,
  `delivery_at` date NOT NULL,
  `department` int(10) unsigned DEFAULT NULL,
  `priority` int(10) unsigned DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `supervisor` int(10) unsigned DEFAULT NULL,
  `supervisor_status` int(10) unsigned DEFAULT NULL,
  `supervisor_approved_at` datetime NOT NULL,
  `manager` int(10) unsigned DEFAULT NULL,
  `manager_status` int(10) unsigned DEFAULT NULL,
  `manager_approved_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `service_requests_subscription_foreign` (`subscription`),
  KEY `service_requests_employee_foreign` (`employee`),
  KEY `service_requests_priority_foreign` (`priority`),
  KEY `service_requests_status_foreign` (`status`),
  KEY `service_requests_supervisor_foreign` (`supervisor`),
  KEY `service_requests_supervisor_status_foreign` (`supervisor_status`),
  KEY `service_requests_manager_foreign` (`manager`),
  KEY `service_requests_manager_status_foreign` (`manager_status`),
  CONSTRAINT `service_requests_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `service_requests_manager_foreign` FOREIGN KEY (`manager`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `service_requests_manager_status_foreign` FOREIGN KEY (`manager_status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `service_requests_priority_foreign` FOREIGN KEY (`priority`) REFERENCES `tb_service_request_priorities` (`id`),
  CONSTRAINT `service_requests_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `service_requests_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `service_requests_supervisor_foreign` FOREIGN KEY (`supervisor`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `service_requests_supervisor_status_foreign` FOREIGN KEY (`supervisor_status`) REFERENCES `tb_statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_service_requests`
--

LOCK TABLES `tb_service_requests` WRITE;
/*!40000 ALTER TABLE `tb_service_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_service_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sessions`
--

DROP TABLE IF EXISTS `tb_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sessions`
--

LOCK TABLES `tb_sessions` WRITE;
/*!40000 ALTER TABLE `tb_sessions` DISABLE KEYS */;
INSERT INTO `tb_sessions` VALUES ('0192db68a0528ee872c3a7e93a251a96c940d2d7','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYWp3N05uSU1ETXpIOWhmMTJxWTQzOFJuS2hIbWpOUVhWaHVrNHV5SCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MTp7aTowO3M6MjA6InN1YnNjcmlwdGlvbl9zZXNzaW9uIjt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hY2NvdW50LzEvbWFuYWdlIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxNDYzMzg5Njk5O3M6MToiYyI7aToxNDYzMzg5Njk4O3M6MToibCI7czoxOiIwIjt9fQ==',1463389699),('f7c792276a68a61a3f1c2bfdea89963595dd92c9','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWkZqR1ZkaUFOa1RHenFQZWFrM0RYMjhqUTRZOGhBUjg5VWJFZzgwQiI7czo1OiJmbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MTp7aTowO3M6MjA6InN1YnNjcmlwdGlvbl9zZXNzaW9uIjt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9maWxlIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcnJvci9wYWdlLW5vdC1mb3VuZCI7fXM6Mzg6ImxvZ2luXzgyZTVkMmM1NmJkZDA4MTEzMThmMGNmMDc4Yjc4YmZjIjtzOjE6IjIiO3M6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxNDYzMzg5OTQ3O3M6MToiYyI7aToxNDYzMzg5NjkyO3M6MToibCI7czoxOiIwIjt9fQ==',1463389948);
/*!40000 ALTER TABLE `tb_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_settings_fields`
--

DROP TABLE IF EXISTS `tb_settings_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_settings_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `input_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sequence` int(11) NOT NULL,
  `access` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_settings_fields`
--

LOCK TABLES `tb_settings_fields` WRITE;
/*!40000 ALTER TABLE `tb_settings_fields` DISABLE KEYS */;
INSERT INTO `tb_settings_fields` VALUES (1,'report.header','Report Header','',0,1),(2,'report.address','Report Address','',0,1),(3,'report.contact','Report Contact Number','',0,1),(4,'hr.supervisor','HR Supervisor','',0,1),(5,'general.manager','General Manager','',0,1),(6,'whole.day.duty.hours','Whole Day Duty (Hrs)','',0,1),(7,'am.duty.hours','AM Duty (Hrs)','',0,1),(8,'pm.duty.hours','PM Duty (Hrs)','',0,1),(9,'total.days.month','Total No. of Days per Month','',0,1),(10,'max.employees','Max Employees','',0,0),(11,'max.clients','Max Clients','',0,0),(12,'max.stores','Max Stores','',0,0);
/*!40000 ALTER TABLE `tb_settings_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shift_activities`
--

DROP TABLE IF EXISTS `tb_shift_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shift_activities` (
  `subscription` int(10) unsigned NOT NULL,
  `shift` int(10) unsigned NOT NULL,
  `activity` int(10) unsigned NOT NULL,
  `schedule` time DEFAULT NULL,
  `night_shift` smallint(6) DEFAULT NULL,
  KEY `shift_activities_subscription_foreign` (`subscription`),
  KEY `shift_activities_shift_foreign` (`shift`),
  KEY `shift_activities_activity_foreign` (`activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shift_activities`
--

LOCK TABLES `tb_shift_activities` WRITE;
/*!40000 ALTER TABLE `tb_shift_activities` DISABLE KEYS */;
INSERT INTO `tb_shift_activities` VALUES (5,12,1,'05:00:00',NULL),(5,12,2,'07:30:00',NULL),(5,12,3,'08:00:00',NULL),(5,12,4,'11:30:00',NULL),(5,12,5,'12:00:00',NULL),(5,12,6,'15:00:00',NULL),(5,13,1,'23:00:00',NULL),(5,13,2,'01:30:00',NULL),(5,13,3,'02:00:00',NULL),(5,13,4,'05:30:00',NULL),(5,13,5,'06:00:00',NULL),(5,13,6,'09:00:00',NULL),(1,8,1,'09:30:00',0),(1,8,2,'12:30:00',0),(1,8,3,'13:30:00',0),(1,8,4,'19:00:00',0),(2,2,1,'11:45:00',NULL),(2,2,2,'14:30:00',NULL),(2,2,3,'15:30:00',NULL),(2,2,4,'21:15:00',NULL),(2,3,1,'09:45:00',NULL),(2,3,2,'12:00:00',NULL),(2,3,3,'13:00:00',NULL),(2,3,4,'21:15:00',NULL),(2,4,1,'09:00:00',0),(2,4,2,'12:00:00',0),(2,4,3,'13:00:00',0),(2,4,4,'18:00:00',0),(1,6,1,'11:45:00',0),(1,6,2,'14:00:00',0),(1,6,3,'15:00:00',0),(1,6,4,'21:15:00',0),(1,5,1,'09:45:00',0),(1,5,2,'12:00:00',0),(1,5,3,'13:00:00',0),(1,5,4,'19:15:00',0),(1,7,1,'09:45:00',NULL),(1,7,2,'12:00:00',NULL),(1,7,3,'13:00:00',NULL),(1,7,4,'21:15:00',NULL),(2,1,1,'09:45:00',0),(2,1,2,'13:00:00',0),(2,1,3,'14:00:00',0),(2,1,4,'19:15:00',0);
/*!40000 ALTER TABLE `tb_shift_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shifts`
--

DROP TABLE IF EXISTS `tb_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `break_start_time` time DEFAULT NULL,
  `break_end_time` time DEFAULT NULL,
  `is_break_paid` smallint(6) DEFAULT NULL,
  `total_hours` decimal(9,2) NOT NULL,
  `total_break_hours` decimal(9,2) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `shifts_subscription_foreign` (`subscription`),
  KEY `shifts_user_foreign` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shifts`
--

LOCK TABLES `tb_shifts` WRITE;
/*!40000 ALTER TABLE `tb_shifts` DISABLE KEYS */;
INSERT INTO `tb_shifts` VALUES (1,2,'Opening (9:45am - 7:15pm)','09:45:00','19:15:00','12:00:00','13:00:00',0,8.00,1.50,1,2,'2016-06-15 21:19:02','2017-06-28 11:14:58'),(2,2,'Closing (11:45am - 9:15pm)','11:45:00','21:15:00',NULL,NULL,NULL,8.00,1.50,1,2,'2017-06-07 08:35:39','2017-06-07 08:35:39'),(3,2,'Full Shift (9:45am - 9:15pm)','09:45:00','21:15:00',NULL,NULL,NULL,10.00,1.50,1,2,'2017-06-07 08:37:05','2017-06-07 08:37:05'),(4,2,'Regular (9am - 5pm)','09:00:00','18:00:00',NULL,NULL,NULL,9.00,1.00,1,2,'2017-06-07 10:22:31','2017-06-07 14:30:45'),(5,1,'Opening (9:45am - 7:15pm)','09:45:00','19:15:00',NULL,NULL,NULL,8.00,1.00,1,2,'2017-06-23 15:10:26','2017-06-23 15:26:04'),(6,1,'Closing (11:45am - 9:15pm)','11:45:00','21:15:00',NULL,NULL,NULL,8.00,1.00,1,2,'2017-06-23 15:21:29','2017-06-23 15:25:49'),(7,1,'Full-Shift (9:45am - 9:15pm)','09:45:00','21:15:00',NULL,NULL,NULL,9.00,1.00,1,2,'2017-06-23 15:27:35','2017-06-23 15:27:35');
/*!40000 ALTER TABLE `tb_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ship_queries`
--

DROP TABLE IF EXISTS `tb_ship_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ship_queries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ebay_item` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ebay_account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `edited_note` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ship_queries`
--

LOCK TABLES `tb_ship_queries` WRITE;
/*!40000 ALTER TABLE `tb_ship_queries` DISABLE KEYS */;
INSERT INTO `tb_ship_queries` VALUES (1,'234945435','4958845','accessories','4',1,'Change color','2018-02-27 05:43:50','2018-03-04 04:31:46'),(2,'239048','998592384','fan-made','4',1,'Change color','2018-03-03 21:02:36','2018-03-04 03:56:04'),(3,'49375398545','362208273624','street-moda','4',1,'Change color','2018-03-04 00:39:23','2018-03-04 00:44:00'),(4,'pmmsCARSON2 PT','362208273624','street-moda','4',1,'Change color','2018-03-04 03:55:04','2018-03-04 03:55:04'),(5,'LS-2D066-1695-02','na','azucenocho-3','4',1,'Change color Luxury Slim Film Wrap Decal Skin Sticker Back Cover For iPhone X 8 7 6s 6 Plus(black)','2018-03-06 13:33:14','2018-03-06 13:33:14');
/*!40000 ALTER TABLE `tb_ship_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shipping_comment`
--

DROP TABLE IF EXISTS `tb_shipping_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shipping_comment` (
  `shipping_requests_id` int(10) unsigned NOT NULL,
  `comment_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `read` int(11) NOT NULL DEFAULT 0,
  KEY `shipping_comment_shipping_requests_id_foreign` (`shipping_requests_id`),
  KEY `shipping_comment_comment_id_foreign` (`comment_id`),
  KEY `shipping_comment_user_id_foreign` (`user_id`),
  CONSTRAINT `shipping_comment_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `tb_comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shipping_comment_shipping_requests_id_foreign` FOREIGN KEY (`shipping_requests_id`) REFERENCES `tb_shipping_requests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shipping_comment_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shipping_comment`
--

LOCK TABLES `tb_shipping_comment` WRITE;
/*!40000 ALTER TABLE `tb_shipping_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_shipping_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shipping_request_types`
--

DROP TABLE IF EXISTS `tb_shipping_request_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shipping_request_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shipping_request_types`
--

LOCK TABLES `tb_shipping_request_types` WRITE;
/*!40000 ALTER TABLE `tb_shipping_request_types` DISABLE KEYS */;
INSERT INTO `tb_shipping_request_types` VALUES (1,'跟踪号和发货日期（Tracking & Ship Date）'),(2,'订单未更新（Pre-Shipment）'),(3,'修改订单（Change Order)'),(4,'确认地址  (Confirm the Address)'),(5,'暂放  (Hold)'),(6,'修改地址  (Change Address)'),(7,'取消订单  (Cancel Order)'),(8,'补发  (Replacement)'),(9,'缺货  (OOS)');
/*!40000 ALTER TABLE `tb_shipping_request_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shipping_requests`
--

DROP TABLE IF EXISTS `tb_shipping_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shipping_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ebay_item` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ebay_account` int(10) unsigned NOT NULL,
  `ebay_account_manual` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `request_type_id` int(11) DEFAULT NULL,
  `classification_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `if_new` int(11) DEFAULT 0,
  `sold_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipping_requests_classification_id_foreign` (`classification_id`),
  KEY `shipping_requests_user_id_foreign` (`user_id`),
  KEY `shipping_requests_ebay_account_foreign` (`ebay_account`),
  KEY `shipping_requests_file_id_foreign` (`file_id`),
  CONSTRAINT `shipping_requests_classification_id_foreign` FOREIGN KEY (`classification_id`) REFERENCES `tb_request_classifications` (`id`),
  CONSTRAINT `shipping_requests_ebay_account_foreign` FOREIGN KEY (`ebay_account`) REFERENCES `tb_ebay_accounts` (`id`),
  CONSTRAINT `shipping_requests_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `tb_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shipping_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shipping_requests`
--

LOCK TABLES `tb_shipping_requests` WRITE;
/*!40000 ALTER TABLE `tb_shipping_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_shipping_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sss_premium_settings`
--

DROP TABLE IF EXISTS `tb_sss_premium_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sss_premium_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL DEFAULT 0,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minbracket` decimal(9,2) NOT NULL,
  `maxbracket` decimal(9,2) NOT NULL,
  `salary_credit` decimal(9,2) NOT NULL,
  `employeeshare` decimal(9,2) NOT NULL,
  `employershare` decimal(9,2) NOT NULL,
  `employerec` decimal(9,2) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`subscription`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sss_premium_settings`
--

LOCK TABLES `tb_sss_premium_settings` WRITE;
/*!40000 ALTER TABLE `tb_sss_premium_settings` DISABLE KEYS */;
INSERT INTO `tb_sss_premium_settings` VALUES (1,1,'1',' 1,000.00 - 1,249.99 ',1000.00,1249.99,1000.00,36.30,73.70,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 00:41:41'),(2,1,'2',' 1,250.00 	 - 	 1,749.99 ',1250.00,1749.99,1500.00,54.50,110.50,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(3,1,'3',' 1,750.00 	 - 	 2,249.99 ',1750.00,2249.99,2000.00,72.70,147.30,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(4,1,'4',' 2,250.00 	 - 	 2,749.99 ',2250.00,2749.99,2500.00,90.80,184.20,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(5,1,'5',' 2,750.00 	 - 	 3,249.99 ',2750.00,3249.99,3000.00,109.00,221.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(6,1,'6',' 3,250.00 	 - 	 3,749.99 ',3250.00,3749.99,3500.00,127.20,257.80,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(7,1,'7',' 3,750.00 	 - 	 4,249.99 ',3750.00,4249.99,4000.00,145.30,294.70,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(8,1,'8',' 4,250.00 	 - 	 4,749.99 ',4250.00,4749.99,4500.00,163.50,331.50,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(9,1,'9',' 4,750.00 	 - 	 5,249.99 ',4750.00,5249.99,5000.00,181.70,368.30,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(10,1,'10',' 5,250.00 	 - 	 5,749.99 ',5250.00,5749.99,5500.00,199.80,405.20,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(11,1,'11',' 5,750.00 	 - 	 6,249.99 ',5750.00,6249.99,6000.00,218.00,442.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(12,1,'12',' 6,250.00 	 - 	 6,749.99 ',6250.00,6749.99,6500.00,236.20,478.80,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(13,1,'13',' 6,750.00 	 - 	 7,249.99 ',6750.00,7249.99,7000.00,254.30,515.70,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(14,1,'14',' 7,250.00 	 - 	 7,749.99 ',7250.00,7749.99,7500.00,272.50,552.50,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(15,1,'15',' 7,750.00 	 - 	 8,249.99 ',7750.00,8249.99,8000.00,290.70,589.30,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(16,1,'16',' 8,250.00 	 - 	 8,749.99 ',8250.00,8749.99,8500.00,308.80,626.20,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(17,1,'17',' 8,750.00 	 - 	 9,249.99 ',8750.00,9249.99,9000.00,327.00,663.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(18,1,'18',' 9,250.00 	 - 	 9,749.99 ',9250.00,9749.99,9500.00,345.20,699.80,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(19,1,'19',' 9,750.00 	 - 	 10,249.99 ',9750.00,10249.99,10000.00,363.30,736.70,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(20,1,'20',' 10,250.00 	 - 	 10,749.99 ',10250.00,10749.99,10500.00,381.50,773.50,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(21,1,'21',' 10,750.00 	 - 	 11,249.99 ',10750.00,11249.99,11000.00,399.70,810.30,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(22,1,'22',' 11,250.00 	 - 	 11,749.99 ',11250.00,11749.99,11500.00,417.80,847.20,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(23,1,'23',' 11,750.00 	 - 	 12,249.99 ',11750.00,12249.99,12000.00,436.00,884.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(24,1,'24',' 12,250.00 	 - 	 12,749.99 ',12250.00,12749.99,12500.00,454.20,920.80,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(25,1,'25',' 12,750.00 	 - 	 13,249.99 ',12750.00,13249.99,13000.00,472.30,957.70,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(26,1,'26',' 13,250.00 	 - 	 13,749.99 ',13250.00,13749.99,13500.00,490.50,994.50,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(27,1,'27',' 13,750.00 	 - 	 14,249.99 ',13750.00,14249.99,14000.00,508.70,1.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(28,1,'28',' 14,250.00 	 - 	 14,749.99 ',14250.00,14749.99,14500.00,526.80,1.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(29,1,'29',' 14,750.00 	 - 	 15,249.99 ',14750.00,15249.99,15000.00,545.00,1105.00,30.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(30,1,'30',' 15,250.00 	 - 	 15,749.99 ',15250.00,15749.99,15500.00,563.20,1141.80,30.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(31,1,'31',' 15,750.00 	 - 	 over ',15750.00,999999.99,16000.00,581.30,1.00,30.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(32,2,'1',' 1,000.00 - 1,249.99 ',1000.00,1249.99,1000.00,36.30,73.70,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 00:41:41'),(33,2,'2',' 1,250.00   -   1,749.99 ',1250.00,1749.99,1500.00,54.50,110.50,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(34,2,'3',' 1,750.00   -   2,249.99 ',1750.00,2249.99,2000.00,72.70,147.30,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(35,2,'4',' 2,250.00   -   2,749.99 ',2250.00,2749.99,2500.00,90.80,184.20,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(36,2,'5',' 2,750.00   -   3,249.99 ',2750.00,3249.99,3000.00,109.00,221.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(37,2,'6',' 3,250.00   -   3,749.99 ',3250.00,3749.99,3500.00,127.20,257.80,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(38,2,'7',' 3,750.00   -   4,249.99 ',3750.00,4249.99,4000.00,145.30,294.70,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(39,2,'8',' 4,250.00   -   4,749.99 ',4250.00,4749.99,4500.00,163.50,331.50,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(40,2,'9',' 4,750.00   -   5,249.99 ',4750.00,5249.99,5000.00,181.70,368.30,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(41,2,'10',' 5,250.00     -   5,749.99 ',5250.00,5749.99,5500.00,199.80,405.20,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(42,2,'11',' 5,750.00     -   6,249.99 ',5750.00,6249.99,6000.00,218.00,442.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(43,2,'12',' 6,250.00     -   6,749.99 ',6250.00,6749.99,6500.00,236.20,478.80,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(44,2,'13',' 6,750.00     -   7,249.99 ',6750.00,7249.99,7000.00,254.30,515.70,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(45,2,'14',' 7,250.00     -   7,749.99 ',7250.00,7749.99,7500.00,272.50,552.50,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(46,2,'15',' 7,750.00     -   8,249.99 ',7750.00,8249.99,8000.00,290.70,589.30,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(47,2,'16',' 8,250.00     -   8,749.99 ',8250.00,8749.99,8500.00,308.80,626.20,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(48,2,'17',' 8,750.00     -   9,249.99 ',8750.00,9249.99,9000.00,327.00,663.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(49,2,'18',' 9,250.00     -   9,749.99 ',9250.00,9749.99,9500.00,345.20,699.80,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(50,2,'19',' 9,750.00     -   10,249.99 ',9750.00,10249.99,10000.00,363.30,736.70,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(51,2,'20',' 10,250.00    -   10,749.99 ',10250.00,10749.99,10500.00,381.50,773.50,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(52,2,'21',' 10,750.00    -   11,249.99 ',10750.00,11249.99,11000.00,399.70,810.30,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(53,2,'22',' 11,250.00    -   11,749.99 ',11250.00,11749.99,11500.00,417.80,847.20,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(54,2,'23',' 11,750.00    -   12,249.99 ',11750.00,12249.99,12000.00,436.00,884.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(55,2,'24',' 12,250.00    -   12,749.99 ',12250.00,12749.99,12500.00,454.20,920.80,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(56,2,'25',' 12,750.00    -   13,249.99 ',12750.00,13249.99,13000.00,472.30,957.70,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(57,2,'26',' 13,250.00    -   13,749.99 ',13250.00,13749.99,13500.00,490.50,994.50,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(58,2,'27',' 13,750.00    -   14,249.99 ',13750.00,14249.99,14000.00,508.70,1.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(59,2,'28',' 14,250.00    -   14,749.99 ',14250.00,14749.99,14500.00,526.80,1.00,10.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(60,2,'29',' 14,750.00    -   15,249.99 ',14750.00,15249.99,15000.00,545.00,1105.00,30.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(61,2,'30',' 15,250.00    -   15,749.99 ',15250.00,15749.99,15500.00,563.20,1141.80,30.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16'),(62,2,'31',' 15,750.00    -   over ',15750.00,999999.99,16000.00,581.30,1.00,30.00,2,1,'2016-05-09 08:34:16','2016-05-09 08:34:16');
/*!40000 ALTER TABLE `tb_sss_premium_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_statuses`
--

DROP TABLE IF EXISTS `tb_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_statuses`
--

LOCK TABLES `tb_statuses` WRITE;
/*!40000 ALTER TABLE `tb_statuses` DISABLE KEYS */;
INSERT INTO `tb_statuses` VALUES (1,'Active','label label-success'),(2,'Inactive','label label-danger'),(3,'Approve','label label-success'),(4,'Disapprove','label label-danger'),(5,'Pending','label label-warning'),(6,'Processed','label label-success'),(7,'Setup','label label-primary'),(8,'Cancelled','label label-danger'),(9,'Open',''),(10,'Close',''),(11,'Available','label label-success'),(12,'Reserved','label label-warning'),(13,'Booked','label label-primary'),(14,'Occupied','label label-default'),(15,'For Houskeeping','label label-danger'),(16,'Paid','label label-success'),(17,'Confirmed','label label-success');
/*!40000 ALTER TABLE `tb_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stock_transfer_log_types`
--

DROP TABLE IF EXISTS `tb_stock_transfer_log_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stock_transfer_log_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stock_transfer_log_types`
--

LOCK TABLES `tb_stock_transfer_log_types` WRITE;
/*!40000 ALTER TABLE `tb_stock_transfer_log_types` DISABLE KEYS */;
INSERT INTO `tb_stock_transfer_log_types` VALUES (1,'New Item Added','NIA'),(2,'Item Edited','IE'),(3,'Transferred Item to Warehouse','TTW'),(4,'Received Item from Store','RFST'),(5,'Declined Item from Store','DFST'),(6,'Transferred Item to Supplier','TTSR'),(7,'Printed Receiving Form for Supplier','PRF'),(8,'Item Received by Supplier','RBSR'),(9,'Transferred Item from Supplier','TFSR'),(10,'Received Item from Supplier','RFSR'),(11,'Declined Item from Supplier','DFSR'),(12,'Transferred Item to Store','TTST'),(13,'Received Item from Warehouse','RFW'),(14,'Declined Item from Warehouse','DFW'),(15,'Complete Transaction','CT');
/*!40000 ALTER TABLE `tb_stock_transfer_log_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stock_transfer_logs`
--

DROP TABLE IF EXISTS `tb_stock_transfer_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stock_transfer_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `log_type` int(10) unsigned DEFAULT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_transfer_logs_user_foreign` (`user`),
  KEY `stock_transfer_logs_log_type_foreign` (`log_type`),
  KEY `stock_transfer_logs_transaction_id_foreign` (`transaction_id`),
  CONSTRAINT `stock_transfer_logs_log_type_foreign` FOREIGN KEY (`log_type`) REFERENCES `tb_stock_transfer_log_types` (`id`),
  CONSTRAINT `stock_transfer_logs_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `tb_stock_transfers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_logs_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stock_transfer_logs`
--

LOCK TABLES `tb_stock_transfer_logs` WRITE;
/*!40000 ALTER TABLE `tb_stock_transfer_logs` DISABLE KEYS */;
INSERT INTO `tb_stock_transfer_logs` VALUES (1,1,'Item Added',1,3,'2017-05-19 09:10:19','2017-05-19 09:10:19'),(4,1,'Transferred Item to Warehouse',3,3,'2017-05-19 10:47:16','2017-05-19 10:47:16'),(5,1,'Received Item from Store',4,4,'2017-05-19 10:48:50','2017-05-19 10:48:50'),(6,1,'Transferred Item to Supplier',6,4,'2017-05-19 10:55:34','2017-05-19 10:55:34'),(7,1,'Printed Receiving Form for Supplier',7,4,'2017-05-19 11:02:49','2017-05-19 11:02:49'),(8,1,'Item Received by Supplier',8,4,'2017-05-19 11:13:12','2017-05-19 11:13:12'),(10,1,'Transferred Item from Supplier - RMA: 49850345',9,2,'2017-05-19 13:32:30','2017-05-19 13:32:30'),(11,1,'Received Item from Supplier',10,4,'2017-05-19 13:40:39','2017-05-19 13:40:39'),(12,1,'Transferred Item to Store',12,4,'2017-05-19 13:43:57','2017-05-19 13:43:57'),(13,1,'Received Item from Warehouse',13,3,'2017-05-19 13:47:03','2017-05-19 13:47:03'),(14,2,'test log',NULL,3,'2017-05-19 13:51:10','2017-05-19 13:51:10'),(15,1,'completed',NULL,2,'2017-05-25 11:42:42','2017-05-25 11:42:42'),(16,1,'Item has been edited',2,3,'2017-05-25 11:54:09','2017-05-25 11:54:09'),(17,1,'Item has been edited',2,3,'2017-05-25 11:55:48','2017-05-25 11:55:48'),(18,1,'Item has been edited',2,3,'2017-05-25 11:55:56','2017-05-25 11:55:56'),(19,2,'Item has been edited',2,2,'2017-05-25 12:23:12','2017-05-25 12:23:12'),(20,3,'New Item Added',1,3,'2017-05-25 12:27:36','2017-05-25 12:27:36'),(21,3,'Transferred Item to Warehouse',3,3,'2017-05-25 12:28:17','2017-05-25 12:28:17'),(22,3,'Received Item from Store',4,4,'2017-05-25 12:29:08','2017-05-25 12:29:08'),(23,3,'Transferred Item to Supplier',6,4,'2017-05-25 12:29:39','2017-05-25 12:29:39'),(24,3,'Printed Receiving Form for Supplier',7,4,'2017-05-25 12:29:51','2017-05-25 12:29:51'),(25,3,'Item Received by Supplier',8,4,'2017-05-25 12:30:11','2017-05-25 12:30:11'),(27,3,'Item has been edited',2,2,'2017-05-25 12:32:41','2017-05-25 12:32:41'),(28,3,'Transferred Item from Supplier - RMA: 904845345',9,2,'2017-05-25 12:35:45','2017-05-25 12:35:45'),(29,3,'Received Item from Supplier',10,4,'2017-05-25 12:35:59','2017-05-25 12:35:59'),(30,3,'Transferred Item to Store',12,4,'2017-05-25 12:38:13','2017-05-25 12:38:13'),(31,3,'Received Item from Warehouse',13,3,'2017-05-25 12:38:38','2017-05-25 12:38:38'),(33,5,'New Item Added',1,3,'2017-05-25 12:53:51','2017-05-25 12:53:51'),(34,5,'Item has been edited',2,2,'2017-05-25 13:39:18','2017-05-25 13:39:18'),(35,3,'Item has been edited',2,2,'2017-05-25 13:39:36','2017-05-25 13:39:36'),(36,2,'Item has been edited',2,2,'2017-05-25 13:40:09','2017-05-25 13:40:09'),(37,1,'Item has been edited',2,2,'2017-05-25 13:40:19','2017-05-25 13:40:19'),(38,5,'Transferred Item to Warehouse',3,3,'2017-05-25 13:49:56','2017-05-25 13:49:56'),(39,6,'New Item Added',1,2,'2017-05-25 15:45:00','2017-05-25 15:45:00'),(40,7,'New Item Added',1,3,'2017-05-25 15:48:55','2017-05-25 15:48:55'),(41,7,'Transferred Item to Warehouse',3,3,'2017-05-25 15:49:29','2017-05-25 15:49:29'),(42,7,'Received Item from Store',4,4,'2017-05-25 15:50:42','2017-05-25 15:50:42'),(43,7,'Transferred Item to Supplier',6,4,'2017-05-25 15:51:05','2017-05-25 15:51:05'),(44,7,'Printed Receiving Form for Supplier',7,4,'2017-05-25 15:51:13','2017-05-25 15:51:13'),(45,7,'Item Received by Supplier',8,4,'2017-05-25 15:51:50','2017-05-25 15:51:50'),(46,7,'Transferred Item from Supplier - RMA No: 904358934',9,2,'2017-05-25 15:53:10','2017-05-25 15:53:10'),(47,7,'Received Item from Supplier',10,4,'2017-05-25 15:53:36','2017-05-25 15:53:36'),(48,7,'Transferred Item to Store',12,4,'2017-05-25 15:53:45','2017-05-25 15:53:45'),(49,7,'Received Item from Warehouse',13,3,'2017-05-25 15:54:27','2017-05-25 15:54:27'),(50,8,'New Item Added',1,2,'2017-05-25 16:14:31','2017-05-25 16:14:31'),(56,14,'New Item Added',1,2,'2017-05-25 16:18:33','2017-05-25 16:18:33'),(57,14,'Item Received by Supplier',8,2,'2017-05-25 16:18:33','2017-05-25 16:18:33'),(58,14,'CM: 05/22/2017\r\nAmount: 10,000\r\nInvoice No.: 234',NULL,2,'2017-05-25 16:21:34','2017-05-25 16:21:34'),(59,14,'ok',NULL,2,'2017-05-25 16:39:42','2017-05-25 16:39:42'),(60,14,'Complete Transaction - cmoplete',15,2,'2017-05-25 16:41:04','2017-05-25 16:41:04'),(61,15,'New Item Added',1,3,'2017-06-28 13:03:30','2017-06-28 13:03:30');
/*!40000 ALTER TABLE `tb_stock_transfer_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stock_transfers`
--

DROP TABLE IF EXISTS `tb_stock_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stock_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `control_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serial_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier` int(10) unsigned DEFAULT NULL,
  `srp` decimal(9,2) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `rma_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imei_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `purchased_date` date NOT NULL,
  `warranty_date` date NOT NULL,
  `unit_type` int(10) unsigned NOT NULL,
  `remarks` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_transfers_subscription_foreign` (`subscription`),
  KEY `stock_transfers_department_foreign` (`department`),
  KEY `stock_transfers_unit_type_foreign` (`unit_type`),
  KEY `stock_transfers_status_foreign` (`status`),
  KEY `stock_transfers_user_foreign` (`user`),
  KEY `stock_transfers_supplier_foreign` (`supplier`),
  CONSTRAINT `stock_transfers_department_foreign` FOREIGN KEY (`department`) REFERENCES `tb_departments` (`id`),
  CONSTRAINT `stock_transfers_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_fix_asset_statuses` (`id`),
  CONSTRAINT `stock_transfers_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `stock_transfers_supplier_foreign` FOREIGN KEY (`supplier`) REFERENCES `tb_suppliers` (`id`),
  CONSTRAINT `stock_transfers_unit_type_foreign` FOREIGN KEY (`unit_type`) REFERENCES `tb_stock_unit_types` (`id`),
  CONSTRAINT `stock_transfers_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stock_transfers`
--

LOCK TABLES `tb_stock_transfers` WRITE;
/*!40000 ALTER TABLE `tb_stock_transfers` DISABLE KEYS */;
INSERT INTO `tb_stock_transfers` VALUES (1,1,'',9,'Nokia 3310','Nokia','3310','Red','94850349850983',1,3000.00,3200.00,'32954935','9403850345-8','2017-05-25','2017-05-25',1,'not functioning',1,2,'2017-05-11 05:52:44','2017-05-25 13:40:19'),(2,1,'',9,'Samsung J5','Samsung','J5','Gold','94850594',2,12995.00,13500.00,'394893048509','490850394859','2017-05-25','2017-05-25',1,'power failure',2,2,'2017-05-11 06:28:17','2017-05-25 13:40:09'),(3,1,'',9,'Samsung Galaxy S8','Samsung ','S8','Black','498590485',1,40000.00,42000.00,'','94850934','2017-05-25','2017-05-25',1,'not charging',1,2,'2017-05-25 12:27:36','2017-05-25 13:39:36'),(5,1,'',9,'iPhone 7','Apple','iPhone 7','Black','0934892034',1,35000.00,35000.00,'','0498509435','2017-05-25','2017-05-25',1,'fail screen',1,2,'2017-05-25 12:53:51','2017-05-25 13:39:18'),(6,1,'',1,'LG 09348','LG','9034850','gray','034985',1,9384.00,9348.00,'4958','094850','2017-05-25','2017-05-25',1,'test',1,2,'2017-05-25 15:45:00','2017-05-25 15:45:00'),(7,1,'',9,'Asus 9485','Asus','49580','black','9405894',NULL,20000.00,0.00,'','948509','2017-05-01','2017-05-25',1,'not charging',1,3,'2017-05-25 15:48:55','2017-05-25 15:48:55'),(8,1,'1717-05052525-8',1,'Samsung 435345','Samsung','9458','94583','495809',1,980.00,85.00,'4598','49580','2017-05-25','2017-05-25',1,'asdf',1,2,'2017-05-25 16:14:31','2017-05-25 16:14:31'),(14,1,'17-0525-9',1,'Samsung 34598','Samsung','34545','94583','495809',1,980.00,85.00,'4598','49580','2017-05-25','2017-05-25',1,'asdf',1,2,'2017-05-25 16:18:33','2017-05-25 16:18:33'),(15,2,'17-0628-15',9,'Samsung Galaxy S8','Samsung','S8','Black','9348509485',NULL,38000.00,0.00,'','23098495','2017-06-28','2017-06-28',1,'not charging',2,3,'2017-06-28 13:03:30','2017-06-28 13:03:30');
/*!40000 ALTER TABLE `tb_stock_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stock_unit_types`
--

DROP TABLE IF EXISTS `tb_stock_unit_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stock_unit_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stock_unit_types`
--

LOCK TABLES `tb_stock_unit_types` WRITE;
/*!40000 ALTER TABLE `tb_stock_unit_types` DISABLE KEYS */;
INSERT INTO `tb_stock_unit_types` VALUES (1,'Stock Unit'),(2,'Customer Unit');
/*!40000 ALTER TABLE `tb_stock_unit_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_store_billing`
--

DROP TABLE IF EXISTS `tb_store_billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_store_billing` (
  `controlno` bigint(20) unsigned NOT NULL,
  `documentno` bigint(20) unsigned NOT NULL,
  `store` int(10) unsigned NOT NULL,
  `setup_user` int(11) NOT NULL,
  `postedby_user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`,`documentno`,`store`),
  KEY `store_billing_store_foreign` (`store`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_store_billing`
--

LOCK TABLES `tb_store_billing` WRITE;
/*!40000 ALTER TABLE `tb_store_billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_store_billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_store_department`
--

DROP TABLE IF EXISTS `tb_store_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_store_department` (
  `store_id` int(10) unsigned NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`store_id`,`department_id`),
  KEY `store_department_department_id_foreign` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_store_department`
--

LOCK TABLES `tb_store_department` WRITE;
/*!40000 ALTER TABLE `tb_store_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_store_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_store_employee`
--

DROP TABLE IF EXISTS `tb_store_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_store_employee` (
  `subscription_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL DEFAULT 0,
  `effective_date` date NOT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`subscription_id`,`store_id`,`employee_id`,`status_id`,`effective_date`),
  KEY `store_employee_store_id_foreign` (`store_id`),
  KEY `store_employee_employee_id_foreign` (`employee_id`),
  KEY `store_employee_status_id_foreign` (`status_id`),
  KEY `store_employee_user_foreign` (`user`),
  CONSTRAINT `store_employee_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `tb_employees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `store_employee_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `store_employee_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `tb_stores` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `store_employee_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `store_employee_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_store_employee`
--

LOCK TABLES `tb_store_employee` WRITE;
/*!40000 ALTER TABLE `tb_store_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_store_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_store_loans_details`
--

DROP TABLE IF EXISTS `tb_store_loans_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_store_loans_details` (
  `controlno` bigint(20) unsigned NOT NULL,
  `documentno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `store` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `client` int(11) NOT NULL,
  `ref` int(11) NOT NULL,
  `dedcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`controlno`,`documentno`,`store`,`employee`),
  KEY `store_loans_details_employee_foreign` (`employee`),
  KEY `store_loans_details_store_foreign` (`store`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_store_loans_details`
--

LOCK TABLES `tb_store_loans_details` WRITE;
/*!40000 ALTER TABLE `tb_store_loans_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_store_loans_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_store_loans_summary`
--

DROP TABLE IF EXISTS `tb_store_loans_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_store_loans_summary` (
  `controlno` bigint(20) unsigned NOT NULL,
  `documentno` bigint(20) NOT NULL,
  `store` int(10) unsigned NOT NULL,
  `setup_user` int(11) NOT NULL,
  `postedby_user` int(11) NOT NULL,
  `period` date NOT NULL,
  `payrollstart` date NOT NULL,
  `payrollend` date NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`,`documentno`,`store`,`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_store_loans_summary`
--

LOCK TABLES `tb_store_loans_summary` WRITE;
/*!40000 ALTER TABLE `tb_store_loans_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_store_loans_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_store_overtime_type`
--

DROP TABLE IF EXISTS `tb_store_overtime_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_store_overtime_type` (
  `store_id` int(10) unsigned NOT NULL,
  `overtime_type_id` int(10) unsigned NOT NULL,
  `rate` decimal(9,2) NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`store_id`,`overtime_type_id`),
  KEY `store_overtime_type_overtime_type_id_foreign` (`overtime_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_store_overtime_type`
--

LOCK TABLES `tb_store_overtime_type` WRITE;
/*!40000 ALTER TABLE `tb_store_overtime_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_store_overtime_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_store_report_type`
--

DROP TABLE IF EXISTS `tb_store_report_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_store_report_type` (
  `store_id` int(10) unsigned NOT NULL,
  `report_type_id` int(10) unsigned NOT NULL,
  `report_format_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`store_id`,`report_type_id`,`report_format_id`),
  KEY `store_report_type_report_type_id_foreign` (`report_type_id`),
  KEY `store_report_type_report_format_id_foreign` (`report_format_id`),
  CONSTRAINT `store_report_type_report_format_id_foreign` FOREIGN KEY (`report_format_id`) REFERENCES `tb_report_formats` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `store_report_type_report_type_id_foreign` FOREIGN KEY (`report_type_id`) REFERENCES `tb_report_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `store_report_type_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `tb_stores` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_store_report_type`
--

LOCK TABLES `tb_store_report_type` WRITE;
/*!40000 ALTER TABLE `tb_store_report_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_store_report_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_store_type`
--

DROP TABLE IF EXISTS `tb_store_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_store_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_type_subscription_foreign` (`subscription`),
  CONSTRAINT `store_type_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_store_type`
--

LOCK TABLES `tb_store_type` WRITE;
/*!40000 ALTER TABLE `tb_store_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_store_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_store_user`
--

DROP TABLE IF EXISTS `tb_store_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_store_user` (
  `subscription` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`store_id`,`user_id`),
  KEY `store_user_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_store_user`
--

LOCK TABLES `tb_store_user` WRITE;
/*!40000 ALTER TABLE `tb_store_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_store_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stores`
--

DROP TABLE IF EXISTS `tb_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `client` int(10) unsigned zerofill DEFAULT NULL,
  `division` int(10) unsigned DEFAULT NULL,
  `store_type` int(10) unsigned DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `manager` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `stores_client_foreign` (`client`),
  KEY `stores_subscription_foreign` (`subscription`),
  KEY `stores_division_foreign` (`division`),
  KEY `stores_store_type_foreign` (`store_type`),
  CONSTRAINT `stores_client_foreign` FOREIGN KEY (`client`) REFERENCES `tb_clients` (`id`),
  CONSTRAINT `stores_division_foreign` FOREIGN KEY (`division`) REFERENCES `tb_divisions` (`id`),
  CONSTRAINT `stores_store_type_foreign` FOREIGN KEY (`store_type`) REFERENCES `tb_store_type` (`id`),
  CONSTRAINT `stores_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stores`
--

LOCK TABLES `tb_stores` WRITE;
/*!40000 ALTER TABLE `tb_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sub_account_types`
--

DROP TABLE IF EXISTS `tb_sub_account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sub_account_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sub_account_types`
--

LOCK TABLES `tb_sub_account_types` WRITE;
/*!40000 ALTER TABLE `tb_sub_account_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sub_account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sub_accounts`
--

DROP TABLE IF EXISTS `tb_sub_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sub_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `glcontrol` int(11) NOT NULL,
  `accountclass` int(11) NOT NULL,
  `accounttype` int(11) NOT NULL,
  `accountentry` int(11) NOT NULL,
  `glaccount` int(11) NOT NULL,
  `subaccounttype` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`glcontrol`,`accountclass`,`accounttype`,`accountentry`,`glaccount`,`subaccounttype`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sub_accounts`
--

LOCK TABLES `tb_sub_accounts` WRITE;
/*!40000 ALTER TABLE `tb_sub_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sub_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sub_menu`
--

DROP TABLE IF EXISTS `tb_sub_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sub_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sub_menu`
--

LOCK TABLES `tb_sub_menu` WRITE;
/*!40000 ALTER TABLE `tb_sub_menu` DISABLE KEYS */;
INSERT INTO `tb_sub_menu` VALUES (1,'New Client','clients/create','',1,'0000-00-00 00:00:00','2017-02-12 17:36:43'),(2,'Setup','laboratory/setup','',2,'0000-00-00 00:00:00','2015-11-25 17:16:22'),(3,'Results','laboratory/results','',2,'0000-00-00 00:00:00','2015-11-25 17:15:23'),(4,'Account Types','setup/account-type','',1,'0000-00-00 00:00:00','2016-04-17 23:47:54'),(5,'Chart of Accounts','accounting/chart-of-accounts','#',1,'0000-00-00 00:00:00','2017-02-08 08:49:15'),(6,'Account','laboratory/account','',2,'0000-00-00 00:00:00','2015-11-25 17:40:58'),(7,'List','clients','',1,'0000-00-00 00:00:00','2017-02-12 17:36:56'),(8,'Payment Receipt','frontoffice/paymentreceipt','',2,'0000-00-00 00:00:00','2015-11-25 17:13:00'),(9,'Users','setup/users','',1,'0000-00-00 00:00:00','2018-02-20 19:33:34'),(10,'Roles','setup/roles','',1,'0000-00-00 00:00:00','2015-12-08 01:38:37'),(11,'Permissions','setup/permissions','',1,'0000-00-00 00:00:00','2018-02-21 01:09:17'),(12,'Withdrawal','frontoffice/withdrawal','',2,'0000-00-00 00:00:00','2015-11-25 17:20:14'),(13,'Disbursement','frontoffice/disbursements','',2,'0000-00-00 00:00:00','2015-11-25 16:57:06'),(14,'Transfer From / To','frontoffice/transfers','',2,'0000-00-00 00:00:00','2015-11-25 17:19:34'),(15,'Passbook Printing','frontoffice/passbookprint','',2,'0000-00-00 00:00:00','2015-11-25 17:12:41'),(16,'Income Statement','reports/income-statement','#',1,'0000-00-00 00:00:00','2017-02-01 20:15:05'),(17,'Journal Transactions','accounting/journal-transactions','#',1,'0000-00-00 00:00:00','2017-02-01 20:14:11'),(18,'Reports','backoffice/reports','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'General Ledger','reports/general-ledger','#',1,'0000-00-00 00:00:00','2017-02-03 20:29:24'),(20,'Trial Balance','reports/trial-balance','#',1,'0000-00-00 00:00:00','2017-02-03 20:29:02'),(21,'Balance Sheet','reports/balance-sheet','',1,'0000-00-00 00:00:00','2017-02-01 20:14:51'),(22,'System Date','tools/systemdate','',1,'0000-00-00 00:00:00','2018-03-04 03:12:33'),(23,'Backup','tools/backup','',1,'0000-00-00 00:00:00','2015-11-25 16:55:14'),(24,'Result Types','setup/result-types','',2,'0000-00-00 00:00:00','2015-11-25 17:15:15'),(26,'New Product','inventory/product/new','',2,'0000-00-00 00:00:00','2015-11-25 17:12:15'),(27,'Product List','inventory/product/list','',2,'0000-00-00 00:00:00','2015-11-25 17:14:39'),(28,'Suppliers','inventory/suppliers','#',1,'0000-00-00 00:00:00','2017-05-25 13:06:24'),(29,'Delivery','inventory/delivery','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,'Point of Sale','frontoffice/point-of-sale','',2,'0000-00-00 00:00:00','2015-11-25 17:13:56'),(31,'New Employee','employee/create','',1,'0000-00-00 00:00:00','2015-11-25 17:11:48'),(32,'Employees','employees','',1,'0000-00-00 00:00:00','2017-01-12 11:34:41'),(33,'Salary Grade','setup/salarygrade','',1,'0000-00-00 00:00:00','2016-07-31 21:45:44'),(34,'PhilHealth','setup/philhealth','',1,'0000-00-00 00:00:00','2016-03-10 17:03:31'),(35,'SSS Premium','setup/sss','',1,'0000-00-00 00:00:00','2016-03-10 17:03:52'),(36,'Witholding Tax','setup/witholdingtax/create','',1,'0000-00-00 00:00:00','2016-03-10 17:04:25'),(37,'Daily Time Record','payroll/dtr','',1,'0000-00-00 00:00:00','2015-12-05 17:11:29'),(38,'Leave','employee/leave','',1,'0000-00-00 00:00:00','2017-04-26 20:26:56'),(39,'Overtime','employee/overtime','',1,'0000-00-00 00:00:00','2017-04-26 20:27:09'),(40,'Undertime','employee/undertime','',1,'0000-00-00 00:00:00','2017-04-26 20:27:23'),(41,'Purchase Request','employee/purchase-requests','',1,'0000-00-00 00:00:00','2017-04-26 20:29:13'),(42,'Memorandum','office/memorandum','',1,'0000-00-00 00:00:00','2017-01-31 15:30:05'),(43,'Policies & Resolutions','office/policies-and-resolutions','',1,'0000-00-00 00:00:00','2017-01-31 15:30:26'),(44,'Fix Asset Inventory','asset-management/fix-asset-inventory','',1,'0000-00-00 00:00:00','2017-04-26 20:29:59'),(45,'Fix Asset Tracking','assetmanagement/fix-asset-tracking','',1,'0000-00-00 00:00:00','2015-11-25 17:09:23'),(46,'Fix Asset Transfer','asset-management/fix-asset-transfer','',1,'0000-00-00 00:00:00','2017-04-26 20:30:13'),(47,'PMS','productivity/pms','',1,'0000-00-00 00:00:00','2017-01-12 11:33:01'),(48,'SMS Notification','productivity/smsnotification','',2,'0000-00-00 00:00:00','2015-11-25 17:16:33'),(49,'Gallery','office/gallery','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,'Help Desk','office/helpdesk','',2,'0000-00-00 00:00:00','2015-11-25 17:10:54'),(51,'Service Request','employee/service-requests','',1,'0000-00-00 00:00:00','2017-04-26 20:29:24'),(52,'Forum','employee/forum','',2,'0000-00-00 00:00:00','2015-11-25 17:09:55'),(53,'Net Pay Computation','payroll/net-pay-computation','',1,'0000-00-00 00:00:00','2015-12-05 17:12:19'),(54,'Pay Slip','employee/payslip','',1,'0000-00-00 00:00:00','2017-04-26 20:29:46'),(55,'Transactions','payroll/transactions','',1,'0000-00-00 00:00:00','2015-12-05 17:13:07'),(56,'Bodega Transfer','asset-management/bodega-transfer','',2,'0000-00-00 00:00:00','2017-01-28 19:02:52'),(57,'Menu','system/menu','',1,'0000-00-00 00:00:00','2015-11-25 17:07:53'),(59,'Sub Menu','system/submenu','',1,'2015-11-25 16:15:21','2015-11-25 17:33:39'),(60,'Billing','payroll/billing','',1,'2015-12-05 18:15:39','2015-12-05 18:15:39'),(61,'Departments','setup/departments','',1,'2015-12-13 21:27:07','2015-12-13 21:43:54'),(62,'Employee Level','setup/employee-level','',1,'2015-12-13 21:27:50','2015-12-13 21:27:50'),(63,'Employee Status','setup/employee-status','',1,'2015-12-13 21:28:06','2015-12-13 21:28:06'),(64,'Overtime Types','setup/overtime-types','',1,'2015-12-13 23:04:02','2015-12-13 23:04:02'),(65,'Report Columns','setup/report-columns','',1,'2015-12-18 15:46:40','2015-12-18 20:01:09'),(66,'Report Designer','setup/report-designer','',1,'2015-12-18 15:46:56','2015-12-18 15:46:56'),(67,'Report Types','setup/report-types','',1,'2015-12-18 22:12:56','2015-12-18 22:12:57'),(68,'Employee Positions','setup/employee-positions','',1,'2016-04-09 03:51:16','2016-04-09 03:51:16'),(69,'Login','','',1,'2016-04-16 21:21:59','2016-04-16 21:21:59'),(70,'Shifts','setup/shifts','',1,'2016-06-15 18:53:12','2016-06-15 19:20:26'),(71,'Schedule Templates','setup/schedule-templates','',1,'2016-06-15 19:20:44','2016-06-15 19:20:44'),(72,'Deduction Institutions','setup/deduction-institutions','',1,'2016-09-07 11:39:30','2016-09-07 11:39:30'),(73,'Transactions','accounting/transactions','#',1,'2017-02-01 08:05:22','2017-02-01 20:14:28'),(74,'Starting Balances','accounting/starting-balances','#',1,'2017-02-01 20:42:15','2017-02-01 20:42:15'),(77,'Estimates','sales/estimates','#',1,'2017-02-13 14:47:55','2017-02-13 14:47:55'),(78,'Invoices','sales/invoices','#',1,'2017-02-13 14:51:01','2017-02-13 14:51:01'),(79,'Recurring Invoices','sales/recurring-invoices','#',1,'2017-02-13 14:51:28','2017-02-13 14:51:28'),(80,'Statement of Account','sales/statement-of-account','#',1,'2017-02-13 14:56:59','2017-02-13 14:56:59'),(81,'Bills','purchases/bills','#',1,'2017-02-13 15:00:35','2017-02-13 15:00:35'),(82,'Receipts','purchases/receipts','#',1,'2017-02-13 15:01:01','2017-02-13 15:01:01'),(84,'Create','products-and-services/create','#',1,'2017-02-14 13:19:26','2017-02-14 13:19:45'),(85,'List','products-and-services','#',1,'2017-02-14 13:20:10','2017-02-14 13:20:10'),(86,'Holidays','setup/holidays','',1,'2017-03-18 04:30:29','2017-03-18 04:30:29'),(87,'Deduction Types','setup/deduction-types','#',1,'2017-03-28 07:16:04','2017-03-28 07:16:04'),(88,'Benefits','setup/benefits','#',1,'2017-03-28 07:22:40','2017-03-28 07:22:40'),(89,'Payroll Items','setup/payroll-items','#',1,'2017-03-28 10:10:28','2017-03-28 10:10:28'),(90,'Night Differentials','setup/night-differentials','#',1,'2017-03-30 12:38:38','2017-03-30 12:38:38'),(91,'Employee Schedule','setup/employee-schedule','#',1,'2017-04-13 10:29:54','2017-04-14 11:23:12'),(92,'Inventory Transactions','inventory/daily-transaction','#',1,'2017-04-26 20:38:28','2017-06-28 22:14:47'),(93,'Stock Transfer','inventory/stock-transfer','#',1,'2017-04-26 20:39:24','2017-05-19 10:30:01'),(94,'Inventory Items','setup/inventory-items','#',1,'2017-04-29 02:35:21','2017-04-29 02:35:22'),(95,'Product Codes','setup/product-codes','',1,'2017-09-12 19:44:07','2017-10-11 09:11:35'),(96,'Code Categories','setup/product-code-categories','',1,'2017-09-12 19:44:31','2017-10-11 09:11:25'),(97,'Upload','setup/product-code-upload','',1,'2017-09-13 15:47:09','2017-10-11 09:12:00'),(98,'Sales Report','reports/sales-reports','#',1,'2017-09-14 13:53:09','2021-01-09 10:51:37'),(99,'Card Load','setup/card-load','',1,'2017-09-19 22:50:53','2017-10-11 09:11:15'),(100,'Card Inventory','report/card-inventory','',1,'2017-10-05 18:34:49','2017-10-11 10:03:52'),(101,'eBay Accounts','setup/ebay-accounts','#',1,'2018-02-21 01:13:05','2018-05-22 16:51:53'),(102,'Shipping Request','shipping-requests/shipping-queries','#',1,'2018-02-26 12:13:38','2018-03-03 20:50:01'),(103,'Hold Shipping','shipping-requests/hold-shipping','#',1,'2018-02-26 12:15:37','2018-03-03 20:50:12'),(104,'Paypal Accounts','setup/paypal-accounts','#',1,'2018-03-01 06:09:00','2018-05-22 16:43:01'),(105,'Message Templates','setup/message-templates','#',1,'2018-03-03 16:54:28','2018-05-22 16:43:11'),(106,'Activity Logs','activity-logs','#',1,'2018-03-04 03:09:47','2018-03-04 03:09:47'),(107,'Room Amenities','setup/room-amenities','#',1,'2018-05-22 17:22:37','2018-05-22 17:22:37'),(108,'House Rules','setup/house-rules','#',1,'2018-05-22 17:23:02','2018-05-22 17:23:02'),(109,'Room Features','setup/room-features','#',1,'2018-05-22 17:24:10','2018-05-22 17:24:10'),(110,'Cancellations','setup/cancellations','#',1,'2018-05-22 17:24:26','2018-05-22 17:24:27'),(111,'Check-In Reports','reports/check-in-reports','#',1,'2021-01-09 11:03:11','2021-01-09 11:07:19');
/*!40000 ALTER TABLE `tb_sub_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subscription_admin`
--

DROP TABLE IF EXISTS `tb_subscription_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_subscription_admin` (
  `subscription_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subscription_id`,`user_id`),
  KEY `subscription_admin_user_id_foreign` (`user_id`),
  CONSTRAINT `subscription_admin_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `subscription_admin_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subscription_admin`
--

LOCK TABLES `tb_subscription_admin` WRITE;
/*!40000 ALTER TABLE `tb_subscription_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_subscription_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subscription_client`
--

DROP TABLE IF EXISTS `tb_subscription_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_subscription_client` (
  `subscription_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subscription_id`,`client_id`),
  KEY `subscription_client_client_id_foreign` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subscription_client`
--

LOCK TABLES `tb_subscription_client` WRITE;
/*!40000 ALTER TABLE `tb_subscription_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_subscription_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subscription_report_type`
--

DROP TABLE IF EXISTS `tb_subscription_report_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_subscription_report_type` (
  `subscription_id` int(10) unsigned NOT NULL,
  `report_type_id` int(10) unsigned NOT NULL,
  `report_format_id` int(10) unsigned NOT NULL,
  KEY `subscription_report_type_subscription_id_foreign` (`subscription_id`),
  KEY `subscription_report_type_report_type_id_foreign` (`report_type_id`),
  KEY `subscription_report_type_report_format_id_foreign` (`report_format_id`),
  CONSTRAINT `subscription_report_type_report_format_id_foreign` FOREIGN KEY (`report_format_id`) REFERENCES `tb_report_formats` (`id`),
  CONSTRAINT `subscription_report_type_report_type_id_foreign` FOREIGN KEY (`report_type_id`) REFERENCES `tb_report_types` (`id`),
  CONSTRAINT `subscription_report_type_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `tb_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subscription_report_type`
--

LOCK TABLES `tb_subscription_report_type` WRITE;
/*!40000 ALTER TABLE `tb_subscription_report_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_subscription_report_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subscription_user`
--

DROP TABLE IF EXISTS `tb_subscription_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_subscription_user` (
  `subscription_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subscription_id`,`user_id`),
  KEY `subscription_user_user_id_foreign` (`user_id`),
  CONSTRAINT `subscription_user_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `subscription_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subscription_user`
--

LOCK TABLES `tb_subscription_user` WRITE;
/*!40000 ALTER TABLE `tb_subscription_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_subscription_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subscriptions`
--

DROP TABLE IF EXISTS `tb_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `subscriptions_package_foreign` (`package`),
  KEY `subscriptions_user_foreign` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subscriptions`
--

LOCK TABLES `tb_subscriptions` WRITE;
/*!40000 ALTER TABLE `tb_subscriptions` DISABLE KEYS */;
INSERT INTO `tb_subscriptions` VALUES (1,1,2,'xx','xx','xx','xx','xx','xx','xx','xx','xx','xx','xx',1,'2017-03-26 12:03:48','2017-06-06 23:07:44'),(2,1,2,'xx','xx','xx','xx','xx','xx','xx','xx','xx','xx','xx',1,'2017-06-06 22:53:28','2017-08-10 13:52:30'),(3,1,2,'xx','xx','xx','xx','xx','xx','xx','xx','xx','xx','xx',2,'2017-08-10 13:54:05','2017-08-10 13:55:34');
/*!40000 ALTER TABLE `tb_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_suppliers`
--

DROP TABLE IF EXISTS `tb_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barangay` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactperson` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `businesstype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_suppliers`
--

LOCK TABLES `tb_suppliers` WRITE;
/*!40000 ALTER TABLE `tb_suppliers` DISABLE KEYS */;
INSERT INTO `tb_suppliers` VALUES (1,'Supplier 1','s1','99','Sta. Ana','Manila','','94584985','Uy','1','2017-05-25 12:57:32','2017-05-25 13:21:15'),(2,'New Supplier','test','','','','','','','1','2017-05-25 13:21:34','2017-05-25 13:21:34');
/*!40000 ALTER TABLE `tb_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_system_settings`
--

DROP TABLE IF EXISTS `tb_system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_system_settings` (
  `subscription` int(10) unsigned NOT NULL,
  `settings_field_id` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`subscription`,`settings_field_id`,`user`),
  KEY `system_settings_settings_field_id_foreign` (`settings_field_id`),
  KEY `system_settings_user_foreign` (`user`),
  CONSTRAINT `system_settings_settings_field_id_foreign` FOREIGN KEY (`settings_field_id`) REFERENCES `tb_settings_fields` (`id`),
  CONSTRAINT `system_settings_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `system_settings_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_system_settings`
--

LOCK TABLES `tb_system_settings` WRITE;
/*!40000 ALTER TABLE `tb_system_settings` DISABLE KEYS */;
INSERT INTO `tb_system_settings` VALUES (1,1,'iTech',2,'2017-06-07 12:36:40','2017-06-07 12:36:40'),(1,2,'T. Padilla St., Cebu City',2,'2017-06-07 12:36:40','2017-06-07 12:36:40'),(1,3,'0939483984',2,'2017-06-07 12:36:40','2017-06-07 12:36:40'),(1,4,'Hynesar A. Cudillo',2,'2017-06-07 12:36:40','2017-06-07 12:36:40'),(1,5,'Shirley Go',2,'2017-06-07 12:36:40','2017-06-07 12:36:40'),(1,6,'8',2,'2017-06-07 12:36:40','2017-06-07 12:36:40'),(1,7,'4',2,'2017-06-07 12:36:40','2017-06-07 12:36:40'),(1,8,'4',2,'2017-06-07 12:36:40','2017-06-07 12:36:40'),(1,9,'25',2,'2017-06-07 12:36:40','2017-06-07 12:36:40'),(2,1,'Bibo-Denki-Central-Office',2,'2017-06-07 12:36:18','2017-06-07 12:36:18'),(2,2,'T. Padilla St., Cebu City, Cebu 6000',2,'2017-06-07 12:36:18','2017-06-07 12:36:18'),(2,3,'094589458',2,'2017-06-07 12:36:18','2017-06-07 12:36:18'),(2,4,'Hynesar A. Cudillo',2,'2017-06-07 12:36:18','2017-06-07 12:36:18'),(2,5,'Shirley Go',2,'2017-06-07 12:36:18','2017-06-07 12:36:18'),(2,6,'8',2,'2017-06-07 12:36:18','2017-06-07 12:36:18'),(2,7,'4',2,'2017-06-07 12:36:18','2017-06-07 12:36:18'),(2,8,'4',2,'2017-06-07 12:36:18','2017-06-07 12:36:18'),(2,9,'25',2,'2017-06-07 12:36:18','2017-06-07 12:36:18');
/*!40000 ALTER TABLE `tb_system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_time_settings`
--

DROP TABLE IF EXISTS `tb_time_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_time_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `am_time_in` time NOT NULL,
  `am_time_out` time NOT NULL,
  `pm_time_in` time NOT NULL,
  `pm_time_out` time NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_time_settings`
--

LOCK TABLES `tb_time_settings` WRITE;
/*!40000 ALTER TABLE `tb_time_settings` DISABLE KEYS */;
INSERT INTO `tb_time_settings` VALUES (1,2,'First Shift','09:00:00','12:00:00','13:00:00','17:00:00',2,'2016-05-16 02:50:36','2016-05-16 02:50:36'),(2,2,'Second Shift','10:00:00','14:00:00','15:00:00','18:00:00',2,'2016-05-16 03:08:41','2016-05-16 03:08:41');
/*!40000 ALTER TABLE `tb_time_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_trainings`
--

DROP TABLE IF EXISTS `tb_trainings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_trainings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_trainings`
--

LOCK TABLES `tb_trainings` WRITE;
/*!40000 ALTER TABLE `tb_trainings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_trainings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaction_categories`
--

DROP TABLE IF EXISTS `tb_transaction_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaction_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `transaction_type` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_categories_subscription_foreign` (`subscription`),
  KEY `transaction_categories_transaction_type_foreign` (`transaction_type`),
  KEY `transaction_categories_user_foreign` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaction_categories`
--

LOCK TABLES `tb_transaction_categories` WRITE;
/*!40000 ALTER TABLE `tb_transaction_categories` DISABLE KEYS */;
INSERT INTO `tb_transaction_categories` VALUES (1,5,1,'Consulting Income',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(2,5,1,'Sales',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(3,5,1,'Uncategorized Income',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(4,5,2,'Accounting Fees',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(5,5,2,'Advertising & Promotion',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(6,5,2,'Bank Service Charges',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(7,5,2,'Computer - Hardware',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(8,5,2,'Computer - Hosting',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(9,5,2,'Computer - Internet',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(10,5,2,'Computer - Software',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(11,5,2,'Dues & Subscriptions',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(12,5,2,'Education & Training',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(13,5,2,'Insurance - General Liability',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(14,5,2,'Insurance - Vehicles',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(15,5,2,'Interest Expense',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(16,5,2,'Meals & Entertainment',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(17,5,2,'Office Supplies',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(18,5,2,'Payroll - Employee Benefits',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(19,5,2,'Payroll - Employer\'s Share of Benefits',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(20,5,2,'Payroll - Salaries & Wages',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(21,5,2,'Professional Fees',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(22,5,2,'Rent Expense',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(23,5,2,'Repairs & Maintenance',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(24,5,2,'Telephone - Landline',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(25,5,2,'Travel Expense',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(26,5,2,'Uncategorized Expense',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(27,5,2,'Utilities',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(28,5,2,'Vehicle - Fuel',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(29,5,2,'Vehicle - Repairs & Maintenance',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(30,5,8,'Owner Investment / Drawings',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(31,5,8,'Owner\'s Equity',1,'2017-02-01 00:58:07','2017-02-01 00:58:07');
/*!40000 ALTER TABLE `tb_transaction_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaction_details`
--

DROP TABLE IF EXISTS `tb_transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaction_details` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned zerofill NOT NULL,
  `glaccount` int(10) unsigned NOT NULL DEFAULT 0,
  `client` int(10) unsigned DEFAULT NULL,
  `seqno` smallint(10) DEFAULT NULL,
  `transactionrefno` int(10) unsigned DEFAULT NULL,
  `module` int(10) unsigned DEFAULT NULL,
  `transtype` int(10) unsigned DEFAULT NULL,
  `accountclass` int(10) unsigned DEFAULT NULL,
  `accounttype` int(10) unsigned DEFAULT NULL,
  `accountentry` int(10) unsigned DEFAULT NULL,
  `transamount` decimal(9,2) NOT NULL,
  `transamountdue` decimal(9,2) NOT NULL,
  `paymentform` int(1) unsigned DEFAULT NULL,
  `transactiontag` int(1) unsigned DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`,`glaccount`,`subscription`),
  KEY `transaction_details_subscription_foreign` (`subscription`),
  KEY `transaction_details_glaccount_foreign` (`glaccount`),
  KEY `transaction_details_paymentform_foreign` (`paymentform`),
  KEY `transaction_details_transactiontag_foreign` (`transactiontag`),
  KEY `transaction_details_module_foreign` (`module`),
  KEY `transaction_details_transtype_foreign` (`transtype`),
  CONSTRAINT `transaction_details_controlno_foreign` FOREIGN KEY (`controlno`) REFERENCES `tb_transaction_summary` (`controlno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_glaccount_foreign` FOREIGN KEY (`glaccount`) REFERENCES `tb_glaccounts` (`glaccount`) ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_module_foreign` FOREIGN KEY (`module`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `transaction_details_paymentform_foreign` FOREIGN KEY (`paymentform`) REFERENCES `tb_payment_forms` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_transactiontag_foreign` FOREIGN KEY (`transactiontag`) REFERENCES `tb_transaction_tags` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_transtype_foreign` FOREIGN KEY (`transtype`) REFERENCES `tb_transaction_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaction_details`
--

LOCK TABLES `tb_transaction_details` WRITE;
/*!40000 ALTER TABLE `tb_transaction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaction_summary`
--

DROP TABLE IF EXISTS `tb_transaction_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaction_summary` (
  `subscription` int(10) unsigned NOT NULL,
  `controlno` int(10) unsigned zerofill NOT NULL,
  `transactionrefno` int(10) unsigned DEFAULT NULL,
  `module` int(10) unsigned DEFAULT NULL,
  `transtype` int(10) unsigned DEFAULT NULL,
  `client` int(10) unsigned DEFAULT NULL,
  `docno` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batchno` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `posted_by` int(10) unsigned NOT NULL,
  `explanation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_at` date DEFAULT NULL,
  `posted_at` datetime DEFAULT NULL,
  `is_fo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`controlno`,`subscription`,`status`),
  KEY `transaction_summary_subscription_foreign` (`subscription`),
  KEY `transaction_summary_user_foreign` (`user`),
  KEY `transaction_summary_status_foreign` (`status`),
  KEY `transaction_summary_client_foreign` (`client`),
  KEY `transaction_summary_module_foreign` (`module`),
  KEY `transaction_summary_transtype_foreign` (`transtype`),
  CONSTRAINT `transaction_summary_client_foreign` FOREIGN KEY (`client`) REFERENCES `tb_clients` (`id`),
  CONSTRAINT `transaction_summary_module_foreign` FOREIGN KEY (`module`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `transaction_summary_status_foreign` FOREIGN KEY (`status`) REFERENCES `tb_transaction_tags` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `transaction_summary_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `transaction_summary_transtype_foreign` FOREIGN KEY (`transtype`) REFERENCES `tb_transaction_types` (`id`),
  CONSTRAINT `transaction_summary_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaction_summary`
--

LOCK TABLES `tb_transaction_summary` WRITE;
/*!40000 ALTER TABLE `tb_transaction_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaction_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaction_tags`
--

DROP TABLE IF EXISTS `tb_transaction_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaction_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortdesc` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaction_tags`
--

LOCK TABLES `tb_transaction_tags` WRITE;
/*!40000 ALTER TABLE `tb_transaction_tags` DISABLE KEYS */;
INSERT INTO `tb_transaction_tags` VALUES (1,'Setup','S','label label-warning'),(2,'Posted','P','label label-success'),(3,'Deleted','D','label label-danger'),(4,'Reversed','R','label label-danger'),(5,'Cancelled','C','label label-danger'),(6,'Approved','A','label label-success');
/*!40000 ALTER TABLE `tb_transaction_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaction_types`
--

DROP TABLE IF EXISTS `tb_transaction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaction_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_types_subscription_foreign` (`subscription`),
  KEY `transaction_types_user_foreign` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaction_types`
--

LOCK TABLES `tb_transaction_types` WRITE;
/*!40000 ALTER TABLE `tb_transaction_types` DISABLE KEYS */;
INSERT INTO `tb_transaction_types` VALUES (1,5,'Income','income','bg-success',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(2,5,'Expense','expense','bg-danger',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(3,5,'Invoice Payment','invoice-payment','bg-danger',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(4,5,'Bill Payment','bill-payment','bg-danger',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(5,5,'Transfer From','transfer-from','bg-warning',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(7,5,'Transfer To','transfer-to','bg-warning',1,'2017-02-01 00:58:07','2017-02-01 00:58:07'),(8,5,'Equity','equity','bg-success',1,'2017-02-01 00:58:07','2017-02-01 00:58:07');
/*!40000 ALTER TABLE `tb_transaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transactions`
--

DROP TABLE IF EXISTS `tb_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `transaction_at` date NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `transaction_category` int(10) unsigned NOT NULL,
  `gl_account` int(10) unsigned NOT NULL,
  `tag` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_subscription_foreign` (`subscription`),
  KEY `transactions_gl_account_foreign` (`gl_account`),
  KEY `transactions_tag_foreign` (`tag`),
  KEY `transactions_user_foreign` (`user`),
  KEY `transactions_transaction_category_foreign` (`transaction_category`),
  CONSTRAINT `transactions_gl_account_foreign` FOREIGN KEY (`gl_account`) REFERENCES `tb_glaccounts` (`glaccount`),
  CONSTRAINT `transactions_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `transactions_tag_foreign` FOREIGN KEY (`tag`) REFERENCES `tb_transaction_tags` (`id`),
  CONSTRAINT `transactions_transaction_category_foreign` FOREIGN KEY (`transaction_category`) REFERENCES `tb_glaccounts` (`glaccount`),
  CONSTRAINT `transactions_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transactions`
--

LOCK TABLES `tb_transactions` WRITE;
/*!40000 ALTER TABLE `tb_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_undertime_transactions`
--

DROP TABLE IF EXISTS `tb_undertime_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_undertime_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned NOT NULL,
  `employee` int(10) unsigned NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `supervisor` int(10) unsigned DEFAULT NULL,
  `supervisor_status` int(10) unsigned NOT NULL,
  `supervisor_approved_at` datetime NOT NULL,
  `manager` int(10) unsigned DEFAULT NULL,
  `manager_status` int(10) unsigned NOT NULL,
  `manager_approved_at` datetime NOT NULL,
  `user` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `undertime_transactions_employee_foreign` (`employee`),
  KEY `undertime_transactions_subscription_foreign` (`subscription`),
  KEY `manager_status` (`manager_status`),
  KEY `manager` (`manager`),
  KEY `supervisor_status` (`supervisor_status`),
  KEY `supervisor` (`supervisor`),
  KEY `undertime_transactions_user_foreign` (`user`),
  CONSTRAINT `undertime_transactions_employee_foreign` FOREIGN KEY (`employee`) REFERENCES `tb_employees` (`id`),
  CONSTRAINT `undertime_transactions_manager_foreign` FOREIGN KEY (`manager`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `undertime_transactions_manager_status_foreign` FOREIGN KEY (`manager_status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `undertime_transactions_subscription_foreign` FOREIGN KEY (`subscription`) REFERENCES `tb_subscriptions` (`id`),
  CONSTRAINT `undertime_transactions_supervisor_foreign` FOREIGN KEY (`supervisor`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `undertime_transactions_supervisor_status_foreign` FOREIGN KEY (`supervisor_status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `undertime_transactions_user_foreign` FOREIGN KEY (`user`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_undertime_transactions`
--

LOCK TABLES `tb_undertime_transactions` WRITE;
/*!40000 ALTER TABLE `tb_undertime_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_undertime_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_units`
--

DROP TABLE IF EXISTS `tb_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longdescription` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_units`
--

LOCK TABLES `tb_units` WRITE;
/*!40000 ALTER TABLE `tb_units` DISABLE KEYS */;
INSERT INTO `tb_units` VALUES (1,'bag','Bag'),(2,'bar','Bar'),(3,'bdl','Bundle'),(4,'bks','Books'),(5,'bkt','Bucket'),(6,'box','Box'),(7,'brl','Barrel'),(8,'btl','Bottle'),(9,'can','Can'),(10,'case','Case'),(11,'ccm','Cubic Centimeter'),(12,'cg','Centigrams'),(13,'chn','Chain'),(14,'crt','Crate'),(15,'ctn','Carton'),(16,'deck','Deck'),(17,'dose','Dose'),(18,'dozen','Dozen'),(19,'ft','Feet'),(20,'gal','Gallon'),(21,'gram','Gram'),(22,'jar','Jar'),(23,'kit','Kit'),(24,'klg','Kilogram Weight'),(25,'lbs','Pound'),(26,'liter','Liter Size'),(27,'m','Meter Lenght'),(28,'pad','Pad'),(29,'pair','Pair'),(30,'pallet','Pallet'),(31,'pc(s)','Pieces'),(32,'pkg','Package'),(33,'ream','Ream'),(34,'rnd','Round'),(35,'rol','Roll'),(36,'set','Set'),(37,'sm','Square Meter'),(38,'sqf','Square Foot'),(39,'terabytes','Terabytes'),(40,'ton','Ton'),(41,'unit','Unit'),(42,'vial','Vial'),(43,'yard','Yard');
/*!40000 ALTER TABLE `tb_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_ebay_accounts`
--

DROP TABLE IF EXISTS `tb_user_ebay_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_ebay_accounts` (
  `user_id` int(10) unsigned NOT NULL,
  `ebay_account_id` int(10) unsigned NOT NULL,
  KEY `user_ebay_accounts_user_id_foreign` (`user_id`),
  KEY `user_ebay_accounts_ebay_account_id_foreign` (`ebay_account_id`),
  CONSTRAINT `user_ebay_accounts_ebay_account_id_foreign` FOREIGN KEY (`ebay_account_id`) REFERENCES `tb_ebay_accounts` (`id`),
  CONSTRAINT `user_ebay_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_ebay_accounts`
--

LOCK TABLES `tb_user_ebay_accounts` WRITE;
/*!40000 ALTER TABLE `tb_user_ebay_accounts` DISABLE KEYS */;
INSERT INTO `tb_user_ebay_accounts` VALUES (4,14),(3,13),(3,14),(3,15),(2,13),(2,14),(2,15),(2,16);
/*!40000 ALTER TABLE `tb_user_ebay_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `department` int(10) unsigned DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accounttype` int(11) DEFAULT NULL,
  `glaccount` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user` int(10) unsigned DEFAULT NULL,
  `logged_in` smallint(6) NOT NULL,
  `remember_token` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `users_department_foreign` (`department`),
  CONSTRAINT `users_department_foreign` FOREIGN KEY (`department`) REFERENCES `tb_departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_users`
--

LOCK TABLES `tb_users` WRITE;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` VALUES (1,NULL,NULL,'superadmin','$2y$10$3E2OhYO9646K18zTthcJZ.zcdPIZ2mj6984t3G5PPGEka91f/4rZG','Super','Admin','no-image.gif',NULL,NULL,1,NULL,0,'Bcmbk85silp4h4tx9KbXf3Fm7NxerwIhwI8WrvELS3xgWksBhPYW7on7lPGB','2015-12-27 20:24:20','2017-09-14 14:09:48'),(2,1,NULL,'admin','$2y$10$CfWL.DYLcGhKgS4EgJp/muqRKBIiRco83LZB6l6nYr3v2FlMxJIAq','Admin','Admin','avatar2.png',NULL,NULL,1,2,0,'n4jhpni7u0vg4baZcmHOceFRYwmblClsTvskjpE8StYywVH37Pt7jMvBiR19','2017-03-26 12:35:32','2018-03-23 15:01:44'),(3,1,NULL,'china','$2y$10$/8DRJYRhiFWCo0UJ.Ykv0eGDUdnZ2pImo0HntHJpNTwZQgkswT7DG','China','Manufacturer','avatar2.png',NULL,NULL,1,2,0,'AuFqjn7kslndadVVVfk56CqvdoAyk0BOUHkzLfaOtrVf2MG5IcQdAEkaCJ0g','2017-04-26 20:25:01','2018-03-31 16:30:45'),(4,1,NULL,'crm','$2y$10$99AU3TQHF4HFOItRRRjY6.BIKpllOYml1vJfOMLlPwSSHkFdmSdry','Customer','Relations','avatar2.png',NULL,NULL,1,2,0,'wBuXSupzT4q6TNE5vWtKC2ngISqgd3PPZ5KxPinhlJqrZqdPXpeZj3vbILcU','2017-05-11 13:08:47','2018-03-31 16:31:02'),(5,NULL,NULL,'bcti.tagbi','$2y$10$NztM45hqXF0DYbCWvrhWD..cQ5JorNAu0mPXBYIru7Z0qaIFObtii','BCTI','Tagbilaran','avatar3.png',NULL,NULL,1,2,0,'1j6X5pqK63GBW1rvFdibFMyNlRkkXWC4lCrE3yIp1DBR6qOFysqCdJ3VIlN0','2021-06-30 10:04:02','2021-06-30 10:04:02'),(7,NULL,NULL,'bcti-tagbi','$2y$10$OzpB6TPb19Cr31GdCT/IruRDzrSB2AhW3pxMV61inQtDZrvIYSZVi','BOHOL INN','Tagbilaran Branch','avatar5.png',NULL,NULL,1,2,0,NULL,'2021-06-30 10:10:40','2021-06-30 10:10:40');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_week_days`
--

DROP TABLE IF EXISTS `tb_week_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_week_days` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_week_days`
--

LOCK TABLES `tb_week_days` WRITE;
/*!40000 ALTER TABLE `tb_week_days` DISABLE KEYS */;
INSERT INTO `tb_week_days` VALUES (1,'Monday'),(2,'Tuesday'),(3,'Wednesday'),(4,'Thursday'),(5,'Friday'),(6,'Saturday'),(7,'Sunday');
/*!40000 ALTER TABLE `tb_week_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_witholding_tax`
--

DROP TABLE IF EXISTS `tb_witholding_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_witholding_tax` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription` int(10) unsigned DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exemption` decimal(9,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `witholding_tax_subscription_foreign` (`subscription`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_witholding_tax`
--

LOCK TABLES `tb_witholding_tax` WRITE;
/*!40000 ALTER TABLE `tb_witholding_tax` DISABLE KEYS */;
INSERT INTO `tb_witholding_tax` VALUES (1,1,'(SM) Z','Employees without dependent children',0.00,'2015-02-14 13:00:44','2015-02-14 13:00:44'),(2,1,'(SM) S / ME','Single / Married Employee w/o dependent',50000.00,'2015-02-14 13:07:45','2015-02-14 13:07:45'),(3,1,'(SM) ME1 / S1','Married Employee / Single Employee with 1 dependent',75000.00,'2015-02-14 13:13:51','2015-02-14 13:13:51'),(4,1,'(SM) ME2 / S2','Married Employee / Single Employee with 2 dependents',100000.00,'2015-02-14 13:16:48','2015-02-14 13:16:48'),(5,1,'(SM) ME3 / S3','Married Employee / Single Employee with 3 dependents',125000.00,'2015-02-14 13:19:48','2015-02-14 13:19:48'),(6,1,'(SM) ME4 / S4','Married Employee / Single Employee with 4 dependents',150000.00,'2015-02-14 13:21:44','2015-02-14 13:21:44'),(7,1,'(MO) Z','Employees without dependent children',0.00,'2015-02-14 13:28:34','2015-02-14 13:28:34'),(8,1,'(MO) S / ME','Single / Married Employee w/o dependent',50000.00,'2015-02-14 13:30:57','2015-02-14 13:30:57'),(9,1,'(MO) ME1 / S1','Married Employee / Single Employee with 1 dependent',75000.00,'2015-02-14 13:33:16','2015-02-14 13:33:16'),(10,1,'(MO) ME2 / S2','Married Employee / Single Employee with 2 dependents',100000.00,'2015-02-14 13:33:58','2015-02-14 13:33:58'),(11,1,'(MO) ME3 / S3','Married Employee / Single Employee with 3 dependents',125000.00,'2015-02-14 13:41:55','2015-02-14 13:41:55'),(12,1,'(MO) ME4 / S4','Married Employee / Single Employee with 4 dependents',150000.00,'2015-02-14 13:44:16','2015-02-14 13:44:16');
/*!40000 ALTER TABLE `tb_witholding_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_witholding_tax_details`
--

DROP TABLE IF EXISTS `tb_witholding_tax_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_witholding_tax_details` (
  `id` int(10) unsigned NOT NULL,
  `witholdingtax` int(11) NOT NULL,
  `payfrequency` int(11) NOT NULL,
  `grossincome` decimal(9,2) NOT NULL,
  `fixedtax` decimal(9,2) NOT NULL,
  `excess` decimal(9,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_witholding_tax_details`
--

LOCK TABLES `tb_witholding_tax_details` WRITE;
/*!40000 ALTER TABLE `tb_witholding_tax_details` DISABLE KEYS */;
INSERT INTO `tb_witholding_tax_details` VALUES (1,1,14,0.00,0.00,0.05,'2015-02-14 13:00:44','2015-02-14 13:00:44'),(2,1,14,417.00,20.83,0.10,'2015-02-14 13:00:44','2015-02-14 13:00:44'),(3,1,14,1250.00,104.17,0.15,'2015-02-14 13:00:44','2015-02-14 13:00:44'),(4,1,14,2917.00,354.17,0.20,'2015-02-14 13:00:44','2015-02-14 13:00:44'),(5,1,14,5833.00,937.50,0.25,'2015-02-14 13:00:44','2015-02-14 13:00:44'),(6,1,14,10417.00,2083.33,0.30,'2015-02-14 13:00:44','2015-02-14 13:00:44'),(7,1,14,20833.00,5208.33,0.32,'2015-02-14 13:00:44','2015-02-14 13:00:44'),(8,2,14,2083.00,0.00,0.05,'2015-02-14 13:07:45','2015-02-14 13:07:45'),(9,2,14,2500.00,20.83,0.10,'2015-02-14 13:07:45','2015-02-14 13:07:45'),(10,2,14,3333.00,104.17,0.15,'2015-02-14 13:07:45','2015-02-14 13:07:45'),(11,2,14,5000.00,354.17,0.20,'2015-02-14 13:07:45','2015-02-14 13:07:45'),(12,2,14,7917.00,937.50,0.25,'2015-02-14 13:07:45','2015-02-14 13:07:45'),(13,2,14,12500.00,2083.33,0.30,'2015-02-14 13:07:45','2015-02-14 13:07:45'),(14,2,14,22917.00,5208.33,0.32,'2015-02-14 13:07:45','2015-02-14 13:07:45'),(15,3,14,3125.00,0.00,0.05,'2015-02-14 13:13:51','2015-02-14 13:13:51'),(16,3,14,3542.00,20.83,0.10,'2015-02-14 13:13:51','2015-02-14 13:13:51'),(17,3,14,4375.00,104.17,0.15,'2015-02-14 13:13:51','2015-02-14 13:13:51'),(18,3,14,6042.00,354.17,0.20,'2015-02-14 13:13:51','2015-02-14 13:13:51'),(19,3,14,8958.00,937.50,0.25,'2015-02-14 13:13:51','2015-02-14 13:13:51'),(20,3,14,13542.00,2083.33,0.30,'2015-02-14 13:13:51','2015-02-14 13:13:51'),(21,3,14,23958.00,5208.33,0.32,'2015-02-14 13:13:51','2015-02-14 13:13:51'),(22,4,14,4167.00,0.00,0.05,'2015-02-14 13:16:48','2015-02-14 13:16:48'),(23,4,14,4583.00,20.83,0.10,'2015-02-14 13:16:48','2015-02-14 13:16:48'),(24,4,14,5417.00,104.17,0.15,'2015-02-14 13:16:48','2015-02-14 13:16:48'),(25,4,14,7083.00,354.17,0.20,'2015-02-14 13:16:48','2015-02-14 13:16:48'),(26,4,14,10000.00,937.50,0.25,'2015-02-14 13:16:48','2015-02-14 13:16:48'),(27,4,14,14583.00,2083.33,0.30,'2015-02-14 13:16:48','2015-02-14 13:16:48'),(28,4,14,25000.00,5208.33,0.32,'2015-02-14 13:16:48','2015-02-14 13:16:48'),(29,5,14,5208.00,0.00,0.05,'2015-02-14 13:19:48','2015-02-14 13:19:48'),(30,5,14,5625.00,20.83,0.10,'2015-02-14 13:19:48','2015-02-14 13:19:48'),(31,5,14,6458.00,104.17,0.15,'2015-02-14 13:19:48','2015-02-14 13:19:48'),(32,5,14,8125.00,354.17,0.20,'2015-02-14 13:19:48','2015-02-14 13:19:48'),(33,5,14,11042.00,937.50,0.25,'2015-02-14 13:19:48','2015-02-14 13:19:48'),(34,5,14,15625.00,2083.33,0.30,'2015-02-14 13:19:48','2015-02-14 13:19:48'),(35,5,14,26042.00,5208.33,0.32,'2015-02-14 13:19:48','2015-02-14 13:19:48'),(36,6,14,6250.00,0.00,0.05,'2015-02-14 13:21:44','2015-02-14 13:21:44'),(37,6,14,6667.00,20.83,0.10,'2015-02-14 13:21:44','2015-02-14 13:21:44'),(38,6,14,7500.00,104.17,0.15,'2015-02-14 13:21:44','2015-02-14 13:21:44'),(39,6,14,9167.00,354.17,0.20,'2015-02-14 13:21:44','2015-02-14 13:21:44'),(40,6,14,12083.00,937.50,0.25,'2015-02-14 13:21:44','2015-02-14 13:21:44'),(41,6,14,16667.00,2083.33,0.30,'2015-02-14 13:21:44','2015-02-14 13:21:44'),(42,6,14,27083.00,5208.33,0.32,'2015-02-14 13:21:44','2015-02-14 13:21:44'),(43,7,15,0.00,0.00,0.05,'2015-02-14 13:28:34','2015-02-14 13:28:34'),(44,7,15,833.00,41.67,0.10,'2015-02-14 13:28:34','2015-02-14 13:28:34'),(45,7,15,2500.00,208.33,0.15,'2015-02-14 13:28:34','2015-02-14 13:28:34'),(46,7,15,5833.00,708.33,0.20,'2015-02-14 13:28:34','2015-02-14 13:28:34'),(47,7,15,11667.00,1875.00,0.25,'2015-02-14 13:28:34','2015-02-14 13:28:34'),(48,7,15,20833.00,4166.67,0.30,'2015-02-14 13:28:34','2015-02-14 13:28:34'),(49,7,15,41667.00,10416.67,0.32,'2015-02-14 13:28:34','2015-02-14 13:28:34'),(50,8,15,4167.00,0.00,0.05,'2015-02-14 13:30:57','2015-02-14 13:30:57'),(51,8,15,5000.00,41.67,0.10,'2015-02-14 13:30:57','2015-02-14 13:30:57'),(52,8,15,6667.00,208.33,0.15,'2015-02-14 13:30:57','2015-02-14 13:30:57'),(53,8,15,10000.00,708.33,0.20,'2015-02-14 13:30:57','2015-02-14 13:30:57'),(54,8,15,15833.00,1875.00,0.25,'2015-02-14 13:30:57','2015-02-14 13:30:57'),(55,8,15,25000.00,4166.67,0.30,'2015-02-14 13:30:57','2015-02-14 13:30:57'),(56,8,15,45833.00,10416.67,0.32,'2015-02-14 13:30:57','2015-02-14 13:30:57'),(57,9,15,6250.00,0.00,0.05,'2015-02-14 13:33:16','2015-02-14 13:33:16'),(58,9,15,7083.00,41.67,0.10,'2015-02-14 13:33:16','2015-02-14 13:33:16'),(59,9,15,8750.00,208.33,0.15,'2015-02-14 13:33:16','2015-02-14 13:33:16'),(60,9,15,12083.00,708.33,0.20,'2015-02-14 13:33:16','2015-02-14 13:33:16'),(61,9,15,17917.00,1875.00,0.25,'2015-02-14 13:33:16','2015-02-14 13:33:16'),(62,9,15,27083.00,4166.67,0.30,'2015-02-14 13:33:16','2015-02-14 13:33:16'),(63,9,15,47917.00,10416.67,0.32,'2015-02-14 13:33:16','2015-02-14 13:33:16'),(64,10,15,8333.00,0.00,0.05,'2015-02-14 13:33:58','2015-02-14 13:33:58'),(65,10,15,9167.00,41.67,0.10,'2015-02-14 13:33:58','2015-02-14 13:33:58'),(66,10,15,10833.00,208.33,0.15,'2015-02-14 13:00:00','2015-02-14 13:00:00'),(67,10,15,14167.00,708.33,0.20,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(68,10,15,20000.00,1875.00,0.25,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,10,15,29167.00,4166.67,0.30,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(70,10,15,50000.00,10416.67,0.32,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,11,15,10417.00,0.00,0.05,'2015-02-14 13:41:55','2015-02-14 13:41:55'),(72,11,15,11250.00,41.67,0.10,'2015-02-14 13:41:55','2015-02-14 13:41:55'),(73,11,15,12917.00,208.33,0.15,'2015-02-14 13:41:55','2015-02-14 13:41:55'),(74,11,15,16250.00,708.33,0.20,'2015-02-14 13:41:55','2015-02-14 13:41:55'),(75,11,15,22083.00,1875.00,0.25,'2015-02-14 13:41:55','2015-02-14 13:41:55'),(76,11,15,31250.00,4166.67,0.30,'2015-02-14 13:41:55','2015-02-14 13:41:55'),(77,11,15,52083.00,10416.67,0.32,'2015-02-14 13:41:55','2015-02-14 13:41:55'),(78,12,15,12500.00,0.00,0.05,'2015-02-14 13:44:16','2015-02-14 13:44:16'),(79,12,15,13333.00,41.67,0.10,'2015-02-14 13:44:16','2015-02-14 13:44:16'),(80,12,15,15000.00,208.33,0.15,'2015-02-14 13:44:16','2015-02-14 13:44:16'),(81,12,15,18333.00,708.33,0.20,'2015-02-14 13:44:16','2015-02-14 13:44:16'),(82,12,15,24167.00,1875.00,0.25,'2015-02-14 13:44:16','2015-02-14 13:44:16'),(83,12,15,33333.00,4166.67,0.30,'2015-02-14 13:44:16','2015-02-14 13:44:16'),(84,12,15,54167.00,10416.67,0.32,'2015-02-14 13:44:16','2015-02-14 13:44:16'),(85,1,14,1.00,0.00,0.00,'2015-02-20 22:23:27','2015-02-20 18:15:16'),(86,2,14,1.00,0.00,0.00,'2015-02-21 11:35:28','2015-02-21 11:35:28'),(87,3,14,1.00,0.00,0.00,'2015-02-21 11:35:28','2015-02-21 11:35:28'),(88,4,14,1.00,0.00,0.00,'2015-02-21 11:35:28','2015-02-21 11:35:28'),(89,5,14,1.00,0.00,0.00,'2015-02-21 11:35:28','2015-02-21 11:35:28'),(90,6,14,1.00,0.00,0.00,'2015-02-21 11:35:28','2015-02-21 11:35:28'),(91,7,15,1.00,0.00,0.00,'2015-02-21 11:35:28','2015-02-21 11:35:28'),(92,8,15,1.00,0.00,0.00,'2015-02-21 11:35:28','2015-02-21 11:35:28'),(93,9,15,1.00,0.00,0.00,'2015-02-21 11:35:28','2015-02-21 11:35:28'),(94,10,15,1.00,0.00,0.00,'2015-02-21 11:35:28','2015-02-21 11:35:28'),(95,11,15,1.00,0.00,0.00,'2015-02-21 11:35:28','2015-02-21 11:35:28'),(96,12,15,1.00,0.00,0.00,'2015-02-21 11:35:29','2015-02-21 11:35:29');
/*!40000 ALTER TABLE `tb_witholding_tax_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-14  2:32:01
