-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$iGzCzHSVcKLD$x4LqIEAZv/nQ+HP7UW/0YSmtAqHe25Gaoxvw4apuQ10=','2018-11-23 12:00:20.651701',1,'tarena','','','',1,1,'2018-11-23 11:59:38.951135');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogtype`
--

DROP TABLE IF EXISTS `blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='博客类型 - 个人博客,公开博客,其他博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogtype`
--

LOCK TABLES `blogtype` WRITE;
/*!40000 ALTER TABLE `blogtype` DISABLE KEYS */;
INSERT INTO `blogtype` VALUES (1,'个人博客'),(2,'公开博客'),(3,'其他博客');
/*!40000 ALTER TABLE `blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Python'),(2,'Python Web'),(3,'爬虫'),(4,'人工智能');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-11-21 00:51:36.193610'),(2,'auth','0001_initial','2018-11-21 00:51:37.811902'),(3,'admin','0001_initial','2018-11-21 00:51:38.126873'),(4,'admin','0002_logentry_remove_auto_add','2018-11-21 00:51:38.168043'),(5,'contenttypes','0002_remove_content_type_name','2018-11-21 00:51:38.443728'),(6,'auth','0002_alter_permission_name_max_length','2018-11-21 00:51:38.591279'),(7,'auth','0003_alter_user_email_max_length','2018-11-21 00:51:38.746980'),(8,'auth','0004_alter_user_username_opts','2018-11-21 00:51:38.773008'),(9,'auth','0005_alter_user_last_login_null','2018-11-21 00:51:38.929433'),(10,'auth','0006_require_contenttypes_0002','2018-11-21 00:51:38.942837'),(11,'auth','0007_alter_validators_add_error_messages','2018-11-21 00:51:38.973875'),(12,'auth','0008_alter_user_username_max_length','2018-11-21 00:51:39.263900'),(13,'sessions','0001_initial','2018-11-21 00:51:39.350191');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9bvmluk603cy26pogk5vg5j4rzwb42zf','ZmUwN2YwMTQ2YzM0Mjk2MTU5NzI2OGJhMWNmNTRkZmQ1MWRmY2IwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWFkNGY0NDE4MjExMDU0M2M5YThjMjQ5ZjA2OTM2MzQ1MmEwYmE3OSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-12-07 12:00:20.828336');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `reply_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reply_User` (`user_id`),
  KEY `FK_Reply_Topic` (`topic_id`),
  CONSTRAINT `FK_Reply_Topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `FK_Reply_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客回复';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `pub_date` datetime NOT NULL,
  `read_num` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `images` text,
  `blogtype_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Topic_User` (`user_id`),
  KEY `FK_Topic_Blogtype` (`blogtype_id`),
  KEY `FK_Topic_Category` (`category_id`),
  CONSTRAINT `FK_Topic_Blogtype` FOREIGN KEY (`blogtype_id`) REFERENCES `blogtype` (`id`),
  CONSTRAINT `FK_Topic_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_Topic_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='博客文章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'简单而直接的Python Web框架','2018-08-08 20:37:20',124,'From：https://www.oschina.net/question/5189_4306\r\n\r\nFrom：https://www.oschina.net/question/5189_4306\r\n\r\n\r\n\r\nWeb.py Cookbook 简体中文版：http://webpy.org/cookbook/index.zh-cn\r\n\r\nweb.py 0.3 新手指南：http://webpy.org/docs/0.3/tutorial.zh-cn\r\n\r\n\r\n\r\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\r\n\r\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\r\n\r\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \r\n\r\n\r\n\r\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：','images/banner01.jpg',2,2,1),(2,'Python-win10下使用定时任务执行程序','2017-10-01 00:00:00',4568,'webpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\r\n\r\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\r\n\r\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \r\n\r\n\r\n\r\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：\r\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\r\n\r\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\r\n\r\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \r\n\r\n\r\n\r\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：\r\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\r\n\r\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\r\n\r\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \r\n\r\n\r\n\r\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：\r\nFrom：https://www.oschina.net/question/5189_4306\r\n\r\nFrom：https://www.oschina.net/question/5189_4306\r\n\r\n\r\n\r\nWeb.py Cookbook 简体中文版：http://webpy.org/cookbook/index.zh-cn\r\n\r\nweb.py 0.3 新手指南：http://webpy.org/docs/0.3/tutorial.zh-cn\r\n\r\n\r\n\r\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\r\n\r\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\r\n\r\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \r\n\r\n\r\n\r\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：','images/banner02.jpg',1,2,1),(3,'爬虫微课5小时 python学习路线','2015-10-01 00:00:00',0,'Python 安装配置及基本语法篇 Python 语言速成 Python 基本知识 Python 常用表达式 Python 基础语法 Python 语法篇：菜鸟的Python笔记 Python精要参考：快速入门 《Python标... ','images/banner03.jpg',1,2,1),(4,'linux升级Pip3,安装pip svn','2016-09-21 00:00:00',234,'python中打开TXT文件报错2017年03月09日 14:30:57 阅读数:676 在IDLE命令行引用一文件夹下的函数,来了条错误提示:FileNotFoundError: [Errno 2] No such ...','images/toppic01.jpg',1,2,1),(5,'精通python变成','2017-12-04 00:00:00',999,'随便写点内容吧','images/zd01.jpg',1,2,1),(6,'测试','2018-11-10 00:00:00',5,'AAAA','upload/20181110162944721696.jpg',1,3,1),(7,'美图','2018-11-12 00:00:00',3,'额外若翁',NULL,1,1,1);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `upwd` varchar(30) NOT NULL,
  `is_author` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'piye','皮爷','piye@163.com',NULL,'123456',1),(2,'weiye','魏爷','weimz@163.com',NULL,'123456',0),(3,'lvye','吕爷','lvye@163.com',NULL,'123456',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voke`
--

DROP TABLE IF EXISTS `voke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voke` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Voke_User` (`user_id`),
  KEY `FK_Voke_Topic` (`topic_id`),
  CONSTRAINT `FK_Voke_Topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `FK_Voke_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点赞';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voke`
--

LOCK TABLES `voke` WRITE;
/*!40000 ALTER TABLE `voke` DISABLE KEYS */;
/*!40000 ALTER TABLE `voke` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-29  8:57:34
