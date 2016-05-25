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
-- Table structure for table `xzcj_info`
--

DROP TABLE IF EXISTS `xzcj_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xzcj_info` (
  `id` varchar(100) DEFAULT NULL,
  `receive_date` varchar(100) DEFAULT NULL,
  `undertaker_id` varchar(100) DEFAULT NULL,
  `undertaker_name` varchar(100) DEFAULT NULL,
  `fyundertaker_id` varchar(100) DEFAULT NULL,
  `fyundertaker_name` varchar(100) DEFAULT NULL,
  `app_name` varchar(100) DEFAULT NULL,
  `app_num` varchar(100) DEFAULT NULL,
  `app_type` varchar(100) DEFAULT NULL,
  `agent` varchar(100) DEFAULT NULL,
  `jiguan_type` varchar(100) DEFAULT NULL,
  `jiguan` varchar(100) DEFAULT NULL,
  `request` varchar(100) DEFAULT NULL,
  `manage_type` varchar(100) DEFAULT NULL,
  `manage_type1` varchar(100) DEFAULT NULL,
  `ismoney` varchar(100) DEFAULT NULL,
  `action_name` varchar(100) DEFAULT NULL,
  `action_id` varchar(100) DEFAULT NULL,
  `dafutongzhi` varchar(100) DEFAULT NULL,
  `dafutongzhi1` varchar(100) DEFAULT NULL,
  `fuyiwenshu` varchar(100) DEFAULT NULL,
  `fuyiwenshu1` varchar(100) DEFAULT NULL,
  `fuyijielun` varchar(100) DEFAULT NULL,
  `caijuejielun` varchar(100) DEFAULT NULL,
  `caijuewenshu` varchar(100) DEFAULT NULL,
  `caijuewenshu1` varchar(100) DEFAULT NULL,
  `jieandate` varchar(100) DEFAULT NULL,
  `fuyi_id` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `locbm` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xzcj_info`
--

LOCK TABLES `xzcj_info` WRITE;
/*!40000 ALTER TABLE `xzcj_info` DISABLE KEYS */;
INSERT INTO `xzcj_info` VALUES ('201310091535250129824','2013-10-09',NULL,'test1',NULL,NULL,NULL,NULL,'0',NULL,'0',NULL,'','0','0, 0, 0, 0, 0, 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'待办理',NULL),('201310091633196496237','2013-10-09',NULL,'test1',NULL,'kjhf',NULL,NULL,'0',NULL,'0',NULL,'','0','0, 0, 0, 0, 0, 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'待办理',NULL),('20131009165302653549','2013-10-09',NULL,'test1',NULL,'小黄',NULL,NULL,'0',NULL,'0',NULL,'','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'待办理',NULL),('201310091706553903614','2013-10-09',NULL,'test1',NULL,'小黑',NULL,NULL,'0',NULL,'0',NULL,'','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'待办理',NULL),('20131009170915610608','2013-10-09',NULL,'test1',NULL,'小绿',NULL,NULL,'0',NULL,'0',NULL,'','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'待办理',NULL),('201310091715198866905','2013-10-09',NULL,'test1',NULL,'张',NULL,NULL,'0',NULL,'0',NULL,'','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'待办理',NULL),('201310091722358911721','2013-10-09',NULL,'test1',NULL,'小兰',NULL,NULL,'0',NULL,'0',NULL,'','1','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'待办理',NULL),('201310101715321841413','2013-10-10',NULL,'test1',NULL,'小红',NULL,'12','1','小红','1','小红','小红','1','2','是','小红','123','哈哈.jpg','../uploadfiles/xzcj/1381396607590哈哈.jpg','哈哈.jpg','../uploadfiles/xzcj/1381396607593哈哈.jpg','小红','小红','哈哈.jpg','../uploadfiles/xzcj/1381396607594哈哈.jpg',NULL,NULL,'待办理',NULL),('201310081615063935022','2013-10-08',NULL,'test1',NULL,'小明',NULL,NULL,'1','小明','1','小明','','1','0, 0, 0, 0, 0, 0','是','123','123','哈哈.jpg','../uploadfiles/xzcj/1381386843326哈哈.jpg','哈哈.jpg','../uploadfiles/xzcj/1381386843377哈哈.jpg','','','哈哈.jpg','../uploadfiles/xzcj/1381386843378哈哈.jpg','2013-10-10',NULL,'已结案',NULL),('201310101720254175573','2013-10-10',NULL,'test1',NULL,'小紫','小紫1,小紫2','12','1','小紫','1','小紫','','1','0, 0, 0, 0, 0, 0','是','小紫','2332','哈哈.jpg','../uploadfiles/xzcj/1381396881501哈哈.jpg','哈哈.jpg','../uploadfiles/xzcj/1381396881503哈哈.jpg','','','哈哈.jpg','../uploadfiles/xzcj/1381396881504哈哈.jpg',NULL,NULL,'待办理',NULL);
/*!40000 ALTER TABLE `xzcj_info` ENABLE KEYS */;
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
