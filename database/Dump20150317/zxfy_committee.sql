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
-- Table structure for table `committee`
--

DROP TABLE IF EXISTS `committee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee` (
  `comt_id` double DEFAULT NULL,
  `comt_name` varchar(20) DEFAULT NULL,
  `work_name` varchar(20) DEFAULT NULL,
  `sexy` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `term_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committee`
--

LOCK TABLES `committee` WRITE;
/*!40000 ALTER TABLE `committee` DISABLE KEYS */;
INSERT INTO `committee` VALUES (10,'权','太极拳','1','13235596694','201309231421533294476'),(28,'周芷若','峨眉山','2','13475859950','20130923150623424150'),(29,'蛛儿','天鹰教','2','13482048403','20130923150623424150'),(30,'小昭','西域','2','13575895954','20130923150623424150'),(31,'赵小川','太极','1','13545545355','201309231421533294476'),(35,'赵小川','法制办','1','3423423','201309231528042993598'),(37,'张三','法制办','1','234234','201309231528042993598'),(34,'庞磊','法制办','1','12312312','201309231528042993598'),(36,'刘浩','法制办','1','234234','201309231528042993598'),(38,'李四','法制办','1','345435','201309231528042993598'),(39,'小明','法制办','1','345345','201309231528042993598'),(40,'小红','法制办','2','534534','201309231528042993598'),(41,'詹姆斯','美国男篮','1','2432110','201310230959445661177'),(1,'赵小川','太极计算机','1','15098768909','201309231421533294476'),(2,'章伟','智慧城市','1','15096452738','20130923142411541267'),(3,'刘浩','技术创新','1','15001058782','201309231425033111426'),(4,'雍文婷','太极','2','13987651098','201309231426237352510'),(5,'太极权','太极','1','15893559489','201309231427028474758'),(7,'程炜文','智慧城市','1','13987650488','201309231428264673587'),(8,'李成','技术创新','1','13287465458','201309231429239555596'),(9,'王敏','太极股份','2','15385736348','201309231429576692816'),(11,'dfd',NULL,'1',NULL,'201309231421533294476'),(12,'俊俊','塔基','1','15938735485','201309231428264673587'),(13,'婷婷','智慧城市事业部','2','14723958545','201309231426237352510'),(14,'敏敏','智慧城市','2','14567889900','201309231429576692816'),(15,'川流不息','台阶','1','13489604394','201309231455401372943'),(16,'高金权','太极','1','15678395475','201309231456384539134'),(17,'亭亭玉立','太极股份','2','14668394304','201309231457350263073'),(18,'赵敏','王府','2','13278694030','201309231458125955768'),(19,'拳王','拳击馆','1','15768395045','20130923145903794313'),(20,'倾国倾城','秘密','1','15984784549','201309231459502229749'),(21,'张无忌','明教','1','13275893940','201309231500504152083'),(22,'周芷若','峨眉山','2','14857383924','201309231501331458078'),(23,'小昭','西域','1','14589383938','20130923150247736596'),(24,'蛛儿','未知','1','13549857357','201309231503281998230'),(25,'敏敏无敌','太极','2','13454854869','201309231457350263073'),(26,'张无忌','明教','1','13567849395','20130923150623424150'),(27,'赵敏','汝阳王府','2','14567284949','20130923150623424150');
/*!40000 ALTER TABLE `committee` ENABLE KEYS */;
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