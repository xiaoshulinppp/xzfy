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
-- Table structure for table `u_user`
--

DROP TABLE IF EXISTS `u_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_user` (
  `user_id` decimal(20,0) NOT NULL,
  `user_logname` varchar(150) NOT NULL,
  `user_name` varchar(150) DEFAULT NULL,
  `user_mail` varchar(50) DEFAULT NULL,
  `group_id` decimal(10,0) DEFAULT NULL,
  `org_id` decimal(10,0) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `user_style` decimal(10,0) DEFAULT NULL,
  `user_type` decimal(10,0) DEFAULT NULL,
  `user_page` decimal(10,0) DEFAULT NULL,
  `user_mphone` varchar(50) DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  `user_postman` varchar(100) DEFAULT NULL,
  `user_phone` varchar(50) DEFAULT NULL,
  `user_logintime` varchar(50) DEFAULT NULL,
  `user_loginstate` decimal(22,0) DEFAULT NULL,
  `user_idcode` varchar(100) DEFAULT NULL,
  `seq` varchar(50) DEFAULT NULL,
  `releasepermission` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_user`
--

LOCK TABLES `u_user` WRITE;
/*!40000 ALTER TABLE `u_user` DISABLE KEYS */;
INSERT INTO `u_user` VALUES (3,'xiaozhaobo','肖兆波','123@qq.com',NULL,2,'password',2,732,NULL,NULL,NULL,NULL,NULL,'2014年10月27日11:06',0,'11',NULL,NULL),(4,'qianyu','钱瑜','123@qq.com',NULL,2,'password',2,732,NULL,NULL,NULL,NULL,NULL,'2014年10月24日09:52',0,NULL,NULL,NULL),(1,'admin','admin',NULL,1,1,'1',5,1,98,'13800000000','北京市','123456','010-00000000','2015年03月17日11:26',0,NULL,NULL,NULL),(2,'test','test','111@126.com',NULL,2,'password',2,732,NULL,NULL,NULL,NULL,NULL,'2014年10月09日13:20',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `u_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 12:28:22
