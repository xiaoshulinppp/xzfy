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
-- Table structure for table `evidenceattachment`
--

DROP TABLE IF EXISTS `evidenceattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evidenceattachment` (
  `id` double NOT NULL,
  `xzfyid` varchar(30) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `filepath` varchar(200) DEFAULT NULL,
  `realfilepath` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidenceattachment`
--

LOCK TABLES `evidenceattachment` WRITE;
/*!40000 ALTER TABLE `evidenceattachment` DISABLE KEYS */;
INSERT INTO `evidenceattachment` VALUES (5,'201310181054378192567','Chrysanthemum.jpg','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/1382075770078Chrysanthemum.jpg','../uploadfiles/Evidence/attachment/1382075770078Chrysanthemum.jpg'),(6,'201310181054378192567','Desert.jpg','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/1382088397131Desert.jpg','../uploadfiles/Evidence/attachment/1382088397131Desert.jpg'),(7,'201310181054378192567','Chrysanthemum.jpg','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/1382088397140Chrysanthemum.jpg','../uploadfiles/Evidence/attachment/1382088397140Chrysanthemum.jpg'),(10,'201310112158187063739','周报.xlsx','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/1382695835892周报.xlsx','../uploadfiles/Evidence/attachment/1382695835892周报.xlsx'),(1,'201310181054378192567','Desert.jpg','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/1382073903540Desert.jpg','../uploadfiles/Evidence/attachment/1382073903540Desert.jpg'),(2,'201310181054378192567','Chrysanthemum.jpg','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/1382073934270Chrysanthemum.jpg','../uploadfiles/Evidence/attachment/1382073934270Chrysanthemum.jpg'),(3,'201310181054378192567','Chrysanthemum.jpg','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/1382073934278Chrysanthemum.jpg','../uploadfiles/Evidence/attachment/1382073934278Chrysanthemum.jpg'),(4,'201310181054378192567','Chrysanthemum.jpg','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/1382074899843Chrysanthemum.jpg','../uploadfiles/Evidence/attachment/1382074899843Chrysanthemum.jpg'),(11,'201310112158187063739','周报.xlsx','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/1382696133999周报.xlsx','../uploadfiles/Evidence/attachment/1382696133999周报.xlsx'),(12,'201310112158187063739','3b292df5e0fe9925c8f1799534a85edf8cb17171.jpg','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/13826961340353b292df5e0fe9925c8f1799534a85edf8cb17171.jpg','../uploadfiles/Evidence/attachment/13826961340353b292df5e0fe9925c8f1799534a85edf8cb17171.jpg'),(8,'201310181054378192567','48540923dd54564ee263e30cb2de9c82d1584f84.jpg','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/138216736465648540923dd54564ee263e30cb2de9c82d1584f84.jpg','../uploadfiles/Evidence/attachment/138216736465648540923dd54564ee263e30cb2de9c82d1584f84.jpg'),(9,'201310181054378192567','3b292df5e0fe9925c8f1799534a85edf8cb17171.jpg','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Evidence/attachment/13821673646833b292df5e0fe9925c8f1799534a85edf8cb17171.jpg','../uploadfiles/Evidence/attachment/13821673646833b292df5e0fe9925c8f1799534a85edf8cb17171.jpg');
/*!40000 ALTER TABLE `evidenceattachment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 12:28:26
