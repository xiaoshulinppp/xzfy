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
-- Table structure for table `app_zxfy_archive`
--

DROP TABLE IF EXISTS `app_zxfy_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_zxfy_archive` (
  `id` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `fileanothername` varchar(50) DEFAULT NULL,
  `filerelativepath` varchar(200) DEFAULT NULL,
  `fileabsolutepath` varchar(500) DEFAULT NULL,
  `uploadtime` varchar(100) DEFAULT NULL,
  `uploaduserid` varchar(50) DEFAULT NULL,
  `uploadusername` varchar(100) DEFAULT NULL,
  `xzfyid` varchar(50) DEFAULT NULL,
  `other` varchar(200) DEFAULT NULL,
  `clname` varchar(50) DEFAULT NULL,
  `archiveOfXzfyId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_zxfy_archive`
--

LOCK TABLES `app_zxfy_archive` WRITE;
/*!40000 ALTER TABLE `app_zxfy_archive` DISABLE KEYS */;
INSERT INTO `app_zxfy_archive` VALUES ('1','0','17','英国城堡大学.jpg','20150316044025592.jpg','download\\zxfy','D:\\java\\apache-tomcat-6.0.43\\webapps\\zxfy\\download\\zxfy\\20150316044025592.jpg','2015-03-16 16:40:25','1','小孟','20150316163854067508','3',NULL,NULL),('2','1','17','英国城堡大学.jpg','20150316044033004.jpg','download\\zxfy','D:\\java\\apache-tomcat-6.0.43\\webapps\\zxfy\\download\\zxfy\\20150316044033004.jpg','2015-03-16 16:40:33','2','武金磊','20150316163854067508','3',NULL,NULL),('3','0','14','英国城堡大学.jpg','20150316044040520.jpg','download\\zxfy','D:\\java\\apache-tomcat-6.0.43\\webapps\\zxfy\\download\\zxfy\\20150316044040520.jpg','2015-03-16 16:40:40',NULL,NULL,'20150316163854067508',NULL,NULL,NULL),('4','0','15','英国城堡大学.jpg','20150316044046770.jpg','download\\zxfy','D:\\java\\apache-tomcat-6.0.43\\webapps\\zxfy\\download\\zxfy\\20150316044046770.jpg','2015-03-16 16:40:46',NULL,NULL,'20150316163854067508',NULL,NULL,NULL),('5','0','15','英国城堡大学.jpg','20150316044052819.jpg','download\\zxfy','D:\\java\\apache-tomcat-6.0.43\\webapps\\zxfy\\download\\zxfy\\20150316044052819.jpg','2015-03-16 16:40:52',NULL,NULL,'20150316163854067508',NULL,NULL,NULL),('6','0','16','英国城堡大学.jpg','20150316044106459.jpg','download\\zxfy','D:\\java\\apache-tomcat-6.0.43\\webapps\\zxfy\\download\\zxfy\\20150316044106459.jpg','2015-03-16 16:41:06',NULL,NULL,'20150316163854067508','1001','行政处罚决定书',NULL),('7','0','16','英国城堡大学.jpg','20150316044113876.jpg','download\\zxfy','D:\\java\\apache-tomcat-6.0.43\\webapps\\zxfy\\download\\zxfy\\20150316044113876.jpg','2015-03-16 16:41:13',NULL,NULL,'20150316163854067508','1001','行政处罚决定书',NULL),('8','0','3','英国城堡大学.jpg','20150316044136597.jpg','download\\zxfy','D:\\java\\apache-tomcat-6.0.43\\webapps\\zxfy\\download\\zxfy\\20150316044136597.jpg','2015-03-16 16:41:36',NULL,NULL,'20150316163854067508','111','身份证明补充材料',NULL),('9','0','3','英国城堡大学.jpg','20150316044141542.jpg','download\\zxfy','D:\\java\\apache-tomcat-6.0.43\\webapps\\zxfy\\download\\zxfy\\20150316044141542.jpg','2015-03-16 16:41:41',NULL,NULL,'20150316163854067508','111','身份证明补充材料',NULL),('11','0','17','(补证)英国城堡大学.jpg','20150316044602844.jpg','../uploadfiles/anjuan/20150316044602844.jpg','D:\\\\java\\\\apache-tomcat-6.0.43\\\\webapps\\\\zxfy\\\\uploadfiles/anjuan/20150316044602844.jpg','2015-03-16 16:46:02','1','小孟','20150316163854067508',NULL,NULL,NULL),('12','0','17','(补证)英国城堡大学.jpg','20150316044612320.jpg','../uploadfiles/anjuan/20150316044612320.jpg','D:\\\\java\\\\apache-tomcat-6.0.43\\\\webapps\\\\zxfy\\\\uploadfiles/anjuan/20150316044612320.jpg','2015-03-16 16:46:12','2','武金磊','20150316163854067508',NULL,NULL,NULL),('15','0','15','(补证)英国城堡大学.jpg','20150316044651404.jpg','../uploadfiles/anjuan/20150316044651404.jpg','D:\\\\java\\\\apache-tomcat-6.0.43\\\\webapps\\\\zxfy\\\\uploadfiles/anjuan/20150316044651404.jpg','2015-03-16 16:46:51','3','小邹','20150316163854067508',NULL,NULL,NULL),('16','0','14','(补证)英国城堡大学.jpg','20150316044658857.jpg','../uploadfiles/anjuan/20150316044658857.jpg','D:\\\\java\\\\apache-tomcat-6.0.43\\\\webapps\\\\zxfy\\\\uploadfiles/anjuan/20150316044658857.jpg','2015-03-16 16:46:58',NULL,NULL,'20150316163854067508',NULL,NULL,NULL),('19','0','16','(补证)英国城堡大学.jpg','20150316044725514.jpg','../uploadfiles/anjuan/20150316044725514.jpg','D:\\\\java\\\\apache-tomcat-6.0.43\\\\webapps\\\\zxfy\\\\uploadfiles/anjuan/20150316044725514.jpg','2015-03-16 16:47:25',NULL,NULL,'20150316163854067508','111','政府信息公开告知书',NULL),('20','0','16','(补证)英国城堡大学.jpg','20150316044730404.jpg','../uploadfiles/anjuan/20150316044730404.jpg','D:\\\\java\\\\apache-tomcat-6.0.43\\\\webapps\\\\zxfy\\\\uploadfiles/anjuan/20150316044730404.jpg','2015-03-16 16:47:30',NULL,NULL,'20150316163854067508','111','政府信息公开告知书',NULL),('23','0','3','(补证)英国城堡大学.jpg','20150316044814487.jpg','../uploadfiles/anjuan/20150316044814487.jpg','D:\\\\java\\\\apache-tomcat-6.0.43\\\\webapps\\\\zxfy\\\\uploadfiles/anjuan/20150316044814487.jpg','2015-03-16 16:48:14',NULL,NULL,'20150316163854067508','2222','政府信息公开告知书补充',NULL),('24','0','3','(补证)英国城堡大学.jpg','20150316044835239.jpg','../uploadfiles/anjuan/20150316044835239.jpg','D:\\\\java\\\\apache-tomcat-6.0.43\\\\webapps\\\\zxfy\\\\uploadfiles/anjuan/20150316044835239.jpg','2015-03-16 16:48:35',NULL,NULL,'20150316163854067508','3333','政府信息公开告知书二',NULL),('25','0','3','(补证)英国城堡大学.jpg','20150316044842390.jpg','../uploadfiles/anjuan/20150316044842390.jpg','D:\\\\java\\\\apache-tomcat-6.0.43\\\\webapps\\\\zxfy\\\\uploadfiles/anjuan/20150316044842390.jpg','2015-03-16 16:48:42',NULL,NULL,'20150316163854067508','2222','政府信息公开告知书补充',NULL),('10','0','3','（意见证据材料）258894129780145.doc','20150317093848648.doc','../uploadfiles/anjuan/20150317093848648.doc','D:\\\\java\\\\apache-tomcat-6.0.43\\\\webapps\\\\zxfy\\\\uploadfiles/anjuan/20150317093848648.doc','2015-03-17 09:38:48',NULL,NULL,'20150316163854067508','1',NULL,NULL),('10','0','17','英国城堡大学.jpg','20150317112733723.jpg','download\\zxfy','D:\\java\\apache-tomcat-6.0.43\\webapps\\zxfy\\download\\zxfy\\20150317112733723.jpg','2015-03-17 11:27:33','4','武金磊','20150317112616282829','1',NULL,NULL),('11','0','16','英国城堡大学.jpg','20150317113032398.jpg','download\\zxfy','D:\\java\\apache-tomcat-6.0.43\\webapps\\zxfy\\download\\zxfy\\20150317113032398.jpg','2015-03-17 11:30:32',NULL,NULL,'20150317112616282829','1','行政处罚决',NULL);
/*!40000 ALTER TABLE `app_zxfy_archive` ENABLE KEYS */;
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
