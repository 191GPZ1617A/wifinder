-- MySQL dump 10.16  Distrib 10.1.16-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: wifinder192
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add question',7,'add_question'),(20,'Can change question',7,'change_question'),(21,'Can delete question',7,'delete_question'),(22,'Can add choice',8,'add_choice'),(23,'Can change choice',8,'change_choice'),(24,'Can delete choice',8,'delete_choice');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$XQU3RPvOw2X5$PrWQISehxppcxhPFuDdNiLv/wCtDfM8JRmVKjmUWTQs=','2016-11-28 03:30:54.149000',1,'clientadmin','','','zakjimenez@outlook.com',1,1,'2016-11-28 03:30:09.616000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `days` (
  `dayid` int(11) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `days`
--

LOCK TABLES `days` WRITE;
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
INSERT INTO `days` VALUES (1,'M'),(2,'TTH'),(3,'WF');
/*!40000 ALTER TABLE `days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(8,'kiyeme','choice'),(7,'kiyeme','question'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-11-28 03:07:55.254000'),(2,'auth','0001_initial','2016-11-28 03:07:56.346000'),(3,'admin','0001_initial','2016-11-28 03:07:56.616000'),(4,'admin','0002_logentry_remove_auto_add','2016-11-28 03:07:56.630000'),(5,'contenttypes','0002_remove_content_type_name','2016-11-28 03:07:56.771000'),(6,'auth','0002_alter_permission_name_max_length','2016-11-28 03:07:56.855000'),(7,'auth','0003_alter_user_email_max_length','2016-11-28 03:07:56.929000'),(8,'auth','0004_alter_user_username_opts','2016-11-28 03:07:56.945000'),(9,'auth','0005_alter_user_last_login_null','2016-11-28 03:07:57.112000'),(10,'auth','0006_require_contenttypes_0002','2016-11-28 03:07:57.133000'),(11,'auth','0007_alter_validators_add_error_messages','2016-11-28 03:07:57.141000'),(12,'auth','0008_alter_user_username_max_length','2016-11-28 03:07:57.588000'),(13,'sessions','0001_initial','2016-11-28 03:07:57.651000'),(14,'kiyeme','0001_initial','2016-11-28 03:18:00.712000');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('e9ypn1jmzcmqtpqcwg3gz883s1efs99v','MTliNmI2YTBhNDJiMmM2NzFjNmNiZGI2YTFmZWYwZWMzMzZiZGFlNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjczNDAxNjgzY2EyNTQ0NWNiZDQyNmI1MTNmMTgzMmI4NGM5ZjU2NmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-12-12 03:30:54.152000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fromfile`
--

DROP TABLE IF EXISTS `fromfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fromfile` (
  `name` varchar(20) DEFAULT NULL,
  `days` varchar(10) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `proxy` char(1) DEFAULT NULL,
  `capability` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fromfile`
--

LOCK TABLES `fromfile` WRITE;
/*!40000 ALTER TABLE `fromfile` DISABLE KEYS */;
INSERT INTO `fromfile` VALUES ('AS-DilnetWifi','M','1:00-2:30','N',1,2),('AS-DilnetWifi','M','10:00-11:30','N',3,4),('AS-DilnetWifi','M','11:30-1:00','N',2,3),('AS-DilnetWifi','M','2:30-4:00','N',1,2),('AS-DilnetWifi','M','4:00-5:30','N',2,3),('AS-DilnetWifi','M','7:00-8:30','N',4,5),('AS-DilnetWifi','M','8:30-10:00','N',4,5),('AS-DilnetWifi','TTH','1:00-2:30','N',2,2),('AS-DilnetWifi','TTH','10:00-11:30','N',3,4),('AS-DilnetWifi','TTH','11:30-1:00','N',2,3),('AS-DilnetWifi','TTH','2:30-4:00','N',2,2),('AS-DilnetWifi','TTH','4:00-5:30','N',2,3),('AS-DilnetWifi','TTH','7:00-8:30','N',4,5),('AS-DilnetWifi','TTH','8:30-10:00','N',4,5),('AS-DilnetWifi','WF','1:00-2:30','N',1,2),('AS-DilnetWifi','WF','10:00-11:30','N',3,4),('AS-DilnetWifi','WF','11:30-1:00','N',2,3),('AS-DilnetWifi','WF','2:30-4:00','N',1,2),('AS-DilnetWifi','WF','4:00-5:30','N',2,3),('AS-DilnetWifi','WF','7:00-8:30','N',4,5),('AS-DilnetWifi','WF','8:30-10:00','N',3,5),('CMC-Dilnet','M','1:00-2:30','Y',2,2),('CMC-Dilnet','M','10:00-11:30','Y',3,4),('CMC-Dilnet','M','11:30-1:00','Y',2,3),('CMC-Dilnet','M','2:30-4:00','Y',2,2),('CMC-Dilnet','M','4:00-5:30','Y',2,3),('CMC-Dilnet','M','7:00-8:30','Y',3,5),('CMC-Dilnet','M','8:30-10:00','Y',3,5),('CMC-Dilnet','TTH','1:00-2:30','Y',3,2),('CMC-Dilnet','TTH','10:00-11:30','Y',4,4),('CMC-Dilnet','TTH','11:30-1:00','Y',3,3),('CMC-Dilnet','TTH','2:30-4:00','Y',3,2),('CMC-Dilnet','TTH','4:00-5:30','Y',3,3),('CMC-Dilnet','TTH','7:00-8:30','Y',4,5),('CMC-Dilnet','TTH','8:30-10:00','Y',4,5),('CMC-Dilnet','WF','1:00-2:30','Y',2,2),('CMC-Dilnet','WF','10:00-11:30','Y',3,4),('CMC-Dilnet','WF','11:30-1:00','Y',2,3),('CMC-Dilnet','WF','2:30-4:00','Y',2,2),('CMC-Dilnet','WF','4:00-5:30','Y',2,3),('CMC-Dilnet','WF','7:00-8:30','Y',3,5),('CMC-Dilnet','WF','8:30-10:00','Y',4,5),('DCS-Dilnet','M','1:00-2:30','Y',2,2),('DCS-Dilnet','M','10:00-11:30','Y',3,3),('DCS-Dilnet','M','11:30-1:00','Y',2,3),('DCS-Dilnet','M','2:30-4:00','Y',2,2),('DCS-Dilnet','M','4:00-5:30','Y',2,3),('DCS-Dilnet','M','7:00-8:30','Y',4,5),('DCS-Dilnet','M','8:30-10:00','Y',4,5),('DCS-Dilnet','TTH','1:00-2:30','Y',1,1),('DCS-Dilnet','TTH','10:00-11:30','Y',3,3),('DCS-Dilnet','TTH','11:30-1:00','Y',2,2),('DCS-Dilnet','TTH','2:30-4:00','Y',1,1),('DCS-Dilnet','TTH','4:00-5:30','Y',2,2),('DCS-Dilnet','TTH','7:00-8:30','Y',4,4),('DCS-Dilnet','TTH','8:30-10:00','Y',4,4),('DCS-Dilnet','WF','1:00-2:30','Y',1,2),('DCS-Dilnet','WF','10:00-11:30','Y',3,3),('DCS-Dilnet','WF','11:30-1:00','Y',2,2),('DCS-Dilnet','WF','2:30-4:00','Y',1,2),('DCS-Dilnet','WF','4:00-5:30','Y',2,3),('DCS-Dilnet','WF','7:00-8:30','Y',4,5),('DCS-Dilnet','WF','8:30-10:00','Y',4,4),('DCS-Enggnet','M','1:00-2:30','N',2,2),('DCS-Enggnet','M','10:00-11:30','N',3,2),('DCS-Enggnet','M','11:30-1:00','N',2,2),('DCS-Enggnet','M','2:30-4:00','N',2,1),('DCS-Enggnet','M','4:00-5:30','N',2,2),('DCS-Enggnet','M','7:00-8:30','N',4,4),('DCS-Enggnet','M','8:30-10:00','N',4,4),('DCS-Enggnet','TTH','1:00-2:30','N',1,1),('DCS-Enggnet','TTH','10:00-11:30','N',3,2),('DCS-Enggnet','TTH','11:30-1:00','N',2,2),('DCS-Enggnet','TTH','2:30-4:00','N',1,1),('DCS-Enggnet','TTH','4:00-5:30','N',2,2),('DCS-Enggnet','TTH','7:00-8:30','N',4,3),('DCS-Enggnet','TTH','8:30-10:00','N',4,3),('DCS-Enggnet','WF','1:00-2:30','N',1,1),('DCS-Enggnet','WF','10:00-11:30','N',3,2),('DCS-Enggnet','WF','11:30-1:00','N',2,2),('DCS-Enggnet','WF','2:30-4:00','N',1,2),('DCS-Enggnet','WF','4:00-5:30','N',2,3),('DCS-Enggnet','WF','7:00-8:30','N',4,4),('DCS-Enggnet','WF','8:30-10:00','N',4,3),('Engg-Dilnet','M','1:00-2:30','Y',1,1),('Engg-Dilnet','M','10:00-11:30','Y',2,3),('Engg-Dilnet','M','11:30-1:00','Y',1,2),('Engg-Dilnet','M','2:30-4:00','Y',1,2),('Engg-Dilnet','M','4:00-5:30','Y',1,1),('Engg-Dilnet','M','7:00-8:30','Y',2,1),('Engg-Dilnet','M','8:30-10:00','Y',2,1),('Engg-Dilnet','TTH','1:00-2:30','Y',1,1),('Engg-Dilnet','TTH','10:00-11:30','Y',2,3),('Engg-Dilnet','TTH','11:30-1:00','Y',1,2),('Engg-Dilnet','TTH','2:30-4:00','Y',1,2),('Engg-Dilnet','TTH','4:00-5:30','Y',1,1),('Engg-Dilnet','TTH','7:00-8:30','Y',2,1),('Engg-Dilnet','TTH','8:30-10:00','Y',2,2),('Engg-Dilnet','WF','1:00-2:30','Y',1,2),('Engg-Dilnet','WF','10:00-11:30','Y',2,3),('Engg-Dilnet','WF','11:30-1:00','Y',1,2),('Engg-Dilnet','WF','2:30-4:00','Y',1,2),('Engg-Dilnet','WF','4:00-5:30','Y',1,1),('Engg-Dilnet','WF','7:00-8:30','Y',2,2),('Engg-Dilnet','WF','8:30-10:00','Y',2,2),('Engg-Enggnet','M','1:00-2:30','N',2,2),('Engg-Enggnet','M','10:00-11:30','N',3,2),('Engg-Enggnet','M','11:30-1:00','N',2,2),('Engg-Enggnet','M','2:30-4:00','N',2,1),('Engg-Enggnet','M','4:00-5:30','N',2,2),('Engg-Enggnet','M','7:00-8:30','N',4,3),('Engg-Enggnet','M','8:30-10:00','N',4,4),('Engg-Enggnet','TTH','1:00-2:30','N',1,1),('Engg-Enggnet','TTH','10:00-11:30','N',3,2),('Engg-Enggnet','TTH','11:30-1:00','N',2,2),('Engg-Enggnet','TTH','2:30-4:00','N',1,1),('Engg-Enggnet','TTH','4:00-5:30','N',2,1),('Engg-Enggnet','TTH','7:00-8:30','N',4,2),('Engg-Enggnet','TTH','8:30-10:00','N',4,3),('Engg-Enggnet','WF','1:00-2:30','N',1,1),('Engg-Enggnet','WF','10:00-11:30','N',3,2),('Engg-Enggnet','WF','11:30-1:00','N',2,2),('Engg-Enggnet','WF','2:30-4:00','N',1,2),('Engg-Enggnet','WF','4:00-5:30','N',2,2),('Engg-Enggnet','WF','7:00-8:30','N',4,4),('Engg-Enggnet','WF','8:30-10:00','N',4,3),('Ilang-Dilnet','M','1:00-2:30','Y',4,5),('Ilang-Dilnet','M','10:00-11:30','Y',4,5),('Ilang-Dilnet','M','11:30-1:00','Y',3,5),('Ilang-Dilnet','M','2:30-4:00','Y',3,4),('Ilang-Dilnet','M','4:00-5:30','Y',3,3),('Ilang-Dilnet','M','7:00-8:30','Y',3,3),('Ilang-Dilnet','M','8:30-10:00','Y',4,3),('Ilang-Dilnet','TTH','1:00-2:30','Y',4,4),('Ilang-Dilnet','TTH','10:00-11:30','Y',3,3),('Ilang-Dilnet','TTH','11:30-1:00','Y',4,4),('Ilang-Dilnet','TTH','2:30-4:00','Y',3,3),('Ilang-Dilnet','TTH','4:00-5:30','Y',2,2),('Ilang-Dilnet','TTH','7:00-8:30','Y',2,3),('Ilang-Dilnet','TTH','8:30-10:00','Y',3,4),('Ilang-Dilnet','WF','1:00-2:30','Y',4,4),('Ilang-Dilnet','WF','10:00-11:30','Y',3,3),('Ilang-Dilnet','WF','11:30-1:00','Y',4,4),('Ilang-Dilnet','WF','2:30-4:00','Y',3,3),('Ilang-Dilnet','WF','4:00-5:30','Y',2,2),('Ilang-Dilnet','WF','7:00-8:30','Y',2,3),('Ilang-Dilnet','WF','8:30-10:00','Y',3,4),('Molave-Dilnet','M','1:00-2:30','Y',4,5),('Molave-Dilnet','M','10:00-11:30','Y',4,5),('Molave-Dilnet','M','11:30-1:00','Y',3,5),('Molave-Dilnet','M','2:30-4:00','Y',3,4),('Molave-Dilnet','M','4:00-5:30','Y',3,3),('Molave-Dilnet','M','7:00-8:30','Y',3,3),('Molave-Dilnet','M','8:30-10:00','Y',4,3),('Molave-Dilnet','TTH','1:00-2:30','Y',4,4),('Molave-Dilnet','TTH','10:00-11:30','Y',3,3),('Molave-Dilnet','TTH','11:30-1:00','Y',4,4),('Molave-Dilnet','TTH','2:30-4:00','Y',3,3),('Molave-Dilnet','TTH','4:00-5:30','Y',2,2),('Molave-Dilnet','TTH','7:00-8:30','Y',2,3),('Molave-Dilnet','TTH','8:30-10:00','Y',3,4),('Molave-Dilnet','WF','1:00-2:30','Y',4,4),('Molave-Dilnet','WF','10:00-11:30','Y',3,3),('Molave-Dilnet','WF','11:30-1:00','Y',4,4),('Molave-Dilnet','WF','2:30-4:00','Y',3,3),('Molave-Dilnet','WF','4:00-5:30','Y',2,2),('Molave-Dilnet','WF','7:00-8:30','Y',2,3),('Molave-Dilnet','WF','8:30-10:00','Y',3,4),('Vinzons-Dilnet','M','1:00-2:30','Y',4,5),('Vinzons-Dilnet','M','10:00-11:30','Y',4,5),('Vinzons-Dilnet','M','11:30-1:00','Y',3,5),('Vinzons-Dilnet','M','2:30-4:00','Y',3,4),('Vinzons-Dilnet','M','4:00-5:30','Y',3,3),('Vinzons-Dilnet','M','7:00-8:30','Y',3,3),('Vinzons-Dilnet','M','8:30-10:00','Y',4,3),('Vinzons-Dilnet','TTH','1:00-2:30','Y',4,4),('Vinzons-Dilnet','TTH','10:00-11:30','Y',3,3),('Vinzons-Dilnet','TTH','11:30-1:00','Y',4,4),('Vinzons-Dilnet','TTH','2:30-4:00','Y',3,3),('Vinzons-Dilnet','TTH','4:00-5:30','Y',2,2),('Vinzons-Dilnet','TTH','7:00-8:30','Y',2,3),('Vinzons-Dilnet','TTH','8:30-10:00','Y',3,4),('Vinzons-Dilnet','WF','1:00-2:30','Y',4,4),('Vinzons-Dilnet','WF','10:00-11:30','Y',3,3),('Vinzons-Dilnet','WF','11:30-1:00','Y',4,4),('Vinzons-Dilnet','WF','2:30-4:00','Y',3,3),('Vinzons-Dilnet','WF','4:00-5:30','Y',2,2),('Vinzons-Dilnet','WF','7:00-8:30','Y',2,3),('Vinzons-Dilnet','WF','8:30-10:00','Y',3,4),('Yakal-Dilnet','M','1:00-2:30','Y',4,5),('Yakal-Dilnet','M','10:00-11:30','Y',4,5),('Yakal-Dilnet','M','11:30-1:00','Y',3,5),('Yakal-Dilnet','M','2:30-4:00','Y',3,4),('Yakal-Dilnet','M','4:00-5:30','Y',3,3),('Yakal-Dilnet','M','7:00-8:30','Y',3,3),('Yakal-Dilnet','M','8:30-10:00','Y',4,3),('Yakal-Dilnet','TTH','1:00-2:30','Y',3,3),('Yakal-Dilnet','TTH','10:00-11:30','Y',3,3),('Yakal-Dilnet','TTH','11:30-1:00','Y',3,3),('Yakal-Dilnet','TTH','2:30-4:00','Y',3,3),('Yakal-Dilnet','TTH','4:00-5:30','Y',2,2),('Yakal-Dilnet','TTH','7:00-8:30','Y',4,3),('Yakal-Dilnet','TTH','8:30-10:00','Y',4,4),('Yakal-Dilnet','WF','1:00-2:30','Y',3,3),('Yakal-Dilnet','WF','10:00-11:30','Y',3,3),('Yakal-Dilnet','WF','11:30-1:00','Y',3,3),('Yakal-Dilnet','WF','2:30-4:00','Y',3,3),('Yakal-Dilnet','WF','4:00-5:30','Y',2,2),('Yakal-Dilnet','WF','7:00-8:30','Y',3,3),('Yakal-Dilnet','WF','8:30-10:00','Y',4,3),('Vinzons-Dilnet','M','7:00-8:30','Y',3,5),('Ilang-Dilnet','WF','7:00-8:30','Y',3,5),('Molave-Dilnet','M','7:00-8:30','Y',3,3),('Molave-Dilnet','WF','7:00-8:30','Y',3,5),('Molave-Dilnet','TTH','8:30-10:00','Y',3,5),('DCS-Enggnet','M','8:30-10:00','N',3,3),('DCS-Enggnet','WF','10:00-11:30','N',3,4),('DCS-Enggnet','WF','10:00-11:30','N',2,2),('DCS-Dilnet','WF','10:00-11:30','Y',2,2),('DCS-Enggnet','WF','10:00-11:30','N',3,5),('Engg-Enggnet','WF','11:30-1:00','N',2,5),('Engg-Enggnet','WF','11:30-1:00','N',2,4),('DCS-Enggnet','WF','2:30-4:00','N',3,5),('DCS-Dilnet','WF','2:30-4:00','Y',2,5),('DCS-Enggnet','WF','2:30-4:00','N',2,2),('DCS-Dilnet','WF','2:30-4:00','Y',2,2),('Engg-Enggnet','WF','4:00-5:30','N',2,2),('AS-DilnetWifi','TTH','4:00-5:30','N',3,5),('DCS-Dilnet','TTH','4:00-5:30','Y',3,5),('Engg-Enggnet','TTH','4:00-5:30','N',3,5),('DCS-Dilnet','TTH','4:00-5:30','Y',3,4),('Yakal-Dilnet','TTH','4:00-5:30','Y',3,5),('Molave-Dilnet','M','4:00-5:30','Y',3,5),('Molave-Dilnet','M','4:00-5:30','Y',3,5),('Molave-Dilnet','M','4:00-5:30','Y',3,5),('Molave-Dilnet','TTH','4:00-5:30','Y',3,5),('DCS-Enggnet','WF','4:00-5:30','N',2,2),('DCS-Dilnet','WF','4:00-5:30','Y',2,2);
/*!40000 ALTER TABLE `fromfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiyeme_choice`
--

DROP TABLE IF EXISTS `kiyeme_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kiyeme_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kiyeme_choice_7aa0f6ee` (`question_id`),
  CONSTRAINT `kiyeme_choice_question_id_83552dfe_fk_kiyeme_question_id` FOREIGN KEY (`question_id`) REFERENCES `kiyeme_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiyeme_choice`
--

LOCK TABLES `kiyeme_choice` WRITE;
/*!40000 ALTER TABLE `kiyeme_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `kiyeme_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiyeme_question`
--

DROP TABLE IF EXISTS `kiyeme_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kiyeme_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiyeme_question`
--

LOCK TABLES `kiyeme_question` WRITE;
/*!40000 ALTER TABLE `kiyeme_question` DISABLE KEYS */;
INSERT INTO `kiyeme_question` VALUES (1,'What\'s new?','2016-11-28 03:24:45.542000');
/*!40000 ALTER TABLE `kiyeme_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wifiid` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `capability` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `proxy` tinyint(1) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=800 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (388,5,1,5,2,2,1,0),(389,5,1,3,3,4,1,0),(390,5,1,4,2,3,1,0),(391,5,1,6,2,2,1,0),(392,5,1,7,2,3,1,0),(393,5,1,1,3,5,1,0),(394,5,1,2,3,5,1,0),(395,5,2,5,3,2,1,0),(396,5,2,3,4,4,1,0),(397,5,2,4,3,3,1,0),(398,5,2,6,3,2,1,0),(399,5,2,7,3,3,1,0),(400,5,2,1,4,5,1,0),(401,5,2,2,4,5,1,0),(402,5,3,5,2,2,1,0),(403,5,3,3,3,4,1,0),(404,5,3,4,2,3,1,0),(405,5,3,6,2,2,1,0),(406,5,3,7,2,3,1,0),(407,5,3,1,3,5,1,0),(408,5,3,2,4,5,1,0),(430,4,1,5,1,1,1,0),(431,4,1,3,2,3,1,0),(432,4,1,4,1,2,1,0),(433,4,1,6,1,2,1,0),(434,4,1,7,1,1,1,0),(435,4,1,1,2,1,1,0),(436,4,1,2,2,1,1,0),(437,4,2,5,1,1,1,0),(438,4,2,3,2,3,1,0),(439,4,2,4,1,2,1,0),(440,4,2,6,1,2,1,0),(441,4,2,7,1,1,1,0),(442,4,2,1,2,1,1,0),(443,4,2,2,2,2,1,0),(444,4,3,5,1,2,1,0),(445,4,3,3,2,3,1,0),(446,4,3,4,1,2,1,0),(447,4,3,6,1,2,1,0),(448,4,3,7,1,1,1,0),(449,4,3,1,2,2,1,0),(450,4,3,2,2,2,1,0),(451,10,1,5,4,5,1,0),(452,10,1,3,4,5,1,0),(453,10,1,4,3,5,1,0),(454,10,1,6,3,4,1,0),(455,10,1,7,3,3,1,0),(456,10,1,1,3,3,1,0),(457,10,1,2,4,3,1,0),(458,10,2,5,4,4,1,0),(459,10,2,3,3,3,1,0),(460,10,2,4,4,4,1,0),(461,10,2,6,3,3,1,0),(462,10,2,7,2,2,1,0),(463,10,2,1,2,3,1,0),(464,10,2,2,3,4,1,0),(465,10,3,5,4,4,1,0),(466,10,3,3,3,3,1,0),(467,10,3,4,4,4,1,0),(468,10,3,6,3,3,1,0),(469,10,3,7,2,2,1,0),(470,10,3,1,2,3,1,0),(471,10,3,2,3,4,1,0),(472,9,1,5,4,5,1,0),(473,9,1,3,4,5,1,0),(474,9,1,4,3,5,1,0),(475,9,1,6,3,4,1,0),(476,9,1,7,3,3,1,0),(477,9,1,1,3,3,1,0),(478,9,1,2,4,3,1,0),(479,9,2,5,4,4,1,0),(480,9,2,3,3,3,1,0),(481,9,2,4,4,4,1,0),(482,9,2,6,3,3,1,0),(483,9,2,7,2,2,1,0),(484,9,2,1,2,3,1,0),(485,9,2,2,3,4,1,0),(486,9,3,5,4,4,1,0),(487,9,3,3,3,3,1,0),(488,9,3,4,4,4,1,0),(489,9,3,6,3,3,1,0),(490,9,3,7,2,2,1,0),(491,9,3,1,2,3,1,0),(492,9,3,2,3,4,1,0),(493,7,1,5,4,5,1,0),(494,7,1,3,4,5,1,0),(495,7,1,4,3,5,1,0),(496,7,1,6,3,4,1,0),(497,7,1,7,3,3,1,0),(498,7,1,1,3,3,1,0),(499,7,1,2,4,3,1,0),(500,7,2,5,4,4,1,0),(501,7,2,3,3,3,1,0),(502,7,2,4,4,4,1,0),(503,7,2,6,3,3,1,0),(504,7,2,7,2,2,1,0),(505,7,2,1,2,3,1,0),(506,7,2,2,3,4,1,0),(507,7,3,5,4,4,1,0),(508,7,3,3,3,3,1,0),(509,7,3,4,4,4,1,0),(510,7,3,6,3,3,1,0),(511,7,3,7,2,2,1,0),(512,7,3,1,2,3,1,0),(513,7,3,2,3,4,1,0),(514,8,1,5,4,5,1,0),(515,8,1,3,4,5,1,0),(516,8,1,4,3,5,1,0),(517,8,1,6,3,4,1,0),(518,8,1,7,3,3,1,0),(519,8,1,1,3,3,1,0),(520,8,1,2,4,3,1,0),(521,8,2,5,3,3,1,0),(522,8,2,3,3,3,1,0),(523,8,2,4,3,3,1,0),(524,8,2,6,3,3,1,0),(525,8,2,7,2,2,1,0),(526,8,2,1,4,3,1,0),(527,8,2,2,4,4,1,0),(528,8,3,5,3,3,1,0),(529,8,3,3,3,3,1,0),(530,8,3,4,3,3,1,0),(531,8,3,6,3,3,1,0),(532,8,3,7,2,2,1,0),(533,8,3,1,3,3,1,0),(534,8,3,2,4,3,1,0),(535,7,1,1,3,5,1,0),(536,10,3,1,3,5,1,0),(537,9,1,1,3,3,1,0),(538,9,3,1,3,5,1,0),(539,9,2,2,3,5,1,0),(545,8,2,7,3,5,1,0),(546,9,1,7,3,5,1,0),(547,9,1,7,3,5,1,0),(548,9,1,7,3,5,1,0),(549,9,2,7,3,5,1,0),(685,3,1,5,2,2,0,0),(686,3,1,3,3,2,0,0),(687,3,1,4,2,2,0,0),(688,3,1,6,2,1,0,0),(689,3,1,7,2,2,0,0),(690,3,1,1,4,3,0,0),(691,3,1,2,4,4,0,0),(692,3,2,5,1,1,0,0),(693,3,2,3,3,2,0,0),(694,3,2,4,2,2,0,0),(695,3,2,6,1,1,0,0),(696,3,2,7,2,1,0,0),(697,3,2,1,4,2,0,0),(698,3,2,2,4,3,0,0),(699,3,3,5,1,1,0,0),(700,3,3,3,3,2,0,0),(701,3,3,4,2,2,0,0),(702,3,3,6,1,2,0,0),(703,3,3,7,2,2,0,0),(704,3,3,1,4,4,0,0),(705,3,3,2,4,3,0,0),(710,3,3,4,2,5,0,0),(711,3,3,4,2,4,0,0),(714,3,3,7,2,2,0,0),(716,3,2,7,3,5,0,0),(794,6,1,1,4,5,0,-5),(795,1,1,1,4,4,0,-3),(796,2,1,1,4,5,0,-5),(797,6,1,1,4,5,0,-5),(798,3,1,1,4,3,0,5),(799,5,1,1,3,5,0,3);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `times`
--

DROP TABLE IF EXISTS `times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `times` (
  `timeid` int(11) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `times`
--

LOCK TABLES `times` WRITE;
/*!40000 ALTER TABLE `times` DISABLE KEYS */;
INSERT INTO `times` VALUES (1,'7:00-8:30'),(2,'8:30-10:00'),(3,'10:00-11:30'),(4,'11:30-1:00'),(5,'1:00-2:30'),(6,'2:30-4:00'),(7,'4:00-5:30');
/*!40000 ALTER TABLE `times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wifinames`
--

DROP TABLE IF EXISTS `wifinames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wifinames` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wifinames`
--

LOCK TABLES `wifinames` WRITE;
/*!40000 ALTER TABLE `wifinames` DISABLE KEYS */;
INSERT INTO `wifinames` VALUES (1,'DCS-Enggnet'),(2,'DCS-Dilnet'),(3,'Engg-Enggnet'),(4,'Engg-Dilnet'),(5,'CMC-Dilnet'),(6,'AS-DilnetWifi'),(7,'Vinzons-Dilnet'),(8,'Yakal-Dilnet'),(9,'Molave-Dilnet'),(10,'Ilang-Dilnet');
/*!40000 ALTER TABLE `wifinames` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-03  2:08:12
