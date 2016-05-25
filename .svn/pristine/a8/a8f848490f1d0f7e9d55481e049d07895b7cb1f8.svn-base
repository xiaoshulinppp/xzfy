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
-- Table structure for table `t_style`
--

DROP TABLE IF EXISTS `t_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_style` (
  `style_id` decimal(10,0) NOT NULL,
  `style_name` varchar(50) NOT NULL,
  `style_csspath` varchar(50) NOT NULL,
  `style_framepath` varchar(50) NOT NULL,
  `style_imagepath` varchar(50) NOT NULL,
  `style_preimage` varchar(50) NOT NULL,
  `style_prefile` varchar(50) NOT NULL,
  `style_memo` varchar(50) DEFAULT NULL,
  `style_jspath` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_style`
--

LOCK TABLES `t_style` WRITE;
/*!40000 ALTER TABLE `t_style` DISABLE KEYS */;
INSERT INTO `t_style` VALUES (1,'外交部风格','sys_theme/css','frames/17B','sys_theme/images','../images/prestyle/16G_ylt.jpg','../prestyle/16B/frames/16B/index_frame.htm',NULL,'sys_theme/js'),(2,'绿色风格','sys_theme/css','frames/17B','sys_theme/images','../images/prestyle/16G_ylt.jpg','../prestyle/16G/frames/16G/index_frame.htm',NULL,'sys_theme/js'),(4,'奥运风格','sys_theme/css','frames/17B','sys_theme/images','../images/prestyle/16G_ylt.jpg','../prestyle/16G/frames/16G/index_frame.htm',NULL,'sys_theme/js'),(5,'admin','css/16B','frames/16B','images/16B','../images/prestyle/16b_s.jpg','../prestyle/16B/frames/16B/index_frame.htm',NULL,'js/16B');
/*!40000 ALTER TABLE `t_style` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 12:28:32
