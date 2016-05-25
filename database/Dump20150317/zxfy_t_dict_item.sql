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
-- Table structure for table `t_dict_item`
--

DROP TABLE IF EXISTS `t_dict_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dict_item` (
  `dictitem_id` decimal(10,0) NOT NULL,
  `dictitem_name` varchar(50) DEFAULT NULL,
  `dictitem_dictid` decimal(10,0) DEFAULT NULL,
  `dictitem_abbr` varchar(50) DEFAULT NULL,
  `dictitem_fid` decimal(10,0) DEFAULT NULL,
  `dictitem_state` varchar(10) DEFAULT NULL,
  `dictitem_value` varchar(50) DEFAULT NULL,
  `dictitem_seq` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dict_item`
--

LOCK TABLES `t_dict_item` WRITE;
/*!40000 ALTER TABLE `t_dict_item` DISABLE KEYS */;
INSERT INTO `t_dict_item` VALUES (1090,'征收土地',96,'zstd',0,'1','8',1),(1091,'版税',96,'bs',0,'1','9',2),(1092,'收费',96,'sf',0,'1','10',3),(1093,'要求履行其他义务',96,'yqlxqayw',0,'1','11',4),(1097,'土地',98,'td',0,'1','9',1),(1098,'地矿',98,'dk',0,'1','10',2),(1099,'环保',98,'hb',0,'1','11',3),(1100,'农业',98,'ny',0,'1','12',4),(1101,'水利',98,'sl',0,'1','13',5),(1102,'林业',98,'ly',0,'1','14',6),(1103,'其他',98,'qt',0,'1','15',7),(1104,'规划',99,'gh',0,'0','17',1),(1105,'拆迁',99,'cq',0,'1','18',2),(1106,'房屋登记',99,'fwdj',0,'1','19',3),(1107,'其他',99,'qt',0,'1','20',4),(1117,'税务',101,'sw',0,'1','32',1),(1118,'人民银行',101,'rmyh',0,'1','33',2),(1119,'证监',101,'zj',0,'1','34',3),(1120,'保监',101,'bj',0,'1','35',4),(1121,'银监',101,'yj',0,'1','36',5),(1122,'外汇',101,'wh',0,'1','37',6),(1123,'财政',101,'cz',0,'1','38',7),(1124,'统计',101,'tj',0,'1','39',8),(1125,'审计',101,'sj',0,'1','40',9),(1126,'海关',101,'hg',0,'1','41',10),(1127,'商检',101,'sj',0,'1','42',11),(1206,'法定代表人',119,'fddbr',0,'1','1',1),(1207,'负责人',119,'fzr',0,'1','2',2),(1208,'执行合伙事务的合伙人',119,'swhhr',0,'1','3',3),(1209,'合伙人',119,'hhr',0,'1','4',4),(1210,'主要负责人',119,'zyfzr',0,'1','5',5),(1211,'被共同推选的非法人组织其他成员',119,'ffrzzqtcy',0,'1','6',6),(1222,'复议动态',124,'fydt',0,'1','复议动态',1),(1227,'时政快递',124,'szkd',0,'1','时政快递',2),(1230,'法律法规',124,'flfg',0,'1','法律法规',3),(1232,'典型案例',124,'dxal',0,'1','典型案例',4),(1219,'散文',123,'sanwen',1217,'1','sanwen',2),(1217,'文学',123,'wenxue',0,'1','wenxue',1),(1218,'古文',123,'guwen',1217,'1','guwen',1),(1220,'小说',123,'xiaoshuo',1217,'1','xiaoshuo',3),(1221,'财经',123,'caijing',0,'1','caijing',2),(1233,'市政府法制办',125,'szffzb',0,'1','1',1),(1234,'市级委办局',125,'sjwbj',0,'1','2',2),(1235,'区县法制办',125,'qxfzb',0,'1','3',3),(1236,'区县委办局',125,'qxwbj',0,'1','4',4),(1237,'省部级行政机关',126,'sbjxzjg',0,'1','1',1),(1238,'省级政府的部门',126,'sjzfdbm',0,'1','2',2),(1239,'市(地)级政府',126,'sjzf',0,'1','3',3),(1240,'市(地)级政府的部门',126,'sjzfdbm',0,'1','4',4),(1241,'县级政府',126,'xjzf',0,'1','5',5),(1242,'县级政府的部门',126,'xjzfdbm',0,'1','6',6),(1243,'乡镇政府',126,'xzzf',0,'1','7',7),(1244,'其他',126,'qt',0,'1','8',8),(1150,'委托律师',105,'wtlv',0,'1','1',1),(1151,'委托其他公民',105,'wtqtgm',0,'1','2',2),(1155,'县级政府',107,'xjzf',0,'1','县级政府',1),(1156,'县级政府的部门',107,'xjzfbm',0,'1','县级政府的部门',2),(1157,'省部级行政机关',107,'sbjxzjg',0,'1','省部级行政机关',3),(1158,'省级政府的部门',107,'sjzfbm',0,'1','省级政府的部门',4),(1169,'有',109,'y',0,'1','有',1),(1170,'无',109,'n',0,'1','无',2),(1192,'同意',116,'ty',0,'1','1',1),(1193,'知道了',116,'zdl',0,'1','4',2),(1194,'坚持申请行政复议',116,'jcsq',0,'1','2',3),(1195,'其他',116,'qt',0,'1','3',4),(1201,'会商',118,'hs',0,'1','2',3),(1202,'会审',118,'hs',0,'1','3',4),(1199,'无',118,'wu',0,'1','0',1),(1200,'设置听证',118,'sztz',0,'1','1',2),(1203,'专家论证会',118,'zjlzh',0,'1','4',5),(1204,'协调会',118,'xth',0,'1','5',6),(1205,'其他审理方式',118,'qtslfs',0,'1','6',7),(1065,'公民',90,'gm',0,'1','1',1),(1066,'法人或其他组织',90,'frqtzz',0,'1','2',2),(1067,'无',91,'n',0,'1','0',1),(1068,'有',91,'y',0,'1','1',2),(1078,'撤销该具体行政行为',93,'cxgjtxzxw',0,'1','1',1),(1079,'变更该具体行政行为',93,'bg',0,'1','2',2),(1080,'确认该具体行政行为违法',93,'qrwf',0,'1','3',3),(1081,'责令被申请人履行法定职责',93,'zllx',0,'1','4',4),(1082,'确认被申请人不履行法定职责违法',93,'qdwf',0,'1','5',5),(1087,'对人身的强制措施',95,'rsqzcs',0,'1','5',1),(1088,'对不动产的强制措施',95,'bdcqzcs',0,'1','6',2),(1089,'对其它财产的强制措施',95,'qtccqzcs',0,'1','7',3),(1094,'治安',97,'za',0,'1','1',1),(1095,'劳教',97,'lj',0,'1','2',2),(1096,'其他',97,'qt',0,'1','3',3),(1108,'工商',100,'gs',0,'1','22',1),(1109,'质监',100,'zj',0,'1','23',2),(1110,'商务',100,'sw',0,'1','24',3),(1111,'物价',100,'wj',0,'1','25',4),(1112,'能源',100,'ny',0,'1','26',5),(1113,'交通',100,'jt',0,'1','27',6),(1114,'信息产业',100,'xxcy',0,'1','28',7),(1115,'邮政',100,'yz',0,'1','29',8),(1116,'烟草专买',100,'yczm',0,'1','30',9),(1128,'药监',102,'yj',0,'1','44',1),(1129,'卫生',102,'ws',0,'1','45',2),(1130,'计划生育',102,'jhsy',0,'1','46',3),(1131,'教育',102,'jy',0,'1','47',4),(1132,'文化',102,'wh',0,'1','48',5),(1133,'专利',102,'zl',0,'1','49',6),(1134,'商标',102,'sb',0,'1','50',7),(1135,'版权',102,'bq',0,'1','51',8),(1136,'旅游',102,'ly',0,'1','52',9),(1173,'无委托',111,'wwt',0,'1','1',1),(1174,'口头委托',111,'ktwt',0,'1','2',2),(1175,'特殊情况口头委托',111,'tsktwt',0,'1','3',3),(1176,'书面委托',111,'smwt',0,'1','4',4),(1177,'乡镇政府',112,'xzzf',0,'1','1',1),(1178,'县级政府',112,'xjzf',0,'1','2',2),(1179,'县级政府部门',112,'xjzfbm',0,'1','3',3),(1180,'省部级行政机关',112,'sbjxzjg',0,'1','6',4),(1181,'省级政府部门',112,'sjzfbm',0,'1','7',5),(1182,'市经济技术开发区管委会',112,'sjjkfq',0,'1','9',6),(1183,'其他',112,'qt',0,'1','8',7),(1184,'案前调解',113,'aqtj',0,'1','1',1),(1185,'调解',113,'tj',0,'1','2',2),(1186,'否',113,'n',0,'1','3',3),(1187,'是',114,'y',0,'1','是',1),(1188,'否',114,'n',0,'1','否',2),(1189,'接收',115,'js',0,'1','3',1),(1190,'告知',115,'gz',0,'1','1',2),(1191,'补正',115,'bz',0,'1','2',3),(1196,'属于复议范围',117,'syfyfw',0,'1','1',1),(1197,'不属于复议范围',117,'bsyfyfw',0,'1','2',2),(1198,'复议案件审理',117,'fyajsl',0,'1','3',3),(1212,'无',120,'n',0,'1','0',1),(1213,'由股东代表大会以股份制企业名义提出申请',120,'gddbdhtc',0,'1','1',2),(1214,'由董事会以股份制企业名义提出申请',120,'dshtc',0,'1','2',3),(1215,'其他',120,'qt',0,'1','3',4),(1062,'附件文字',2,'FJWZ',0,'1','5',5),(1063,'附件图文',2,'FJTW',0,'1','6',6),(1064,'附件',2,'FJ',0,'1','7',7),(1058,'未置顶',89,'wzd',0,'1','0',1),(1059,'已置顶',89,'yzd',0,'1','1',2),(1060,'未发布',88,'wfb',0,'1','0',1),(1061,'已发布',88,'yfb',0,'1','1',2),(14,'总根节点',2,'ZGJD',0,'1','1',1),(10,'文字',2,'WZ',0,'1','3',3),(11,'图文',2,'TW',0,'1','4',4),(13,'固定根节点',2,'GJD',0,'1','2',2),(1,'启动',1,'enable',0,'1','1',1),(2,'未启动',1,'disable',0,'1','0',1),(4,'是',3,'yes',0,'1','1',1),(5,'否',3,'no',0,'1','0',1),(6,'单级',4,'single',0,'1','0',1),(7,'多级',4,'mulit',0,'1','1',2),(419,'下拉列表',54,'select',0,'1','select',1),(420,'文本框',54,'input',0,'1','input',1),(421,'文本区域',54,'textarea',0,'1','textarea',1),(422,'上传文件',54,'inputfile',0,'1','inputfile',1),(423,'文本按钮',54,'inputwin',0,'1','inputwin',1),(425,'复选框',54,'checkbox',0,'1','checkbox',1),(426,'不显示',54,'invisible',0,'1','invisible',1),(427,'数字',55,'int',0,'1','int',1),(428,'字符串',55,'string',0,'1','string',1),(429,'日期',55,'date',0,'1','date',1),(430,'浮点数',55,'float',0,'1','float',1),(732,'普通',64,'normal',0,'1','0',1),(733,'管理员',64,'admin',0,'1','1',1),(754,'主题分类',70,'Topic Category',0,'1','001',1),(755,'知识形态分类',70,'Pattern Category',0,'1','002',1),(756,'服务分类',70,'Service Category',0,'1','003',1),(1045,'不可见',83,'noview',0,'1','0',1),(1046,'只读',83,'readonly',0,'1','1',2),(1047,'111',84,'111',0,'1','111',1),(1137,'公安',103,'ga',0,'1','1',1),(1138,'国家安全',103,'gjaq',0,'1','2',2),(1139,'劳动和社会保障',103,'ldsb',0,'1','3',3),(1140,'司法行政',103,'sfxz',0,'1','4',4),(1141,'民政',103,'mz',0,'1','5',5),(1142,'农林环资',103,'nlhz',0,'1','6',6),(1143,'城建',103,'cj',0,'1','7',7),(1144,'工交商事',103,'gjss',0,'1','8',8),(1145,'财政金融',103,'czjr',0,'1','9',9),(1146,'教科文卫',103,'jkww',0,'1','10',10),(1147,'其他',103,'qt',0,'1','11',11),(1148,'委托代理',104,'wtdl',0,'1','1',1),(1149,'法定代理',104,'fddl',0,'1','2',2),(1152,'向区县政府申请行政复议，请求转送。',106,'qqzs',0,'1','1',1),(1153,'经上级行政复议机关授权，代为接收案件。',106,'dwjsaj',0,'1','2',2),(1154,'本级政府法制机构作为行政复议机关。',106,'bjjs',0,'1','3',3),(1159,'不颁发证照',108,'bbfzz',0,'1','不颁发证照',1),(1160,'不审批登记',108,'bspdj',0,'1','不审批登记',2),(1161,'不保护人身权',108,'bbhrsq',0,'1','不保护人身权',3),(1162,'不保护其他财产权',108,'bbhqtccq',0,'1','不保护其他财产权',4),(1163,'不保护受教育权',108,'bbhsjyq',0,'1','不保护受教育权',5),(1164,'不发放抚恤金',108,'bfffxj',0,'1','不发放抚恤金',6),(1165,'不发放社会保险金',108,'bffshbxj',0,'1','不发放社会保险金',7),(1166,'不发放最低生活保障费',108,'bffzdshbzf',0,'1','不发放最低生活保障费',8),(1167,'不履行信息公开职责',108,'blxxxgkzz',0,'1','不履行信息公开职责',9),(1168,'其他',108,'qt',0,'1','其他',10),(1171,'否',110,'n',0,'1','0',1),(1172,'是',110,'y',0,'1','2',2),(1069,'行政处罚',92,'xzcf',0,'1','1',1),(1070,'行政强制措施',92,'xzqzcs',0,'1','2',2),(1071,'行政征收',92,'xzzs',0,'1','3',3),(1072,'行政许可',92,'xzxk',0,'1','4',4),(1073,'行政确权',92,'xzqq',0,'1','5',5),(1074,'干预经营自主权',92,'gyjjzzq',0,'1','6',6),(1075,'信息公开',92,'xxgk',0,'1','7',7),(1076,'行政不作为',92,'xzbzw',0,'1','8',8),(1077,'其他',92,'qt',0,'1','9',9),(1083,'拘留',94,'jl',0,'1','1',1),(1084,'没收',94,'ms',0,'1','2',2),(1085,'罚款',94,'fk',0,'1','3',3),(1086,'其他',94,'qt',0,'1','4',4);
/*!40000 ALTER TABLE `t_dict_item` ENABLE KEYS */;
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