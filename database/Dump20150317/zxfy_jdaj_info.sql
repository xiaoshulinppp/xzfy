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
-- Table structure for table `jdaj_info`
--

DROP TABLE IF EXISTS `jdaj_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jdaj_info` (
  `id` varchar(50) NOT NULL,
  `receivedate` varchar(50) DEFAULT NULL,
  `documentnumber` varchar(5) DEFAULT NULL,
  `method` varchar(20) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `proposal` varchar(100) DEFAULT NULL,
  `undertaker` varchar(10) DEFAULT NULL,
  `filepath` varchar(200) DEFAULT NULL,
  `realfilepath` varchar(200) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `appnames` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jdaj_info`
--

LOCK TABLES `jdaj_info` WRITE;
/*!40000 ALTER TABLE `jdaj_info` DISABLE KEYS */;
INSERT INTO `jdaj_info` VALUES ('20131012150349685441','2013-10-12','23','1','反映内容','建议','庞磊','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Jdaj/attachment/1381561532846Desert.jpg','../uploadfiles/Jdaj/attachment/1381561532846Desert.jpg','Desert.jpg','0','小李，小刘'),('20131012150113497277','2013-10-12','32','1','反映内容','建议','庞磊','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Jdaj/attachment/1381561415432Chrysanthemum.jpg','../uploadfiles/Jdaj/attachment/1381561415432Chrysanthemum.jpg','Chrysanthemum.jpg','0','小红，小明');
/*!40000 ALTER TABLE `jdaj_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 12:28:21
