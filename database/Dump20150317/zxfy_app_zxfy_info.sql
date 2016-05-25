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
-- Table structure for table `app_zxfy_info`
--

DROP TABLE IF EXISTS `app_zxfy_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_zxfy_info` (
  `id` varchar(100) NOT NULL,
  `receive_date` varchar(20) DEFAULT NULL,
  `receive_real_date` varchar(20) DEFAULT NULL,
  `receive_address` varchar(200) DEFAULT NULL,
  `app_type` varchar(2) DEFAULT NULL,
  `agent` varchar(2) DEFAULT NULL,
  `agent_name` varchar(500) DEFAULT NULL,
  `proxy` varchar(2) DEFAULT NULL,
  `defendant_type` varchar(2) DEFAULT NULL,
  `defendant_name` varchar(1000) DEFAULT NULL,
  `defendant_real_name` varchar(1000) DEFAULT NULL,
  `ismanage` varchar(2) DEFAULT NULL,
  `manage_type` varchar(100) DEFAULT NULL,
  `matter_type` varchar(100) DEFAULT NULL,
  `matter_detail` longtext,
  `duty` varchar(200) DEFAULT NULL,
  `execute_date` varchar(20) DEFAULT NULL,
  `is_prof` varchar(2) DEFAULT NULL,
  `is_prof_detail` varchar(200) DEFAULT NULL,
  `require_fy` longtext,
  `break_right` varchar(200) DEFAULT NULL,
  `xzfy_requset` longtext,
  `xzfy_requset_retail` longtext,
  `condition_type` varchar(2) DEFAULT NULL,
  `receive_detail` longtext,
  `app_advice_type` longtext,
  `app_advice_detail` longtext,
  `app_type1` varchar(2) DEFAULT NULL,
  `app_type2` decimal(10,0) DEFAULT NULL,
  `guanli1` varchar(50) DEFAULT NULL,
  `guanli2` varchar(50) DEFAULT NULL,
  `guanli3` varchar(50) DEFAULT NULL,
  `xzfy_org` varchar(200) DEFAULT NULL,
  `user1_id` varchar(10) DEFAULT NULL,
  `user1_name` varchar(20) DEFAULT NULL,
  `user2_id` varchar(10) DEFAULT NULL,
  `user2_name` varchar(20) DEFAULT NULL,
  `user3_id` varchar(10) DEFAULT NULL,
  `user3_name` varchar(20) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `lian_date` varchar(20) DEFAULT NULL,
  `finish_date` varchar(20) DEFAULT NULL,
  `buzheng_from` varchar(200) DEFAULT NULL,
  `buzheng_to` varchar(20) DEFAULT NULL,
  `lian_real_date` varchar(20) DEFAULT NULL,
  `finish_real_date` varchar(20) DEFAULT NULL,
  `isdelay` varchar(2) DEFAULT NULL,
  `isdelay_from` varchar(20) DEFAULT NULL,
  `isdelay_to` varchar(20) DEFAULT NULL,
  `isstop` varchar(2) DEFAULT NULL,
  `isstop_from` varchar(20) DEFAULT NULL,
  `isstop_to` varchar(20) DEFAULT NULL,
  `finish_type` varchar(2) DEFAULT NULL,
  `check_status` varchar(2) DEFAULT NULL,
  `delay_detail` longtext,
  `delay_reason` varchar(200) DEFAULT NULL,
  `stop_reason` longtext,
  `casenum` varchar(20) DEFAULT NULL,
  `caseyear` varchar(5) DEFAULT NULL,
  `caseindex` varchar(15) DEFAULT NULL,
  `caseorg` varchar(5) DEFAULT NULL,
  `app_detail` longtext,
  `jd_renshu` varchar(10) DEFAULT NULL,
  `tapplicationdeptid` varchar(10) DEFAULT NULL,
  `keyword` varchar(4) DEFAULT NULL,
  `casetype` varchar(4) DEFAULT NULL,
  `casetype2` varchar(4) DEFAULT NULL,
  `refer` varchar(4) DEFAULT NULL,
  `refer2` varchar(4) DEFAULT NULL,
  `rencount` varchar(10) DEFAULT NULL,
  `agent_detail` longtext,
  `xwname` varchar(500) DEFAULT NULL,
  `xwnum` varchar(200) DEFAULT NULL,
  `receive_type` varchar(4) DEFAULT NULL,
  `app_show` longtext,
  `firstsubmitresult` longtext,
  `tjzfzh` varchar(200) DEFAULT NULL,
  `finishbreaktype` varchar(4) DEFAULT NULL,
  `endfile` varchar(100) DEFAULT NULL,
  `isbuzheng` varchar(4) DEFAULT NULL,
  `isbuzhengshenpi` varchar(4) DEFAULT NULL,
  `bztongzhiriqi` varchar(20) DEFAULT NULL,
  `bzbuqiriqi` varchar(20) DEFAULT NULL,
  `bztongzhifanshi` varchar(20) DEFAULT NULL,
  `buzhengcontenttype` text,
  `jindu` varchar(4) DEFAULT NULL,
  `flag` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_zxfy_info`
--

LOCK TABLES `app_zxfy_info` WRITE;
/*!40000 ALTER TABLE `app_zxfy_info` DISABLE KEYS */;
INSERT INTO `app_zxfy_info` VALUES ('20150316163854067508','2015-03-16','2015-03-16',NULL,'1','1','小邹','4','5','北京市西城区人民政府',NULL,'0','0',NULL,NULL,NULL,NULL,'0',NULL,'告知书（【京】-201513242）；知道时间：2015年01月17日（通知）；','北京市人民政府','1','撤销该具体行政行为',NULL,NULL,'不服','事实理由',NULL,NULL,NULL,NULL,NULL,'省部级行政复议机关',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'2015-03-16','2015-03-21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'150316163854067426',NULL,NULL,'0000','小孟，男，身份证号130184199005030632，送达地址太月园，邮编，电话18782975623；武金磊，男，身份证号131125199101232411，送达地址太月园，邮编，电话18782975643；',NULL,'0200',NULL,NULL,NULL,NULL,NULL,'2',NULL,'告知书','【京】-201513242','4','小孟,武金磊',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,'1,2,3,4,|130184199005030632,131125199101232411,0,','7','0'),('20150317112616282829','2015-03-17','2015-03-17',NULL,'1',NULL,NULL,NULL,'5','北京市朝阳区人民政府',NULL,'0','0',NULL,NULL,NULL,NULL,'0',NULL,'告知书（【京】-201513242）；知道时间：2015年01月18日（通知）；','北京市人民政府','1','撤销该具体行政行为',NULL,NULL,NULL,'shish ',NULL,NULL,NULL,NULL,NULL,'省部级行政复议机关',NULL,NULL,NULL,NULL,NULL,NULL,'13',NULL,NULL,'2015年01月18日（通知）',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'150317112616282197',NULL,NULL,'0000','武金磊，男，身份证号131125199101232411，送达地址太月园，邮编，电话18782975623；',NULL,'0500',NULL,NULL,NULL,NULL,NULL,'1',NULL,'告知书','【京】-201513242','4','武金磊',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,'7','0');
/*!40000 ALTER TABLE `app_zxfy_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 12:28:30
