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
-- Table structure for table `jdaj_applicant`
--

DROP TABLE IF EXISTS `jdaj_applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jdaj_applicant` (
  `id` double NOT NULL,
  `jdaj_id` varchar(50) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `idnumber` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postaladdress` varchar(100) DEFAULT NULL,
  `postcode` varchar(8) DEFAULT NULL,
  `telenumber` varchar(20) DEFAULT NULL,
  `phonenumber` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jdaj_applicant`
--

LOCK TABLES `jdaj_applicant` WRITE;
/*!40000 ALTER TABLE `jdaj_applicant` DISABLE KEYS */;
INSERT INTO `jdaj_applicant` VALUES (2,'20131012150113497277','小红','2','234234456856756','北京市朝阳区','北京市朝阳区','24322','23423423','23423423'),(3,'20131012150349685441','小李','1','13423412312345658344','北京市','北京市','362245','23464777','63222'),(4,'20131012150349685441','小刘','2','342344234','北京市','北京市','234234','3656467567','78678474'),(1,'20131012150113497277','小明','1','1231231231233123','北京市朝阳区','北京市朝阳区','342342','234342323423','23423423423');
/*!40000 ALTER TABLE `jdaj_applicant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 12:28:17
