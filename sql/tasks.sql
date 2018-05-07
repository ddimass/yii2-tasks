-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: tasks
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('MP','3',1520268649),('MP','4',1520268758),('SU','1',1496678802),('SU','2',1497545540);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/*',2,NULL,NULL,NULL,1496678765,1496678765),('/projects/*',2,NULL,NULL,NULL,1497545586,1497545586),('/projects/create',2,NULL,NULL,NULL,1520270451,1520270451),('/projects/index',2,NULL,NULL,NULL,1520270449,1520270449),('/projects/update',2,NULL,NULL,NULL,1520270617,1520270617),('MP',1,NULL,NULL,NULL,1497545599,1520270460),('SU',1,NULL,NULL,NULL,1496678791,1520269464),('update',2,NULL,NULL,NULL,1520269442,1520269442),('updateOwn',2,NULL,'author',NULL,1520270284,1520271251);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('SU','/*'),('MP','/projects/create'),('MP','/projects/index'),('update','/projects/update'),('SU','update'),('updateOwn','update'),('MP','updateOwn');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` VALUES ('author','O:23:\"backend\\rbac\\AuthorRule\":3:{s:4:\"name\";s:6:\"author\";s:9:\"createdAt\";i:1520271236;s:9:\"updatedAt\";i:1520271236;}',1520271236,1520271236);
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1496675469),('m130524_201442_init',1496675471),('m140506_102106_rbac_init',1496678586),('m140602_111327_create_menu_table',1496678292),('m160312_050000_create_user',1496678292);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org`
--

DROP TABLE IF EXISTS `org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `disabled` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org`
--

LOCK TABLES `org` WRITE;
/*!40000 ALTER TABLE `org` DISABLE KEYS */;
INSERT INTO `org` VALUES (11,'Первый Городской Канал','телеканал',NULL,2,1497625927,1497625927,2,0),(12,'Гимназия №1','',NULL,1,1500646849,1500646849,1,0),(19,'KML','dfgd','image108.jpg',1,1500670184,1500670203,1,1);
/*!40000 ALTER TABLE `org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_user`
--

DROP TABLE IF EXISTS `org_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_user` (
  `org_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`org_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `org_user_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `org` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `org_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_user`
--

LOCK TABLES `org_user` WRITE;
/*!40000 ALTER TABLE `org_user` DISABLE KEYS */;
INSERT INTO `org_user` VALUES (11,1,NULL);
/*!40000 ALTER TABLE `org_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_user`
--

DROP TABLE IF EXISTS `proj_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_user` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `proj_user_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proj_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_user`
--

LOCK TABLES `proj_user` WRITE;
/*!40000 ALTER TABLE `proj_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `endtime` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `disabled` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `org` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (3,11,'Мы решили похудеть',1,'Подготовка к эфиру программы \"Мы решили похудеть\" 3-ий выпуск',12,1497625939,2,1497727019,2,0),(4,12,'test',1,'test',15,1520270511,4,1520270511,4,0);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_groups`
--

DROP TABLE IF EXISTS `task_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `disabled` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `task_groups_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_groups`
--

LOCK TABLES `task_groups` WRITE;
/*!40000 ALTER TABLE `task_groups` DISABLE KEYS */;
INSERT INTO `task_groups` VALUES (2,'Выход программы на июль месяц',1,'Подготовка к эфиру программы \"Мы решили похудеть\" 3-ий выпуск','2012-07-20 17:00:00',3,2,'0000-00-00 00:00:00','0000-00-00 00:00:00',2,0);
/*!40000 ALTER TABLE `task_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_user`
--

DROP TABLE IF EXISTS `task_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_user` (
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`task_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `task_user_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `task_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_user`
--

LOCK TABLES `task_user` WRITE;
/*!40000 ALTER TABLE `task_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskgr_user`
--

DROP TABLE IF EXISTS `taskgr_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskgr_user` (
  `task_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`task_group_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `taskgr_user_ibfk_1` FOREIGN KEY (`task_group_id`) REFERENCES `task_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `taskgr_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskgr_user`
--

LOCK TABLES `taskgr_user` WRITE;
/*!40000 ALTER TABLE `taskgr_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskgr_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  `task_group_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `disabled` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`task_group_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`task_group_id`) REFERENCES `task_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Подготовка к эфиру на 12.07.2017 программы \"Мы решили похудеть\" 3-ий выпуск',1,'Смонтированный файл программы \"Мы решили похудеть\" 3-ий выпуск находится NataAdmin:\\Ратибор\\Мы решили похудеть\\3-ий сизон\\','2017-07-12 09:00:00',2,2,'2017-05-20 14:23:11',2,'0000-00-00 00:00:00',0),(2,'Подготовка к эфиру на 12.07.2017 программы \"Доброе утро\" 1-ий выпуск',1,'Смонтированный файл программы \"Доброе утро\" 1-ий выпуск находится NataAdmin:\\Ратибор\\Доброе утро\\1-ий сизон\\','2013-07-20 17:00:00',2,2,'0000-00-00 00:00:00',2,'0000-00-00 00:00:00',0),(3,'Подготовка к эфиру на 13.07.2017 программы \"Доброе утро\" 1-ий выпуск',1,'Смонтированный файл программы \"Доброе утро\" 1-ий выпуск находится NataAdmin:\\Ратибор\\Доброе утро\\1-ий сизон\\','2013-07-20 17:00:00',2,2,'0000-00-00 00:00:00',2,'0000-00-00 00:00:00',0),(4,'Подготовка к эфиру на 13.07.2017 программы \"Новости\"',1,'Смонтированный файл программы \"Новости\" выпуск находится NataAdmin:\\Степан\\Новости\\13.07.2017\\',NULL,2,2,'0000-00-00 00:00:00',2,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_l` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_s` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','Кудряшов','Василий','Юрьевич','Технический директор','YdM4S0cUc9aGmRZGoM-o0yT2kIYEYn_G','$2y$13$u8nDGVNNv6KqpG2z0KQnLuN.epAumDk3UwLUlu.Ua4aP.fXiiQ1ey',NULL,'ddimasss@mail.ru',10,1496675707,1496675707),(2,'serj',NULL,NULL,NULL,NULL,'Zsgo7ns1yVZfgdvgWw4WGFIdQU4babcx','$2y$13$II0tGE69NwSAdZcovk7BleSlqJgbXz/cNuWlPC6R4J4O4oeVHXERG',NULL,'kutkov_serjksm@mail.ru',10,1497545040,1497545040),(4,'test',NULL,NULL,NULL,NULL,'HU8CQV3jlpLgrLeJBvRsMaSXTk6tDAm8','$2y$13$OrhtaVZDAm0qzP5HFyCS/OfIYfa3TucMKlENicKWhFaO8YtD97nL.',NULL,'test@mail.ru',10,1520268715,1520268715);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-07 12:43:19
