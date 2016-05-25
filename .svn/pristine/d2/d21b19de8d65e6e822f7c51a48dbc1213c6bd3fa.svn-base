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
-- Table structure for table `t_dict`
--

DROP TABLE IF EXISTS `t_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dict` (
  `dict_id` decimal(10,0) NOT NULL,
  `dict_name` varchar(50) NOT NULL,
  `dict_type` varchar(10) NOT NULL,
  `dict_abbr` varchar(50) DEFAULT NULL,
  `dict_state` decimal(10,0) NOT NULL,
  `dict_desc` varchar(500) DEFAULT NULL,
  `dict_tablename` varchar(50) DEFAULT NULL,
  `dict_keycolumn` varchar(50) DEFAULT NULL,
  `dict_valuecolumn` varchar(50) DEFAULT NULL,
  `dict_parentcolumn` varchar(50) DEFAULT NULL,
  `dict_namecolumn` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dict`
--

LOCK TABLES `t_dict` WRITE;
/*!40000 ALTER TABLE `t_dict` DISABLE KEYS */;
INSERT INTO `t_dict` VALUES (122,'案件关键词','1','caseKeyword',1,NULL,NULL,NULL,NULL,NULL,NULL),(124,'文章列表','0','column',1,NULL,NULL,NULL,NULL,NULL,NULL),(123,'资料分享类别 ','1','materialKeyword',1,NULL,NULL,NULL,NULL,NULL,NULL),(125,'用户所在组织机构类型','0','fyLv',1,'用户所在组织机构类型',NULL,NULL,NULL,NULL,NULL),(126,'被申请人种类','0','fyBeAppType',1,'被申请人种类',NULL,NULL,NULL,NULL,NULL),(110,'是否行政不作为','0','sfbzw',1,NULL,NULL,NULL,NULL,NULL,NULL),(103,'行政管理类别','0','xzgllb',1,NULL,NULL,NULL,NULL,NULL,NULL),(104,'代理人类别','0','dlrlb',1,NULL,NULL,NULL,NULL,NULL,NULL),(106,'改变原因','0','gbyy',1,NULL,NULL,NULL,NULL,NULL,NULL),(108,'不作为事项','0','bzwsx',1,NULL,NULL,NULL,NULL,NULL,NULL),(111,'是否有授权委托书','0','sfwtsqs',1,NULL,NULL,NULL,NULL,NULL,NULL),(116,'被接待人意见','0','bjdryj',1,NULL,NULL,NULL,NULL,NULL,NULL),(117,'统计关键词','0','tjgjc',1,NULL,NULL,NULL,NULL,NULL,NULL),(92,'行政复议事项','0','xjfysx',1,NULL,NULL,NULL,NULL,NULL,NULL),(94,'行政处罚','0','xzcf',1,NULL,NULL,NULL,NULL,NULL,NULL),(96,'行政征收','0','xzzs',1,NULL,NULL,NULL,NULL,NULL,NULL),(98,'农林环资','0','nlzy',1,NULL,NULL,NULL,NULL,NULL,NULL),(99,'城建','0','cj',1,NULL,NULL,NULL,NULL,NULL,NULL),(101,'财政金融','0','czjr',1,NULL,NULL,NULL,NULL,NULL,NULL),(112,'被申请人种类','0','bsqrzl',1,NULL,NULL,NULL,NULL,NULL,NULL),(113,'是否愿意接受调解','0','sftj',1,NULL,NULL,NULL,NULL,NULL,NULL),(114,'是否受理同一复议申请','0','sfslfysq',1,NULL,NULL,NULL,NULL,NULL,NULL),(115,'接待情况','0','jdqk',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'模板分类','0','mbfl',1,NULL,NULL,NULL,NULL,NULL,NULL),(88,'发布状态','0','fbzt',1,'发布状态',NULL,NULL,NULL,NULL,NULL),(89,'置顶状态','0','zdzt',1,NULL,NULL,NULL,NULL,NULL,NULL),(1,'状态','0','state',1,'ffff',NULL,NULL,NULL,NULL,NULL),(3,'是否','0','equal',1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'字典类型','0','dictType',1,NULL,NULL,NULL,NULL,NULL,NULL),(54,'字段展示类型','0','fieldshow',1,NULL,NULL,NULL,NULL,NULL,NULL),(55,'字段类型','0','fieldtype',1,NULL,NULL,NULL,NULL,NULL,NULL),(64,'用户类型','0','userType',1,NULL,NULL,NULL,NULL,NULL,NULL),(83,'字段权限类型','0','fieldPermType',1,NULL,NULL,NULL,NULL,NULL,NULL),(84,'多级字典','1','multidict',1,NULL,NULL,NULL,NULL,NULL,NULL),(105,'委托代理类别','0','wtdllb',1,NULL,NULL,NULL,NULL,NULL,NULL),(107,'复议机关','0','fjjg',1,NULL,NULL,NULL,NULL,NULL,NULL),(109,'未履行证明','0','wlxzm',1,NULL,NULL,NULL,NULL,NULL,NULL),(90,'申请人类别','0','sqrlb',1,NULL,NULL,NULL,NULL,NULL,NULL),(91,'是否有代理人','0','sfdlr',1,NULL,NULL,NULL,NULL,NULL,NULL),(93,'行政复议请求','0','xzfyqq',1,NULL,NULL,NULL,NULL,NULL,NULL),(95,'行政强制措施','0','xzqzcs',1,NULL,NULL,NULL,NULL,NULL,NULL),(97,'公安','0','ga',1,NULL,NULL,NULL,NULL,NULL,NULL),(100,'工交商事','0','gjss',1,NULL,NULL,NULL,NULL,NULL,NULL),(102,'教科文卫','0','kjww',1,NULL,NULL,NULL,NULL,NULL,NULL),(118,'审理方式','0','slfs',1,NULL,NULL,NULL,NULL,NULL,NULL),(119,'代表人类别','0','dbrlb',1,NULL,NULL,NULL,NULL,NULL,NULL),(120,'其他情形','0','qtqx',1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_dict` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 12:28:18
