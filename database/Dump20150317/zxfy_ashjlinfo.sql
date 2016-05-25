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
-- Table structure for table `ashjlinfo`
--

DROP TABLE IF EXISTS `ashjlinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ashjlinfo` (
  `id` varchar(30) NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `host` varchar(10) DEFAULT NULL,
  `attendant` varchar(200) DEFAULT NULL,
  `filepath` varchar(200) DEFAULT NULL,
  `realfilepath` varchar(200) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `xzfyid` varchar(30) DEFAULT NULL,
  `graded` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ashjlinfo`
--

LOCK TABLES `ashjlinfo` WRITE;
/*!40000 ALTER TABLE `ashjlinfo` DISABLE KEYS */;
INSERT INTO `ashjlinfo` VALUES ('20131222221756565137',NULL,NULL,NULL,'小赵','E:\\Tomcat 6.0\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1387721902972.xls','../uploadfiles/Ashjl/attachment/1387721902972.xls','11月BG报销明细赵小川1.xls','20131222220556597904','0'),('20131215175405906950',NULL,NULL,NULL,'小赵','E:\\Tomcat 6.0\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1387101261703.doc','../uploadfiles/Ashjl/attachment/1387101261703.doc','111111.doc','201312151740419376522','1'),('20131218200613778909',NULL,NULL,NULL,'庞雷、张爱国','D:\\apache-tomcat-6.0.37\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1387368401919.doc','../uploadfiles/Ashjl/attachment/1387368401919.doc','新建 Microsoft Word 文档.doc','20131218194955086398','0'),('20131217004050511264',NULL,NULL,NULL,'王仰东、周荣、王荣梅、王才亮','E:\\Tomcat6.0\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1387212060042.doc','../uploadfiles/Ashjl/attachment/1387212060042.doc','新建 Microsoft Word 文档.doc','20131217003427945426','0'),('20131217211722078283',NULL,NULL,NULL,'王仰东、周荣','D:\\apache-tomcat-6.0.37\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1387286250989.doc','../uploadfiles/Ashjl/attachment/1387286250989.doc','新建 Microsoft Word 文档.doc','20131217145502275362','0'),('20131218233036822122',NULL,NULL,NULL,'委员1','D:\\apache-tomcat-6.0.37\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1387380646030.doc','../uploadfiles/Ashjl/attachment/1387380646030.doc','用户手册.doc','20131218232009875329','1'),('2013121600071003124',NULL,NULL,NULL,'张三、赵六','E:\\Tomcat 6.0\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1387123649875.docx','../uploadfiles/Ashjl/attachment/1387123649875.docx','案审会记录.docx','20131215225846218493','1'),('20131113202313554138',NULL,'21','刘浩','赵小川、张三、刘浩、小明',NULL,NULL,NULL,'201311131656091117882','1'),('20131017104113889715','2013-10-17','北京','张三','李四','C:\\Tomcat6\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1381977692216Chrysanthemum.jpg','../uploadfiles/Ashjl/attachment/1381977692216Chrysanthemum.jpg','Chrysanthemum.jpg','20131017103836702595','1'),('20131017104421692137','2013-10-17','北京','赵小川','张三、刘浩',NULL,NULL,NULL,'20131017104419335144','1'),('20131017103839086278','2013-10-16','北','庞磊','张三、小明',NULL,NULL,NULL,'20131017103836702595','1'),('2013101710450903150','2013-10-17','北京','张三','庞磊',NULL,NULL,NULL,'20131017104506965640','1'),('20131017104631873292','2013-10-17','北京','赵小川','庞磊',NULL,NULL,NULL,'20131017104629302246','0'),('20131017201710657313','2013-10-17','北京','赵小川','张三、庞磊',NULL,NULL,NULL,'20131017201649513680','0'),('20131017201828893339','2013-10-17','北京','赵小川','张三',NULL,NULL,NULL,'20131017201826550370','1'),('20131017204842750184','2013-10-17',NULL,'张三','赵小川',NULL,NULL,NULL,'20131017201826550370','1'),('20131017204857462239','2013-10-17',NULL,'赵小川','张三、庞磊',NULL,NULL,NULL,'20131017201826550370','0'),('20131017205129256355','2013-10-23',NULL,'赵小川','庞磊',NULL,NULL,NULL,'20131017201826550370','0'),('20131022144208341747','2013-10-18','北京','张三','刘浩、小明',NULL,NULL,NULL,'20131022143948266419','1'),('2013102214431681322','2013-10-16','北京','赵小川','赵小川、张三、小明',NULL,NULL,NULL,'20131022143948266419','1'),('20131017182415958823',NULL,NULL,'张三','庞磊',NULL,NULL,NULL,'20131017182347104624','1'),('20131017184121014499','2013-10-17','北京','张三','庞磊',NULL,NULL,NULL,'20131017184118731926','1'),('20131017184233613387','2013-10-17','北京','刘浩','张三',NULL,NULL,NULL,'20131017184231408875','1'),('20131017184422707433','2013-10-17',NULL,'张三','庞磊',NULL,NULL,NULL,'2013101718441898328','0'),('2013101717280660314','2013-10-17','bj','赵小川','庞磊、张三',NULL,NULL,NULL,'20131017172803580622','1'),('20131018170725937213','2013-10-18',NULL,'庞磊','赵小川、张三',NULL,NULL,NULL,'20131018170723017575','1'),('2013101910134624811','2013-10-19','北京','张三','赵小川',NULL,NULL,NULL,'20131019101343473389','1'),('20131019104012530981','2013-10-19','北京','张三','张三',NULL,NULL,NULL,'20131019104009612153','1'),('20131019105304918576','2013-10-19','北京','张三','张三、刘浩',NULL,NULL,NULL,'20131019104009612153','1'),('20131019113116214399','2013-10-19',NULL,'庞磊','张三、庞磊、李四、小明',NULL,NULL,NULL,'20131019104009612153','1'),('20131019113432556528','2013-10-19','北京','庞磊','张三',NULL,NULL,NULL,'20131019113403294987','1'),('20131021173425167649','2013-10-21','北京','张三','张三、庞磊、刘浩',NULL,NULL,NULL,'201310112158187063739','1'),('20131019143618653411','2013-10-19',NULL,'赵小川','刘浩、张三、小红',NULL,NULL,NULL,'201310091054378192707','1'),('20131019154044879261','2013-10-19','b','庞磊','张三、庞磊、刘浩','C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1382168466038新建 Microsoft Word 文档.docx','../uploadfiles/Ashjl/attachment/1382168466038新建 Microsoft Word 文档.docx','新建 Microsoft Word 文档.docx','201310112158187063739','1'),('20131119003003983909','2013-11-19','北京市人民政府','周继东','周继东、刘振刚、张国强、王华、周荣、王仰东、李峰、庞雷',NULL,NULL,NULL,'201311182217573215970','1'),('20131205222216260937',NULL,NULL,NULL,'王才亮、王荣梅、周荣、张爱国、王敬波、刘莘','E:\\Tomcat6.0\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1386253348514.doc','../uploadfiles/Ashjl/attachment/1386253348514.doc','新系统统计表1.doc','201312052217277265205','0'),('20131126213609810652',NULL,NULL,NULL,'王才亮、周继东、李灵雁、王荣梅、李富莹、张国强、周荣、李峰、张爱国、王敬波、刘莘',NULL,NULL,NULL,'201311221806128564754','0'),('20131206112101695419',NULL,NULL,NULL,'王才亮、王荣梅、周荣',NULL,NULL,NULL,'201312061003220758238','1'),('20131121160419000276','2013-11-21','bj','周继东','王才亮、周继东、刘振刚、李灵雁',NULL,NULL,NULL,'201311190059432905597','0'),('20131128204134952929',NULL,NULL,NULL,'王敬波、王才亮、王荣梅、周荣、张爱国','E:\\Tomcat6.0\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1385642981796.doc','../uploadfiles/Ashjl/attachment/1385642981796.doc','新系统统计表1.doc','201311282009423042888','1'),('20131129103649915741',NULL,NULL,NULL,'王才亮、周继东、刘振刚、李富莹、张国强',NULL,NULL,NULL,'201311291005355906619','1'),('20131209113944383424',NULL,NULL,NULL,'王才亮、王荣梅、周荣、张爱国、王敬波',NULL,NULL,NULL,'201312091015019566396','0'),('2013112900265501637',NULL,NULL,NULL,'周继东、李富莹、王仰东',NULL,NULL,NULL,'201311290008596792031','1'),('20131216202627218224',NULL,NULL,NULL,'小赵','E:\\Tomcat 6.0\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1387196798078.doc','../uploadfiles/Ashjl/attachment/1387196798078.doc','新建 Microsoft Word 文档.doc','20131216201347125604','1'),('2013121620553325052',NULL,NULL,NULL,'小桌子、小李子','E:\\Tomcat 6.0\\webapps\\webIscp\\uploadfiles/Ashjl/attachment/1387198544796.doc','../uploadfiles/Ashjl/attachment/1387198544796.doc','新建 Microsoft Word 文档.doc','20131216203857125367','1'),('20140918101521815646',NULL,NULL,NULL,'刘振刚、李峰、周荣、刘飞',NULL,NULL,NULL,'20140903171218762737','1');
/*!40000 ALTER TABLE `ashjlinfo` ENABLE KEYS */;
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
