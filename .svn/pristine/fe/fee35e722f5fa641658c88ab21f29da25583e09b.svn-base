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
-- Table structure for table `t_ptree`
--

DROP TABLE IF EXISTS `t_ptree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ptree` (
  `ptree_id` decimal(10,0) NOT NULL,
  `p_id` decimal(10,0) DEFAULT NULL,
  `ptree_name` varchar(50) DEFAULT NULL,
  `ptree_fid` decimal(10,0) DEFAULT NULL,
  `ptree_min` decimal(10,0) DEFAULT NULL,
  `ptree_max` decimal(10,0) DEFAULT NULL,
  `ptree_enable` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ptree`
--

LOCK TABLES `t_ptree` WRITE;
/*!40000 ALTER TABLE `t_ptree` DISABLE KEYS */;
INSERT INTO `t_ptree` VALUES (1,1,'区',0,1,1,1),(2,1,'街道',1,1,1,1),(3,1,'社区',2,1,2,1),(51,8,'55',0,55,55,1),(20,3,'省级部门',0,1,1,1),(21,3,'市级部门',20,1,1,1),(22,3,'县级部门1',21,1,1,1),(23,3,'县级部门2',21,1,1,1),(26,3,'乡部门1',22,1,1,1),(27,3,'乡部门2',23,1,1,1),(28,3,'村部门2',27,1,1,1),(29,3,'村部门1',26,1,1,1),(30,5,'省级部门',0,1,1,1),(31,5,'市级部门',30,1,1,1),(32,5,'县级部门',31,1,2,1),(33,5,'乡部门',32,1,2,1),(35,5,'村部门',33,1,2,1),(41,8,'省级部门',0,1,1,1),(42,8,'市级部门',41,1,1,1),(43,8,'县级部门',42,1,1,1),(44,8,'乡部门',43,1,2,1),(45,8,'村部门',44,1,4,1);
/*!40000 ALTER TABLE `t_ptree` ENABLE KEYS */;
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
