CREATE DATABASE  IF NOT EXISTS `zxfy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `zxfy`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: zxfy
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `t_sys_field_relation`
--

DROP TABLE IF EXISTS `t_sys_field_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sys_field_relation` (
  `table_host` varchar(50) DEFAULT NULL,
  `column_host` varchar(50) DEFAULT NULL,
  `table_related` varchar(50) DEFAULT NULL,
  `column_related` varchar(50) DEFAULT NULL,
  `type` decimal(10,0) DEFAULT NULL,
  `midtable` varchar(50) DEFAULT NULL,
  `midtable_host` varchar(50) DEFAULT NULL,
  `midtable_related` varchar(50) DEFAULT NULL,
  `id` decimal(11,0) NOT NULL,
  `name_host` varchar(50) DEFAULT NULL,
  `name_related` varchar(50) DEFAULT NULL,
  `inverse` varchar(2) DEFAULT NULL,
  `listtype` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_field_relation`
--

LOCK TABLES `t_sys_field_relation` WRITE;
/*!40000 ALTER TABLE `t_sys_field_relation` DISABLE KEYS */;
INSERT INTO `t_sys_field_relation` VALUES ('t_dict','dict_id','t_dict_item','dictitem_fid',1,NULL,NULL,NULL,1,NULL,NULL,'1',NULL),('test_person','test_id','test_addresst','test_personid',1,NULL,NULL,NULL,2,NULL,NULL,'1','normal'),('test_person','test_id','test_courset','test_id',3,'test_person_course','test_personid','test_courseid',3,NULL,NULL,'1','normal'),('test_person','test_id','test_testnamen','test_id',0,NULL,NULL,NULL,4,NULL,NULL,'1',NULL),('test_ordercar','order_id','test_orderitem','orderitem_orderId',1,NULL,NULL,NULL,6,NULL,NULL,'1','normal'),('t_dict','dict_id','t_dict_item','dictitem_fid',1,NULL,NULL,NULL,1,NULL,NULL,'1',NULL),('test_person','test_id','test_addresst','test_personid',1,NULL,NULL,NULL,2,NULL,NULL,'1','normal'),('test_person','test_id','test_courset','test_id',3,'test_person_course','test_personid','test_courseid',3,NULL,NULL,'1','normal'),('test_person','test_id','test_testnamen','test_id',0,NULL,NULL,NULL,4,NULL,NULL,'1',NULL),('test_ordercar','order_id','test_orderitem','orderitem_orderId',1,NULL,NULL,NULL,6,NULL,NULL,'1','normal'),('t_dict','dict_id','t_dict_item','dictitem_fid',1,NULL,NULL,NULL,1,NULL,NULL,'1',NULL),('test_person','test_id','test_addresst','test_personid',1,NULL,NULL,NULL,2,NULL,NULL,'1','normal'),('test_person','test_id','test_courset','test_id',3,'test_person_course','test_personid','test_courseid',3,NULL,NULL,'1','normal'),('test_person','test_id','test_testnamen','test_id',0,NULL,NULL,NULL,4,NULL,NULL,'1',NULL),('test_ordercar','order_id','test_orderitem','orderitem_orderId',1,NULL,NULL,NULL,6,NULL,NULL,'1','normal'),('USER_TEST','ID','USER_LOG_TEST','USER_ID',1,NULL,NULL,NULL,7,NULL,NULL,'1',NULL);
/*!40000 ALTER TABLE `t_sys_field_relation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 12:28:27
