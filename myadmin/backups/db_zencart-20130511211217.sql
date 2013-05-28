-- MySQL dump 10.13  Distrib 5.5.27, for Win32 (x86)
--
-- Host: localhost    Database: zencart
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `cnaddress_book`
--

DROP TABLE IF EXISTS `cnaddress_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnaddress_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `entry_gender` char(1) NOT NULL DEFAULT '',
  `entry_company` varchar(64) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL DEFAULT '',
  `entry_lastname` varchar(32) NOT NULL DEFAULT '',
  `entry_street_address` varchar(64) NOT NULL DEFAULT '',
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL DEFAULT '',
  `entry_city` varchar(32) NOT NULL DEFAULT '',
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id_zen` (`customers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnaddress_book`
--

LOCK TABLES `cnaddress_book` WRITE;
/*!40000 ALTER TABLE `cnaddress_book` DISABLE KEYS */;
INSERT INTO `cnaddress_book` (`address_book_id`, `customers_id`, `entry_gender`, `entry_company`, `entry_firstname`, `entry_lastname`, `entry_street_address`, `entry_suburb`, `entry_postcode`, `entry_city`, `entry_state`, `entry_country_id`, `entry_zone_id`) VALUES (1,1,'m','JustaDemo','Bill','Smith','123 Any Avenue','','12345','Here','',223,12),(2,2,'m',NULL,'Cloud','Wei','Version park','','518000','ShenZhen','',44,135);
/*!40000 ALTER TABLE `cnaddress_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnaddress_format`
--

DROP TABLE IF EXISTS `cnaddress_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnaddress_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL DEFAULT '',
  `address_summary` varchar(48) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_format_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnaddress_format`
--

LOCK TABLES `cnaddress_format` WRITE;
/*!40000 ALTER TABLE `cnaddress_format` DISABLE KEYS */;
INSERT INTO `cnaddress_format` (`address_format_id`, `address_format`, `address_summary`) VALUES (1,'$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country'),(2,'$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country'),(3,'$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country'),(4,'$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country','$postcode / $country'),(5,'$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country'),(6,'$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country','$postcode / $country'),(7,'$postcode$cr$country $state $city$cr$streets$cr$company$cr$firstname $lastname','$city / $country');
/*!40000 ALTER TABLE `cnaddress_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnadmin`
--

DROP TABLE IF EXISTS `cnadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnadmin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(32) NOT NULL DEFAULT '',
  `admin_email` varchar(96) NOT NULL DEFAULT '',
  `admin_profile` int(11) NOT NULL DEFAULT '0',
  `admin_pass` varchar(40) NOT NULL DEFAULT '',
  `prev_pass1` varchar(40) NOT NULL DEFAULT '',
  `prev_pass2` varchar(40) NOT NULL DEFAULT '',
  `prev_pass3` varchar(40) NOT NULL DEFAULT '',
  `pwd_last_change_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset_token` varchar(60) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_ip` varchar(45) NOT NULL DEFAULT '',
  `failed_logins` smallint(4) unsigned NOT NULL DEFAULT '0',
  `lockout_expires` int(11) NOT NULL DEFAULT '0',
  `last_failed_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_failed_ip` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`admin_id`),
  KEY `idx_admin_name_zen` (`admin_name`),
  KEY `idx_admin_email_zen` (`admin_email`),
  KEY `idx_admin_profile_zen` (`admin_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnadmin`
--

LOCK TABLES `cnadmin` WRITE;
/*!40000 ALTER TABLE `cnadmin` DISABLE KEYS */;
INSERT INTO `cnadmin` (`admin_id`, `admin_name`, `admin_email`, `admin_profile`, `admin_pass`, `prev_pass1`, `prev_pass2`, `prev_pass3`, `pwd_last_change_date`, `reset_token`, `last_modified`, `last_login_date`, `last_login_ip`, `failed_logins`, `lockout_expires`, `last_failed_attempt`, `last_failed_ip`) VALUES (1,'kaiweicai','cloudwei.sz@gmail.com',1,'1012d55f8c44b566a7343e0981fbf00b:b6','00fdcf437db49a921592e945ab736c0a:61','','','2013-05-08 21:59:17','','2013-05-08 21:35:04','2013-05-12 03:04:38','127.0.0.1',0,0,'2013-05-09 22:11:35','127.0.0.1');
/*!40000 ALTER TABLE `cnadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnadmin_activity_log`
--

DROP TABLE IF EXISTS `cnadmin_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnadmin_activity_log` (
  `log_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `access_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `page_accessed` varchar(80) NOT NULL DEFAULT '',
  `page_parameters` text,
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `flagged` tinyint(4) NOT NULL DEFAULT '0',
  `attention` varchar(255) NOT NULL DEFAULT '',
  `gzpost` mediumblob,
  PRIMARY KEY (`log_id`),
  KEY `idx_page_accessed_zen` (`page_accessed`),
  KEY `idx_access_date_zen` (`access_date`),
  KEY `idx_flagged_zen` (`flagged`),
  KEY `idx_ip_zen` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnadmin_activity_log`
--

LOCK TABLES `cnadmin_activity_log` WRITE;
/*!40000 ALTER TABLE `cnadmin_activity_log` DISABLE KEYS */;
INSERT INTO `cnadmin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`, `flagged`, `attention`, `gzpost`) VALUES (1,'2013-05-08 21:58:05',0,'Log found to be empty. Logging started.','','127.0.0.1',0,'',''),(2,'2013-05-08 21:58:06',0,'alert_page.php ','','127.0.0.1',0,'',''),(3,'2013-05-08 21:58:56',0,'login.php ','camefrom=index.php&','127.0.0.1',0,'',''),(4,'2013-05-08 21:59:03',0,'login.php kaiweicai','camefrom=index.php&','127.0.0.1',0,'','\r�1\n�0лdv��V���&\ri������!X�~t�J;����\"h\"���ic�xR]�Y���8�d)�m��'),(5,'2013-05-08 21:59:17',0,'login.php ','','127.0.0.1',0,'','�VJL��̋�K�MյL4I3KN65NLK3O67LK13N163117IJ2N�P�R�N�,O�LN�T�QJL.���\n�Y\0'),(6,'2013-05-08 21:59:21',1,'template_select.php','','127.0.0.1',0,'',''),(7,'2013-05-08 21:59:24',1,'configuration.php','gID=1&','127.0.0.1',0,'',''),(8,'2013-05-08 21:59:28',1,'template_select.php','','127.0.0.1',0,'',''),(9,'2013-05-08 21:59:49',1,'template_select.php','page=1&tID=1&action=edit&','127.0.0.1',0,'',''),(10,'2013-05-08 21:59:54',1,'template_select.php','page=1&tID=1&action=save&','127.0.0.1',0,'','�V��S�R*(-J�/JM�O+JMU�\0'),(11,'2013-05-09 20:42:10',0,'login.php ','camefrom=index.php&','127.0.0.1',0,'',''),(12,'2013-05-09 20:42:24',0,'login.php kaiweicai','camefrom=index.php&','127.0.0.1',0,'','\r�;\n�0\0лdvh-5��H�i���������\rv89n�X���O�FSu\'jk�jRUQF�,�(�'),(13,'2013-05-09 20:43:49',0,'login.php kaiweicai','camefrom=index.php&','127.0.0.1',0,'','\r�;\n�0\0лdvh-5��H�i���������\rv89n�X���O�FSu\'jk�jRUQF�,�(�'),(14,'2013-05-09 20:44:04',1,'alt_nav.php','','127.0.0.1',0,'',''),(15,'2013-05-09 20:44:24',1,'jmw_api.php','','127.0.0.1',0,'',''),(16,'2013-05-09 20:44:45',1,'jmw_api.php','action=user_tying_action&','127.0.0.1',0,'','u�A\n1E�ҵإ�B\\8���\Zl��!�U���ܹ}���r֨\\N�\'E)pC7�+Ќ����:W9w��]�а��Ty���V2I� ��|�Fȩ.\Z�A�-��-\'^K����K1��\0'),(17,'2013-05-09 20:44:46',1,'jmw_api.php','','127.0.0.1',0,'',''),(18,'2013-05-09 20:53:02',1,'jmw_api.php','language=gb&','127.0.0.1',0,'',''),(19,'2013-05-09 20:53:17',1,'jmw_api.php','language=en&','127.0.0.1',0,'',''),(20,'2013-05-09 20:54:34',1,'orders_status.php','','127.0.0.1',0,'',''),(21,'2013-05-09 20:56:05',1,'orders_status.php','page=1&oID=1&action=edit&','127.0.0.1',0,'',''),(22,'2013-05-09 20:56:08',1,'orders_status.php','page=1&oID=2&','127.0.0.1',0,'',''),(23,'2013-05-09 20:56:10',1,'orders_status.php','page=1&oID=3&','127.0.0.1',0,'',''),(24,'2013-05-09 20:56:12',1,'orders_status.php','page=1&oID=4&','127.0.0.1',0,'',''),(25,'2013-05-09 20:56:14',1,'orders_status.php','page=1&oID=1&','127.0.0.1',0,'',''),(26,'2013-05-09 21:16:20',0,'login.php ','camefrom=jmw_api.php&','127.0.0.1',0,'',''),(27,'2013-05-09 21:16:27',0,'login.php kaiweicai','camefrom=jmw_api.php&','127.0.0.1',0,'','\r�1� лtv\0��x�[:4XL�w�7��І�sb�᷹�i#��k��V�\\!Rr��Zx��JK�$�'),(28,'2013-05-09 21:16:27',1,'jmw_api.php','','127.0.0.1',0,'',''),(29,'2013-05-09 21:16:58',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(30,'2013-05-09 21:19:58',1,'logoff.php','','127.0.0.1',0,'',''),(31,'2013-05-09 21:19:59',0,'login.php ','','127.0.0.1',0,'',''),(32,'2013-05-09 21:20:07',0,'login.php kaiweicai','','127.0.0.1',0,'','\r�;� \0лtv� ��)�$����������v8�ou&��/��O��ƛ�Z�B	�rT��RV�h-��'),(33,'2013-05-09 21:20:14',1,'jmw_api.php','','127.0.0.1',0,'',''),(34,'2013-05-09 21:20:33',1,'alt_nav.php','','127.0.0.1',0,'',''),(35,'2013-05-09 21:20:48',1,'jmw_api.php','','127.0.0.1',0,'',''),(36,'2013-05-09 21:21:11',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(37,'2013-05-09 21:21:27',1,'jmw_api.php','','127.0.0.1',0,'',''),(38,'2013-05-09 21:21:32',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(39,'2013-05-09 21:39:03',0,'login.php ','camefrom=jmw_api.php&','127.0.0.1',0,'',''),(40,'2013-05-09 21:39:23',0,'login.php kaiweicai','camefrom=jmw_api.php&','127.0.0.1',0,'','\r�1� лtv�h�x�)�4XL�w�7��P��c�W����FA/���2%s\n*�e��(-T�9aUpX��\0'),(41,'2013-05-09 21:39:23',1,'jmw_api.php','','127.0.0.1',0,'',''),(42,'2013-05-09 21:42:39',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(43,'2013-05-09 22:11:30',0,'login.php ','camefrom=jmw_api.php&','127.0.0.1',0,'',''),(44,'2013-05-09 22:11:35',0,'login.php kaiweicai','camefrom=jmw_api.php&','127.0.0.1',0,'','\r�;� \0лtv@�^Ɣ~��\0��������\0I�~tj\n;��:��ė�����b9r�F��1XΥ��b\n�'),(45,'2013-05-09 22:11:46',0,'login.php kaiweicai','camefrom=jmw_api.php&','127.0.0.1',0,'','\r�;� \0лtv@�^Ɣ~��\0��������\0I�~tj\n;��:��ė�����b9r�F��1XΥ��b\n�'),(46,'2013-05-09 22:11:46',1,'jmw_api.php','','127.0.0.1',0,'',''),(47,'2013-05-09 22:11:49',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(48,'2013-05-09 23:26:04',0,'login.php ','camefrom=jmw_add_products.php&','127.0.0.1',0,'',''),(49,'2013-05-09 23:26:13',0,'login.php kaiweicai','camefrom=jmw_add_products.php&','127.0.0.1',0,'','\r�1\n�0лdvh�X�2�F�tĻ��C��c4��N�m�p\Zzy�?k/��(��0fpZ!��fl�X��\0'),(50,'2013-05-09 23:26:13',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(51,'2013-05-09 23:28:16',1,'zones.php','','127.0.0.1',0,'',''),(52,'2013-05-09 23:28:24',1,'jmw_api.php','','127.0.0.1',0,'',''),(53,'2013-05-09 23:28:26',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(54,'2013-05-10 00:11:22',0,'login.php ','camefrom=jmw_add_products.php&','127.0.0.1',0,'',''),(55,'2013-05-10 00:11:30',0,'login.php kaiweicai','camefrom=jmw_add_products.php&','127.0.0.1',0,'','\r�1� лtv�X/c~[H\Z,&ƻ��C����v:�wu��B�����f�)G�¡�A��VR�����~'),(56,'2013-05-10 00:11:30',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(57,'2013-05-10 00:12:36',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(58,'2013-05-10 00:33:39',0,'login.php ','camefrom=jmw_add_products.php&','127.0.0.1',0,'',''),(59,'2013-05-10 00:33:48',0,'login.php kaiweicai','camefrom=jmw_add_products.php&','127.0.0.1',0,'','\r�1� \0��tv� ��)-$�����{���8�\n;�lw5a�X.��O��\Z1\"�\Z\\Ӽ��=&���'),(60,'2013-05-10 00:33:48',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(61,'2013-05-10 00:33:58',1,'jmw_api.php','','127.0.0.1',0,'',''),(62,'2013-05-10 00:34:00',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(63,'2013-05-10 00:34:42',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(64,'2013-05-10 00:35:54',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(65,'2013-05-10 00:38:09',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(66,'2013-05-10 01:34:06',0,'login.php ','camefrom=jmw_return.php&debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost/zencart/myadmin/jmw_return.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368120844942&debug_session_id=1000&','127.0.0.1',0,'',''),(67,'2013-05-10 01:34:16',0,'login.php kaiweicai','camefrom=jmw_return.php&debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost/zencart/myadmin/jmw_return.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368120844942&debug_session_id=1000&','127.0.0.1',0,'','�VJL��̋�K�MU�R�N�,O�LN�T�QJL.���\n������X\Z\'�\Z$���$�$��T#C�D��R-\0'),(68,'2013-05-10 01:34:17',1,'jmw_return.php','debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost/zencart/myadmin/jmw_return.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368120844942&debug_session_id=1000&','127.0.0.1',0,'',''),(69,'2013-05-10 01:35:43',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(70,'2013-05-10 01:35:48',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(71,'2013-05-10 01:35:48',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(72,'2013-05-10 01:35:51',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(73,'2013-05-10 01:35:59',1,'jmw_add_products.php','language=gb&','127.0.0.1',0,'',''),(74,'2013-05-10 01:44:22',1,'jmw_return.php','XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13681214610821&','127.0.0.1',0,'',''),(75,'2013-05-10 01:53:16',0,'login.php ','camefrom=jmw_return.php&debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost/zencart/myadmin/jmw_return.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368121995098&debug_session_id=1001&','127.0.0.1',0,'',''),(76,'2013-05-10 01:53:25',0,'login.php kaiweicai','camefrom=jmw_return.php&debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost/zencart/myadmin/jmw_return.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368121995098&debug_session_id=1001&','127.0.0.1',0,'','\r�1� \0��tv\0,4�3���4XL���i��>�lp���U�z��iɒ�u�h���9T����\0'),(77,'2013-05-10 01:53:25',1,'jmw_return.php','debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost/zencart/myadmin/jmw_return.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368121995098&debug_session_id=1001&','127.0.0.1',0,'',''),(78,'2013-05-10 01:55:35',0,'login.php ','camefrom=jmw_return.php&XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13681221346612&','127.0.0.1',0,'',''),(79,'2013-05-10 01:55:59',0,'login.php kaiweicai','camefrom=jmw_return.php&XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13681221346612&','127.0.0.1',0,'','\r�1\n�0лdvhKj����!H�Ep�o|�6�[�f��)~�C�&\\>��:,[Q�K �Z�\n+2�F<��\0'),(80,'2013-05-10 01:55:59',1,'jmw_return.php','XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13681221346612&','127.0.0.1',0,'',''),(81,'2013-05-10 01:57:05',0,'login.php ','camefrom=jmw_add_products.php&debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost//zencart/myadmin/jmw_add_products.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368122224817&debug_session_id=1002&','127.0.0.1',0,'',''),(82,'2013-05-10 01:57:16',0,'login.php kaiweicai','camefrom=jmw_add_products.php&debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost//zencart/myadmin/jmw_add_products.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368122224817&debug_session_id=1002&','127.0.0.1',0,'','\r�1� \0��tv\0(�ShI\Z,&ƿ��\0˰yN\nt�[���\\/[�OY�b�.e,q��%j�$Kn�'),(83,'2013-05-10 01:57:16',1,'jmw_add_products.php','debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost//zencart/myadmin/jmw_add_products.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368122224817&debug_session_id=1002&','127.0.0.1',0,'',''),(84,'2013-05-11 00:36:50',0,'login.php ','camefrom=jmw_api.php&','127.0.0.1',0,'',''),(85,'2013-05-11 00:36:58',0,'login.php kaiweicai','camefrom=jmw_api.php&','127.0.0.1',0,'','\r�1\n�0лdv0m��e�4��\"8�w�7��`-���*mt\"�\Z����W���\r�����\\�r�s.���:�'),(86,'2013-05-11 00:36:59',1,'jmw_api.php','','127.0.0.1',0,'',''),(87,'2013-05-11 00:37:03',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(88,'2013-05-11 00:37:05',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(89,'2013-05-11 00:42:21',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(90,'2013-05-11 00:42:27',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(91,'2013-05-11 00:42:35',1,'jmw_return.php','action=request_categories&jmw_categories_id=0&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=&endputawaydate=&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(92,'2013-05-11 00:52:13',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(93,'2013-05-11 00:52:16',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(94,'2013-05-11 00:53:51',1,'jmw_return.php','action=request_categories&jmw_categories_id=0&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=&endputawaydate=&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(95,'2013-05-11 00:54:05',1,'jmw_api.php','','127.0.0.1',0,'',''),(96,'2013-05-11 00:54:07',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(97,'2013-05-11 00:54:10',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(98,'2013-05-11 00:55:40',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(99,'2013-05-11 00:55:42',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(100,'2013-05-11 00:56:45',1,'jmw_return.php','action=request_categories&jmw_categories_id=0&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=&endputawaydate=&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(101,'2013-05-11 00:57:38',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(102,'2013-05-11 00:57:40',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(103,'2013-05-11 00:57:43',1,'jmw_return.php','action=request_categories&jmw_categories_id=0&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=&endputawaydate=&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(104,'2013-05-11 00:58:18',1,'jmw_return.php','action=request_select&jmw_categories_id=11442&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-11&endputawaydate=2013-05-11&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(105,'2013-05-11 01:08:12',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(106,'2013-05-11 01:08:15',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(107,'2013-05-11 01:09:22',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(108,'2013-05-11 01:09:25',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(109,'2013-05-11 01:09:50',1,'jmw_return.php','action=request_select&jmw_categories_id=11818&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-11&endputawaydate=2013-05-11&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(110,'2013-05-11 01:10:21',1,'jmw_return.php','action=request_select&jmw_categories_id=11617&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-11&endputawaydate=2013-05-11&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(111,'2013-05-11 01:10:35',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-11&endputawaydate=2013-05-11&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(112,'2013-05-11 01:10:47',1,'jmw_return.php','action=request_select&jmw_categories_id=0&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(113,'2013-05-11 01:10:56',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(114,'2013-05-11 01:12:43',1,'jmw_return.php','action=request_select&jmw_categories_id=0&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=USLA&','127.0.0.1',0,'',''),(115,'2013-05-11 01:17:43',1,'jmw_return.php','action=request_select&jmw_categories_id=0&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(116,'2013-05-11 01:17:47',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(117,'2013-05-11 01:18:49',1,'categories.php','','127.0.0.1',0,'',''),(118,'2013-05-11 01:19:02',1,'categories.php','cPath=&action=new_category&','127.0.0.1',0,'',''),(119,'2013-05-11 01:19:34',1,'categories.php','action=insert_category&cPath=&','127.0.0.1',0,'','��1\n�0���!r�q�o�aʁ%��T��J��K;�3;V��\n�(2�W,�m���m��x;zl�>qߊ粪����)18/�ѧa/�IJ��.Rj��cK��z~��18N'),(120,'2013-05-11 01:19:35',1,'categories.php','cPath=&cID=65&','127.0.0.1',0,'',''),(121,'2013-05-11 01:19:48',1,'jmw_api.php','','127.0.0.1',0,'',''),(122,'2013-05-11 01:19:52',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(123,'2013-05-11 01:19:54',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(124,'2013-05-11 01:20:02',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(125,'2013-05-11 01:49:45',0,'login.php ','camefrom=jmw_add_products.php&','127.0.0.1',0,'',''),(126,'2013-05-11 01:49:54',0,'login.php kaiweicai','camefrom=jmw_add_products.php&','127.0.0.1',0,'','\r�1� лtv\0^�|ښ4XL�w�7�� ��>Е6:a�\Z�h!�es�)3`m���+18�!���H��'),(127,'2013-05-11 01:49:55',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(128,'2013-05-11 01:49:57',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(129,'2013-05-11 01:50:05',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(130,'2013-05-11 01:50:18',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=65&rate=&','127.0.0.1',0,'',''),(131,'2013-05-11 01:50:51',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(132,'2013-05-11 01:50:53',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(133,'2013-05-11 01:51:03',1,'jmw_api.php','','127.0.0.1',0,'',''),(134,'2013-05-11 01:51:10',1,'jmw_api.php','','127.0.0.1',0,'','�VJ.-*J�+�ON,IM�/���LQ�R23U�Q��-�/NM,J�(��N�\n+�\0'),(135,'2013-05-11 02:00:15',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(136,'2013-05-11 02:00:18',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(137,'2013-05-11 02:00:25',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(138,'2013-05-11 02:00:34',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=65&rate=&','127.0.0.1',0,'',''),(139,'2013-05-11 02:00:49',1,'jmw_api.php','','127.0.0.1',0,'','�VJ.-*J�+�ON,IM�/���LQ�R23U�Q��-�/NM,J�(��N�\n+�\0'),(140,'2013-05-11 02:00:57',1,'jmw_api.php','','127.0.0.1',0,'','�VJ.-*J�+�ON,IM�/���LQ�R23U�Q��-�/NM,J�(��N�\n+�\0'),(141,'2013-05-11 02:02:46',1,'jmw_api.php','','127.0.0.1',0,'','�VJ.-*J�+�ON,IM�/���LQ�R23U�Q��-�/NM,J�(��N�\n+�\0'),(142,'2013-05-11 02:14:16',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=0&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(143,'2013-05-11 02:15:11',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=65&rate=&','127.0.0.1',0,'',''),(144,'2013-05-11 02:17:01',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(145,'2013-05-11 02:17:03',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(146,'2013-05-11 02:17:15',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(147,'2013-05-11 02:17:31',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=65&rate=&','127.0.0.1',0,'',''),(148,'2013-05-11 10:48:59',0,'login.php ','camefrom=jmw_api.php&','127.0.0.1',0,'',''),(149,'2013-05-11 10:49:07',0,'login.php kaiweicai@163.com','camefrom=jmw_api.php&','127.0.0.1',0,'','\r�1\n�0\0��dIZ*�ɟH����\"8��[��n~8�\n�lw5a�i����\\6�O+\n)�� R�\Z�\Z�-(��~'),(150,'2013-05-11 10:49:26',0,'login.php kaiweicai','camefrom=jmw_api.php&','127.0.0.1',0,'','\r�1\n�0лdv�����4I!H�Ep�o|��ǐ��)q{�-$z��ܠ�Zsc8��q)֒!�J�'),(151,'2013-05-11 10:49:27',1,'jmw_api.php','','127.0.0.1',0,'',''),(152,'2013-05-11 10:49:35',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(153,'2013-05-11 10:49:40',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(154,'2013-05-11 10:49:50',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(155,'2013-05-11 10:50:06',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(156,'2013-05-11 10:52:55',0,'login.php ','camefrom=jmw_return.php&XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682406201252&','127.0.0.1',0,'',''),(157,'2013-05-11 10:53:36',0,'login.php ','','127.0.0.1',0,'',''),(158,'2013-05-11 11:00:30',0,'login.php kaiweicai','','127.0.0.1',0,'','\r�=\n�0лdv��_/#_���]�������8��N\'�Vc-�l�?eDﰡe�\\\\�XkLkn\Z4$az?'),(159,'2013-05-11 11:03:19',1,'jmw_api.php','','127.0.0.1',0,'',''),(160,'2013-05-11 11:03:34',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(161,'2013-05-11 11:03:59',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(162,'2013-05-11 11:04:23',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(163,'2013-05-11 11:04:46',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(164,'2013-05-11 11:05:48',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(165,'2013-05-11 11:10:22',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(166,'2013-05-11 11:10:52',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(167,'2013-05-11 11:18:23',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(168,'2013-05-11 11:22:17',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(169,'2013-05-11 11:22:52',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(170,'2013-05-11 11:23:27',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(171,'2013-05-11 12:34:12',0,'login.php ','camefrom=logoff.php&','127.0.0.1',0,'',''),(172,'2013-05-11 12:34:22',0,'login.php kaiweicai','camefrom=logoff.php&','127.0.0.1',0,'','\r�1� лtvP�^���������!X�~t�J;���i\"���iCB�dyI\\�R�mι�Q���~'),(173,'2013-05-11 12:34:23',1,'logoff.php','','127.0.0.1',0,'',''),(174,'2013-05-11 12:34:24',0,'login.php ','','127.0.0.1',0,'',''),(175,'2013-05-11 12:34:32',0,'login.php kaiweicai','','127.0.0.1',0,'','\r�1\n�0лdv�iJ���\'I!H�Ep�o|�z�c�;�t\"nE�B�+��Ӧa�T�5ɜ]�m��\n,����'),(176,'2013-05-11 12:36:30',1,'jmw_api.php','','127.0.0.1',0,'',''),(177,'2013-05-11 12:36:35',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(178,'2013-05-11 12:36:38',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(179,'2013-05-11 12:36:48',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(180,'2013-05-11 12:37:39',0,'login.php ','camefrom=jmw_return.php&XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682470458283&','127.0.0.1',0,'',''),(181,'2013-05-11 12:40:40',0,'login.php ','camefrom=jmw_add_products.php&','127.0.0.1',0,'',''),(182,'2013-05-11 12:40:53',0,'login.php kaiweicai','camefrom=jmw_add_products.php&','127.0.0.1',0,'','\r�1� ��\\m!h���[ ��1�0�]��G����������I��F�3�2ScX�S�ꫯ���H&��'),(183,'2013-05-11 12:40:58',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(184,'2013-05-11 12:41:11',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(185,'2013-05-11 12:41:27',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(186,'2013-05-11 12:41:47',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(187,'2013-05-11 12:46:45',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(188,'2013-05-11 12:48:48',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(189,'2013-05-11 12:58:45',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(190,'2013-05-11 12:59:18',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=0&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(191,'2013-05-11 12:59:27',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(192,'2013-05-11 12:59:51',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(193,'2013-05-11 13:00:34',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(194,'2013-05-11 13:01:58',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(195,'2013-05-11 16:09:20',1,'login.php','camefrom=jmw_return.php&XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682470458283&','127.0.0.1',0,'','\r�1� ��\\m!h���[ ��1�0�]��G����������I��F�3�2ScX�S�ꫯ���H&��'),(196,'2013-05-11 16:09:22',1,'jmw_return.php','XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682470458283&','127.0.0.1',0,'',''),(197,'2013-05-11 16:09:32',1,'jmw_return.php','XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682470458283&','127.0.0.1',0,'',''),(198,'2013-05-11 16:10:01',1,'jmw_api.php','','127.0.0.1',0,'',''),(199,'2013-05-11 16:10:07',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(200,'2013-05-11 16:10:15',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(201,'2013-05-11 16:10:25',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(202,'2013-05-11 16:10:45',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(203,'2013-05-11 16:11:16',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(204,'2013-05-11 16:13:25',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(205,'2013-05-11 16:13:40',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(206,'2013-05-11 16:13:44',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(207,'2013-05-11 16:13:53',1,'jmw_return.php','action=addFailedProduct&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(208,'2013-05-11 16:15:24',1,'jmw_return.php','action=addFailedProduct&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(209,'2013-05-11 16:17:57',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(210,'2013-05-11 16:18:01',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(211,'2013-05-11 16:18:22',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(212,'2013-05-11 16:21:01',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(213,'2013-05-11 16:23:10',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(214,'2013-05-11 16:23:14',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(215,'2013-05-11 16:23:28',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(216,'2013-05-11 16:23:55',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(217,'2013-05-11 16:23:59',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(218,'2013-05-11 16:24:17',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(219,'2013-05-11 16:24:25',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(220,'2013-05-11 16:25:36',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(221,'2013-05-11 16:25:40',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(222,'2013-05-11 16:25:48',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(223,'2013-05-11 16:25:55',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(224,'2013-05-11 16:56:43',0,'login.php ','camefrom=jmw_add_products.php&','127.0.0.1',0,'',''),(225,'2013-05-11 16:56:52',0,'login.php kaiweicai','camefrom=jmw_add_products.php&','127.0.0.1',0,'','\r�1\n�0лdv�mi�����B���� �]����\0mt�ݰ&FI�l��:�\\�c��\Z�\ZV�Ik����'),(226,'2013-05-11 16:56:54',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(227,'2013-05-11 16:56:58',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(228,'2013-05-11 16:58:08',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(229,'2013-05-11 16:58:17',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(230,'2013-05-11 17:33:14',0,'login.php ','camefrom=jmw_return.php&action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=0&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(231,'2013-05-11 17:33:22',0,'login.php kaiweicai','camefrom=jmw_return.php&action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=0&query_every_page=20&whCode=&','127.0.0.1',0,'','�VJL��̋�K�MU�R�N�,O�LN�T�QJL.���\n��\'&Z�&��%\Z���&�YZ&��Z���\0%�,M\r�j'),(232,'2013-05-11 17:33:23',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=0&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(233,'2013-05-11 17:33:45',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=0&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(234,'2013-05-11 17:33:58',1,'jmw_api.php','','127.0.0.1',0,'',''),(235,'2013-05-11 17:34:02',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(236,'2013-05-11 17:34:06',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(237,'2013-05-11 17:34:28',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(238,'2013-05-11 17:34:34',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(239,'2013-05-11 17:37:47',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(240,'2013-05-11 17:37:51',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(241,'2013-05-11 17:37:58',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(242,'2013-05-11 17:38:03',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(243,'2013-05-11 17:38:41',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(244,'2013-05-11 17:38:45',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(245,'2013-05-11 17:38:50',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(246,'2013-05-11 17:38:57',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(247,'2013-05-11 17:39:21',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(248,'2013-05-11 17:39:25',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(249,'2013-05-11 17:39:31',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(250,'2013-05-11 17:39:36',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(251,'2013-05-11 17:41:48',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(252,'2013-05-11 17:41:52',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(253,'2013-05-11 17:42:03',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(254,'2013-05-11 17:42:15',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(255,'2013-05-11 18:23:18',0,'login.php ','camefrom=jmw_add_products.php&','127.0.0.1',0,'',''),(256,'2013-05-11 18:23:52',0,'login.php kaiweicai','camefrom=jmw_add_products.php&','127.0.0.1',0,'','\r�1\n�0лdv(�����o�B���� �]���v�@7������ ���Θ�NI�\"r6����Vٌ�'),(257,'2013-05-11 18:23:53',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(258,'2013-05-11 18:23:57',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(259,'2013-05-11 18:24:16',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(260,'2013-05-11 18:24:28',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(261,'2013-05-11 18:25:32',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(262,'2013-05-11 18:25:36',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(263,'2013-05-11 18:25:55',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(264,'2013-05-11 18:26:02',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(265,'2013-05-11 18:26:51',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(266,'2013-05-11 18:44:54',0,'login.php ','camefrom=jmw_add_products.php&','127.0.0.1',0,'',''),(267,'2013-05-11 18:45:15',0,'login.php kaiweicai','camefrom=jmw_add_products.php&','127.0.0.1',0,'','\r�1\n�0лdv���2�6��\"8�w�7��P���v:�ws��D��G�YG��e3]���dk�s��L�'),(268,'2013-05-11 18:45:16',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(269,'2013-05-11 18:45:20',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(270,'2013-05-11 18:45:35',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(271,'2013-05-11 18:45:47',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(272,'2013-05-11 18:51:22',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(273,'2013-05-11 18:51:26',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(274,'2013-05-11 18:51:39',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=&endputawaydate=&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(275,'2013-05-11 18:51:50',1,'jmw_return.php','action=add_jmw_products&products_sku=902498-TV093-YWJM&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(276,'2013-05-11 18:59:35',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(277,'2013-05-11 18:59:39',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(278,'2013-05-11 18:59:48',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(279,'2013-05-11 18:59:54',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(280,'2013-05-11 19:02:39',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(281,'2013-05-11 19:02:43',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(282,'2013-05-11 19:02:54',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(283,'2013-05-11 19:03:01',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(284,'2013-05-12 00:24:08',0,'login.php ','camefrom=jmw_add_products.php&','127.0.0.1',0,'',''),(285,'2013-05-12 00:24:22',0,'login.php kaiweicai','camefrom=jmw_add_products.php&','127.0.0.1',0,'','\r�1\n�0лdviM�2�TҺ�����!x��\r�F+���!h\"����OX��;X�,I��*\\��.��'),(286,'2013-05-12 00:24:24',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(287,'2013-05-12 00:24:30',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(288,'2013-05-12 00:24:50',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(289,'2013-05-12 00:25:04',1,'jmw_return.php','action=add_jmw_products&products_sku=&add_to_categories=65&rate=&','127.0.0.1',0,'',''),(290,'2013-05-12 01:01:35',0,'login.php ','camefrom=jmw_add_products.php&','127.0.0.1',0,'',''),(291,'2013-05-12 01:01:56',0,'login.php kaiweicai','camefrom=jmw_add_products.php&','127.0.0.1',0,'','\r�1�0\0��0;`D?c�ք�������z�=`�Fۚ�+�w	��̯����ŕQFT�	����)���Gx?'),(292,'2013-05-12 01:01:57',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(293,'2013-05-12 01:02:02',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(294,'2013-05-12 01:02:10',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(295,'2013-05-12 01:02:28',1,'jmw_return.php','action=add_jmw_products&products_sku=,&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(296,'2013-05-12 01:04:26',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(297,'2013-05-12 01:04:31',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(298,'2013-05-12 01:04:40',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(299,'2013-05-12 01:04:48',1,'jmw_return.php','action=add_jmw_products&products_sku=,&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(300,'2013-05-12 01:07:02',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(301,'2013-05-12 01:07:10',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(302,'2013-05-12 01:07:51',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(303,'2013-05-12 01:07:58',1,'jmw_return.php','action=add_jmw_products&products_sku=,&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(304,'2013-05-12 01:08:47',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(305,'2013-05-12 01:08:55',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(306,'2013-05-12 01:09:00',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(307,'2013-05-12 01:09:10',1,'jmw_return.php','action=add_jmw_products&products_sku=,&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(308,'2013-05-12 01:09:47',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(309,'2013-05-12 01:09:53',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(310,'2013-05-12 01:10:09',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(311,'2013-05-12 01:10:17',1,'jmw_return.php','action=add_jmw_products&products_sku=902652-TIE0016-SZZW&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(312,'2013-05-12 01:19:59',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(313,'2013-05-12 01:20:03',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(314,'2013-05-12 01:20:09',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(315,'2013-05-12 01:20:17',1,'jmw_return.php','action=add_jmw_products&products_sku=902652-TIE0016-SZZW&add_to_categories=1&rate=&','127.0.0.1',0,'',''),(316,'2013-05-12 01:20:35',1,'jmw_api.php','','127.0.0.1',0,'',''),(317,'2013-05-12 01:22:04',1,'jmw_add_products.php','','127.0.0.1',0,'',''),(318,'2013-05-12 01:22:08',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(319,'2013-05-12 01:22:13',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(320,'2013-05-12 01:23:36',1,'jmw_add_products.php','language=gb&','127.0.0.1',0,'',''),(321,'2013-05-12 01:23:42',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(322,'2013-05-12 01:24:02',1,'jmw_add_products.php','language=en&','127.0.0.1',0,'',''),(323,'2013-05-12 01:24:06',1,'jmw_return.php','action=queryWhCode&{null:null}=&','127.0.0.1',0,'',''),(324,'2013-05-12 01:24:18',1,'jmw_return.php','action=request_select&jmw_categories_id=11647&select_jmw_key=&select_jmw_sku=&startprice=&endprice=&startputawaydate=2013-05-10&endputawaydate=2013-05-10&current_page_value=1&query_every_page=20&whCode=&','127.0.0.1',0,'',''),(325,'2013-05-12 01:24:36',1,'product_types.php','','127.0.0.1',0,'',''),(326,'2013-05-12 01:25:09',1,'categories.php','','127.0.0.1',0,'',''),(327,'2013-05-12 01:25:14',1,'categories.php','cPath=1&','127.0.0.1',0,'',''),(328,'2013-05-12 01:25:23',1,'configuration.php','gID=18&','127.0.0.1',0,'',''),(329,'2013-05-12 01:25:34',1,'products_price_manager.php','','127.0.0.1',0,'',''),(330,'2013-05-12 01:26:07',1,'featured.php','','127.0.0.1',0,'',''),(331,'2013-05-12 01:26:51',1,'products_expected.php','','127.0.0.1',0,'',''),(332,'2013-05-12 01:27:01',1,'tax_rates.php','','127.0.0.1',0,'',''),(333,'2013-05-12 01:33:05',1,'easypopulate.php','','127.0.0.1',0,'',''),(334,'2013-05-12 01:39:15',1,'backup_mysql.php','','127.0.0.1',0,'',''),(335,'2013-05-12 01:39:55',1,'backup_mysql.php','','127.0.0.1',0,'',''),(336,'2013-05-12 02:20:59',0,'login.php ','camefrom=backup_mysql.php&','127.0.0.1',0,'',''),(337,'2013-05-12 02:21:19',0,'login.php kaiweicai','camefrom=backup_mysql.php&','127.0.0.1',0,'','\r�1� \0��tv�AJ�3���4XL�������+�p���U�|�?mr�I״�i�BL	1s-e��'),(338,'2013-05-12 02:21:20',1,'backup_mysql.php','','127.0.0.1',0,'',''),(339,'2013-05-12 02:21:30',1,'backup_mysql.php','','127.0.0.1',0,'',''),(340,'2013-05-12 02:21:36',1,'backup_mysql.php','','127.0.0.1',0,'',''),(341,'2013-05-12 02:59:16',0,'login.php ','camefrom=backup_mysql.php&','127.0.0.1',0,'',''),(342,'2013-05-12 02:59:31',0,'login.php ','camefrom=backup_mysql.php&','127.0.0.1',0,'',''),(343,'2013-05-12 02:59:49',0,'login.php kaiweicai','camefrom=backup_mysql.php&','127.0.0.1',0,'','\r�1� лtv�* ^�|(M\Z,&ƻ��C�f��h�v:aw���P.�O�Y�c�$���\ZݶJ�,��L�'),(344,'2013-05-12 02:59:50',1,'backup_mysql.php','','127.0.0.1',0,'',''),(345,'2013-05-12 03:00:00',1,'backup_mysql.php','','127.0.0.1',0,'',''),(346,'2013-05-12 03:00:15',1,'backup_mysql.php','','127.0.0.1',0,'',''),(347,'2013-05-12 03:01:16',0,'login.php ','camefrom=backup_mysql.php&debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost//zencart/myadmin/backup_mysql.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368298873000&debug_session_id=1001&','127.0.0.1',0,'',''),(348,'2013-05-12 03:01:30',0,'login.php kaiweicai','camefrom=backup_mysql.php&debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost//zencart/myadmin/backup_mysql.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368298873000&debug_session_id=1001&','127.0.0.1',0,'','\r�=\n�0лdv��/#_���]�����j�qt��NحV`��es�Y���DVN!e�U2\Z7�M6z?'),(349,'2013-05-12 03:01:31',1,'backup_mysql.php','debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost//zencart/myadmin/backup_mysql.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368298873000&debug_session_id=1001&','127.0.0.1',0,'',''),(350,'2013-05-12 03:01:40',1,'backup_mysql.php','debug_host=192.168.1.100,192.168.56.1,127.0.0.1&start_debug=1&debug_port=10000&original_url=http://localhost//zencart/myadmin/backup_mysql.php&send_sess_end=1&debug_stop=1&debug_start_session=1&debug_no_cache=1368298873000&debug_session_id=1001&','127.0.0.1',0,'',''),(351,'2013-05-12 03:02:37',0,'login.php ','camefrom=backup_mysql.php&XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682989294844&','127.0.0.1',0,'',''),(352,'2013-05-12 03:02:52',0,'login.php kaiweicai','camefrom=backup_mysql.php&XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682989294844&','127.0.0.1',0,'','\r�1\n�0лdv�jm�e��$��\"8�w�7�� ���P�6:�z��@(����t�(����2�|X�R،�i	�~'),(353,'2013-05-12 03:02:57',1,'backup_mysql.php','XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682989294844&','127.0.0.1',0,'',''),(354,'2013-05-12 03:04:26',0,'login.php ','camefrom=backup_mysql.php&XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682990568595&','127.0.0.1',0,'',''),(355,'2013-05-12 03:04:38',0,'login.php kaiweicai','camefrom=backup_mysql.php&XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682990568595&','127.0.0.1',0,'','\r�1\n�0лdv(�����o!H�Ep�o|��Z����lr2n�ʐIX��O��Hs���5�(�\'\0&�'),(356,'2013-05-12 03:04:44',1,'backup_mysql.php','XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682990568595&','127.0.0.1',0,'',''),(357,'2013-05-12 03:06:22',1,'backup_mysql.php','XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682989294844&','127.0.0.1',0,'',''),(358,'2013-05-12 03:06:49',1,'backup_mysql.php','XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=13682989294844&','127.0.0.1',0,'',''),(359,'2013-05-12 03:06:54',1,'backup_mysql.php','action=backup&','127.0.0.1',0,'',''),(360,'2013-05-12 03:07:05',1,'backup_mysql.php','action=backupnow&','127.0.0.1',0,'','�VJ��-(J-.V�R��W�\0'),(361,'2013-05-12 03:07:07',1,'backup_mysql.php','','127.0.0.1',0,'',''),(362,'2013-05-12 03:12:08',1,'backup_mysql.php','action=backup&','127.0.0.1',0,'',''),(363,'2013-05-12 03:12:17',1,'backup_mysql.php','action=backupnow&','127.0.0.1',0,'','�VJ��-(J-.V�R��W�\0');
/*!40000 ALTER TABLE `cnadmin_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnadmin_menus`
--

DROP TABLE IF EXISTS `cnadmin_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnadmin_menus` (
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `menu_key` (`menu_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnadmin_menus`
--

LOCK TABLES `cnadmin_menus` WRITE;
/*!40000 ALTER TABLE `cnadmin_menus` DISABLE KEYS */;
INSERT INTO `cnadmin_menus` (`menu_key`, `language_key`, `sort_order`) VALUES ('access','BOX_HEADING_ADMIN_ACCESS',10),('catalog','BOX_HEADING_CATALOG',2),('configuration','BOX_HEADING_CONFIGURATION',1),('customers','BOX_HEADING_CUSTOMERS',4),('extras','BOX_HEADING_EXTRAS',11),('gv','BOX_HEADING_GV_ADMIN',9),('localization','BOX_HEADING_LOCALIZATION',6),('modules','BOX_HEADING_MODULES',3),('reports','BOX_HEADING_REPORTS',7),('taxes','BOX_HEADING_LOCATION_AND_TAXES',5),('tools','BOX_HEADING_TOOLS',8);
/*!40000 ALTER TABLE `cnadmin_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnadmin_pages`
--

DROP TABLE IF EXISTS `cnadmin_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnadmin_pages` (
  `page_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `main_page` varchar(64) NOT NULL DEFAULT '',
  `page_params` varchar(64) NOT NULL DEFAULT '',
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `display_on_menu` char(1) NOT NULL DEFAULT 'N',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnadmin_pages`
--

LOCK TABLES `cnadmin_pages` WRITE;
/*!40000 ALTER TABLE `cnadmin_pages` DISABLE KEYS */;
INSERT INTO `cnadmin_pages` (`page_key`, `language_key`, `main_page`, `page_params`, `menu_key`, `display_on_menu`, `sort_order`) VALUES ('adminlogs','BOX_ADMIN_ACCESS_LOGS','FILENAME_ADMIN_ACTIVITY','','access','Y',4),('attributes','BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER','FILENAME_ATTRIBUTES_CONTROLLER','','catalog','Y',6),('backup_mysql','BOX_TOOLS_BACKUP_MYSQL','FILENAME_BACKUP_MYSQL','','tools','Y',17),('banners','BOX_TOOLS_BANNER_MANAGER','FILENAME_BANNER_MANAGER','','tools','Y',3),('categories','BOX_CATALOG_CATEGORIES_PRODUCTS','FILENAME_CATEGORIES','','catalog','Y',1),('configAllListing','BOX_CONFIGURATION_ALL_LISTING','FILENAME_CONFIGURATION','gID=23','configuration','Y',22),('configAttributes','BOX_CONFIGURATION_ATTRIBUTE_OPTIONS','FILENAME_CONFIGURATION','gID=13','configuration','Y',11),('configCreditCards','BOX_CONFIGURATION_CREDIT_CARDS','FILENAME_CONFIGURATION','gID=17','configuration','Y',16),('configCustomerDetails','BOX_CONFIGURATION_CUSTOMER_DETAILS','FILENAME_CONFIGURATION','gID=5','configuration','Y',5),('configDefinePageStatus','BOX_CONFIGURATION_DEFINE_PAGE_STATUS','FILENAME_CONFIGURATION','gID=25','configuration','Y',24),('configEmail','BOX_CONFIGURATION_EMAIL_OPTIONS','FILENAME_CONFIGURATION','gID=12','configuration','Y',10),('configEzPagesSettings','BOX_CONFIGURATION_EZPAGES_SETTINGS','FILENAME_CONFIGURATION','gID=30','configuration','Y',25),('configFeaturedListing','BOX_CONFIGURATION_FEATURED_LISTING','FILENAME_CONFIGURATION','gID=22','configuration','Y',21),('configGvCoupons','BOX_CONFIGURATION_GV_COUPONS','FILENAME_CONFIGURATION','gID=16','configuration','Y',15),('configGzipCompression','BOX_CONFIGURATION_GZIP_COMPRESSION','FILENAME_CONFIGURATION','gID=14','configuration','Y',12),('configImageHandler4','BOX_TOOLS_IMAGE_HANDLER','FILENAME_IMAGE_HANDLER','','tools','Y',14),('configImages','BOX_CONFIGURATION_IMAGES','FILENAME_CONFIGURATION','gID=4','configuration','Y',4),('configIndexListing','BOX_CONFIGURATION_INDEX_LISTING','FILENAME_CONFIGURATION','gID=24','configuration','Y',23),('configLayoutSettings','BOX_CONFIGURATION_LAYOUT_SETTINGS','FILENAME_CONFIGURATION','gID=19','configuration','Y',18),('configLogging','BOX_CONFIGURATION_LOGGING','FILENAME_CONFIGURATION','gID=10','configuration','Y',9),('configMaximumValues','BOX_CONFIGURATION_MAXIMUM_VALUES','FILENAME_CONFIGURATION','gID=3','configuration','Y',3),('configMinimumValues','BOX_CONFIGURATION_MINIMUM_VALUES','FILENAME_CONFIGURATION','gID=2','configuration','Y',2),('configMyStore','BOX_CONFIGURATION_MY_STORE','FILENAME_CONFIGURATION','gID=1','configuration','Y',1),('configNewListing','BOX_CONFIGURATION_NEW_LISTING','FILENAME_CONFIGURATION','gID=21','configuration','Y',20),('configProductInfo','BOX_CONFIGURATION_PRODUCT_INFO','FILENAME_CONFIGURATION','gID=18','configuration','Y',17),('configProductListing','BOX_CONFIGURATION_PRODUCT_LISTING','FILENAME_CONFIGURATION','gID=8','configuration','Y',7),('configRegulations','BOX_CONFIGURATION_REGULATIONS','FILENAME_CONFIGURATION','gID=11','configuration','Y',14),('configSessions','BOX_CONFIGURATION_SESSIONS','FILENAME_CONFIGURATION','gID=15','configuration','Y',13),('configShipping','BOX_CONFIGURATION_SHIPPING_PACKAGING','FILENAME_CONFIGURATION','gID=7','configuration','Y',6),('configStock','BOX_CONFIGURATION_STOCK','FILENAME_CONFIGURATION','gID=9','configuration','Y',8),('configUltimateSEO','BOX_CONFIGURATION_ULTIMATE_SEO','FILENAME_CONFIGURATION','gID=33','configuration','Y',33),('configWebsiteMaintenance','BOX_CONFIGURATION_WEBSITE_MAINTENANCE','FILENAME_CONFIGURATION','gID=20','configuration','Y',19),('configZenLightbox','BOX_CONFIGURATION_ZEN_LIGHTBOX','FILENAME_CONFIGURATION','gID=32','configuration','Y',32),('countries','BOX_TAXES_COUNTRIES','FILENAME_COUNTRIES','','taxes','Y',1),('couponAdmin','BOX_COUPON_ADMIN','FILENAME_COUPON_ADMIN','','gv','Y',1),('couponRestrict','BOX_COUPON_RESTRICT','FILENAME_COUPON_RESTRICT','','gv','N',1),('currencies','BOX_LOCALIZATION_CURRENCIES','FILENAME_CURRENCIES','','localization','Y',1),('customers','BOX_CUSTOMERS_CUSTOMERS','FILENAME_CUSTOMERS','','customers','Y',1),('definePagesEditor','BOX_TOOLS_DEFINE_PAGES_EDITOR','FILENAME_DEFINE_PAGES_EDITOR','','tools','Y',12),('developersToolKit','BOX_TOOLS_DEVELOPERS_TOOL_KIT','FILENAME_DEVELOPERS_TOOL_KIT','','tools','Y',10),('downloads','BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER','FILENAME_DOWNLOADS_MANAGER','','catalog','Y',7),('easyPopulate','BOX_TOOLS_EASY_POPULATE','FILENAME_EASYPOPULATE','','tools','Y',14),('easyPopulateConfig','BOX_CONFIGURATION_EASY_POPULATE','FILENAME_CONFIGURATION','gID=31','configuration','Y',26),('emailArchive','BOX_TOOLS_EMAIL_ARCHIVE_MANAGER','FILENAME_EMAIL_HISTORY','','tools','Y',20),('ezpages','BOX_TOOLS_EZPAGES','FILENAME_EZPAGES_ADMIN','','tools','Y',11),('featured','BOX_CATALOG_FEATURED','FILENAME_FEATURED','','catalog','Y',13),('geoZones','BOX_TAXES_GEO_ZONES','FILENAME_GEO_ZONES','','taxes','Y',3),('groupPricing','BOX_CUSTOMERS_GROUP_PRICING','FILENAME_GROUP_PRICING','','customers','Y',3),('gvMail','BOX_GV_ADMIN_MAIL','FILENAME_GV_MAIL','','gv','Y',3),('gvQueue','BOX_GV_ADMIN_QUEUE','FILENAME_GV_QUEUE','','gv','Y',2),('gvSent','BOX_GV_ADMIN_SENT','FILENAME_GV_SENT','','gv','Y',4),('invoice','BOX_CUSTOMERS_INVOICE','FILENAME_ORDERS_INVOICE','','customers','N',5),('languages','BOX_LOCALIZATION_LANGUAGES','FILENAME_LANGUAGES','','localization','Y',2),('layoutController','BOX_TOOLS_LAYOUT_CONTROLLER','FILENAME_LAYOUT_CONTROLLER','','tools','Y',2),('linkpointReview','BOX_CUSTOMERS_LINKPOINT_REVIEW','FILENAME_LINKPOINT_REVIEW','','customers','Y',7),('mail','BOX_TOOLS_MAIL','FILENAME_MAIL','','tools','Y',4),('manufacturers','BOX_CATALOG_MANUFACTURERS','FILENAME_MANUFACTURERS','','catalog','Y',10),('mediaManager','BOX_CATALOG_MEDIA_MANAGER','FILENAME_MEDIA_MANAGER','','extras','Y',4),('mediaTypes','BOX_CATALOG_MEDIA_TYPES','FILENAME_MEDIA_TYPES','','extras','Y',5),('musicGenre','BOX_CATALOG_MUSIC_GENRE','FILENAME_MUSIC_GENRE','','extras','Y',3),('newsletters','BOX_TOOLS_NEWSLETTER_MANAGER','FILENAME_NEWSLETTERS','','tools','Y',5),('optionNames','BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER','FILENAME_OPTIONS_NAME_MANAGER','','catalog','Y',4),('optionNameSorter','BOX_CATALOG_PRODUCT_OPTIONS_NAME','FILENAME_PRODUCTS_OPTIONS_NAME','','catalog','Y',8),('optionValues','BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER','FILENAME_OPTIONS_VALUES_MANAGER','','catalog','Y',5),('optionValueSorter','BOX_CATALOG_PRODUCT_OPTIONS_VALUES','FILENAME_PRODUCTS_OPTIONS_VALUES','','catalog','Y',9),('orders','BOX_CUSTOMERS_ORDERS','FILENAME_ORDERS','','customers','Y',2),('ordersStatus','BOX_LOCALIZATION_ORDERS_STATUS','FILENAME_ORDERS_STATUS','','localization','Y',3),('orderTotal','BOX_MODULES_ORDER_TOTAL','FILENAME_MODULES','set=ordertotal','modules','Y',3),('packingslip','BOX_CUSTOMERS_PACKING_SLIP','FILENAME_ORDERS_PACKINGSLIP','','customers','N',6),('pageRegistration','BOX_ADMIN_ACCESS_PAGE_REGISTRATION','FILENAME_ADMIN_PAGE_REGISTRATION','','access','Y',3),('payment','BOX_MODULES_PAYMENT','FILENAME_MODULES','set=payment','modules','Y',1),('paypal','BOX_CUSTOMERS_PAYPAL','FILENAME_PAYPAL','','customers','Y',4),('priceManager','BOX_CATALOG_PRODUCTS_PRICE_MANAGER','FILENAME_PRODUCTS_PRICE_MANAGER','','catalog','Y',3),('product','BOX_CATALOG_PRODUCT','FILENAME_PRODUCT','','catalog','N',16),('productsExpected','BOX_CATALOG_PRODUCTS_EXPECTED','FILENAME_PRODUCTS_EXPECTED','','catalog','Y',15),('productsToCategories','BOX_CATALOG_PRODUCTS_TO_CATEGORIES','FILENAME_PRODUCTS_TO_CATEGORIES','','catalog','N',17),('productTypes','BOX_CATALOG_PRODUCT_TYPES','FILENAME_PRODUCT_TYPES','','catalog','Y',2),('profiles','BOX_ADMIN_ACCESS_PROFILES','FILENAME_PROFILES','','access','Y',1),('Quick Updates','BOX_CATALOG_QUICK_UPDATES','FILENAME_QUICK_UPDATES','','catalog','Y',103),('recordArtists','BOX_CATALOG_RECORD_ARTISTS','FILENAME_RECORD_ARTISTS','','extras','Y',1),('recordCompanies','BOX_CATALOG_RECORD_COMPANY','FILENAME_RECORD_COMPANY','','extras','Y',2),('reportCustomers','BOX_REPORTS_ORDERS_TOTAL','FILENAME_STATS_CUSTOMERS','','reports','Y',1),('reportLowStock','BOX_REPORTS_PRODUCTS_LOWSTOCK','FILENAME_STATS_PRODUCTS_LOWSTOCK','','reports','Y',3),('reportProductsSold','BOX_REPORTS_PRODUCTS_PURCHASED','FILENAME_STATS_PRODUCTS_PURCHASED','','reports','Y',4),('reportProductsViewed','BOX_REPORTS_PRODUCTS_VIEWED','FILENAME_STATS_PRODUCTS_VIEWED','','reports','Y',5),('reportReferrals','BOX_REPORTS_CUSTOMERS_REFERRALS','FILENAME_STATS_CUSTOMERS_REFERRALS','','reports','Y',2),('reviews','BOX_CATALOG_REVIEWS','FILENAME_REVIEWS','','catalog','Y',11),('salemaker','BOX_CATALOG_SALEMAKER','FILENAME_SALEMAKER','','catalog','Y',14),('server','BOX_TOOLS_SERVER_INFO','FILENAME_SERVER_INFO','','tools','Y',6),('shipping','BOX_MODULES_SHIPPING','FILENAME_MODULES','set=shipping','modules','Y',2),('specials','BOX_CATALOG_SPECIALS','FILENAME_SPECIALS','','catalog','Y',12),('sqlPatch','BOX_TOOLS_SQLPATCH','FILENAME_SQLPATCH','','tools','Y',13),('storeManager','BOX_TOOLS_STORE_MANAGER','FILENAME_STORE_MANAGER','','tools','Y',9),('taxClasses','BOX_TAXES_TAX_CLASSES','FILENAME_TAX_CLASSES','','taxes','Y',4),('taxRates','BOX_TAXES_TAX_RATES','FILENAME_TAX_RATES','','taxes','Y',5),('templateSelect','BOX_TOOLS_TEMPLATE_SELECT','FILENAME_TEMPLATE_SELECT','','tools','Y',1),('users','BOX_ADMIN_ACCESS_USERS','FILENAME_USERS','','access','Y',2),('whosOnline','BOX_TOOLS_WHOS_ONLINE','FILENAME_WHOS_ONLINE','','tools','Y',7),('zones','BOX_TAXES_ZONES','FILENAME_ZONES','','taxes','Y',2);
/*!40000 ALTER TABLE `cnadmin_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnadmin_pages_to_profiles`
--

DROP TABLE IF EXISTS `cnadmin_pages_to_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnadmin_pages_to_profiles` (
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `page_key` varchar(32) NOT NULL DEFAULT '',
  UNIQUE KEY `profile_page` (`profile_id`,`page_key`),
  UNIQUE KEY `page_profile` (`page_key`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnadmin_pages_to_profiles`
--

LOCK TABLES `cnadmin_pages_to_profiles` WRITE;
/*!40000 ALTER TABLE `cnadmin_pages_to_profiles` DISABLE KEYS */;
INSERT INTO `cnadmin_pages_to_profiles` (`profile_id`, `page_key`) VALUES (1,'easyPopulate');
/*!40000 ALTER TABLE `cnadmin_pages_to_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnadmin_profiles`
--

DROP TABLE IF EXISTS `cnadmin_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnadmin_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnadmin_profiles`
--

LOCK TABLES `cnadmin_profiles` WRITE;
/*!40000 ALTER TABLE `cnadmin_profiles` DISABLE KEYS */;
INSERT INTO `cnadmin_profiles` (`profile_id`, `profile_name`) VALUES (1,'Superuser');
/*!40000 ALTER TABLE `cnadmin_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnauthorizenet`
--

DROP TABLE IF EXISTS `cnauthorizenet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnauthorizenet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `response_code` int(1) NOT NULL DEFAULT '0',
  `response_text` varchar(255) NOT NULL DEFAULT '',
  `authorization_type` varchar(50) NOT NULL DEFAULT '',
  `transaction_id` bigint(20) DEFAULT NULL,
  `sent` longtext NOT NULL,
  `received` longtext NOT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnauthorizenet`
--

LOCK TABLES `cnauthorizenet` WRITE;
/*!40000 ALTER TABLE `cnauthorizenet` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnauthorizenet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnbanners`
--

DROP TABLE IF EXISTS `cnbanners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnbanners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) NOT NULL DEFAULT '',
  `banners_url` varchar(255) NOT NULL DEFAULT '',
  `banners_image` varchar(64) NOT NULL DEFAULT '',
  `banners_group` varchar(15) NOT NULL DEFAULT '',
  `banners_html_text` text,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `banners_open_new_windows` int(1) NOT NULL DEFAULT '1',
  `banners_on_ssl` int(1) NOT NULL DEFAULT '1',
  `banners_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banners_id`),
  KEY `idx_status_group_zen` (`status`,`banners_group`),
  KEY `idx_expires_date_zen` (`expires_date`),
  KEY `idx_date_scheduled_zen` (`date_scheduled`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnbanners`
--

LOCK TABLES `cnbanners` WRITE;
/*!40000 ALTER TABLE `cnbanners` DISABLE KEYS */;
INSERT INTO `cnbanners` (`banners_id`, `banners_title`, `banners_url`, `banners_image`, `banners_group`, `banners_html_text`, `expires_impressions`, `expires_date`, `date_scheduled`, `date_added`, `date_status_change`, `status`, `banners_open_new_windows`, `banners_on_ssl`, `banners_sort_order`) VALUES (1,'Zen Cart 中文社区','http://www.zen-cart.cn','banners/zencart_cn_logo.gif','Wide-Banners','',0,NULL,NULL,'2004-01-11 20:59:12',NULL,1,1,1,0),(2,'Zen Cart the art of e-commerce','http://www.zen-cart.com','banners/125zen_logo.gif','SideBox-Banners','',0,NULL,NULL,'2004-01-11 20:59:12',NULL,1,1,1,0),(3,'Zen Cart the art of e-commerce','http://www.zen-cart.com','banners/125x125_zen_logo.gif','SideBox-Banners','',0,NULL,NULL,'2004-01-11 20:59:12',NULL,1,1,1,0),(4,'还考虑什么? 现在就装一个吧!','http://www.zen-cart.com','banners/think_anim.gif','Wide-Banners','',0,NULL,NULL,'2004-01-12 20:53:18',NULL,1,1,1,0),(5,'Zen Cart the art of e-commerce','http://www.zen-cart.com','banners/bw_zen_88wide.gif','BannersAll','',0,NULL,NULL,'2005-05-13 10:54:38',NULL,1,1,1,10),(6,'立即注册PayPal并开始接受信用卡付款!','https://www.paypal.com/c2/mrb/pal=GR5QUVVL9AFGN&MRB=R-4DM17246PS436904F','banners/cardsvcs_468x60.gif','Wide-Banners','',0,NULL,NULL,'2006-03-13 11:02:43',NULL,1,1,1,0),(7,'eStart Your Web Store with Zen Cart(R)','http://www.zen-cart.com/book','banners/big-book-ad.gif','Wide-Banners','',0,NULL,NULL,'2007-02-10 00:00:00',NULL,1,1,1,1),(8,'eStart Your Web Store with Zen Cart(R)','http://www.zen-cart.com/book','banners/tall-book.gif','SideBox-Banners','',0,NULL,NULL,'2007-02-10 00:00:00',NULL,1,1,1,1),(9,'Zen Cart 中文社区','http://www.zen-cart.cn','banners/logo-zencart-cn-125.gif','BannersAll','',0,NULL,NULL,'2005-12-10 00:00:00',NULL,1,1,1,15);
/*!40000 ALTER TABLE `cnbanners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnbanners_history`
--

DROP TABLE IF EXISTS `cnbanners_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnbanners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL DEFAULT '0',
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_id_zen` (`banners_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnbanners_history`
--

LOCK TABLES `cnbanners_history` WRITE;
/*!40000 ALTER TABLE `cnbanners_history` DISABLE KEYS */;
INSERT INTO `cnbanners_history` (`banners_history_id`, `banners_id`, `banners_shown`, `banners_clicked`, `banners_history_date`) VALUES (1,3,1,0,'2013-05-08 21:58:00'),(2,5,1,0,'2013-05-08 21:58:01'),(3,9,1,0,'2013-05-08 21:58:01');
/*!40000 ALTER TABLE `cnbanners_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncategories`
--

DROP TABLE IF EXISTS `cncategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncategories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(64) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`categories_id`),
  KEY `idx_parent_id_cat_id_zen` (`parent_id`,`categories_id`),
  KEY `idx_status_zen` (`categories_status`),
  KEY `idx_sort_order_zen` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncategories`
--

LOCK TABLES `cncategories` WRITE;
/*!40000 ALTER TABLE `cncategories` DISABLE KEYS */;
INSERT INTO `cncategories` (`categories_id`, `categories_image`, `parent_id`, `sort_order`, `date_added`, `last_modified`, `categories_status`) VALUES (1,'categories/category_hardware.gif',0,1,'2003-12-23 03:18:19','2004-05-21 00:32:17',1),(2,'categories/category_software.gif',0,2,'2003-12-23 03:18:19','2004-05-22 21:14:57',1),(3,'categories/category_dvd_movies.gif',0,3,'2003-12-23 03:18:19','2004-05-21 00:22:39',1),(4,'categories/subcategory_graphic_cards.gif',1,0,'2003-12-23 03:18:19',NULL,1),(5,'categories/subcategory_printers.gif',1,0,'2003-12-23 03:18:19',NULL,1),(6,'categories/subcategory_monitors.gif',1,0,'2003-12-23 03:18:19',NULL,1),(7,'categories/subcategory_speakers.gif',1,0,'2003-12-23 03:18:19',NULL,1),(8,'categories/subcategory_keyboards.gif',1,0,'2003-12-23 03:18:19',NULL,1),(9,'categories/subcategory_mice.gif',1,0,'2003-12-23 03:18:19','2004-05-21 00:34:10',1),(10,'categories/subcategory_action.gif',3,0,'2003-12-23 03:18:19','2004-05-21 00:39:17',1),(11,'categories/subcategory_science_fiction.gif',3,0,'2003-12-23 03:18:19',NULL,1),(12,'categories/subcategory_comedy.gif',3,0,'2003-12-23 03:18:19',NULL,1),(13,'categories/subcategory_cartoons.gif',3,0,'2003-12-23 03:18:19','2004-05-21 00:23:13',1),(14,'categories/subcategory_thriller.gif',3,0,'2003-12-23 03:18:19',NULL,1),(15,'categories/subcategory_drama.gif',3,0,'2003-12-23 03:18:19',NULL,1),(16,'categories/subcategory_memory.gif',1,0,'2003-12-23 03:18:19',NULL,1),(17,'categories/subcategory_cdrom_drives.gif',1,0,'2003-12-23 03:18:19',NULL,1),(18,'categories/subcategory_simulation.gif',2,0,'2003-12-23 03:18:19',NULL,1),(19,'categories/subcategory_action_games.gif',2,0,'2003-12-23 03:18:19',NULL,1),(20,'categories/subcategory_strategy.gif',2,0,'2003-12-23 03:18:19',NULL,1),(21,'categories/gv_25.gif',0,4,'2003-12-23 03:18:19','2004-05-21 00:26:06',1),(22,'categories/box_of_color.gif',0,5,'2003-12-23 03:18:19','2004-05-21 00:28:43',1),(23,'waybkgnd.gif',0,500,'2003-12-28 02:26:19','2003-12-29 23:21:35',1),(24,'categories/category_free.gif',0,600,'2003-12-28 11:48:46','2004-01-02 19:13:45',1),(25,'sample_image.gif',0,515,'2003-12-31 02:39:17','2004-01-24 01:49:12',1),(27,'sample_image.gif',49,10,'2004-01-04 14:13:08','2004-01-24 16:16:23',1),(28,'sample_image.gif',0,510,'2004-01-04 17:13:47','2004-01-05 23:54:23',1),(31,'sample_image.gif',48,30,'2004-01-04 23:16:46','2004-01-24 01:48:29',1),(32,'sample_image.gif',48,40,'2004-01-05 01:34:56','2004-01-24 01:48:36',1),(33,'categories/subcategory.gif',0,700,'2004-01-05 02:08:31','2004-05-20 10:35:31',1),(34,'categories/subcategory.gif',33,10,'2004-01-05 02:08:50','2004-05-20 10:35:57',1),(35,'categories/subcategory.gif',33,20,'2004-01-05 02:09:01','2004-01-24 00:07:33',1),(36,'categories/subcategory.gif',33,30,'2004-01-05 02:09:12','2004-01-24 00:07:41',1),(37,'categories/subcategory.gif',35,10,'2004-01-05 02:09:28','2004-01-24 00:22:39',1),(38,'categories/subcategory.gif',35,20,'2004-01-05 02:09:39','2004-01-24 00:22:46',1),(39,'categories/subcategory.gif',35,30,'2004-01-05 02:09:49','2004-01-24 00:22:53',1),(40,'categories/subcategory.gif',34,10,'2004-01-05 02:17:27','2004-05-20 10:36:19',1),(41,'categories/subcategory.gif',36,10,'2004-01-05 02:21:02','2004-01-24 00:23:04',1),(42,'categories/subcategory.gif',36,30,'2004-01-05 02:21:14','2004-01-24 00:23:18',1),(43,'categories/subcategory.gif',34,20,'2004-01-05 02:21:29','2004-01-24 00:21:37',1),(44,'categories/subcategory.gif',36,20,'2004-01-05 02:21:47','2004-01-24 00:23:11',1),(45,'sample_image.gif',48,10,'2004-01-05 23:54:56','2004-01-24 01:48:22',1),(46,'sample_image.gif',50,10,'2004-01-06 00:01:48','2004-01-24 01:39:56',1),(47,'sample_image.gif',48,20,'2004-01-06 03:09:57','2004-01-24 01:48:05',1),(48,'sample_image.gif',0,1000,'2004-01-07 02:24:07','2004-01-07 02:44:26',1),(49,'sample_image.gif',0,1100,'2004-01-07 02:27:31','2004-01-07 02:44:34',1),(50,'sample_image.gif',0,1200,'2004-01-07 02:28:18','2004-01-07 02:47:19',1),(51,'sample_image.gif',50,20,'2004-01-07 02:33:55','2004-01-24 01:40:05',1),(52,'sample_image.gif',49,20,'2004-01-24 16:09:35','2004-01-24 16:16:33',1),(53,'categories/subcategory.gif',0,1500,'2004-04-25 23:07:41',NULL,1),(54,'categories/subcategory.gif',0,1510,'2004-04-26 12:02:35','2004-05-20 11:45:20',1),(55,'categories/subcategory.gif',54,0,'2004-04-28 01:48:47','2004-05-20 11:45:51',1),(56,'categories/subcategory.gif',54,0,'2004-04-28 01:49:16','2004-04-28 01:53:14',1),(57,'categories/subcategory.gif',54,0,'2004-05-01 01:29:13',NULL,1),(58,'categories/subcategory.gif',54,110,'2004-05-02 12:35:02','2004-05-18 10:46:13',1),(60,'categories/subcategory.gif',54,0,'2004-05-02 23:45:21',NULL,1),(61,'categories/subcategory.gif',54,100,'2004-05-18 10:13:46','2004-05-18 10:46:02',1),(62,'sample_image.gif',0,1520,'2003-12-23 03:18:19','2004-05-22 21:14:57',1),(63,'categories/subcategory.gif',0,1530,'2003-12-23 03:18:19','2004-07-12 17:45:24',1),(64,'categories/subcategory.gif',0,1550,'2004-07-12 15:22:27',NULL,1),(65,NULL,0,100,'2013-05-11 01:19:34',NULL,1);
/*!40000 ALTER TABLE `cncategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncategories_description`
--

DROP TABLE IF EXISTS `cncategories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncategories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL DEFAULT '',
  `categories_description` text NOT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name_zen` (`categories_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncategories_description`
--

LOCK TABLES `cncategories_description` WRITE;
/*!40000 ALTER TABLE `cncategories_description` DISABLE KEYS */;
INSERT INTO `cncategories_description` (`categories_id`, `language_id`, `categories_name`, `categories_description`) VALUES (1,1,'Hardware','We offer a variety of Hardware from printers to graphics cards and mice to keyboards.'),(1,2,'硬件','我们提供各种各样的硬件，从打印机到显卡、鼠标、键盘等。'),(2,1,'Software','Select from an exciting list of software titles. <br /><br />Not seeing a title that you are looking for?'),(2,2,'软件','选择各款软件。<br /><br />没看到您想要的吗?'),(3,1,'DVD Movies','We offer a variety of DVD movies enjoyable for the whole family.<br /><br />Please browse the various categories to find your favorite movie today!'),(3,2,'影视','我们提供各种DVD电影，老少皆宜。<br /><br />请查看分类目录。'),(4,1,'Graphics Cards',''),(4,2,'显卡',''),(5,1,'Printers',''),(5,2,'打印机',''),(6,1,'Monitors',''),(6,2,'显示器',''),(7,1,'Speakers',''),(7,2,'音箱',''),(8,1,'Keyboards',''),(8,2,'键盘',''),(9,1,'Mice','Pick the right mouse for your individual computer needs!<br /><br />Contact Us if you are looking for a particular mouse that we do not currently have in stock.'),(9,2,'鼠标','选择适合您的鼠标!<br /><br />如果您没有找到想要的鼠标，请联系我们。'),(10,1,'Action','<p>Get into the action with our Action collection of DVD movies!<br /><br />Don\'t miss the excitement and order your\'s today!<br /><br /></p>'),(10,2,'动作','<p>动作大片！<br /><br />不要错过精彩片断，现在就购买！<br /><br /></p>'),(11,1,'Science Fiction',''),(11,2,'科幻',''),(12,1,'Comedy',''),(12,2,'喜剧',''),(13,1,'Cartoons','Something you can enjoy with children of all ages!'),(13,2,'卡通','适于各年龄段的儿童!'),(14,1,'Thriller',''),(14,2,'惊险',''),(15,1,'Drama',''),(15,2,'戏剧',''),(16,1,'Memory',''),(16,2,'内存',''),(17,1,'CDROM Drives',''),(17,2,'光驱',''),(18,1,'Simulation',''),(18,2,'模拟',''),(19,1,'Action',''),(19,2,'动作',''),(20,1,'Strategy',''),(20,2,'策略',''),(21,1,'Gift Certificates','Send a Gift Certificate today!<br /><br />Gift Certificates are good for anything in the store.'),(21,2,'礼券','现在就发送礼券!<br /><br />礼券适用于商店内的任何商品。'),(22,1,'Big Linked','All of these products are &quot;Linked Products&quot;.<br /><br />This means that they appear in more than one Category.<br /><br />However, you only have to maintain the product in one place.<br /><br />The Master Product is used for pricing purposes.'),(22,2,'链接商品','所有这些商品都是&quot;链接&quot;商品。<br /><br />表明他们出现在不止一个分类中。<br /><br />但您只要在一个地方进行维护。<br /><br />主商品用于定价。'),(23,1,'Test Examples',''),(23,2,'测试样品',''),(24,1,'Free Call Stuff',''),(24,2,'免费赠品',''),(25,1,'Test 10% by Attrib',''),(25,2,'属性九折测试',''),(27,1,'$5.00 off',''),(27,2,'优惠5元',''),(28,1,'Test 10%',''),(28,2,'九折测试',''),(31,1,'10% off Skip',''),(31,2,'忽略九折',''),(32,1,'10% off Price',''),(32,2,'原价九折',''),(33,1,'A Top Level Cat','<p>This is a top level category description.</p>'),(33,2,'总分类','<p>总分类的说明。</p>'),(34,1,'SubLevel 2 A','This is a sublevel category description.'),(34,2,'子分类 2A','子分类2A的说明。'),(35,1,'SubLevel 2 B',''),(35,2,'子分类 2B','子分类2B的说明。'),(36,1,'SubLevel 2 C',''),(36,2,'子分类 2C','子分类2C的说明。'),(37,1,'Sub Sub Cat 2B1',''),(37,2,'子分类 2B1','子分类2B1的说明。'),(38,1,'Sub Sub Cat 2B2',''),(38,2,'子分类 2B2','子分类2B2的说明。'),(39,1,'Sub Sub Cat 2B3',''),(39,2,'子分类 2B3','子分类2B3的说明。'),(40,1,'Sub Sub Cat 2A1','This is a sub-sub level category description.'),(40,2,'子分类 2A1','子分类2A1的说明。'),(41,1,'Sub Sub Cat 2C1',''),(41,2,'子分类 2C1','子分类2C1的说明。'),(42,1,'Sub Sub Cat 2C3',''),(42,2,'子分类 2C3','子分类2C3的说明。'),(43,1,'Sub Sub Cat 2A2',''),(43,2,'子分类 2A2','子分类2A2的说明。'),(44,1,'Sub Sub Cat 2C2',''),(44,2,'子分类 2C2','子分类2C2的说明。'),(45,1,'10% off',''),(45,2,'九折',''),(46,1,'Set $100',''),(46,2,'促销价100元',''),(47,1,'10% off Attrib',''),(47,2,'属性九折',''),(48,1,'Sale Percentage',''),(48,2,'促销商品',''),(49,1,'Sale Deduction',''),(49,2,'减价商品',''),(50,1,'Sale New Price',''),(50,2,'促销价格',''),(51,1,'Set $100 Skip',''),(51,2,'促销价100元无条件',''),(52,1,'$5.00 off Skip',''),(52,2,'优惠5元 无条件',''),(53,1,'Big Unlinked',''),(53,2,'无链接商品',''),(54,1,'New v1.2','<p>The New Products show many of the newest features that have been added to Zen Cart.<br /><br />Take the time to review these and the other Demo Products to better understand all the options and features that Zen Cart has to offer.</p>'),(54,2,'新特性商品','<p>新商品演示了Zen Cart新增的很多功能。<br /><br />花点时间看看演示商品，更好地了解Zen Cart提供的所有选项和功能。</p>'),(55,1,'Discount Qty','<p>Discount Quantities can be set for Products or on the individual attributes.<br /><br />Discounts on the Product do NOT reflect on the attributes price.<br /><br />Only discounts based on Special and Sale Prices are applied to attribute prices.</p>'),(55,2,'批量优惠','<p>批量优惠可以应用在商品或单个属性上。<br /><br />用于商品的优惠不影响属性价格。<br /><br />仅特价和促销的优惠应用于属性价格。</p>'),(56,1,'Attributes',''),(56,2,'属性',''),(57,1,'Text Pricing',''),(57,2,'文字价格',''),(58,1,'Real Sale',''),(58,2,'销售',''),(60,1,'Downloads',''),(60,2,'下载',''),(61,1,'Real',''),(61,2,'实物',''),(62,1,'Music',''),(62,2,'音乐',''),(63,1,'Documents','Documents can now be added to the category tree. For example you may want to add servicing/Technical documents. Or use Documents as an integrated FAQ system on your site. The implemetation here is fairly spartan, but could be expanded to offer PDF downloads, links to purchaseable download files. The possibilities are endless and left to your imagination.'),(63,2,'文档','现在可以添加文档到分类目录。例如，增加服务/技术文档，或用作集成常见问答栏目。结构很简单，但可以扩展为提供PDF下载、链接到购买下载文件，用途非常广泛。'),(64,1,'Mixed Product Types','This is a category with mixed product types.\r\n\r\nThis includes both products and documents. There are two types of documents - Documents that are for reading and Documents that are for reading and purchasing.'),(64,2,'混合商品类型','本分类含不同类型的商品。\r\n\r\n包含普通商品和文档商品。两种类型的文档 - 供阅读的文档和可阅读并购买的文档。'),(65,1,'Cloth','Cloth'),(65,2,'衣服','衣服');
/*!40000 ALTER TABLE `cncategories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnconfiguration`
--

DROP TABLE IF EXISTS `cnconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnconfiguration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `configuration_group_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_cfg_grp_id_zen` (`configuration_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnconfiguration`
--

LOCK TABLES `cnconfiguration` WRITE;
/*!40000 ALTER TABLE `cnconfiguration` DISABLE KEYS */;
INSERT INTO `cnconfiguration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES (1,'商店名称','STORE_NAME','huashop','商店名称',1,1,NULL,'2013-05-08 21:35:05',NULL,NULL),(2,'店主','STORE_OWNER','cloudwei','店主的名字',1,2,NULL,'2013-05-08 21:35:05',NULL,NULL),(3,'客服电话','STORE_TELEPHONE_CUSTSERVICE','','请输入客服电话，可能用于支付处理。',1,3,NULL,'2013-05-08 21:35:05',NULL,NULL),(4,'国家或地区','STORE_COUNTRY','44','商店所在的国家或地区 <br /><br /><strong>备注: 请记住更新商店所在地区。</strong>',1,6,NULL,'2013-05-08 21:35:05','zen_get_country_name','zen_cfg_pull_down_country_list('),(5,'地区','STORE_ZONE','135','商店所在地区',1,7,NULL,'2013-05-08 21:35:05','zen_cfg_get_zone_name','zen_cfg_pull_down_zone_list('),(6,'预售商品排序','EXPECTED_PRODUCTS_SORT','desc','预售商品方框的排序.',1,8,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'asc\', \'desc\'), '),(7,'预售商品排序字段','EXPECTED_PRODUCTS_FIELD','date_expected','预售商品方框的排序字段.',1,9,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'products_name\', \'date_expected\'), '),(8,'使用缺省语言货币','USE_DEFAULT_LANGUAGE_CURRENCY','true','自动转换到选择语言的相应货币',1,10,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(9,'语言选择','LANGUAGE_DEFAULT_SELECTOR','Default','商店缺省的语言选择为商店的设置，还是用户浏览器中的设置？<br /><br />Default: 商店的缺省设置',1,11,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'Default\', \'Browser\'), '),(10,'使用搜索引擎友好的URLs (还在开发中)','SEARCH_ENGINE_FRIENDLY_URLS','false','Use search-engine safe urls for all site links',6,12,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(11,'添加商品后显示购物车','DISPLAY_CART','true','添加商品后显示购物车 (或退回原来的状态)',1,14,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(12,'缺省搜索操作','ADVANCED_SEARCH_DEFAULT_OPERATOR','and','缺省搜索操作',1,17,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'and\', \'or\'), '),(13,'商店地址和电话','STORE_NAME_ADDRESS','huashop\r\n 深圳市南山区\r\n 中国\r\n 13691805594','商店名称, 地址和电话号码, 用于打印文件和在线显示',1,7,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_textarea('),(14,'显示分类计数','SHOW_COUNTS','false','递归计算分类中商品数量',1,19,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(15,'税收小数位','TAX_DECIMAL_PLACES','0','税收金额的小数位',1,20,NULL,'2013-05-08 21:35:05',NULL,NULL),(16,'显示含税价格','DISPLAY_PRICE_WITH_TAX','false','显示含税价格 (True) 或 最后再加税 (False)',1,21,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(17,'在管理页面中显示含税价格','DISPLAY_PRICE_WITH_TAX_ADMIN','false','在管理页面中(发票), 显示含税价格 (True) 或 最后再加税 (False)',1,21,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(18,'商品税的计算','STORE_PRODUCT_TAX_BASIS','Shipping','计算商品税的基准. 选项为<br />Shipping - 基于送货地址<br />Billing 基于客户帐单地址<br />Store - 如果Billing/Shipping地区和商店所在地区相同, 采用商店的地址',1,21,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), '),(19,'运费税的计算','STORE_SHIPPING_TAX_BASIS','Shipping','计算运费税的基准. 选项为<br />Shipping - 基于送货地址<br />Billing 基于客户帐单地址<br />Store - 如果Billing/Shipping地区和商店所在地区相同, 采用商店的地址 - 货运模块可以覆盖该设置',1,21,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), '),(20,'销售税显示','STORE_TAX_DISPLAY_STATUS','0','即使金额为零也显示销售税<br />0= 否<br />1= 是',1,21,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(21,'分开显示税项','SHOW_SPLIT_TAX_CHECKOUT','false','如果有多个税项，结帐时每个税项单独显示一行',1,22,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(22,'管理对话超时秒数','SESSION_TIMEOUT_ADMIN','900','输入以秒为单位的时间。<br />PCI 兼容要求最大不超过 900 。<br /> 默认=900<br />例如: 900= 15 分钟<br /><br />备注: 时间太短会导致添加/编辑商品时超时',1,40,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'900\', \'600\', \'300\'), '),(23,'管理设置最大进程执行时间','GLOBAL_SET_TIME_LIMIT','60','输入以秒为单位的时间, 管理设置最大进程执行时间。<br />缺省=60 秒<br />例如: 60= 1 分钟<br /><br />备注: 仅当您进程执行时间有问题时, 才需要修改该时间限制',1,42,NULL,'2013-05-08 21:35:05',NULL,NULL),(24,'显示是否有新版本','SHOW_VERSION_UPDATE_IN_HEADER','false','自动显示是否有Zen Cart新版本。打开该选项有时会降低管理页面打开时间。(显示于登录后的主索引页面和服务器信息页面)',1,44,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(25,'商店模式','STORE_STATUS','0','商店模式<br />0= 正常<br />1= 商品展示, 不显示价格<br />2= 商品展示, 显示价格',1,25,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(26,'服务器运行时数','DISPLAY_SERVER_UPTIME','true','显示服务器运行时数在某些服务器上会导致日志文件中有错误记录。(true = 显示, false = 不显示)',1,46,'2003-11-08 20:24:47','0001-01-01 00:00:00','','zen_cfg_select_option(array(\'true\', \'false\'),'),(27,'丢失页面检测','MISSING_PAGE_CHECK','Page Not Found','Zen Cart能够检测不存在的页面并自动调转到索引页面。调试时可关闭该选项。<br /><br /><strong>缺省=On</strong><br />On = 如有不存在的页面，调整到\'index\'<br />Off = 不检测不存在的页面<br />Page Not Found = 显示页面不存在的提示页面',1,48,'2003-11-08 20:24:47','0001-01-01 00:00:00','','zen_cfg_select_option(array(\'On\', \'Off\', \'Page Not Found\'),'),(28,'cURL代理服务器状态','CURL_PROXY_REQUIRED','False','您的cURL是否使用代理服务器?',6,50,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(29,'cURL代理服务器地址','CURL_PROXY_SERVER_DETAILS','','如果您的主机需要通过cURL使用代理服务器，在这里输入地址。<br />格式: 地址:端口<br />例如: 127.0.0.1:3128',6,51,NULL,'2013-05-08 21:35:05',NULL,NULL),(30,'HTML编辑器','HTML_EDITOR_PREFERENCE','NONE','请选择用于管理电子邮件、电子商情和商品简介的文本编辑器。',1,110,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_pull_down_htmleditors('),(31,'打开phpBB链接?','PHPBB_LINKS_ENABLED','false','Zen Cart的新帐号要和您的(已安装)phpBB论坛同步吗?',1,120,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(32,'显示分类计数 - 管理员','SHOW_COUNTS_ADMIN','true','在管理页面显示分类计数吗?',1,19,NULL,'2013-05-08 21:35:05',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(33,'货币兑换比率','CURRENCY_UPLIFT_RATIO','1.05','自动更新汇率时，需要使用的\"额外\"比率是多少？<br />例如: 从汇率服务器更新银行汇率后，您要在银行汇率基础上增加多少比例来设置给客户的汇率？<br /><br /><strong>缺省: 1.05 </strong><br />将公布的银行汇率乘以1.05作为商店的汇率。',1,55,NULL,'2013-05-08 21:35:05',NULL,NULL),(34,'名字','ENTRY_FIRST_NAME_MIN_LENGTH','1','名字最少字数',2,1,NULL,'2013-05-08 21:35:05',NULL,NULL),(35,'姓氏','ENTRY_LAST_NAME_MIN_LENGTH','1','姓氏最少字数',2,2,NULL,'2013-05-08 21:35:05',NULL,NULL),(36,'生日','ENTRY_DOB_MIN_LENGTH','10','生日最少字数',2,3,NULL,'2013-05-08 21:35:05',NULL,NULL),(37,'电子邮件','ENTRY_EMAIL_ADDRESS_MIN_LENGTH','6','电子邮件地址最少字数',2,4,NULL,'2013-05-08 21:35:05',NULL,NULL),(38,'地址','ENTRY_STREET_ADDRESS_MIN_LENGTH','4','地址最少字数',2,5,NULL,'2013-05-08 21:35:05',NULL,NULL),(39,'公司','ENTRY_COMPANY_MIN_LENGTH','0','公司名称最少字数',2,6,NULL,'2013-05-08 21:35:05',NULL,NULL),(40,'邮编','ENTRY_POSTCODE_MIN_LENGTH','4','邮编最少字数',2,7,NULL,'2013-05-08 21:35:05',NULL,NULL),(41,'城市','ENTRY_CITY_MIN_LENGTH','2','城市最少字数',2,8,NULL,'2013-05-08 21:35:05',NULL,NULL),(42,'省份','ENTRY_STATE_MIN_LENGTH','2','省份最少字数',2,9,NULL,'2013-05-08 21:35:06',NULL,NULL),(43,'电话号码','ENTRY_TELEPHONE_MIN_LENGTH','6','电话号码最少字数',2,10,NULL,'2013-05-08 21:35:06',NULL,NULL),(44,'密码','ENTRY_PASSWORD_MIN_LENGTH','7','密码最少字数',2,11,NULL,'2013-05-08 21:35:06',NULL,NULL),(45,'信用卡持卡人姓名','CC_OWNER_MIN_LENGTH','2','信用卡持卡人姓名最少字数',2,12,NULL,'2013-05-08 21:35:06',NULL,NULL),(46,'信用卡号','CC_NUMBER_MIN_LENGTH','10','信用卡号码最少字数',2,13,NULL,'2013-05-08 21:35:06',NULL,NULL),(47,'信用卡CVV校验码','CC_CVV_MIN_LENGTH','3','信用卡CVV校验码最少字数',2,13,NULL,'2013-05-08 21:35:06',NULL,NULL),(48,'商品评论文字','REVIEW_TEXT_MIN_LENGTH','1','商品评论文字最少字数',2,14,NULL,'2013-05-08 21:35:06',NULL,NULL),(49,'畅销商品','MIN_DISPLAY_BESTSELLERS','1','成为畅销商品的最小销售数量',2,15,NULL,'2013-05-08 21:35:06',NULL,NULL),(50,'同时购买商品','MIN_DISPLAY_ALSO_PURCHASED','1','显示为客户同时购买商品的最少数量',2,16,NULL,'2013-05-08 21:35:06',NULL,NULL),(51,'昵称','ENTRY_NICK_MIN_LENGTH','1','昵称最少字数',2,1,NULL,'2013-05-08 21:35:06',NULL,NULL),(52,'地址簿条目','MAX_ADDRESS_BOOK_ENTRIES','5','每个客户地址簿中最多允许的条目',3,1,NULL,'2013-05-08 21:35:06',NULL,NULL),(53,'管理页面每页搜索结果','MAX_DISPLAY_SEARCH_RESULTS','20','管理页面搜索结果的商品数量',3,2,NULL,'2013-05-08 21:35:06',NULL,NULL),(54,'前/后页导航页链接','MAX_DISPLAY_PAGE_LINKS','5','导航链接显示的数目的数量',3,3,NULL,'2013-05-08 21:35:06',NULL,NULL),(55,'首页新进商品数量','MAX_DISPLAY_NEW_PRODUCTS','9','显示在首页的新进商品数量',3,4,NULL,'2013-05-08 21:35:06',NULL,NULL),(56,'首页推荐商品数量','MAX_DISPLAY_SEARCH_RESULTS_FEATURED','9','显示在首页的推荐商品数量',3,5,NULL,'2013-05-08 21:35:06',NULL,NULL),(57,'首页特价商品数量','MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX','10','显示在首页的特价商品数量',3,6,NULL,'2013-05-08 21:35:06',NULL,NULL),(58,'预售商品数量','MAX_DISPLAY_UPCOMING_PRODUCTS','10','显示的预售商品数量',3,7,NULL,'2013-05-08 21:35:06',NULL,NULL),(59,'特价商品列表数量','MAX_DISPLAY_SPECIAL_PRODUCTS','6','特价商品列表每页显示的商品数量',3,8,NULL,'2013-05-08 21:35:06',NULL,NULL),(60,'新进商品列表数量','MAX_DISPLAY_PRODUCTS_NEW','10','新进商品列表每页显示的商品数量',3,9,NULL,'2013-05-08 21:35:06',NULL,NULL),(61,'推荐商品列表数量','MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS','10','推荐商品列表每页显示的商品数量',3,29,NULL,'2013-05-08 21:35:06',NULL,NULL),(62,'所有商品列表数量','MAX_DISPLAY_PRODUCTS_ALL','10','所有商品列表每页显示的商品数量',3,11,NULL,'2013-05-08 21:35:06',NULL,NULL),(63,'分类商品列表数量','MAX_DISPLAY_PRODUCTS_LISTING','10','分类商品列表每页显示的商品数量',3,12,NULL,'2013-05-08 21:35:06',NULL,NULL),(64,'畅销商品数量','MAX_DISPLAY_BESTSELLERS','10','畅销商品数量',3,13,NULL,'2013-05-08 21:35:06',NULL,NULL),(65,'同时购买商品数量','MAX_DISPLAY_ALSO_PURCHASED','6','\'客户同时购买的商品\'方框中显示的商品数量',3,14,NULL,'2013-05-08 21:35:06',NULL,NULL),(66,'边框中随机推荐商品数量','MAX_RANDOM_SELECT_FEATURED_PRODUCTS','2','在边框中显示的随机推荐商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?',3,15,NULL,'2013-05-08 21:35:06',NULL,NULL),(67,'边框中随机新进商品数量','MAX_RANDOM_SELECT_NEW','3','在边框中显示的随机新进商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?',3,16,NULL,'2013-05-08 21:35:06',NULL,NULL),(68,'边框中随机特价商品数量','MAX_RANDOM_SELECT_SPECIALS','2','在边框中显示的随机特价商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?',3,17,NULL,'2013-05-08 21:35:06',NULL,NULL),(69,'边框中随机商品评论数量','MAX_RANDOM_SELECT_REVIEWS','1','在边框中显示的随机商品评论的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?',3,18,NULL,'2013-05-08 21:35:06',NULL,NULL),(70,'每页商品评论数量','MAX_DISPLAY_NEW_REVIEWS','6','每页显示的商品评论数量',3,19,NULL,'2013-05-08 21:35:06',NULL,NULL),(71,'厂商列表 - 滚动栏大小/样式','MAX_MANUFACTURERS_LIST','3','滚动栏窗口里显示的厂商数目。如果设为1或0显示下拉菜单',3,20,NULL,'2013-05-08 21:35:06',NULL,NULL),(72,'厂商列表 - 检验商品存在','PRODUCTS_MANUFACTURERS_STATUS','1','要显示厂商名字，保证至少存在一个有效商品<br /><br />提示: 当该开关为开启时，如果有很多商品或厂商，会影响网站速度<br />0= 关 1= 开',3,21,NULL,'2013-05-08 21:35:06',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(73,'音乐类型列表 - 滚动栏大小/样式','MAX_MUSIC_GENRES_LIST','3','滚动栏窗口里显示的音乐类型数目. 如果设为1或0会显示下拉菜单。',3,22,NULL,'2013-05-08 21:35:06',NULL,NULL),(74,'唱片公司列表 - 滚动栏大小/样式','MAX_RECORD_COMPANY_LIST','3','滚动栏窗口里显示的唱片公司数目. 如果设为1或0会显示下拉菜单。',3,23,NULL,'2013-05-08 21:35:06',NULL,NULL),(75,'唱片公司名称长度','MAX_DISPLAY_RECORD_COMPANY_NAME_LEN','15','用于唱片公司栏; 唱片公司名称显示的最大长度. 太长的名字会被截断.',3,24,NULL,'2013-05-08 21:35:06',NULL,NULL),(76,'音乐类型名称长度','MAX_DISPLAY_MUSIC_GENRES_NAME_LEN','15','用于音乐类型栏; 音乐类型名称显示的最大长度. 太长的名字会被截断.',3,25,NULL,'2013-05-08 21:35:06',NULL,NULL),(77,'厂商名字长度','MAX_DISPLAY_MANUFACTURER_NAME_LEN','15','用于厂商栏; 厂商名字显示的最大长度. 太长的名字会被截断.',3,26,NULL,'2013-05-08 21:35:06',NULL,NULL),(78,'每行分类数目','MAX_DISPLAY_CATEGORIES_PER_ROW','3','每行分类数目',3,27,NULL,'2013-05-08 21:35:06',NULL,NULL),(79,'最近购买边框- 备注: 边框已关闭','MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX','6','最近购买边框中显示的商品数量',3,28,NULL,'2013-05-08 21:35:06',NULL,NULL),(80,'每页显示的客户订单数','MAX_DISPLAY_ORDER_HISTORY','10','\'我的帐号\'订单历史中显示的订单数目',3,29,NULL,'2013-05-08 21:35:06',NULL,NULL),(81,'客户页显示最大客户数','MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER','20','',3,30,NULL,'2013-05-08 21:35:06',NULL,NULL),(82,'订单页显示最大订单数','MAX_DISPLAY_SEARCH_RESULTS_ORDERS','20','',3,31,NULL,'2013-05-08 21:35:06',NULL,NULL),(83,'分析系统页面显示的商品数','MAX_DISPLAY_SEARCH_RESULTS_REPORTS','20','',3,32,NULL,'2013-05-08 21:35:06',NULL,NULL),(84,'最大分类商品显示列表','MAX_DISPLAY_RESULTS_CATEGORIES','10','每页显示的商品数目',3,33,NULL,'2013-05-08 21:35:06',NULL,NULL),(85,'商品属性 - 选项名称和值的显示','MAX_ROW_LISTS_OPTIONS','10','显示在商品属性页面的选项名称和值的数量',3,34,NULL,'2013-05-08 21:35:07',NULL,NULL),(86,'商品属性 - 属性数量的显示','MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER','30','显示在商品属性控制页面的属性数量',3,35,NULL,'2013-05-08 21:35:07',NULL,NULL),(87,'商品属性 - 下载管理显示','MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER','30','下载管理页面显示的下载数量',3,36,NULL,'2013-05-08 21:35:07',NULL,NULL),(88,'推荐商品 - 显示在管理页面的数量','MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN','10','管理页面下每屏的推荐商品数量',3,37,NULL,'2013-05-08 21:35:07',NULL,NULL),(89,'新进商品的定义','SHOW_NEW_PRODUCTS_LIMIT','0','新进商品列表的定义<br />0= 所有商品<br />1= 当前月份<br />7= 7 天<br />14= 14 天<br />30= 30 天<br />60= 60 天<br />90= 90 天<br />120= 120 天',3,40,NULL,'2013-05-08 21:35:07',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'7\', \'14\', \'30\', \'60\', \'90\', \'120\'), '),(90,'显示语言图标的数目','MAX_LANGUAGE_FLAGS_COLUMNS','3','语言边框中每行显示的语言图标的数目',3,50,NULL,'2013-05-08 21:35:07',NULL,NULL),(91,'最大文件上传大小','MAX_FILE_UPLOAD_SIZE','2048000','允许上传文件的大小<br />缺省= 2048000',3,60,NULL,'2013-05-08 21:35:07',NULL,NULL),(92,'允许上传的文件名后缀','UPLOAD_FILENAME_EXTENSIONS','jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip','列出允许客户上传到您网站的文件类型 (文件名后缀)。用逗号(,)分开。不要包含点(.)。<br /><br />建议设置: \"jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip\"',3,61,NULL,'2013-05-08 21:35:07',NULL,'zen_cfg_textarea('),(93,'管理订单下显示的订单内容','MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING','0','最多订单内容数<br />0 = 无限制',3,65,NULL,'2013-05-08 21:35:07',NULL,NULL),(94,'管理页面显示的PayPal IPN的数量','MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN','20','管理页面显示PayPal IPN的数量<br />缺省为20',3,66,NULL,'2013-05-08 21:35:07',NULL,NULL),(95,'商品链接多个分类的显示','MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS','3','商品链接到多个分类的管理界面下，显示的列数<br />3 = 缺省',3,70,NULL,'2013-05-08 21:35:07',NULL,NULL),(96,'简易页面的显示数量','MAX_DISPLAY_SEARCH_RESULTS_EZPAGE','20','简易页面的显示数量<br />20 = 缺省',3,71,NULL,'2013-05-08 21:35:07',NULL,NULL),(97,'小图像宽度','SMALL_IMAGE_WIDTH','100','小图像象素宽度',4,1,NULL,'2013-05-08 21:35:07',NULL,NULL),(98,'小图像高度','SMALL_IMAGE_HEIGHT','80','小图像象素高度',4,2,NULL,'2013-05-08 21:35:08',NULL,NULL),(99,'标题图像宽度 - 管理页面','HEADING_IMAGE_WIDTH','57','管理页面的标题图像象素宽度<br />说明: 该值调整管理页面的间距，或可用在管理页面增加标题图像',4,3,NULL,'2013-05-08 21:35:08',NULL,NULL),(100,'标题图像高度 - 管理页面','HEADING_IMAGE_HEIGHT','40','管理页面的标题图像象素高度<br />说明: 该值调整管理页面的间距，或可用在管理页面增加标题图像',4,4,NULL,'2013-05-08 21:35:08',NULL,NULL),(101,'子分类图像宽度','SUBCATEGORY_IMAGE_WIDTH','100','子分类图像象素宽度',4,5,NULL,'2013-05-08 21:35:08',NULL,NULL),(102,'子分类图像高度','SUBCATEGORY_IMAGE_HEIGHT','57','子分类图像象素高度',4,6,NULL,'2013-05-08 21:35:08',NULL,NULL),(103,'计算图像尺寸','CONFIG_CALCULATE_IMAGE_SIZE','true','是否计算图像尺寸?',4,7,NULL,'2013-05-08 21:35:08',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(104,'显示缺少的图像','IMAGE_REQUIRED','true','显示缺少的图像。适合调试。',4,8,NULL,'2013-05-08 21:35:08',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(105,'图像 - 购物车状态','IMAGE_SHOPPING_CART_STATUS','1','是否在购物车中显示商品图像?<br />0= 否 1= 是',4,9,NULL,'2013-05-08 21:35:08',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(106,'图像 - 购物车宽度','IMAGE_SHOPPING_CART_WIDTH','50','缺省 = 50',4,10,NULL,'2013-05-08 21:35:08',NULL,NULL),(107,'图像 - 购物车高度','IMAGE_SHOPPING_CART_HEIGHT','40','缺省 = 40',4,11,NULL,'2013-05-08 21:35:08',NULL,NULL),(108,'分类图像宽度 - 商品信息页面','CATEGORY_ICON_IMAGE_WIDTH','57','商品信息页面的分类图标的象素宽度',4,13,NULL,'2013-05-08 21:35:08',NULL,NULL),(109,'分类图像高度 - 商品信息页面','CATEGORY_ICON_IMAGE_HEIGHT','40','商品信息页面的分类图标的象素高度',4,14,NULL,'2013-05-08 21:35:08',NULL,NULL),(110,'含子分类的分类图像宽度','SUBCATEGORY_IMAGE_TOP_WIDTH','150','含子分类的分类图像宽度',4,15,NULL,'2013-05-08 21:35:08',NULL,NULL),(111,'含子分类的分类图像高度','SUBCATEGORY_IMAGE_TOP_HEIGHT','85','含子分类的分类图像高度',4,16,NULL,'2013-05-08 21:35:08',NULL,NULL),(112,'商品信息 - 图像宽度','MEDIUM_IMAGE_WIDTH','150','商品信息图像的象素宽度',4,20,NULL,'2013-05-08 21:35:08',NULL,NULL),(113,'商品信息 - 图像高度','MEDIUM_IMAGE_HEIGHT','120','商品信息图像的象素高度',4,21,NULL,'2013-05-08 21:35:08',NULL,NULL),(114,'商品信息 - 中图像后缀','IMAGE_SUFFIX_MEDIUM','_MED','商品信息 - 中图像后缀<br />缺省 = _MED',4,22,NULL,'2013-05-08 21:35:08',NULL,NULL),(115,'商品信息 - 大图像后缀','IMAGE_SUFFIX_LARGE','_LRG','商品信息 - 大图像后缀<br />缺省 = _LRG',4,23,NULL,'2013-05-08 21:35:08',NULL,NULL),(116,'商品信息 - 每行附加图像数目','IMAGES_AUTO_ADDED','3','商品信息 - 每行附加图像数目<br />缺省 = 3',4,30,NULL,'2013-05-08 21:35:08',NULL,NULL),(117,'图像 - 商品列表宽度','IMAGE_PRODUCT_LISTING_WIDTH','100','缺省 = 100',4,40,NULL,'2013-05-08 21:35:08',NULL,NULL),(118,'图像 - 商品列表高度','IMAGE_PRODUCT_LISTING_HEIGHT','80','缺省 = 80',4,41,NULL,'2013-05-08 21:35:08',NULL,NULL),(119,'图像 - 新进商品列表宽度','IMAGE_PRODUCT_NEW_LISTING_WIDTH','100','缺省 = 100',4,42,NULL,'2013-05-08 21:35:08',NULL,NULL),(120,'图像 - 新进商品列表高度','IMAGE_PRODUCT_NEW_LISTING_HEIGHT','80','缺省 = 80',4,43,NULL,'2013-05-08 21:35:08',NULL,NULL),(121,'图像 - 新进商品宽度','IMAGE_PRODUCT_NEW_WIDTH','100','缺省 = 100',4,44,NULL,'2013-05-08 21:35:08',NULL,NULL),(122,'图像 - 新进商品高度','IMAGE_PRODUCT_NEW_HEIGHT','80','缺省 = 80',4,45,NULL,'2013-05-08 21:35:08',NULL,NULL),(123,'图像 - 推荐商品宽度','IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH','100','缺省 = 100',4,46,NULL,'2013-05-08 21:35:08',NULL,NULL),(124,'图像 - 推荐商品高度','IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT','80','缺省 = 80',4,47,NULL,'2013-05-08 21:35:08',NULL,NULL),(125,'图像 - 所有商品列表宽度','IMAGE_PRODUCT_ALL_LISTING_WIDTH','100','缺省 = 100',4,48,NULL,'2013-05-08 21:35:09',NULL,NULL),(126,'图像 - 所有商品列表高度','IMAGE_PRODUCT_ALL_LISTING_HEIGHT','80','缺省 = 80',4,49,NULL,'2013-05-08 21:35:09',NULL,NULL),(127,'商品图像 - 缺省图象状态','PRODUCTS_IMAGE_NO_IMAGE_STATUS','1','如果商品没有图像，是否使用缺省图象<br />0= 否<br />1= 是',4,60,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(128,'商品图像 - 缺省图象','PRODUCTS_IMAGE_NO_IMAGE','no_picture.gif','如果商品没有图像，使用的缺省图象的文件名<br />缺省 = no_picture.gif',4,61,NULL,'2013-05-08 21:35:09',NULL,NULL),(129,'图像 - 商品和分类使用同比例的图像','PROPORTIONAL_IMAGES_STATUS','1','商品和分类使用同比例的图像吗?<br /><br />提示: 图像比例中不要设置高度或宽度为0<br />0= 关 1= 开',4,75,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(130,'称呼字段','ACCOUNT_GENDER','true','创建帐号时显示性别选择字段，用于发送电子邮件时的称呼。',5,1,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(131,'生日字段','ACCOUNT_DOB','true','创建帐号时显示生日字段<br />说明: 生日字段的最小值设置为空时，该字段为可选项<br />生日字段的最小值>0时为必选项',5,2,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(132,'公司字段','ACCOUNT_COMPANY','false','创建帐号时显示公司字段',5,3,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(133,'地址行二','ACCOUNT_SUBURB','true','创建帐号时显示地址行二字段',5,4,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(134,'省份','ACCOUNT_STATE','true','创建帐号时显示省份字段',5,5,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(135,'省份 - 总是显示下拉菜单？','ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN','false','省份总是显示为下拉菜单吗？',5,5,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(136,'创建帐号时的缺省国家','SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY','223','设置新建帐号时的默认国家：<br />默认为美国',5,6,NULL,'2013-05-08 21:35:09','zen_get_country_name','zen_cfg_pull_down_country_list_none('),(137,'传真号码','ACCOUNT_FAX_NUMBER','true','创建帐号时显示传真号码字段',5,10,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(138,'显示电子商情选择框','ACCOUNT_NEWSLETTER_STATUS','1','显示电子商情选择框<br />0= 否<br />1= 显示未选择<br />2= 显示已选择<br /><strong>提示: 将该值缺省为接受也许会违反您所在国或地区的规章</strong>',5,45,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(139,'缺省电子邮件格式','ACCOUNT_EMAIL_PREFERENCE','0','设置客户缺省电子邮件格式<br />0= 文本<br />1= HTML<br /><strong>提示: 将该值缺省为接受也许会违反您所在国或地区的规章。</strong>',5,46,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(140,'商品通知','CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS','1','结帐时是否提示客户商品通知<br />0= 不提示<br />1= 提示 (除非已选择全局通知)<br /><br />提示: 边框要另外关闭',5,50,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(141,'购物模式 - 查看商品和价格','CUSTOMERS_APPROVAL','0','客户是否需要批准后才能购物<br />0= 不需要<br />1= 登录后才能浏览<br />2= 可以浏览，但登录后才显示价格<br />3= 演示用途<br /><br />建议选项 2 用于防止Spiders，如果您希望客户登录后才能查看价格。',5,55,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(142,'客户批准模式 - 授权等待中','CUSTOMERS_APPROVAL_AUTHORIZATION','0','客户是否需要授权后才能购物<br />0= 不需要授权<br />1= 授权后才能浏览<br />2= 可以浏览，但授权后才显示价格<br />3= 客户可以浏览商品和价格，但需要授权后才可购物<br /><br />推荐使用选项 2 或 3 防止Spiders',5,65,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(143,'客户授权: 文件名','CUSTOMERS_AUTHORIZATION_FILENAME','customers_authorization','客户授权的文件名<br />提示: 不要包含后缀<br />缺省=customers_authorization',5,66,NULL,'2013-05-08 21:35:09',NULL,''),(144,'客户授权: 隐藏页眉','CUSTOMERS_AUTHORIZATION_HEADER_OFF','false','客户授权: 隐藏页眉 <br />(true=隐藏 false=显示)',5,67,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(145,'客户授权: 隐藏左栏目','CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF','false','客户授权: 隐藏左栏目 <br />(true=隐藏 false=显示)',5,68,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(146,'客户授权: 隐藏右栏目','CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF','false','客户授权: 隐藏右栏目 <br />(true=隐藏 false=显示)',5,69,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(147,'客户授权: 隐藏页脚','CUSTOMERS_AUTHORIZATION_FOOTER_OFF','false','客户授权: 隐藏页脚 <br />(true=隐藏 false=显示)',5,70,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(148,'客户授权: 隐藏价格','CUSTOMERS_AUTHORIZATION_PRICES_OFF','false','客户授权: 隐藏价格 <br />(true=隐藏 false=显示)',5,71,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(149,'客户推荐模式','CUSTOMERS_REFERRAL_STATUS','0','客户推荐代码创建于<br />0= 关闭<br />1= 用户使用的第一张优惠券的号码<br />2= 客户可以在创建帐号时添加，如果为空可以编辑<br /><br />提示: 一旦客户推荐号码设置好，只能在客户管理下修改',5,80,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(150,'已安装支付模块','MODULE_PAYMENT_INSTALLED','freecharger.php;moneyorder.php','支付模块文件名用分号隔开。自动更新，无需编辑。(例如: freecharger.php;cod.php;paypal.php)',6,0,NULL,'2013-05-08 21:35:09',NULL,NULL),(151,'已安装总额计算模块','MODULE_ORDER_TOTAL_INSTALLED','ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_total.php','总额计算模块文件名用分号分开。自动更新，无需编辑。(例如: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)',6,0,NULL,'2013-05-08 21:35:09',NULL,NULL),(152,'已安装配送模块','MODULE_SHIPPING_INSTALLED','flat.php;freeshipper.php;item.php;storepickup.php','配送模块文件名用分号分开。自动更新，无需编辑。(例如: ups.php;flat.php;item.php)',6,0,NULL,'2013-05-08 21:35:09',NULL,NULL),(153,'启用免运费模块','MODULE_SHIPPING_FREESHIPPER_STATUS','True','要启用免运费模块吗?',6,0,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(154,'免运费成本','MODULE_SHIPPING_FREESHIPPER_COST','0.00','免运费成本?',6,6,NULL,'2013-05-08 21:35:09',NULL,NULL),(155,'手续费','MODULE_SHIPPING_FREESHIPPER_HANDLING','0','免运费手续费。',6,0,NULL,'2013-05-08 21:35:09',NULL,NULL),(156,'税率','MODULE_SHIPPING_FREESHIPPER_TAX_CLASS','0','免运费手续费税率。',6,0,NULL,'2013-05-08 21:35:09','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(157,'免运费地区','MODULE_SHIPPING_FREESHIPPER_ZONE','0','如果免运费，仅限于该地区。',6,0,NULL,'2013-05-08 21:35:09','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes('),(158,'显示排序','MODULE_SHIPPING_FREESHIPPER_SORT_ORDER','0','显示排序。',6,0,NULL,'2013-05-08 21:35:09',NULL,NULL),(159,'商店提货','MODULE_SHIPPING_STOREPICKUP_STATUS','True','使用商店提货?',6,0,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(160,'商店提货费用','MODULE_SHIPPING_STOREPICKUP_COST','0.00','商店提货费用。',6,0,NULL,'2013-05-08 21:35:09',NULL,NULL),(161,'税率','MODULE_SHIPPING_STOREPICKUP_TAX_CLASS','0','商店提货处理费税率。',6,0,NULL,'2013-05-08 21:35:09','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(162,'税率基准','MODULE_SHIPPING_STOREPICKUP_TAX_BASIS','Shipping','运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址',6,0,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\'), '),(163,'配送地区','MODULE_SHIPPING_STOREPICKUP_ZONE','0','如果选择了地区，只有该地区才使用该配送方式。',6,0,NULL,'2013-05-08 21:35:09','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes('),(164,'显示排序','MODULE_SHIPPING_STOREPICKUP_SORT_ORDER','0','显示的排序。',6,0,NULL,'2013-05-08 21:35:09',NULL,NULL),(165,'按件计价','MODULE_SHIPPING_ITEM_STATUS','True','使用按件计价吗?',6,0,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(166,'运输费用','MODULE_SHIPPING_ITEM_COST','2.50','运输费用随订单内件数的增加而增加的配送方式。',6,0,NULL,'2013-05-08 21:35:09',NULL,NULL),(167,'手续费','MODULE_SHIPPING_ITEM_HANDLING','0','此配送方式的手续费。',6,0,NULL,'2013-05-08 21:35:09',NULL,NULL),(168,'税率','MODULE_SHIPPING_ITEM_TAX_CLASS','0','此运费用下面的税率。',6,0,NULL,'2013-05-08 21:35:09','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(169,'税率基准','MODULE_SHIPPING_ITEM_TAX_BASIS','Shipping','运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址',6,0,NULL,'2013-05-08 21:35:09',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), '),(170,'配送地区','MODULE_SHIPPING_ITEM_ZONE','0','如果选择了地区，只有该地区才使用该配送方式.',6,0,NULL,'2013-05-08 21:35:10','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes('),(171,'显示排序','MODULE_SHIPPING_ITEM_SORT_ORDER','0','显示的顺序。',6,0,NULL,'2013-05-08 21:35:10',NULL,NULL),(172,'启用免费商品模块','MODULE_PAYMENT_FREECHARGER_STATUS','True','您接受商品免费吗?',6,1,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(173,'显示排序.','MODULE_PAYMENT_FREECHARGER_SORT_ORDER','0','显示的顺序。低的显示在前。',6,0,NULL,'2013-05-08 21:35:10',NULL,NULL),(174,'支付地区','MODULE_PAYMENT_FREECHARGER_ZONE','0','如果选择地区则仅限该地区使用此支付方式。',6,2,NULL,'2013-05-08 21:35:10','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes('),(175,'设置订单状态','MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID','0','设置该支付方式下订单状态为',6,0,NULL,'2013-05-08 21:35:10','zen_get_order_status_name','zen_cfg_pull_down_order_statuses('),(176,'打开PayPal支付模块','MODULE_PAYMENT_PAYPAL_STATUS','True','您要使用PayPal支付方式吗?',6,0,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(177,'商业编号','MODULE_PAYMENT_PAYPAL_BUSINESS_ID','admin@localhost','您的PayPal帐号的主要电子邮件地址<br />说明：该地址必须与PayPal上设置的主要电子邮件地址<strong>完全一致</strong>，并且要注意<strong>大小写</strong>。',6,2,NULL,'2013-05-08 21:35:10',NULL,NULL),(178,'交易货币','MODULE_PAYMENT_PAYPAL_CURRENCY','Selected Currency','随订单发送到PayPal的货币<br />说明: 如果选择了非PayPal支持的货币，将自动转换为美元。',6,3,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'Selected Currency\', \'Only USD\', \'Only AUD\', \'Only CAD\', \'Only EUR\', \'Only GBP\', \'Only CHF\', \'Only CZK\', \'Only DKK\', \'Only HKD\', \'Only HUF\', \'Only JPY\', \'Only NOK\', \'Only NZD\', \'Only PLN\', \'Only SEK\', \'Only SGD\', \'Only THB\', \'Only MXN\', \'Only ILS\', \'Only PHP\', \'Only TWD\', \'Only BRL\', \'Only MYR\'), '),(179,'付款地区','MODULE_PAYMENT_PAYPAL_ZONE','0','如果选择了付款地区，仅该地区可以使用该支付模块。',6,4,NULL,'2013-05-08 21:35:10','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes('),(180,'设置通知状态','MODULE_PAYMENT_PAYPAL_PROCESSING_STATUS_ID','1','设置通过该支付方式付款，但还没有完成的订单状态为<br />(推荐状态\'等待中\')',6,5,NULL,'2013-05-08 21:35:10','zen_get_order_status_name','zen_cfg_pull_down_order_statuses('),(181,'设置订单状态','MODULE_PAYMENT_PAYPAL_ORDER_STATUS_ID','2','设置通过该支付方式付款的订单状态<br />(推荐\'处理中\')',6,6,NULL,'2013-05-08 21:35:10','zen_get_order_status_name','zen_cfg_pull_down_order_statuses('),(182,'退款订单状态','MODULE_PAYMENT_PAYPAL_REFUND_ORDER_STATUS_ID','1','设置通过该支付方式退款的订单状态<br />(推荐\'等待中\')',6,7,NULL,'2013-05-08 21:35:10','zen_get_order_status_name','zen_cfg_pull_down_order_statuses('),(183,'显示顺序','MODULE_PAYMENT_PAYPAL_SORT_ORDER','0','显示顺序：小的显示在前。',6,8,NULL,'2013-05-08 21:35:10',NULL,NULL),(184,'地址替代','MODULE_PAYMENT_PAYPAL_ADDRESS_OVERRIDE','1','如果设置为 1，Zen Cart输入的地址会替代客户在PayPal上储存的地址。客户将看到Zen Cart的地址，但不能修改。<br />(如地址不正确，PayPal将认为没有提交地址或者override=0)<br />0=不覆盖<br />1=ZC地址替代PayPal地址',6,18,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'0\',\'1\'), '),(185,'送货地址选项','MODULE_PAYMENT_PAYPAL_ADDRESS_REQUIRED','2','送货地址。如果设置为 0，将提示您的客户输入送货地址。如果设置为 1，将不提示客户输入送货地址。如果设置为 2，客户必须输入送货地址。<br />0=提示<br />1=不询问<br />2=必须<br /><br /><strong>提示: 如果允许客户输入自己的送货地址，您一定要核对PayPal确认信息上地址无误。使用Website Payments Standard (IPN), Zen Cart 不知道客户是否会选择和订单上不同的送货地址。</strong>',6,20,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'0\',\'1\',\'2\'), '),(186,'购物车商品清单','MODULE_PAYMENT_PAYPAL_DETAILED_CART','No','要向PayPal传递详细的商品清单吗? 如设置为True，将传递详细的购物清单',6,22,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'No\',\'Yes\'), '),(187,'页面风格','MODULE_PAYMENT_PAYPAL_PAGE_STYLE','Primary','定制付款页面的风格。页面风格的值是您添加或编辑页面风格时输入的名字。您可以在PayPal网址上，添加或修改客户定制的付款页面风格，位于我的帐号选项下面。如果您要使用主要风格，设置为\"primary.\" 如果要使用缺省风格，设置为\"paypal\".',6,25,NULL,'2013-05-08 21:35:10',NULL,NULL),(188,'PayPal服务的模式<br /><br />缺省:<br /><code>www.paypal.com/cgi-bin/webscr</code><br />或者<br /><code>www.paypal.com/us/cgi-bin/webscr</code><br />or for the UK,<br /><code>www.paypal.com/uk/cgi-bin/webscr</code>','MODULE_PAYMENT_PAYPAL_HANDLER','www.paypal.com/cgi-bin/webscr','选择PayPal正式交易的网址',6,73,NULL,'2013-05-08 21:35:10',NULL,''),(189,'PDT Token (Payment Data Transfer)','MODULE_PAYMENT_PAYPAL_PDTTOKEN','','在这里输入PDT Token值，在处理结束后立刻激活交易。',6,25,NULL,'2013-05-08 21:35:10','zen_cfg_password_display',NULL),(190,'调试模式','MODULE_PAYMENT_PAYPAL_IPN_DEBUG','Off','打开调试模式吗? <br />说明: 会发送大量用于调试的邮件!<br />记录文件位于/includes/modules/payment/paypal/logs 目录<br />电子邮件发送到店主的邮箱。<br />不建议使用邮件选项。<br /><strong>通常设置为OFF。</strong>',6,71,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'Off\',\'Log File\',\'Log and Email\'), '),(191,'调试电子邮件地址','MODULE_PAYMENT_PAYPAL_DEBUG_EMAIL_ADDRESS','admin@localhost','用于接收调试信息的电子邮件地址',6,72,NULL,'2013-05-08 21:35:10',NULL,NULL),(192,'含税','MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX','false','计算时含税?',6,6,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(193,'该模块已安装','MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS','true','',6,1,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'true\'), '),(194,'显示排序','MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER','290','显示的顺序.',6,2,NULL,'2013-05-08 21:35:10',NULL,NULL),(195,'含运费','MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING','false','计算时含运费?',6,5,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(196,'重算税价','MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX','Standard','重新计算税',6,7,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'), '),(197,'税率','MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS','0','团体优惠时使用税率.',6,0,NULL,'2013-05-08 21:35:10','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(198,'使用固定运费','MODULE_SHIPPING_FLAT_STATUS','True','您要使用固定运费吗?',6,0,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(199,'配送费用','MODULE_SHIPPING_FLAT_COST','5.00','所有订单都收取该费用。',6,0,NULL,'2013-05-08 21:35:10',NULL,NULL),(200,'税率种类','MODULE_SHIPPING_FLAT_TAX_CLASS','0','采用下面的运费税种。',6,0,NULL,'2013-05-08 21:35:10','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(201,'税率基准','MODULE_SHIPPING_FLAT_TAX_BASIS','Shipping','运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址',6,0,NULL,'2013-05-08 21:35:10',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), '),(202,'配送地区','MODULE_SHIPPING_FLAT_ZONE','0','如果选择了地区，只有该地区才使用该配送方式。',6,0,NULL,'2013-05-08 21:35:10','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes('),(203,'显示排序','MODULE_SHIPPING_FLAT_SORT_ORDER','0','显示的顺序',6,0,NULL,'2013-05-08 21:35:10',NULL,NULL),(204,'缺省货币','DEFAULT_CURRENCY','CNY','缺省货币',6,0,NULL,'2013-05-08 21:35:10',NULL,NULL),(205,'缺省语言','DEFAULT_LANGUAGE','en','缺省语言',6,0,NULL,'2013-05-08 21:35:10',NULL,NULL),(206,'缺省的新订单状态','DEFAULT_ORDERS_STATUS_ID','1','新建一个订单时，订单状态为该值。',6,0,NULL,'2013-05-08 21:35:10',NULL,NULL),(207,'显示管理configuration_key','ADMIN_CONFIGURATION_KEY_ON','0','设置为1将在配置页面下显示configuration_key的名称',6,0,NULL,'2013-05-08 21:35:10',NULL,NULL),(208,'始发国家或地区','SHIPPING_ORIGIN_COUNTRY','44','选择计算运费的始发国家或地区。',7,1,NULL,'2013-05-08 21:35:10','zen_get_country_name','zen_cfg_pull_down_country_list('),(209,'邮编','SHIPPING_ORIGIN_ZIP','NONE','输入商店邮编，用于运费计算。',7,2,NULL,'2013-05-08 21:35:11',NULL,NULL),(210,'最大包裹重量','SHIPPING_MAX_WEIGHT','50','邮递公司对单件包裹的最大重量限制。',7,3,NULL,'2013-05-08 21:35:11',NULL,NULL),(211,'小包裹包装材料 - 百分比+重量','SHIPPING_BOX_WEIGHT','0:3','输入小包裹的包装材料重量<br />例子: 10% + 1克 10:1<br />10% + 0克 10:0<br />0% + 5克 0:5<br />0% + 0克 0:0',7,4,NULL,'2013-05-08 21:35:11',NULL,NULL),(212,'大包裹包装材料 - 百分比+重量','SHIPPING_BOX_PADDING','10:0','输入大包裹的包装材料重量<br />例子: 10% + 1克 10:1<br />10% + 0克 10:0<br />0% + 5克 0:5<br />0% + 0克 0:0',7,5,NULL,'2013-05-08 21:35:11',NULL,NULL),(213,'显示箱数和重量','SHIPPING_BOX_WEIGHT_DISPLAY','3','显示货物重量和箱数?<br /><br />0= 否<br />1= 只显示箱数<br />2= 只显示重量<br />3= 箱数和重量',7,15,NULL,'2013-05-08 21:35:11',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(214,'运费估价显示','SHOW_SHIPPING_ESTIMATOR_BUTTON','1','<br />0= 否<br />1= 在购物车上显示按钮<br />2= 在购物车页面显示列表',7,20,NULL,'2013-05-08 21:35:11',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(215,'在发票管理中显示订单说明','ORDER_COMMENTS_INVOICE','1','在发票管理中要显示订单说明吗?<br />0= 不显示<br />1= 只显示客户的第一个说明<br />2= 订单的所有说明',7,25,NULL,'2013-05-08 21:35:11',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(216,'在装箱单管理中显示订单说明','ORDER_COMMENTS_PACKING_SLIP','1','在装箱单管理中要显示订单说明吗?<br />0= 不显示<br />1= 只显示客户的第一个说明<br />2= 订单的所有说明',7,26,NULL,'2013-05-08 21:35:11',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(217,'无重量商品免运费','ORDER_WEIGHT_ZERO_STATUS','0','如果订单商品重量为零，免运费吗?<br />0= 否<br />1= 是<br /><br />提示: 免运费时，打开免运费模块，这只会在免运费时显示。',7,15,NULL,'2013-05-08 21:35:11',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(218,'显示商品图像','PRODUCT_LIST_IMAGE','1','要显示商品图像吗?',8,1,NULL,'2013-05-08 21:35:11',NULL,NULL),(219,'显示厂商名字','PRODUCT_LIST_MANUFACTURER','0','要显示商品厂商名字吗?',8,2,NULL,'2013-05-08 21:35:11',NULL,NULL),(220,'显示商品型号','PRODUCT_LIST_MODEL','0','要显示商品型号吗?',8,3,NULL,'2013-05-08 21:35:11',NULL,NULL),(221,'显示商品名称','PRODUCT_LIST_NAME','2','要显示商品名称吗?',8,4,NULL,'2013-05-08 21:35:11',NULL,NULL),(222,'显示商品价格/加入购物车','PRODUCT_LIST_PRICE','3','要显示商品价格/添加到购物车吗?',8,5,NULL,'2013-05-08 21:35:11',NULL,NULL),(223,'显示商品数量','PRODUCT_LIST_QUANTITY','0','要显示商品数量吗?',8,6,NULL,'2013-05-08 21:35:11',NULL,NULL),(224,'显示商品重量','PRODUCT_LIST_WEIGHT','0','要显示商品重量吗?',8,7,NULL,'2013-05-08 21:35:11',NULL,NULL),(225,'商品价格/添加到购物车方框的宽度','PRODUCTS_LIST_PRICE_WIDTH','125','定义商品价格/添加到购物车方框的宽度<br />缺省= 125',8,8,NULL,'2013-05-08 21:35:11',NULL,NULL),(226,'显示分类/厂商过滤 (0=关; 1=开)','PRODUCT_LIST_FILTER','1','要显示分类/厂商过滤吗?',8,9,NULL,'2013-05-08 21:35:11',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(227,'前/后分页导航条 (1-页面顶部, 2-页面底部, 3-同时)','PREV_NEXT_BAR_LOCATION','3','设置前/后分页导航条的位置',8,10,NULL,'2013-05-08 21:35:11',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), '),(228,'显示商品列表缺省排序','PRODUCT_LISTING_DEFAULT_SORT_ORDER','','商品列表缺省排序<br />提示: 留空为商品排序。按照您指定的顺序排序商品列表。例如: 2a',8,15,NULL,'2013-05-08 21:35:11',NULL,NULL),(229,'显示添加到购物车按钮 (0=关; 1=开; 2=开，且可以输入数量)','PRODUCT_LIST_PRICE_BUY_NOW','1','要显示添加到购物车按钮吗?<br /><br /><strong>说明:</strong> 如果采用选项2，请关闭下面的多个商品数量方框',8,20,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(230,'显示多个商品数量方框状态和设置按钮位置','PRODUCT_LISTING_MULTIPLE_ADD_TO_CART','3','要显示多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时',8,25,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(231,'显示商品介绍','PRODUCT_LIST_DESCRIPTION','150','要显示商品介绍吗?<br /><br />0= 否<br />150= 建议长度, 或输入显示的最多字数',8,30,NULL,'2013-05-08 21:35:12',NULL,NULL),(232,'商品列表升序标记','PRODUCT_LIST_SORT_ORDER_ASCENDING','+','用于表示升序的标记<br />缺省 = +',8,40,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_textarea_small('),(233,'商品列表降序标记','PRODUCT_LIST_SORT_ORDER_DESCENDING','-','用于表示降序的标记<br />缺省 = -',8,41,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_textarea_small('),(234,'商品列表中显示字母过滤选择','PRODUCT_LIST_ALPHA_SORTER','true','在商品列表中显示字母过滤的选择吗?',8,50,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(235,'显示商品列表子分类图像','PRODUCT_LIST_CATEGORIES_IMAGE_STATUS','true','在商品列表中显示子分类图像吗?',8,52,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(236,'显示商品列表总分类图像','PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP','true','在商品列表中显示总分类图像吗?',8,53,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(237,'导航显示子分类','PRODUCT_LIST_CATEGORY_ROW_STATUS','1','经由总分类导航时显示子分类<br /><br />0= 否<br />1= 是',8,60,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(238,'检查库存','STOCK_CHECK','true','检查库存是否足够',9,1,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(239,'减少库存','STOCK_LIMITED','true','按照订单从库存中自动减少商品',9,2,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(240,'允许结帐','STOCK_ALLOW_CHECKOUT','true','即使库存不够，也允许客户结帐',9,3,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(241,'显示缺货','STOCK_MARK_PRODUCT_OUT_OF_STOCK','***','在屏幕上提示客户商品库存量不足',9,4,NULL,'2013-05-08 21:35:12',NULL,NULL),(242,'重新进货','STOCK_REORDER_LEVEL','5','定义何时需要重新进货',9,5,NULL,'2013-05-08 21:35:12',NULL,NULL),(243,'缺货时, 商品的状态为','SHOW_PRODUCTS_SOLD_OUT','0','显示商品缺货<br /><br />0= 设置商品状态为关闭<br />1= 设置商品状态为打开',9,10,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(244,'用缺货图标代替加入购物车按钮','SHOW_PRODUCTS_SOLD_OUT_IMAGE','1','不显示加入购物车按钮，而显示缺货图标<br /><br />0= 否<br />1= 是',9,11,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(245,'数量小数位','QUANTITY_DECIMALS','0','商品数量允许几位小数?<br /><br />0= 不允许',9,15,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(246,'购物车上显示 - 复选框或删除按钮','SHOW_SHOPPING_CART_DELETE','3','在购物车上显示，复选框或删除按钮<br /><br />1= 只显示删除按钮<br />2= 只显示复选框<br />3= 同时显示删除按钮和复选框',9,20,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), '),(247,'购物车上显示 - 更新购物车按钮的位置','SHOW_SHOPPING_CART_UPDATE','3','在购物车上显示更新购物车按钮，位于:<br /><br />1= 每个数量框后面<br />2= 所有商品下面<br />3= 同时显示在每个数量框后面和所有商品下面',9,22,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), '),(248,'在空购物车页面显示新进商品','SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS','1','在空购物车页面显示新进商品<br />0= 否或设置显示顺序',9,30,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(249,'在空购物车页面显示推荐商品','SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS','2','在空购物车页面显示推荐商品<br />0= 否或设置显示顺序',9,31,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(250,'在空购物车页面显示特价商品','SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS','3','在空购物车页面显示特价商品<br />0= 否或设置显示顺序',9,32,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(251,'在空购物车页面显示预售商品','SHOW_SHOPPING_CART_EMPTY_UPCOMING','4','在空购物车页面显示预售商品<br />0= 否或设置显示顺序',9,33,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(252,'登录时提醒合并购物车','SHOW_SHOPPING_CART_COMBINED','1','客户登录时，如果以前购物车中有商品，将于现有购物车中的商品合并。<br /><br />要提醒客户吗?<br /><br />0= OFF, 不提醒<br />1= Yes 提醒并转到购物车页面<br />2= Yes 提醒，但不转到购物车页面',9,35,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(253,'网页解析时间','STORE_PAGE_PARSE_TIME','false','保存解析页面的时间',10,1,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(254,'日志保存到','STORE_PAGE_PARSE_TIME_LOG','D:/xampp/htdocs/zencart/cache/page_parse_time.log','记录页面解析时间的目录和文件名',10,2,NULL,'2013-05-08 21:35:12',NULL,NULL),(255,'日志日期格式','STORE_PARSE_DATE_TIME_FORMAT','%d/%m/%Y %H:%M:%S','日期格式',10,3,NULL,'2013-05-08 21:35:12',NULL,NULL),(256,'显示网页解析时间','DISPLAY_PAGE_PARSE_TIME','false','在每个页面底部显示页面解析时间<br />显示解析时间并不要求保存。',10,4,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(257,'保存数据库查询','STORE_DB_TRANSACTIONS','false','在页面解析时间记录中保存数据库查询(仅适用PHP4)',10,5,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(258,'电子邮件发送方式','EMAIL_TRANSPORT','PHP','设置发送邮件的方式。<br /><strong>PHP</strong>为缺省方式，采用内置的PHP处理方式。<br />采用Windows和MacOS的服务器要修改该设置为<strong>SMTP</strong>。<br /><br /><strong>SMTPAUTH</strong>仅在服务器要求SMTP验证时使用，同时要设置SMTPAUTH的相应参数。<br /><br /><strong>sendmail</strong>用于linux/unix主机，使用主机上的sendmail程序<br /><strong>\"sendmail-f\"</strong>仅当服务器要求 -f 参数发送邮件，这个安全措施可以防止欺骗，但如果邮件服务器未设置使用该选项，会出错。<br /><br /><strong>Qmail</strong>用于linux/unix主机的Qmail邮件功能 /var/qmail/bin/sendmail',12,1,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'PHP\', \'sendmail\', \'sendmail-f\', \'smtp\', \'smtpauth\', \'Qmail\'),'),(259,'SMTP帐号邮箱','EMAIL_SMTPAUTH_MAILBOX','YourEmailAccountNameHere','输入邮箱帐号名 (me@mydomain.com) 。这是SMTP授权帐号名。<br />仅在使用SMTPAUTH时需要。',12,101,NULL,'2013-05-08 21:35:12',NULL,NULL),(260,'SMTP帐号密码','EMAIL_SMTPAUTH_PASSWORD','YourPasswordHere','输入SMTP邮箱的密码。<br />仅在使用SMTPAUTH时需要。',12,101,NULL,'2013-05-08 21:35:12','zen_cfg_password_display',NULL),(261,'SMTP主机','EMAIL_SMTPAUTH_MAIL_SERVER','mail.EnterYourDomain.com','输入SMTP邮件服务器的DNS名字<br />例如: mail.mydomain.com<br />或 55.66.77.88',12,101,NULL,'2013-05-08 21:35:12',NULL,NULL),(262,'SMTP服务器端口','EMAIL_SMTPAUTH_MAIL_SERVER_PORT','25','输入SMTP邮件服务器端口号',12,101,NULL,'2013-05-08 21:35:12',NULL,NULL),(263,'在文本格式邮件中转换货币符号','CURRENCIES_TRANSLATIONS','','文本格式邮件中使用什么货币符号转换？',12,120,NULL,'2003-11-21 00:00:00',NULL,'zen_cfg_textarea_small('),(264,'电子邮件换行','EMAIL_LINEFEED','LF','定义分开邮件头的换行符',12,2,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'LF\', \'CRLF\'),'),(265,'使用HTML格式发送电子邮件','EMAIL_USE_HTML','false','是否使用HTML格式发送电子邮件',12,3,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(266,'通过DNS核对电子邮件地址','ENTRY_EMAIL_ADDRESS_CHECK','false','是否通过DNS核对电子邮件地址',6,6,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(267,'发送电子邮件','SEND_EMAILS','true','是否发出电子邮件',12,5,NULL,'2013-05-08 21:35:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(268,'电子邮件存档','EMAIL_ARCHIVE','false','如果您在发邮件时，需要保存复制件，设置为 \"true\"。',12,6,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(269,'电子邮件出错信息','EMAIL_FRIENDLY_ERRORS','false','如果邮件失败，是否显示错误信息?  设置为false将显示PHP错误信息. 仅在调试时设置为false.',12,7,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(270,'用于显示的店主邮件地址','STORE_OWNER_EMAIL_ADDRESS','cloudwei.sz@gmail.com','商店店主的电子邮件，显示给客户的联系方式。',12,10,NULL,'2013-05-08 21:35:13',NULL,NULL),(271,'发件人邮件地址','EMAIL_FROM','cloudwei.sz@gmail.com','缺省的电子邮件发送人地址，在管理模块下输入邮件时可修改。',12,11,NULL,'2013-05-08 21:35:13',NULL,NULL),(272,'电子邮件必须从现有域名发送','EMAIL_SEND_MUST_BE_STORE','Yes','您的邮件服务器是否要求所有发出的邮件发送地址为你现有的域名？<br /><br />该设置通常用于防止欺骗和垃圾邮件。如果设置为Yes，所有邮件的发送地址为上面设置的发件人邮件地址。',12,11,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'No\', \'Yes\'), '),(273,'管理员电子邮件格式','ADMIN_EXTRA_EMAIL_FORMAT','TEXT','请选择管理员电子邮件格式',12,12,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'TEXT\', \'HTML\'), '),(274,'发送订单确认电子邮件的复件到','SEND_EXTRA_ORDER_EMAILS_TO','cloudwei.sz@gmail.com','发送订单确认电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;',12,12,NULL,'2013-05-08 21:35:13',NULL,NULL),(275,'发送创建帐号电子邮件的复件 - 状态','SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS','0','是否发送创建帐号电子邮件的复件<br />0= 否 1= 是',12,13,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(276,'发送创建帐号电子邮件的复件到','SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO','cloudwei.sz@gmail.com','发送创建帐号电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;',12,14,NULL,'2013-05-08 21:35:13',NULL,NULL),(277,'发送客户发送礼券的电子邮件的复件 - 状态','SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS','0','是否发送客户发送礼券的电子邮件的复件<br />0= 否 1= 是',12,17,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(278,'发送客户发送礼券的电子邮件的复件到','SEND_EXTRA_GV_CUSTOMER_EMAILS_TO','cloudwei.sz@gmail.com','发送客户发送礼券的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;',12,18,NULL,'2013-05-08 21:35:13',NULL,NULL),(279,'发送客户管理礼券邮件的电子邮件的复件 - 状态','SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS','0','是否发送客户管理礼券邮件的电子邮件的复件<br />0= 否 1= 是',12,19,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(280,'发送客户管理礼券邮件的电子邮件的复件到','SEND_EXTRA_GV_ADMIN_EMAILS_TO','cloudwei.sz@gmail.com','发送客户管理礼券邮件的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;',12,20,NULL,'2013-05-08 21:35:13',NULL,NULL),(281,'发送客户管理优惠券邮件的电子邮件的复件 - 状态','SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS','0','是否发送客户管理优惠券邮件的电子邮件的复件<br />0= 否 1= 是',12,21,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(282,'发送客户管理优惠券邮件的电子邮件的复件到','SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO','cloudwei.sz@gmail.com','发送客户管理优惠券邮件的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;',12,22,NULL,'2013-05-08 21:35:13',NULL,NULL),(283,'发送管理订单状态的电子邮件的复件 - 状态','SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS','0','是否发送管理订单状态的电子邮件的复件<br />0= 否 1= 是',12,23,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(284,'发送管理订单状态的电子邮件的复件到','SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO','cloudwei.sz@gmail.com','发送管理订单状态的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;',12,24,NULL,'2013-05-08 21:35:13',NULL,NULL),(285,'发送等待审核的电子邮件的复件 - 状态','SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS','0','是否发送等待审核的电子邮件的复件<br />0= 否 1= 是',12,25,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(286,'发送等待审核的电子邮件的复件到','SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO','cloudwei.sz@gmail.com','发送等待审核的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;',12,26,NULL,'2013-05-08 21:35:13',NULL,NULL),(287,'设置 \"联系我们\" 电子邮件下拉列表','CONTACT_US_LIST','','设置\"联系我们\"页面上列出的电子邮件地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;<br />仅有一个邮件地址时，不要输入，采用店主邮件地址',12,40,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_textarea('),(288,'联系我们 - 显示商店名称和地址','CONTACT_US_STORE_NAME_ADDRESS','1','包含商店名称和地址<br />0= 否 1= 是',12,50,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(289,'商品库存提醒','SEND_LOWSTOCK_EMAIL','0','当商品处于低库存时，是否发送电子邮件<br />0= 否<br />1= 是',12,60,'2013-05-08 21:35:13','2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(290,'发送库存提醒邮件到','SEND_EXTRA_LOW_STOCK_EMAILS_TO','cloudwei.sz@gmail.com','当商品处于低库存时，发送电子邮件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;',12,61,NULL,'2013-05-08 21:35:13',NULL,NULL),(291,'显示退订电子商情链接','SHOW_NEWSLETTER_UNSUBSCRIBE_LINK','true','是否在[信息]边框中，显示退订电子商情的链接？',12,70,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(292,'显示客户选择计数','AUDIENCE_SELECT_DISPLAY_COUNTS','true','显示接收人名单时，是否显示计数？<br /><em>(如果有很多客户，这会影响速度)</em>',12,90,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(293,'允许下载','DOWNLOAD_ENABLED','true','打开商品下载功能',13,1,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(294,'重定向下载','DOWNLOAD_BY_REDIRECT','true','使用浏览器的重定向下载。在非Unix系统上关闭该功能。<br /><br />提示: 重定向打开时，将/pub设为777',13,2,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(295,'分块下载','DOWNLOAD_IN_CHUNKS','false','如果关闭重定向下载，而您的PHP内存限制的设置低于8 MB，您可能需要打开该选项，使文件分块发送到浏览器。<br /><br />重定向下载打开时没有作用。',13,2,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(296,'下载有效期 (天数)','DOWNLOAD_MAX_DAYS','7','设置下载有效天数。0 表示无限制。',13,3,NULL,'2013-05-08 21:35:13',NULL,''),(297,'允许下载次数 - 每件商品','DOWNLOAD_MAX_COUNT','5','设置允许下载次数。0 表示不允许下载。',13,4,NULL,'2013-05-08 21:35:13',NULL,''),(298,'下载控制更新状态值','DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE','4','哪个订单状态重置下载天数和下载次数 - 缺省为 4',13,10,'2013-05-08 21:35:13','2013-05-08 21:35:13',NULL,NULL),(299,'下载控制订单状态值 >= 最低状态','DOWNLOADS_CONTROLLER_ORDERS_STATUS','2','下载控制订单状态值 - 缺省 >= 2<br /><br />是否允许下载取决于订单的状态，订单状态高于该值的可以下载。订单状态由支付方式设定。这里设置该范围的最低值。',13,12,'2013-05-08 21:35:13','2013-05-08 21:35:13',NULL,NULL),(300,'下载控制订单状态值 <= 最高状态','DOWNLOADS_CONTROLLER_ORDERS_STATUS_END','4','下载控制订单状态值 - 缺省 <= 4<br /><br />是否允许下载取决于订单的状态，订单状态低于该值的可以下载。订单状态由支付方式设定。这里设置该范围的最高值。',13,13,'2013-05-08 21:35:13','2013-05-08 21:35:13',NULL,NULL),(301,'允许属性定价','ATTRIBUTES_ENABLED_PRICE_FACTOR','true','允许属性定价',13,25,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(302,'允许批量优惠','ATTRIBUTES_ENABLED_QTY_PRICES','true','允许批量优惠',13,26,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(303,'允许属性图像','ATTRIBUTES_ENABLED_IMAGES','true','允许属性图像',13,28,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(304,'允许按词或字定价','ATTRIBUTES_ENABLED_TEXT_PRICES','true','允许按词或字定价',13,35,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(305,'文字价格 - 空格免费','TEXT_SPACES_FREE','1','文字定价时，空格免费<br /><br />0= 否 1= 是',13,36,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(306,'只读选项类型 - 忽略添加到购物车','PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED','1','当一个商品属性为只读时，是否显示添加到购物车按钮?<br />0= 不显示<br />1= 显示',13,37,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(307,'打开GZip压缩','GZIP_LEVEL','0','0= 否 1= 是',14,1,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(308,'Sessions目录','SESSION_WRITE_DIRECTORY','D:/xampp/htdocs/zencart/cache','如果sessions是基于文件的，保存在该目录。',15,1,NULL,'2013-05-08 21:35:13',NULL,NULL),(309,'Cookie域名','SESSION_USE_FQDN','True','如果选True，域名全称用于保存cookie, 例如：www.mydomain.com。如果选False，仅用域名的部分，例如：mydomain.com。如果您不确定，可以选True。',15,2,NULL,'2013-05-08 21:35:13',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(310,'强制使用Cookie','SESSION_FORCE_COOKIE_USE','False','Force the use of sessions when cookies are only enabled.',15,2,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(311,'检查SSL Sessions编号','SESSION_CHECK_SSL_SESSION_ID','False','Validate the SSL_SESSION_ID on every secure HTTPS page request.',15,3,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(312,'检查用户代理','SESSION_CHECK_USER_AGENT','False','Validate the clients browser user agent on every page request.',15,4,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(313,'检查IP地址','SESSION_CHECK_IP_ADDRESS','False','Validate the clients IP address on every page request.',15,5,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(314,'阻止机器人Sessions','SESSION_BLOCK_SPIDERS','True','Prevent known spiders from starting a session.',15,6,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(315,'重建Sessions','SESSION_RECREATE','True','Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).',15,7,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(316,'IP到主机名转换','SESSION_IP_TO_HOST_ADDRESS','false','转换IP地址为主机名<br /><br />提示: 在某些服务器上，会降低session初始化的速度或电子邮件执行时间。',15,10,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(317,'兑现代码长度','SECURITY_CODE_LENGTH','10','输入兑现代码长度<br />越长越安全',16,1,NULL,'2013-05-08 21:35:14',NULL,NULL),(318,'缺省的金额为零的订单状态','DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID','2','当订单的余额为零, 订单状态为',16,0,NULL,'2013-05-08 21:35:14','zen_get_order_status_name','zen_cfg_pull_down_order_statuses('),(319,'新客户的优惠券编号','NEW_SIGNUP_DISCOUNT_COUPON','','选择优惠券<br />',16,75,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_coupon_id('),(320,'新客户的礼券金额','NEW_SIGNUP_GIFT_VOUCHER_AMOUNT','','没有就留空<br />或输入金额，如 10 表示 10.00元',16,76,NULL,'2013-05-08 21:35:14',NULL,NULL),(321,'优惠券每页数量','MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS','20','每页显示的优惠券数量',16,81,NULL,'2013-05-08 21:35:14',NULL,NULL),(322,'优惠券分析页面上每页数量','MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS','20','分析页面显示的优惠券数量',16,81,NULL,'2013-05-08 21:35:14',NULL,NULL),(323,'接受信用卡 - VISA','CC_ENABLED_VISA','1','接受VISA 0= 否 1= 是',17,1,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(324,'接受信用卡 - MasterCard','CC_ENABLED_MC','1','接受MasterCard 0= 否 1= 是',17,2,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(325,'接受信用卡 - AmericanExpress','CC_ENABLED_AMEX','0','接受AmericanExpress 0= 否 1= 是',17,3,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(326,'接受信用卡 - Diners Club','CC_ENABLED_DINERS_CLUB','0','接受Diners Club 0= 否 1= 是',17,4,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(327,'接受信用卡 - Discover Card','CC_ENABLED_DISCOVER','0','接受Discover卡 0= 否 1= 是',17,5,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(328,'接受信用卡 - JCB','CC_ENABLED_JCB','0','接受JCB 0= 否 1= 是',17,6,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(329,'接受信用卡 - AUSTRALIAN BANKCARD','CC_ENABLED_AUSTRALIAN_BANKCARD','0','接受澳大利亚银行卡 0= 否 1= 是',17,7,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(330,'接受信用卡 - SOLO','CC_ENABLED_SOLO','0','接受SOLO 0= 否 1= 是',17,8,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(331,'接受信用卡 - Switch','CC_ENABLED_SWITCH','0','接受SWITCH 0= 否 1= 是',17,9,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(332,'接受信用卡 - Maestro','CC_ENABLED_MAESTRO','0','接受MAESTRO 0= 否 1= 是',17,10,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(333,'接受信用卡 - 付款时显示','SHOW_ACCEPTED_CREDIT_CARDS','0','付款页面是否显示接受信用卡?<br />0= 不显示<br />1= 显示文字<br />2= 显示图像<br /><br />备注: 图像和文字必须在相关信用卡的数据库和语言文件中同时定义.',17,50,NULL,'2013-05-08 21:35:14',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(334,'该模块已安装','MODULE_ORDER_TOTAL_GV_STATUS','true','',6,1,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\'),'),(335,'显示排序','MODULE_ORDER_TOTAL_GV_SORT_ORDER','840','显示的顺序。',6,2,NULL,'2003-10-30 22:16:40',NULL,NULL),(336,'购买队列','MODULE_ORDER_TOTAL_GV_QUEUE','true','您要将购买礼券排队吗?',6,3,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(337,'含运费','MODULE_ORDER_TOTAL_GV_INC_SHIPPING','true','计算时含运费',6,5,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(338,'含税','MODULE_ORDER_TOTAL_GV_INC_TAX','true','计算时含税。',6,6,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(339,'重算税价','MODULE_ORDER_TOTAL_GV_CALC_TAX','None','重新计算税',6,7,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),'),(340,'税率种类','MODULE_ORDER_TOTAL_GV_TAX_CLASS','0','接受礼券时，使用以下的税率种类。',6,0,NULL,'2003-10-30 22:16:40','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(341,'含税金额','MODULE_ORDER_TOTAL_GV_CREDIT_TAX','false','加入帐号时，在购买的礼券上加税',6,8,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(342,'设置订单状态','MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID','0','设置用礼券全额付款时订单的状态',6,0,NULL,'2013-05-08 21:35:14','zen_get_order_status_name','zen_cfg_pull_down_order_statuses('),(343,'该模块已安装','MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS','true','',6,1,NULL,'2003-10-30 22:16:43',NULL,'zen_cfg_select_option(array(\'true\'),'),(344,'显示排序','MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER','400','显示的顺序。',6,2,NULL,'2003-10-30 22:16:43',NULL,NULL),(345,'收取低额订单费','MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE','false','您要收取低额订单费用吗?',6,3,NULL,'2003-10-30 22:16:43',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(346,'收取低额订单费的订单金额','MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER','50','总金额低于该值的订单收取低额订单费。',6,4,NULL,'2003-10-30 22:16:43','currencies->format',NULL),(347,'低额订单费','MODULE_ORDER_TOTAL_LOWORDERFEE_FEE','5','按百分比收取 - 包含符号 % 例如: 10%<br />收取固定金额 - 例如: 输入 5 表示 5.00元',6,5,NULL,'2003-10-30 22:16:43','',NULL),(348,'低额订单费适用的送货地区','MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION','both','该送货地区收取低额订单费。',6,6,NULL,'2003-10-30 22:16:43',NULL,'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),'),(349,'税率种类','MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS','0','低额订单费使用下面的税率种类。',6,7,NULL,'2003-10-30 22:16:43','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(350,'虚拟商品无低额订单费','MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL','false','购物车中只有虚拟商品时，不收取低额订单费',6,8,NULL,'2004-04-20 22:16:43',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(351,'礼券无低额订单费','MODULE_ORDER_TOTAL_LOWORDERFEE_GV','false','购物车中只有礼券时，不收取低额订单费',6,9,NULL,'2004-04-20 22:16:43',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(352,'该模块已安装','MODULE_ORDER_TOTAL_SHIPPING_STATUS','true','',6,1,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'true\'),'),(353,'显示排序','MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER','200','显示的顺序。',6,2,NULL,'2003-10-30 22:16:46',NULL,NULL),(354,'允许免运费','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING','false','您要免运费吗?',6,3,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(355,'免运费的订单金额','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER','50','当订单总金额大于设值时，免运费。',6,4,NULL,'2003-10-30 22:16:46','currencies->format',NULL),(356,'免运费的送货地区','MODULE_ORDER_TOTAL_SHIPPING_DESTINATION','national','当送货地区为该地区时，免运费。',6,5,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),'),(357,'该模块已安装','MODULE_ORDER_TOTAL_SUBTOTAL_STATUS','true','',6,1,NULL,'2003-10-30 22:16:49',NULL,'zen_cfg_select_option(array(\'true\'),'),(358,'显示排序','MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER','100','显示的顺序。',6,2,NULL,'2003-10-30 22:16:49',NULL,NULL),(359,'该模块已安装','MODULE_ORDER_TOTAL_TAX_STATUS','true','',6,1,NULL,'2003-10-30 22:16:52',NULL,'zen_cfg_select_option(array(\'true\'),'),(360,'显示排序','MODULE_ORDER_TOTAL_TAX_SORT_ORDER','300','显示的顺序。',6,2,NULL,'2003-10-30 22:16:52',NULL,NULL),(361,'该模块已安装','MODULE_ORDER_TOTAL_TOTAL_STATUS','true','',6,1,NULL,'2003-10-30 22:16:55',NULL,'zen_cfg_select_option(array(\'true\'),'),(362,'显示排序','MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER','999','显示的顺序。',6,2,NULL,'2003-10-30 22:16:55',NULL,NULL),(363,'税率种类','MODULE_ORDER_TOTAL_COUPON_TAX_CLASS','0','优惠券采用下面的税类。',6,0,NULL,'2003-10-30 22:16:36','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(364,'含税','MODULE_ORDER_TOTAL_COUPON_INC_TAX','false','计算时含税。',6,6,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(365,'显示排序','MODULE_ORDER_TOTAL_COUPON_SORT_ORDER','280','显示的顺序。',6,2,NULL,'2003-10-30 22:16:36',NULL,NULL),(366,'含运费','MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING','false','计算时含运费',6,5,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(367,'该模块已安装','MODULE_ORDER_TOTAL_COUPON_STATUS','true','',6,1,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\'),'),(368,'重算税价','MODULE_ORDER_TOTAL_COUPON_CALC_TAX','Standard','重新计算税',6,7,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),'),(369,'管理员演示','ADMIN_DEMO','0','是否打开管理员演示？<br />0= 否 1= 是',6,0,NULL,'2013-05-08 21:35:15',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(370,'商品选项类型选择','PRODUCTS_OPTIONS_TYPE_SELECT','0','该数字表示选择的商品选项',0,NULL,'2013-05-08 21:35:15','2013-05-08 21:35:15',NULL,NULL),(371,'文字商品选项类型','PRODUCTS_OPTIONS_TYPE_TEXT','1','文字商品选项类型数值',6,NULL,'2013-05-08 21:35:15','2013-05-08 21:35:15',NULL,NULL),(372,'单选按钮商品选项类型','PRODUCTS_OPTIONS_TYPE_RADIO','2','单选按钮商品选项类型数值',6,NULL,'2013-05-08 21:35:15','2013-05-08 21:35:15',NULL,NULL),(373,'多选商品选项类型','PRODUCTS_OPTIONS_TYPE_CHECKBOX','3','多选商品选项类型数值',6,NULL,'2013-05-08 21:35:15','2013-05-08 21:35:15',NULL,NULL),(374,'文件商品选项类型','PRODUCTS_OPTIONS_TYPE_FILE','4','文件商品选项类型数值',6,NULL,'2013-05-08 21:35:15','2013-05-08 21:35:15',NULL,NULL),(375,'文字和文件商品选项类型的编号','PRODUCTS_OPTIONS_VALUES_TEXT_ID','0','文字和文件商品选项类型的编号数值',6,NULL,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,NULL),(376,'上传前缀','UPLOAD_PREFIX','upload_','用于区分上传选项和其它选项的前缀',0,NULL,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,NULL),(377,'文字前缀','TEXT_PREFIX','txt_','用于区分文字选项值和其它选项值的前缀',0,NULL,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,NULL),(378,'只读选项类型','PRODUCTS_OPTIONS_TYPE_READONLY','5','只读选项类型数值',6,NULL,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,NULL),(379,'login mode https','SSLPWSTATUSCHECK','','系统设置，不要修改。',6,99,NULL,'2013-05-08 21:35:16',NULL,NULL),(380,'商品信息 - 商品选项名称排序','PRODUCTS_OPTIONS_SORT_ORDER','0','商品信息选项名称排序<br />0= 排序, 选项名称<br />1= 选项名称',18,35,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(381,'商品信息 - 商品选项属性值排序','PRODUCTS_OPTIONS_SORT_BY_PRICE','1','商品信息选项属性值排序<br />0= 排序, 价格<br />1= 排序, 选项值名称',18,36,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(382,'商品信息 - 在属性图像下显示选项值名称','PRODUCT_IMAGES_ATTRIBUTES_NAMES','1','商品信息 - 在属性图像下显示选项值名称?<br />0= 否 1= 是',18,41,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(383,'商品信息 - 显示优惠','SHOW_SALE_DISCOUNT_STATUS','1','商品信息 - 是否显示优惠？<br />0= 否 1= 是',18,45,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(384,'商品信息 - 优惠价格的显示格式','SHOW_SALE_DISCOUNT','1','商品信息 - 优惠价格的显示格式:<br />1= 显示百分比 2= 显示金额',18,46,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'1\', \'2\'), '),(385,'商品信息 - 显示优惠百分比的小数位','SHOW_SALE_DISCOUNT_DECIMALS','0','商品信息 - 优惠格式显示为百分比时的小数位:<br />缺省= 0',18,47,NULL,'2013-05-08 21:35:16',NULL,NULL),(386,'商品信息 - 免费图像或文字','OTHER_IMAGE_PRICE_IS_FREE_ON','1','商品信息 - 是否在价格上显示免费字样的图像或文字<br />0= 文字<br />1= 图像',18,50,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(387,'商品信息 - 价格面议图像或文字','PRODUCTS_PRICE_IS_CALL_IMAGE_ON','1','商品信息 - 是否在价格上显示价格面议字样的图像或文字<br />0= 文字<br />1= 图像',18,51,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(388,'商品数量方框 - 添加新商品','PRODUCTS_QTY_BOX_STATUS','1','添加新商品时，缺省的数量方框显示状态?<br /><br />0= 否<br />1= 是<br />提示: 打开时，会显示数量方框，缺省的[添加到购物车]数量为 1',18,55,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(389,'商品评论请求批准','REVIEWS_APPROVAL','1','商品评论需要批准吗?<br /><br />提示: 当评论状态为关闭时，也不会显示<br /><br />0= 否 1= 是',18,62,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(390,'元标签 - 标题含商品型号','META_TAG_INCLUDE_MODEL','1','在Meta标签标题中包含商品型号吗?<br /><br />0= 否 1= 是',18,69,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(391,'元标签 - 标题含商品价格','META_TAG_INCLUDE_PRICE','1','在Meta标签标题中包含商品价格吗?<br /><br />0= 否 1= 是',18,70,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(392,'元标签的描述字段字数','MAX_META_TAG_DESCRIPTION_LENGTH','50','设置元标签的描述字段字数，缺省 50:',18,71,NULL,'2013-05-08 21:35:16','',''),(393,'每行显示的同时购买商品数','SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS','3','每行显示的同时购买商品数<br />0= 关 或设置排序',18,72,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), '),(394,'导航条 - 位置','PRODUCT_INFO_PREVIOUS_NEXT','1','导航条位置<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时',18,21,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'否\'), array(\'id\'=>\'1\', \'text\'=>\'页面顶部\'), array(\'id\'=>\'2\', \'text\'=>\'页面底部\'), array(\'id\'=>\'3\', \'text\'=>\'同时\')),'),(395,'导航条 - 排序','PRODUCT_INFO_PREVIOUS_NEXT_SORT','1','商品的显示顺序<br />0= 商品编号<br />1= 商品名称<br />2= 商品型号<br />3= 价格, 名称<br />4= 价格, 型号<br />5= 名称, 型号<br />6= 商品排序',18,22,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'商品编号\'), array(\'id\'=>\'1\', \'text\'=>\'商品名称\'), array(\'id\'=>\'2\', \'text\'=>\'商品型号\'), array(\'id\'=>\'3\', \'text\'=>\'价格 - 名称\'), array(\'id\'=>\'4\', \'text\'=>\'价格 - 型号\'), array(\'id\'=>\'5\', \'text\'=>\'名称 - 型号\'), array(\'id\'=>\'6\', \'text\'=>\'商品排序\')),'),(396,'导航条 - 按钮和图像','SHOW_PREVIOUS_NEXT_STATUS','0','是否显示按钮和图像:<br />0= 否<br />1= 是',18,20,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'否\'), array(\'id\'=>\'1\', \'text\'=>\'是\')),'),(397,'导航条 - 按钮和图像设置','SHOW_PREVIOUS_NEXT_IMAGES','0','显示按钮和图像的设置<br />0= 仅显示按钮<br />1= 按钮和商品图像<br />2= 仅显示商品图像',18,21,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'仅显示按钮\'), array(\'id\'=>\'1\', \'text\'=>\'按钮和商品图像\'), array(\'id\'=>\'2\', \'text\'=>\'仅显示商品图像\')),'),(398,'导航条 - 图像宽度?','PREVIOUS_NEXT_IMAGE_WIDTH','50','上一个/下一个 图像宽度?',18,22,NULL,'2013-05-08 21:35:16','',''),(399,'导航条 - 图像高度?','PREVIOUS_NEXT_IMAGE_HEIGHT','40','上一个/下一个 图像高度?',18,23,NULL,'2013-05-08 21:35:16','',''),(400,'分类导航条的位置','PRODUCT_INFO_CATEGORIES','1','商品的分类图像和名称位于导航条的上面<br />0= 否<br />1= 左对齐<br />2= 中间对齐<br />3= 右对齐',18,20,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'否\'), array(\'id\'=>\'1\', \'text\'=>\'左对齐\'), array(\'id\'=>\'2\', \'text\'=>\'中间对齐\'), array(\'id\'=>\'3\', \'text\'=>\'右对齐\')),'),(401,'分类导航条的名称和图像','PRODUCT_INFO_CATEGORIES_IMAGE_STATUS','2','商品分类图像和名称<br />0= 总是显示商品分类图像和名称<br />1= 只显示名称<br />2= 当非空时显示商品分类图像和名称',18,20,'2013-05-08 21:35:16','2013-05-08 21:35:16',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'分类和图像\'), array(\'id\'=>\'1\', \'text\'=>\'仅分类\'), array(\'id\'=>\'2\', \'text\'=>\'非空时分类和图像\')),'),(402,'栏目宽度 - 左栏目','BOX_WIDTH_LEFT','170px','左栏目边框的宽度<br />可以输入 px<br />缺省 = 150px',19,1,NULL,'2003-11-21 22:16:36',NULL,NULL),(403,'栏目宽度 - 右栏目','BOX_WIDTH_RIGHT','150px','右栏目边框的宽度<br />可以输入 px<br />缺省 = 150px',19,2,NULL,'2003-11-21 22:16:36',NULL,NULL),(404,'导航条分割符','BREAD_CRUMBS_SEPARATOR','&nbsp;::&nbsp;','输入导航条分隔符<br />提示: 空格用 &amp;nbsp; <br />缺省 = &amp;nbsp;::&amp;nbsp;',19,3,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small('),(405,'导航条','DEFINE_BREADCRUMB_STATUS','1','是否显示导航条<br />0= 关<br />1= 开<br />2= 仅不显示在首页',19,4,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(406,'畅销商品 - 数目填充','BEST_SELLERS_FILLER','&nbsp;','用什么分割数字?<br />缺省 = &amp;nbsp;',19,5,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small('),(407,'畅销商品 - 截断商品名称','BEST_SELLERS_TRUNCATE','35','商品名称截断长度?<br />缺省 = 35',19,6,NULL,'2003-11-21 22:16:36',NULL,NULL),(408,'畅销商品 - 截断商品名称后面加上 ...','BEST_SELLERS_TRUNCATE_MORE','true','截断商品名称时，后面加上 ...<br />缺省 = true',19,7,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(409,'购物车边框','SHOW_SHOPPING_CART_BOX_STATUS','1','是否显示购物车边框<br />0= 总是显示<br />1= 满的时候<br />2= 满的时候，但查看购物车时不显示',19,8,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(410,'分类栏 - 显示特价商品链接','SHOW_CATEGORIES_BOX_SPECIALS','true','在分类边框中显示特价商品链接',19,9,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(411,'分类栏 - 显示新进商品链接','SHOW_CATEGORIES_BOX_PRODUCTS_NEW','true','在分类边框中显示新进商品链接',19,10,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(412,'分类栏 - 显示推荐商品链接','SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS','true','在分类边框中显示推荐商品链接',19,11,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(413,'分类栏 - 显示所有商品链接','SHOW_CATEGORIES_BOX_PRODUCTS_ALL','true','在分类边框中显示所有商品链接',19,12,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(414,'左边栏目状态 - 全局','COLUMN_LEFT_STATUS','1','显示左栏目, 除非有文件替代<br />0= 左栏目总是关闭<br />1= 左栏目打开，除非有文件替代',19,15,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(415,'右边栏目状态 - 全局','COLUMN_RIGHT_STATUS','1','显示右栏目, 除非有文件替代<br />0= 右栏目总是关闭<br />1= 右栏目打开, 除非有文件替代',19,16,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(416,'栏目宽度 - 左','COLUMN_WIDTH_LEFT','170px','左边栏目的宽度<br />可以输入 px<br />缺省 = 150px',19,20,NULL,'2003-11-21 22:16:36',NULL,NULL),(417,'栏目宽度 - 右','COLUMN_WIDTH_RIGHT','150px','右边栏目的宽度<br />可以输入 px<br />缺省 = 150px',19,21,NULL,'2003-11-21 22:16:36',NULL,NULL),(418,'分类分割符','SHOW_CATEGORIES_SEPARATOR_LINK','1','分类名称之间显示分割符吗?<br />0= 否<br />1= 是',19,24,NULL,'2013-05-08 21:35:16',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(419,'分类名称和计数之间的分割符','CATEGORIES_SEPARATOR','','分类名称和计数间的分割符是?<br />缺省 = -&amp;gt;',19,25,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small('),(420,'分类名称和子分类之间的分割符','CATEGORIES_SEPARATOR_SUBS','','分类名称和子分类之间的分割符是?<br />缺省 = |_&amp;nbsp;',19,26,NULL,'2004-03-25 22:16:36',NULL,'zen_cfg_textarea_small('),(421,'分类计数前缀','CATEGORIES_COUNT_PREFIX','&nbsp;(','计数要加前缀吗?<br />缺省= (',19,27,NULL,'2003-01-21 22:16:36',NULL,'zen_cfg_textarea_small('),(422,'分类计数后缀','CATEGORIES_COUNT_SUFFIX',')','计算后缀是?<br />缺省= )',19,28,NULL,'2003-01-21 22:16:36',NULL,'zen_cfg_textarea_small('),(423,'分类子分类缩排','CATEGORIES_SUBCATEGORIES_INDENT','&nbsp;&nbsp;','子分类的缩进为?<br />缺省= &nbsp;&nbsp;',19,29,NULL,'2004-06-24 22:16:36',NULL,'zen_cfg_textarea_small('),(424,'没有商品的分类','CATEGORIES_COUNT_ZERO','0','显示商品数量为零的分类吗?<br />0= 否<br />1= 是',19,30,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(425,'分隔分类边框','CATEGORIES_SPLIT_DISPLAY','True','按商品类型分隔分类边框',19,31,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(426,'购物车 - 显示总计','SHOW_TOTALS_IN_CART','1','是否在购物车上显示总计<br />0= 否<br />1= 是: 件数 重量 金额<br />2= 是: 件数 重量 金额，重量为零时不显示<br />3= 是: 件数 金额',19,31,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(427,'顾客欢迎词 - 显示在首页','SHOW_CUSTOMER_GREETING','1','在首页上显示顾客欢迎词<br />0= 否<br />1= 是',19,40,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(428,'分类 - 总是显示在首页','SHOW_CATEGORIES_ALWAYS','0','首页显示分类<br />0= 否<br />1= 是<br />首页显示的分类可以是主分类或一个特定子分类',19,45,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(429,'首页 - 显示分类','CATEGORIES_START_MAIN','0','0= 主分类<br />或输入分类编号<br />提示: 也可以使用子分类，例如: 3_10',19,46,NULL,'2013-05-08 21:35:17','',''),(430,'分类 - 显示子分类','SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS','1','总是显示分类和子分类<br />0= 否, 只显示总分类<br />1= 是, 选择时总是显示分类和子分类',19,47,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(431,'广告显示组 - 标题位置 1','SHOW_BANNERS_GROUP_SET1','','广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 1，您要使用哪个广告组?<br />没有就留空',19,55,NULL,'2013-05-08 21:35:17','',''),(432,'广告显示组 - 标题位置 2','SHOW_BANNERS_GROUP_SET2','','广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 2，您要使用哪个广告组?<br />没有就留空',19,56,NULL,'2013-05-08 21:35:17','',''),(433,'广告显示组 - 标题位置 3','SHOW_BANNERS_GROUP_SET3','','广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 3，您要使用哪个广告组?<br />没有就留空',19,57,NULL,'2013-05-08 21:35:17','',''),(434,'广告显示组 - 页脚位置 1','SHOW_BANNERS_GROUP_SET4','','广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在页脚位置 1，您要使用哪个广告组?<br />没有就留空',19,65,NULL,'2013-05-08 21:35:17','',''),(435,'广告显示组 - 页脚位置 2','SHOW_BANNERS_GROUP_SET5','','广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在页脚位置 2，您要使用哪个广告组?<br />没有就留空',19,66,NULL,'2013-05-08 21:35:17','',''),(436,'广告显示组 - 页脚位置 3','SHOW_BANNERS_GROUP_SET6','','广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 Wide-Banners<br /><br />在页脚位置 3，您要使用哪个广告组?<br />没有就留空',19,67,NULL,'2013-05-08 21:35:17','',''),(437,'广告显示组 - 边框 banner_box','SHOW_BANNERS_GROUP_SET7','SideBox-Banners','广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 SideBox-Banners<br /><br />在边框的广告栏，您要使用哪个广告组?<br />没有就留空',19,70,NULL,'2013-05-08 21:35:17','',''),(438,'广告显示组 - 边框 banner_box2','SHOW_BANNERS_GROUP_SET8','SideBox-Banners','广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 SideBox-Banners<br /><br />在边框的广告栏2，您要使用哪个广告组?<br />没有就留空',19,71,NULL,'2013-05-08 21:35:17','',''),(439,'广告显示组 - 边框 banner_box_all','SHOW_BANNERS_GROUP_SET_ALL','BannersAll','所有广告边框栏只可以设置一个广告组<br /><br />缺省组为 BannersAll<br /><br />在边框的所有广告栏，您要使用哪个广告组?<br />没有就留空',19,72,NULL,'2013-05-08 21:35:17','',''),(440,'页脚 - 显示IP地址','SHOW_FOOTER_IP','0','在页脚显示客户IP地址吗<br />0= 否<br />1= 是',19,80,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(441,'商品优惠数量 - 添加多少空白优惠?','DISCOUNT_QTY_ADD','5','在商品价格上添加多少空白优惠?',19,90,NULL,'2013-05-08 21:35:17','',''),(442,'商品优惠数量 - 每行显示多少?','DISCOUNT_QUANTITY_PRICES_COLUMN','5','商品信息页面每行显示多少优惠?',19,95,NULL,'2013-05-08 21:35:17','',''),(443,'分类/商品显示顺序','CATEGORIES_PRODUCTS_SORT_ORDER','0','分类/商品显示顺序<br />0= 分类/商品显示顺序/名称<br />1= 分类/商品名称<br />2= 商品型号<br />3= 商品数量+, 商品名称<br />4= 商品数量-, 商品名称<br />5= 商品价格+, 商品名称<br />6= 商品价格-, 商品名称',19,100,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\'), '),(444,'选项名称和内容全局添加、复制和删除','OPTION_NAMES_VALUES_GLOBAL_STATUS','1','选项名称和内容全局添加、复制和删除<br />0= 隐藏<br />1= 显示<br />(默认=1)',19,110,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(445,'分类标签菜单 打开/关闭','CATEGORIES_TABS_STATUS','0','分类标签<br />在页眉显示商店的分类目录，自己发挥想象力。<br />0= 隐藏分类标签<br />1= 显示分类标签',19,112,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(446,'网站地图 - 是否包含我的帐号链接','SHOW_ACCOUNT_LINKS_ON_SITE_MAP','No','网站地图上是否显示到我的帐号的链接<br />说明: 搜索引擎会尝试索引该页面，通常不会转向安全页面，因为索引登录页面并无好处。<br /><br />缺省: false',19,115,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'Yes\', \'No\'), '),(447,'跳过单个商品的分类','SKIP_SINGLE_PRODUCT_CATEGORIES','True','跳过单个商品的分类<br />如果设置为True，客户点击单个商品的分类时，Zen Cart将直接显示商品页面。<br />缺省: True',19,120,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(448,'分开登录页面','USE_SPLIT_LOGIN_MODE','False','登录页面有两种显示模式: 分页模式 或 同页模式<br />分页模式，点击按钮后进入注册页面。同页模式，注册页面显示在登录之下。<br />缺省: True',19,121,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(449,'CSS按钮','IMAGE_USE_CSS_BUTTONS','No','CSS按钮<br />使用CSS按钮替代图像(GIF/JPG)<br />按钮格式在stylesheet文件中定义。',19,147,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'No\', \'Yes\'), '),(450,'<strong>关闭维护中: 开/关</strong>','DOWN_FOR_MAINTENANCE','false','网站维护中 <br />(true=是 false=否)',20,1,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(451,'网站维护中: 文件名','DOWN_FOR_MAINTENANCE_FILENAME','down_for_maintenance','网站维护中: 文件名 <br />备注: 不含后缀<br />缺省=down_for_maintenance',20,2,NULL,'2013-05-08 21:35:17',NULL,''),(452,'网站维护中: 隐藏页眉','DOWN_FOR_MAINTENANCE_HEADER_OFF','false','网站维护中: 隐藏页眉 <br />(true=隐藏 false=显示)',20,3,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(453,'网站维护中: 隐藏左栏目','DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF','false','网站维护中: 隐藏左栏目 <br />(true=隐藏 false=显示)',20,4,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(454,'网站维护中: 隐藏右栏目','DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF','false','网站维护中: 隐藏右栏目 <br />(true=隐藏 false=显示)',20,5,NULL,'2013-05-08 21:35:17',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(455,'网站维护中: 隐藏页脚','DOWN_FOR_MAINTENANCE_FOOTER_OFF','false','网站维护中: 隐藏页脚 <br />(true=隐藏 false=显示)',20,6,NULL,'2013-05-08 21:35:18',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(456,'网站维护中: 隐藏价格','DOWN_FOR_MAINTENANCE_PRICES_OFF','false','网站维护中: 隐藏价格 <br />(true=隐藏 false=显示)',20,7,NULL,'2013-05-08 21:35:18',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(457,'关闭维护中 (不包括该IP地址)','EXCLUDE_ADMIN_IP_FOR_MAINTENANCE','您的IP地址(管理员)','网站维护时，该地址仍然可以访问网站 (例如网管)<br />要输入多个地址，用逗号分开。如果您不知道IP地址，可以查看商店界面的页脚。',20,8,'2003-03-21 13:43:22','2003-03-21 21:20:07',NULL,NULL),(458,'关闭维护前发布通知: 开/关','WARN_BEFORE_DOWN_FOR_MAINTENANCE','false','是否在网站维护前给出提醒信息<br />(true=是 false=否)<br />如果您将\'网站维护中: 开/关\'设为开，该值自动设为否',20,9,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(459,'维护前的通知日期和小时','PERIOD_BEFORE_DOWN_FOR_MAINTENANCE','2003/05/15  2-3 PM','输入网站维护的日期和时间',20,10,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,NULL),(460,'显示网站管理员开始维护','DISPLAY_MAINTENANCE_TIME','false','显示网管何时开始维护 <br />(true=是 false=否)<br />',20,11,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(461,'显示网站维护时段','DISPLAY_MAINTENANCE_PERIOD','false','显示网站维护时段 <br />(true=是 false=否)<br />',20,12,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(462,'网站维护时段','TEXT_MAINTENANCE_PERIOD_TIME','2h00','输入网站维护时段(小时:分钟)',20,13,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,NULL),(463,'结帐时确认顾客须知中条款','DISPLAY_CONDITIONS_ON_CHECKOUT','true','结帐时显示客户必须同意的顾客须知中的条款。',11,1,NULL,'2013-05-08 21:35:18',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(464,'创建帐号时确认隐私声明','DISPLAY_PRIVACY_CONDITIONS','true','创建帐号时显示客户必须同意的隐私声明。',11,2,NULL,'2013-05-08 21:35:18',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(465,'显示商品图像','PRODUCT_NEW_LIST_IMAGE','1102','要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',21,1,NULL,'2013-05-08 21:35:18',NULL,NULL),(466,'显示商品数量','PRODUCT_NEW_LIST_QUANTITY','1202','要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',21,2,NULL,'2013-05-08 21:35:18',NULL,NULL),(467,'显示商品马上购买按钮','PRODUCT_NEW_BUY_NOW','1300','要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',21,3,NULL,'2013-05-08 21:35:18',NULL,NULL),(468,'显示商品名称','PRODUCT_NEW_LIST_NAME','2101','要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',21,4,NULL,'2013-05-08 21:35:18',NULL,NULL),(469,'显示商品型号','PRODUCT_NEW_LIST_MODEL','2201','要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',21,5,NULL,'2013-05-08 21:35:18',NULL,NULL),(470,'显示厂商名字','PRODUCT_NEW_LIST_MANUFACTURER','2302','要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',21,6,NULL,'2013-05-08 21:35:18',NULL,NULL),(471,'显示商品价格','PRODUCT_NEW_LIST_PRICE','2402','要显示商品价格吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',21,7,NULL,'2013-05-08 21:35:18',NULL,NULL),(472,'显示商品重量','PRODUCT_NEW_LIST_WEIGHT','2502','要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',21,8,NULL,'2013-05-08 21:35:18',NULL,NULL),(473,'显示商品加入日期','PRODUCT_NEW_LIST_DATE_ADDED','2601','要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',21,9,NULL,'2013-05-08 21:35:18',NULL,NULL),(474,'显示商品简介','PRODUCT_NEW_LIST_DESCRIPTION','150','商品简介显示的字数<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数',21,10,NULL,'2013-05-08 21:35:18',NULL,NULL),(475,'商品显示缺省排序','PRODUCT_NEW_LIST_SORT_DEFAULT','6','显示新进商品的缺省排序是什么?<br />缺省 = 6 日期由新到旧<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序',21,11,NULL,'2013-05-08 21:35:18',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), '),(476,'商品缺省的新组编号','PRODUCT_NEW_LIST_GROUP_ID','21','警告: 仅在新进商品组编号与缺省的21不同时，才修改该值。<br />新进商品组的编号是什么?',21,12,NULL,'2013-05-08 21:35:18',NULL,NULL),(477,'显示多个商品数量方框并设定按钮位置','PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART','3','要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时',21,25,NULL,'2013-05-08 21:35:18',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(478,'屏蔽预售商品','SHOW_NEW_PRODUCTS_UPCOMING_MASKED','0','要在边框和中框的新进商品列表中屏蔽预售商品吗?<br />0= 否<br />1= 是',21,30,NULL,'2013-05-08 21:35:18',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(479,'显示商品图像','PRODUCT_FEATURED_LIST_IMAGE','1102','要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',22,1,NULL,'2013-05-08 21:35:18',NULL,NULL),(480,'显示商品数量','PRODUCT_FEATURED_LIST_QUANTITY','1202','要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',22,2,NULL,'2013-05-08 21:35:18',NULL,NULL),(481,'显示商品马上购买按钮','PRODUCT_FEATURED_BUY_NOW','1300','要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',22,3,NULL,'2013-05-08 21:35:18',NULL,NULL),(482,'显示商品名称','PRODUCT_FEATURED_LIST_NAME','2101','要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',22,4,NULL,'2013-05-08 21:35:18',NULL,NULL),(483,'显示商品型号','PRODUCT_FEATURED_LIST_MODEL','2201','要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',22,5,NULL,'2013-05-08 21:35:18',NULL,NULL),(484,'显示厂商名字','PRODUCT_FEATURED_LIST_MANUFACTURER','2302','要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',22,6,NULL,'2013-05-08 21:35:18',NULL,NULL),(485,'显示商品价格','PRODUCT_FEATURED_LIST_PRICE','2402','要显示商品价格吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',22,7,NULL,'2013-05-08 21:35:18',NULL,NULL),(486,'显示商品重量','PRODUCT_FEATURED_LIST_WEIGHT','2502','要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',22,8,NULL,'2013-05-08 21:35:18',NULL,NULL),(487,'显示商品加入日期','PRODUCT_FEATURED_LIST_DATE_ADDED','2601','要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',22,9,NULL,'2013-05-08 21:35:18',NULL,NULL),(488,'显示商品简介','PRODUCT_FEATURED_LIST_DESCRIPTION','150','商品简介显示的字数?<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数',22,10,NULL,'2013-05-08 21:35:19',NULL,NULL),(489,'商品显示缺省排序','PRODUCT_FEATURED_LIST_SORT_DEFAULT','1','显示推荐商品的缺省排序是什么?<br />缺省 = 1 为商品名称<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序',22,11,NULL,'2013-05-08 21:35:19',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), '),(490,'推荐商品的缺省组编号','PRODUCT_FEATURED_LIST_GROUP_ID','22','警告: 仅在推荐商品组编号与缺省的22不同时，才修改该值<br />推荐商品组的编号是什么?',22,12,NULL,'2013-05-08 21:35:19',NULL,NULL),(491,'显示多个商品数量方框并设定按钮位置','PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART','3','要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时',22,25,NULL,'2013-05-08 21:35:19',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(492,'显示商品图像','PRODUCT_ALL_LIST_IMAGE','1102','要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',23,1,NULL,'2013-05-08 21:35:19',NULL,NULL),(493,'显示商品数量','PRODUCT_ALL_LIST_QUANTITY','1202','要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',23,2,NULL,'2013-05-08 21:35:19',NULL,NULL),(494,'显示商品马上购买按钮','PRODUCT_ALL_BUY_NOW','1300','要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',23,3,NULL,'2013-05-08 21:35:19',NULL,NULL),(495,'显示商品名称','PRODUCT_ALL_LIST_NAME','2101','要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',23,4,NULL,'2013-05-08 21:35:19',NULL,NULL),(496,'显示商品型号','PRODUCT_ALL_LIST_MODEL','2201','要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',23,5,NULL,'2013-05-08 21:35:19',NULL,NULL),(497,'显示厂商名字','PRODUCT_ALL_LIST_MANUFACTURER','2302','要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',23,6,NULL,'2013-05-08 21:35:19',NULL,NULL),(498,'显示商品价格','PRODUCT_ALL_LIST_PRICE','2402','要显示商品价格吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',23,7,NULL,'2013-05-08 21:35:19',NULL,NULL),(499,'显示商品重量','PRODUCT_ALL_LIST_WEIGHT','2502','要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',23,8,NULL,'2013-05-08 21:35:19',NULL,NULL),(500,'显示商品加入日期','PRODUCT_ALL_LIST_DATE_ADDED','2601','要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />',23,9,NULL,'2013-05-08 21:35:19',NULL,NULL),(501,'显示商品简介','PRODUCT_ALL_LIST_DESCRIPTION','150','商品简介显示的字数?<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数',23,10,NULL,'2013-05-08 21:35:19',NULL,NULL),(502,'商品显示缺省排序','PRODUCT_ALL_LIST_SORT_DEFAULT','1','显示所有商品的缺省排序是什么?<br />缺省 = 1 为商品名称<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序',23,11,NULL,'2013-05-08 21:35:19',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), '),(503,'商品缺省的所有组编号','PRODUCT_ALL_LIST_GROUP_ID','23','警告: 仅在所有商品组编号与缺省的23不同时，才修改该值<br />所有商品组的编号是什么?',23,12,NULL,'2013-05-08 21:35:19',NULL,NULL),(504,'显示多个商品数量方框并设定按钮位置','PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART','3','要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时',23,25,NULL,'2013-05-08 21:35:19',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(505,'在首页上显示新进商品','SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS','1','在首页上显示新进商品<br />0= 否 或设置排序顺序',24,65,NULL,'2013-05-08 21:35:19',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(506,'在首页上显示推荐商品','SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS','2','在首页上显示推荐商品<br />0= 否 或设置排序顺序',24,66,NULL,'2013-05-08 21:35:19',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(507,'在首页上显示特价商品','SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS','3','在首页上显示特价商品<br />0= 否 或设置排序顺序',24,67,NULL,'2013-05-08 21:35:19',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(508,'在首页上显示预售商品','SHOW_PRODUCT_INFO_MAIN_UPCOMING','4','在首页上显示预售商品<br />0= 否 或设置排序顺序',24,68,NULL,'2013-05-08 21:35:19',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(509,'在首页上显示新进商品 - 分类及子分类','SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS','1','在首页上显示新进商品 - 分类和子分类<br />0= 否 或设置排序顺序',24,70,NULL,'2013-05-08 21:35:19',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(510,'在首页上显示推荐商品 - 分类及子分类','SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS','2','在首页上显示推荐商品 - 分类和子分类<br />0= 否 或设置排序顺序',24,71,NULL,'2013-05-08 21:35:19',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(511,'在首页上显示特价商品 - 分类及子分类','SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS','3','在首页上显示特价商品 - 分类和子分类<br />0= 否 或设置排序顺序',24,72,NULL,'2013-05-08 21:35:19',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(512,'在首页上显示预售商品 - 分类及子分类','SHOW_PRODUCT_INFO_CATEGORY_UPCOMING','4','在首页上显示预售商品 - 分类和子分类<br />0= 否 或设置排序顺序',24,73,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(513,'在首页上显示新进商品 - 错误和丢失商品页','SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS','1','在首页上显示新进商品 - 错误和丢失商品<br />0= 否 或设置排序顺序',24,75,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(514,'在首页上显示推荐商品 - 错误和丢失商品页','SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS','2','在首页上显示推荐商品 - 错误和丢失商品<br />0= 否 或设置排序顺序',24,76,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(515,'在首页上显示特价商品 - 错误和丢失商品页','SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS','3','在首页上显示特价商品 - 错误和丢失商品<br />0= 否 或设置排序顺序',24,77,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(516,'在首页上显示预售商品 - 错误和丢失商品页','SHOW_PRODUCT_INFO_MISSING_UPCOMING','4','在首页上显示预售商品 - 错误和丢失商品<br />0= 否 或设置排序顺序',24,78,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(517,'显示新进商品 - 商品列表下','SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS','1','在商品列表下显示新进商品<br />0= 否 或设置排序顺序',24,85,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(518,'显示推荐商品 - 商品列表下','SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS','2','在商品列表下显示推荐商品<br />0= 否 或设置排序顺序',24,86,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(519,'显示特价商品 - 商品列表下','SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS','3','在商品列表下显示特价商品<br />0= 否 或设置排序顺序',24,87,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(520,'显示预售商品 - 商品列表下','SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING','4','在商品列表下显示推荐商品<br />0= 否 或设置排序顺序',24,88,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(521,'新进商品每行列数','SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS','3','每行显示的新进商品数',24,95,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), '),(522,'推荐商品每行列数','SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS','3','每行显示的推荐商品数',24,96,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), '),(523,'特价商品每行列数','SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS','3','每行显示的特价商品数',24,97,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), '),(524,'过滤当前主分类的商品列表','SHOW_PRODUCT_INFO_ALL_PRODUCTS','1','显示当前主分类的商品列表，还是显示所有分类中的商品?<br />0= 关闭过滤 1=打开过滤 ',24,100,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(525,'定义首页文字','DEFINE_MAIN_PAGE_STATUS','1','是否使用首页文字的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否',25,60,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(526,'定义联系我们','DEFINE_CONTACT_US_STATUS','1','是否使用联系我们的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否',25,61,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(527,'定义隐私声明','DEFINE_PRIVACY_STATUS','1','是否使用隐私声明的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否',25,62,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(528,'定义发货付款须知','DEFINE_SHIPPINGINFO_STATUS','1','是否使用发货付款须知的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否',25,63,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(529,'定义顾客须知','DEFINE_CONDITIONS_STATUS','1','是否使用顾客须知的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否',25,64,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(530,'定义成功结帐页面','DEFINE_CHECKOUT_SUCCESS_STATUS','1','是否使用成功结帐页的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否',25,65,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(531,'定义优惠券说明','DEFINE_DISCOUNT_COUPON_STATUS','1','是否使用优惠券说明的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否',25,66,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(532,'定义网站地图','DEFINE_SITE_MAP_STATUS','1','是否使用网站地图的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否',25,67,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(533,'定义Page-Not-Found','DEFINE_PAGE_NOT_FOUND_STATUS','1','使用定义页面下的Defined Page-Not-Found的文字?<br />0= 关闭定义文字<br />1= 打开定义文字',25,67,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(534,'定义页面二','DEFINE_PAGE_2_STATUS','1','是否使用页面二的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否',25,82,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(535,'定义页面三','DEFINE_PAGE_3_STATUS','1','是否使用页面三的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否',25,83,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(536,'定义页面四','DEFINE_PAGE_4_STATUS','1','是否使用页面四的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否',25,84,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(537,'简易页面 - 页眉','EZPAGES_STATUS_HEADER','1','在全局范围打开/关闭简易页面的页眉<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见',30,10,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(538,'简易页面 - 页脚','EZPAGES_STATUS_FOOTER','1','在全局范围打开/关闭简易页面的页脚<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见',30,11,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(539,'简易页面 - 边框','EZPAGES_STATUS_SIDEBOX','1','在全局范围打开/关闭简易页面的边框<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见',30,12,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(540,'简易页面页眉分隔符','EZPAGES_SEPARATOR_HEADER','::','简易页面页眉分隔符<br />缺省 = &amp;nbsp;::&amp;nbsp;',30,20,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_textarea_small('),(541,'简易页面页脚分隔符','EZPAGES_SEPARATOR_FOOTER','::','简易页面页脚分隔符<br />缺省 = &amp;nbsp;::&amp;nbsp;',30,21,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_textarea_small('),(542,'简易页面导航按钮','EZPAGES_SHOW_PREV_NEXT_BUTTONS','2','是否在简易页面上显示导航按钮<br />0=否 (无按钮)<br />1=\"继续\"<br />2=\"上一页/继续/下一页\"<br /><br />缺省: 2',30,30,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(543,'简易页面目录','EZPAGES_SHOW_TABLE_CONTENTS','1','打开简易页面章节的目录吗?<br />0= OFF<br />1= ON',30,35,'2013-05-08 21:35:20','2013-05-08 21:35:20',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(544,'简易页面中不显示页眉的页面','EZPAGES_DISABLE_HEADER_DISPLAY_LIST','','简易页面中不显示商店的页眉的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 1,5,2<br />或留空。',30,40,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_textarea_small('),(545,'简易页面中不显示页脚的页面','EZPAGES_DISABLE_FOOTER_DISPLAY_LIST','','简易页面中不显示商店的页脚的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 3,7<br />或留空。',30,41,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_textarea_small('),(546,'简易页面中不显示左栏目的页面','EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST','','简易页面中不显示商店的左栏目(边框)的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 21<br />或留空。',30,42,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_textarea_small('),(547,'简易页面中不显示右栏目的页面','EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST','','简易页面中不显示商店的右栏目(边框)的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 3,82,13<br />或留空。',30,43,NULL,'2013-05-08 21:35:20',NULL,'zen_cfg_textarea_small('),(548,'上传目录','EASYPOPULATE_CONFIG_TEMP_DIR','tempEP/','上传目录的名称(默认: tempEP/)',31,0,NULL,'2013-05-08 21:35:39',NULL,NULL),(549,'上传文件日期格式','EASYPOPULATE_CONFIG_FILE_DATE_FORMAT','y-m-d','选择上传文件日期格式，通常由MS Excel生成。上传文件的RAW日期 (例如 2005-09-26 09:00:00) 不受影响，会照样上传。',31,1,NULL,'2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\"m-d-y\", \"d-m-y\", \"y-m-d\"),'),(550,'默认时间格式','EASYPOPULATE_CONFIG_DEFAULT_RAW_TIME','09:00:00','如果上传文件中没有指定时间，将使用该值。适合指定特价在某个时间后生效。(默认: 09:00:00)',31,2,NULL,'2013-05-08 21:35:39',NULL,NULL),(551,'分批导入的数据量','EASYPOPULATE_CONFIG_SPLIT_MAX','300','缺省的分割上传文件的记录数目。用于防止大量上传时出现的超时。(默认: 300)',31,3,NULL,'2013-05-08 21:35:39',NULL,NULL),(552,'最大分类深度','EASYPOPULATE_CONFIG_MAX_CATEGORY_LEVELS','7','商店的最大分类深度，决定下载文件中分类的栏目数量 (默认: 7)',31,4,NULL,'2013-05-08 21:35:39',NULL,NULL),(553,'上传/下载价格含税','EASYPOPULATE_CONFIG_PRICE_INC_TAX','false','选择价格是否含税。',31,5,NULL,'2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\"true\", \"false\"),'),(554,'数量为零的产品不激活','EASYPOPULATE_CONFIG_ZERO_QTY_INACTIVE','false','批量上传时，如果产品数量为零，产品状态设置为未激活。(默认: false)',31,6,NULL,'2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\"true\", \"false\"),'),(555,'换行的智能标签替换','EASYPOPULATE_CONFIG_SMART_TAGS','true','上传文件中描述字段，回车符和换行符转换为HTML换行，防止格式错误(默认: true)',31,7,NULL,'2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\"true\", \"false\"),'),(556,'高级智能标签','EASYPOPULATE_CONFIG_ADV_SMART_TAGS','false','描述字段采用高级格式化，标题加粗、添加列表等。在ADMIN/easypopulate.php文件中设置 (默认: false)',31,8,NULL,'2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\"true\", \"false\"),'),(557,'调试记录','EASYPOPULATE_CONFIG_DEBUG_LOGGING','true','生成调试记录 (默认: true)',31,9,NULL,'2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\"true\", \"false\"),'),(558,'自定义产品字段','EASYPOPULATE_CONFIG_CUSTOM_FIELDS','','输入用逗号分割的产品数据表里的字段名称，将自动增加到导入、导出文件(例如: products_length, products_width). 请确认这些字段存在 PRODUCTS 表中。',31,10,NULL,'2013-05-08 21:35:39',NULL,NULL),(559,'商品列表 - 排列方式','PRODUCT_LISTING_LAYOUT_STYLE','rows','选择排列方式:<br />每个产品一行(rows) 还是每行显示多个产品(columns)<br />如果允许顾客自己选择排列方式，这里设定默认值。',8,40,NULL,'2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'rows\', \'columns\'),'),(560,'商品列表 - 每行列数','PRODUCT_LISTING_COLUMNS_PER_ROW','3','选择商品列表中每行显示的商品数目，缺省为3',8,41,NULL,'2013-05-08 21:35:39',NULL,NULL),(561,'商品列表 - 排列方式 - 顾客控制','PRODUCT_LISTING_LAYOUT_STYLE_CUSTOMER','1','是否允许顾客自己选择排列方式 (1=是, 0=否):',8,42,NULL,'2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(562,'<b>图片展示</b>','ZEN_LIGHTBOX_STATUS','true','<br />如果设置为 true，以下页面的产品图片将启用图片展示效果:<br /><br />- document_general_info<br />- document_product_info<br />- page (简易页面)<br />- product_free_shipping_info<br />- product_info<br />- product_music_info<br />- product_reviews<br />- product_reviews_info<br />- product_reviews_write<br /><br /><b>默认: true</b>',32,100,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(563,'透明度','ZEN_LIGHTBOX_OVERLAY_OPACITY','0.8','<br />设置透明度。<br /><br /><b>默认: 0.8</b>',32,101,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'0\', \'0.1\', \'0.2\', \'0.3\', \'0.4\', \'0.5\', \'0.6\', \'0.7\', \'0.8\', \'0.9\', \'1\'), '),(564,'背景淡出时长','ZEN_LIGHTBOX_OVERLAY_FADE_DURATION','400','<br />控制背景淡出时长。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />',32,102,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,NULL),(565,'变化尺寸时长','ZEN_LIGHTBOX_RESIZE_DURATION','400','<br />设定变换图片尺寸的速度。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />',32,103,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,NULL),(566,'变换尺寸','ZEN_LIGHTBOX_RESIZE_TRANSITION','false','<br />允许设定展示图片的大小。<br /><br /><b>默认: false</b><br />',32,104,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,NULL),(567,'初始化宽度','ZEN_LIGHTBOX_INITIAL_WIDTH','250','<br />显示图片的宽度。<br /><br />说明: 以点为单位。<br /><br /><b>默认: 250</b><br />',32,105,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,NULL),(568,'初始化高度','ZEN_LIGHTBOX_INITIAL_HEIGHT','250','<br />显示图片的高度。<br /><br />说明: 以点为单位。<br /><br /><b>默认: 250</b><br />',32,106,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,NULL),(569,'图片淡出时长','ZEN_LIGHTBOX_IMAGE_FADE_DURATION','400','<br />设定图片淡出时长。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />',32,107,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,NULL),(570,'动态标题时长','ZEN_LIGHTBOX_CAPTION_ANIMATION_DURATION','400','<br />设定动态标题的时长。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />',32,108,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,NULL),(571,'显示图片计数','ZEN_LIGHTBOX_COUNTER','true','<br />设置为true时显示图片计数(图片标题下面)。<br /><br /><b>默认: true</b>',32,109,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(572,'点击图片关闭窗口','ZEN_LIGHTBOX_CLOSE_IMAGE','false','<br />设置为true时，点击图片关闭窗口。<br /><br /><b>默认: false</b>',32,110,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(573,'点击背景关闭窗口','ZEN_LIGHTBOX_CLOSE_OVERLAY','false','<br />设置为true时，点击背景关闭窗口。<br /><br /><b>默认: false</b>',32,111,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(574,'显示翻页按钮','ZEN_LIGHTBOX_PREV_NEXT','false','<br />设置为true时，总是显示前后翻页按钮。说明: 点击图片关闭窗口设置为TRUE时，本参数无效。<br /><br /><b>默认: false</b>',32,112,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(575,'<b>键盘翻页</b>','ZEN_LIGHTBOX_KEYBOARD_NAVIGATION','true','<br />设置为true时，可以用键盘控制翻页。<br /><br /><b>默认: true</b>',32,200,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(576,'关闭展示','ZEN_LIGHTBOX_ESCAPE_KEYS','27,88,67','<br />下面的所有按键都可关闭图片展示。<br /><br />说明: 仅可以输入<a href=\"http://en.wikipedia.org/wiki/ASCII\" target=\"_blank\">ASCII</a>十进制值，多个值用逗号分开。<br /><br /><b>默认: 27,88,67</b><br />',32,201,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,NULL),(577,'上一张','ZEN_LIGHTBOX_PREVIOUS_KEYS','37,80','<br />这些按键显示上一张图片。<br /><br />说明: 仅可以输入<a href=\"http://en.wikipedia.org/wiki/ASCII\" target=\"_blank\">ASCII</a>十进制值，多个值用逗号分开。<br /><br /><b>默认: 37,80</b><br />',32,202,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,NULL),(578,'下一张','ZEN_LIGHTBOX_NEXT_KEYS','39,78','<br />这些按键显示下一张图片。<br /><br />说明: 仅可以输入<a href=\"http://en.wikipedia.org/wiki/ASCII\" target=\"_blank\">ASCII</a>十进制值，多个值用逗号分开。<br /><br /><b>默认: 39,78</b><br />',32,203,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,NULL),(579,'<b>图库模式</b>','ZEN_LIGHTBOX_GALLERY_MODE','true','<br />设置为true时，使用前后按钮快速显示附加图片。<br /><br /><b>默认: true</b>',32,300,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(580,'商品主图','ZEN_LIGHTBOX_GALLERY_MAIN_IMAGE','true','<br />设置为true时，图库中包含商品主图。<br /><br /><b>默认: true</b>',32,301,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(581,'<b>支持简易页面</b>','ZEN_LIGHTBOX_EZPAGES','true','<br />设置为true时，所有简易页面的链接图片启用图片展示效果。<br /><br /><b>默认: true</b>',32,400,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(582,'文件类型','ZEN_LIGHTBOX_FILE_TYPES','jpg,png,gif','<br />简易页面上的以下图片类型启用图片展示效果。<br /><br /><b>默认: jpg,png,gif</b><br />',32,401,'2013-05-08 21:35:39','2013-05-08 21:35:39',NULL,NULL),(583,'启用网址优化吗?','SEO_ENABLED','false','是否启用网址优化? 这是整站的开关。<br /><br />请将根目录下的文件htaccess_sample改名为 .htaccess，并修改其中的 /shop/ 为您的zen cart目录。如果Zen Cart安装在网页服务器的根目录下，就设置为 /。<br /><br />打开网址优化后，请执行一次下面的重置缓存(reset)操作。',33,0,'2013-05-08 21:57:58','2013-05-08 21:57:58',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(584,'在商品的网址中添加cPath吗?','SEO_ADD_CPATH_TO_PRODUCT_URLS','false','在商品的网址后添加cPath (例如: some-product-p-1.html?cPath=xx).',33,1,'2013-05-08 21:57:58','2013-05-08 21:57:58',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(585,'商品分类的网址中包括上级分类名称吗?','SEO_ADD_CAT_PARENT','false','在分类网址前增加上级分类名称 (例如: parent-category-c-1.html).',33,2,'2013-05-08 21:57:58','2013-05-08 21:57:58',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(586,'商品的网址中包括上级分类名称吗?','SEO_ADD_PRODUCT_CAT','false','在商品网址前加上级分类名称 (例如: category-c-1/product-p-1.html)。',33,3,'2013-05-08 21:57:58','2013-05-08 21:57:58',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(587,'过滤太短的单词','SEO_URLS_FILTER_SHORT_WORDS','0','该设置从网址中过滤少于指定值的单词。',33,4,'2013-05-08 21:57:58','2013-05-08 21:57:58',NULL,NULL),(588,'输出兼容W3C的网址 (参数)?','SEO_URLS_USE_W3C_VALID','false','该设置输出兼容W3C的网址。',33,5,'2013-05-08 21:57:58','2013-05-08 21:57:58',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(589,'打开缓存以减少查询次数吗?','USE_SEO_CACHE_GLOBAL','true','该设置可以完全关闭缓存。',33,6,'2013-05-08 21:57:58','2013-05-08 21:57:58',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(590,'打开商品缓存吗?','USE_SEO_CACHE_PRODUCTS','true','该设置可以关闭商品缓存。',33,7,'2013-05-08 21:57:58','2013-05-08 21:57:58',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(591,'打开目录缓存吗?','USE_SEO_CACHE_CATEGORIES','true','该设置可以关闭分类缓存。',33,8,'2013-05-08 21:57:58','2013-05-08 21:57:58',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(592,'打开厂家缓存吗?','USE_SEO_CACHE_MANUFACTURERS','true','该设置可以关闭厂家缓存。',33,9,'2013-05-08 21:57:58','2013-05-08 21:57:58',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(593,'打开文章缓存吗?','USE_SEO_CACHE_ARTICLES','true','该设置可以关闭文章缓存。',33,10,'2013-05-08 21:57:58','2013-05-08 21:57:58',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(594,'打开信息缓存吗?','USE_SEO_CACHE_INFO_PAGES','true','该设置可以关闭信息缓存。',33,11,'2013-05-08 21:57:59','2013-05-08 21:57:59',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(595,'打开自动跳转吗?','USE_SEO_REDIRECT','true','该设置实现自动跳转，发送301文件头实现旧网址转向新网址。',33,12,'2013-05-08 21:57:59','2013-05-08 21:57:59',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(596,'选择网址重写类型','SEO_REWRITE_TYPE','Rewrite','选择网址重写的格式。',33,13,'2013-05-08 21:57:59','2013-05-08 21:57:59',NULL,'zen_cfg_select_option(array(\'Rewrite\'),'),(597,'输入特殊字符转换','SEO_CHAR_CONVERT_SET','','该设置转换特殊字符。<br><br>格式<b>必须</b>为: <b>char=>conv,char2=>conv2</b>',33,14,'2013-05-08 21:57:59','2013-05-08 21:57:59',NULL,NULL),(598,'要删除字母数字外的所有字符吗?','SEO_REMOVE_ALL_SPEC_CHARS','false','该设置可以删除所有除字母和数字外的字符。',33,15,'2013-05-08 21:57:59','2013-05-08 21:57:59',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(599,'输入网址的 PCRE 过滤规则','SEO_URLS_FILTER_PCRE','','使用PCRE规则过滤生成的网址。<br><br>格式<b>必须</b>为: <b>find1=>replace1,find2=>replace2</b>. 在字符转换和删除特殊字符前运行。如果网址中要短横线 - ，可以使用空格。如果是反斜线，要输入两次',33,16,'2013-05-08 21:57:59','2013-05-08 21:57:59',NULL,NULL),(600,'重置缓存','SEO_URLS_CACHE_RESET','false','该设置重置搜索引擎优化缓存的数据。',33,17,'2013-05-08 21:57:59','2013-05-08 21:57:59','zen_reset_cache_data_seo_urls','zen_cfg_select_option(array(\'reset\', \'false\'),'),(601,'输入需要优化的页面','SEO_URLS_ONLY_IN','index, product_info, products_new, products_all, featured_products, specials, contact_us, conditions, privacy, reviews, shippinginfo, faqs_all, site_map, gv_faq, discount_coupon, page, page_2, page_3, page_4, login, account, create_account, advanced_search, product_free_shipping_info, product_music_info, document_product_info, document_general_info, shopping_cart, unsubscribe','本设置指定需要网址重写的页面，如果为空，所有页面网址都重写。<br><br>默认页面为: <b>index, product_info, products_new, products_all, featured_products, specials, contact_us, conditions, privacy, reviews, shippinginfo, faqs_all, site_map, gv_faq, discount_coupon, page, page_2, page_3, page_4, login, account, create_account, advanced_search, product_free_shipping_info, product_music_info, document_product_info, document_general_info, shopping_cart, unsubscribe</b>',33,18,'2013-05-08 21:57:59','2013-05-08 21:57:59',NULL,NULL),(602,'Use root path for cookie path','SESSION_USE_ROOT_COOKIE_PATH','False','Normally Zen Cart will use the directory that a store resides in as the cookie path. This can cause problems with some servers. This setting allows you to set the cookie path to the root of the server, rather than the store directory. It should only be used if you have problems with sessions. <strong>Default Value = False</strong><br /><br /><strong>Changing this setting may mean you have problems logging into your admin, you should clear your browser cookies to overcome this.</strong>',15,999,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(603,'Add period prefix to cookie domain','SESSION_ADD_PERIOD_PREFIX','True','Normally Zen Cart will add a period prefix to the cookie domain, e.g.  .www.mydomain.com. This can sometimes cause problems with some server configurations. If you are having session problems you may want to try setting this to False. <strong>Default Value = True</strong>',15,999,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(604,'IH 调整图像大小','IH_RESIZE','no','Zen-Cart的缺省设置为 -no-，要打开自动调整图像大小，设置为 -yes-。--说明: 如果选择 -no-, 所有图像管理相关的设置会失效，包括: 图像文件类型选择、背景颜色、压缩、弹出图像和水印-- 如果要使用ImageMagick，请在<em>includes/extra_configures/bmz_image_handler_conf.php</em>中设定<strong>convert</strong>文件的路径。',4,1001,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,'zen_cfg_select_option(array(\'yes\',\'no\'),'),(605,'IH 小图像文件类型','SMALL_IMAGE_FILETYPE','no_change','可选择 -jpg-, -gif- 或 -png-。Internet Explorer v6.0 以下版本不能正常显示透明背景的 -png- 图像。虽然 -png- 非常适合透明背景的图片，但是如果要支持旧版的IE，最好设置为 -gif-。较大的图像请使用 -jpg- 或者 -png-。zen-cart的默认方式是 -no_change-，小图像采用与上传的图像相同的后缀。',4,1011,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,'zen_cfg_select_option(array(\'gif\',\'jpg\',\'png\',\'no_change\'),'),(606,'IH 小图像背景','SMALL_IMAGE_BACKGROUND','255:255:255','如果上传的是透明背景图像，该颜色将替代图片的透明部分。保持透明设置为 -transparent-',4,1021,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,NULL),(607,'IH 小图像压缩质量','SMALL_IMAGE_QUALITY','85','设定期望的JPG小图像质量，数字值从0到100。值越高图像质量越好，图像文件也越大。缺省为85，通常可以满足要求。',4,1031,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,NULL),(608,'IH 小图像水印','WATERMARK_SMALL_IMAGES','no','如果小图像要显示水印，设置为 -yes-',4,1041,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,'zen_cfg_select_option(array(\'no\',\'yes\'),'),(609,'IH 放大小图像','ZOOM_SMALL_IMAGES','yes','如果要在鼠标移动到小图像上时，显示放大的图像，设置为 -yes-',4,1051,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,'zen_cfg_select_option(array(\'no\',\'yes\'),'),(610,'IH 小图像放大尺寸','ZOOM_IMAGE_SIZE','Medium','如果小图像放大为中图，设置为 -Medium-，如果要放大为大图，设置为 -Large-',4,1061,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,'zen_cfg_select_option(array(\'Medium\',\'Large\'),'),(611,'IH 中图像文件类型','MEDIUM_IMAGE_FILETYPE','no_change','可选择 -jpg-, -gif- 或 -png-。Internet Explorer v6.0 以下版本不能正常显示透明背景的 -png- 图像。虽然 -png- 非常适合透明背景的图片，但是如果要支持旧版的IE，最好设置为 -gif-。较大的图像请使用 -jpg- 或者 -png-。zen-cart的默认方式是 -no_change-，中图像采用与上传的图像相同的后缀。',4,1071,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,'zen_cfg_select_option(array(\'gif\',\'jpg\',\'png\',\'no_change\'),'),(612,'IH 中图像背景','MEDIUM_IMAGE_BACKGROUND','255:255:255','如果上传的是透明背景图像，该颜色将替代图片的透明部分。保持透明设置为 -transparent-',4,1081,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,NULL),(613,'IH 中图像压缩质量','MEDIUM_IMAGE_QUALITY','85','设定期望的JPG中图像质量，数字值从0到100。值越高图像质量越好，图像文件也越大。缺省为85，通常可以满足要求。',4,1091,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,NULL),(614,'IH 中图像水印','WATERMARK_MEDIUM_IMAGES','no','如果中图像要显示水印，设置为 -yes-',4,1101,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,'zen_cfg_select_option(array(\'no\',\'yes\'),'),(615,'IH 大图像文件类型','LARGE_IMAGE_FILETYPE','no_change','可选择 -jpg-, -gif- 或 -png-。Internet Explorer v6.0 以下版本不能正常显示透明背景的 -png- 图像。虽然 -png- 非常适合透明背景的图片，但是如果要支持旧版的IE，最好设置为 -gif-。较大的图像请使用 -jpg- 或者 -png-。zen-cart的默认方式是 -no_change-，大图像采用与上传的图像相同的后缀。',4,1111,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,'zen_cfg_select_option(array(\'gif\',\'jpg\',\'png\',\'no_change\'),'),(616,'IH 大图像背景','LARGE_IMAGE_BACKGROUND','255:255:255','如果上传的是透明背景图像，该颜色将替代图片的透明部分。保持透明设置为 -transparent-',4,1121,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,NULL),(617,'IH 大图像压缩质量','LARGE_IMAGE_QUALITY','85','设定期望的JPG大图像质量，数字值从0到100。值越高图像质量越好，图像文件也越大。缺省为85，通常可以满足要求。',4,1131,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,NULL),(618,'IH 大图像水印','WATERMARK_LARGE_IMAGES','no','如果大图像要显示水印，设置为 -yes-',4,1141,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,'zen_cfg_select_option(array(\'no\',\'yes\'),'),(619,'IH 大图像最大宽度','LARGE_IMAGE_MAX_WIDTH','750','设置大图像的最大宽度。如果宽度和高度为空或0，将不会自动调整大图像的大小。',4,1151,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,NULL),(620,'IH 大图像最大高度','LARGE_IMAGE_MAX_HEIGHT','550','设置大图像的最大高度。如果宽度和高度为空或0，将不会自动调整大图像的大小。',4,1161,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,NULL),(621,'IH 水印位置','WATERMARK_GRAVITY','Center','选择水印在图像中的位置，默认为 <strong>Center</Strong>.',4,1171,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,'zen_cfg_select_option(array(\'Center\',\'NorthWest\',\'North\',\'NorthEast\',\'East\',\'SouthEast\',\'South\',\'SouthWest\',\'West\'),'),(622,'图像管理版本','IH_VERSION','4.0','仅保存图像管理版本，但不显示在配置菜单中。',0,10000,'2013-05-08 21:58:06','2013-05-08 21:58:06',NULL,NULL),(623,'API密钥','API_KEY','123456','API密钥',34,1,'2013-05-09 20:44:24','2013-05-09 20:44:24',NULL,NULL),(624,'API输入数据格式','API_INPUT_FORMAT','json','API输入数据格式',34,1,'2013-05-09 20:44:24','2013-05-09 20:44:24',NULL,'zen_cfg_select_option(array(\'json\', \'xml\'), '),(625,'API输出数据格式','API_OUTPUT_FORMAT','json','API输出数据格式',34,1,'2013-05-09 20:44:24','2013-05-09 20:44:24',NULL,'zen_cfg_select_option(array(\'json\', \'xml\'), '),(626,'API上传图片最大高度','PRODUCT_MEDIUM_LARGE_HEIGHT','800','API上传图片最大像素高度',34,1,'2013-05-09 20:44:24','2013-05-09 20:44:24',NULL,NULL),(627,'API上传图片最小宽度','PRODUCT_MEDIUM_LARGE_WIDTH','700','API上传图片最小像素宽度',34,1,'2013-05-09 20:44:24','2013-05-09 20:44:24',NULL,NULL),(628,'API上传图片中图宽度','PRODUCT_MEDIUM_IMAGE_WIDTH','282','API上传图片中图像素宽度',34,1,'2013-05-09 20:44:24','2013-05-09 20:44:24',NULL,NULL),(629,'图片中图高度','PRODUCT_MEDIUM_IMAGE_HEIGHT','282','API上传图片中图像素高度',34,1,'2013-05-09 20:44:24','2013-05-09 20:44:24',NULL,NULL),(630,'API上传图片小图高度','PRODUCT_MEDIUM_SMALL_WIDTH','150','API上传图片最小像素宽度',34,1,'2013-05-09 20:44:24','2013-05-09 20:44:24',NULL,NULL),(631,'API上传图片小图高度','PRODUCT_MEDIUM_SMALL_HEIGHT','150','API上传图片最小像素高度',34,1,'2013-05-09 20:44:24','2013-05-09 20:44:24',NULL,NULL),(632,'借卖网会员登陆名','JMW_API_LOGIN_NAME','kaiweicai','借卖网会员登陆名',34,12,'2013-05-09 20:44:24','2013-05-09 20:44:24',NULL,NULL),(633,'借卖网会员密码','JMW_API_KEY','yousini979','借卖网会员密码',34,12,'2013-05-09 20:44:24','2013-05-09 20:44:24',NULL,NULL),(634,'借卖网-API WDSL有效地址','JMW_API_WSDL_URL','http://www.jiemai.com/services/JieMaiSlService?wsdl','借卖网-API WDSL有效地址',34,13,'2013-05-09 20:44:25','2013-05-09 20:44:25',NULL,NULL),(635,'借卖网会员Token认证','JMW_API_USER_TOKEN','7f419841-3075-4848-abbe-bc728d620d11','借卖网会员Token认证',34,12,'2013-05-09 20:44:25','2013-05-09 20:44:25',NULL,NULL),(636,'借卖网-借卖网产品价格设置','JMW_API_PRICE_RATE','20','借卖网-在借卖网产品原价格加*%,默认为 20 ',34,15,'2013-05-09 20:44:25','2013-05-09 20:44:25',NULL,NULL),(637,'借卖网-借卖网产品库存设置','JMW_API_PRODUCTS_QUANTITY','10','借卖网-借卖网产品库存设置,默认为 10 ',34,16,'2013-05-09 20:44:25','2013-05-09 20:44:25',NULL,NULL),(638,'借卖网-每页显示产品数','JMW_API_PRODUCTS_LIST','20','借卖网-每页显示产品数,默认为 20 ',34,17,'2013-05-09 20:44:25','2013-05-09 20:44:25',NULL,NULL),(639,'根据订单状态发送订单信息','JMW_API_ORDERS_STATUS','2','填写订单状态ID，默认为付款后才能发送订单到借卖网',34,17,'2013-05-09 20:44:25','2013-05-09 20:44:25',NULL,NULL),(640,'人民币汇率值','API_CURRENCIES_ID_SETUP','6.3636','请填写人民币相对网店默认币种的汇率值(借卖网产品默认是人民币,默认值为相对美元的汇率:6.3636)',34,17,'2013-05-09 20:44:25','2013-05-09 20:44:25',NULL,NULL),(641,'网店名称','JMW_API_SHOPNAME','','网店名称',34,18,'2013-05-09 20:44:25','2013-05-09 20:44:25',NULL,NULL),(642,'网店地址','JMW_API_SHOPURL','http://localhost/zencart/','网店地址',34,19,'2013-05-09 20:44:25','2013-05-09 20:44:25',NULL,NULL),(643,'网店服务地址','JMW_API_SERVICEURL','http://localhost/zencart/myadmin/jmwservice.php','此服务地址,当借卖网的产品有库存变化,上下架时,会自动更新网店从借卖网导入的产品,',34,20,'2013-05-09 20:44:25','2013-05-09 20:44:25',NULL,NULL);
/*!40000 ALTER TABLE `cnconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnconfiguration_group`
--

DROP TABLE IF EXISTS `cnconfiguration_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnconfiguration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL DEFAULT '',
  `configuration_group_description` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`),
  KEY `idx_visible_zen` (`visible`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnconfiguration_group`
--

LOCK TABLES `cnconfiguration_group` WRITE;
/*!40000 ALTER TABLE `cnconfiguration_group` DISABLE KEYS */;
INSERT INTO `cnconfiguration_group` (`configuration_group_id`, `configuration_group_title`, `configuration_group_description`, `sort_order`, `visible`) VALUES (1,'基本设置','商店的基本情况',1,1),(2,'最小值','功能/数据的最小值',2,1),(3,'最大值','功能/数据的最大值',3,1),(4,'图像参数','图像参数',4,1),(5,'客户资料','客户帐号选项配置',5,1),(6,'模块选项','在配置中不可见',6,0),(7,'配送参数','配送参数选项',7,1),(8,'商品列表','商品列表配置选项',8,1),(9,'库存选项','库存配置选项',9,1),(10,'日志选项','日志配置选项',10,1),(11,'条款选项','条款选项',16,1),(12,'电子邮件','电子邮件的基本设置',12,1),(13,'属性设置','商品属性设置',13,1),(14,'GZip压缩','GZip压缩选项',14,1),(15,'Sessions','Sessions选项',15,1),(16,'礼券和优惠券','礼券和优惠券',16,1),(17,'信用卡','接受的信用卡',17,1),(18,'商品信息','商品信息显示选项',18,1),(19,'布局设置','布局选项',19,1),(20,'网站维护','网站维护选项',20,1),(21,'新进商品','新进商品列表',21,1),(22,'推荐商品','推荐商品列表',22,1),(23,'所有商品','所有商品列表',23,1),(24,'商品索引','商品索引页面',24,1),(25,'定义页面','定义首页和其它HTML页面',25,1),(30,'简易页面设置','简易页面设置',30,1),(31,'批量商品管理','批量商品管理设置',31,1),(32,'图片展示','图片展示设置',32,1),(33,'网址优化','网址优化模块的选项',33,1),(34,'借卖网:API设置','借卖网-API相关设置',744,1);
/*!40000 ALTER TABLE `cnconfiguration_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncounter`
--

DROP TABLE IF EXISTS `cncounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncounter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncounter`
--

LOCK TABLES `cncounter` WRITE;
/*!40000 ALTER TABLE `cncounter` DISABLE KEYS */;
INSERT INTO `cncounter` (`startdate`, `counter`) VALUES ('20130508',26);
/*!40000 ALTER TABLE `cncounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncounter_history`
--

DROP TABLE IF EXISTS `cncounter_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncounter_history` (
  `startdate` char(8) NOT NULL DEFAULT '',
  `counter` int(12) DEFAULT NULL,
  `session_counter` int(12) DEFAULT NULL,
  PRIMARY KEY (`startdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncounter_history`
--

LOCK TABLES `cncounter_history` WRITE;
/*!40000 ALTER TABLE `cncounter_history` DISABLE KEYS */;
INSERT INTO `cncounter_history` (`startdate`, `counter`, `session_counter`) VALUES ('20130508',5,1),('20130509',1,1),('20130510',17,1),('20130511',3,1);
/*!40000 ALTER TABLE `cncounter_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncountries`
--

DROP TABLE IF EXISTS `cncountries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncountries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  `address_format_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`countries_id`),
  KEY `idx_countries_name_zen` (`countries_name`),
  KEY `idx_address_format_id_zen` (`address_format_id`),
  KEY `idx_iso_2_zen` (`countries_iso_code_2`),
  KEY `idx_iso_3_zen` (`countries_iso_code_3`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncountries`
--

LOCK TABLES `cncountries` WRITE;
/*!40000 ALTER TABLE `cncountries` DISABLE KEYS */;
INSERT INTO `cncountries` (`countries_id`, `countries_name`, `countries_iso_code_2`, `countries_iso_code_3`, `address_format_id`) VALUES (1,'Afghanistan','AF','AFG',1),(2,'Albania','AL','ALB',1),(3,'Algeria','DZ','DZA',1),(4,'American Samoa','AS','ASM',1),(5,'Andorra','AD','AND',1),(6,'Angola','AO','AGO',1),(7,'Anguilla','AI','AIA',1),(8,'Antarctica','AQ','ATA',1),(9,'Antigua and Barbuda','AG','ATG',1),(10,'Argentina','AR','ARG',1),(11,'Armenia','AM','ARM',1),(12,'Aruba','AW','ABW',1),(13,'Australia','AU','AUS',1),(14,'Austria','AT','AUT',5),(15,'Azerbaijan','AZ','AZE',1),(16,'Bahamas','BS','BHS',1),(17,'Bahrain','BH','BHR',1),(18,'Bangladesh','BD','BGD',1),(19,'Barbados','BB','BRB',1),(20,'Belarus','BY','BLR',1),(21,'Belgium','BE','BEL',1),(22,'Belize','BZ','BLZ',1),(23,'Benin','BJ','BEN',1),(24,'Bermuda','BM','BMU',1),(25,'Bhutan','BT','BTN',1),(26,'Bolivia','BO','BOL',1),(27,'Bosnia and Herzegowina','BA','BIH',1),(28,'Botswana','BW','BWA',1),(29,'Bouvet Island','BV','BVT',1),(30,'Brazil','BR','BRA',1),(31,'British Indian Ocean Territory','IO','IOT',1),(32,'Brunei Darussalam','BN','BRN',1),(33,'Bulgaria','BG','BGR',1),(34,'Burkina Faso','BF','BFA',1),(35,'Burundi','BI','BDI',1),(36,'Cambodia','KH','KHM',1),(37,'Cameroon','CM','CMR',1),(38,'Canada','CA','CAN',2),(39,'Cape Verde','CV','CPV',1),(40,'Cayman Islands','KY','CYM',1),(41,'Central African Republic','CF','CAF',1),(42,'Chad','TD','TCD',1),(43,'Chile','CL','CHL',1),(44,'China','CN','CHN',1),(45,'Christmas Island','CX','CXR',1),(46,'Cocos (Keeling) Islands','CC','CCK',1),(47,'Colombia','CO','COL',1),(48,'Comoros','KM','COM',1),(49,'Congo','CG','COG',1),(50,'Cook Islands','CK','COK',1),(51,'Costa Rica','CR','CRI',1),(52,'Cote D\'Ivoire','CI','CIV',1),(53,'Croatia','HR','HRV',1),(54,'Cuba','CU','CUB',1),(55,'Cyprus','CY','CYP',1),(56,'Czech Republic','CZ','CZE',1),(57,'Denmark','DK','DNK',1),(58,'Djibouti','DJ','DJI',1),(59,'Dominica','DM','DMA',1),(60,'Dominican Republic','DO','DOM',1),(61,'Timor-Leste','TL','TLS',1),(62,'Ecuador','EC','ECU',1),(63,'Egypt','EG','EGY',1),(64,'El Salvador','SV','SLV',1),(65,'Equatorial Guinea','GQ','GNQ',1),(66,'Eritrea','ER','ERI',1),(67,'Estonia','EE','EST',1),(68,'Ethiopia','ET','ETH',1),(69,'Falkland Islands (Malvinas)','FK','FLK',1),(70,'Faroe Islands','FO','FRO',1),(71,'Fiji','FJ','FJI',1),(72,'Finland','FI','FIN',1),(73,'France','FR','FRA',1),(75,'French Guiana','GF','GUF',1),(76,'French Polynesia','PF','PYF',1),(77,'French Southern Territories','TF','ATF',1),(78,'Gabon','GA','GAB',1),(79,'Gambia','GM','GMB',1),(80,'Georgia','GE','GEO',1),(81,'Germany','DE','DEU',5),(82,'Ghana','GH','GHA',1),(83,'Gibraltar','GI','GIB',1),(84,'Greece','GR','GRC',1),(85,'Greenland','GL','GRL',1),(86,'Grenada','GD','GRD',1),(87,'Guadeloupe','GP','GLP',1),(88,'Guam','GU','GUM',1),(89,'Guatemala','GT','GTM',1),(90,'Guinea','GN','GIN',1),(91,'Guinea-bissau','GW','GNB',1),(92,'Guyana','GY','GUY',1),(93,'Haiti','HT','HTI',1),(94,'Heard and Mc Donald Islands','HM','HMD',1),(95,'Honduras','HN','HND',1),(96,'Hong Kong','HK','HKG',1),(97,'Hungary','HU','HUN',1),(98,'Iceland','IS','ISL',1),(99,'India','IN','IND',1),(100,'Indonesia','ID','IDN',1),(101,'Iran (Islamic Republic of)','IR','IRN',1),(102,'Iraq','IQ','IRQ',1),(103,'Ireland','IE','IRL',1),(104,'Israel','IL','ISR',1),(105,'Italy','IT','ITA',1),(106,'Jamaica','JM','JAM',1),(107,'Japan','JP','JPN',1),(108,'Jordan','JO','JOR',1),(109,'Kazakhstan','KZ','KAZ',1),(110,'Kenya','KE','KEN',1),(111,'Kiribati','KI','KIR',1),(112,'Korea, Democratic People\'s Republic of','KP','PRK',1),(113,'Korea, Republic of','KR','KOR',1),(114,'Kuwait','KW','KWT',1),(115,'Kyrgyzstan','KG','KGZ',1),(116,'Lao People\'s Democratic Republic','LA','LAO',1),(117,'Latvia','LV','LVA',1),(118,'Lebanon','LB','LBN',1),(119,'Lesotho','LS','LSO',1),(120,'Liberia','LR','LBR',1),(121,'Libyan Arab Jamahiriya','LY','LBY',1),(122,'Liechtenstein','LI','LIE',1),(123,'Lithuania','LT','LTU',1),(124,'Luxembourg','LU','LUX',1),(125,'Macao','MO','MAC',1),(126,'Macedonia, The Former Yugoslav Republic of','MK','MKD',1),(127,'Madagascar','MG','MDG',1),(128,'Malawi','MW','MWI',1),(129,'Malaysia','MY','MYS',1),(130,'Maldives','MV','MDV',1),(131,'Mali','ML','MLI',1),(132,'Malta','MT','MLT',1),(133,'Marshall Islands','MH','MHL',1),(134,'Martinique','MQ','MTQ',1),(135,'Mauritania','MR','MRT',1),(136,'Mauritius','MU','MUS',1),(137,'Mayotte','YT','MYT',1),(138,'Mexico','MX','MEX',1),(139,'Micronesia, Federated States of','FM','FSM',1),(140,'Moldova','MD','MDA',1),(141,'Monaco','MC','MCO',1),(142,'Mongolia','MN','MNG',1),(143,'Montserrat','MS','MSR',1),(144,'Morocco','MA','MAR',1),(145,'Mozambique','MZ','MOZ',1),(146,'Myanmar','MM','MMR',1),(147,'Namibia','NA','NAM',1),(148,'Nauru','NR','NRU',1),(149,'Nepal','NP','NPL',1),(150,'Netherlands','NL','NLD',1),(151,'Netherlands Antilles','AN','ANT',1),(152,'New Caledonia','NC','NCL',1),(153,'New Zealand','NZ','NZL',1),(154,'Nicaragua','NI','NIC',1),(155,'Niger','NE','NER',1),(156,'Nigeria','NG','NGA',1),(157,'Niue','NU','NIU',1),(158,'Norfolk Island','NF','NFK',1),(159,'Northern Mariana Islands','MP','MNP',1),(160,'Norway','NO','NOR',1),(161,'Oman','OM','OMN',1),(162,'Pakistan','PK','PAK',1),(163,'Palau','PW','PLW',1),(164,'Panama','PA','PAN',1),(165,'Papua New Guinea','PG','PNG',1),(166,'Paraguay','PY','PRY',1),(167,'Peru','PE','PER',1),(168,'Philippines','PH','PHL',1),(169,'Pitcairn','PN','PCN',1),(170,'Poland','PL','POL',1),(171,'Portugal','PT','PRT',1),(172,'Puerto Rico','PR','PRI',1),(173,'Qatar','QA','QAT',1),(174,'Reunion','RE','REU',1),(175,'Romania','RO','ROU',1),(176,'Russian Federation','RU','RUS',1),(177,'Rwanda','RW','RWA',1),(178,'Saint Kitts and Nevis','KN','KNA',1),(179,'Saint Lucia','LC','LCA',1),(180,'Saint Vincent and the Grenadines','VC','VCT',1),(181,'Samoa','WS','WSM',1),(182,'San Marino','SM','SMR',1),(183,'Sao Tome and Principe','ST','STP',1),(184,'Saudi Arabia','SA','SAU',1),(185,'Senegal','SN','SEN',1),(186,'Seychelles','SC','SYC',1),(187,'Sierra Leone','SL','SLE',1),(188,'Singapore','SG','SGP',4),(189,'Slovakia (Slovak Republic)','SK','SVK',1),(190,'Slovenia','SI','SVN',1),(191,'Solomon Islands','SB','SLB',1),(192,'Somalia','SO','SOM',1),(193,'South Africa','ZA','ZAF',1),(194,'South Georgia and the South Sandwich Islands','GS','SGS',1),(195,'Spain','ES','ESP',3),(196,'Sri Lanka','LK','LKA',1),(197,'St. Helena','SH','SHN',1),(198,'St. Pierre and Miquelon','PM','SPM',1),(199,'Sudan','SD','SDN',1),(200,'Suriname','SR','SUR',1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM',1),(202,'Swaziland','SZ','SWZ',1),(203,'Sweden','SE','SWE',1),(204,'Switzerland','CH','CHE',1),(205,'Syrian Arab Republic','SY','SYR',1),(206,'Taiwan','TW','TWN',1),(207,'Tajikistan','TJ','TJK',1),(208,'Tanzania, United Republic of','TZ','TZA',1),(209,'Thailand','TH','THA',1),(210,'Togo','TG','TGO',1),(211,'Tokelau','TK','TKL',1),(212,'Tonga','TO','TON',1),(213,'Trinidad and Tobago','TT','TTO',1),(214,'Tunisia','TN','TUN',1),(215,'Turkey','TR','TUR',1),(216,'Turkmenistan','TM','TKM',1),(217,'Turks and Caicos Islands','TC','TCA',1),(218,'Tuvalu','TV','TUV',1),(219,'Uganda','UG','UGA',1),(220,'Ukraine','UA','UKR',1),(221,'United Arab Emirates','AE','ARE',1),(222,'United Kingdom','GB','GBR',6),(223,'United States','US','USA',2),(224,'United States Minor Outlying Islands','UM','UMI',1),(225,'Uruguay','UY','URY',1),(226,'Uzbekistan','UZ','UZB',1),(227,'Vanuatu','VU','VUT',1),(228,'Vatican City State (Holy See)','VA','VAT',1),(229,'Venezuela','VE','VEN',1),(230,'Viet Nam','VN','VNM',1),(231,'Virgin Islands (British)','VG','VGB',1),(232,'Virgin Islands (U.S.)','VI','VIR',1),(233,'Wallis and Futuna Islands','WF','WLF',1),(234,'Western Sahara','EH','ESH',1),(235,'Yemen','YE','YEM',1),(236,'Serbia','RS','SRB',1),(238,'Zambia','ZM','ZMB',1),(239,'Zimbabwe','ZW','ZWE',1),(240,'Aaland Islands','AX','ALA',1),(241,'Palestinian Territory','PS','PSE',1),(242,'Montenegro','ME','MNE',1),(243,'Guernsey','GG','GGY',1),(244,'Isle of Man','IM','IMN',1),(245,'Jersey','JE','JEY',1);
/*!40000 ALTER TABLE `cncountries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncoupon_email_track`
--

DROP TABLE IF EXISTS `cncoupon_email_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncoupon_email_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id_sent` int(11) NOT NULL DEFAULT '0',
  `sent_firstname` varchar(32) DEFAULT NULL,
  `sent_lastname` varchar(32) DEFAULT NULL,
  `emailed_to` varchar(32) DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncoupon_email_track`
--

LOCK TABLES `cncoupon_email_track` WRITE;
/*!40000 ALTER TABLE `cncoupon_email_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `cncoupon_email_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncoupon_gv_customer`
--

DROP TABLE IF EXISTS `cncoupon_gv_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncoupon_gv_customer` (
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncoupon_gv_customer`
--

LOCK TABLES `cncoupon_gv_customer` WRITE;
/*!40000 ALTER TABLE `cncoupon_gv_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `cncoupon_gv_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncoupon_gv_queue`
--

DROP TABLE IF EXISTS `cncoupon_gv_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncoupon_gv_queue` (
  `unique_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  `release_flag` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`unique_id`),
  KEY `idx_cust_id_order_id_zen` (`customer_id`,`order_id`),
  KEY `idx_release_flag_zen` (`release_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncoupon_gv_queue`
--

LOCK TABLES `cncoupon_gv_queue` WRITE;
/*!40000 ALTER TABLE `cncoupon_gv_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `cncoupon_gv_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncoupon_redeem_track`
--

DROP TABLE IF EXISTS `cncoupon_redeem_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncoupon_redeem_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `redeem_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `redeem_ip` varchar(45) NOT NULL DEFAULT '',
  `order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncoupon_redeem_track`
--

LOCK TABLES `cncoupon_redeem_track` WRITE;
/*!40000 ALTER TABLE `cncoupon_redeem_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `cncoupon_redeem_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncoupon_restrict`
--

DROP TABLE IF EXISTS `cncoupon_restrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncoupon_restrict` (
  `restrict_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `coupon_restrict` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`restrict_id`),
  KEY `idx_coup_id_prod_id_zen` (`coupon_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncoupon_restrict`
--

LOCK TABLES `cncoupon_restrict` WRITE;
/*!40000 ALTER TABLE `cncoupon_restrict` DISABLE KEYS */;
/*!40000 ALTER TABLE `cncoupon_restrict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncoupons`
--

DROP TABLE IF EXISTS `cncoupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncoupons` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type` char(1) NOT NULL DEFAULT 'F',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_minimum_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_expire_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `uses_per_coupon` int(5) NOT NULL DEFAULT '1',
  `uses_per_user` int(5) NOT NULL DEFAULT '0',
  `restrict_to_products` varchar(255) DEFAULT NULL,
  `restrict_to_categories` varchar(255) DEFAULT NULL,
  `restrict_to_customers` text,
  `coupon_active` char(1) NOT NULL DEFAULT 'Y',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_zone_restriction` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  KEY `idx_active_type_zen` (`coupon_active`,`coupon_type`),
  KEY `idx_coupon_code_zen` (`coupon_code`),
  KEY `idx_coupon_type_zen` (`coupon_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncoupons`
--

LOCK TABLES `cncoupons` WRITE;
/*!40000 ALTER TABLE `cncoupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cncoupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncoupons_description`
--

DROP TABLE IF EXISTS `cncoupons_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncoupons_description` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(32) NOT NULL DEFAULT '',
  `coupon_description` text,
  PRIMARY KEY (`coupon_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncoupons_description`
--

LOCK TABLES `cncoupons_description` WRITE;
/*!40000 ALTER TABLE `cncoupons_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `cncoupons_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncurrencies`
--

DROP TABLE IF EXISTS `cncurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncurrencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `code` char(3) NOT NULL DEFAULT '',
  `symbol_left` varchar(24) DEFAULT NULL,
  `symbol_right` varchar(24) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncurrencies`
--

LOCK TABLES `cncurrencies` WRITE;
/*!40000 ALTER TABLE `cncurrencies` DISABLE KEYS */;
INSERT INTO `cncurrencies` (`currencies_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_point`, `thousands_point`, `decimal_places`, `value`, `last_updated`) VALUES (1,'US Dollar','USD','$','','.',',','2',0.14205870,'2013-05-08 21:35:21'),(2,'人民币','CNY','&yen;','元','.','','2',1.00000000,'2013-05-08 21:35:21'),(3,'Euro','EUR','&euro;','','.',',','2',0.09692550,'2013-05-08 21:35:21'),(4,'GB Pound','GBP','&pound;','','.',',','2',0.06997200,'2013-05-08 21:35:21'),(5,'Canadian Dollar','CAD','$','','.',',','2',0.14287770,'2013-05-08 21:35:21'),(6,'Australian Dollar','AUD','$','','.',',','2',0.16222499,'2013-05-08 21:35:21');
/*!40000 ALTER TABLE `cncurrencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncustomers`
--

DROP TABLE IF EXISTS `cncustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncustomers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) NOT NULL DEFAULT '',
  `customers_firstname` varchar(32) NOT NULL DEFAULT '',
  `customers_lastname` varchar(32) NOT NULL DEFAULT '',
  `customers_dob` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_nick` varchar(96) NOT NULL DEFAULT '',
  `customers_default_address_id` int(11) NOT NULL DEFAULT '0',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(40) NOT NULL DEFAULT '',
  `customers_newsletter` char(1) DEFAULT NULL,
  `customers_group_pricing` int(11) NOT NULL DEFAULT '0',
  `customers_email_format` varchar(4) NOT NULL DEFAULT 'TEXT',
  `customers_authorization` int(1) NOT NULL DEFAULT '0',
  `customers_referral` varchar(32) NOT NULL DEFAULT '',
  `customers_paypal_payerid` varchar(20) NOT NULL DEFAULT '',
  `customers_paypal_ec` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customers_id`),
  KEY `idx_email_address_zen` (`customers_email_address`),
  KEY `idx_referral_zen` (`customers_referral`(10)),
  KEY `idx_grp_pricing_zen` (`customers_group_pricing`),
  KEY `idx_nick_zen` (`customers_nick`),
  KEY `idx_newsletter_zen` (`customers_newsletter`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncustomers`
--

LOCK TABLES `cncustomers` WRITE;
/*!40000 ALTER TABLE `cncustomers` DISABLE KEYS */;
INSERT INTO `cncustomers` (`customers_id`, `customers_gender`, `customers_firstname`, `customers_lastname`, `customers_dob`, `customers_email_address`, `customers_nick`, `customers_default_address_id`, `customers_telephone`, `customers_fax`, `customers_password`, `customers_newsletter`, `customers_group_pricing`, `customers_email_format`, `customers_authorization`, `customers_referral`, `customers_paypal_payerid`, `customers_paypal_ec`) VALUES (1,'m','Bill','Smith','2001-01-01 00:00:00','root@localhost.com','',1,'12345','','d95e8fa7f20a009372eb3477473fcd34:1c','0',0,'TEXT',0,'','',0),(2,'m','Cloud','Wei','1979-03-17 00:00:00','kaiweicai@163.com','',2,'13691805594','','27660b74cba3a4fb73cd99be59a0779e:52','0',0,'TEXT',0,'','',0);
/*!40000 ALTER TABLE `cncustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncustomers_basket`
--

DROP TABLE IF EXISTS `cncustomers_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncustomers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` float NOT NULL DEFAULT '0',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `customers_basket_date_added` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncustomers_basket`
--

LOCK TABLES `cncustomers_basket` WRITE;
/*!40000 ALTER TABLE `cncustomers_basket` DISABLE KEYS */;
INSERT INTO `cncustomers_basket` (`customers_basket_id`, `customers_id`, `products_id`, `customers_basket_quantity`, `final_price`, `customers_basket_date_added`) VALUES (1,2,'100:6cd50bffa96c4971360b63544e65046a',1,0.0000,'20130510');
/*!40000 ALTER TABLE `cncustomers_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncustomers_basket_attributes`
--

DROP TABLE IF EXISTS `cncustomers_basket_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncustomers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `products_options_id` varchar(64) NOT NULL DEFAULT '0',
  `products_options_value_id` int(11) NOT NULL DEFAULT '0',
  `products_options_value_text` blob,
  `products_options_sort_order` text NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_cust_id_prod_id_zen` (`customers_id`,`products_id`(36))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncustomers_basket_attributes`
--

LOCK TABLES `cncustomers_basket_attributes` WRITE;
/*!40000 ALTER TABLE `cncustomers_basket_attributes` DISABLE KEYS */;
INSERT INTO `cncustomers_basket_attributes` (`customers_basket_attributes_id`, `customers_id`, `products_id`, `products_options_id`, `products_options_value_id`, `products_options_value_text`, `products_options_sort_order`) VALUES (1,2,'100:6cd50bffa96c4971360b63544e65046a','1',30,'','10.00090'),(2,2,'100:6cd50bffa96c4971360b63544e65046a','4',46,'','50.00005');
/*!40000 ALTER TABLE `cncustomers_basket_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cncustomers_info`
--

DROP TABLE IF EXISTS `cncustomers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cncustomers_info` (
  `customers_info_id` int(11) NOT NULL DEFAULT '0',
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  PRIMARY KEY (`customers_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cncustomers_info`
--

LOCK TABLES `cncustomers_info` WRITE;
/*!40000 ALTER TABLE `cncustomers_info` DISABLE KEYS */;
INSERT INTO `cncustomers_info` (`customers_info_id`, `customers_info_date_of_last_logon`, `customers_info_number_of_logons`, `customers_info_date_account_created`, `customers_info_date_account_last_modified`, `global_product_notifications`) VALUES (1,'0001-01-01 00:00:00',0,'2004-01-21 01:35:28','0001-01-01 00:00:00',0),(2,'2013-05-11 01:16:28',1,'2013-05-11 01:16:28',NULL,0);
/*!40000 ALTER TABLE `cncustomers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cndb_cache`
--

DROP TABLE IF EXISTS `cndb_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cndb_cache` (
  `cache_entry_name` varchar(64) NOT NULL DEFAULT '',
  `cache_data` mediumblob,
  `cache_entry_created` int(15) DEFAULT NULL,
  PRIMARY KEY (`cache_entry_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cndb_cache`
--

LOCK TABLES `cndb_cache` WRITE;
/*!40000 ALTER TABLE `cndb_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cndb_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnemail_archive`
--

DROP TABLE IF EXISTS `cnemail_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnemail_archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_to_name` varchar(96) NOT NULL DEFAULT '',
  `email_to_address` varchar(96) NOT NULL DEFAULT '',
  `email_from_name` varchar(96) NOT NULL DEFAULT '',
  `email_from_address` varchar(96) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_html` text NOT NULL,
  `email_text` text NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `module` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`archive_id`),
  KEY `idx_email_to_address_zen` (`email_to_address`),
  KEY `idx_module_zen` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnemail_archive`
--

LOCK TABLES `cnemail_archive` WRITE;
/*!40000 ALTER TABLE `cnemail_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnemail_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnezpages`
--

DROP TABLE IF EXISTS `cnezpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnezpages` (
  `pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `alt_url` varchar(255) NOT NULL DEFAULT '',
  `alt_url_external` varchar(255) NOT NULL DEFAULT '',
  `pages_html_text` mediumtext,
  `status_header` int(1) NOT NULL DEFAULT '1',
  `status_sidebox` int(1) NOT NULL DEFAULT '1',
  `status_footer` int(1) NOT NULL DEFAULT '1',
  `status_toc` int(1) NOT NULL DEFAULT '1',
  `header_sort_order` int(3) NOT NULL DEFAULT '0',
  `sidebox_sort_order` int(3) NOT NULL DEFAULT '0',
  `footer_sort_order` int(3) NOT NULL DEFAULT '0',
  `toc_sort_order` int(3) NOT NULL DEFAULT '0',
  `page_open_new_window` int(1) NOT NULL DEFAULT '0',
  `page_is_ssl` int(1) NOT NULL DEFAULT '0',
  `toc_chapter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `idx_lang_id_zen` (`languages_id`),
  KEY `idx_ezp_status_header_zen` (`status_header`),
  KEY `idx_ezp_status_sidebox_zen` (`status_sidebox`),
  KEY `idx_ezp_status_footer_zen` (`status_footer`),
  KEY `idx_ezp_status_toc_zen` (`status_toc`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnezpages`
--

LOCK TABLES `cnezpages` WRITE;
/*!40000 ALTER TABLE `cnezpages` DISABLE KEYS */;
INSERT INTO `cnezpages` (`pages_id`, `languages_id`, `pages_title`, `alt_url`, `alt_url_external`, `pages_html_text`, `status_header`, `status_sidebox`, `status_footer`, `status_toc`, `header_sort_order`, `sidebox_sort_order`, `footer_sort_order`, `toc_sort_order`, `page_open_new_window`, `page_is_ssl`, `toc_chapter`) VALUES (1,1,'','index.php?main_page=shippinginfo','',NULL,0,1,1,1,0,35,30,10,0,0,10),(2,1,'','index.php?main_page=contact_us','',NULL,0,1,0,0,0,80,90,0,0,0,0),(3,1,'','','',NULL,1,1,0,0,20,20,0,0,0,0,0),(4,1,'','index.php?main_page=featured_products','',NULL,1,0,0,0,60,0,0,0,0,0,0),(5,1,'','index.php?main_page=site_map','',NULL,0,0,1,0,0,70,70,0,0,0,0),(6,1,'','index.php?main_page=privacy','',NULL,0,1,1,0,0,40,40,0,0,0,0),(7,1,'','index.php?main_page=unsubscribe','',NULL,0,1,0,0,0,75,0,0,0,0,0),(8,1,'','','',NULL,0,1,0,0,0,60,0,0,0,0,0),(9,1,'','index.php','',NULL,1,0,0,0,0,0,0,0,0,0,0),(10,1,'','index.php?main_page=products_new','',NULL,1,0,0,0,55,0,0,0,0,0,0),(11,1,'','index.php?main_page=conditions','',NULL,0,1,1,0,0,30,20,0,0,0,0),(12,1,'','index.php?main_page=specials','',NULL,1,0,0,0,80,0,0,0,0,0,0),(13,1,'','index.php?main_page=create_account','',NULL,1,0,0,0,90,0,0,0,0,0,0);
/*!40000 ALTER TABLE `cnezpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnezpages_content`
--

DROP TABLE IF EXISTS `cnezpages_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnezpages_content` (
  `pc_id` int(11) NOT NULL AUTO_INCREMENT,
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `pages_html_text` text,
  PRIMARY KEY (`pc_id`),
  KEY `idx_ezpages_content` (`pages_id`,`languages_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnezpages_content`
--

LOCK TABLES `cnezpages_content` WRITE;
/*!40000 ALTER TABLE `cnezpages_content` DISABLE KEYS */;
INSERT INTO `cnezpages_content` (`pc_id`, `pages_id`, `languages_id`, `pages_title`, `pages_html_text`) VALUES (1,1,2,'发货付款',''),(2,1,1,'Shipping',''),(3,2,2,'联系我们',''),(4,2,1,'Contact Us',''),(5,3,2,'本店新闻','演示商店正式开张<br /><br />所有商品都是演示用途，本站非营业网站<br /><br />下单仅限于测试各项功能'),(6,3,1,'News','This store is for demo purpose only. No order will be processed.'),(7,4,2,'推荐商品',''),(8,4,1,'Featured Products',''),(9,5,2,'网站地图',''),(10,5,1,'Site Map',''),(11,6,2,'隐私声明',''),(12,6,1,'Privacy',''),(13,7,2,'电子商情',''),(14,7,1,'Newsletter',''),(15,8,2,'公司简介',''),(16,8,1,'About Us',''),(17,9,2,'首页',''),(18,9,1,'Home',''),(19,10,2,'新进商品',''),(20,10,1,'New Products',''),(21,11,2,'顾客须知',''),(22,11,1,'Conditions of Use',''),(23,12,2,'特价商品',''),(24,12,1,'Specials',''),(25,13,2,'注册',''),(26,13,1,'Register','');
/*!40000 ALTER TABLE `cnezpages_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfeatured`
--

DROP TABLE IF EXISTS `cnfeatured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfeatured` (
  `featured_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `featured_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`featured_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`featured_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfeatured`
--

LOCK TABLES `cnfeatured` WRITE;
/*!40000 ALTER TABLE `cnfeatured` DISABLE KEYS */;
INSERT INTO `cnfeatured` (`featured_id`, `products_id`, `featured_date_added`, `featured_last_modified`, `expires_date`, `date_status_change`, `status`, `featured_date_available`) VALUES (1,34,'2004-02-21 16:34:31','2004-02-21 16:34:31','0001-01-01','2004-02-21 16:34:31',1,'0001-01-01'),(2,8,'2004-02-21 17:04:54','2004-02-21 22:31:52','2004-02-27','2004-04-25 22:50:50',0,'2004-02-21'),(3,12,'2004-02-21 17:10:49','2004-02-21 17:10:49','0001-01-01','2004-02-21 17:10:49',1,'0001-01-01'),(4,27,'2004-02-21 22:30:53',NULL,'0001-01-01',NULL,1,'0001-01-01'),(5,26,'2004-02-21 22:31:24',NULL,'0001-01-01',NULL,1,'0001-01-01'),(6,40,'2004-05-13 22:50:33',NULL,'0001-01-01',NULL,1,'0001-01-01'),(7,171,'2004-07-12 15:47:22',NULL,'0001-01-01',NULL,1,'0001-01-01'),(8,172,'2004-07-12 15:47:29',NULL,'0001-01-01',NULL,1,'0001-01-01'),(9,168,'2004-07-12 15:47:37',NULL,'0001-01-01',NULL,1,'0001-01-01'),(10,169,'2004-07-12 15:47:45',NULL,'0001-01-01',NULL,1,'0001-01-01');
/*!40000 ALTER TABLE `cnfeatured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfiles_uploaded`
--

DROP TABLE IF EXISTS `cnfiles_uploaded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfiles_uploaded` (
  `files_uploaded_id` int(11) NOT NULL AUTO_INCREMENT,
  `sesskey` varchar(32) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `files_uploaded_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`files_uploaded_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Must always have either a sesskey or customers_id';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfiles_uploaded`
--

LOCK TABLES `cnfiles_uploaded` WRITE;
/*!40000 ALTER TABLE `cnfiles_uploaded` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfiles_uploaded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cngeo_zones`
--

DROP TABLE IF EXISTS `cngeo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cngeo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL DEFAULT '',
  `geo_zone_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cngeo_zones`
--

LOCK TABLES `cngeo_zones` WRITE;
/*!40000 ALTER TABLE `cngeo_zones` DISABLE KEYS */;
INSERT INTO `cngeo_zones` (`geo_zone_id`, `geo_zone_name`, `geo_zone_description`, `last_modified`, `date_added`) VALUES (1,'北京','北京本地税率区',NULL,'2013-05-08 21:35:34');
/*!40000 ALTER TABLE `cngeo_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnget_terms_to_filter`
--

DROP TABLE IF EXISTS `cnget_terms_to_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnget_terms_to_filter` (
  `get_term_name` varchar(255) NOT NULL DEFAULT '',
  `get_term_table` varchar(64) NOT NULL,
  `get_term_name_field` varchar(64) NOT NULL,
  PRIMARY KEY (`get_term_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnget_terms_to_filter`
--

LOCK TABLES `cnget_terms_to_filter` WRITE;
/*!40000 ALTER TABLE `cnget_terms_to_filter` DISABLE KEYS */;
INSERT INTO `cnget_terms_to_filter` (`get_term_name`, `get_term_table`, `get_term_name_field`) VALUES ('manufacturers_id','TABLE_MANUFACTURERS','manufacturers_name'),('music_genre_id','TABLE_MUSIC_GENRE','music_genre_name'),('record_company_id','TABLE_RECORD_COMPANY','record_company_name');
/*!40000 ALTER TABLE `cnget_terms_to_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cngroup_pricing`
--

DROP TABLE IF EXISTS `cngroup_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cngroup_pricing` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `group_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cngroup_pricing`
--

LOCK TABLES `cngroup_pricing` WRITE;
/*!40000 ALTER TABLE `cngroup_pricing` DISABLE KEYS */;
INSERT INTO `cngroup_pricing` (`group_id`, `group_name`, `group_percentage`, `last_modified`, `date_added`) VALUES (1,'VIP客户',10.00,NULL,'2004-04-29 00:21:04');
/*!40000 ALTER TABLE `cngroup_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnlanguages`
--

DROP TABLE IF EXISTS `cnlanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnlanguages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `idx_languages_name_zen` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnlanguages`
--

LOCK TABLES `cnlanguages` WRITE;
/*!40000 ALTER TABLE `cnlanguages` DISABLE KEYS */;
INSERT INTO `cnlanguages` (`languages_id`, `name`, `code`, `image`, `directory`, `sort_order`) VALUES (1,'English','en','icon.gif','english',20),(2,'简体中文','gb','icon.gif','schinese',10);
/*!40000 ALTER TABLE `cnlanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnlayout_boxes`
--

DROP TABLE IF EXISTS `cnlayout_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnlayout_boxes` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_template` varchar(64) NOT NULL DEFAULT '',
  `layout_box_name` varchar(64) NOT NULL DEFAULT '',
  `layout_box_status` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_location` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_sort_order` int(11) NOT NULL DEFAULT '0',
  `layout_box_sort_order_single` int(11) NOT NULL DEFAULT '0',
  `layout_box_status_single` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_id`),
  KEY `idx_name_template_zen` (`layout_template`,`layout_box_name`),
  KEY `idx_layout_box_status_zen` (`layout_box_status`),
  KEY `idx_layout_box_sort_order_zen` (`layout_box_sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnlayout_boxes`
--

LOCK TABLES `cnlayout_boxes` WRITE;
/*!40000 ALTER TABLE `cnlayout_boxes` DISABLE KEYS */;
INSERT INTO `cnlayout_boxes` (`layout_id`, `layout_template`, `layout_box_name`, `layout_box_status`, `layout_box_location`, `layout_box_sort_order`, `layout_box_sort_order_single`, `layout_box_status_single`) VALUES (1,'default_template_settings','banner_box_all.php',1,1,5,0,0),(2,'default_template_settings','banner_box.php',1,0,300,1,127),(3,'default_template_settings','banner_box2.php',1,1,15,1,15),(4,'default_template_settings','best_sellers.php',1,1,30,70,1),(5,'default_template_settings','categories.php',1,0,10,10,1),(6,'default_template_settings','currencies.php',1,1,80,60,1),(7,'default_template_settings','document_categories.php',1,0,0,0,0),(8,'default_template_settings','ezpages.php',1,1,-1,2,1),(9,'default_template_settings','featured.php',1,0,45,0,0),(10,'default_template_settings','information.php',1,0,50,40,1),(11,'default_template_settings','languages.php',1,1,70,50,1),(12,'default_template_settings','manufacturers.php',1,0,30,20,1),(13,'default_template_settings','manufacturer_info.php',1,1,35,95,1),(14,'default_template_settings','more_information.php',1,0,200,200,1),(15,'default_template_settings','music_genres.php',1,1,0,0,0),(16,'default_template_settings','order_history.php',1,1,0,0,0),(17,'default_template_settings','product_notifications.php',1,1,55,85,1),(18,'default_template_settings','record_companies.php',1,1,0,0,0),(19,'default_template_settings','reviews.php',1,0,40,0,0),(20,'default_template_settings','search.php',1,1,10,0,0),(21,'default_template_settings','search_header.php',0,0,0,0,1),(22,'default_template_settings','shopping_cart.php',1,1,20,30,1),(23,'default_template_settings','specials.php',1,1,45,0,0),(24,'default_template_settings','whats_new.php',1,0,20,0,0),(25,'default_template_settings','whos_online.php',1,1,200,200,1),(26,'template_default','banner_box_all.php',1,1,5,0,0),(27,'template_default','banner_box.php',1,0,300,1,127),(28,'template_default','banner_box2.php',1,1,15,1,15),(29,'template_default','best_sellers.php',1,1,30,70,1),(30,'template_default','categories.php',1,0,10,10,1),(31,'template_default','currencies.php',1,1,80,60,1),(32,'template_default','ezpages.php',1,1,-1,2,1),(33,'template_default','featured.php',1,0,45,0,0),(34,'template_default','information.php',1,0,50,40,1),(35,'template_default','languages.php',1,1,70,50,1),(36,'template_default','manufacturers.php',1,0,30,20,1),(37,'template_default','manufacturer_info.php',1,1,35,95,1),(38,'template_default','more_information.php',1,0,200,200,1),(39,'template_default','my_broken_box.php',1,0,0,0,0),(40,'template_default','order_history.php',1,1,0,0,0),(41,'template_default','product_notifications.php',1,1,55,85,1),(42,'template_default','reviews.php',1,0,40,0,0),(43,'template_default','search.php',1,1,10,0,0),(44,'template_default','search_header.php',0,0,0,0,1),(45,'template_default','shopping_cart.php',1,1,20,30,1),(46,'template_default','specials.php',1,1,45,0,0),(47,'template_default','whats_new.php',1,0,20,0,0),(48,'template_default','whos_online.php',1,1,200,200,1),(49,'classic','banner_box.php',1,0,300,1,127),(50,'classic','banner_box2.php',1,1,15,1,15),(51,'classic','banner_box_all.php',1,1,5,0,0),(52,'classic','best_sellers.php',1,1,30,70,1),(53,'classic','categories.php',1,0,10,10,1),(54,'classic','currencies.php',1,1,80,60,1),(55,'classic','document_categories.php',1,0,0,0,0),(56,'classic','ezpages.php',1,1,-1,2,1),(57,'classic','featured.php',1,0,45,0,0),(58,'classic','information.php',1,0,50,40,1),(59,'classic','languages.php',1,1,70,50,1),(60,'classic','manufacturers.php',1,0,30,20,1),(61,'classic','manufacturer_info.php',1,1,35,95,1),(62,'classic','more_information.php',1,0,200,200,1),(63,'classic','music_genres.php',1,1,0,0,0),(64,'classic','order_history.php',1,1,0,0,0),(65,'classic','product_notifications.php',1,1,55,85,1),(66,'classic','record_companies.php',1,1,0,0,0),(67,'classic','reviews.php',1,0,40,0,0),(68,'classic','search.php',1,1,10,0,0),(69,'classic','search_header.php',0,0,0,0,1),(70,'classic','shopping_cart.php',1,1,20,30,1),(71,'classic','specials.php',1,1,45,0,0),(72,'classic','whats_new.php',1,0,20,0,0),(73,'classic','whos_online.php',1,1,200,200,1),(74,'lite_blue','banner_box.php',0,0,300,1,0),(75,'lite_blue','banner_box2.php',1,1,0,0,0),(76,'lite_blue','banner_box_all.php',0,1,0,0,0),(77,'lite_blue','best_sellers.php',1,1,30,70,1),(78,'lite_blue','categories.php',1,0,10,10,1),(79,'lite_blue','currencies.php',1,1,90,0,0),(80,'lite_blue','document_categories.php',0,0,0,0,0),(81,'lite_blue','ezpages.php',1,1,15,5,1),(82,'lite_blue','featured.php',1,0,25,0,0),(83,'lite_blue','information.php',0,1,5,40,1),(84,'lite_blue','languages.php',1,1,100,0,0),(85,'lite_blue','manufacturers.php',0,0,0,0,0),(86,'lite_blue','manufacturer_info.php',0,0,0,0,0),(87,'lite_blue','more_information.php',0,0,0,0,0),(88,'lite_blue','music_genres.php',0,1,0,0,0),(89,'lite_blue','order_history.php',1,1,25,0,0),(90,'lite_blue','product_notifications.php',1,1,55,85,1),(91,'lite_blue','record_companies.php',0,1,0,0,0),(92,'lite_blue','reviews.php',1,1,50,0,0),(93,'lite_blue','search.php',1,1,10,0,0),(94,'lite_blue','search_header.php',0,0,0,30,1),(95,'lite_blue','shopping_cart.php',1,1,20,30,1),(96,'lite_blue','specials.php',1,0,55,0,0),(97,'lite_blue','whats_new.php',1,0,30,0,0),(98,'lite_blue','whos_online.php',1,1,200,200,1),(99,'lite_green','banner_box.php',0,0,300,1,0),(100,'lite_green','banner_box2.php',1,1,0,0,0),(101,'lite_green','banner_box_all.php',0,1,0,0,0),(102,'lite_green','best_sellers.php',1,1,30,70,1),(103,'lite_green','categories.php',1,0,10,10,1),(104,'lite_green','currencies.php',1,1,90,0,0),(105,'lite_green','document_categories.php',0,0,0,0,0),(106,'lite_green','ezpages.php',1,1,15,5,1),(107,'lite_green','featured.php',1,0,25,0,0),(108,'lite_green','information.php',0,1,5,40,1),(109,'lite_green','languages.php',1,1,100,0,0),(110,'lite_green','manufacturers.php',0,0,0,0,0),(111,'lite_green','manufacturer_info.php',0,0,0,0,0),(112,'lite_green','more_information.php',0,0,0,0,0),(113,'lite_green','music_genres.php',0,1,0,0,0),(114,'lite_green','order_history.php',1,1,25,0,0),(115,'lite_green','product_notifications.php',1,1,55,85,1),(116,'lite_green','record_companies.php',0,1,0,0,0),(117,'lite_green','reviews.php',1,1,50,0,0),(118,'lite_green','search.php',1,1,10,0,0),(119,'lite_green','search_header.php',0,0,0,30,1),(120,'lite_green','shopping_cart.php',1,1,20,30,1),(121,'lite_green','specials.php',1,0,55,0,0),(122,'lite_green','whats_new.php',1,0,30,0,0),(123,'lite_green','whos_online.php',1,1,200,200,1),(124,'lite_grey','banner_box.php',0,0,300,1,0),(125,'lite_grey','banner_box2.php',1,1,0,0,0),(126,'lite_grey','banner_box_all.php',0,1,0,0,0),(127,'lite_grey','best_sellers.php',1,1,30,70,1),(128,'lite_grey','categories.php',1,0,10,10,1),(129,'lite_grey','currencies.php',1,1,90,0,0),(130,'lite_grey','document_categories.php',0,0,0,0,0),(131,'lite_grey','ezpages.php',1,1,15,5,1),(132,'lite_grey','featured.php',1,0,25,0,0),(133,'lite_grey','information.php',0,1,5,40,1),(134,'lite_grey','languages.php',1,1,100,0,0),(135,'lite_grey','manufacturers.php',0,0,0,0,0),(136,'lite_grey','manufacturer_info.php',0,0,0,0,0),(137,'lite_grey','more_information.php',0,0,0,0,0),(138,'lite_grey','music_genres.php',0,1,0,0,0),(139,'lite_grey','order_history.php',1,1,25,0,0),(140,'lite_grey','product_notifications.php',1,1,55,85,1),(141,'lite_grey','record_companies.php',0,1,0,0,0),(142,'lite_grey','reviews.php',1,1,50,0,0),(143,'lite_grey','search.php',1,1,10,0,0),(144,'lite_grey','search_header.php',0,0,0,30,1),(145,'lite_grey','shopping_cart.php',1,1,20,30,1),(146,'lite_grey','specials.php',1,0,55,0,0),(147,'lite_grey','whats_new.php',1,0,30,0,0),(148,'lite_grey','whos_online.php',1,1,200,200,1),(149,'lite_orange','banner_box.php',0,0,300,1,0),(150,'lite_orange','banner_box2.php',1,1,0,0,0),(151,'lite_orange','banner_box_all.php',0,1,0,0,0),(152,'lite_orange','best_sellers.php',1,1,30,70,1),(153,'lite_orange','categories.php',1,0,10,10,1),(154,'lite_orange','currencies.php',1,1,90,0,0),(155,'lite_orange','document_categories.php',0,0,0,0,0),(156,'lite_orange','ezpages.php',1,1,15,5,1),(157,'lite_orange','featured.php',1,0,25,0,0),(158,'lite_orange','information.php',0,1,5,40,1),(159,'lite_orange','languages.php',1,1,100,0,0),(160,'lite_orange','manufacturers.php',0,0,0,0,0),(161,'lite_orange','manufacturer_info.php',0,0,0,0,0),(162,'lite_orange','more_information.php',0,0,0,0,0),(163,'lite_orange','music_genres.php',0,1,0,0,0),(164,'lite_orange','order_history.php',1,1,25,0,0),(165,'lite_orange','product_notifications.php',1,1,55,85,1),(166,'lite_orange','record_companies.php',0,1,0,0,0),(167,'lite_orange','reviews.php',1,1,50,0,0),(168,'lite_orange','search.php',1,1,10,0,0),(169,'lite_orange','search_header.php',0,0,0,30,1),(170,'lite_orange','shopping_cart.php',1,1,20,30,1),(171,'lite_orange','specials.php',1,0,55,0,0),(172,'lite_orange','whats_new.php',1,0,30,0,0),(173,'lite_orange','whos_online.php',1,1,200,200,1),(174,'lite_red','banner_box.php',0,0,300,1,0),(175,'lite_red','banner_box2.php',1,1,0,0,0),(176,'lite_red','banner_box_all.php',0,1,0,0,0),(177,'lite_red','best_sellers.php',1,1,30,70,1),(178,'lite_red','categories.php',1,0,10,10,1),(179,'lite_red','currencies.php',1,1,90,0,0),(180,'lite_red','document_categories.php',0,0,0,0,0),(181,'lite_red','ezpages.php',1,1,15,5,1),(182,'lite_red','featured.php',1,0,25,0,0),(183,'lite_red','information.php',0,1,5,40,1),(184,'lite_red','languages.php',1,1,100,0,0),(185,'lite_red','manufacturers.php',0,0,0,0,0),(186,'lite_red','manufacturer_info.php',0,0,0,0,0),(187,'lite_red','more_information.php',0,0,0,0,0),(188,'lite_red','music_genres.php',0,1,0,0,0),(189,'lite_red','order_history.php',1,1,25,0,0),(190,'lite_red','product_notifications.php',1,1,55,85,1),(191,'lite_red','record_companies.php',0,1,0,0,0),(192,'lite_red','reviews.php',1,1,50,0,0),(193,'lite_red','search.php',1,1,10,0,0),(194,'lite_red','search_header.php',0,0,0,30,1),(195,'lite_red','shopping_cart.php',1,1,20,30,1),(196,'lite_red','specials.php',1,0,55,0,0),(197,'lite_red','whats_new.php',1,0,30,0,0),(198,'lite_red','whos_online.php',1,1,200,200,1),(199,'pure_black_free','banner_box.php',0,0,300,1,0),(200,'pure_black_free','banner_box2.php',1,1,0,0,0),(201,'pure_black_free','banner_box_all.php',0,1,0,0,0),(202,'pure_black_free','best_sellers.php',1,1,30,70,1),(203,'pure_black_free','categories.php',1,0,10,10,1),(204,'pure_black_free','currencies.php',0,1,0,0,0),(205,'pure_black_free','document_categories.php',0,0,0,0,0),(206,'pure_black_free','ezpages.php',1,1,15,5,1),(207,'pure_black_free','featured.php',1,0,25,0,0),(208,'pure_black_free','information.php',0,1,5,40,1),(209,'pure_black_free','languages.php',0,1,0,0,0),(210,'pure_black_free','manufacturers.php',0,0,0,0,0),(211,'pure_black_free','manufacturer_info.php',0,0,0,0,0),(212,'pure_black_free','more_information.php',0,0,0,0,0),(213,'pure_black_free','music_genres.php',0,1,0,0,0),(214,'pure_black_free','order_history.php',1,1,25,0,0),(215,'pure_black_free','product_notifications.php',1,1,55,85,1),(216,'pure_black_free','record_companies.php',0,1,0,0,0),(217,'pure_black_free','reviews.php',1,1,50,0,0),(218,'pure_black_free','search.php',1,1,10,0,0),(219,'pure_black_free','search_header.php',0,0,0,30,1),(220,'pure_black_free','shopping_cart.php',1,1,20,30,1),(221,'pure_black_free','specials.php',1,0,55,0,0),(222,'pure_black_free','whats_new.php',1,0,30,0,0),(223,'pure_black_free','whos_online.php',1,1,200,200,1),(224,'pure_blue_free','banner_box.php',0,0,300,1,0),(225,'pure_blue_free','banner_box2.php',1,1,0,0,0),(226,'pure_blue_free','banner_box_all.php',0,1,0,0,0),(227,'pure_blue_free','best_sellers.php',1,1,30,70,1),(228,'pure_blue_free','categories.php',1,0,10,10,1),(229,'pure_blue_free','currencies.php',0,1,0,0,0),(230,'pure_blue_free','document_categories.php',0,0,0,0,0),(231,'pure_blue_free','ezpages.php',1,1,15,5,1),(232,'pure_blue_free','featured.php',1,0,25,0,0),(233,'pure_blue_free','information.php',0,1,5,40,1),(234,'pure_blue_free','languages.php',0,1,0,0,0),(235,'pure_blue_free','manufacturers.php',0,0,0,0,0),(236,'pure_blue_free','manufacturer_info.php',0,0,0,0,0),(237,'pure_blue_free','more_information.php',0,0,0,0,0),(238,'pure_blue_free','music_genres.php',0,1,0,0,0),(239,'pure_blue_free','order_history.php',1,1,25,0,0),(240,'pure_blue_free','product_notifications.php',1,1,55,85,1),(241,'pure_blue_free','record_companies.php',0,1,0,0,0),(242,'pure_blue_free','reviews.php',1,1,50,0,0),(243,'pure_blue_free','search.php',1,1,10,0,0),(244,'pure_blue_free','search_header.php',0,0,0,30,1),(245,'pure_blue_free','shopping_cart.php',1,1,20,30,1),(246,'pure_blue_free','specials.php',1,0,55,0,0),(247,'pure_blue_free','whats_new.php',1,0,30,0,0),(248,'pure_blue_free','whos_online.php',1,1,200,200,1),(249,'pure_green_free','banner_box.php',0,0,300,1,0),(250,'pure_green_free','banner_box2.php',1,1,0,0,0),(251,'pure_green_free','banner_box_all.php',0,1,0,0,0),(252,'pure_green_free','best_sellers.php',1,1,30,70,1),(253,'pure_green_free','categories.php',1,0,10,10,1),(254,'pure_green_free','currencies.php',0,1,0,0,0),(255,'pure_green_free','document_categories.php',0,0,0,0,0),(256,'pure_green_free','ezpages.php',1,1,15,5,1),(257,'pure_green_free','featured.php',1,0,25,0,0),(258,'pure_green_free','information.php',0,1,5,40,1),(259,'pure_green_free','languages.php',0,1,0,0,0),(260,'pure_green_free','manufacturers.php',0,0,0,0,0),(261,'pure_green_free','manufacturer_info.php',0,0,0,0,0),(262,'pure_green_free','more_information.php',0,0,0,0,0),(263,'pure_green_free','music_genres.php',0,1,0,0,0),(264,'pure_green_free','order_history.php',1,1,25,0,0),(265,'pure_green_free','product_notifications.php',1,1,55,85,1),(266,'pure_green_free','record_companies.php',0,1,0,0,0),(267,'pure_green_free','reviews.php',1,1,50,0,0),(268,'pure_green_free','search.php',1,1,10,0,0),(269,'pure_green_free','search_header.php',0,0,0,30,1),(270,'pure_green_free','shopping_cart.php',1,1,20,30,1),(271,'pure_green_free','specials.php',1,0,55,0,0),(272,'pure_green_free','whats_new.php',1,0,30,0,0),(273,'pure_green_free','whos_online.php',1,1,200,200,1),(274,'pure_orange_free','banner_box.php',0,0,300,1,0),(275,'pure_orange_free','banner_box2.php',1,1,0,0,0),(276,'pure_orange_free','banner_box_all.php',0,1,0,0,0),(277,'pure_orange_free','best_sellers.php',1,1,30,70,1),(278,'pure_orange_free','categories.php',1,0,10,10,1),(279,'pure_orange_free','currencies.php',0,1,0,0,0),(280,'pure_orange_free','document_categories.php',0,0,0,0,0),(281,'pure_orange_free','ezpages.php',1,1,15,5,1),(282,'pure_orange_free','featured.php',1,0,25,0,0),(283,'pure_orange_free','information.php',0,1,5,40,1),(284,'pure_orange_free','languages.php',0,1,0,0,0),(285,'pure_orange_free','manufacturers.php',0,0,0,0,0),(286,'pure_orange_free','manufacturer_info.php',0,0,0,0,0),(287,'pure_orange_free','more_information.php',0,0,0,0,0),(288,'pure_orange_free','music_genres.php',0,1,0,0,0),(289,'pure_orange_free','order_history.php',1,1,25,0,0),(290,'pure_orange_free','product_notifications.php',1,1,55,85,1),(291,'pure_orange_free','record_companies.php',0,1,0,0,0),(292,'pure_orange_free','reviews.php',1,1,50,0,0),(293,'pure_orange_free','search.php',1,1,10,0,0),(294,'pure_orange_free','search_header.php',0,0,0,30,1),(295,'pure_orange_free','shopping_cart.php',1,1,20,30,1),(296,'pure_orange_free','specials.php',1,0,55,0,0),(297,'pure_orange_free','whats_new.php',1,0,30,0,0),(298,'pure_orange_free','whos_online.php',1,1,200,200,1),(299,'pure_red_free','banner_box.php',0,0,300,1,0),(300,'pure_red_free','banner_box2.php',1,1,0,0,0),(301,'pure_red_free','banner_box_all.php',0,1,0,0,0),(302,'pure_red_free','best_sellers.php',1,1,30,70,1),(303,'pure_red_free','categories.php',1,0,10,10,1),(304,'pure_red_free','currencies.php',0,1,0,0,0),(305,'pure_red_free','document_categories.php',0,0,0,0,0),(306,'pure_red_free','ezpages.php',1,1,15,5,1),(307,'pure_red_free','featured.php',1,0,25,0,0),(308,'pure_red_free','information.php',0,1,5,40,1),(309,'pure_red_free','languages.php',0,1,0,0,0),(310,'pure_red_free','manufacturers.php',0,0,0,0,0),(311,'pure_red_free','manufacturer_info.php',0,0,0,0,0),(312,'pure_red_free','more_information.php',0,0,0,0,0),(313,'pure_red_free','music_genres.php',0,1,0,0,0),(314,'pure_red_free','order_history.php',1,1,25,0,0),(315,'pure_red_free','product_notifications.php',1,1,55,85,1),(316,'pure_red_free','record_companies.php',0,1,0,0,0),(317,'pure_red_free','reviews.php',1,1,50,0,0),(318,'pure_red_free','search.php',1,1,10,0,0),(319,'pure_red_free','search_header.php',0,0,0,30,1),(320,'pure_red_free','shopping_cart.php',1,1,20,30,1),(321,'pure_red_free','specials.php',1,0,55,0,0),(322,'pure_red_free','whats_new.php',1,0,30,0,0),(323,'pure_red_free','whos_online.php',1,1,200,200,1),(324,'abagon','banner_box.php',0,0,300,1,0),(325,'abagon','banner_box2.php',1,1,0,0,0),(326,'abagon','banner_box_all.php',0,1,0,0,0),(327,'abagon','best_sellers.php',1,1,30,70,1),(328,'abagon','categories.php',1,0,10,10,1),(329,'abagon','currencies.php',0,1,0,0,0),(330,'abagon','document_categories.php',0,0,0,0,0),(331,'abagon','ezpages.php',1,1,15,5,1),(332,'abagon','featured.php',1,0,25,0,0),(333,'abagon','information.php',0,1,5,40,1),(334,'abagon','languages.php',0,1,0,0,0),(335,'abagon','manufacturers.php',0,0,0,0,0),(336,'abagon','manufacturer_info.php',0,0,0,0,0),(337,'abagon','more_information.php',0,0,0,0,0),(338,'abagon','music_genres.php',0,1,0,0,0),(339,'abagon','order_history.php',1,1,25,0,0),(340,'abagon','product_notifications.php',1,1,55,85,1),(341,'abagon','record_companies.php',0,1,0,0,0),(342,'abagon','reviews.php',1,1,50,0,0),(343,'abagon','search.php',1,1,10,0,0),(344,'abagon','search_header.php',0,0,0,30,1),(345,'abagon','shopping_cart.php',1,1,20,30,1),(346,'abagon','specials.php',1,0,55,0,0),(347,'abagon','whats_new.php',1,0,30,0,0),(348,'abagon','whos_online.php',1,1,200,200,1),(349,'crista_blue','banner_box.php',0,0,300,1,0),(350,'crista_blue','banner_box2.php',1,1,0,0,0),(351,'crista_blue','banner_box_all.php',0,1,0,0,0),(352,'crista_blue','best_sellers.php',1,1,30,70,1),(353,'crista_blue','categories.php',1,0,10,10,1),(354,'crista_blue','currencies.php',0,1,0,0,0),(355,'crista_blue','document_categories.php',0,0,0,0,0),(356,'crista_blue','ezpages.php',1,1,15,5,1),(357,'crista_blue','featured.php',1,0,25,0,0),(358,'crista_blue','information.php',0,1,5,40,1),(359,'crista_blue','languages.php',0,1,0,0,0),(360,'crista_blue','manufacturers.php',0,0,0,0,0),(361,'crista_blue','manufacturer_info.php',0,0,0,0,0),(362,'crista_blue','more_information.php',0,0,0,0,0),(363,'crista_blue','music_genres.php',0,1,0,0,0),(364,'crista_blue','order_history.php',1,1,25,0,0),(365,'crista_blue','product_notifications.php',1,1,55,85,1),(366,'crista_blue','record_companies.php',0,1,0,0,0),(367,'crista_blue','reviews.php',1,1,50,0,0),(368,'crista_blue','search.php',1,1,10,0,0),(369,'crista_blue','search_header.php',0,0,0,30,1),(370,'crista_blue','shopping_cart.php',1,1,20,30,1),(371,'crista_blue','specials.php',1,0,55,0,0),(372,'crista_blue','whats_new.php',1,0,30,0,0),(373,'crista_blue','whos_online.php',1,1,200,200,1),(374,'crista_grey','banner_box.php',0,0,300,1,0),(375,'crista_grey','banner_box2.php',1,1,0,0,0),(376,'crista_grey','banner_box_all.php',0,1,0,0,0),(377,'crista_grey','best_sellers.php',1,1,30,70,1),(378,'crista_grey','categories.php',1,0,10,10,1),(379,'crista_grey','currencies.php',0,1,0,0,0),(380,'crista_grey','document_categories.php',0,0,0,0,0),(381,'crista_grey','ezpages.php',1,1,15,5,1),(382,'crista_grey','featured.php',1,0,25,0,0),(383,'crista_grey','information.php',0,1,5,40,1),(384,'crista_grey','languages.php',0,1,0,0,0),(385,'crista_grey','manufacturers.php',0,0,0,0,0),(386,'crista_grey','manufacturer_info.php',0,0,0,0,0),(387,'crista_grey','more_information.php',0,0,0,0,0),(388,'crista_grey','music_genres.php',0,1,0,0,0),(389,'crista_grey','order_history.php',1,1,25,0,0),(390,'crista_grey','product_notifications.php',1,1,55,85,1),(391,'crista_grey','record_companies.php',0,1,0,0,0),(392,'crista_grey','reviews.php',1,1,50,0,0),(393,'crista_grey','search.php',1,1,10,0,0),(394,'crista_grey','search_header.php',0,0,0,30,1),(395,'crista_grey','shopping_cart.php',1,1,20,30,1),(396,'crista_grey','specials.php',1,0,55,0,0),(397,'crista_grey','whats_new.php',1,0,30,0,0),(398,'crista_grey','whos_online.php',1,1,200,200,1),(399,'crista_pink','banner_box.php',0,0,300,1,0),(400,'crista_pink','banner_box2.php',1,1,0,0,0),(401,'crista_pink','banner_box_all.php',0,1,0,0,0),(402,'crista_pink','best_sellers.php',1,1,30,70,1),(403,'crista_pink','categories.php',1,0,10,10,1),(404,'crista_pink','currencies.php',0,1,0,0,0),(405,'crista_pink','document_categories.php',0,0,0,0,0),(406,'crista_pink','ezpages.php',1,1,15,5,1),(407,'crista_pink','featured.php',1,0,25,0,0),(408,'crista_pink','information.php',0,1,5,40,1),(409,'crista_pink','languages.php',0,1,0,0,0),(410,'crista_pink','manufacturers.php',0,0,0,0,0),(411,'crista_pink','manufacturer_info.php',0,0,0,0,0),(412,'crista_pink','more_information.php',0,0,0,0,0),(413,'crista_pink','music_genres.php',0,1,0,0,0),(414,'crista_pink','order_history.php',1,1,25,0,0),(415,'crista_pink','product_notifications.php',1,1,55,85,1),(416,'crista_pink','record_companies.php',0,1,0,0,0),(417,'crista_pink','reviews.php',1,1,50,0,0),(418,'crista_pink','search.php',1,1,10,0,0),(419,'crista_pink','search_header.php',0,0,0,30,1),(420,'crista_pink','shopping_cart.php',1,1,20,30,1),(421,'crista_pink','specials.php',1,0,55,0,0),(422,'crista_pink','whats_new.php',1,0,30,0,0),(423,'crista_pink','whos_online.php',1,1,200,200,1),(424,'crista_violet','banner_box.php',0,0,300,1,0),(425,'crista_violet','banner_box2.php',1,1,0,0,0),(426,'crista_violet','banner_box_all.php',0,1,0,0,0),(427,'crista_violet','best_sellers.php',1,1,30,70,1),(428,'crista_violet','categories.php',1,0,10,10,1),(429,'crista_violet','currencies.php',0,1,0,0,0),(430,'crista_violet','document_categories.php',0,0,0,0,0),(431,'crista_violet','ezpages.php',1,1,15,5,1),(432,'crista_violet','featured.php',1,0,25,0,0),(433,'crista_violet','information.php',0,1,5,40,1),(434,'crista_violet','languages.php',0,1,0,0,0),(435,'crista_violet','manufacturers.php',0,0,0,0,0),(436,'crista_violet','manufacturer_info.php',0,0,0,0,0),(437,'crista_violet','more_information.php',0,0,0,0,0),(438,'crista_violet','music_genres.php',0,1,0,0,0),(439,'crista_violet','order_history.php',1,1,25,0,0),(440,'crista_violet','product_notifications.php',1,1,55,85,1),(441,'crista_violet','record_companies.php',0,1,0,0,0),(442,'crista_violet','reviews.php',1,1,50,0,0),(443,'crista_violet','search.php',1,1,10,0,0),(444,'crista_violet','search_header.php',0,0,0,30,1),(445,'crista_violet','shopping_cart.php',1,1,20,30,1),(446,'crista_violet','specials.php',1,0,55,0,0),(447,'crista_violet','whats_new.php',1,0,30,0,0),(448,'crista_violet','whos_online.php',1,1,200,200,1);
/*!40000 ALTER TABLE `cnlayout_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnmanufacturers`
--

DROP TABLE IF EXISTS `cnmanufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnmanufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `idx_mfg_name_zen` (`manufacturers_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnmanufacturers`
--

LOCK TABLES `cnmanufacturers` WRITE;
/*!40000 ALTER TABLE `cnmanufacturers` DISABLE KEYS */;
INSERT INTO `cnmanufacturers` (`manufacturers_id`, `manufacturers_name`, `manufacturers_image`, `date_added`, `last_modified`) VALUES (1,'Matrox','manufacturers/manufacturer_matrox.gif','2003-12-23 03:18:19',NULL),(2,'Microsoft','manufacturers/manufacturer_microsoft.gif','2003-12-23 03:18:19',NULL),(3,'Warner','manufacturers/manufacturer_warner.gif','2003-12-23 03:18:19',NULL),(4,'Fox','manufacturers/manufacturer_fox.gif','2003-12-23 03:18:19',NULL),(5,'Logitech','manufacturers/manufacturer_logitech.gif','2003-12-23 03:18:19',NULL),(6,'Canon','manufacturers/manufacturer_canon.gif','2003-12-23 03:18:19',NULL),(7,'Sierra','manufacturers/manufacturer_sierra.gif','2003-12-23 03:18:19',NULL),(8,'GT Interactive','manufacturers/manufacturer_gt_interactive.gif','2003-12-23 03:18:19',NULL),(9,'Hewlett Packard','manufacturers/manufacturer_hewlett_packard.gif','2003-12-23 03:18:19',NULL);
/*!40000 ALTER TABLE `cnmanufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnmanufacturers_info`
--

DROP TABLE IF EXISTS `cnmanufacturers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnmanufacturers_info` (
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnmanufacturers_info`
--

LOCK TABLES `cnmanufacturers_info` WRITE;
/*!40000 ALTER TABLE `cnmanufacturers_info` DISABLE KEYS */;
INSERT INTO `cnmanufacturers_info` (`manufacturers_id`, `languages_id`, `manufacturers_url`, `url_clicked`, `date_last_click`) VALUES (1,1,'http://www.matrox.com',0,NULL),(1,2,'http://www.matrox.com',0,NULL),(2,1,'http://www.microsoft.com',0,NULL),(2,2,'http://www.microsoft.com',0,NULL),(3,1,'http://www.warner.com',0,NULL),(3,2,'http://www.warner.com',0,NULL),(4,1,'http://www.fox.com',0,NULL),(4,2,'http://www.fox.com',0,NULL),(5,1,'http://www.logitech.com',0,NULL),(5,2,'http://www.logitech.com',0,NULL),(6,1,'http://www.canon.com',0,NULL),(6,2,'http://www.canon.com',0,NULL),(7,1,'http://www.sierra.com',0,NULL),(7,2,'http://www.sierra.com',0,NULL),(8,1,'http://www.infogrames.com',0,NULL),(8,2,'http://www.infogrames.com',0,NULL),(9,1,'http://www.hewlettpackard.com',0,NULL),(9,2,'http://www.hewlettpackard.com',0,NULL);
/*!40000 ALTER TABLE `cnmanufacturers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnmedia_clips`
--

DROP TABLE IF EXISTS `cnmedia_clips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnmedia_clips` (
  `clip_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL DEFAULT '0',
  `clip_type` smallint(6) NOT NULL DEFAULT '0',
  `clip_filename` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`clip_id`),
  KEY `idx_media_id_zen` (`media_id`),
  KEY `idx_clip_type_zen` (`clip_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnmedia_clips`
--

LOCK TABLES `cnmedia_clips` WRITE;
/*!40000 ALTER TABLE `cnmedia_clips` DISABLE KEYS */;
INSERT INTO `cnmedia_clips` (`clip_id`, `media_id`, `clip_type`, `clip_filename`, `date_added`, `last_modified`) VALUES (1,1,1,'thehunter.mp3','2004-06-01 20:57:43','0000-00-00 00:00:00'),(6,2,1,'thehunter.mp3','2004-07-13 00:45:09','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `cnmedia_clips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnmedia_manager`
--

DROP TABLE IF EXISTS `cnmedia_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnmedia_manager` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_name` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`media_id`),
  KEY `idx_media_name_zen` (`media_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnmedia_manager`
--

LOCK TABLES `cnmedia_manager` WRITE;
/*!40000 ALTER TABLE `cnmedia_manager` DISABLE KEYS */;
INSERT INTO `cnmedia_manager` (`media_id`, `media_name`, `last_modified`, `date_added`) VALUES (1,'Russ Tippins - The Hunter','2004-06-01 20:57:43','2004-06-01 20:42:53'),(2,'Help!','2004-07-13 01:01:14','2004-07-12 17:57:45');
/*!40000 ALTER TABLE `cnmedia_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnmedia_to_products`
--

DROP TABLE IF EXISTS `cnmedia_to_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnmedia_to_products` (
  `media_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_media_product_zen` (`media_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnmedia_to_products`
--

LOCK TABLES `cnmedia_to_products` WRITE;
/*!40000 ALTER TABLE `cnmedia_to_products` DISABLE KEYS */;
INSERT INTO `cnmedia_to_products` (`media_id`, `product_id`) VALUES (1,166),(2,169);
/*!40000 ALTER TABLE `cnmedia_to_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnmedia_types`
--

DROP TABLE IF EXISTS `cnmedia_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnmedia_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(64) NOT NULL DEFAULT '',
  `type_ext` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_name_zen` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnmedia_types`
--

LOCK TABLES `cnmedia_types` WRITE;
/*!40000 ALTER TABLE `cnmedia_types` DISABLE KEYS */;
INSERT INTO `cnmedia_types` (`type_id`, `type_name`, `type_ext`) VALUES (1,'MP3','.mp3');
/*!40000 ALTER TABLE `cnmedia_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnmeta_tags_categories_description`
--

DROP TABLE IF EXISTS `cnmeta_tags_categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnmeta_tags_categories_description` (
  `categories_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`categories_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnmeta_tags_categories_description`
--

LOCK TABLES `cnmeta_tags_categories_description` WRITE;
/*!40000 ALTER TABLE `cnmeta_tags_categories_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnmeta_tags_categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnmeta_tags_products_description`
--

DROP TABLE IF EXISTS `cnmeta_tags_products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnmeta_tags_products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`products_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnmeta_tags_products_description`
--

LOCK TABLES `cnmeta_tags_products_description` WRITE;
/*!40000 ALTER TABLE `cnmeta_tags_products_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnmeta_tags_products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnmusic_genre`
--

DROP TABLE IF EXISTS `cnmusic_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnmusic_genre` (
  `music_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_genre_name` varchar(32) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`music_genre_id`),
  KEY `idx_music_genre_name_zen` (`music_genre_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnmusic_genre`
--

LOCK TABLES `cnmusic_genre` WRITE;
/*!40000 ALTER TABLE `cnmusic_genre` DISABLE KEYS */;
INSERT INTO `cnmusic_genre` (`music_genre_id`, `music_genre_name`, `date_added`, `last_modified`) VALUES (1,'摇滚','2004-06-01 20:53:26',NULL),(2,'爵士','2004-06-01 20:53:45',NULL);
/*!40000 ALTER TABLE `cnmusic_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnnewsletters`
--

DROP TABLE IF EXISTS `cnnewsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnnewsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnnewsletters`
--

LOCK TABLES `cnnewsletters` WRITE;
/*!40000 ALTER TABLE `cnnewsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnnewsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnorders`
--

DROP TABLE IF EXISTS `cnorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnorders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `customers_company` varchar(64) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL DEFAULT '',
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL DEFAULT '',
  `customers_postcode` varchar(10) NOT NULL DEFAULT '',
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL DEFAULT '',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_address_format_id` int(5) NOT NULL DEFAULT '0',
  `delivery_name` varchar(64) NOT NULL DEFAULT '',
  `delivery_company` varchar(64) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL DEFAULT '',
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL DEFAULT '',
  `delivery_postcode` varchar(10) NOT NULL DEFAULT '',
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL DEFAULT '',
  `delivery_address_format_id` int(5) NOT NULL DEFAULT '0',
  `billing_name` varchar(64) NOT NULL DEFAULT '',
  `billing_company` varchar(64) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL DEFAULT '',
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL DEFAULT '',
  `billing_postcode` varchar(10) NOT NULL DEFAULT '',
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL DEFAULT '',
  `billing_address_format_id` int(5) NOT NULL DEFAULT '0',
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `payment_module_code` varchar(32) NOT NULL DEFAULT '',
  `shipping_method` varchar(128) NOT NULL DEFAULT '',
  `shipping_module_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `cc_cvv` blob,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL DEFAULT '0',
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `order_total` decimal(14,2) DEFAULT NULL,
  `order_tax` decimal(14,2) DEFAULT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(96) NOT NULL DEFAULT '',
  `jmw_orders_send_status` int(2) NOT NULL,
  `jmwOrderID` varchar(50) NOT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `idx_status_orders_cust_zen` (`orders_status`,`orders_id`,`customers_id`),
  KEY `idx_date_purchased_zen` (`date_purchased`),
  KEY `idx_cust_id_orders_id_zen` (`customers_id`,`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnorders`
--

LOCK TABLES `cnorders` WRITE;
/*!40000 ALTER TABLE `cnorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnorders_products`
--

DROP TABLE IF EXISTS `cnorders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnorders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_tax` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `products_quantity` float NOT NULL DEFAULT '0',
  `onetime_charges` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`products_id`),
  KEY `idx_prod_id_orders_id_zen` (`products_id`,`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnorders_products`
--

LOCK TABLES `cnorders_products` WRITE;
/*!40000 ALTER TABLE `cnorders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnorders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnorders_products_attributes`
--

DROP TABLE IF EXISTS `cnorders_products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnorders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `products_options` varchar(32) NOT NULL DEFAULT '',
  `products_options_values` text NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`orders_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnorders_products_attributes`
--

LOCK TABLES `cnorders_products_attributes` WRITE;
/*!40000 ALTER TABLE `cnorders_products_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnorders_products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnorders_products_download`
--

DROP TABLE IF EXISTS `cnorders_products_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnorders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_id_zen` (`orders_id`),
  KEY `idx_orders_products_id_zen` (`orders_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnorders_products_download`
--

LOCK TABLES `cnorders_products_download` WRITE;
/*!40000 ALTER TABLE `cnorders_products_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnorders_products_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnorders_status`
--

DROP TABLE IF EXISTS `cnorders_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnorders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name_zen` (`orders_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnorders_status`
--

LOCK TABLES `cnorders_status` WRITE;
/*!40000 ALTER TABLE `cnorders_status` DISABLE KEYS */;
INSERT INTO `cnorders_status` (`orders_status_id`, `language_id`, `orders_status_name`) VALUES (3,1,'Delivered'),(1,1,'Pending'),(2,1,'Processing'),(4,1,'Update'),(2,2,'处理中'),(3,2,'已发货'),(4,2,'已更新'),(1,2,'等待中');
/*!40000 ALTER TABLE `cnorders_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnorders_status_history`
--

DROP TABLE IF EXISTS `cnorders_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnorders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_status_id` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customer_notified` int(1) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_id_status_id_zen` (`orders_id`,`orders_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnorders_status_history`
--

LOCK TABLES `cnorders_status_history` WRITE;
/*!40000 ALTER TABLE `cnorders_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnorders_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnorders_total`
--

DROP TABLE IF EXISTS `cnorders_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnorders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `class` varchar(32) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_ot_orders_id_zen` (`orders_id`),
  KEY `idx_ot_class_zen` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnorders_total`
--

LOCK TABLES `cnorders_total` WRITE;
/*!40000 ALTER TABLE `cnorders_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnorders_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnpaypal`
--

DROP TABLE IF EXISTS `cnpaypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnpaypal` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` varchar(6) NOT NULL DEFAULT '',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnpaypal`
--

LOCK TABLES `cnpaypal` WRITE;
/*!40000 ALTER TABLE `cnpaypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnpaypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnpaypal_payment_status`
--

DROP TABLE IF EXISTS `cnpaypal_payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnpaypal_payment_status` (
  `payment_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`payment_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnpaypal_payment_status`
--

LOCK TABLES `cnpaypal_payment_status` WRITE;
/*!40000 ALTER TABLE `cnpaypal_payment_status` DISABLE KEYS */;
INSERT INTO `cnpaypal_payment_status` (`payment_status_id`, `payment_status_name`) VALUES (1,'Completed'),(2,'Pending'),(3,'Failed'),(4,'Denied'),(5,'Refunded'),(6,'Canceled_Reversal'),(7,'Reversed');
/*!40000 ALTER TABLE `cnpaypal_payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnpaypal_payment_status_history`
--

DROP TABLE IF EXISTS `cnpaypal_payment_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnpaypal_payment_status_history` (
  `payment_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(64) NOT NULL DEFAULT '',
  `payment_status` varchar(17) NOT NULL DEFAULT '',
  `pending_reason` varchar(14) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`payment_status_history_id`),
  KEY `idx_paypal_ipn_id_zen` (`paypal_ipn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnpaypal_payment_status_history`
--

LOCK TABLES `cnpaypal_payment_status_history` WRITE;
/*!40000 ALTER TABLE `cnpaypal_payment_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnpaypal_payment_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnpaypal_session`
--

DROP TABLE IF EXISTS `cnpaypal_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnpaypal_session` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` text NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_session_id_zen` (`session_id`(36))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnpaypal_session`
--

LOCK TABLES `cnpaypal_session` WRITE;
/*!40000 ALTER TABLE `cnpaypal_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnpaypal_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnpaypal_testing`
--

DROP TABLE IF EXISTS `cnpaypal_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnpaypal_testing` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `custom` varchar(255) NOT NULL DEFAULT '',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` decimal(2,1) NOT NULL DEFAULT '0.0',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnpaypal_testing`
--

LOCK TABLES `cnpaypal_testing` WRITE;
/*!40000 ALTER TABLE `cnpaypal_testing` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnpaypal_testing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproduct_music_extra`
--

DROP TABLE IF EXISTS `cnproduct_music_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproduct_music_extra` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `music_genre_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_music_genre_id_zen` (`music_genre_id`),
  KEY `idx_artists_id_zen` (`artists_id`),
  KEY `idx_record_company_id_zen` (`record_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproduct_music_extra`
--

LOCK TABLES `cnproduct_music_extra` WRITE;
/*!40000 ALTER TABLE `cnproduct_music_extra` DISABLE KEYS */;
INSERT INTO `cnproduct_music_extra` (`products_id`, `artists_id`, `record_company_id`, `music_genre_id`) VALUES (166,1,0,1),(169,1,1,2);
/*!40000 ALTER TABLE `cnproduct_music_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproduct_type_layout`
--

DROP TABLE IF EXISTS `cnproduct_type_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproduct_type_layout` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_type_id_sort_order_zen` (`product_type_id`,`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproduct_type_layout`
--

LOCK TABLES `cnproduct_type_layout` WRITE;
/*!40000 ALTER TABLE `cnproduct_type_layout` DISABLE KEYS */;
INSERT INTO `cnproduct_type_layout` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `product_type_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES (1,'显示型号','SHOW_PRODUCT_INFO_MODEL','1','在商品页面显示型号 0= 否 1= 是',1,1,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(2,'显示重量','SHOW_PRODUCT_INFO_WEIGHT','1','在商品页面显示重量 0= 否 1= 是',1,2,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(3,'显示属性重量','SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES','1','在商品页面显示属性重量 0= 否 1= 是',1,3,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(4,'显示厂商','SHOW_PRODUCT_INFO_MANUFACTURER','1','在商品页面显示厂商名字 0= 否 1= 是',1,4,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(5,'显示购物车中数量','SHOW_PRODUCT_INFO_IN_CART_QTY','1','在商品页面显示购物车中商品数量 0= 否 1= 是',1,5,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(6,'显示库存数量','SHOW_PRODUCT_INFO_QUANTITY','1','在商品页面显示库存数量 0= 否 1= 是',1,6,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(7,'显示商品评论计数','SHOW_PRODUCT_INFO_REVIEWS_COUNT','1','在商品页面显示商品评论计数 0= 否 1= 是',1,7,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(8,'显示商品评论按钮','SHOW_PRODUCT_INFO_REVIEWS','1','在商品页面显示商品评论按钮 0= 否 1= 是',1,8,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(9,'显示上市日期','SHOW_PRODUCT_INFO_DATE_AVAILABLE','1','在商品页面显示上市日期 0= 否 1= 是',1,9,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(10,'显示加入日期','SHOW_PRODUCT_INFO_DATE_ADDED','1','在商品页面显示加入日期 0= 否 1= 是',1,10,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(11,'显示商品网址','SHOW_PRODUCT_INFO_URL','1','在商品页面显示网址 0= 否 1= 是',1,11,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(12,'显示商品附加图像','SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES','1','在商品页面显示附加图像 0= 否 1= 是',1,13,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(13,'显示最低价格文字','SHOW_PRODUCT_INFO_STARTING_AT','1','是否在含属性的商品页面显示最低价格文字 0= 否 1= 是',1,12,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(14,'商品免运费图像 - 分类','SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','是否在分类中显示免运费图像/文字?',1,16,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(15,'商品价格缺省税种 - 增加新商品时','DEFAULT_PRODUCT_TAX_CLASS_ID','0','增加新商品时，缺省的商品价格税种的编号是?',1,100,NULL,'2013-05-08 21:35:35','',''),(16,'虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时','DEFAULT_PRODUCT_PRODUCTS_VIRTUAL','0','增加新商品时，缺省的虚拟商品状态为开?',1,101,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(17,'商品免运费缺省状态 - 正常运费 - 增加新商品时','DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货',1,102,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(18,'显示型号','SHOW_PRODUCT_MUSIC_INFO_MODEL','1','在商品页面显示型号 0= 否 1= 是',2,1,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(19,'显示重量','SHOW_PRODUCT_MUSIC_INFO_WEIGHT','0','在商品页面显示重量 0= 否 1= 是',2,2,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(20,'显示属性重量','SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES','1','在商品页面显示属性重量 0= 否 1= 是',2,3,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(21,'显示歌手','SHOW_PRODUCT_MUSIC_INFO_ARTIST','1','在商品页面显示歌手名字 0= 否 1= 是',2,4,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(22,'显示音乐类型','SHOW_PRODUCT_MUSIC_INFO_GENRE','1','在商品页面显示音乐类型 0= 否 1= 是',2,4,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(23,'显示唱片公司','SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY','1','在商品页面显示唱片公司 0= 否 1= 是',2,4,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(24,'显示购物车中数量','SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY','1','在商品页面显示购物车中商品数量 0= 否 1= 是',2,5,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(25,'显示库存数量','SHOW_PRODUCT_MUSIC_INFO_QUANTITY','0','在商品页面显示库存数量 0= 否 1= 是',2,6,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(26,'显示商品评论计数','SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT','1','在商品页面显示商品评论计数 0= 否 1= 是',2,7,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(27,'显示商品评论按钮','SHOW_PRODUCT_MUSIC_INFO_REVIEWS','1','在商品页面显示商品评论按钮 0= 否 1= 是',2,8,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(28,'显示上市日期','SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE','1','在商品页面显示上市日期 0= 否 1= 是',2,9,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(29,'显示加入日期','SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED','1','在商品页面显示加入日期 0= 否 1= 是',2,10,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(30,'显示商品附加图像','SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES','1','在商品页面显示附加图像 0= 否 1= 是',2,13,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(31,'显示价格文字最低至','SHOW_PRODUCT_MUSIC_INFO_STARTING_AT','1','是否在含属性的商品页面显示最低价格文字 0= 否 1= 是',2,12,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(32,'商品免运费图像 - 分类','SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','是否在列表中显示免运费图像/文字?',2,16,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(33,'商品价格缺省税种 - 增加新商品时','DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID','0','增加新商品时，缺省的商品价格税种的编号是?',2,100,NULL,'2013-05-08 21:35:35','',''),(34,'虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时','DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL','0','增加新商品时，缺省的虚拟商品状态为开?',2,101,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(35,'商品免运费缺省状态 - 正常运费 - 增加新商品时','DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货',2,102,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(36,'显示商品评论计数','SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT','1','在商品页面显示商品评论计数 Info 0= 否 1= 是',3,7,NULL,'2013-05-08 21:35:35',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(37,'显示商品评论按钮','SHOW_DOCUMENT_GENERAL_INFO_REVIEWS','1','在商品页面显示商品评论按钮 0= 否 1= 是',3,8,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(38,'显示上市日期','SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE','1','在商品页面显示上市日期 0= 否 1= 是',3,9,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(39,'显示加入日期','SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED','1','在商品页面显示加入日期 0= 否 1= 是',3,10,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(40,'显示商品网址','SHOW_DOCUMENT_GENERAL_INFO_URL','1','在商品页面显示网址 0= 否 1= 是',3,11,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(41,'显示商品附加图像','SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES','1','在商品页面显示附加图像 0= 否 1= 是',3,13,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(42,'显示型号','SHOW_DOCUMENT_PRODUCT_INFO_MODEL','1','在商品页面显示型号 0= 否 1= 是',4,1,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(43,'显示重量','SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT','0','在商品页面显示重量 0= 否 1= 是',4,2,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(44,'显示属性重量','SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES','1','在商品页面显示属性重量 0= 否 1= 是',4,3,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(45,'显示厂商','SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER','1','在商品页面显示厂商名字 0= 否 1= 是',4,4,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(46,'显示购物车中数量','SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY','1','在商品页面显示购物车中商品数量 0= 否 1= 是',4,5,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(47,'显示库存数量','SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY','0','在商品页面显示库存数量 0= 否 1= 是',4,6,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(48,'显示商品评论计数','SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT','1','在商品页面显示商品评论计数 0= 否 1= 是',4,7,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(49,'显示商品评论按钮','SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS','1','在商品页面显示商品评论按钮 0= 否 1= 是',4,8,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(50,'显示上市日期','SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE','1','在商品页面显示上市日期 0= 否 1= 是',4,9,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(51,'显示加入日期','SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED','1','在商品页面显示加入日期 0= 否 1= 是',4,10,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(52,'显示商品网址','SHOW_DOCUMENT_PRODUCT_INFO_URL','1','在商品页面显示网址 0= 否 1= 是',4,11,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(53,'显示商品附加图像','SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES','1','在商品页面显示附加图像 0= 否 1= 是',4,13,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(54,'显示价格文字最低至','SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT','1','是否在含属性的商品页面显示最低价格文字 0= 否 1= 是',4,12,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(55,'商品免运费图像状态 - 分类','SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','是否在列表中显示免运费图像/文字?',4,16,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(56,'商品价格缺省税种 - 增加新商品时','DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID','0','增加新商品时，缺省的商品价格税种的编号是?',4,100,NULL,'2013-05-08 21:35:36','',''),(57,'虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL','0','增加新商品时，缺省的虚拟商品状态为开?',4,101,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(58,'商品免运费缺省状态 - 正常运费 - 增加新商品时','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货',4,102,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(59,'显示型号','SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL','1','在商品页面显示型号 0= 否 1= 是',5,1,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(60,'显示重量','SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT','0','在商品页面显示重量 0= 否 1= 是',5,2,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(61,'显示属性重量','SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES','1','在商品页面显示属性重量 0= 否 1= 是',5,3,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(62,'显示厂商','SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER','1','在商品页面显示厂商名字 0= 否 1= 是',5,4,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(63,'显示购物车中数量','SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY','1','在商品页面显示购物车中商品数量 0= 否 1= 是',5,5,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(64,'显示库存数量','SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY','1','在商品页面显示库存数量 0= 否 1= 是',5,6,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(65,'显示商品评论计数','SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT','1','在商品页面显示商品评论计数 0= 否 1= 是',5,7,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(66,'显示商品评论按钮','SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS','1','在商品页面显示商品评论按钮 0= 否 1= 是',5,8,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(67,'显示上市日期','SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE','0','在商品页面显示上市日期 0= 否 1= 是',5,9,NULL,'2013-05-08 21:35:36',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(68,'显示加入日期','SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED','1','在商品页面显示加入日期 0= 否 1= 是',5,10,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(69,'显示商品网址','SHOW_PRODUCT_FREE_SHIPPING_INFO_URL','1','在商品页面显示网址 0= 否 1= 是',5,11,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(70,'显示商品附加图像','SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES','1','在商品页面显示附加图像 0= 否 1= 是',5,13,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(71,'显示价格文字 最低至','SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT','1','是否在含属性的商品页面显示最低价格文字 0= 否 1= 是',5,12,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(72,'商品免运费图像 - 分类','SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','1','是否在列表中显示免运费图像/文字?',5,16,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(73,'商品价格缺省税种 - 增加新商品时','DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID','0','增加新商品时，缺省的商品价格税种的编号是?',5,100,NULL,'2013-05-08 21:35:37','',''),(74,'虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL','0','增加新商品时，缺省的虚拟商品状态为开?',5,101,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(75,'商品免运费缺省状态 - 正常运费 - 增加新商品时','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','1','增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货',5,102,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(76,'显示元标签标题缺省值 - 商品标题','SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS','1','在元标签标题上显示商品标题 0= 否 1= 是',1,50,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(77,'显示元标签标题缺省值 - 商品名称','SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','在元标签标题上显示商品名称 0= 否 1= 是',1,51,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(78,'显示元标签标题缺省值 - 商品型号','SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS','1','在元标签标题上显示商品型号 0= 否 1= 是',1,52,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(79,'显示元标签标题缺省值 - 商品价格','SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS','1','在元标签标题上显示商品价格 0= 否 1= 是',1,53,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(80,'显示元标签标题缺省值 - 商品标签行','SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','在元标签标题上显示商品标签行 0= 否 1= 是',1,54,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(81,'显示元标签标题缺省值 - 商品标题','SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS','1','在元标签标题上显示商品标题 0= 否 1= 是',2,50,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(82,'显示元标签标题缺省值 - 商品名称','SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','在元标签标题上显示商品名称 0= 否 1= 是',2,51,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(83,'显示元标签标题缺省值 - 商品型号','SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS','1','在元标签标题上显示商品型号 0= 否 1= 是',2,52,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(84,'显示元标签标题缺省值 - 商品价格','SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS','1','在元标签标题上显示商品价格 0= 否 1= 是',2,53,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(85,'显示元标签标题缺省值 - 商品标签行','SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','在元标签标题上显示商品标签行 0= 否 1= 是',2,54,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(86,'显示元标签标题缺省值 - 文档标题','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS','1','在元标签标题上显示文档标题 0= 否 1= 是',3,50,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(87,'显示元标签标题缺省值 - 文档名称','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','在元标签标题上显示文档名称 0= 否 1= 是',3,51,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(88,'显示元标签标题缺省值 - 文档 Tagline','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','在元标签标题上显示文档标签行 Title 0= 否 1= 是',3,54,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(89,'显示元标签标题缺省值 - 文档标题','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS','1','在元标签标题上显示文档标题 0= 否 1= 是',4,50,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(90,'显示元标签标题缺省值 - 文档名称','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','在元标签标题上显示文档名称 0= 否 1= 是',4,51,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(91,'显示元标签标题缺省值 - 文档型号','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS','1','在元标签标题上显示文档型号 0= 否 1= 是',4,52,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(92,'显示元标签标题缺省值 - 文档价格','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS','1','在元标签标题上显示文档价格 0= 否 1= 是',4,53,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(93,'显示元标签标题缺省值 - 文档 Tagline','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','在元标签标题上显示文档标签行 0= 否 1= 是',4,54,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(94,'显示元标签标题缺省值 - 商品标题','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS','1','在元标签标题上显示商品标题 0= 否 1= 是',5,50,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(95,'显示元标签标题缺省值 - 商品名称','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','在元标签标题上显示商品名称 0= 否 1= 是',5,51,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(96,'显示元标签标题缺省值 - 商品型号','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS','1','在元标签标题上显示商品型号 0= 否 1= 是',5,52,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(97,'显示元标签标题缺省值 - 商品价格','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS','1','在元标签标题上显示商品价格 0= 否 1= 是',5,53,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(98,'显示元标签标题缺省值 - 商品标签行','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','在元标签标题上显示商品标签行 0= 否 1= 是',5,54,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(99,'商品属性仅用于显示 - 缺省','DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY','0','商品属性仅用于显示<br />仅用于显示<br />0= 否 1= 是',1,200,NULL,'2013-05-08 21:35:37',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(100,'商品属性免费 - 缺省','DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE','1','商品属性免费<br />商品免费时属性免费<br />0= 否 1= 是',1,201,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(101,'商品属性缺省 - 缺省','DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT','0','商品属性缺省<br />缺省选中的属性<br />0= 否 1= 是',1,202,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(102,'商品属性有优惠 - 缺省','DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED','1','商品属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是',1,203,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(103,'商品属性定价包含商品基价 - 缺省','DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED','1','商品属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是',1,204,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(104,'商品属性是必选的 - 缺省','DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED','0','商品属性是必选的<br />属性是必须的<br />0= 否 1= 是',1,205,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(105,'商品属性价格前缀 - 缺省','DEFAULT_PRODUCT_PRICE_PREFIX','1','商品属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -',1,206,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(106,'商品属性重量前缀 - 缺省','DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','商品属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -',1,207,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(107,'音乐属性仅用于显示 - 缺省','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY','0','音乐属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是',2,200,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(108,'音乐属性免费 - 缺省','DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE','1','音乐属性免费<br />商品免费时属性免费<br />0= 否 1= 是',2,201,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(109,'音乐属性缺省 - 缺省','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT','0','音乐属性缺省<br />缺省选中的属性<br />0= 否 1= 是',2,202,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(110,'音乐属性有优惠 - 缺省','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED','1','音乐属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是',2,203,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(111,'音乐属性定价包含商品基价 - 缺省','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED','1','音乐属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是',2,204,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(112,'音乐属性是必选的 - 缺省','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED','0','音乐属性是必选的<br />属性是必须的<br />0= 否 1= 是',2,205,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(113,'音乐属性价格前缀 - 缺省','DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX','1','音乐属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -',2,206,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(114,'音乐属性重量前缀 - 缺省','DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','音乐属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -',2,207,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(115,'普通文档属性仅用于显示 - 缺省','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY','0','普通文档属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是',3,200,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(116,'普通文档属性免费 - 缺省','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE','1','普通文档属性免费<br />商品免费时属性免费<br />0= 否 1= 是',3,201,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(117,'普通文档属性缺省 - 缺省','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT','0','普通文档属性缺省<br />缺省选中的属性<br />0= 否 1= 是',3,202,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(118,'普通文档属性有优惠 - 缺省','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED','1','普通文档属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是',3,203,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(119,'普通文档属性定价包含商品基价 - 缺省','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED','1','普通文档属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是',3,204,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(120,'普通文档属性是必选的 - 缺省','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED','0','普通文档属性是必选的<br />属性是必须的<br />0= 否 1= 是',3,205,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(121,'普通文档属性价格前缀 - 缺省','DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX','1','普通文档属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -',3,206,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(122,'普通文档属性重量前缀 - 缺省','DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','普通文档属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -',3,207,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(123,'商品文档属性仅用于显示 - 缺省','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY','0','商品文档属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是',4,200,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(124,'商品文档属性免费 - 缺省','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE','1','商品文档属性免费<br />商品免费时属性免费<br />0= 否 1= 是',4,201,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(125,'商品文档属性缺省 - 缺省','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT','0','商品文档属性缺省<br />缺省选中的属性<br />0= 否 1= 是',4,202,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(126,'商品文档属性有优惠 - 缺省','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED','1','商品文档属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是',4,203,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(127,'商品文档属性定价包含商品基价 - 缺省','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED','1','商品文档属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是',4,204,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(128,'商品文档属性是必选的 - 缺省','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED','0','商品文档属性是必选的<br />属性是必须的<br />0= 否 1= 是',4,205,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(129,'商品文档属性价格前缀 - 缺省','DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX','1','商品文档属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -',4,206,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(130,'商品文档属性重量前缀 - 缺省','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','商品文档属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -',4,207,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(131,'免运费商品属性仅用于显示 - 缺省','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY','0','免运费商品属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是',5,201,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(132,'免运费商品属性免费 - 缺省','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE','1','免运费商品属性免费<br />商品免费时属性免费<br />0= 否 1= 是',5,201,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(133,'免运费商品属性缺省 - 缺省','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT','0','免运费商品属性缺省<br />缺省选中的属性<br />0= 否 1= 是',5,202,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(134,'免运费商品属性有优惠 - 缺省','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED','1','免运费商品属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是',5,203,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(135,'免运费商品属性定价包含商品基价 - 缺省','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED','1','免运费商品属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是',5,204,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(136,'免运费商品属性是必选的 - 缺省','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED','0','免运费商品属性是必选的<br />属性是必须的<br />0= 否 1= 是',5,205,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(137,'免运费商品属性价格前缀 - 缺省','DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX','1','免运费商品属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -',5,206,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(138,'免运费商品属性重量前缀 - 缺省','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','免运费商品属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -',5,207,NULL,'2013-05-08 21:35:38',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
/*!40000 ALTER TABLE `cnproduct_type_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproduct_types`
--

DROP TABLE IF EXISTS `cnproduct_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproduct_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `type_handler` varchar(255) NOT NULL DEFAULT '',
  `type_master_type` int(11) NOT NULL DEFAULT '1',
  `allow_add_to_cart` char(1) NOT NULL DEFAULT 'Y',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_master_type_zen` (`type_master_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproduct_types`
--

LOCK TABLES `cnproduct_types` WRITE;
/*!40000 ALTER TABLE `cnproduct_types` DISABLE KEYS */;
INSERT INTO `cnproduct_types` (`type_id`, `type_name`, `type_handler`, `type_master_type`, `allow_add_to_cart`, `default_image`, `date_added`, `last_modified`) VALUES (1,'商品 - 普通','product',1,'Y','','2013-05-08 21:35:34','2013-05-08 21:35:34'),(2,'商品 - 音乐','product_music',1,'Y','','2013-05-08 21:35:34','2013-05-08 21:35:34'),(3,'文档 - 普通','document_general',3,'N','','2013-05-08 21:35:34','2013-05-08 21:35:34'),(4,'文档 - 商品','document_product',3,'Y','','2013-05-08 21:35:34','2013-05-08 21:35:34'),(5,'商品 - 免运费','product_free_shipping',1,'Y','','2013-05-08 21:35:34','2013-05-08 21:35:34');
/*!40000 ALTER TABLE `cnproduct_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproduct_types_to_category`
--

DROP TABLE IF EXISTS `cnproduct_types_to_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproduct_types_to_category` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_category_id_zen` (`category_id`),
  KEY `idx_product_type_id_zen` (`product_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproduct_types_to_category`
--

LOCK TABLES `cnproduct_types_to_category` WRITE;
/*!40000 ALTER TABLE `cnproduct_types_to_category` DISABLE KEYS */;
INSERT INTO `cnproduct_types_to_category` (`product_type_id`, `category_id`) VALUES (3,63),(4,63),(2,62);
/*!40000 ALTER TABLE `cnproduct_types_to_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproducts`
--

DROP TABLE IF EXISTS `cnproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproducts` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_type` int(11) NOT NULL DEFAULT '1',
  `products_quantity` float NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_image` varchar(64) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `products_date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` float NOT NULL DEFAULT '0',
  `products_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_tax_class_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` float NOT NULL DEFAULT '0',
  `products_quantity_order_min` float NOT NULL DEFAULT '1',
  `products_quantity_order_units` float NOT NULL DEFAULT '1',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_call` tinyint(1) NOT NULL DEFAULT '0',
  `products_quantity_mixed` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_always_free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `products_qty_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `products_quantity_order_max` float NOT NULL DEFAULT '0',
  `products_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_price_sorter` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `master_categories_id` int(11) NOT NULL DEFAULT '0',
  `products_mixed_discount_quantity` tinyint(1) NOT NULL DEFAULT '1',
  `metatags_title_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_products_name_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_model_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_title_tagline_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_jmw_sku` varchar(50) DEFAULT NULL,
  `products_jmw_width` int(2) NOT NULL,
  `products_jmw_length` int(2) NOT NULL,
  `products_jmw_height` int(2) NOT NULL,
  `products_updatedate` varchar(20) NOT NULL,
  `products_jmw_api` int(2) NOT NULL,
  PRIMARY KEY (`products_id`),
  KEY `idx_products_date_added_zen` (`products_date_added`),
  KEY `idx_products_status_zen` (`products_status`),
  KEY `idx_products_date_available_zen` (`products_date_available`),
  KEY `idx_products_ordered_zen` (`products_ordered`),
  KEY `idx_products_model_zen` (`products_model`),
  KEY `idx_products_price_sorter_zen` (`products_price_sorter`),
  KEY `idx_master_categories_id_zen` (`master_categories_id`),
  KEY `idx_products_sort_order_zen` (`products_sort_order`),
  KEY `idx_manufacturers_id_zen` (`manufacturers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproducts`
--

LOCK TABLES `cnproducts` WRITE;
/*!40000 ALTER TABLE `cnproducts` DISABLE KEYS */;
INSERT INTO `cnproducts` (`products_id`, `products_type`, `products_quantity`, `products_model`, `products_image`, `products_price`, `products_virtual`, `products_date_added`, `products_last_modified`, `products_date_available`, `products_weight`, `products_status`, `products_tax_class_id`, `manufacturers_id`, `products_ordered`, `products_quantity_order_min`, `products_quantity_order_units`, `products_priced_by_attribute`, `product_is_free`, `product_is_call`, `products_quantity_mixed`, `product_is_always_free_shipping`, `products_qty_box_status`, `products_quantity_order_max`, `products_sort_order`, `products_discount_type`, `products_discount_type_from`, `products_price_sorter`, `master_categories_id`, `products_mixed_discount_quantity`, `metatags_title_status`, `metatags_products_name_status`, `metatags_model_status`, `metatags_price_status`, `metatags_title_tagline_status`, `products_jmw_sku`, `products_jmw_width`, `products_jmw_length`, `products_jmw_height`, `products_updatedate`, `products_jmw_api`) VALUES (1,1,31,'MG200MMS','matrox/mg200mms.gif',299.9900,0,'2003-11-03 12:32:17','2004-04-26 23:57:34',NULL,23,1,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,299.9900,4,1,0,0,0,0,0,NULL,0,0,0,'',0),(2,1,31,'MG400-32MB','matrox/mg400-32mb.gif',499.9900,0,'2003-11-03 12:32:17',NULL,NULL,23,1,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,499.9900,4,1,0,0,0,0,0,NULL,0,0,0,'',0),(3,1,500,'MSIMPRO','microsoft/msimpro.gif',49.9900,0,'2003-11-03 12:32:17',NULL,NULL,7,1,1,2,1,1,1,0,0,0,0,0,1,0,0,0,0,39.9900,9,1,0,0,0,0,0,NULL,0,0,0,'',0),(4,1,12,'DVD-RPMK','dvd/replacement_killers.gif',42.0000,0,'2003-11-03 12:32:17',NULL,NULL,23,1,1,3,1,1,1,0,0,0,0,0,1,0,0,0,0,42.0000,10,1,0,0,0,0,0,NULL,0,0,0,'',0),(5,1,15,'DVD-BLDRNDC','dvd/blade_runner.gif',35.9900,0,'2003-11-03 12:32:17','2003-12-23 00:44:28',NULL,7,1,1,3,2,1,1,0,0,0,0,0,1,0,0,0,0,30.0000,11,1,0,0,0,0,0,NULL,0,0,0,'',0),(6,1,8,'DVD-MATR','dvd/the_matrix.gif',39.9900,0,'2003-11-03 12:32:17','2003-12-23 00:48:28',NULL,7,1,1,3,2,1,1,0,0,0,0,0,1,0,0,0,0,30.0000,10,1,0,0,0,0,0,NULL,0,0,0,'',0),(7,1,500,'DVD-YGEM','dvd/youve_got_mail.gif',34.9900,0,'2003-11-03 12:32:17','2004-04-27 14:53:17',NULL,7,1,1,3,5,1,1,0,0,0,0,0,1,0,0,0,0,34.9900,12,1,0,0,0,0,0,NULL,0,0,0,'',0),(8,1,499,'DVD-ABUG','dvd/a_bugs_life.gif',35.9900,0,'2003-11-03 12:32:17','2004-04-27 14:52:54',NULL,7,1,1,3,6,1,1,0,0,0,0,0,1,0,10,1,1,35.9900,13,1,0,0,0,0,0,NULL,0,0,0,'',0),(9,1,10,'DVD-UNSG','dvd/under_siege.gif',29.9900,0,'2003-11-03 12:32:17','2004-05-17 13:35:27',NULL,7,1,1,3,0,1,1,0,0,0,0,0,1,0,0,0,0,29.9900,10,1,0,0,0,0,0,NULL,0,0,0,'',0),(10,1,9,'DVD-UNSG2','dvd/under_siege2.gif',29.9900,0,'2003-11-03 12:32:17',NULL,NULL,7,1,1,3,1,1,1,0,0,0,0,0,1,0,0,0,0,29.9900,10,1,0,0,0,0,0,NULL,0,0,0,'',0),(11,1,10,'DVD-FDBL','dvd/fire_down_below.gif',29.9900,0,'2003-11-03 12:32:17','2003-12-23 00:43:40',NULL,7,1,1,3,0,1,1,0,0,0,0,0,1,0,0,0,0,29.9900,10,1,0,0,0,0,0,NULL,0,0,0,'',0),(12,1,9,'DVD-DHWV','dvd/die_hard_3.gif',39.9900,0,'2003-11-03 12:32:17','2004-05-16 00:34:33',NULL,7,1,1,4,6,1,1,0,0,0,0,0,1,0,0,0,0,39.9900,10,1,0,0,0,0,0,NULL,0,0,0,'',0),(13,1,10,'DVD-LTWP','dvd/lethal_weapon.gif',34.9900,0,'2003-11-03 12:32:17','2004-04-27 00:07:35',NULL,7,1,1,3,0,1,1,0,0,0,0,0,1,0,0,0,0,34.9900,10,1,0,0,0,0,0,NULL,0,0,0,'',0),(14,1,9,'DVD-REDC','dvd/red_corner.gif',32.0000,0,'2003-11-03 12:32:17','2003-12-23 00:47:39',NULL,7,1,1,3,1,1,1,0,0,0,0,0,1,0,0,0,0,32.0000,15,1,0,0,0,0,0,NULL,0,0,0,'',0),(15,1,9,'DVD-FRAN','dvd/frantic.gif',35.0000,0,'2003-11-03 12:32:17','2003-12-23 00:43:55',NULL,7,1,1,3,1,1,1,0,0,0,0,0,1,0,0,0,0,35.0000,14,1,0,0,0,0,0,NULL,0,0,0,'',0),(16,1,9,'DVD-CUFI','dvd/courage_under_fire.gif',38.9900,0,'2003-11-03 12:32:17','2003-12-23 00:42:57',NULL,7,1,1,4,1,1,1,0,0,0,0,0,1,0,0,0,0,29.9900,15,1,0,0,0,0,0,NULL,0,0,0,'',0),(17,1,10,'DVD-SPEED','dvd/speed.gif',39.9900,0,'2003-11-03 12:32:17','2003-12-23 00:47:51',NULL,7,1,1,4,0,1,1,0,0,0,0,0,1,0,0,0,0,39.9900,10,1,0,0,0,0,0,NULL,0,0,0,'',0),(18,1,10,'DVD-SPEED2','dvd/speed_2.gif',42.0000,0,'2003-11-03 12:32:17',NULL,NULL,7,1,1,4,0,1,1,0,0,0,0,0,1,0,0,0,0,42.0000,10,1,0,0,0,0,0,NULL,0,0,0,'',0),(19,1,10,'DVD-TSAB','dvd/theres_something_about_mary.gif',49.9900,0,'2003-11-03 12:32:17','2003-12-23 00:49:00',NULL,7,1,1,4,0,1,1,0,0,0,0,0,1,0,0,0,0,49.9900,12,1,0,0,0,0,0,NULL,0,0,0,'',0),(20,1,8,'DVD-BELOVED','dvd/beloved.gif',54.9900,0,'2003-11-03 12:32:17','2003-12-23 00:42:34',NULL,7,1,1,3,2,1,1,0,0,0,0,0,1,0,0,0,0,54.9900,15,1,0,0,0,0,0,NULL,0,0,0,'',0),(21,1,16,'PC-SWAT3','sierra/swat_3.gif',79.9900,0,'2003-11-03 12:32:17','2004-04-27 14:51:00',NULL,7,1,1,7,0,1,1,0,0,0,0,0,1,0,0,0,0,79.9900,18,1,0,0,0,0,0,NULL,0,0,0,'',0),(22,1,13,'PC-UNTM','gt_interactive/unreal_tournament.gif',89.9900,0,'2003-11-03 12:32:17','2003-12-23 00:49:29',NULL,7,1,1,8,9,1,1,0,0,0,0,0,1,0,0,0,0,89.9900,19,1,0,0,0,0,0,NULL,0,0,0,'',0),(23,1,16,'PC-TWOF','gt_interactive/wheel_of_time.gif',99.9900,0,'2003-11-03 12:32:17','2003-12-23 00:48:50',NULL,10,1,1,8,0,1,1,0,0,0,0,0,1,0,0,0,0,99.9900,20,1,0,0,0,0,0,NULL,0,0,0,'',0),(24,1,16,'PC-DISC','gt_interactive/disciples.gif',90.0000,0,'2003-11-03 12:32:17','2003-12-23 00:43:24',NULL,8,1,1,8,1,1,1,0,0,0,0,0,1,0,0,0,0,90.0000,20,1,0,0,0,0,0,NULL,0,0,0,'',0),(25,1,16,'MSINTKB','microsoft/intkeyboardps2.gif',69.9900,0,'2003-11-03 12:32:17','2004-01-04 03:02:41',NULL,8,1,1,2,0,1,1,0,0,0,0,0,1,0,0,0,0,69.9900,8,1,0,0,0,0,0,NULL,0,0,0,'',0),(26,1,9,'MSIMEXP','microsoft/imexplorer.gif',64.9500,0,'2003-11-03 12:32:17','2004-05-03 01:47:47',NULL,8,1,1,2,17,1,1,0,0,0,0,0,1,0,0,0,0,64.9500,9,1,0,0,0,0,0,NULL,0,0,0,'',0),(27,1,70,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',499.9900,0,'2003-11-03 12:32:17','2003-12-23 00:45:03',NULL,45,1,1,9,1,1,1,0,0,0,0,0,1,0,0,0,0,499.9900,5,1,0,0,0,0,0,NULL,0,0,0,'',0),(28,1,999,'GIFT005','gift_certificates/gv_5.gif',5.0000,1,'2003-11-03 12:32:17','2004-01-10 02:57:18',NULL,0,1,0,0,1,1,1,0,0,0,0,0,1,0,0,0,0,5.0000,21,1,0,0,0,0,0,NULL,0,0,0,'',0),(29,1,985,'GIFT 010','gift_certificates/gv_10.gif',10.0000,1,'2003-11-03 12:32:17','2003-12-28 14:51:36',NULL,0,1,0,0,15,1,1,0,0,0,0,0,1,0,0,0,0,10.0000,21,1,0,0,0,0,0,NULL,0,0,0,'',0),(30,1,992,'GIFT025','gift_certificates/gv_25.gif',25.0000,1,'2003-11-03 12:32:17',NULL,NULL,0,1,0,0,8,1,1,0,0,0,0,0,1,0,0,0,0,25.0000,21,1,0,0,0,0,0,NULL,0,0,0,'',0),(31,1,997,'GIFT050','gift_certificates/gv_50.gif',50.0000,1,'2003-11-03 12:32:17',NULL,NULL,0,1,0,0,4,1,1,0,0,0,0,0,1,0,0,0,0,50.0000,21,1,0,0,0,0,0,NULL,0,0,0,'',0),(32,1,995,'GIFT100','gift_certificates/gv_100.gif',100.0000,1,'2003-11-03 12:32:17',NULL,NULL,0,1,0,0,5,1,1,0,0,0,0,0,1,0,0,0,0,100.0000,21,1,0,0,0,0,0,NULL,0,0,0,'',0),(34,1,796,'DVD-ABUG','dvd/a_bugs_life.gif',35.9900,0,'2003-11-07 22:03:45','2004-01-01 14:16:01',NULL,7,1,1,3,5,1,1,0,0,0,0,0,1,0,0,0,0,35.9900,22,1,0,0,0,0,0,NULL,0,0,0,'',0),(36,1,700,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',0.0000,0,'2003-12-24 14:29:11','2004-01-03 01:51:12',NULL,45,1,1,9,0,1,1,1,0,0,0,0,1,0,0,0,0,499.0000,25,1,0,0,0,0,0,NULL,0,0,0,'',0),(39,1,997,'TESTFREE','free.gif',100.0000,0,'2003-12-25 16:33:13','2004-01-11 02:29:16',NULL,1,1,1,0,3,1,1,0,1,0,1,0,1,0,0,0,0,0.0000,24,1,0,0,0,0,0,NULL,0,0,0,'',0),(40,1,999,'TESTCALL','call_for_price.jpg',100.0000,0,'2003-12-25 17:42:15','2004-01-04 13:08:08',NULL,1,1,1,0,0,1,1,0,0,1,1,0,1,0,0,0,0,100.0000,24,1,0,0,0,0,0,NULL,0,0,0,'',0),(41,1,999,'TESTCALL','call_for_price.jpg',100.0000,0,'2003-12-25 19:13:35','2004-09-27 13:33:33',NULL,1,1,1,0,0,1,1,0,0,1,1,0,1,0,0,0,0,100.0000,28,0,0,0,0,0,0,NULL,0,0,0,'',0),(42,1,998,'TESTFREE','free.gif',100.0000,0,'2003-12-25 19:14:16','2003-12-25 19:15:00',NULL,1,1,1,0,1,1,1,0,1,0,1,0,1,0,0,0,0,0.0000,28,1,0,0,0,0,0,NULL,0,0,0,'',0),(43,1,999,'TESTFREEATTRIB','free.gif',100.0000,0,'2003-12-25 20:44:06','2004-01-21 16:23:29',NULL,0,1,1,0,0,1,1,0,1,0,1,0,1,0,0,0,0,0.0000,24,1,0,0,0,0,0,NULL,0,0,0,'',0),(44,1,999,'TESTMINUNITSNOMIX','sample_image.gif',100.0000,0,'2003-12-25 21:38:59','2004-01-22 13:15:41',NULL,1,1,1,0,0,4,2,0,0,0,0,0,1,0,0,0,0,90.0000,22,1,0,0,0,0,0,NULL,0,0,0,'',0),(46,1,981,'TESTMINUNITSMIX','sample_image.gif',100.0000,0,'2003-12-25 21:53:07','2003-12-29 02:00:50',NULL,1,1,1,0,18,4,2,0,0,0,1,0,1,0,0,0,0,90.0000,22,1,0,0,0,0,0,NULL,0,0,0,'',0),(47,1,9996,'GIFT','gift_certificates/gv.gif',0.0000,1,'2003-12-27 22:56:57','2004-09-29 20:11:51',NULL,0,1,0,0,4,1,1,1,0,0,1,0,1,0,0,0,0,5.0000,21,1,0,0,0,0,0,NULL,0,0,0,'',0),(48,1,9990,'TEST1','1_small.jpg',39.0000,0,'2003-12-28 02:27:47','2004-01-11 02:56:37',NULL,1,1,1,0,10,1,1,0,0,0,1,0,1,0,0,0,0,39.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(49,1,900,'TEST2','2_small.jpg',20.0000,0,'2003-12-28 02:28:42','2003-12-29 23:00:27',NULL,0.5,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,20.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(50,1,1000,'TEST3','3_small.jpg',75.0000,0,'2003-12-28 02:29:37','2003-12-29 23:01:04',NULL,1.5,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,75.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(51,1,998,'Free1','b_g_grid.gif',25.0000,0,'2003-12-28 11:51:05','2004-01-21 17:03:32',NULL,10,1,1,0,2,1,1,0,1,0,1,1,1,0,0,0,0,0.0000,24,1,0,0,0,0,0,NULL,0,0,0,'',0),(52,1,997,'Free2','b_p_grid.gif',0.0000,1,'2003-12-28 12:24:58','2004-01-21 17:01:18',NULL,2,1,1,0,2,1,1,0,1,0,1,0,1,0,0,0,0,0.0000,24,1,0,0,0,0,0,NULL,0,0,0,'',0),(53,1,991,'MINUNITSMIX','b_c_grid.gif',25.0000,0,'2003-12-28 23:26:44','2004-01-11 02:22:35',NULL,1,1,1,0,6,6,3,0,0,0,1,0,1,0,0,0,0,20.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(54,1,991,'MINUNITSNOMIX','waybkgnd.gif',25.0000,0,'2003-12-29 23:19:13','2004-01-11 02:23:08',NULL,1,1,1,0,0,6,3,0,0,0,0,0,1,0,0,0,0,25.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(55,1,991,'MINUNITSMIXSALE','b_b_grid.gif',25.0000,0,'2003-12-31 11:11:46','2004-01-11 02:26:28',NULL,1,1,1,0,0,6,3,0,0,0,1,0,1,0,0,0,0,25.0000,28,1,0,0,0,0,0,NULL,0,0,0,'',0),(56,1,991,'MINUNITSNOMIXSALE','b_w_grid.gif',25.0000,0,'2003-12-31 11:13:08','2004-01-11 02:26:49',NULL,1,1,1,0,0,6,3,0,0,0,0,0,1,0,0,0,0,25.0000,28,1,0,0,0,0,0,NULL,0,0,0,'',0),(57,1,998,'TESTFREEALL','free.gif',0.0000,0,'2003-12-31 11:36:09','2004-01-21 16:55:19',NULL,1,1,1,0,1,1,1,0,1,0,1,1,1,0,0,0,0,0.0000,24,1,0,0,0,0,0,NULL,0,0,0,'',0),(59,1,700,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',0.0000,0,'2003-12-31 14:36:57','2003-12-31 14:37:05',NULL,45,1,1,9,0,1,1,1,0,0,0,0,1,0,0,0,0,300.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(60,1,699,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',499.7500,0,'2004-01-02 01:34:55','2004-01-02 01:41:37',NULL,45,1,1,9,1,1,1,0,0,0,0,0,1,0,0,0,0,499.7500,28,1,0,0,0,0,0,NULL,0,0,0,'',0),(61,1,699,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',499.7500,0,'2004-01-02 01:44:09','2004-01-02 01:45:45',NULL,45,1,1,9,1,1,1,0,0,0,0,0,1,0,0,0,0,499.7500,28,1,0,0,0,0,0,NULL,0,0,0,'',0),(74,1,700,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',0.0000,0,'2004-01-02 15:34:49','2004-01-02 15:35:17',NULL,45,1,1,9,0,1,1,1,0,0,0,0,1,0,0,0,0,399.2000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(76,1,1000,'Test25-10','test_demo.jpg',100.0000,0,'2004-01-03 23:08:33',NULL,NULL,0,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,75.0000,28,1,0,0,0,0,0,NULL,0,0,0,'',0),(78,1,1000,'Test25-10AttrAll','test_demo.jpg',0.0000,0,'2004-01-04 01:09:46','2004-01-04 01:30:12',NULL,0,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,112.5000,25,1,0,0,0,0,0,NULL,0,0,0,'',0),(79,1,1000,'Test25-AttrAll','test_demo.jpg',0.0000,0,'2004-01-04 01:28:52','2004-01-04 01:33:55',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,150.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(80,1,1000,'Test25','test_demo.jpg',100.0000,0,'2004-01-04 01:31:06','2004-01-04 13:35:47',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,100.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(82,1,1000,'Test120-5','test_demo.jpg',120.0000,0,'2004-01-04 14:50:38','2004-01-04 17:09:03',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,115.0000,27,1,0,0,0,0,0,NULL,0,0,0,'',0),(83,1,1000,'Test120-90-5','test_demo.jpg',120.0000,0,'2004-01-04 15:01:53','2004-01-06 10:02:11',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,85.0000,27,1,0,0,0,0,0,NULL,0,0,0,'',0),(84,1,999,'Test120','test_demo.jpg',120.0000,0,'2004-01-04 15:05:10','2004-01-06 15:27:39',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,0,0,0,120.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(85,1,1000,'Test90','test_demo.jpg',120.0000,0,'2004-01-04 15:19:00','2004-01-06 10:00:35',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,90.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(88,1,1000,'Test120-90-10-Skip','test_demo.jpg',120.0000,0,'2004-01-05 00:14:31','2004-01-06 09:58:08',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,90.0000,31,1,0,0,0,0,0,NULL,0,0,0,'',0),(89,1,1000,'Test120-90-10-Skip','test_demo.jpg',120.0000,0,'2004-01-05 00:41:40','2004-01-06 09:57:42',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,108.0000,31,1,0,0,0,0,0,NULL,0,0,0,'',0),(90,1,999,'Test120-90-10','test_demo.jpg',120.0000,0,'2004-01-05 23:55:18','2004-01-06 00:08:58',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,0,0,0,90.0000,45,1,0,0,0,0,0,NULL,0,0,0,'',0),(92,1,1000,'Test120-90off-10','test_demo.jpg',120.0000,0,'2004-01-05 23:58:54','2004-01-06 00:09:28',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,120.0000,45,1,0,0,0,0,0,NULL,0,0,0,'',0),(93,1,1000,'Test120-New100','test_demo.jpg',120.0000,0,'2004-01-06 00:02:32','2004-01-06 00:04:25',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,100.0000,46,1,0,0,0,0,0,NULL,0,0,0,'',0),(94,1,1000,'Test120-25-New100','test_demo.jpg',120.0000,0,'2004-01-06 00:04:31','2004-01-06 00:07:08',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,100.0000,46,1,0,0,0,0,0,NULL,0,0,0,'',0),(95,1,1000,'Test120-25-New100-Skip','test_demo.jpg',120.0000,0,'2004-01-07 02:35:44','2004-01-07 02:37:27',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,90.0000,51,1,0,0,0,0,0,NULL,0,0,0,'',0),(96,1,1000,'Test120-New100-Off-Skip','test_demo.jpg',120.0000,0,'2004-01-07 02:36:52','2004-01-07 02:37:29',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,100.0000,51,1,0,0,0,0,0,NULL,0,0,0,'',0),(97,1,1000,'Test120-90-10-Price','test_demo.jpg',120.0000,0,'2004-01-07 11:26:34','2004-01-07 11:27:24',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,108.0000,32,1,0,0,0,0,0,NULL,0,0,0,'',0),(98,1,1000,'Test120-90off-10-Price','test_demo.jpg',120.0000,0,'2004-01-07 11:28:16','2004-01-07 11:29:57',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,108.0000,32,1,0,0,0,0,0,NULL,0,0,0,'',0),(99,1,997,'FreeShipping','small_00.jpg',25.0000,0,'2004-01-07 13:27:30','2004-01-21 01:48:48',NULL,5,1,1,0,3,1,1,0,0,0,1,1,1,0,0,0,0,25.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(100,1,700,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',0.0000,0,'2004-01-08 14:06:13','2004-01-08 14:06:50',NULL,45,1,1,9,0,1,1,1,0,0,0,0,1,0,0,0,0,374.2500,25,1,0,0,0,0,0,NULL,0,0,0,'',0),(101,1,1000,'Test120-90off-10','test_demo.jpg',0.0000,0,'2004-01-08 14:11:32','2004-01-08 14:17:09',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,80.0000,47,1,0,0,0,0,0,NULL,0,0,0,'',0),(104,1,1000,'HIDEQTY','1_small.jpg',75.0000,0,'2004-01-11 03:02:51','2004-01-22 11:21:36',NULL,1,1,1,0,0,1,1,0,0,0,1,0,0,0,0,0,0,75.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(105,1,999,'MAXSAMPLE-1','waybkgnd.gif',50.0000,0,'2004-01-11 14:10:59','2004-01-11 14:36:00',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,1,0,0,0,50.0000,22,1,0,0,0,0,0,NULL,0,0,0,'',0),(106,1,1000,'MAXSAMPLE-3','waybkgnd.gif',50.0000,0,'2004-01-11 14:36:08','2004-01-11 15:32:56',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,3,0,0,0,50.0000,22,1,0,0,0,0,0,NULL,0,0,0,'',0),(107,1,995,'FreeShippingNoWeight','small_00.jpg',25.0000,0,'2004-01-21 01:41:22','2004-01-21 02:01:54',NULL,0,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,25.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(108,1,0,'SoldOut','small_00.jpg',25.0000,0,'2004-01-21 01:53:20',NULL,NULL,3,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,25.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(109,1,1000,'HIDEQTYBOX','1_small.jpg',75.0000,0,'2004-01-21 22:01:20','2004-01-22 11:21:12',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,1,0,0,0,75.0000,23,1,0,0,0,0,0,NULL,0,0,0,'',0),(110,1,1000,'Test120-5SKIP','test_demo.jpg',120.0000,0,'2004-01-24 16:09:52','2004-01-24 16:15:25',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,115.0000,52,1,0,0,0,0,0,NULL,0,0,0,'',0),(111,1,1000,'Test120-90-5SKIP','test_demo.jpg',120.0000,0,'2004-01-24 16:10:12','2004-01-24 16:15:27',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,90.0000,52,1,0,0,0,0,0,NULL,0,0,0,'',0),(112,1,998,'Test2','',25.0000,0,'2004-04-26 02:24:57','2004-04-26 02:25:44',NULL,1,1,1,0,2,1,1,0,0,0,1,0,1,0,2,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(113,1,994,'Test4','',25.0000,0,'2004-04-26 02:25:03','2004-04-26 02:25:35',NULL,1,1,1,0,6,1,1,0,0,0,1,0,1,0,4,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(114,1,998,'Test5','',25.0000,0,'2004-04-26 02:25:53','2004-04-26 02:26:15',NULL,1,1,1,0,2,1,1,0,0,0,1,0,1,0,5,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(115,1,999,'Test1','',25.0000,0,'2004-04-26 02:26:23','2004-05-06 21:50:19',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,1,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(116,1,997,'Test8','',25.0000,0,'2004-04-26 02:26:54','2004-04-26 02:27:18',NULL,1,1,1,0,3,1,1,0,0,0,1,0,1,0,8,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(117,1,995,'Test3','',25.0000,0,'2004-04-26 02:27:24','2004-10-03 12:20:14',NULL,1,1,1,0,5,1,1,0,0,0,1,0,1,0,3,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(118,1,999,'Test10','',25.0000,0,'2004-04-26 02:27:52','2004-04-26 02:28:14',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,10,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(119,1,1000,'Test6','',25.0000,0,'2004-04-26 02:28:22','2004-10-06 18:26:25',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,6,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(120,1,1000,'Test7','',25.0000,0,'2004-04-26 02:29:03','2004-04-26 02:29:23',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,7,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(121,1,999,'Test12','',25.0000,0,'2004-04-26 02:29:36','2004-04-28 13:02:47',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,12,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(122,1,998,'Test9','',25.0000,0,'2004-04-26 02:30:12','2004-04-26 02:30:32',NULL,1,1,1,0,2,1,1,0,0,0,1,0,1,0,9,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(123,1,999,'Test11','',25.0000,0,'2004-04-26 02:30:41','2004-04-26 02:31:04',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,11,0,0,25.0000,53,1,0,0,0,0,0,NULL,0,0,0,'',0),(127,1,1000,'Normal','small_00.jpg',15.0000,0,'2004-04-28 01:51:35','2004-04-28 14:23:29',NULL,2,1,1,0,0,1,1,0,0,0,1,0,1,0,0,1,0,15.0000,55,1,0,0,0,0,0,NULL,0,0,0,'',0),(130,1,1000,'Special','2_small.jpg',15.0000,0,'2004-04-28 02:19:53','2004-10-06 00:05:34',NULL,2,1,1,0,0,1,1,0,0,0,1,0,1,0,0,1,1,10.0000,55,1,0,0,0,0,0,NULL,0,0,0,'',0),(131,1,1000,'PERWORDREQ','',0.0000,0,'2004-05-01 01:31:28','2004-05-07 21:30:23',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,5.0000,57,1,0,0,0,0,0,NULL,0,0,0,'',0),(132,1,997,'GolfClub','9_small.jpg',0.0000,0,'2004-05-02 12:36:12','2004-05-02 18:04:36',NULL,1,1,1,0,3,1,1,1,0,0,1,0,1,0,0,0,0,14.4500,58,1,0,0,0,0,0,NULL,0,0,0,'',0),(133,1,1000,'DOWNLOAD2','2_small.jpg',49.9900,0,'2004-05-02 23:51:33','2004-05-03 00:06:58',NULL,0,1,1,0,2,1,1,0,0,0,1,0,1,0,0,0,0,49.9900,60,1,0,0,0,0,0,NULL,0,0,0,'',0),(134,1,1000,'PERLETTERREQ','',0.0000,0,'2004-05-07 21:23:58','2004-05-07 21:29:50',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,5.0000,57,1,0,0,0,0,0,NULL,0,0,0,'',0),(154,1,10000,'ROPE','9_small.jpg',1.0000,0,'2004-05-16 21:08:08','2004-07-12 17:18:46',NULL,0,1,1,0,0,10,1,0,0,0,1,0,1,0,0,0,0,1.0000,58,0,0,0,0,0,0,NULL,0,0,0,'',0),(155,1,1000,'PRICEFACTOR','sample_image.gif',10.0000,0,'2004-05-17 23:03:10','2004-07-12 17:21:04',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,10.0000,56,1,0,0,0,0,0,NULL,0,0,0,'',0),(156,1,1000,'PRICEFACTOROFF','sample_image.gif',10.0000,0,'2004-05-17 23:05:24','2004-05-17 23:10:12',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,10.0000,56,1,0,0,0,0,0,NULL,0,0,0,'',0),(157,1,1000,'PRICEFACTOROFFATTR','sample_image.gif',10.0000,0,'2004-05-17 23:10:18','2004-05-17 23:13:48',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,10.0000,56,1,0,0,0,0,0,NULL,0,0,0,'',0),(158,1,1000,'ONETIME','b_b_grid.gif',45.0000,0,'2004-05-17 23:22:08',NULL,NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,45.0000,56,1,0,0,0,0,0,NULL,0,0,0,'',0),(159,1,10000,'ATTQTYPRICE','b_c_grid.gif',25.0000,0,'2004-05-17 23:29:31','2004-05-17 23:49:56',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,25.0000,56,1,0,0,0,0,0,NULL,0,0,0,'',0),(160,1,997,'GolfClub','9_small.jpg',0.0000,0,'2004-05-18 10:14:35','2004-05-18 10:15:16',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,14.4500,61,1,0,0,0,0,0,NULL,0,0,0,'',0),(165,1,10000,'ROPE','9_small.jpg',1.0000,0,'2004-05-18 10:42:50','2004-07-12 17:18:12',NULL,0,1,1,0,0,10,1,0,0,0,1,0,1,0,0,0,0,1.0000,61,0,0,0,0,0,0,NULL,0,0,0,'',0),(166,2,10000,'RTBHUNTER','sooty.jpg',4.9900,0,'2004-05-18 10:42:50','2004-05-18 10:43:00',NULL,3,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,3.0000,62,1,0,0,0,0,0,NULL,0,0,0,'',0),(167,3,0,'','',0.0000,0,'2004-05-18 10:42:50','2004-10-06 00:39:10',NULL,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0.0000,63,1,0,0,0,0,0,NULL,0,0,0,'',0),(168,1,1000,'PGT','samples/1_small.jpg',3.9500,0,'2004-07-12 15:25:32','2004-07-12 16:26:08',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,10,0,0,3.9500,64,1,0,0,0,0,0,NULL,0,0,0,'',0),(169,2,1000,'PMT','samples/2_small.jpg',3.9500,0,'2004-07-12 15:27:50','2004-07-12 16:29:01',NULL,1,1,1,NULL,0,1,1,0,0,0,1,0,1,0,20,0,0,3.9500,64,1,0,0,0,0,0,NULL,0,0,0,'',0),(170,3,0,'','samples/3_small.jpg',0.0000,0,'2004-07-12 15:29:23','2004-09-27 23:11:25',NULL,0,1,0,0,0,1,1,0,0,0,0,0,0,0,30,0,0,0.0000,64,1,0,0,0,0,0,NULL,0,0,0,'',0),(171,4,1000,'DPT','samples/4_small.jpg',0.9346,0,'2004-07-12 15:32:40','2004-07-12 17:46:49',NULL,0,1,1,0,0,1,1,0,0,0,1,0,1,0,40,0,0,3.9500,64,1,0,0,0,0,0,NULL,0,0,0,'',0),(172,5,1000,'PFS','samples/5_small.jpg',3.9500,0,'2004-07-12 15:39:18','2004-07-12 23:08:43',NULL,5,1,0,0,0,1,1,0,0,0,1,1,1,0,50,0,0,3.9500,64,1,0,0,0,0,0,NULL,0,0,0,'',0),(173,1,1000,'Book','b_g_grid.gif',0.0000,0,'2004-09-24 23:54:34','2004-09-26 02:50:59',NULL,0,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,52.5000,61,1,0,0,0,0,0,NULL,0,0,0,'',0),(174,1,999,'TESTCALL','call_for_price.jpg',0.0000,0,'2004-09-27 13:25:44','2004-09-27 13:28:54',NULL,1,1,1,0,0,1,1,0,0,1,1,0,1,0,0,0,0,0.0000,24,0,0,0,0,0,0,NULL,0,0,0,'',0),(175,1,1000,'Normal','1_small.jpg',60.0000,0,'2004-09-27 23:32:52','2004-10-05 17:13:20',NULL,2,1,1,0,0,1,1,0,0,0,0,0,1,0,0,1,0,60.0000,55,1,0,0,0,0,0,NULL,0,0,0,'',0),(176,1,1000,'Normal','small_00.jpg',100.0000,0,'2004-10-05 16:45:25','2004-10-05 16:47:22',NULL,2,1,1,0,0,1,1,0,0,0,1,0,1,0,0,1,0,100.0000,55,1,0,0,0,0,0,NULL,0,0,0,'',0),(177,1,1000,'Special','2_small.jpg',100.0000,0,'2004-10-05 16:47:45','2004-10-06 00:05:48',NULL,2,1,1,0,0,1,1,0,0,0,1,0,1,0,0,1,1,75.0000,55,1,0,0,0,0,0,NULL,0,0,0,'',0),(178,1,1000,'Normal','1_small.jpg',60.0000,0,'2004-10-05 16:54:52','2004-10-05 17:15:02',NULL,2,1,1,0,0,1,1,0,0,0,0,0,1,0,0,1,0,50.0000,55,1,0,0,0,0,0,NULL,0,0,0,'',0),(179,1,1000,'DOWNLOAD1','1_small.jpg',39.0000,0,'2004-10-06 00:08:33','2004-10-06 00:18:51',NULL,0,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,39.0000,60,1,0,0,0,0,0,NULL,0,0,0,'',0),(180,1,10,'902652-TIE0016-SZZW','s/201305/13682928180.jpg',0.7900,0,'2013-05-12 01:20:19',NULL,NULL,0.044,1,0,0,0,1,1,0,0,0,1,0,1,0,0,0,0,0.7900,1,1,0,0,0,0,0,'902652-TIE0016-SZZW',15,18,1,'',1);
/*!40000 ALTER TABLE `cnproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproducts_attributes`
--

DROP TABLE IF EXISTS `cnproducts_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproducts_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `options_id` int(11) NOT NULL DEFAULT '0',
  `options_values_id` int(11) NOT NULL DEFAULT '0',
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_display_only` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_default` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_image` varchar(64) DEFAULT NULL,
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `attributes_required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_id_options_id_values_zen` (`products_id`,`options_id`,`options_values_id`),
  KEY `idx_opt_sort_order_zen` (`products_options_sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproducts_attributes`
--

LOCK TABLES `cnproducts_attributes` WRITE;
/*!40000 ALTER TABLE `cnproducts_attributes` DISABLE KEYS */;
INSERT INTO `cnproducts_attributes` (`products_attributes_id`, `products_id`, `options_id`, `options_values_id`, `options_values_price`, `price_prefix`, `products_options_sort_order`, `product_attribute_is_free`, `products_attributes_weight`, `products_attributes_weight_prefix`, `attributes_display_only`, `attributes_default`, `attributes_discounted`, `attributes_image`, `attributes_price_base_included`, `attributes_price_onetime`, `attributes_price_factor`, `attributes_price_factor_offset`, `attributes_price_factor_onetime`, `attributes_price_factor_onetime_offset`, `attributes_qty_prices`, `attributes_qty_prices_onetime`, `attributes_price_words`, `attributes_price_words_free`, `attributes_price_letters`, `attributes_price_letters_free`, `attributes_required`) VALUES (1,1,4,1,0.0000,'',10,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(2,1,4,2,50.0000,'+',20,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(3,1,4,3,70.0000,'+',30,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(4,1,3,5,0.0000,'+',10,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(5,1,3,6,100.0000,'+',20,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(6,2,4,3,10.0000,'-',30,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(7,2,4,4,0.0000,'+',40,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(8,2,3,6,0.0000,'+',20,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(9,2,3,7,120.0000,'+',30,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(10,26,3,8,0.0000,'+',20,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(11,26,3,9,6.0000,'+',10,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(26,22,5,10,0.0000,'+',10,0,7,'-',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(27,22,5,13,0.0000,'+',1000,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(38,34,1,15,0.4000,'+',50,0,0,'',0,0,1,'attributes/a_bugs_life_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(39,34,1,16,0.1000,'+',10,0,0.1,'',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(40,34,1,17,0.3000,'+',30,0,0.1,'',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(41,34,2,21,0.0000,'+',20,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(42,34,2,19,0.0000,'+',10,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(43,34,2,20,0.0000,'+',40,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(44,34,2,18,0.0000,'+',30,0,0,'+',0,1,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(45,34,6,14,36.9900,'+',30,0,9,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(46,34,6,22,1.0000,'+',20,0,2,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(47,34,6,23,0.0000,'+',10,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(48,34,5,24,1.0000,'+',10,0,2,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(52,34,10,0,0.5000,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(53,34,9,0,0.7500,'+',0,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(54,34,11,0,1.0000,'+',0,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(55,34,8,0,0.2500,'+',0,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(56,34,7,0,0.2500,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(63,34,13,34,1.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(64,34,13,36,2.0000,'+',20,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(65,34,13,35,5.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(85,34,1,25,0.2000,'+',20,0,0.1,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(86,34,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(87,34,1,27,0.0000,'+',60,0,0.1,'+',0,0,1,'attributes/a_bugs_life_purple.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(88,34,1,28,0.0000,'+',70,0,0,'+',0,0,1,'attributes/a_bugs_life_brown.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(89,34,1,30,0.0000,'+',90,0,0,'+',0,0,1,'attributes/a_bugs_life_white.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(90,34,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/a_bugs_life_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(101,36,4,3,100.0000,'+',30,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(102,36,4,2,75.0000,'+',20,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(103,36,4,1,50.0000,'+',10,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(104,36,1,29,519.0000,'',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(105,36,1,30,499.0000,'',90,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(106,36,1,15,539.0000,'',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(119,43,1,16,5.0000,'+',10,1,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(120,43,1,17,6.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(121,43,1,29,7.0000,'+',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(122,43,2,21,0.0000,'+',20,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(123,43,2,18,1.0000,'+',30,1,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(124,43,2,20,2.0000,'+',40,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(125,44,1,16,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(126,44,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(127,44,1,29,0.0000,'+',80,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(128,44,2,21,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(129,44,2,18,1.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(130,44,2,20,2.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(137,46,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(138,46,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(139,46,1,29,0.0000,'+',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(140,46,2,21,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(141,46,2,18,1.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(142,46,2,20,2.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(143,44,2,37,0.0000,'+',5,0,0,'+',1,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(144,46,2,37,0.0000,'+',5,1,0,'+',1,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(160,47,14,38,5.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(161,47,14,39,10.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(162,47,14,41,15.0000,'+',15,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(163,47,14,43,100.0000,'+',100,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(164,47,14,40,25.0000,'+',25,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(165,47,14,42,50.0000,'+',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(306,48,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(307,48,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(308,48,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(309,48,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(310,48,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(311,48,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(390,50,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(391,50,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(392,50,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(393,50,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(394,50,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(395,50,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(396,53,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(397,53,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(398,53,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(399,53,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(400,53,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(401,53,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(402,49,1,31,0.0000,'+',100,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(403,49,1,15,0.0000,'+',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(404,49,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(405,49,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(406,49,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(407,49,1,26,0.0000,'+',40,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(410,54,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(411,54,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(412,54,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(413,54,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(414,54,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(415,54,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(417,46,13,34,0.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(418,46,13,35,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(419,46,13,36,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(420,46,13,44,0.0000,'+',5,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(421,43,1,45,0.0000,'+',5,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(422,36,4,46,0.0000,'+',5,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(425,55,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(426,55,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(427,55,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(428,55,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(429,55,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(430,55,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(431,56,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(432,56,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(433,56,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(434,56,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(435,56,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(436,56,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(444,59,4,3,100.0000,'+',30,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(445,59,4,2,75.0000,'+',20,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(446,59,4,1,50.0000,'+',10,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(447,59,1,29,519.0000,'',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(448,59,1,30,499.0000,'',90,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(449,59,1,15,539.0000,'',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(450,59,4,46,0.0000,'+',5,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(451,60,4,3,100.0000,'+',30,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(452,60,4,2,75.0000,'+',20,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(453,60,4,1,50.0000,'+',10,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(454,60,1,29,10.0000,'+',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(455,60,1,30,0.0000,'',90,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(456,60,1,15,20.0000,'+',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(457,60,4,46,0.0000,'+',5,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(458,61,4,3,100.0000,'+',30,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(459,61,4,2,75.0000,'+',20,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(460,61,4,1,50.0000,'+',10,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(461,61,1,29,10.0000,'+',80,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(462,61,1,30,0.0000,'',90,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(463,61,1,15,20.0000,'+',50,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(464,61,4,46,0.0000,'+',5,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(482,74,4,3,100.0000,'+',30,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(483,74,4,2,75.0000,'+',20,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(484,74,4,1,50.0000,'+',10,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(485,74,1,29,519.0000,'',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(486,74,1,30,499.0000,'',90,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(487,74,1,15,539.0000,'',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(488,74,4,46,0.0000,'+',5,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(496,46,10,0,0.7500,'+',0,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(497,46,9,0,0.5000,'+',0,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(498,46,11,0,0.2500,'+',0,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(499,76,1,16,100.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(500,76,1,25,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(501,76,1,17,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(502,76,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(503,76,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(504,76,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(505,76,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(506,76,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(507,76,13,36,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(508,78,1,16,100.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(509,78,1,25,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(510,78,1,17,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(511,78,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(512,78,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(513,78,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(514,78,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(515,78,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(516,78,13,36,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(517,79,1,16,100.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(518,79,1,25,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(519,79,1,17,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(520,79,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(521,79,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(522,79,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(523,79,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(524,79,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(525,79,13,36,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(526,80,1,16,100.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(527,80,1,25,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(528,80,1,17,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(529,80,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(530,80,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(531,80,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(532,80,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(533,80,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(534,80,13,36,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(562,84,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(563,84,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(564,84,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(565,84,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(566,84,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(567,84,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(568,84,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(569,84,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(570,84,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(571,85,1,16,100.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(572,85,1,25,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(573,85,1,17,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(574,85,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(575,85,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(576,85,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(577,85,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(578,85,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(579,85,13,36,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(661,84,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(662,84,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(663,84,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(668,84,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(669,84,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(671,84,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(672,84,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(673,82,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(674,82,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(675,82,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(676,82,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(677,82,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(678,82,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(679,82,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(680,82,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(681,82,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(682,82,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(683,82,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(684,82,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(685,82,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(686,82,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(687,82,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(688,82,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(689,83,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(690,83,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(691,83,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(692,83,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(693,83,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(694,83,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(695,83,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(696,83,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(697,83,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(698,83,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(699,83,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(700,83,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(701,83,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(702,83,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(703,83,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(704,83,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(705,93,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(706,93,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(707,93,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(708,93,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(709,93,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(710,93,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(711,93,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(712,93,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(713,93,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(714,93,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(715,93,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(716,93,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(717,93,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(718,93,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(719,93,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(720,93,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(721,94,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(722,94,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(723,94,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(724,94,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(725,94,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(726,94,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(727,94,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(728,94,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(729,94,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(730,94,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(731,94,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(732,94,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(733,94,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(734,94,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(735,94,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(736,94,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(801,90,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(802,90,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(803,90,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(804,90,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(805,90,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(806,90,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(807,90,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(808,90,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(809,90,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(810,90,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(811,90,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(812,90,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(813,90,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(814,90,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(815,90,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(816,90,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(817,92,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(818,92,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(819,92,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(820,92,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(821,92,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(822,92,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(823,92,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(824,92,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(825,92,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(826,92,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(827,92,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(828,92,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(829,92,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(830,92,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(831,92,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(832,92,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(865,88,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(866,88,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(867,88,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(868,88,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(869,88,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(870,88,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(871,88,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(872,88,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(873,88,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(874,88,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(875,88,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(876,88,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(877,88,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(878,88,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(879,88,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(880,88,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(881,89,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(882,89,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(883,89,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(884,89,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(885,89,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(886,89,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(887,89,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(888,89,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(889,89,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(890,89,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(891,89,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(892,89,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(893,89,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(894,89,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(895,89,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(896,89,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(897,95,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(898,95,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(899,95,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(900,95,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(901,95,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(902,95,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(903,95,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(904,95,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(905,95,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(906,95,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(907,95,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(908,95,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(909,95,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(910,95,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(911,95,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(912,95,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(913,96,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(914,96,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(915,96,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(916,96,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(917,96,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(918,96,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(919,96,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(920,96,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(921,96,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(922,96,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(923,96,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(924,96,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(925,96,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(926,96,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(927,96,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(928,96,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(929,97,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(930,97,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(931,97,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(932,97,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(933,97,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(934,97,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(935,97,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(936,97,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(937,97,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(938,97,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(939,97,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(940,97,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(941,97,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(942,97,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(943,97,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(944,97,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(945,98,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(946,98,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(947,98,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(948,98,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(949,98,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(950,98,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(951,98,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(952,98,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(953,98,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(954,98,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(955,98,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(956,98,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(957,98,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(958,98,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(959,98,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(960,98,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(962,100,4,3,100.0000,'+',30,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(963,100,4,2,75.0000,'+',20,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(964,100,4,1,50.0000,'+',10,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(965,100,1,29,519.0000,'',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(966,100,1,30,499.0000,'',90,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(967,100,1,15,539.0000,'',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(968,100,4,46,0.0000,'+',5,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(969,101,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(970,101,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(971,101,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(972,101,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(973,101,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(974,101,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(975,101,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(976,101,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(977,101,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(978,101,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(979,101,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(980,101,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(981,101,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(982,101,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(983,101,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(984,101,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(987,109,5,10,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(988,109,5,52,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(990,110,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(991,110,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(992,110,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(993,110,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(994,110,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(995,110,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(996,110,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(997,110,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(998,110,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(999,110,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1000,110,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1001,110,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1002,110,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1003,110,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1004,110,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1005,110,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1006,111,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1007,111,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1008,111,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1009,111,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1010,111,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1011,111,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1012,111,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1013,111,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1014,111,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1015,111,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1016,111,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1017,111,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1018,111,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1019,111,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1020,111,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1021,111,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1025,131,10,0,0.0000,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0500,0,0.0000,0,1),(1027,131,1,16,5.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1028,131,1,26,5.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1029,131,1,17,5.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1030,131,9,0,0.0000,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0500,3,0.0000,0,1),(1031,132,16,53,14.4500,'+',30,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1032,132,16,54,14.4500,'+',40,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1033,132,16,55,14.4500,'+',50,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1034,132,16,56,14.4500,'+',60,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1035,132,16,57,14.4500,'+',90,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1036,132,16,58,14.4500,'+',200,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1037,132,16,61,14.4500,'+',20,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1038,132,16,59,14.4500,'+',70,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1039,132,16,60,14.4500,'+',80,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1040,133,5,10,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1041,133,17,62,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1042,133,17,63,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1043,133,5,64,0.0000,'+',100,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1044,133,5,52,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1045,134,10,0,0.0000,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0200,0,1),(1046,134,1,16,5.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1047,134,1,26,5.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1048,134,1,17,5.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1049,134,9,0,0.0000,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0200,3,1),(1050,154,18,65,0.0000,'+',10,0,0.25,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1051,154,18,66,1.5000,'+',20,0,0.75,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1052,155,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,1.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1053,155,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,2.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1054,155,1,26,0.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,3.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1055,156,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,1.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1056,156,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,2.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1057,156,1,26,0.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,3.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1058,157,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,1.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1059,157,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,2.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1060,157,1,26,0.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,3.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1061,158,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,5.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1062,158,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,10.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1063,158,1,26,0.0000,'+',40,0,0,'+',0,0,1,'',1,15.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1064,159,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'1:11,3:10.00,6:9.00,9:8.00,12:7.00,15:6.00','',0.0000,0,0.0000,0,0),(1065,159,1,26,0.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'3:11.00,6:10.00,9:9.00,12:8.00,15:7.00','',0.0000,0,0.0000,0,0),(1066,159,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'3:10.50,6:9.50,9:8.50,12:7.50,15:6.50','',0.0000,0,0.0000,0,0),(1069,160,16,53,14.4500,'+',30,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1070,160,16,54,14.4500,'+',40,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1071,160,16,55,14.4500,'+',50,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1072,160,16,56,14.4500,'+',60,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1073,160,16,57,14.4500,'+',90,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1074,160,16,58,14.4500,'+',200,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1075,160,16,61,14.4500,'+',20,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1076,160,16,59,14.4500,'+',70,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1077,160,16,60,14.4500,'+',80,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1088,171,17,63,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1089,171,17,62,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1090,165,18,65,0.0000,'+',10,0,0.25,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1091,165,18,66,1.5000,'+',20,0,0.75,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1092,172,19,67,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1093,173,5,10,20.0000,'',10,0,0,'+',0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1094,173,5,64,20.0000,'',100,0,0,'+',0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1095,173,5,68,52.5000,'',5,0,1,'',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1096,175,1,16,100.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1097,175,1,26,100.0000,'+',40,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1098,178,1,16,100.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1099,178,1,26,100.0000,'+',40,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1100,179,17,63,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1103,179,17,62,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0);
/*!40000 ALTER TABLE `cnproducts_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproducts_attributes_download`
--

DROP TABLE IF EXISTS `cnproducts_attributes_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproducts_attributes_download` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproducts_attributes_download`
--

LOCK TABLES `cnproducts_attributes_download` WRITE;
/*!40000 ALTER TABLE `cnproducts_attributes_download` DISABLE KEYS */;
INSERT INTO `cnproducts_attributes_download` (`products_attributes_id`, `products_attributes_filename`, `products_attributes_maxdays`, `products_attributes_maxcount`) VALUES (26,'unreal.zip',7,3),(1040,'test.zip',7,5),(1041,'test2.zip',7,5),(1042,'test2.zip',7,5),(1043,'test.zip',7,5),(1044,'test.zip',7,5),(1088,'ms_word_sample.zip',7,5),(1089,'pdf_sample.zip',7,5),(1093,'test.zip',7,5),(1094,'test2.zip',7,5),(1100,'ms_word_sample.zip',7,5),(1103,'pdf_sample.zip',7,5);
/*!40000 ALTER TABLE `cnproducts_attributes_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproducts_description`
--

DROP TABLE IF EXISTS `cnproducts_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproducts_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `idx_products_name_zen` (`products_name`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproducts_description`
--

LOCK TABLES `cnproducts_description` WRITE;
/*!40000 ALTER TABLE `cnproducts_description` DISABLE KEYS */;
INSERT INTO `cnproducts_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES (1,1,'Matrox G200 MMS','Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br /><br />With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br /><br />Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.','www.matrox.com/mga/products/g200_mms/home.cfm',0),(1,2,'Matrox G200 MMS','Matrox 的芯片技术在新的 Tech Source GFX 200 系列发挥功能，采用首创以一张 PCI 图形卡支持基于Sun Microsystems Solaris平台，支持多达四个 DVI 数字液晶显示屏。GFX 200 系列，有 16 MB（支持两个显示屏）或 32 MB（支持四个显示屏）SGRAM 可选择。以 Matrox G200 多屏幕显示系列的技术为基础，此技术也广受金融界认可，并支持金融界权威公司如 Barclays、富达投资和路透社等。','www.matrox.com/mga/products/g200_mms/home.cfm',0),(2,1,'Matrox G400 32MB','Dramatically Different High Performance Graphics<br /><br />Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br /><br />Key features:<ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>','www.matrox.com/mga/products/mill_g400/home.htm',0),(2,2,'Matrox G400 32MB','G400显卡绝对是显卡历史上永恒的经典产品，其优良的2D画质在如今都是出类拔萃的！也正因为如此，它也成为许多2D作图用户的首选显卡。在很多二手产品论坛上，G400都是炙手可热的东西。G400采用SGRAM显存，容量为16M或32M，AGP-4X接口，对2D画质要求很高或对Matrox显卡情有独衷的朋友可以关注一下。','www.matrox.com/mga/products/mill_g400/home.htm',0),(3,1,'Microsoft IntelliMouse Pro','Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.','www.microsoft.com/hardware/mouse/intellimouse.asp',0),(3,2,'人体工程学鼠标','人体工程学鼠标又分标准外壳和半透明外壳两种，这些鼠标功能相同，不过手感不同，人体工程学鼠标比较顺手。不加载专用的驱动程序也可以使用滚轮功能。专用的驱动程序可以通过网络获得目前的最新版本。','www.microsoft.com/hardware/mouse/intellimouse.asp',0),(4,1,'The Replacement Killers','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 80 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.replacement-killers.com',0),(4,2,'替身杀手','地区代码: 2 (日本, 欧洲, 中东, 南非).<br />语言: 英语, 德语.<br />子标题: 英语, 德语, 西班牙语.<br />音频: 杜比环绕 5.1<br />图像格式: 16:9 宽屏<br />长度: (约) 80 分钟.<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).','www.replacement-killers.com',0),(5,1,'Blade Runner - Director\'s Cut Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 112 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.bladerunner.com',0),(5,2,'银翼杀手 - 导演剪辑版 链接','地区代码: 2 (日本, 欧洲, 中东, 南非).<br />语言: 英语, 德语.<br />子标题: 英语, 德语, 西班牙语.<br />音频: 杜比环绕 5.1。<br />图像格式: 16:9 宽屏<br />长度: (约) 112 分钟.<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).','www.bladerunner.com',0),(6,1,'The Matrix Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch.\r\n<br />\r\nAudio: Dolby Surround.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 131 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Making Of.','www.thematrix.com',0),(6,2,'黑客帝国 链接','地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语.\r\n<br />\r\n音频: 杜比环绕\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 131 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕','www.thematrix.com',0),(7,1,'You\'ve Got Mail Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch, Spanish. <br />Subtitles: English, Deutsch, Spanish, French, Nordic, Polish. <br />Audio: Dolby Digital 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 115 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.youvegotmail.com',0),(7,2,'电子情书 链接','地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语, 西班牙语. <br />子标题: 英语, 德语, 西班牙语, 法语, 北欧, 波兰. <br />音频: 杜比环绕 5.1。<br />图像格式: 16:9 宽屏 <br />长度: (约) 115 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).','www.youvegotmail.com',0),(8,1,'A Bug\'s Life Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Digital 5.1 / Dolby Surround Stereo. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 91 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.abugslife.com',0),(8,2,'虫虫危机 链接','地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语. <br />子标题: 英语, 德语, 西班牙语. <br />音频: 杜比数码 5.1 / 杜比环绕立体声。<br />图像格式: 16:9 宽屏 <br />长度: (约) 91 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).','www.abugslife.com',0),(9,1,'Under Siege Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Surround 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 98 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(9,2,'潜龙轰天 链接','地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语. <br />子标题: 英语, 德语, 西班牙语. <br />音频: 杜比环绕 5.1. <br />图像格式: 16:9 宽屏 <br />长度: (约) 98 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(10,1,'Under Siege 2 - Dark Territory','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 98 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(10,2,'潜龙轰天2 - 暴走潜龙','地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />语言: 英语, 德语.\r\n<br />子标题: 英语, 德语, 西班牙语.\r\n<br />音频: 杜比环绕 5.1。\r\n<br />图像格式: 16:9 宽屏\r\n<br />长度: (约) 98 分钟.\r\n<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(11,1,'Fire Down Below Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 100 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(11,2,'枪口朝下 链接','地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 100 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(12,1,'Die Hard With A Vengeance Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Surround 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 122 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(12,2,'虎胆龙威 链接','地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语. <br />子标题: 英语, 德语, 西班牙语. <br />音频: 杜比环绕 5.1。 <br />图像格式: 16:9 宽屏 <br />长度: (约) 122 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(13,1,'Lethal Weapon Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 100 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(13,2,'致命武器 链接','地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 100 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(14,1,'Red Corner Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 117 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(14,2,'红色角落 链接','地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 117 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(15,1,'Frantic Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 115 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(15,2,'惊狂记 链接','地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 115 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(16,1,'Courage Under Fire Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 112 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(16,2,'生死豪情 链接','地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 112 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(17,1,'Speed Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 112 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(17,2,'生死时速 链接','地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 112 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(18,1,'Speed 2: Cruise Control','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 120 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(18,2,'生死时速2: 海上惊情','地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />语言: 英语, 德语.\r\n<br />子标题: 英语, 德语, 西班牙语.\r\n<br />音频: 杜比环绕 5.1。\r\n<br />图像格式: 16:9 宽屏\r\n<br />长度: (约) 120 分钟.\r\n<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(19,1,'There\'s Something About Mary Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 114 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(19,2,'我为玛丽狂 链接','地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 114 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(20,1,'Beloved Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 164 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(20,2,'真爱 链接','地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 164 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).','',0),(21,1,'SWAT 3: Close Quarters Battle Linked','Windows 95/98<br /><br />211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and &quot;When needed&quot; to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!','www.swat3.com',0),(21,2,'洛城特警3: 精英编辑版 链接','Windows 95/98<br /><br />公元2005年，洛杉矶。洛城警局SWAT特勤小组受命保护参加签订废除核武条约的各国领袖，并瓦解恐怖份子的破坏计划。<br /><br />在这个版本中，除了原先的游戏主程序外，还包含了六个新的单人任务，以及原先缺乏的多人联机模式，再加上一堆新增功能及对象，让玩家自由设定进行任务的环境。而如果你已经厌倦了每次都扮演维持秩序的警察，这次可以来点不一样的，在精英版中，玩家除了可以担任特勤小组的警官外，还可以扮演专伺破坏的恐怖份子。','www.swat3.com',0),(22,1,'Unreal Tournament Linked','From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br /><br />This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It\'s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of \'bots\' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.','www.unrealtournament.net',0),(22,2,'虚幻竞技场 链接','《虚幻竞技场》加入了许多单人游戏要素，证明开发小组也开始重视游戏的单人部分就像游戏一直注重的联机部分一样。就像Rein与游戏的制作小组成员Jeff Morris说的那样，虽然游戏的剧情方面虽然不会像《战争机器》那样引人入胜，但是可以让玩家了解整个故事的背景。整个虚幻竞技场的故事建立于未来的Super Bowl。统治企业为了平息手下员工的不满情绪，建立了一个格斗竞技场为员工提供消遣。而玩家则扮演一位年轻小伙子，为了向杀害他全家的公司报仇而义无反顾的进入了竞技场。','www.unrealtournament.net',0),(23,1,'The Wheel Of Time Linked','The world in which The Wheel of Time takes place is lifted directly out of Jordan\'s pages; it\'s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you\'re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter\'angreal, Portal Stones, and the Ways. However you move around, though, you\'ll quickly discover that means of locomotion can easily become the least of the your worries...<br /><br />During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time\'s main characters. Some of these places are ripped directly from the pages of Jordan\'s books, made flesh with Legend\'s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you\'ll have this year.','www.wheeloftime.com',0),(23,2,'时空之轮 链接','《时空之轮》是用《Unreal》的游戏引擎制作，亦即是说该游戏是一支第一身射击游戏。至于游戏的背景，则是著名作家RobertJordan笔下的神话世界。在Jordan笔下的世界中，人类因一时大意而放走了为祸世上的魔王DarkOne，而更惨的是，用以镇压DarkOne的封印亦在动乱中失去了。在数千年后，失落的封印重新被四股敌对的势力发现，遂展开了封印的争夺战。<br /><br />游戏内的法术共计四十种，可大约分为攻击、防守、移动和恢复能源多种，较诸一般射击游戏只靠枪炮去砍杀多姿多采得多了，而且开发小组亦体会到其他游戏的法术系统做得不平衡，形成「只靠一种法术便能过版」的情况，故在设计时亦着重法术间的平衡。举个例来说，一些法术准确度虽高，但其准备时间却要长得多，所以这些法术只可对付一些HP值低的敌人，务求一击便可将之打败。但趟若敌人的HP值高，用同一种法术时便会被人在攻击空档时反击，造成损伤。','www.wheeloftime.com',0),(24,1,'Disciples: Sacred Lands Linked','A new age is dawning...<br /><br />Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br /><br />The day of reckoning has come... and only the chosen will survive.','',0),(24,2,'圣战群英传: 神圣国度 链接','游戏的概念与《英雄无敌III》非常相似。开始时玩家拥有自己的城堡和一些资源，当然还有英雄。你的任务就是派遣英雄在地图上清除异己，并且占领各种矿藏，象是水晶、黄金等等。然后用资源建立起来强大的军队与敌人作战从而获得胜利。游戏的进行方式是很传统的那种回合制，就是玩家走一步，对手走一步的那种。凡是玩过《英雄无敌III》的玩家玩起《神圣国度》应该非常容易上手，很快就可以进入角色，但在其中你又必定能够享受到许多全新的乐趣。','',0),(25,1,'Microsoft Internet Keyboard PS/2','The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!','',0),(25,2,'微软键盘','特别设计10个快捷功能键，拥有多个可自定义的热键','',0),(26,1,'Microsoft IntelliMouse Explorer','Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!','www.microsoft.com/hardware/mouse/explorer.asp',0),(26,2,'微软鼠标','人体工程学：支持 即插即用：支持 适用操作系统：与PC和Mac操作系统兼容 其它特性：Microsoft 光学感应技术','www.microsoft.com/hardware/mouse/explorer.asp',0),(27,1,'Hewlett Packard LaserJet 1100Xi Linked','HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br /><br />Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br /><br />HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(27,2,'惠普激打1100Xi 链接','惠普打印机在激打领域是典范。新的惠普激打1100Xi每分钟打印8页，分辨率600dpi，支持Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2及DOS。通过外接打印服务器支持网络打印。','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(28,1,'Gift Certificate $  5.00','Purchase a Gift Certificate today to share with your family, friends or business associates!','',0),(28,2,'礼券5元','现在就购买礼券，和您的家人、朋友或商业伙伴分享！','',0),(29,1,'Gift Certificate $ 10.00','Purchase a Gift Certificate today to share with your family, friends or business associates!','',0),(29,2,'礼券10元','现在就购买礼券，和您的家人、朋友或商业伙伴分享！','',0),(30,1,'Gift Certificate $ 25.00','Purchase a Gift Certificate today to share with your family, friends or business associates!','',0),(30,2,'礼券25元','现在就购买礼券，和您的家人、朋友或商业伙伴分享！','',0),(31,1,'Gift Certificate $ 50.00','Purchase a Gift Certificate today to share with your family, friends or business associates!','',0),(31,2,'礼券50元','现在就购买礼券，和您的家人、朋友或商业伙伴分享！','',0),(32,1,'Gift Certificate $100.00','Purchase a Gift Certificate today to share with your family, friends or business associates!','',0),(32,2,'礼券100元','现在就购买礼券，和您的家人、朋友或商业伙伴分享！','',0),(34,1,'A Bug\'s Life \"Multi Pak\" Special 2003 Collectors Edition','A Bug\'s Life \"Multi Pak\" Special 2003 Collectors Edition\r\n<br />\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Digital 5.1 / Dolby Surround Stereo.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 91 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.abugslife.com',0),(34,2,'虫虫危机 多款2003特别收藏版','虫虫危机 多款2003特别收藏版\r\n<br />\r\n地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比数码5.1 / 杜比环绕立体声.\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 91 分钟.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, 子标题 (多种语言).','www.abugslife.com',0),(36,1,'Hewlett Packard - by attributes SALE','The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are set for the discount to be applied, their prices before the discount are:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00<br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(36,2,'惠普 - 属性促销','本商品价格为0\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />\r\n\r\n颜色属性设置为允许优惠，优惠前价格为:<br />\r\n白色499.99元<br />\r\n黑色519元<br />\r\n蓝色539元<br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(39,1,'A Free Product','This is a free product that is also on special.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br /><br />\r\n\r\nWhile this is a FREE product, this does have Shipping.','',0),(39,2,'免费商品','免费商品，同时有特价。\r\n<br /><br />\r\n\r\n本商品显示原价、特价，最后是免费。\r\n<br /><br />\r\n\r\n这是免费商品，但是需要运费。','',0),(40,1,'A Call for Price Product','This is a Call for Price product that is also on special.\r\n<br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br />','',0),(40,2,'价格面议商品','价格面议商品，同时有特价。\r\n<br />\r\n\r\n本商品显示原价、特价，最后是价格面议。不能购买本商品。\r\n<br />','',0),(41,1,'A Call for Price Product SALE','This is a Call for Price product that is also on special and has a Sale price via Sale Maker.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons automatically change to Call for Price, which is defined as: TEXT_CALL_FOR_PRICE\r\n<br /><br />\r\n\r\nThis link will take the customer to the Contact Us page.\r\n<br /><br />','',0),(41,2,'价格面议 促销','价格面议商品，有特价、有促销。\r\n<br /><br />\r\n\r\n显示原价、特价及价格面议。不能购买本商品。\r\n<br /><br />\r\n\r\n购买商品按钮自动改为价格面议，定义为: TEXT_CALL_FOR_PRICE\r\n<br /><br />\r\n\r\n这个链接将转到联系我们页面。\r\n<br /><br />','',0),(42,1,'A Free Product - SALE','This is a free product that is also on special.\r\n<br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br />','',0),(42,2,'免费商品 + 促销','免费商品，同时有特价。\r\n<br />\r\n\r\n本商品设定了价格、特价，但同时又设定为免费。\r\n<br />','',0),(43,1,'A Free Product with Attributes','This is a free product that is also on special.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br /><br />\r\n\r\nAttributes can be added that can optionally be set to free or not free\r\n<br /><br />\r\n\r\nThe Color Red attribute is priced at $5.00 but marked as a Free Attribute when the Product is Free\r\n<br /><br />\r\n\r\nThe Size Medium attribute is priced at $1.00 but marked as a Free Attribute when Product is Free','',0),(43,2,'带属性的免费商品','免费商品，同时有特价。\r\n<br /><br />\r\n\r\n本商品设定了价格、特价，但同时又设定为免费。\r\n<br /><br />\r\n\r属性可以设置为免费或不免费\r\n<br /><br />\r\n\r\n红色属性定价为5元，但设置为商品免费时属性也免费\r\n<br /><br />\r\n\r\n尺寸中号定价为1元，但设置为商品免费时属性也免费','',0),(44,1,'A Mixed OFF Product with Attributes','This product has attributes and a minimum qty and units.\r\n<br /><br />\r\n\r\nMixed is OFF this means you CANNOT mix attributes to make the minimums and units.\r\n<br /><br />\r\n\r\nThe Size Option Value: Select from Below ... is a Display Only Attribute. \r\n<br /><br />\r\n\r\nThis means that the product cannot be added to the Shopping Cart if that Option Value is selected. If it is still selected, then an error is triggered when the Add to Cart is pressed with a warning to the customer on what the error is.\r\n<br /><br />\r\n\r\nNo checkout is allowed when errors exist.','',0),(44,2,'带属性的不可混合商品','本商品含属性、最少购买数量、数量单位。\r\n<br /><br />\r\n\r\n允许属性混合设置为否，也就是说不可以混合购买不同属性的商品以达到最低购买数量和数量单位的要求。\r\n<br /><br />\r\n\r\n尺寸选项: 请选择... 是仅用于显示的属性。\r\n<br /><br />\r\n\r\n必须选择其中的一个选项，否则添加到购物车时，会报错。\r\n<br /><br />\r\n\r\n如有错误就不能结帐。','',0),(46,1,'A Mixed ON Product with Attributes','This product has attributes and a minimum qty and units.\r\n<br /><br />\r\n\r\nMixed is ON this means you CAN mix attributes to make the minimums and units.\r\n<br /><br />\r\n\r\nSelect from Below is a Display Only Attribute. This means that it cannot be added to the cart. If it is, then an error is triggered.\r\n<br /><br />\r\n\r\nNo checkout is allowed when errors exist.','',0),(46,2,'带属性的可混合商品','本商品含属性、最少购买数量、数量单位。\r\n<br /><br />\r\n\r\n允许属性混合设置为是，也就是说可以混合购买不同属性的商品以达到最低购买数量和数量单位的要求。\r\n<br /><br />\r\n\r\n尺寸选项: 请选择... 是仅用于显示的属性。\r\n<br /><br />\r\n\r\n必须选择其中的一个选项，否则添加到购物车时，会报错。\r\n<br /><br />\r\n\r\n如有错误就不能结帐。','',0),(47,1,'Gift Certificates by attributes','Priced by Attributes Gift Certificates.','',0),(47,2,'按属性定价的礼券','按属性定价的礼券。','',0),(48,1,'Test 1','This is a test product for copying and deleting attributes.\r\n<br /><br />\r\nAll of the images for this product are in the main /images directory and /large directory.\r\n<br /><br />\r\nThe main products_image is called 1_small.jpg\r\n<br /><br />\r\nThere are additional images for this product that will auto load located in /images called:<br />\r\n1_small_01.jpg<br />\r\n1_small_02.jpg<br />\r\n1_small_03.jpg<br />\r\n<br />\r\nThe large additional images are in /images/large called:<br />\r\n1_small_01_LRG.jpg<br />\r\n1_small_02_LRG.jpg<br />\r\n1_small_03_LRG.jpg<br />\r\n\r\n<br /><br />\r\n\r\nThe naming conventions for the additional images do not require that they be numeric. Using the numberic system helps establish the sort order of the images and how they will display.\r\n<br /><br />\r\n\r\nWhat is important is that all the additional images be located in the same directory and start with the same name: 1_small and end in the same extenion: .jpg\r\n<br /><br />\r\n\r\nThe additional large images need to be located in the /large directory and use the same name plus the Large image suffix, defined in the Admin ... Images ... in this case _LRG\r\n<br /><br />','',0),(48,2,'测试一','复制和删除属性的测试商品。\r\n<br /><br />\r\n本商品的所有图片位于/images及/images/large 目录。\r\n<br /><br />\r\n主图片为1_small.jpg\r\n<br /><br />\r\n/images 中的附加图片也会自动显示:<br />\r\n1_small_01.jpg<br />\r\n1_small_02.jpg<br />\r\n1_small_03.jpg<br />\r\n<br />\r\n大图位于/images/large:<br />\r\n1_small_01_LRG.jpg<br />\r\n1_small_02_LRG.jpg<br />\r\n1_small_03_LRG.jpg<br />\r\n\r\n<br /><br />\r\n\r\n附加图片的命名不一定要数字，用数字只是为了能按顺序显示这些图片。\r\n<br /><br />\r\n\r\n重要的是附加图片必须位于同一个目录，并且文件名的开头相同: 1_small，而且文件后缀一致: .jpg\r\n<br /><br />\r\n\r\n附加的大图片必须位于/large目录，并采用相同的名称和大图片后缀，在管理页面－商店设置－图象参数中设置，目前设置为 _LRG\r\n<br /><br />','',0),(49,1,'Test 2','This is a test product for copying and deleting attributes.\r\n<br /><br />\r\n\r\nThis was made using the Attributes Copy to Product in the new Admin ... Catalog ... Attributes Controller ... and copying the Attributes from the Test 1 product to Test 2.\r\n<br /><br />\r\n\r\nThis product does not have any additional images.\r\n<br /><br />\r\n\r\nIt does have a Large image located in /large\r\n<br /><br />\r\n\r\nThis uses the same name: 2_small plus the large image suffix _LRG plus the matching extension .jpg to give the new name: /images/large/2_small_LRG.jpg\r\n<br /><br />','',0),(49,2,'测试二','复制和删除属性的测试商品。\r\n<br /><br />\r\n\r\n本商品属性通过管理页面 ... 商品管理 ... 属性控制 ... 从 测试一 复制商品属性到 测试二。\r\n<br /><br />\r\n\r\n本商品没有附加图片。\r\n<br /><br />\r\n\r\n没有大图片在/large中\r\n<br /><br />\r\n\r\n采用相同的命名: 2_small 、大图片后缀 _LRG 以及相同的后缀 .jpg 生成新的名字: /images/large/2_small_LRG.jpg\r\n<br /><br />','',0),(50,1,'Test 3','This is a test product for copying and deleting attributes.\r\n<br /><br />\r\n\r\nThis was made using the Attributes Copy to Product in the new Admin ... Catalog ... Attributes Controller ... and copying the attributes from the Test 2 product to Test 3.\r\n<br /><br />\r\n\r\nThis product does not have any additional images.\r\n<br /><br />\r\n\r\nIt does NOT have a Large image located in /large\r\n<br /><br />\r\n\r\nThis means that when you click on the image for enlarge, unless the original image is larger than the small image settings you will see the same image in the popup.\r\n<br /><br />','',0),(50,2,'测试三','复制和删除属性的测试商品。\r\n<br /><br />\r\n\r\n本商品属性通过管理页面 ... 商品管理 ... 属性控制 ... 从 测试二 复制商品属性到 测试三。\r\n<br /><br />\r\n\r\n本商品没有附加图片。\r\n<br /><br />\r\n\r\n没有大图片在/large中\r\n<br /><br />\r\n\r\n点击放大时，除非原图比小图片大，否则弹出窗口中的图片是一样的。\r\n<br /><br />','',0),(51,1,'Free Ship & Payment Virtual weight 10','Free Shipping and Payment\r\n<br /><br />\r\n\r\nThe Price is set to 25.00 ... but what makes it Free is that this product has been marked as:\r\n<br />\r\nProduct is Free: Yes\r\n<br /><br />\r\n\r\nThis would allow the product to be listed with a price, but the actual charge is $0.00\r\n<br /><br />\r\n\r\nThe weight is set to 10 but could be set to 0. What really makes it truely Free Shipping is that it has been marked to be Always Free Shipping.\r\n<br /><br />\r\n\r\nAlways Free shipping is set to: Yes<br />\r\nThis will not charge for shipping, but requres a shipping address.\r\n<br /><br />\r\n\r\nBecause there is no shipping and the price is 0, the Zen Cart Free Charge comes up for the payment module and the other payment modules vanish.\r\n<br /><br />\r\n\r\nYou can change the text on the Zen Cart Free Charge module to read as you would prefer.\r\n<br /><br />\r\n\r\nNote: if you add products that incur a charge or shipping charge, then the Zen Cart Free Charge payment module will vanish and the regular payment modules will show.','',0),(51,2,'全免商品 重量10','免费商品\r\n<br /><br />\r\n\r商品价格为25元 ... 免费是因为本商品设置中:\r\n<br />\r\n免费商品: 是\r\n<br /><br />\r\n\r\n这样商品有显示价格，但实际价格为0\r\n<br /><br />\r\n\r\n重量设置为10，也可以设置为0。免运费是因为设置了免运费为是\r\n<br /><br />\r\n\r\n免运费设置为: 是<br />\r\n不需要运费，但是需要送货地址。\r\n<br /><br />\r\n\r\n因为价格为0且免运费，Zen Cart将显示免费模块而不显示其它支付模块。\r\n<br /><br />\r\n\r\n可以自己修改Zen Cart免费模块的文字。\r\n<br /><br />\r\n\r\n说明: 如果添加了其它收费商品或需要运费，Zen Cart免费模块将不显示，而显示通用的支付模块。','',0),(52,1,'Free Ship & Payment Virtual','Product Price is set to 0\r\n<br /><br />\r\n\r\nPayment weight is set to 2 ...\r\n<br /><br />\r\n\r\nVirtual is ON ... this will skip shipping address\r\n<br /><br />','',0),(52,2,'全免商品 虚拟商品','商品价格为0\r\n<br /><br />\r\n\r\n重量设置为2 ...\r\n<br /><br />\r\n\r\n虚拟商品设置为是 ... 将不用输入配送地址\r\n<br /><br />','',0),(53,1,'Min and Units MIX','This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to ON','',0),(53,2,'最少数量及属性混合','本商品设置最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很\"聪明\"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为是','',0),(54,1,'Min and Units NOMIX','This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to OFF','',0),(54,2,'最少购买和数量单位 非混合','本商品设置了最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位设置为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很\"聪明\"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为否','',0),(55,1,'Min and Units MIX - Sale','This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to ON\r\n<br /><br />\r\n\r\nThis product has been placed on Sale via Sale Maker','',0),(55,2,'最少购买和数量单位 混合 - 促销','本商品设置了最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位设置为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很\"聪明\"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为是\r\n<br /><br />\r\n\r\n本商品有促销','',0),(56,1,'Min and Units NOMIX - Sale','This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to OFF\r\n<br /><br />\r\n\r\nThis product has been put on Sale via Sale Maker.','',0),(56,2,'最少购买和数量单位 非混合 - 促销','本商品设置了最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位设置为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很\"聪明\"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为否\r\n<br /><br />\r\n\r\n本商品有促销','',0),(57,1,'A Free Product - All','This is a free product where there are no prices at all.\r\n<br /><br />\r\n\r\nThe Always Free Shipping is also turned ON.\r\n<br /><br />\r\n\r\nIf this is bought separately, the Zen Cart Free Charge payment module will show if there is no charges on shipping.\r\n<br /><br />\r\n\r\nIf other products are purchased with a price or shipping charge, then the Zen Cart Free Charge payment module will not show and the shipping will be applied accordingly.','',0),(57,2,'免费商品 - 所有','免费商品，没有价格。\r\n<br /><br />\r\n\r\n免运费也打开。\r\n<br /><br />\r\n\r\n如果单独购买，Zen Cart免运费支付模块会显示是否免运费。\r\n<br /><br />\r\n\r\n如果购买了其它有价商品或有运费，那么Zen Cart不会显示免运费支付模块，需要支付相应运费。','',0),(59,1,'Hewlett Packard - by attributes','The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(59,2,'惠普 - 属性定价','本商品价格设置为0\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(60,1,'Hewlett Packard - Sale with Attributes on Sale','The Product Price is set to 499.75\r\n<br /><br />\r\n\r\nA Sale Maker Discount of 10% is applied.\r\n<br /><br />\r\n\r\nThe attribute are marked to be discounted also.\r\n<br /><br />\r\n\r\nPrior to the discount being applied:<br />\r\nBlue +$20.00<br />\r\nBlack +$10.00<br />\r\nWhite $0.00\r\n<br /><br />\r\n\r\n4 meg +$50.00<br />\r\n8 meg +$75.00<br />\r\n16 meg +$100.00\r\n<br /><br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(60,2,'惠普 - 促销包括属性','本商品价格设置为499.75元\r\n<br /><br />\r\n\r\n促销减价10%\r\n<br /><br />\r\n\r\n属性也设置为优惠。\r\n<br /><br />\r\n\r\n优惠前:<br />\r\n蓝色 +20元<br />\r\n黑色 +10元<br />\r\n白色 原价\r\n<br /><br />\r\n\r\n4M +50元<br />\r\n8M +75元<br />\r\n16M +100元\r\n<br /><br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(61,1,'Hewlett Packard - Sale with Attributes NOT on Sale','The Product Price is set to 499.75\r\n<br /><br />\r\n\r\nA Sale Maker Discount of 10% is applied.\r\n<br /><br />\r\n\r\nThe attribute are marked NOT to be discounted.\r\n<br /><br />\r\n\r\nPrior to the discount being applied:<br />\r\nBlue +$20.00<br />\r\nBlack +$10.00<br />\r\nWhite $0.00\r\n<br /><br />\r\n\r\n4 meg +$50.00<br />\r\n8 meg +$75.00<br />\r\n16 meg +$100.00\r\n<br /><br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(61,2,'惠普 - 促销不包括属性','本商品价格设置为499.75元\r\n<br /><br />\r\n\r\n促销减价10%\r\n<br /><br />\r\n\r\n属性设置为没有优惠。\r\n<br /><br />\r\n\r\n优惠前:<br />\r\n蓝色 +20元<br />\r\n黑色 +10元<br />\r\n白色 原价\r\n<br /><br />\r\n\r\n4M +50元<br />\r\n8M +75元<br />\r\n16M +100元\r\n<br /><br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(74,1,'Hewlett Packard - by attributes with Special% no SALE','The Product Price is set to 0.00 Special is set to 20%\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are, their prices before the Special discount is applied:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00\r\n<br /><br />\r\n\r\nThe Specials Price is a flat $100 discount. This $100 discount is applied to all attributes marked attributes_discounted Yes.','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(74,2,'惠普 - 属性定价 特价 无促销','本商品价格设置为0 特价设置为20%\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />\r\n\r\n颜色属性设置为允许优惠，优惠前价格为:<br />\r\n白色 499.99元<br />\r\n黑色 519元<br />\r\n蓝色 539元\r\n<br /><br />\r\n\r\n特价为100元优惠。这100元优惠应用于所有设置为优惠的属性。','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(76,1,'TEST 25% special 10% Sale','Product is $100.00\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />\r\nSale is 10%\r\n<br /><br />','',0),(76,2,'测试 25%特价 10%促销','原价100元\r\n<br /><br />\r\n特价25%\r\n<br /><br />\r\n促销10%\r\n<br /><br />','',0),(78,1,'TEST 25% special 10% Sale Attribute Priced','Priced by Attributes - Product price is set to $0.00\r\n<br /><br />\r\nAll attributes are marked to make the price.\r\n\r\n<br /><br />\r\nProduct is $0\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />\r\nSale is 10%\r\n<br /><br />','',0),(78,2,'测试 25%特价 10%促销 属性定价','属性定价 - 商品价格设置为0\r\n<br /><br />\r\n所有属性含价格。\r\n\r\n<br /><br />\r\n原价0\r\n<br /><br />\r\n特价25%\r\n<br /><br />\r\n促销10%\r\n<br /><br />','',0),(79,1,'TEST 25% Special Attribute Priced','Priced by Attributes - Product price is set to $0.00\r\n<br /><br />\r\nAll attributes are marked to make the price.\r\n\r\n<br /><br />\r\nProduct is $0\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />','',0),(79,2,'测试 25%特价 属性定价','属性定价 - 商品价格设置为0\r\n<br /><br />\r\n所有属性含价格。\r\n\r\n<br /><br />\r\n原价0\r\n<br /><br />\r\n特价25%\r\n<br /><br />','',0),(80,1,'TEST 25% Special','Product is $100.00\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />','',0),(80,2,'测试 25%特价','原价100元\r\n<br /><br />\r\n特价25%\r\n<br /><br />','',0),(82,1,'TEST $120 Sale -$5.00','Product is $120\r\n<br /><br />\r\nSale is -$5.00\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(82,2,'测试120元 促销-5元','原价120元\r\n<br /><br />\r\n促销-5元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(83,1,'TEST $120 Special $90.00 Sale -$5.00','Product is $120\r\n<br /><br />\r\n\r\nSpecial $90.00 or 25%\r\n<br /><br />\r\n\r\nSale is -$5.00\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(83,2,'测试120元 特价90元 促销-5元','原价120元\r\n<br /><br />\r\n\r\n特价90元或25%\r\n<br /><br />\r\n\r\n促销-5元\r\n<br /><br />\r\n\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(84,1,'TEST $120','Product is $120\r\n<br /><br />\r\n\r\nThere is no special and no sale on this product.\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75<br />\r\n- Green $40\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nX-Small $40.00<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- None<br /> \r\n- Embossed Collector\'s Tin $40.00<br />\r\n- Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nFeatures: <br />\r\nQuality Design<br />\r\nCustom Handling<br />\r\nSame Day Shipping<br />\r\n<br /><br />\r\n\r\nNOTE: Select from below ... is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\n\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\n\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />\r\n\r\nNOTE: None is similar to Display Only, but this can be used when for when no option value is required.\r\n<br /><br />\r\n\r\nIts value is set the value to $0.00 and it is NOT marked Display Only. \r\n<br /><br />\r\n\r\nBecause its value is $0.00 if included in the Attributes Based Price on products Priced by Attributes, this Options group would not have any value included in the calculated price.\r\n<br /><br />\r\n\r\nNOTE: The Option Name: Featured is a READ ONLY Option Type\r\n<br /><br />\r\nThis can be for repeatative information or anything that occures on many products but functions like an attribute in setting up the information. It does not get added to the Shopping Cart nor display on the Order. They should be marked exclude from Attribute Based Price.\r\n<br /><br />','',0),(84,2,'测试120元','原价120元\r\n<br /><br />\r\n\r\n无特价，无促销。\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元<br />\r\n- 绿色40元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n特小号40元<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 无<br /> \r\n- 礼物盒40元<br />\r\n- 收藏盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n特色: <br />\r\n设计精美<br />\r\n客户定制<br />\r\n当日发货<br />\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />\r\n\r\n说明: 无类似仅显示，但能用在非必选项中。\r\n<br /><br />\r\n\r\n价格设置为0，未选择仅显示。\r\n<br /><br />\r\n\r\n因为价格为0，如果用在属性基价给商品定价，本选项的值为0\r\n<br /><br />\r\n\r\n说明: 选项名: 特色 是只读选项\r\n<br /><br />\r\n用于显示商品信息，但不显示在购物车或订单中，不能用于计算属性基价。\r\n<br /><br />','',0),(85,1,'TEST $120 Special $90','Product is $120\r\n<br /><br />\r\n\r\nThere is a $90.00 or 25% Special and no sale on this product.\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(85,2,'测试120元 特价90元','原价120元\r\n<br /><br />\r\n\r\n特价90元或25% 无促销。\r\n<br /><br />\r\n\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(88,1,'TEST $120 Sale Special $90 Skip','Product is $120\r\n<br /><br />\r\nSpecial is $105\r\n<br /><br />\r\nSale Price is $90 or 25% - Skip Products with Specials\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(88,2,'测试120元 促销 特价90元 无条件','商品价格120元\r\n<br /><br />\r\n特价105元\r\n<br /><br />\r\n促销价90元或25% - 不含特价\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(89,1,'TEST $120 Sale 10% Special off Skip','Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10% - Skip Products with Specials\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(89,2,'测试120元 促销10% 无特价 无条件','商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n促销10% - 不含特价\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(90,1,'TEST $120 Sale 10% Special','Product is $120\r\n<br /><br />\r\nSpecial is 25% or $90\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(90,2,'测试120元 促销10% 有特价','商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n促销 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(92,1,'TEST $120 Sale 10% Special off','Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(92,2,'测试120元 促销10% 无特价','商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n实际优惠 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(93,1,'TEST $120 Special off Sale New Price $100','Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(93,2,'测试120元 无特价 促销价100元','商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(94,1,'TEST $120 Special 25% Sale New Price $100','Product is $120\r\n<br /><br />\r\nSpecial 25% or $90\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(94,2,'测试120元 特价25% 促销价100元','商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(95,1,'TEST $120 Special 25% Sale New Price $100 Skip Specials','Product is $120\r\n<br /><br />\r\nSpecial 25% or $90\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(95,2,'测试120元 特价25% 促销价100元 不含特价','商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(96,1,'TEST $120 Special off Sale New Price $100 Skip Specials','Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(96,2,'测试120元 无特价 促销价100元 不含特价','商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(97,1,'TEST $120 Sale 10% Special - Apply to price','Product is $120\r\n<br /><br />\r\nSpecial is 25% or $90\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(97,2,'测试120元 促销10% 有特价 - 原价基础上','商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n实际优惠 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(98,1,'TEST $120 Sale 10% Special off - Apply to Price','Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(98,2,'测试120元 促销10% 无特价 - 原价基础上','商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n实际优惠 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100号\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(99,1,'Free Shipping Product with Weight','This product has Free Shipping.\r\n<br /><br />\r\n\r\nThe weight is set to 5\r\n<br /><br />\r\n\r\nWhile the weight is set to 5, it has the Always Free Shipping set to YES and the Free Shipping Module is installed.\r\n<br /><br />','',0),(99,2,'有重量免运费商品','本商品免运费。\r\n<br /><br />\r\n\r\n重量设置为5\r\n<br /><br />\r\n\r\n重量设置为5，但是免运费设置为是，免运费模块已安装。\r\n<br /><br />','',0),(100,1,'Hewlett Packard - by attributes SALE with Special','The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are set for the discount to be applied, their prices before the discount are:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00<br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',1),(100,2,'惠普- 属性允许优惠 有特价','商品价格设置为0\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />\r\n\r\n颜色属性设置为允许优惠，优惠前价格为:<br />\r\n白色499.99元<br />\r\n黑色519元<br />\r\n蓝色539元<br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(101,1,'TEST $120 Sale 10% Special off','Product is Priced by Attributes.\r\n<br /><br />\r\n\r\nAttribute Option Group: Color and Size are used for pricing by marking these as Included in Base Price.\r\n<br /><br />\r\n\r\nGift Options has everything marked included in base price also, but because None is set to $0.00 that groups lowest price is $0.00 so it is not affecting the Base Price.\r\n<br /><br />\r\n\r\nIf None was not part of this group and you did not want to include those prices, you would mark all of the Gift Option Attributes to NOT be included in the Base Price.\r\n<br /><br />\r\n\r\nProduct Product is $0.00\r\n<br /><br />\r\n\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(101,2,'测试120元 促销10% 无特价','商品根据属性定价。\r\n<br /><br />\r\n\r\n属性选项: 颜色和尺寸包含在基价计算中\r\n<br /><br />\r\n\r\n礼物选项也包含在基价计算中，但因为 无 设置为0，这个选项的最低价格为0，所以不影响基价。\r\n<br /><br />\r\n\r\n如果 无 不是一个选项而你不想包含这些价格，可以设置所有的礼物选项属性不包含在基价计算中。\r\n<br /><br />\r\n\r\n商品价格为0\r\n<br /><br />\r\n\r\n无特价\r\n<br /><br />\r\n促销10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(104,1,'Hide Quantity Box','This product does not show the Quantity Box when Adding to the Shopping Cart.\r\n<br /><br />\r\n\r\nThis will add 1 to the Shopping Cart when Add to Cart is hit.\r\n<br /><br />\r\n\r\nNOTE: If using Quantity Box Shows set to NO, unless Qty Max is also set to 1 then each time the Add to Cart is clicked the current cart quantity is updated by 1. If Qty Max is set to 1 then no more than 1 will be able to be added to the Shopping Cart per order.\r\n<br /><br />\r\n\r\nBecause the Image name is: 1_small.jpg<br />\r\nand stored in the /images directory ...\r\n<br /><br />\r\n\r\nThe other matching images will show:\r\n<br /><br />\r\n/images/1_small_00.jpg<br />\r\n/images/1_small_02.jpg<br />\r\n/images/1_small_03.jpg\r\n<br /><br />\r\n\r\nThe matching large images from /images/large will show:\r\n<br /><br />\r\n/images/large/1_small_00_LRG.jpg<br />\r\n/images/large/1_small_02_LRG.jpg<br />\r\n/images/large/1_small_03_LRG.jpg\r\n<br /><br />\r\n\r\nA matching image must begin with the same exact name as the Product Image and end in the same extension.\r\n<br /><br />\r\n\r\nThese will then auto load.\r\n<br /><br />','',0),(104,2,'隐藏数量方框','本商品在添加到购物车时，不显示数量方框。\r\n<br /><br />\r\n\r\n点击添加到购物车时，将增加一件本商品到购物车中。\r\n<br /><br />\r\n\r\n说明: 如果将显示数量方框设置为否，除非最大购买数量同时设置为1，否则点击添加到购物车按钮时，会增加一件商品。如果最大购买数量设置为1，那么一个订单最多只能有一件本商品。\r\n<br /><br />\r\n\r\n因为图象名为: 1_small.jpg<br />\r\n且保存在/images 目录 ...\r\n<br /><br />\r\n\r\n将自动显示其它匹配的图片:\r\n<br /><br />\r\n/images/1_small_00.jpg<br />\r\n/images/1_small_02.jpg<br />\r\n/images/1_small_03.jpg\r\n<br /><br />\r\n\r\n也将显示匹配的位于 /images/large 目录的大图片:\r\n<br /><br />\r\n/images/large/1_small_00_LRG.jpg<br />\r\n/images/large/1_small_02_LRG.jpg<br />\r\n/images/large/1_small_03_LRG.jpg\r\n<br /><br />\r\n\r\n附加图片的文件名开头必须和商品图片的名称一致，后缀也必须一致。\r\n<br /><br />\r\n\r\n这些图片会自动显示。\r\n<br /><br />','',0),(105,1,'A Maximum Sample of 1','This product only allows Quantity 1 because the Products Qty Maximum is set to 1.\r\n<br /><br />\r\n\r\nThis means there will be no Quantity box.\r\n<br /><br />\r\n\r\nAdd button will not add more than a total of 1 to the Shopping Cart.\r\n<br /><br />','',0),(105,2,'最多一件','本商品只允许购买1件，因为商品最大购买数量设置为1。\r\n<br /><br />\r\n\r\n表明将不显示数量方框。\r\n<br /><br />\r\n\r\n添加商品按钮将不会添加超过1件本商品到购物车\r\n<br /><br />','',0),(106,1,'A Maximum Sample of 3','This product only allows Quantity 1 because the Products Qty Maximum is set to 3.\r\n<br /><br />\r\n\r\nThis means there will be a Quantity box.\r\n<br /><br />\r\n\r\nAdd button will not add more than a total of 3 to the Shopping Cart.\r\n<br /><br />','',0),(106,2,'最多三件','本商品只允许购买3件，因为商品最大购买数量设置为3。\r\n<br /><br />\r\n\r\n表明将显示数量方框。\r\n<br /><br />\r\n\r\n添加商品按钮将不会添加超过3件本商品到购物车\r\n<br /><br />','',0),(107,1,'Free Shipping Product without Weight','This product has Free Shipping.\r\n<br /><br />\r\n\r\nThe weight is set to 0\r\n<br /><br />\r\n\r\nIt has the Always Free Shipping set to NO and the Free Shipping Module is installed but it will still ship for Free.\r\n<br /><br />\r\n\r\nIn the Configruation settings for Shipping/Packaging ... Order Free Shipping 0 Weight Status has been defined to be Free Shipping.\r\n<br /><br />\r\n\r\nNOTE: if that setting is changed, then this product will NOT ship for free, even though the weight is set to 0.\r\n<br /><br />','',0),(107,2,'无重量免运费商品','本商品免运费。\r\n<br /><br />\r\n\r\n重量设置为0\r\n<br /><br />\r\n\r\n免运费设置为否，免运费模块已安装，仍然为免运费。\r\n<br /><br />\r\n\r\n在商店设置－配送参数 ... 零重量商品免运费设置为是。\r\n<br /><br />\r\n\r\n说明: 如果修改该设置，那么即使商品重量为零，也不会免运费。\r\n<br /><br />','',0),(108,1,'A Sold Out Product','This product is Sold Out because the product quantity is <= 0\r\n<br /><br />\r\n\r\nBecause the Configuration Settings in Stock are defined that Sold Out Products are not disabled and Sold Out cannot be purchased, the add to cart buttons are changed to either the large or small Sold Out image.\r\n<br /><br />\r\n\r\nIf you change the Configuration Settings in Stock, then you will be able to purchase this product, even though it is Sold Out.\r\n<br /><br />','',0),(108,2,'缺货商品','本商品缺货，因为商品数量 <= 0\r\n<br /><br />\r\n\r\n商店设置－库存选项中，缺货商品的状态为打开，允许结帐设置为否，添加商品按钮变成商品缺货图标。\r\n<br /><br />\r\n\r\n如果修改商店设置－库存选项，可以设置为即使缺货，也能购买。\r\n<br /><br />','',0),(109,1,'Hide Quantity Box Methods','This product does not show the Quantity Box when Adding to the Shopping Cart.\r\n<br /><br />\r\n\r\nWhile Quantity Box Shows is set to YES, the Product Qty Max has been set to 1\r\n\r\nThis will add only 1 to the Shopping Cart when Add to Cart is hit.\r\n<br /><br />\r\n\r\nThe reason for this is that this is a download. As a download, there is never a reason to allow more than quantity 1 to be ordered.\r\n<br /><br />\r\n\r\nNOTE: If using Quantity Box Shows set to NO, unless Qty Max is also set to 1 then each time the Add to Cart is clicked the current cart quantity is updated by 1. If Qty Max is set to 1 then no more than 1 will be able to be added to the Shopping Cart per order.\r\n<br /><br />\r\n\r\nTwo methods are available to trigger the Hide Quantity Box.\r\n<br /><br />\r\n\r\nMethod 1: Set Quantity Box Shows to NO\r\n<br /><br />\r\n\r\nMethod 2: Set Qty Maximum to 1\r\n<br /><br />\r\n\r\nIn either case, you will only be able to add qty 1 to the shopping cart and the quantity box will not show.\r\n<br /><br />','',0),(109,2,'隐藏数量方框的方法','本商品加入购物车时，不显示数量方框。\r\n<br /><br />\r\n\r\n当显示数量方框设置为是时，商品的最大购买数量被设置为1。\r\n\r\n点击添加到购物车按钮时，只会添加一件商品。\r\n<br /><br />\r\n\r\n因为这是下载类商品，下载类商品不需要购买多件。\r\n<br /><br />\r\n\r\n说明: 如果将显示数量方框设置为否，除非最大购买数量同时设置为1，否则点击添加到购物车按钮时，会增加一件商品。如果最大购买数量设置为1，那么一个订单最多只能有一件本商品。\r\n<br /><br />\r\n\r\n有两种方法用于隐藏数量方框。\r\n<br /><br />\r\n\r\n方法一: 设置显示数量方框为否\r\n<br /><br />\r\n\r\n方法二: 设置最大购买数量为1\r\n<br /><br />\r\n\r\n两种方式都只能购买一件本商品，同时不显示数量方框。\r\n<br /><br />','',0),(110,1,'TEST $120 Sale -$5.00 Skip','Product is $120\r\n<br /><br />\r\nSale is -$5.00\r\n<br /><br />\r\nSpecials are skipped\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(110,2,'测试120元 促销-5元 忽略特价','原价120元\r\n<br /><br />\r\n促销-5元\r\n<br /><br />\r\n忽略特价\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(111,1,'TEST $120 Special $90.00 Sale -$5.00 Skip','Product is $120\r\n<br /><br />\r\n\r\nSpecial $90.00 or 25% - Specials are Skipped\r\n<br /><br />\r\n\r\nSale is -$5.00\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(111,2,'测试120元 特价90元 促销-5元 忽略特价','原价120元\r\n<br /><br />\r\n\r\n特价90元或25% - 忽略特价\r\n<br /><br />\r\n\r\n促销-5元\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />','',0),(112,1,'Test Two','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(112,2,'测试二','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(113,1,'Test Four','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(113,2,'测试四','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(114,1,'Test Five','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(114,2,'测试五','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(115,1,'Test One','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(115,2,'测试一','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(116,1,'Test Eight','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(116,2,'测试八','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(117,1,'<strong>Test<br /> Three</strong>','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(117,2,'测试三','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(118,1,'Test Ten','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(118,2,'测试十','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(119,1,'Test Six','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(119,2,'测试六','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(120,1,'Test Seven','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(120,2,'测试七','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(121,1,'Test Twelve','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(121,2,'测试十二','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(122,1,'Test Nine','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(122,2,'测试九','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(123,1,'Test Eleven','This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(123,2,'测试十一','测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。','',0),(127,1,'Normal Product','<p>This is a normal product priced at $15</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p>','',0),(127,2,'普通商品','<p>这是普通商品15元</p><p>设置了数量优惠。</p><p>数量优惠在商品价格管理菜单中设置。</p>','',0),(130,1,'Special Product','<p>This is a Special product priced at $15 with a $10 Special</p><p>There are quantity discounts setup which will be discounted from the Special Price.</p><p>Discounts are added on the Products Price Manager.</p>','',0),(130,2,'特价商品','<p>特价商品，原价15元，特价10元</p><p>批量优惠已设置，将在特价基础上优惠。</p><p>数量优惠在商品价格管理菜单中设置。</p>','',0),(131,1,'Per word - required','<p>Product is priced by attribute</p><p>The Option Name Line 1 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.05 per word</p><p>The Option Name Line2 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.05 per word with 3 words Free</p><p>The Colors are set up as radio buttons and Red is the Default.</p>','',0),(131,2,'按词收费 - 必填','<p>商品由属性定价</p><p>选项名的第一行设置为文本</p><p>属性设置为必填</p><p>价格为每词0.05元</p><p>选项名的第二行设置为文本</p><p>属性设置为必填</p><p>价格为每词0.05元，前3个词免费</p><p>颜色为单选，缺省为红色。</p>','',0),(132,1,'Golf Clubs','<p>Products Price is set to 0 and Products Weight is set to 1</p><p>This is marked Price by Attributes</p><p>This is priced by attribute at 14.45 per club with an added weight of 1 on the attributes.</p><p>This will make the shipping weight 1lb for the product plus 1lb for each attribute (club) added.</p><p>The attributes are sorted so the clubs read in order on the Product Info, Shopping Cart, Order, Email and Account History.</p>','',0),(132,2,'高尔夫球杆','<p>商品价格设置为0，商品重量设置为1</p><p>同时设置了属性定价</p><p>由属性定价，每根球杆14.45元，重量加1。</p><p>这样每增加一根球杆，商品重量增加1克。</p><p>在商品简介、购物车、订单、电子邮件及帐号记录中球杆都按照属性排序。</p>','',0),(133,1,'Multiple Downloads','<p>This product is set up to have multiple downloads.</p><p>The Product Price is $49.99</p><p>The attributes are setup with two Option Names, one for each download to allow for two downloads at the same time.</p><p>The first Download is listed under:</p><p>Option Name: Version<br />Option Value: Download Windows - English<br />Option Value: Download Windows - Spanish<br />Option Value: DownloadMAC - English<br /></p><p>The second Download is listed under:</p><p>Option Name: Documentation<br />Option Value: PDF - English<br />Option Value:MS Word- English</p>','',0),(133,2,'多个下载','<p>本商品设置为包含多个下载。</p><p>本商品价格49.99元</p><p>属性设置为两个选项名称，每个下载一个，可以同时下载两个文件。</p><p>第一个下载是:</p><p>选项名: 版本<br />选项值: 下载Windows - 英语<br />选项值: 下载Windows - 西班牙语<br />选项值: 下载MAC - 英语<br /></p><p>第二个下载是:</p><p>选项名: 文档<br />选项值: PDF - 英语<br />选项值: MS Word- 英语</p>','',0),(134,1,'Per letter - required','<p>Product is priced by attribute</p><p>The Option Name Line 1 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.02 per letter</p><p>The Option Name Line2 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.02 per letter with 3 letters free</p><p>The Colors are set up as radio buttons and Red is the Default.</p>','',0),(134,2,'按字收费 - 必填','<p>商品由属性定价</p><p>选项名的第一行设置为文本</p><p>属性设置为必填</p><p>价格为每字0.02元</p><p>选项名的第二行设置为文本</p><p>属性设置为必填</p><p>价格为每字0.02元，前3个字免费</p><p>颜色为单选，缺省为红色。</p>','',0),(154,1,'Rope','<p>Rope is sold by foot or yard with a minimum length of 10 feet or 10 yards</p><p>Product Price of $1.00<br />Product Weight of 0</p><p>Option Values:<br />per foot $0.00 weight .25<br />per yard $1.50 weight .75</p>','',0),(154,2,'绳子','<p>绳子按尺或码出售，最少购买10尺或10码</p><p>商品价格1元<br />商品重量为0</p><p>选项值:<br />每尺原价，重0.25克<br />每码加1.5元，重0.75克</p>','',0),(155,1,'Price Factor','<p>This product is priced at $10.00</p><p>The attributes are priced using the Price Factor</p><p>Red is $10<br />Yellow is $20<br />Green is $30</p><p>This makes the total price $10 + the price factor of the attribute.</p>','',0),(155,2,'价格因素','<p>本商品价格为10元</p><p>属性中设置了价格因素</p><p>红色10元<br />黄色20元<br />绿色30元</p><p>因此，最终价格为 商品价格 + 价格因素 * 商品价格</p>','',0),(156,1,'Price Factor Offset','<p>This product is priced at $10.00</p><p>The attributes are priced using the Price Factor and Price Factor Offset</p><p>Red is $10 ($0)<br />Yellow is $20 ($10)<br />Green is $30 ($20)</p><p>The Price Factor Offset is set to 1 to take out the price of the Product Price then make the total price $10 + the price factor * $10 - price factor offset * $10 for the attributes.</p>','',0),(156,2,'价格因素调整','<p>本商品价格为10元</p><p>属性中设置了价格因素和价格因素调整</p><p>红色为10元 (0元)<br />黄色为20元 (10元)<br />绿色为30元 (20元)</p><p>价格因素调整设置为1，最终价格为 商品价格 + 价格因素 * 商品价格 - 价格因素调整 * 商品价格</p>','',0),(157,1,'Price Factor Offset by Attribute','<p>This product is priced at $10.00</p><p>It is marked Price by Attributes.</p><p>The attributes are priced using the Price Factor and Price Factor Offset. </p><p>The actual Product Price is used just to compute the Price Factor.</p><p>Red is $10 ($0)<br />Yellow is $20 ($10)<br />Green is $30 ($20)</p><p>The Price Factor Offset is set to 1 to take out the price of the Product Price then make the total price the price factor * $10 - price factor offset * $10 for the attributes.</p>','',0),(157,2,'属性的价格因素调整','<p>本商品价格为10元</p><p>商品根据属性定价。</p><p>属性由价格因素、价格因素调整定价。</p><p>商品价格仅用于计算价格因素。</p><p>红色为10元 (0元)<br />黄色为20元 (10元)<br />绿色为30元 (20元)</p><p>价格因素调整设置为1，最终价格为 商品价格 + 价格因素 * 商品价格 - 价格因素调整 * 商品价格</p>','',0),(158,1,'One Time Charge','<p>This product is $45 with a one time charge set on the colors.</p><p>Red $5<br />Yellow is $10<br />Green is $15</p>','',0),(158,2,'基本费','<p>本商品设置为颜色加45元。</p><p>红色另加5元<br />黄色另加10元<br />绿色另加15元</p>','',0),(159,1,'Attribute Quantity Discount','<p>Attribute qty discounts are attribute prices based on qty ordered.</p><p>Enter them as: </p><p>Red:<br />3:10.00,6:9.00,9:8.00,12:7.00,15:6.00</p><p>Yellow<br />3:10.50,6:9.50,9:8.50,12:7.50,15:6.50</p><p>Green:<br />3:11.00,6:10.00,9:9.00,12:8.00,15:7.00</p><p>A table will also show on the page to display these discounts as well as an indicator that qty discounts are available.</p>','',0),(159,2,'属性批量优惠','<p>属性批量优惠是根据购买的商品数量设置不同的优惠。</p><p>演示设置: </p><p>红色:<br />3:10.00,6:9.00,9:8.00,12:7.00,15:6.00</p><p>黄色<br />3:10.50,6:9.50,9:8.50,12:7.50,15:6.50</p><p>绿色:<br />3:11.00,6:10.00,9:9.00,12:8.00,15:7.00</p><p>优惠金额、批量的数量将以表格形式显示。</p>','',0),(160,1,'Golf Clubs','<p>Products Price is set to 0 and Products Weight is set to 1</p><p>This is marked Price by Attributes</p><p>This is priced by attribute at 14.45 per club with an added weight of 1 on the attributes.</p><p>This will make the shipping weight 1lb for the product plus 1lb for each attribute (club) added.</p><p>The attributes are sorted so the clubs read in order on the Product Info, Shopping Cart, Order, Email and Account History.</p>','',0),(160,2,'高尔夫球杆','<p>商品价格设置为0，重量为1</p><p>同时设置了属性定价</p><p>每根球杆14.45元，重量加1。</p><p>这样每增加一根球杆，商品重量增加1克。</p><p>在商品简介、购物车、订单、电子邮件及帐号记录中球杆都按照属性排序。</p>','',0),(165,1,'Rope','<p>Rope is sold by foot or yard with a minimum length of 10 feet or 10 yards</p><p>Product Price of $1.00<br />Product Weight of 0</p><p>Option Values:<br />per foot $0.00 weight .25<br />per yard $1.50 weight .75</p>','',0),(165,2,'绳子','<p>绳子按尺或码出售，最少购买10尺或10码</p><p>商品价格1元<br />商品重量为0</p><p>选项值:<br />每尺原价，重0.25克<br />每码加1.5元，重0.75克</p>','',0),(166,1,'Russ Tippins Band - The Hunter','','',0),(166,2,'Russ Tippins Band - The Hunter','','',0),(167,1,'Test Document','This is a test document','',0),(167,2,'测试文档','这是测试文档','',0),(168,1,'Sample of Product General Type','Product General Type are your regular products.\r\n\r\nThere are no special needs or layout issues to work with.','',0),(168,2,'商品样品 普通类型','普通商品类型用于普通商品。\r\n\r\n不需要特别修改。','',0),(169,1,'Sample of Product Music Type','The Product Music Type is specially designed for music media.\r\n\r\nThis can offer a lot more flexibility than the Product General.','',0),(169,2,'商品样品 音乐类型','音乐类型用于音乐类商品。\r\n\r\n比普通商品更灵活。','',0),(170,1,'Sample of Document General Type','Document General Type is used for Products that are actually Documents.\r\n\r\nThese cannot be added to the cart but can be configured for the Document Sidebox. If your Document Sidebox is not showing, go to the Layout Controller and turn it on for your template.','',0),(170,2,'文档样品 普通类型','文档普通类型用于文档类商品。\r\n\r\n不能购买，可以显示在文档边框中。如果需要显示文档边框，可以在 工具－外观控制 中打开。','',0),(171,1,'Sample of Document Product Type','Document Product Type is used for Documents that are also available for sale. <br /><br />You might wish to display brief peices of the Document then offer it for sale. <br /><br />This Product Type is also handy for downloadable Documents or Documents available either on CD or by download. <br /><br />The Document Product Type could be used in the Document Sidebox or the Categories Sidebox depending on how you configure its master categories id. <br /><br />This product has also been added as a linked product to the Document Category. This will allow it to show in both the Category and Document Sidebox. While not marked specifically for the master product type id related to the Product Types, it now is in a Product Type set for Document General so it will show in both boxes.','',0),(171,2,'文档样品 商品类型','文档商品类型用于可出售类文档。<br /><br />可以显示部分文档内容并出售。<br /><br />本商品类型也可以用于下载类文档。<br /><br />文档商品类型可以用在文档边框或商品分类边框，取决于主分类id的设置。<br /><br />本商品也链接到文档分类目录下，这样可以同时显示在文档分类边框和商品分类边框。','',0),(172,1,'Sample of Product Free Shipping Type','<p>Product Free Shipping can be setup to highlight the Free Shipping aspect of the product. <br /><br />These pages include a Free Shipping Image on them. <br /><br />You can define the ALWAYS_FREE_SHIPPING_ICON in the language file. This can be Text, Image, Text/Image Combo or nothing. <br /><br />The weight does not matter on Always Free Shipping if you set Always Free Shipping to Yes. <br /><br />Be sure to have the Free Shipping Module Turned on! Otherwise, if this is the only product in the cart, it will not be able to be shipped. <br /><br />Notice that this is defined with a weight of 5lbs. But because of the Always Free Shipping being set to Y there will be no shipping charges for this product. <br /><br />You do not have to use the Product Free Shipping product type just to use Always Free Shipping. But the reason you may want to do this is so that the layout of the Product Free Shipping product info page can be layout specifically for the Free Shipping aspect of the product. <br /><br />This includes a READONLY attribute for Option Name: Shipping and Option Value: Free Shipping Included. READONLY attributes do not show on the options for the order.</p>','',0),(172,2,'商品样品 免运费','<p>商品可以设置为免运费<br /><br />将显示免运费图标。<br /><br />在语言文件中定义ALWAYS_FREE_SHIPPING_ICON。可以为文字、图片、文字/图片混合或者什么也不显示。<br /><br />设置免运费时，商品重量多少都没关系。<br /><br />确认免运费配送模块打开! 否则，如果只有免运费商品，将无法结帐。<br /><br />注意本商品重量5克。由于设置为免运费，所以运费为零。<br /><br />不必使用免运费商品类型，只要设置商品为免运费。如果你想特别设置免运费类商品的显示页面，才需要使用免运费商品类型。<br /><br />包括一个只读选项: 运费，选项值: 免运费。只读选项不在订单中显示。</p>','',0),(173,1,'Book','This Book is sold as a Book that is shipped to the customer or as a Download.<br /><br />\r\n\r\nOnly the Book itself is on Special. The Downloadable versions are not on Special.<br /><br />\r\n\r\nThis Book under Categories/Products is set to:<br /><br />\r\n\r\nProduct Priced by Attributes: Yes<br />\r\nProducts Price: 0.00<br />\r\nWeight: 0<br /><br />\r\n\r\nAn Option Name of: Version (type is dropdown)<br /><br />\r\nOption Values of: Book Hard Cover<br /><br />\r\nDownload: MAC English<br /><br />\r\nDownload: Windows English<br /><br />\r\n\r\nThe Attributes are set as:<br />\r\nOption Name: Version<br />\r\nOption Value: Book Hard Cover<br />\r\nPrice Prefix is blank<br />\r\nPrice: 52.50<br />\r\nWeight Prefix is blank\r\nWeight: 1<br />\r\nInclude in Base Price When Priced by Attributes Yes<br />\r\nApply Discounts Used by Product Special/Sale: Yes<br /><br />\r\n\r\nOption Name: Version<br />\r\nOption Value: Download: MAC English<br />\r\nPrice Prefix is blank<br />\r\nPrice: 20.00<br />\r\nWeight: 0\r\nInclude in Base Price When Priced by Attributes No<br />\r\nApply Discounts Used by Product Special/Sale: No<br /><br />\r\n\r\nOption Name: Version<br />\r\nOption Value: Download: Windows: English<br />\r\nPrice Prefix is blank<br />\r\nPrice: 20.00<br />\r\nWeight: 0<br />\r\nInclude in Base Price When Priced by Attributes No<br />\r\nApply Discounts Used by Product Special/Sale: No<br /><br />\r\n\r\nIt is on Special for $47.50<br /><br />','',0),(173,2,'书','本书可以邮寄或下载。<br /><br />\r\n\r\n邮寄有特价，下载无特价。<br /><br />\r\n\r\n在分类/商品中设置为:<br /><br />\r\n\r\n商品由属性定价: 是<br />\r\n商品价格: 0元<br />\r\n重量: 0<br /><br />\r\n\r\n选项名: 版本 (下拉菜单)<br /><br />\r\n选项值: 硬壳封面<br /><br />\r\n下载: MAC 英语<br /><br />\r\n下载: Windows 英语<br /><br />\r\n\r\n属性设置为:<br />\r\n选项名: 版本<br />\r\n选项值: 硬壳封面<br />\r\n价格前缀为空<br />\r\n价格: 52.50元<br />\r\n重量前缀为空<br />\r\n重量: 1<br />\r\n由属性定价时包含在基价中: 是<br />\r\n应用优惠于特价/促销: 是<br /><br />\r\n\r\n选项名: 版本<br />\r\n选项值: 下载: MAC 英语<br />\r\n价格前缀为空<br />\r\n价格: 20元<br />\r\n重量: 0\r\n由属性定价时不包含在基价中<br />\r\n由属性定价时不包含在基价中: 否<br /><br />\r\n\r\n选项名: 版本<br />\r\n选项值: 下载: Windows: 英语<br />\r\n价格前缀为空<br />\r\n价格: 20元<br />\r\n重量: 0<br />\r\n由属性定价时包含在基价中: 否<br />\r\n应用优惠于特价/促销: 否<br /><br />\r\n\r\n特价47.50元<br /><br />','',0),(174,1,'A Call No Price','This is a Call for Price product with no price<br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br />','',0),(174,2,'价格面议 无价格','价格面议商品，无价格<br />\r\n\r\n本商品显示原价、特价，最后是价格面议。不能购买本商品。\r\n<br />','',0),(175,1,'Qty Discounts by 1','<p>This is a normal product priced at $60</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p><p>The Discounts are offered in increments of 1.</p><p>Note: Attributes do not inherit the Discount Qty discounts.</p><p>Attributes will inherit Discounts from Specials or sales. This can be customized per attribute by marking the Attribute to Include Product Price Special or Sale Discounts.</p><p>Red is $100.00 and marked to include the Price to Special discount but will not inherit the Discount Qty discount.</p><p>Green is $100 and marked not to include the Price to Special discount and will not inherit the Discount Qty discount.</p>','',0),(175,2,'递增批量优惠','<p>这是普通商品，价格60元</p><p>批量优惠基于原价。</p><p>批量优惠在商品价格管理中设置。</p><p>每多购买一件商品，有不同的优惠</p><p>说明: 属性不继承批量优惠。</p><p>属性继承特价或促销。可以设置每个属性，包含商品的特价或促销。</p><p>红色100元，设置为继承特价但不继承批量优惠。</p><p>绿色100元，设置为不继承特价，不继承批量优惠。</p>','',0),(176,1,'Normal Product by the dozen','<p>This is a normal product priced at $100</p><p>There are quantity discounts setup which will be discounted from the Products Price by the dozen.</p><p>Discounts are added on the Products Price Manager.</p>','',0),(176,2,'普通商品12件','<p>这是普通商品，价格100元</p><p>批量优惠基于原价，数量12件。</p><p>批量优惠在商品价格管理中设置。</p>','',0),(177,1,'Special Product by the dozen','<p>This is a Special product priced at $100 with a $75 Special</p><p>There are quantity discounts setup which will be discounted from the Special Price discounted by the dozen.</p><p>Discounts are added on the Products Price Manager.</p>','',0),(177,2,'特价商品12件','<p>这是特价商品，原价100元，特价75元</p><p>批量优惠基于特价，数量12件。</p><p>批量优惠在商品价格管理中设置。</p>','',0),(178,1,'Qty Discounts by 1 Special','<p>This is a normal product priced at $60 with a special of $50</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p><p>The Discounts are offered in increments of 1.</p><p>Note: Attributes do not inherit the Discount Qty discounts.</p><p>Attributes will inherit Discounts from Specials or sales. This can be customized per attribute by marking the Attribute to Include Product Price Special or Sale Discounts.</p><p>Red is $100.00 and marked to include the Price to Special discount but will not inherit the Discount Qty discount.</p><p>Green is $100 and marked not to include the Price to Special discount and will not inherit the Discount Qty discount.</p>','',0),(178,2,'递增批量优惠 有特价','<p>这是普通商品，价格60元，特价50元</p><p>批量优惠基于原价。</p><p>批量优惠在商品价格管理中设置。</p><p>每多购买一件商品，有不同的优惠</p><p>说明: 属性不继承批量优惠。</p><p>属性继承特价或促销。可以设置每个属性，包含商品的特价或促销。</p><p>红色100元，设置为继承特价但不继承批量优惠。</p><p>绿色100元，设置为不继承特价，不继承批量优惠。</p>','',0),(179,1,'Single Download','<p>This product is set up to have a single download.</p><p>The Product Price is $39.99</p><p>The attributes are setup with 1 Option Name, for the download to allow for one download but of various types.</p><p>The Download is listed under:</p><p>Option Name: Documentation<br />Option Value: PDF - English<br />Option Value: MS Word - English</p>','',0),(179,2,'单个下载','<p>本商品设置为单个下载。</p><p>商品价格39.99元</p><p>属性含1个选项名，允许多种类型的下载。</p><p>下载为:</p><p>选项名: 文档<br />选项值: PDF - 英语<br />选项值: MS Word - 英语</p>','',0),(180,1,'Red White Stripe Silk Classic Woven Man Tie Necktie TIE0016','<div><br />	These jacquard woven neckties are all in gloriously voluminous manner which are a 100% silk, and will fully satisfy your expectation in working place, party and formal place.<br /><br />	<br /><br />	Material: 100% Silk<br /><br />	<br /><br />	Length: 59&quot; (150cm) Width: 3.9&quot; (10cm) at widest<br /><br />	<br /><br />	Condition: Brand New<br /><br />	<br /><br />	High Quality and immaculate gift<br /><br />	<br /><br />	Do not bleach , Do not dry clean<br /><br />	<br /><br />	SKU: TIE0016<br /><br />	<br /><br />	Notice: Color of pictures may varies by different monitor setting. All pictures are real stock photos.</div><br />','',1),(180,2,'红白条纹男士真丝领带 TIE0016','','',0);
/*!40000 ALTER TABLE `cnproducts_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproducts_discount_quantity`
--

DROP TABLE IF EXISTS `cnproducts_discount_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproducts_discount_quantity` (
  `discount_id` int(4) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `discount_qty` float NOT NULL DEFAULT '0',
  `discount_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  KEY `idx_id_qty_zen` (`products_id`,`discount_qty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproducts_discount_quantity`
--

LOCK TABLES `cnproducts_discount_quantity` WRITE;
/*!40000 ALTER TABLE `cnproducts_discount_quantity` DISABLE KEYS */;
INSERT INTO `cnproducts_discount_quantity` (`discount_id`, `products_id`, `discount_qty`, `discount_price`) VALUES (4,127,12,10.0000),(3,127,9,8.0000),(2,127,6,7.0000),(1,8,3,10.0000),(1,127,3,5.0000),(4,130,12,10.0000),(3,130,9,8.0000),(2,130,6,7.0000),(1,130,3,5.0000),(9,175,9,10.0000),(8,175,8,9.0000),(7,175,7,8.0000),(6,175,6,7.0000),(5,175,5,6.0000),(4,175,4,5.0000),(3,175,3,4.0000),(2,175,2,3.0000),(1,175,10,11.0000),(3,178,3,4.0000),(2,178,2,3.0000),(1,178,10,11.0000),(6,177,36,30.0000),(5,176,48,30.0000),(4,176,36,20.0000),(3,176,24,10.0000),(2,176,12,5.0000),(1,176,60,40.0000),(5,177,24,20.0000),(4,177,12,10.0000),(3,177,6,5.0000),(2,177,60,50.0000),(1,177,48,40.0000),(4,178,4,5.0000),(5,178,5,6.0000),(6,178,6,7.0000),(7,178,7,8.0000),(8,178,8,9.0000),(9,178,9,10.0000);
/*!40000 ALTER TABLE `cnproducts_discount_quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproducts_notifications`
--

DROP TABLE IF EXISTS `cnproducts_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproducts_notifications` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproducts_notifications`
--

LOCK TABLES `cnproducts_notifications` WRITE;
/*!40000 ALTER TABLE `cnproducts_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnproducts_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproducts_options`
--

DROP TABLE IF EXISTS `cnproducts_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproducts_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_options_type` int(5) NOT NULL DEFAULT '0',
  `products_options_length` smallint(2) NOT NULL DEFAULT '32',
  `products_options_comment` varchar(64) DEFAULT NULL,
  `products_options_size` smallint(2) NOT NULL DEFAULT '32',
  `products_options_images_per_row` int(2) DEFAULT '5',
  `products_options_images_style` int(1) DEFAULT '0',
  `products_options_rows` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`products_options_id`,`language_id`),
  KEY `idx_lang_id_zen` (`language_id`),
  KEY `idx_products_options_sort_order_zen` (`products_options_sort_order`),
  KEY `idx_products_options_name_zen` (`products_options_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproducts_options`
--

LOCK TABLES `cnproducts_options` WRITE;
/*!40000 ALTER TABLE `cnproducts_options` DISABLE KEYS */;
INSERT INTO `cnproducts_options` (`products_options_id`, `language_id`, `products_options_name`, `products_options_sort_order`, `products_options_type`, `products_options_length`, `products_options_comment`, `products_options_size`, `products_options_images_per_row`, `products_options_images_style`, `products_options_rows`) VALUES (1,1,'Color',10,2,32,'',32,5,0,1),(1,2,'颜色',10,2,32,'',32,5,0,1),(2,1,'Size',20,0,32,'',32,5,0,1),(2,2,'尺寸',20,0,32,'',32,5,0,1),(3,1,'Model',30,0,32,'',32,5,0,1),(3,2,'型号',30,0,32,'',32,5,0,1),(4,1,'Memory',50,0,32,'',32,5,0,1),(4,2,'内存',50,0,32,'',32,5,0,1),(5,1,'Version',40,0,32,'',32,5,0,1),(5,2,'版本',40,0,32,'',32,5,0,1),(6,1,'Media Type',60,0,32,'',32,5,0,1),(6,2,'媒体',60,0,32,'',32,5,0,1),(7,1,'Logo Back',310,4,32,'',32,5,0,1),(7,2,'背面图标',310,4,32,'',32,5,0,1),(8,1,'Logo Front',300,4,32,'You may upload your own image file(s)',32,5,0,1),(8,2,'正面图标',300,4,32,'您可以上传自己的图像',32,5,0,1),(9,1,'Line 2',410,1,64,'',40,5,0,1),(9,2,'第二行',410,1,64,'',40,5,0,1),(10,1,'Line 1',400,1,64,'Enter your text up to 64 characters, punctuation and spaces',40,5,0,1),(10,2,'第一行',400,1,64,'输入的文字最多64个字符、标点符号或空格',40,5,0,1),(11,1,'Line 3',420,1,64,'',40,5,0,1),(11,2,'第三行',420,1,64,'',40,5,0,1),(12,1,'Line 4',430,1,64,'',40,5,0,1),(12,2,'第四行',430,1,64,'',40,5,0,1),(13,1,'Gift Options',70,3,32,'Special Option Options Available:',32,5,0,1),(13,2,'礼物',70,3,32,'选项:',32,5,0,1),(14,1,'Amount',200,2,32,'',32,5,0,1),(14,2,'金额',200,2,32,'',32,5,0,1),(15,1,'Features',700,5,32,'&nbsp;',32,5,0,1),(15,2,'特色',700,5,32,'&nbsp;',32,5,0,1),(16,1,'Irons',800,3,32,'',32,5,0,1),(16,2,'球杆',800,3,32,'',32,5,0,1),(17,1,'Documentation',45,0,32,NULL,32,5,0,1),(17,2,'资料',45,0,32,NULL,32,5,0,1),(18,1,'Length',70,0,32,'',32,5,0,1),(18,2,'长度',70,0,32,'',32,5,0,1),(19,1,'Shipping',600,5,32,'',32,0,0,1),(19,2,'交货',600,5,32,'',32,0,0,1);
/*!40000 ALTER TABLE `cnproducts_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproducts_options_types`
--

DROP TABLE IF EXISTS `cnproducts_options_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproducts_options_types` (
  `products_options_types_id` int(11) NOT NULL DEFAULT '0',
  `products_options_types_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`products_options_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track products_options_types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproducts_options_types`
--

LOCK TABLES `cnproducts_options_types` WRITE;
/*!40000 ALTER TABLE `cnproducts_options_types` DISABLE KEYS */;
INSERT INTO `cnproducts_options_types` (`products_options_types_id`, `products_options_types_name`) VALUES (0,'下拉'),(1,'文本'),(2,'单选'),(3,'多选'),(4,'文件'),(5,'只读');
/*!40000 ALTER TABLE `cnproducts_options_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproducts_options_values`
--

DROP TABLE IF EXISTS `cnproducts_options_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproducts_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  `products_options_values_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_id`,`language_id`),
  KEY `idx_products_options_values_name_zen` (`products_options_values_name`),
  KEY `idx_products_options_values_sort_order_zen` (`products_options_values_sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproducts_options_values`
--

LOCK TABLES `cnproducts_options_values` WRITE;
/*!40000 ALTER TABLE `cnproducts_options_values` DISABLE KEYS */;
INSERT INTO `cnproducts_options_values` (`products_options_values_id`, `language_id`, `products_options_values_name`, `products_options_values_sort_order`) VALUES (0,1,'TEXT',0),(0,2,'文字',0),(1,1,'4 mb',10),(1,2,'4 mb',10),(2,1,'8 mb',20),(2,2,'8MB',20),(3,1,'16 mb',30),(3,2,'16MB',30),(4,1,'32 mb',40),(4,2,'32MB',40),(5,1,'Value',10),(5,2,'超值',10),(6,1,'Premium',20),(6,2,'高级',20),(7,1,'Deluxe',30),(7,2,'豪华',30),(8,1,'PS/2',20),(8,2,'PS/2',20),(9,1,'USB',10),(9,2,'USB',10),(10,1,'Download: Windows - English',10),(10,2,'下载: Windows - 英文',10),(13,1,'Box: Windows - English',1000),(13,2,'盒装: Windows - 英文',1000),(14,1,'DVD/VHS Combo Pak',30),(14,2,'DVD/VHS',30),(15,1,'Blue',50),(15,2,'蓝色',50),(16,1,'Red',10),(16,2,'红色',10),(17,1,'Yellow',30),(17,2,'黄色',30),(18,1,'Medium',30),(18,2,'中号',30),(19,1,'X-Small',10),(19,2,'超小',10),(20,1,'Large',40),(20,2,'大号',40),(21,1,'Small',20),(21,2,'小号',20),(22,1,'VHS',20),(22,2,'VHS',20),(23,1,'DVD',10),(23,2,'DVD',10),(24,1,'20th Century',10),(24,2,'二十世纪',10),(25,1,'Orange',20),(25,2,'橙色',20),(26,1,'Green',40),(26,2,'绿色',40),(27,1,'Purple',60),(27,2,'紫色',60),(28,1,'Brown',70),(28,2,'褐色',70),(29,1,'Black',80),(29,2,'黑色',80),(30,1,'White',90),(30,2,'白色',90),(31,1,'Silver',100),(31,2,'银色',100),(32,1,'Gold',110),(32,2,'金色',110),(34,1,'Wrapping',40),(34,2,'外包装',40),(35,1,'Autographed Memorabilia Card',30),(35,2,'签名卡',30),(36,1,'Collector\'s Tin',20),(36,2,'礼品盒',20),(37,1,'Select from below ...',5),(37,2,'请选择 ...',5),(38,1,'$5.00',5),(38,2,'5元',5),(39,1,'$10.00',10),(39,2,'10元',10),(40,1,'$25.00',25),(40,2,'25元',25),(41,1,'$15.00',15),(41,2,'15元',15),(42,1,'$50.00',50),(42,2,'50元',50),(43,1,'$100.00',100),(43,2,'100元',100),(44,1,'Select from below ...',5),(44,2,'请选择 ...',5),(45,1,'NONE',5),(45,2,'无',5),(46,1,'None',5),(46,2,'无',5),(47,1,'Embossed Collector\'s Tin',10),(47,2,'装饰盒',10),(48,1,'None',5),(48,2,'无',5),(49,1,'Custom Handling',20),(49,2,'客户定制',20),(50,1,'Same Day Shipping',30),(50,2,'当日发货',30),(51,1,'Quality Design',10),(51,2,'设计精美',10),(52,1,'Download: Windows - Spanish',20),(52,2,'下载: Windows - 西班牙',20),(53,1,'3 Iron',30),(53,2,'3杆',30),(54,1,'4 Iron',40),(54,2,'4杆',40),(55,1,'5 Iron',50),(55,2,'5杆',50),(56,1,'6 Iron',60),(56,2,'6杆',60),(57,1,'9 Iron',90),(57,2,'9杆',90),(58,1,'Wedge',200),(58,2,'挖起杆',200),(59,1,'7 Iron',70),(59,2,'7杆',70),(60,1,'8 Iron',80),(60,2,'8杆',80),(61,1,'2 Iron',20),(61,2,'2杆',20),(62,1,'PDF - English',10),(62,2,'PDF - 英文',10),(63,1,'MS Word - English',20),(63,2,'WORD - 英文',20),(64,1,'Download: MAC - English',100),(64,2,'下载: MAC - 英语',100),(65,1,'per Foot',10),(65,2,'每尺',10),(66,1,'per Yard',20),(66,2,'每码',20),(67,1,'Free Shipping Included!',10),(67,2,'免运费!',10),(68,1,'Book Hard Cover',5),(68,2,'硬壳封面',5);
/*!40000 ALTER TABLE `cnproducts_options_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproducts_options_values_to_products_options`
--

DROP TABLE IF EXISTS `cnproducts_options_values_to_products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproducts_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_to_products_options_id`),
  KEY `idx_products_options_id_zen` (`products_options_id`),
  KEY `idx_products_options_values_id_zen` (`products_options_values_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproducts_options_values_to_products_options`
--

LOCK TABLES `cnproducts_options_values_to_products_options` WRITE;
/*!40000 ALTER TABLE `cnproducts_options_values_to_products_options` DISABLE KEYS */;
INSERT INTO `cnproducts_options_values_to_products_options` (`products_options_values_to_products_options_id`, `products_options_id`, `products_options_values_id`) VALUES (1,4,1),(2,4,2),(3,4,3),(4,4,4),(5,3,5),(6,3,6),(7,3,7),(8,3,8),(9,3,9),(10,5,10),(13,5,13),(14,6,14),(15,1,15),(16,1,16),(17,1,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,6,22),(23,6,23),(24,5,24),(35,1,25),(36,1,26),(37,1,27),(38,1,28),(39,1,29),(40,1,30),(41,1,31),(42,1,32),(53,13,34),(54,13,35),(55,13,36),(56,9,0),(57,10,0),(58,11,0),(59,12,0),(60,7,0),(61,8,0),(62,2,37),(63,14,38),(64,14,39),(65,14,40),(66,14,41),(67,14,42),(68,14,43),(69,13,44),(70,1,45),(71,4,46),(72,13,47),(73,13,48),(74,15,49),(75,15,50),(76,15,51),(77,5,52),(78,16,53),(79,16,54),(80,16,55),(81,16,56),(82,16,57),(83,16,58),(84,16,59),(85,16,60),(86,16,61),(87,17,62),(88,17,63),(89,5,64),(90,18,65),(91,18,66),(92,19,67),(93,5,68);
/*!40000 ALTER TABLE `cnproducts_options_values_to_products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproducts_to_categories`
--

DROP TABLE IF EXISTS `cnproducts_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproducts_to_categories` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`,`categories_id`),
  KEY `idx_cat_prod_id_zen` (`categories_id`,`products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproducts_to_categories`
--

LOCK TABLES `cnproducts_to_categories` WRITE;
/*!40000 ALTER TABLE `cnproducts_to_categories` DISABLE KEYS */;
INSERT INTO `cnproducts_to_categories` (`products_id`, `categories_id`) VALUES (1,4),(2,4),(3,9),(4,10),(5,11),(5,22),(6,10),(6,22),(7,12),(7,22),(8,13),(8,22),(9,10),(9,22),(10,10),(11,10),(11,22),(12,10),(12,22),(13,10),(13,22),(14,15),(14,22),(15,14),(15,22),(16,15),(16,22),(17,10),(17,22),(18,10),(19,12),(19,22),(20,15),(20,22),(21,18),(21,22),(22,19),(22,22),(23,20),(23,22),(24,20),(24,22),(25,8),(26,9),(27,5),(27,22),(28,21),(29,21),(30,21),(31,21),(32,21),(34,22),(36,25),(39,24),(40,24),(41,28),(42,28),(43,24),(44,22),(46,22),(47,21),(48,23),(49,23),(50,23),(51,24),(52,24),(53,23),(54,23),(55,28),(56,28),(57,24),(59,23),(60,28),(61,28),(74,23),(76,28),(78,25),(79,23),(80,23),(82,27),(83,27),(84,23),(85,23),(88,31),(89,31),(90,45),(92,45),(93,46),(94,46),(95,51),(96,51),(97,32),(98,32),(99,23),(100,25),(101,47),(104,23),(105,22),(106,22),(107,23),(108,23),(109,23),(110,52),(111,52),(112,53),(113,53),(114,53),(115,53),(116,53),(117,53),(118,53),(119,53),(120,53),(121,53),(122,53),(123,53),(127,55),(130,55),(131,57),(132,58),(133,60),(134,57),(154,58),(155,56),(156,56),(157,56),(158,56),(159,56),(160,61),(165,61),(166,62),(167,63),(168,64),(169,64),(170,64),(171,63),(171,64),(172,64),(173,61),(174,24),(175,55),(176,55),(177,55),(178,55),(179,60),(180,1);
/*!40000 ALTER TABLE `cnproducts_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproject_version`
--

DROP TABLE IF EXISTS `cnproject_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproject_version` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`),
  UNIQUE KEY `idx_project_version_key_zen` (`project_version_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproject_version`
--

LOCK TABLES `cnproject_version` WRITE;
/*!40000 ALTER TABLE `cnproject_version` DISABLE KEYS */;
INSERT INTO `cnproject_version` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch1`, `project_version_patch2`, `project_version_patch1_source`, `project_version_patch2_source`, `project_version_comment`, `project_version_date_applied`) VALUES (1,'Zen-Cart Main','1','5.1','','','','','New Installation','2013-05-08 21:35:39'),(2,'Zen-Cart Database','1','5.1','','','','','New Installation','2013-05-08 21:35:39');
/*!40000 ALTER TABLE `cnproject_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnproject_version_history`
--

DROP TABLE IF EXISTS `cnproject_version_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnproject_version_history` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnproject_version_history`
--

LOCK TABLES `cnproject_version_history` WRITE;
/*!40000 ALTER TABLE `cnproject_version_history` DISABLE KEYS */;
INSERT INTO `cnproject_version_history` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch`, `project_version_comment`, `project_version_date_applied`) VALUES (1,'Zen-Cart Main','1','5.1','','New Installation','2013-05-08 21:35:39'),(2,'Zen-Cart Database','1','5.1','','New Installation','2013-05-08 21:35:39');
/*!40000 ALTER TABLE `cnproject_version_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnquery_builder`
--

DROP TABLE IF EXISTS `cnquery_builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnquery_builder` (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_category` varchar(40) NOT NULL DEFAULT '',
  `query_name` varchar(80) NOT NULL DEFAULT '',
  `query_description` text NOT NULL,
  `query_string` text NOT NULL,
  `query_keys_list` text NOT NULL,
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `query_name` (`query_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Stores queries for re-use in Admin email and report modules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnquery_builder`
--

LOCK TABLES `cnquery_builder` WRITE;
/*!40000 ALTER TABLE `cnquery_builder` DISABLE KEYS */;
INSERT INTO `cnquery_builder` (`query_id`, `query_category`, `query_name`, `query_description`, `query_string`, `query_keys_list`) VALUES (1,'email','所有客户','返回所有客户的姓名和电子邮件地址，用于批量发送电子邮件(例如: 电子商情、优惠券、礼券、短信等)。','select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address',''),(2,'email,newsletters','所有电子商情订阅者','返回电子商情订阅者的姓名和电子邮件地址。','select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = \'1\'',''),(3,'email,newsletters','以往客户(超过三个月) (订阅者)','以前曾经购物，但最近三个月内没有购物的客户订阅者','select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC',''),(4,'email,newsletters','最近三个月的客户(订阅者)','最近三个月内有购物的电子商情订阅者。','select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = \'1\' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC',''),(5,'email,newsletters','最近三个月的客户(无论是否订阅)','所有曾经购物的顾客，不论是否订阅电子商情。','select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC',''),(6,'email,newsletters','管理员','仅当前管理员的电子邮件帐号','select \'ADMIN\' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id',''),(7,'email,newsletters','从未购物的客户','发给已注册但从未购物的客户','SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL','');
/*!40000 ALTER TABLE `cnquery_builder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnrecord_artists`
--

DROP TABLE IF EXISTS `cnrecord_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnrecord_artists` (
  `artists_id` int(11) NOT NULL AUTO_INCREMENT,
  `artists_name` varchar(32) NOT NULL DEFAULT '',
  `artists_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`),
  KEY `idx_rec_artists_name_zen` (`artists_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnrecord_artists`
--

LOCK TABLES `cnrecord_artists` WRITE;
/*!40000 ALTER TABLE `cnrecord_artists` DISABLE KEYS */;
INSERT INTO `cnrecord_artists` (`artists_id`, `artists_name`, `artists_image`, `date_added`, `last_modified`) VALUES (1,'The Russ Tippins Band','sooty.jpg','2004-06-01 20:53:00',NULL);
/*!40000 ALTER TABLE `cnrecord_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnrecord_artists_info`
--

DROP TABLE IF EXISTS `cnrecord_artists_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnrecord_artists_info` (
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `artists_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnrecord_artists_info`
--

LOCK TABLES `cnrecord_artists_info` WRITE;
/*!40000 ALTER TABLE `cnrecord_artists_info` DISABLE KEYS */;
INSERT INTO `cnrecord_artists_info` (`artists_id`, `languages_id`, `artists_url`, `url_clicked`, `date_last_click`) VALUES (1,1,'russtippinsband.users.btopenworld.com/',0,NULL),(1,2,'russtippinsband.users.btopenworld.com',0,NULL);
/*!40000 ALTER TABLE `cnrecord_artists_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnrecord_company`
--

DROP TABLE IF EXISTS `cnrecord_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnrecord_company` (
  `record_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_company_name` varchar(32) NOT NULL DEFAULT '',
  `record_company_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`),
  KEY `idx_rec_company_name_zen` (`record_company_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnrecord_company`
--

LOCK TABLES `cnrecord_company` WRITE;
/*!40000 ALTER TABLE `cnrecord_company` DISABLE KEYS */;
INSERT INTO `cnrecord_company` (`record_company_id`, `record_company_name`, `record_company_image`, `date_added`, `last_modified`) VALUES (1,'HMV Group',NULL,'2004-07-09 14:11:52',NULL);
/*!40000 ALTER TABLE `cnrecord_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnrecord_company_info`
--

DROP TABLE IF EXISTS `cnrecord_company_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnrecord_company_info` (
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `record_company_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnrecord_company_info`
--

LOCK TABLES `cnrecord_company_info` WRITE;
/*!40000 ALTER TABLE `cnrecord_company_info` DISABLE KEYS */;
INSERT INTO `cnrecord_company_info` (`record_company_id`, `languages_id`, `record_company_url`, `url_clicked`, `date_last_click`) VALUES (1,1,'www.hmvgroup.com',0,NULL),(1,2,'www.hmvgroup.com',0,NULL);
/*!40000 ALTER TABLE `cnrecord_company_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnreviews`
--

DROP TABLE IF EXISTS `cnreviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnreviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_customers_id_zen` (`customers_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_date_added_zen` (`date_added`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnreviews`
--

LOCK TABLES `cnreviews` WRITE;
/*!40000 ALTER TABLE `cnreviews` DISABLE KEYS */;
INSERT INTO `cnreviews` (`reviews_id`, `products_id`, `customers_id`, `customers_name`, `reviews_rating`, `date_added`, `last_modified`, `reviews_read`, `status`) VALUES (1,19,0,'Bill Smith',5,'2003-12-23 03:18:19','0001-01-01 00:00:00',11,1);
/*!40000 ALTER TABLE `cnreviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnreviews_description`
--

DROP TABLE IF EXISTS `cnreviews_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnreviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnreviews_description`
--

LOCK TABLES `cnreviews_description` WRITE;
/*!40000 ALTER TABLE `cnreviews_description` DISABLE KEYS */;
INSERT INTO `cnreviews_description` (`reviews_id`, `languages_id`, `reviews_text`) VALUES (1,1,'This really is a very funny but old movie!'),(1,2,'这是一部很有趣的旧电影！');
/*!40000 ALTER TABLE `cnreviews_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnsalemaker_sales`
--

DROP TABLE IF EXISTS `cnsalemaker_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnsalemaker_sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_status` tinyint(4) NOT NULL DEFAULT '0',
  `sale_name` varchar(30) NOT NULL DEFAULT '',
  `sale_deduction_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_deduction_type` tinyint(4) NOT NULL DEFAULT '0',
  `sale_pricerange_from` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_pricerange_to` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_specials_condition` tinyint(4) NOT NULL DEFAULT '0',
  `sale_categories_selected` text,
  `sale_categories_all` text,
  `sale_date_start` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_end` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_added` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_last_modified` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_status_change` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`sale_id`),
  KEY `idx_sale_status_zen` (`sale_status`),
  KEY `idx_sale_date_start_zen` (`sale_date_start`),
  KEY `idx_sale_date_end_zen` (`sale_date_end`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnsalemaker_sales`
--

LOCK TABLES `cnsalemaker_sales` WRITE;
/*!40000 ALTER TABLE `cnsalemaker_sales` DISABLE KEYS */;
INSERT INTO `cnsalemaker_sales` (`sale_id`, `sale_status`, `sale_name`, `sale_deduction_value`, `sale_deduction_type`, `sale_pricerange_from`, `sale_pricerange_to`, `sale_specials_condition`, `sale_categories_selected`, `sale_categories_all`, `sale_date_start`, `sale_date_end`, `sale_date_added`, `sale_date_last_modified`, `sale_date_status_change`) VALUES (1,0,'10% off Sale',10.0000,1,1.0000,1000.0000,2,'25,28,45,47,58',',25,28,45,47,58,','2003-12-23','2008-02-21','2003-12-23','2004-05-18','2013-05-08'),(3,0,'Mice 20%',20.0000,1,1.0000,1000.0000,2,'9',',9,','2003-12-24','2004-04-21','2003-12-31','2003-12-31','2004-04-25'),(6,1,'$5.00 off',5.0000,0,0.0000,0.0000,2,'27',',27,','0001-01-01','0001-01-01','2004-01-04','2004-01-05','2004-01-04'),(7,1,'10% Skip Specials',10.0000,1,0.0000,0.0000,1,'31',',31,','0001-01-01','0001-01-01','2004-01-04','2004-05-18','2004-01-04'),(8,1,'10% Apply to Price',10.0000,1,0.0000,0.0000,0,'32',',32,','0001-01-01','0001-01-01','2004-01-05','2004-05-18','2004-01-05'),(9,1,'New Price $100',100.0000,2,0.0000,0.0000,2,'46',',46,','0001-01-01','0001-01-01','2004-01-06','2004-01-07','2004-01-06'),(10,1,'New Price $100 Skip Special',100.0000,2,0.0000,0.0000,1,'51',',51,','0001-01-01','0001-01-01','2004-01-07','2004-01-07','2004-01-07'),(11,1,'$5.00 off Skip Specials',5.0000,0,0.0000,0.0000,1,'52',',52,','0001-01-01','0001-01-01','2004-01-24','2004-01-24','2004-01-24');
/*!40000 ALTER TABLE `cnsalemaker_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnseo_cache`
--

DROP TABLE IF EXISTS `cnseo_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnseo_cache` (
  `cache_id` varchar(32) NOT NULL DEFAULT '',
  `cache_language_id` tinyint(1) NOT NULL DEFAULT '0',
  `cache_name` varchar(255) NOT NULL DEFAULT '',
  `cache_data` mediumtext NOT NULL,
  `cache_global` tinyint(1) NOT NULL DEFAULT '1',
  `cache_gzip` tinyint(1) NOT NULL DEFAULT '1',
  `cache_method` varchar(20) NOT NULL DEFAULT 'RETURN',
  `cache_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cache_expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`cache_id`,`cache_language_id`),
  KEY `cache_id` (`cache_id`),
  KEY `cache_language_id` (`cache_language_id`),
  KEY `cache_global` (`cache_global`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnseo_cache`
--

LOCK TABLES `cnseo_cache` WRITE;
/*!40000 ALTER TABLE `cnseo_cache` DISABLE KEYS */;
INSERT INTO `cnseo_cache` (`cache_id`, `cache_language_id`, `cache_name`, `cache_data`, `cache_global`, `cache_gzip`, `cache_method`, `cache_date`, `cache_expires`) VALUES ('4404c1df54fdb1291c8dd9bb259f32a9',1,'seo_urls_v2_manufacturers','S0lNy8xL1VD3dfQLdXN0DgkNcg2K93P0dY1X11FQV9e05koZVYESHgA=',1,1,'EVAL','2013-05-10 19:19:35','2013-06-09 19:19:35'),('4404c1df54fdb1291c8dd9bb259f32a9',2,'seo_urls_v2_manufacturers','S0lNy8xL1VD3dfQLdXN0DgkNcg2K93P0dY1X11FQV9e05koZVYESHgA=',1,1,'EVAL','2013-05-11 19:23:40','2013-06-10 19:23:40'),('a93b9170a03ff54d81e95917742ea01b',1,'seo_urls_v2_categories','jVY9b9wwDN37K7pdC1TA+bMJOgVF0KktUHTpJMgSfSecbLmyfMn9+0pUguQCiOrg7ZF8fHykrGDUM3zYfb37ff/t568//Mfd93ve3vL68+7T+1233zM7jruPX96pHLKrXyHZetILAb/hbRfhVSlvACKDBGTCe6cHMnGDPJ7wi9MSaHj1wqPAumkiVDBvF2bgDIZJ4fPJG17tMUB6bec8rubV7f/gupZ3PQJRhM3DSiRFFQZ9YEbPJ1B5ZIddReQ2l7ChJURL4by1M1G/4hXOTSpnJ6acPlNsezSDNNYf80RDcWxK2gnUJY+LOmE+pVdpt9mzv56A99iRsnKbYPZESyFvjwNV9mE2VigCG7gmCk5MIk81lT4rNtmzpgSq2zj40QEEzxnDVr9R61ijqQ969EyC83rUwalU/opjgYMTy1HLNRRxVHuY/hgwD8IR61Xxm0j7BJfBFhLyCq09wWQdMayK46pM5Fb32MukH0GxxVm1Sc/8ZaH7T+XtrL11xGB7tOC0rVrmx9ohgRke2DlYNns0K44eCTdq9kAVjc5DyR0Ik88XjY+CRxhbhSFG06KOEcMURIXIE9Wh7xEduype1Th1RC/gZNgqcSCohF3B5lapYZbAgllLbHiL41rBs2q/JxTZ8y7lTsjCgQ+XGPVb9bQZQZNAH6x29KUVwDO4LiBO5IxrXieRvQureiB2oGl40/I2obeBreEL681qUeWVeArCgxMDXoIIg8agjjepg9dBQ6FSCEpCXgWVKyVTXgU1dE89b9OAXwfJAr0QhBt6JYQs0AtBaeZXlQr0nsuk34WaUW9BFBsXZxue4UOh+Tdw4iTVOI/wBsSNyWetkcETjA2X4g9XjY7CAHgU02KoKxsPFJrJw6PHK6LnQ55MOAyonz86bQy4iPwH',1,1,'EVAL','2013-05-10 19:19:35','2013-06-09 19:19:35'),('a93b9170a03ff54d81e95917742ea01b',2,'seo_urls_v2_categories','jZbNbtNAEMfvPAW3gESl+JNWnCpUcQIkxIXTCtJW4sIzBEX5VtqgNB+FNLHVVkklkjYqJXUTpy+TXdtvwXqmUlzU3e39NzP/mfnv2Ns7u1+/7TxLvd78uPXm/YdP5N3m2y1imcROp148TS2vq6Hvp56/erL9IGiuE9MC0DtilY4Y1NdXFLuqhudNMWtuEP0l4PMOyzkWzeeksKXfh9dY22FH7nL2VxxmpYlpQ9htLjrILmdTLZ2WFuIRlvZAxKOK3YtjzlwszMRBgSraLNDGdzGrEQ3mRPPl6Gwi5nQzrk/ztfCPF145qpwwF1rI05FkoeYG5Czu89GpdBpEAzfRynDpdyU6iYZZFRzPZ0D1mhtlf4rzcXca4A261+cylwqP8rRIt7q0PBCnNQxi4ERHdVoqBJPZmv5ZgRMTJ5CI0JQh2GQiRJeHwEukK/6LAicG2icRoRBlEQP8mSyiEkUMXGqiiiEXhgZc8RkFTkx4mAlRGUUfNjH/32BG0QcPQXckdEn6iE8oqhr3gvKZuAMOWtjwpMeyEtvFtxb3BaDKzTq6IcGq7i7azZ+Eg4JYbvymsK9bP2ieqlQYkJRlZ/hQxHn544ONsFwlOpSMi3PQGCvtSx+pRhArN2jtgnVvxJXjBdyxXsTvGXx05DisgbWKdNTmd0V6z20cQKvI3GNZ0viesdZFUPa4CVQH1cKkbSdqLNjeqQrXCI62s6A1VyxCI+BD1lkEJzf0cCgmdaLBGWBDl1X7Eg51wveeOVPph8dGjdMprZewIX5Yaa8qzg42DNzf0g+9jtTJnJauxam4q5Ab/KDeTMzpRIc7Hoxa3PxizgZDhe4x69bEFNyT0D+XNwDU4xYdWxkWw39p6MFYXFkjd9g4+CX5yNtYu3+59OqyZPAeov5lMJ7IMPgORHOHOcUY+wc=',1,1,'EVAL','2013-05-11 19:23:40','2013-06-10 19:23:40'),('ca34fbe5f9a075091ad59abf02c259a7',1,'seo_urls_v2_products','rVnLjus2DN33K7qbFqiA2JkkE9xV0XbZB4p2fSHbcqJGljyyPJn060tRcZwXpTy6GmDAQ9IkD0UylailFt+9/PHn7z///dNfX3/78ddfvmYvP3z70nBnzSdb5ZMJa5ru5fsv31TXhPNj4VcQnuZNQUpPUVqW1nSmdkxqJ5SSjek7wVprSNyrx7m1YFa0ipeiEdqxjVRKWNq1mQcVilcA67UWllXSitIZ27Gyd0xJvREVafNJ+Hxw2UdSfqas3Sm+8Np3pv8QbGUca7hUKQsPQN68Fc6KftWB9lqkTNwrv/T6e11BajopVkn998pnk3MDOau43TAnrJVQCDsy+xmyoIaCYZXZalYIZbap738MhBSqpGBrbiu2lW7NOPsQeiW4LpMxyZ6EIyWVcGuu2Fbw1ujkVz4AQQJbUbHSWM/EBPeye+WRrLXl2skyqfwuYSRmaXrLoT5DrWJVpL7gURzStGsFxCpl4g5RZGbQmrPS9hIabmk09HhFUwDpBl3Xio51poEakXrFeGGgeTbc7pIOPqsgR/566n2kw3GfMNK723LHpqxUBsLx3nMLfaFjBXdOJXmXP68BmdtrK4B6DipMc3zXEmnPH4Qha/0bul0LoZipmZNN+jMfhCGBK9mVslW+fHjp2a+4rvxTEn1482ewyO3mZMKAhgPDgtgVxvfXtsvJis+RtKfow3wiPltlrLA0Gvm4Flvopo61vNx4e4p3wv4DHmTZZPIpkx//vyhBuq8kjFilsE7WsuROsNlkQjuPXL2AgM80Zor0vMDkMTtTpM0FBiARO1jxFxjvWwSEVXQ8vDS9chLysmHQCEsJpIPhFthvYIwMU6GopJNGk0GaYn2cZ7jYMegYVha9w0pXglaAUeastgIH3qovHSn8iuHlrORKsdpYmJAlzAMwJ8dhGGEKBkyM+PeKkT71L4HA/nCGCDPMISb0F+5z1MhPaA6mroeP209BN2jAjHC216DvV4B8O68teASOk0p/ABIN0g70poXCM+iF6NYzw2SjpimpaYapxeLp1rKFWt7hi/EhretxfpOrNbhCs2KGCSY10JYxzY3UDDo4jEHSdT7mtDxm9lRemyhi37nPLMSrb7Zv2McgNJOAYdLPihZYRn8OpjBKfBI7x8yeYz0Nz6ucwewdpecc83+TKg1bYUrdApN0ru6k8oOLQ7/UJu7fAtOBRZzPDl02myRQI4kuUWNrDe2P3tcXRzQbjR86cwr+NhJw9IJM6hvyKBA/D98XfV7fwhiFjcLL7x+gJbxgGJw4GPM0GKN9QgYNYkc2aMQY+Wz4itE11m1kS2PHcB+wPtP7L/PNPIpfjvG+gifNLq8E/tQsDb2eA/TUs1GLbSgSaKB0B12eJOPwvb5m7lByPVVXlWAYBzv0tWs5cg/jeZyHC8du1Yl9cqwor+co2Lxt1Q42lxA1Ou5XquxIi4//rZqw5g6vV+vX0f04FBrVVvgHkPTE5xUuTvGON3bmfS1H1GE/JuMDXxbBhuYr4ToJmyfcLdyOFYZ+UbMJ1gyMOvxTNn0D5dbAauX3OHr0yCbDfHQBoqeMbIJpp8Ps9/9kpDHpHO4GCiY7AKTG1mwS3tjzgDB/dzAVXfiwV/mknmYB9ol4+8nCrW5EXevIKRVjL3Jb+nidZWPjqWHNp2sinL3Qp1p+0GtElo39w+iY3NgUEszIMOcdHIT0yjtQWObWsKWE/0RcHsntBL05Zdn4XHSRuRFa1yGZnYAjKG05HGAwWG4rVCxc4WSCohp+74joHDMlVMI8Bkwb28DgnSzusCoPj2NaHBtLC4fSrYEbghXvPVyi6dknm2Iproyq4ZrVFxG2TPETcRf27cMft5XhMX5NsVN5Z/xhA/6k3ZkhxJo2EusZ1nDYaWvuF3A6L2HOP5b122InIq1+hvm5AjlZ7SImsbCBXeFMVsJxfhX7Gqzvcdo89HR/AzO9jngaFoRbcjfHkMXDOkfK277rwPEWnkh/0ISdzV/+1uBH5ICVzTFmyJPKlL3fLekAzTFA4ys0PMQrAQd+f9HcxbI/x3hdopu+gwt+HLvAHjFiB1/ZbaYXSK4r8OELEtafhCNTR+uD0dPnNuECcrgwZkOnJyx3+zMQLG7IhIg4ltY7DCFDweINJDJahGXvtAF6bvlCq8y/sda9CI/N/skdInAjFsvu0tFhQo58Yig5GBqP+p4X/w8=',1,1,'EVAL','2013-05-10 19:19:35','2013-06-09 19:19:35'),('ca34fbe5f9a075091ad59abf02c259a7',2,'seo_urls_v2_products','tVlLUxtHEL7nV+RGUpWt0q4QgsopleSYR6WSs8suk5gDxGVwlY9yFAFCCIQRBr3F0xhZQtgCJCHBn9mZ2f0Xme1eYLA8M1qSVOmk6q97pvv7enpmH0/+PjUz+cXIz7/89N1v3/764Mdvfvj+gTny1ecj0w/nnv35wvjDCoWM6enZkS+//uzxp4wt0XiUG4et6UdS67BnbXe7dn+dnO+zwxSpH7i9Kq0uSCGjHoQWrpxujZZiNJmSWkY8S3f9jF310NIgxz3ay5LkkXO5xpKLhrt+SVf2/z8HY7CCizXS2CHtEin0dREDA6JeBJY9JfUMjSfszoEuQmDAuBfBydX4j6RPaLGrixAYMOFFoP2ie5lz+k2y91YXITDADH0cwjJovuWcNjGslAEmcJ+Wj8jqLi2W7HZKt7Z7IEAyTm7Fic/zFJDDl9oYwREgNGehRdb6tH5AcofaGMERoEzW3XGS7503r5yMlu1mcARomsaXWOovp9HUbiKgOciPZSu0fuGcHHFBaQMER/gC9GLQzTM3VtHGCI4ACeI+MAan++m53V7imeO7ktMdlbW4Zre7bKVgt/s8z9r13QdkgSJZscIWT3QBAtmiYFsFUllhyY5TPwgb7P2lkzphvdfDdX3rP3DhCzRPOhesVqZLMaLvm9a9QCBTXmT2tmt3Uk6/oc1mcATIlBR36eIWu9zjubR7VYPtl/lf/EwjXe2hY/17D6Bkctlw+sdutsEKW1ISW6BJ31Q9S1ggLRqv0lyDXvFhYt00Q6EXU9oc3heHwtzrkcV2hCTi8j2AphgYmiGVZRiFBJaW0mcYeI0+I2qfwMTr6GpTqOyd8YDs5em7Sz4nhrkAyWKNZs+czVU+bkl3G4aKYRkMclKmsTf2VdzNxuQIyA9JpJ1Wh2zMk/WXUtNRSJB9cU6rPbe04zQaOgDkSQQYmtWMQr7E1WgRIELSPsDdsvzfIlq+F9SRALPbabJ6TM/PSWZRty/UhQAeGol0X07iakkjz7PD14wMka8W2E5PU87xht2WF3MUDxC06y5L/UVwivP9JeV2UECSOOQ5xZwY7kLaXVjlY6Ds2hLxSyhgnFyepiqapEawmxZjpLlGN5o8CFldwjRhUeQRoZYUkE6rbnea5NWy7yK9YffThlsq63zgfKPwgQ50dIygABV+btaidQVcEdls0GSMFhXlwvJDE/bVjwyTpm4MiYAI1CZZTtDUO0y8HIcnu4jz9DMMNIrVGlykwZscV4NBN6uaLhHFJAN9DSvi48yQDiaoaBA2XMKigsJufYhqluZsXBDdDVRuDTJCyZuWd3L4fFGeTOMoIsiMj8LsTAztAcsjeJAvETUjmPolhGBymFCGOzsT0R4LaGnbvjiT+xFKccePGfLQt2zS+JkQ6jLgp5hEP9JVTMjqJK5Cjh6s1+3Skc5cEnySUg0uEwMl8zNpRXzODOFDVstBH4an9ExNlxdBo35WpTsb0iOenSLdMENepq/rZJCVCt8tqXTZdoxf0+SZl7FQrNvw3pCLxSQej17TvsroJypeWHhOudMMEy+dRtvubfEp7nZf0n2YIWzFn07LtQwUcCCPm8/wyRLPTPq6Q7fnFYibo3Ivz4cRlUTN0M1x6Nkm1bZY381q0BxCJVmv67TeaGYMMwR1GtwtH8G8bX/YkG/bf/kazLPXkA1y1Wcb+xpNmP6TlugDIR+352H9Cc3HVsx7pin0GVIoKHYp9BK7m1UYCg1DNZKaptAISKKm8Cjom3NFYShIl6Tl9xXTFE4IkqjLPeK7yPV8Lb9Mmv6LBhSQh1bmHF8hfKedkiK6WBzuVDHgm/49O9dwY3kd2f0LLUxVWlvsIstJ5zjtXTNbHU7BBNlW1CsM5HNrW6SZJXs1lonTkqJthGGX/Eprt4/466/T78szEkYW8mtSfXPI1UQAwi4+8Pd7ueMIsJYfEPwKSwpV1qoqbIG4oq3TjNONlgKBEztcu3lHCQQFTvNjixbf8eQrYgCn/XtRssOvSXhUyBE44w9dpzFIkS6RY5CcZ89nZ425qadPp2ZmjUcPZx4bc08mjSfPZ+YmnykWJAidvl6g27sKW8wLPEzQ6jl/njD4CxMnPzu5IGX5FytzDPMkAt3KB7uT0QGjeCTDugJFjKKERCCqThvx3kBQIAbxl3ozechTGgUh8g9cChMQE/IXX3rgVgayUaCAOW7sFdkp06Go6V/khG5mWsoZIQrUwTMT960DAH8G1zTMZIV3PcKfEPQdCy93/JMNy/X5fYN1Oyx7TnZr/F3ebpfcnXn+QsWVMhkK8fOQP538Aw==',1,1,'EVAL','2013-05-11 19:23:39','2013-06-10 19:23:39');
/*!40000 ALTER TABLE `cnseo_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnsessions`
--

DROP TABLE IF EXISTS `cnsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnsessions` (
  `sesskey` varchar(64) NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnsessions`
--

LOCK TABLES `cnsessions` WRITE;
/*!40000 ALTER TABLE `cnsessions` DISABLE KEYS */;
INSERT INTO `cnsessions` (`sesskey`, `expiry`, `value`) VALUES ('2vncmi9kcqibqbogpst7l4gkt7',1368299715,'c2VjdXJpdHlUb2tlbnxzOjMyOiJkZmJmMDAyNTM5ZmUyOWY1YWFmNzA4NGRjNzJkNjIxYiI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjthZG1pbl9pZHxzOjE6IjEiOw=='),('bls51iolggnrgnlqnab6bkcm56',1368300428,'c2VjdXJpdHlUb2tlbnxzOjMyOiJkYTAyOGFkZmIyMjA2Y2E3YTllODMyYjhhM2UwMjIyZCI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjthZG1pbl9pZHxzOjE6IjEiO21lc3NhZ2VUb1N0YWNrfHM6MDoiIjs='),('dhe66un2vqe9gnflp0n4dtgmu2',1368299801,'c2VjdXJpdHlUb2tlbnxzOjMyOiJlMTUyM2I0YmI5ZTliOTUzNTZhNDBiNmFmOWY5MmZiNyI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjthZG1pbl9pZHxzOjE6IjEiOw=='),('gd3f5sc0utm2du135c87tvufu0',1368299924,'c2VjdXJpdHlUb2tlbnxzOjMyOiJhNTVkODlhYTE3YWVkMzcwYTliZjU4ZGM5ZmY5NjI0MSI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjthZG1pbl9pZHxzOjE6IjEiOw=='),('gf9mjvma50fp0d57mu1r7o5p61',1368299857,'c2VjdXJpdHlUb2tlbnxzOjMyOiJhNTVkODlhYTE3YWVkMzcwYTliZjU4ZGM5ZmY5NjI0MSI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjs='),('isgidokhlj38t1i5oigesj60t2',1368299671,'c2VjdXJpdHlUb2tlbnxzOjMyOiJkZmJmMDAyNTM5ZmUyOWY1YWFmNzA4NGRjNzJkNjIxYiI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjs='),('s2g7ub2g657ldpc5ncaqu6pt37',1368299966,'c2VjdXJpdHlUb2tlbnxzOjMyOiJkYTAyOGFkZmIyMjA2Y2E3YTllODMyYjhhM2UwMjIyZCI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjs='),('vmk2t1jsilugit14r61sguc2o1',1368299776,'c2VjdXJpdHlUb2tlbnxzOjMyOiJlMTUyM2I0YmI5ZTliOTUzNTZhNDBiNmFmOWY5MmZiNyI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjs=');
/*!40000 ALTER TABLE `cnsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnspecials`
--

DROP TABLE IF EXISTS `cnspecials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnspecials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `specials_new_products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `specials_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`specials_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`specials_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnspecials`
--

LOCK TABLES `cnspecials` WRITE;
/*!40000 ALTER TABLE `cnspecials` DISABLE KEYS */;
INSERT INTO `cnspecials` (`specials_id`, `products_id`, `specials_new_products_price`, `specials_date_added`, `specials_last_modified`, `expires_date`, `date_status_change`, `status`, `specials_date_available`) VALUES (1,3,39.9900,'2003-12-23 03:18:19','0001-01-01 00:00:00','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(2,5,30.0000,'2003-12-23 03:18:19','0001-01-01 00:00:00','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(3,6,30.0000,'2003-12-23 03:18:19','0001-01-01 00:00:00','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(4,16,29.9900,'2003-12-23 03:18:19','0001-01-01 00:00:00','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(5,41,90.0000,'2003-12-25 19:15:47','2004-09-27 13:33:33','2008-02-21','2013-05-08 21:57:59',0,'0001-01-01'),(6,42,95.0000,'2003-12-25 19:15:57','2004-01-04 13:07:27','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(7,44,90.0000,'2003-12-25 21:54:50',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(8,46,90.0000,'2003-12-25 21:55:01',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(9,53,20.0000,'2003-12-28 23:59:03',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(10,39,75.0000,'2003-12-31 02:03:59','2004-02-21 00:36:40','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(14,74,399.2000,'2004-01-02 15:35:30','2004-01-02 17:38:43','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(27,59,300.0000,'2004-01-03 01:51:50',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(28,76,75.0000,'2004-01-03 23:09:36',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(29,78,112.5000,'2004-01-04 01:12:14',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(31,83,90.0000,'2004-01-04 15:03:07','2004-01-06 10:02:25','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(32,85,90.0000,'2004-01-04 15:19:59','2004-01-06 09:59:59','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(34,88,90.0000,'2004-01-05 00:16:22','2004-01-06 09:59:30','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(35,90,90.0000,'2004-01-05 23:57:20',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(36,94,90.0000,'2004-01-06 00:07:34',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(38,95,90.0000,'2004-01-07 02:39:58',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(39,97,90.0000,'2004-01-07 11:29:03',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(40,100,374.2500,'2004-01-08 14:07:31',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(42,111,90.0000,'2004-01-24 16:14:19',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(44,130,10.0000,'2004-04-28 02:46:44',NULL,'0001-01-01',NULL,1,'0001-01-01'),(45,173,47.5000,'2004-09-24 23:57:05',NULL,'2004-09-28','2004-09-28 18:48:42',0,'0001-01-01'),(46,166,3.0000,'2004-10-03 20:24:53',NULL,'0001-01-01',NULL,1,'0001-01-01'),(47,177,75.0000,'2004-10-05 16:49:33',NULL,'0001-01-01',NULL,1,'0001-01-01'),(48,178,50.0000,'2004-10-05 16:56:46',NULL,'0001-01-01',NULL,1,'0001-01-01'),(50,40,75.0000,'2004-01-08 14:07:31',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01');
/*!40000 ALTER TABLE `cnspecials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cntax_class`
--

DROP TABLE IF EXISTS `cntax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cntax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cntax_class`
--

LOCK TABLES `cntax_class` WRITE;
/*!40000 ALTER TABLE `cntax_class` DISABLE KEYS */;
INSERT INTO `cntax_class` (`tax_class_id`, `tax_class_title`, `tax_class_description`, `last_modified`, `date_added`) VALUES (1,'附加购物税','以下商品含非食物、服务等。',NULL,'2013-05-08 21:35:34');
/*!40000 ALTER TABLE `cntax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cntax_rates`
--

DROP TABLE IF EXISTS `cntax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cntax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_rates_id`),
  KEY `idx_tax_zone_id_zen` (`tax_zone_id`),
  KEY `idx_tax_class_id_zen` (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cntax_rates`
--

LOCK TABLES `cntax_rates` WRITE;
/*!40000 ALTER TABLE `cntax_rates` DISABLE KEYS */;
INSERT INTO `cntax_rates` (`tax_rates_id`, `tax_zone_id`, `tax_class_id`, `tax_priority`, `tax_rate`, `tax_description`, `last_modified`, `date_added`) VALUES (1,1,1,1,3.0000,'演示税率','2013-05-08 21:35:34','2013-05-08 21:35:34');
/*!40000 ALTER TABLE `cntax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cntemplate_select`
--

DROP TABLE IF EXISTS `cntemplate_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cntemplate_select` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_dir` varchar(64) NOT NULL DEFAULT '',
  `template_language` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `idx_tpl_lang_zen` (`template_language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cntemplate_select`
--

LOCK TABLES `cntemplate_select` WRITE;
/*!40000 ALTER TABLE `cntemplate_select` DISABLE KEYS */;
INSERT INTO `cntemplate_select` (`template_id`, `template_dir`, `template_language`) VALUES (1,'pure_red_free','0');
/*!40000 ALTER TABLE `cntemplate_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnupgrade_exceptions`
--

DROP TABLE IF EXISTS `cnupgrade_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnupgrade_exceptions` (
  `upgrade_exception_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `sql_file` varchar(50) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `errordate` datetime DEFAULT '0001-01-01 00:00:00',
  `sqlstatement` text,
  PRIMARY KEY (`upgrade_exception_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnupgrade_exceptions`
--

LOCK TABLES `cnupgrade_exceptions` WRITE;
/*!40000 ALTER TABLE `cnupgrade_exceptions` DISABLE KEYS */;
INSERT INTO `cnupgrade_exceptions` (`upgrade_exception_id`, `sql_file`, `reason`, `errordate`, `sqlstatement`) VALUES (1,'sql/mysql_utf8.sql','无法插入配置值 \"CURRENCIES_TRANSLATIONS\" ，已存在','2013-05-08 21:35:39','INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES (\'Convert currencies for Text emails\', \'CURRENCIES_TRANSLATIONS\', \'\', \'What currency conversions do you need for Text emails?<br />Example = &amp;pound;,&pound;:&amp;euro;,&euro;\', 12, 120, NULL, \'2003-11-21 00:00:00\', NULL, \'zen_cfg_textarea_small(\');');
/*!40000 ALTER TABLE `cnupgrade_exceptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnwhos_online`
--

DROP TABLE IF EXISTS `cnwhos_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnwhos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL DEFAULT '',
  `session_id` varchar(128) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `time_entry` varchar(14) NOT NULL DEFAULT '',
  `time_last_click` varchar(14) NOT NULL DEFAULT '',
  `last_page_url` varchar(255) NOT NULL DEFAULT '',
  `host_address` text NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  KEY `idx_ip_address_zen` (`ip_address`),
  KEY `idx_session_id_zen` (`session_id`),
  KEY `idx_customer_id_zen` (`customer_id`),
  KEY `idx_time_entry_zen` (`time_entry`),
  KEY `idx_time_last_click_zen` (`time_last_click`),
  KEY `idx_last_page_url_zen` (`last_page_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnwhos_online`
--

LOCK TABLES `cnwhos_online` WRITE;
/*!40000 ALTER TABLE `cnwhos_online` DISABLE KEYS */;
INSERT INTO `cnwhos_online` (`customer_id`, `full_name`, `session_id`, `ip_address`, `time_entry`, `time_last_click`, `last_page_url`, `host_address`, `user_agent`) VALUES (0,'&yen;Guest','ov5c828oare8iaimsneuddo5k7','127.0.0.1','1368292871','1368292890','/zencart/index.php?main_page=product_info&cPath=1&products_id=180','OFFICE_IP_TO_HOST_ADDRESS','Mozilla/5.0 (Windows NT 5.1; rv:2.0) Gecko/20100101 Firefox/4.0 QQDownload/1.7');
/*!40000 ALTER TABLE `cnwhos_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnzones`
--

DROP TABLE IF EXISTS `cnzones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnzones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone_id`),
  KEY `idx_zone_country_id_zen` (`zone_country_id`),
  KEY `idx_zone_code_zen` (`zone_code`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnzones`
--

LOCK TABLES `cnzones` WRITE;
/*!40000 ALTER TABLE `cnzones` DISABLE KEYS */;
INSERT INTO `cnzones` (`zone_id`, `zone_country_id`, `zone_code`, `zone_name`) VALUES (1,223,'AL','Alabama'),(2,223,'AK','Alaska'),(3,223,'AS','American Samoa'),(4,223,'AZ','Arizona'),(5,223,'AR','Arkansas'),(7,223,'AA','Armed Forces Americas'),(9,223,'AE','Armed Forces Europe'),(11,223,'AP','Armed Forces Pacific'),(12,223,'CA','California'),(13,223,'CO','Colorado'),(14,223,'CT','Connecticut'),(15,223,'DE','Delaware'),(16,223,'DC','District of Columbia'),(17,223,'FM','Federated States Of Micronesia'),(18,223,'FL','Florida'),(19,223,'GA','Georgia'),(20,223,'GU','Guam'),(21,223,'HI','Hawaii'),(22,223,'ID','Idaho'),(23,223,'IL','Illinois'),(24,223,'IN','Indiana'),(25,223,'IA','Iowa'),(26,223,'KS','Kansas'),(27,223,'KY','Kentucky'),(28,223,'LA','Louisiana'),(29,223,'ME','Maine'),(30,223,'MH','Marshall Islands'),(31,223,'MD','Maryland'),(32,223,'MA','Massachusetts'),(33,223,'MI','Michigan'),(34,223,'MN','Minnesota'),(35,223,'MS','Mississippi'),(36,223,'MO','Missouri'),(37,223,'MT','Montana'),(38,223,'NE','Nebraska'),(39,223,'NV','Nevada'),(40,223,'NH','New Hampshire'),(41,223,'NJ','New Jersey'),(42,223,'NM','New Mexico'),(43,223,'NY','New York'),(44,223,'NC','North Carolina'),(45,223,'ND','North Dakota'),(46,223,'MP','Northern Mariana Islands'),(47,223,'OH','Ohio'),(48,223,'OK','Oklahoma'),(49,223,'OR','Oregon'),(50,163,'PW','Palau'),(51,223,'PA','Pennsylvania'),(52,223,'PR','Puerto Rico'),(53,223,'RI','Rhode Island'),(54,223,'SC','South Carolina'),(55,223,'SD','South Dakota'),(56,223,'TN','Tennessee'),(57,223,'TX','Texas'),(58,223,'UT','Utah'),(59,223,'VT','Vermont'),(60,223,'VI','Virgin Islands'),(61,223,'VA','Virginia'),(62,223,'WA','Washington'),(63,223,'WV','West Virginia'),(64,223,'WI','Wisconsin'),(65,223,'WY','Wyoming'),(66,38,'AB','Alberta'),(67,38,'BC','British Columbia'),(68,38,'MB','Manitoba'),(69,38,'NL','Newfoundland'),(70,38,'NB','New Brunswick'),(71,38,'NS','Nova Scotia'),(72,38,'NT','Northwest Territories'),(73,38,'NU','Nunavut'),(74,38,'ON','Ontario'),(75,38,'PE','Prince Edward Island'),(76,38,'QC','Quebec'),(77,38,'SK','Saskatchewan'),(78,38,'YT','Yukon Territory'),(79,81,'NDS','Niedersachsen'),(80,81,'BAW','Baden-Württemberg'),(81,81,'BAY','Bayern'),(82,81,'BER','Berlin'),(83,81,'BRG','Brandenburg'),(84,81,'BRE','Bremen'),(85,81,'HAM','Hamburg'),(86,81,'HES','Hessen'),(87,81,'MEC','Mecklenburg-Vorpommern'),(88,81,'NRW','Nordrhein-Westfalen'),(89,81,'RHE','Rheinland-Pfalz'),(90,81,'SAR','Saarland'),(91,81,'SAS','Sachsen'),(92,81,'SAC','Sachsen-Anhalt'),(93,81,'SCN','Schleswig-Holstein'),(94,81,'THE','Thüringen'),(95,14,'WI','Wien'),(96,14,'NO','Niederösterreich'),(97,14,'OO','Oberösterreich'),(98,14,'SB','Salzburg'),(99,14,'KN','Kärnten'),(100,14,'ST','Steiermark'),(101,14,'TI','Tirol'),(102,14,'BL','Burgenland'),(103,14,'VB','Voralberg'),(104,204,'AG','Aargau'),(105,204,'AI','Appenzell Innerrhoden'),(106,204,'AR','Appenzell Ausserrhoden'),(107,204,'BE','Bern'),(108,204,'BL','Basel-Landschaft'),(109,204,'BS','Basel-Stadt'),(110,204,'FR','Freiburg'),(111,204,'GE','Genf'),(112,204,'GL','Glarus'),(113,204,'JU','Graubnden'),(114,204,'JU','Jura'),(115,204,'LU','Luzern'),(116,204,'NE','Neuenburg'),(117,204,'NW','Nidwalden'),(118,204,'OW','Obwalden'),(119,204,'SG','St. Gallen'),(120,204,'SH','Schaffhausen'),(121,204,'SO','Solothurn'),(122,204,'SZ','Schwyz'),(123,204,'TG','Thurgau'),(124,204,'TI','Tessin'),(125,204,'UR','Uri'),(126,204,'VD','Waadt'),(127,204,'VS','Wallis'),(128,204,'ZG','Zug'),(129,204,'ZH','Zürich'),(130,44,'安徽','安徽'),(131,44,'北京','北京'),(132,44,'重庆','重庆'),(133,44,'福建','福建'),(134,44,'甘肃','甘肃'),(135,44,'广东','广东'),(136,44,'广西','广西'),(137,44,'贵州','贵州'),(138,44,'海南','海南'),(139,44,'河北','河北'),(140,44,'黑龙江','黑龙江'),(141,44,'河南','河南'),(142,44,'香港','香港'),(143,44,'湖北','湖北'),(144,44,'湖南','湖南'),(145,44,'江苏','江苏'),(146,44,'江西','江西'),(147,44,'吉林','吉林'),(148,44,'辽宁','辽宁'),(149,44,'澳门','澳门'),(150,44,'内蒙古','内蒙古'),(151,44,'宁夏','宁夏'),(152,44,'青海','青海'),(153,44,'山西','山西'),(154,44,'陕西','陕西'),(155,44,'山东','山东'),(156,44,'上海','上海'),(157,44,'四川','四川'),(158,44,'台湾','台湾'),(159,44,'天津','天津'),(160,44,'新疆','新疆'),(161,44,'西藏','西藏'),(162,44,'云南','云南'),(163,44,'浙江','浙江'),(164,195,'A Coruña','A Coruña'),(165,195,'Álava','Álava'),(166,195,'Albacete','Albacete'),(167,195,'Alicante','Alicante'),(168,195,'Almería','Almería'),(169,195,'Asturias','Asturias'),(170,195,'Ávila','Ávila'),(171,195,'Badajoz','Badajoz'),(172,195,'Baleares','Baleares'),(173,195,'Barcelona','Barcelona'),(174,195,'Burgos','Burgos'),(175,195,'Cáceres','Cáceres'),(176,195,'Cádiz','Cádiz'),(177,195,'Cantabria','Cantabria'),(178,195,'Castellón','Castellón'),(179,195,'Ceuta','Ceuta'),(180,195,'Ciudad Real','Ciudad Real'),(181,195,'Córdoba','Córdoba'),(182,195,'Cuenca','Cuenca'),(183,195,'Girona','Girona'),(184,195,'Granada','Granada'),(185,195,'Guadalajara','Guadalajara'),(186,195,'Guipúzcoa','Guipúzcoa'),(187,195,'Huelva','Huelva'),(188,195,'Huesca','Huesca'),(189,195,'Jaén','Jaén'),(190,195,'La Rioja','La Rioja'),(191,195,'Las Palmas','Las Palmas'),(192,195,'León','León'),(193,195,'Lérida','Lérida'),(194,195,'Lugo','Lugo'),(195,195,'Madrid','Madrid'),(196,195,'Málaga','Málaga'),(197,195,'Melilla','Melilla'),(198,195,'Murcia','Murcia'),(199,195,'Navarra','Navarra'),(200,195,'Ourense','Ourense'),(201,195,'Palencia','Palencia'),(202,195,'Pontevedra','Pontevedra'),(203,195,'Salamanca','Salamanca'),(204,195,'Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(205,195,'Segovia','Segovia'),(206,195,'Sevilla','Sevilla'),(207,195,'Soria','Soria'),(208,195,'Tarragona','Tarragona'),(209,195,'Teruel','Teruel'),(210,195,'Toledo','Toledo'),(211,195,'Valencia','Valencia'),(212,195,'Valladolid','Valladolid'),(213,195,'Vizcaya','Vizcaya'),(214,195,'Zamora','Zamora'),(215,195,'Zaragoza','Zaragoza'),(216,13,'ACT','Australian Capital Territory'),(217,13,'NSW','New South Wales'),(218,13,'NT','Northern Territory'),(219,13,'QLD','Queensland'),(220,13,'SA','South Australia'),(221,13,'TAS','Tasmania'),(222,13,'VIC','Victoria'),(223,13,'WA','Western Australia'),(224,105,'AG','Agrigento'),(225,105,'AL','Alessandria'),(226,105,'AN','Ancona'),(227,105,'AO','Aosta'),(228,105,'AR','Arezzo'),(229,105,'AP','Ascoli Piceno'),(230,105,'AT','Asti'),(231,105,'AV','Avellino'),(232,105,'BA','Bari'),(233,105,'BT','Barletta Andria Trani'),(234,105,'BL','Belluno'),(235,105,'BN','Benevento'),(236,105,'BG','Bergamo'),(237,105,'BI','Biella'),(238,105,'BO','Bologna'),(239,105,'BZ','Bolzano'),(240,105,'BS','Brescia'),(241,105,'BR','Brindisi'),(242,105,'CA','Cagliari'),(243,105,'CL','Caltanissetta'),(244,105,'CB','Campobasso'),(245,105,'CI','Carbonia-Iglesias'),(246,105,'CE','Caserta'),(247,105,'CT','Catania'),(248,105,'CZ','Catanzaro'),(249,105,'CH','Chieti'),(250,105,'CO','Como'),(251,105,'CS','Cosenza'),(252,105,'CR','Cremona'),(253,105,'KR','Crotone'),(254,105,'CN','Cuneo'),(255,105,'EN','Enna'),(256,105,'FM','Fermo'),(257,105,'FE','Ferrara'),(258,105,'FI','Firenze'),(259,105,'FG','Foggia'),(260,105,'FC','Forlì Cesena'),(261,105,'FR','Frosinone'),(262,105,'GE','Genova'),(263,105,'GO','Gorizia'),(264,105,'GR','Grosseto'),(265,105,'IM','Imperia'),(266,105,'IS','Isernia'),(267,105,'AQ','Aquila'),(268,105,'SP','La Spezia'),(269,105,'LT','Latina'),(270,105,'LE','Lecce'),(271,105,'LC','Lecco'),(272,105,'LI','Livorno'),(273,105,'LO','Lodi'),(274,105,'LU','Lucca'),(275,105,'MC','Macerata'),(276,105,'MN','Mantova'),(277,105,'MS','Massa Carrara'),(278,105,'MT','Matera'),(279,105,'VS','Medio Campidano'),(280,105,'ME','Messina'),(281,105,'MI','Milano'),(282,105,'MO','Modena'),(283,105,'MB','Monza e Brianza'),(284,105,'NA','Napoli'),(285,105,'NO','Novara'),(286,105,'NU','Nuoro'),(287,105,'OG','Ogliastra'),(288,105,'OT','Olbia-Tempio'),(289,105,'OR','Oristano'),(290,105,'PD','Padova'),(291,105,'PA','Palermo'),(292,105,'PR','Parma'),(293,105,'PG','Perugia'),(294,105,'PV','Pavia'),(295,105,'PU','Pesaro Urbino'),(296,105,'PE','Pescara'),(297,105,'PC','Piacenza'),(298,105,'PI','Pisa'),(299,105,'PT','Pistoia'),(300,105,'PN','Pordenone'),(301,105,'PZ','Potenza'),(302,105,'PO','Prato'),(303,105,'RG','Ragusa'),(304,105,'RA','Ravenna'),(305,105,'RC','Reggio Calabria'),(306,105,'RE','Reggio Emilia'),(307,105,'RI','Rieti'),(308,105,'RN','Rimini'),(309,105,'RM','Roma'),(310,105,'RO','Rovigo'),(311,105,'SA','Salerno'),(312,105,'SS','Sassari'),(313,105,'SV','Savona'),(314,105,'SI','Siena'),(315,105,'SR','Siracusa'),(316,105,'SO','Sondrio'),(317,105,'TA','Taranto'),(318,105,'TE','Teramo'),(319,105,'TR','Terni'),(320,105,'TO','Torino'),(321,105,'TP','Trapani'),(322,105,'TN','Trento'),(323,105,'TV','Treviso'),(324,105,'TS','Trieste'),(325,105,'UD','Udine'),(326,105,'VA','Varese'),(327,105,'VE','Venezia'),(328,105,'VB','Verbania'),(329,105,'VC','Vercelli'),(330,105,'VR','Verona'),(331,105,'VV','Vibo Valentia'),(332,105,'VI','Vicenza'),(333,105,'VT','Viterbo');
/*!40000 ALTER TABLE `cnzones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnzones_to_geo_zones`
--

DROP TABLE IF EXISTS `cnzones_to_geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnzones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_zen` (`geo_zone_id`,`zone_country_id`,`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnzones_to_geo_zones`
--

LOCK TABLES `cnzones_to_geo_zones` WRITE;
/*!40000 ALTER TABLE `cnzones_to_geo_zones` DISABLE KEYS */;
INSERT INTO `cnzones_to_geo_zones` (`association_id`, `zone_country_id`, `zone_id`, `geo_zone_id`, `last_modified`, `date_added`) VALUES (1,44,67,1,NULL,'2013-05-08 21:35:34');
/*!40000 ALTER TABLE `cnzones_to_geo_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jmw_products_categories`
--

DROP TABLE IF EXISTS `jmw_products_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jmw_products_categories` (
  `jmw_id` int(10) NOT NULL AUTO_INCREMENT,
  `categoryId` int(10) NOT NULL,
  `parenId` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cnName` varchar(255) NOT NULL,
  `sortOrder` int(10) NOT NULL,
  PRIMARY KEY (`jmw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jmw_products_categories`
--

LOCK TABLES `jmw_products_categories` WRITE;
/*!40000 ALTER TABLE `jmw_products_categories` DISABLE KEYS */;
INSERT INTO `jmw_products_categories` (`jmw_id`, `categoryId`, `parenId`, `name`, `cnName`, `sortOrder`) VALUES (1,10822,0,'Consumer Electronics','消费电子',1),(2,10903,0,'MIC-Phone & Accessories','平板/手机&配件',2),(3,10940,0,'Automobiles','车载周边',3),(4,10973,0,'Apparals & Accessories','服装&配饰',4),(5,11078,0,'Home & Garden','家居与园艺',5),(6,11177,0,'Jewelry & Watches','珠宝与手表',6),(7,11245,0,'Health & Beauty','健康与美容',7),(8,11441,0,'Computers & Networking','计算机&网络设备',8),(9,11509,0,'Toys & Hobbies','玩具&游戏',9),(10,11538,0,'Outdoors & Sports and Exercises','户外&运动及健身',10),(11,11617,0,'Cameras & Camcorders','数码相机&摄像机配件',11),(12,11635,0,'Video Games & Accessories','电子游戏 & 配件',12),(13,11647,0,'Bags-Shoes & Accessories','箱包、鞋帽&配件',13),(14,11510,11509,'RC-Remote Control Toys','遥控玩具',0),(15,11539,11538,'Outdoor Survival Gadgets','户外求生小工具/弹弓',0),(16,10974,10973,'Wedding Apparel & Accessories','婚礼服饰',0),(17,11442,11441,'Computer Peripherals','电脑配件',0),(18,11636,11635,'Microsoft Xbox360 Accessories','微软XBOX360 配件',0),(19,10823,10822,'DVD & Home Theater','DVD及家庭影院',0),(20,10904,10903,'Apple Accessories','苹果配件',0),(21,10941,10940,'Car Electronics','车载电子',0),(22,11618,11617,'Cameras','数码相机',0),(23,11246,11245,'Makeup','化妆品',0),(24,11079,11078,'Heating','气温调节',0),(25,11178,11177,'Watches','表',0),(26,11637,11635,'Sony PSP Accessories','索尼PSP 配件',1),(27,10983,10973,'Women\'s Clothing','女士服装',1),(28,11540,11538,'Camping & Hiking','露营 & 旅行-Camping & Hiking',1),(29,11818,11647,'Women\'s Handbags & Bags','女士手提包和手袋',1),(30,11619,11617,'Camcorders','数码摄像机',1),(31,11620,11617,'Camera Accessories','相机配件',2),(32,11828,11647,'Men\'s Bags & Wallets','男士包&钱包',2),(33,11033,10973,'Men\'s Clothing','男士服装',2),(34,11638,11635,'Sony PlayStation Accessories','索尼PlayStation配件',2),(35,11834,11647,'Special Purpose Bags','功能性箱包',3),(36,11639,11635,'Nintendo Wii Accessories','任天堂Wii配件',3),(37,11002,10973,'Baby & Toddler Clothing','婴幼儿服装',3),(38,11012,10973,'Girls-Clothing','女孩服装',4),(39,11640,11635,'Nintendo DS Accessories','任天堂DS配件',4),(40,11652,11647,'Women\'s Shoes','女鞋',4),(41,10828,10822,'Gadget','小工具',4),(42,11641,11635,'Game Cables-Chargers','游戏机线材/充电器',5),(43,11024,10973,'Boys-Clothing','男孩服装',5),(44,11085,11078,'Plumbing & Fixtures','水暖设备',5),(45,11516,11509,'Education & Recreation Toys','益智休闲玩具',5),(46,11648,11647,'Men\'s Shoes','男鞋',5),(47,11860,11647,'Baby & kids Shoes','婴童鞋类',6),(48,11642,11635,'Controllers','手柄',6),(49,11871,11647,'Fashion Accessories','时尚配件',7),(50,11643,11635,'Wheels - Joysticks','方向盘',7),(51,11548,11538,'LED Flashlights','户外LED手电',8),(52,11644,11635,'Otehrs','游戏摇杆',8),(53,11658,11647,'Other','其他',8),(54,11452,11441,'Laptop Peripherals','笔记本配件',9),(55,11645,11635,'Others','其它游戏配件',9),(56,11092,11078,'Building & Hardware','建筑五金',11),(57,11093,11078,'Electric Appliances','家用电器',12),(58,10954,10940,'Car Rear View System','倒车后视系统',12),(59,10955,10940,'Car Accessories','汽车配件',13),(60,11525,11509,'Novelty Toys','新奇特',13),(61,11094,11078,'Party Supplies','派对用品',13),(62,11554,11538,'Bicycle Accessories','自行车运动配件',13),(63,11254,11245,'Skin Care','护肤品',13),(64,11184,11177,'Fashion Jewelry','时尚珠宝饰物',14),(65,11255,11245,'Tattoos & Body Art','纹身/人体艺术',14),(66,11634,11617,'Wholesales','批发产品',15),(67,11646,11635,'HandheldCon','掌上游戏机',15),(68,11530,11509,'Models & Figures','模型/玩偶',17),(69,11462,11441,'Keyboard & Accessories','键盘&附件',18),(70,11261,11245,'Health Care','卫生保健',19),(71,10907,10903,'Other Phone Accessories','其他手机配件',20),(72,10962,10940,'Interior Accessories','汽车内饰',20),(73,11536,11509,'Plush Toys','毛绒玩具',22),(74,11565,11538,'Fishing','钓鱼装备',23),(75,10848,10822,'Audio&Video Cable','音频/视频线',23),(76,11266,11245,'Hair Care','头发护理',23),(77,11195,11177,'Fine Jewelry','精美珠宝饰物',24),(78,11469,11441,'Mice & Accessories','鼠标&附件',24),(79,10853,10822,'Laser Pen','激光笔',27),(80,10970,10940,'Exterior Accessories','汽车外饰',27),(81,11272,11245,'Nail Care & Polish','指甲护理及磨光',28),(82,11474,11441,'Networking & Communicatings','网络&通讯设备',28),(83,11110,11078,'Wedding Supplies','婚礼用品',28),(84,10917,10903,'MID Accessories','平板配件',29),(85,11111,11078,'Bath','浴室用品',29),(86,11572,11538,'Military Gears','军品户外',29),(87,11203,11177,'Handcrafted','手工制品/DIY珠宝饰物',31),(88,10859,10822,'Battery & Charger','电池及充电器',32),(89,11204,11177,'Jewelry Boxes','珠宝盒/箱子',32),(90,11481,11441,'Storages','存储设备',34),(91,11118,11078,'Kitchen,Dining & Bar','厨具及餐具',35),(92,11208,11177,'Jewelry Design & Repair','饰品设计及修补工具',35),(93,11281,11245,'Massage & Weight Management','按摩/瘦身用品',36),(94,10865,10822,'MP3-MP4 Media Player','MP3/MP4播放器',37),(95,10928,10903,'MID,UMPC & Notebook','平板&上网本',39),(96,11213,11177,'Men\'s Jewelry','男士珠宝饰物',39),(97,11489,11441,'Gadgets','USB周边',41),(98,11288,11245,'Body　Care','身体护理',42),(99,11289,11245,'Shaving & Hair Removal','剃须及脱毛',43),(100,11218,11177,'Loose Beads','散珠',43),(101,10933,10903,'Cell Phones','手机',43),(102,11588,11538,'Yoga','瑜伽',44),(103,11589,11538,'Golf','高尔夫',45),(104,11495,11441,'Computer Components','电脑组件',46),(105,11131,11078,'Home Decor','室内装饰',47),(106,10939,10903,'Bluetooth Accessories','蓝牙配件',48),(107,10877,10822,'LED Electronics','LED电子',48),(108,11594,11538,'Binoculars & Monoculars','望远镜/夜视仪',49),(109,11295,11245,'Oral Care','口腔护理',52),(110,11137,11078,'Window Treatments','窗户用品',52),(111,11598,11538,'Swimming','水上运动',52),(112,11138,11078,'Bedding','床上用品',53),(113,11139,11078,'Housekeeping & Organization','家务与整理',54),(114,10885,10822,'Security & Surveillance','安防/监控',55),(115,11299,11245,'Vision Care','视力保健',55),(116,11602,11538,'Exercises & Fitness','健身器具',55),(117,11232,11177,'Engagement & Wedding','婚庆饰品',56),(118,11507,11441,'Wholesale Items','批发产品',57),(119,11144,11078,'Rugs & Carpets','毛毯 地毯',59),(120,11304,11245,'Natural & Homeopathic Remedies','中草药/顺势疗法',59),(121,11305,11245,'Wholesale Lots','批发',60),(122,11145,11078,'Garden & Outdoor Living','庭院/花园/户外生活用品',60),(123,11237,11177,'Ethnic,Regional & Tribal','民族/地区/部落',60),(124,11238,11177,'Loose Diamonds & Gemstones','散钻和宝石',61),(125,11146,11078,'Pet Supplies','宠物用品',61),(126,11306,11245,'Other','其他',61),(127,11243,11177,'Wholesale Lots','批发',65),(128,11613,11538,'Boxing','拳击',65),(129,11614,11538,'Sport Safety','运动护具',66),(130,11244,11177,'Other','其他',66),(131,10898,10822,'Headphone','耳机',67),(132,11615,11538,'Team Games','球类运动',67),(133,11616,11538,'Wholesales','批发产品',68),(134,11151,11078,'Mosquito Killers','防蚊虫、防蛀用品',71),(135,11152,11078,'Tools','工具',72),(136,11158,11078,'Baby','婴儿用品',77),(137,11165,11078,'Crafts','工艺品',83),(138,11171,11078,'Office & School Supplies','文具',88),(139,11175,11078,'Mixed Items & Lots','批发',91),(140,11176,11078,'Other','其他',92),(141,11050,10973,'Unisex','中性服装',108),(142,11074,10973,'Costumes, Reenactment, Theater','舞台&角色扮演服装',129),(143,11075,10973,'Traditional Chinese & Handmade','特色服装，手工服饰',130),(144,11077,10973,'Other','其他',132),(145,11817,11245,'Wigs, Extensions & Accessories','假发，假发配件',0);
/*!40000 ALTER TABLE `jmw_products_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-12  3:12:21
