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
-- Table structure for table `u_operation`
--

DROP TABLE IF EXISTS `u_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_operation` (
  `op_id` decimal(10,0) NOT NULL,
  `op_name` varchar(50) NOT NULL,
  `op_abbr` varchar(50) NOT NULL,
  `op_single` decimal(10,0) NOT NULL,
  `op_sys` decimal(10,0) DEFAULT NULL,
  `op_image` varchar(50) DEFAULT NULL,
  `op_seq` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_operation`
--

LOCK TABLES `u_operation` WRITE;
/*!40000 ALTER TABLE `u_operation` DISABLE KEYS */;
INSERT INTO `u_operation` VALUES (1,'查看','view',1,1,'view.gif',1),(2,'修改','update',1,1,'file_modf.gif',2),(3,'新增','create',0,1,'view.gif',3),(4,'删除','delete',2,1,'file_del.gif',4),(5,'审核','check',1,0,'view.gif',6),(7,'提交','submit',1,0,'file_del.gif',7),(8,'查看历史记录','history',1,0,'file_modf.gif',8),(9,'发布','realse',0,0,NULL,9),(10,'查询','query',1,0,'view.gif',10);
/*!40000 ALTER TABLE `u_operation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 12:28:28
