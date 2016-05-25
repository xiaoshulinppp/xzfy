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
-- Table structure for table `t_mappingtable`
--

DROP TABLE IF EXISTS `t_mappingtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_mappingtable` (
  `table_id` decimal(10,0) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `table_mappingname` varchar(50) NOT NULL,
  `table_desc` varchar(50) DEFAULT NULL,
  `table_showname` varchar(50) DEFAULT NULL,
  `table_sys` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_mappingtable`
--

LOCK TABLES `t_mappingtable` WRITE;
/*!40000 ALTER TABLE `t_mappingtable` DISABLE KEYS */;
INSERT INTO `t_mappingtable` VALUES (44,'APP_BOOKS','APP_BOOKS',NULL,'APP_BOOKS',0),(46,'APP_EXAMPLE','APP_EXAMPLE',NULL,'APP_EXAMPLE',0),(43,'APP_FACE','APP_FACE','APP_FACE','APP_FACE',0),(48,'APP_DATA','APP_DATA',NULL,NULL,0),(45,'APP_TRENDS','APP_TRENDS',NULL,NULL,0),(1,'t_function','t_function',NULL,'功能表',1),(2,'u_user','u_user',NULL,'用户表',1),(3,'u_role','u_role',NULL,'角色表',1),(4,'u_org','u_org',NULL,'org',1),(5,'u_group','u_group',NULL,'用户组表',1),(6,'u_permission','u_permission',NULL,'权限表',1),(7,'u_operation','u_operation',NULL,'操作表',1),(8,'t_style','t_style',NULL,'风格表',1),(9,'t_mappingtable','t_mappingtable',NULL,'域表',1),(10,'t_dict','t_dict',NULL,'字典',1),(11,'t_dict_item','t_dict_item',NULL,'字典条目表',1),(12,'t_field','t_field',NULL,'域表字段表',1),(13,'u_recordpermission','u_recordpermission',NULL,'recordperm',1),(14,'t_position','t_position',NULL,'报送方案管理',1),(15,'t_ptree','t_ptree',NULL,'报送岗位表',1),(20,'t_log','t_log',NULL,'t_log',1),(21,'t_queryCond','t_queryCond',NULL,'查询管理',1),(22,'u_fieldpermission','u_fieldpermission',NULL,'字段类型',1),(23,'example_law','example_law',NULL,'法人库',1),(24,'test_person','test_person',NULL,'test_person',1),(25,'test_courset','test_courset',NULL,'课程',1),(26,'test_addresst','test_addresst',NULL,'dizhi',1),(27,'demo_film','demo_film',NULL,'视频',1),(28,'test_dict','test_dict',NULL,'测试字典',1),(30,'d_metadataproperty','d_metadataproperty',NULL,'元数据属性',1),(31,'d_metaData','d_metaData',NULL,'ss',1),(32,'d_theme','d_theme',NULL,'主题目录分类',1),(33,'d_theme_item','d_theme_item',NULL,'主题目录分类项',1),(38,'d_catalog','d_catalog',NULL,'catalog',1),(35,'d_worktheme','d_worktheme',NULL,'工作目录分类',1),(36,'d_worktheme_item','d_worktheme_item',NULL,'工作目录分类项',1),(37,'d_catalogRelation','d_catalogRelation',NULL,'目录关联表',1),(39,'t_applog','t_applog',NULL,'应用日志',1),(41,'test_ordercar','test_ordercar',NULL,'订单',1),(42,'test_orderitem','test_orderitem',NULL,'订单项目',1),(47,'APP_CLASSIFY','APP_CLASSIFY',NULL,NULL,0),(49,'user_test','user_test',NULL,'user_test',0),(50,'user_log_test','user_log_test',NULL,'user_log_test',0),(51,'app_zxfy_app','app_zxfy_app','','wujinlei',0),(52,'app_zxfy_archive','app_zxfy_archive','','test',0);
/*!40000 ALTER TABLE `t_mappingtable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 12:28:19
