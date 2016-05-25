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
-- Table structure for table `xzcj_app`
--

DROP TABLE IF EXISTS `xzcj_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xzcj_app` (
  `id` double DEFAULT NULL,
  `xzcj_id` varchar(100) DEFAULT NULL,
  `proxytype` varchar(100) DEFAULT NULL,
  `app_name` varchar(100) DEFAULT NULL,
  `sexy` varchar(100) DEFAULT NULL,
  `app_id` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mail_address` varchar(100) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `isdeputy` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `islink` varchar(100) DEFAULT NULL,
  `deputy_name` varchar(100) DEFAULT NULL,
  `deputy_type` varchar(100) DEFAULT NULL,
  `other_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xzcj_app`
--

LOCK TABLES `xzcj_app` WRITE;
/*!40000 ALTER TABLE `xzcj_app` DISABLE KEYS */;
INSERT INTO `xzcj_app` VALUES (2,'201407071145025938994',NULL,'南京康是福科技实业有限公司','1',NULL,'南京汉中门大街31号华园23号','南京汉中门大街31号华园23号','025-86511550','13912942001',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'201407071145025938994',NULL,'蒋贵荣','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `xzcj_app` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 12:28:29
