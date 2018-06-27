-- MySQL dump 10.13  Distrib 5.7.22, for osx10.13 (x86_64)
--
-- Host: localhost    Database: storemanagement
-- ------------------------------------------------------
-- Server version	5.7.22

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
-- Table structure for table `api_category`
--

DROP TABLE IF EXISTS `api_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_category_store_id_55a79438_fk_api_store_id` (`store_id`),
  CONSTRAINT `api_category_store_id_55a79438_fk_api_store_id` FOREIGN KEY (`store_id`) REFERENCES `api_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_category`
--

LOCK TABLES `api_category` WRITE;
/*!40000 ALTER TABLE `api_category` DISABLE KEYS */;
INSERT INTO `api_category` VALUES (1,'Men','2018-06-27 14:45:07.112583','2018-06-27 14:45:07.112609',1),(2,'Women','2018-06-27 14:45:15.308089','2018-06-27 14:45:15.308116',1),(3,'Bakery','2018-06-27 14:46:50.848577','2018-06-27 14:46:50.848610',2),(4,'Dairy','2018-06-27 14:47:03.524183','2018-06-27 14:47:03.524211',2);
/*!40000 ALTER TABLE `api_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_order`
--

DROP TABLE IF EXISTS `api_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `total` double NOT NULL,
  `delivery_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_order_address_id_089033c4_fk_api_orderaddress_id` (`address_id`),
  KEY `api_order_user_id_52781ff0_fk_auth_user_id` (`user_id`),
  CONSTRAINT `api_order_address_id_089033c4_fk_api_orderaddress_id` FOREIGN KEY (`address_id`) REFERENCES `api_orderaddress` (`id`),
  CONSTRAINT `api_order_user_id_52781ff0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_order`
--

LOCK TABLES `api_order` WRITE;
/*!40000 ALTER TABLE `api_order` DISABLE KEYS */;
INSERT INTO `api_order` VALUES (1,'paid','paid',14,0,14,NULL,'AUD','2018-06-27 15:03:26.305606','2018-06-27 15:03:26.305638',1,2);
/*!40000 ALTER TABLE `api_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_orderaddress`
--

DROP TABLE IF EXISTS `api_orderaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_orderaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `street_number` varchar(100) DEFAULT NULL,
  `street_name` varchar(100) NOT NULL,
  `city` varchar(60) DEFAULT NULL,
  `zip_code` varchar(6) NOT NULL,
  `state` varchar(31) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_orderaddress_user_id_9f44904c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `api_orderaddress_user_id_9f44904c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_orderaddress`
--

LOCK TABLES `api_orderaddress` WRITE;
/*!40000 ALTER TABLE `api_orderaddress` DISABLE KEYS */;
INSERT INTO `api_orderaddress` VALUES (1,NULL,-31.9820862,115.8019081,'81','Waratah Ave','Dalkeith','6009','WA',NULL,NULL,NULL,'2018-06-27 15:02:57.558541','2018-06-27 15:02:57.558567',2);
/*!40000 ALTER TABLE `api_orderaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_orderedproduct`
--

DROP TABLE IF EXISTS `api_orderedproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_orderedproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` double NOT NULL,
  `discount_percentage` double NOT NULL,
  `size` varchar(31) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_orderedproduct_order_id_65b395b3_fk_api_order_id` (`order_id`),
  KEY `api_orderedproduct_product_id_c988de67_fk_api_product_id` (`product_id`),
  KEY `api_orderedproduct_product_variation_id_1b37e1b7_fk_api_produ` (`product_variation_id`),
  CONSTRAINT `api_orderedproduct_order_id_65b395b3_fk_api_order_id` FOREIGN KEY (`order_id`) REFERENCES `api_order` (`id`),
  CONSTRAINT `api_orderedproduct_product_id_c988de67_fk_api_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`id`),
  CONSTRAINT `api_orderedproduct_product_variation_id_1b37e1b7_fk_api_produ` FOREIGN KEY (`product_variation_id`) REFERENCES `api_productvariation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_orderedproduct`
--

LOCK TABLES `api_orderedproduct` WRITE;
/*!40000 ALTER TABLE `api_orderedproduct` DISABLE KEYS */;
INSERT INTO `api_orderedproduct` VALUES (1,7,1,0,'L','2018-06-27 15:04:05.123015','2018-06-27 15:04:05.123047',1,3,2),(2,7,1,0,'M','2018-06-27 15:04:21.262291','2018-06-27 15:04:21.262334',1,3,3);
/*!40000 ALTER TABLE `api_orderedproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_product`
--

DROP TABLE IF EXISTS `api_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_product_subcategory_id_671ddc2e_fk_api_subcategory_id` (`subcategory_id`),
  CONSTRAINT `api_product_subcategory_id_671ddc2e_fk_api_subcategory_id` FOREIGN KEY (`subcategory_id`) REFERENCES `api_subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_product`
--

LOCK TABLES `api_product` WRITE;
/*!40000 ALTER TABLE `api_product` DISABLE KEYS */;
INSERT INTO `api_product` VALUES (3,'Flannel Shirt','Flannel print\r\nSpread collar\r\nLong sleeves\r\n1 chest pocket\r\nButton up front\r\nCurved hem\r\nRegular fit\r\nCotton\r\nMachine wash according to instructions on the care label','2018-06-27 14:53:46.959319','2018-06-27 14:53:46.959346',1);
/*!40000 ALTER TABLE `api_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_productpicture`
--

DROP TABLE IF EXISTS `api_productpicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_productpicture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_productpicture_product_id_100f693e_fk_api_product_id` (`product_id`),
  CONSTRAINT `api_productpicture_product_id_100f693e_fk_api_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_productpicture`
--

LOCK TABLES `api_productpicture` WRITE;
/*!40000 ALTER TABLE `api_productpicture` DISABLE KEYS */;
INSERT INTO `api_productpicture` VALUES (1,'media/uploads/products/Flannel_Shirt_blue.jpg',1,'2018-06-27 14:58:53.550322','2018-06-27 14:58:53.550351',3),(2,'media/uploads/products/Flannel_Shirt_red.jpg',2,'2018-06-27 14:59:08.480752','2018-06-27 14:59:08.480782',3);
/*!40000 ALTER TABLE `api_productpicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_productvariation`
--

DROP TABLE IF EXISTS `api_productvariation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_productvariation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(15) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `discount_percentage` double NOT NULL,
  `quantity` double NOT NULL,
  `color` varchar(15) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_picture_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_productvariation_product_id_8bf11511_fk_api_product_id` (`product_id`),
  KEY `api_productvariation_product_picture_id_aefc129b_fk_api_produ` (`product_picture_id`),
  CONSTRAINT `api_productvariation_product_id_8bf11511_fk_api_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`id`),
  CONSTRAINT `api_productvariation_product_picture_id_aefc129b_fk_api_produ` FOREIGN KEY (`product_picture_id`) REFERENCES `api_productpicture` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_productvariation`
--

LOCK TABLES `api_productvariation` WRITE;
/*!40000 ALTER TABLE `api_productvariation` DISABLE KEYS */;
INSERT INTO `api_productvariation` VALUES (2,'L',7.00,0,2,'Red','2018-06-27 15:00:03.773675','2018-06-27 15:00:03.773707',3,1),(3,'M',7.00,0,5,'Blue','2018-06-27 15:00:37.201775','2018-06-27 15:00:37.201806',3,2);
/*!40000 ALTER TABLE `api_productvariation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_store`
--

DROP TABLE IF EXISTS `api_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `description` longtext NOT NULL,
  `website` varchar(255) NOT NULL,
  `fb_url` varchar(255) DEFAULT NULL,
  `main_picture` varchar(100) DEFAULT NULL,
  `thumb` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_store`
--

LOCK TABLES `api_store` WRITE;
/*!40000 ALTER TABLE `api_store` DISABLE KEYS */;
INSERT INTO `api_store` VALUES (1,'Kmart','Kmart Australia Limited is an Australian chain of retail stores, owned by Wesfarmers. It operates 214 stores in Australia and 20 in New Zealand, with its head office located in Mulgrave, Melbourne','http://www.kmart.com.au/',NULL,'','media/uploads/stores/thumbs/KMART.png','2018-06-27 14:35:10.722831','2018-06-27 14:35:10.722861'),(2,'IGA','Independent Grocers of Australia is an Australian chain of supermarkets. IGA itself is owned by Metcash, but individual IGA stores are independently owned','http://www.iga.com.au/',NULL,'','media/uploads/stores/thumbs/IGA.png','2018-06-27 14:35:52.077605','2018-06-27 14:35:52.077632');
/*!40000 ALTER TABLE `api_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_storebranch`
--

DROP TABLE IF EXISTS `api_storebranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_storebranch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `address` varchar(127) NOT NULL,
  `city` varchar(55) NOT NULL,
  `zip_code` varchar(6) NOT NULL,
  `state` varchar(31) DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `store_id` int(11) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_storebranch_store_id_c941ed93_fk_api_store_id` (`store_id`),
  CONSTRAINT `api_storebranch_store_id_c941ed93_fk_api_store_id` FOREIGN KEY (`store_id`) REFERENCES `api_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_storebranch`
--

LOCK TABLES `api_storebranch` WRITE;
/*!40000 ALTER TABLE `api_storebranch` DISABLE KEYS */;
INSERT INTO `api_storebranch` VALUES (1,'Kardinya','North Lake Rd & South St','Kardinya','6163','WA',-32.0673848,115.8142126,'2018-06-27 14:40:03.163739','2018-06-27 14:40:03.163770',1,'(08) 9338 8200'),(2,'Innaloo','384 Scarborough Beach Rd','Innaloo','6018','WA',-31.901507,115.796463,'2018-06-27 14:41:18.381991','2018-06-27 14:41:18.382043',1,'(08) 6241 3100'),(3,'Broadway IGA','33/88 Broadway','Crawley','6009','WA',-31.969984,115.8093448,'2018-06-27 14:44:17.782884','2018-06-27 14:44:17.782912',2,'(08) 9386 4356');
/*!40000 ALTER TABLE `api_storebranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_subcategory`
--

DROP TABLE IF EXISTS `api_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_subcategory_category_id_eaedebf6_fk_api_category_id` (`category_id`),
  KEY `api_subcategory_store_id_320ddf6f_fk_api_store_id` (`store_id`),
  CONSTRAINT `api_subcategory_category_id_eaedebf6_fk_api_category_id` FOREIGN KEY (`category_id`) REFERENCES `api_category` (`id`),
  CONSTRAINT `api_subcategory_store_id_320ddf6f_fk_api_store_id` FOREIGN KEY (`store_id`) REFERENCES `api_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_subcategory`
--

LOCK TABLES `api_subcategory` WRITE;
/*!40000 ALTER TABLE `api_subcategory` DISABLE KEYS */;
INSERT INTO `api_subcategory` VALUES (1,'Top','2018-06-27 14:47:32.225623','2018-06-27 14:48:09.746289',1,1),(2,'Jackets & Coats','2018-06-27 14:48:02.613558','2018-06-27 14:48:02.613588',1,1),(3,'Tops','2018-06-27 14:48:26.282953','2018-06-27 14:48:26.282978',2,1),(4,'Pants','2018-06-27 14:48:35.509145','2018-06-27 14:48:35.509177',2,1),(5,'Bread','2018-06-27 14:48:50.824162','2018-06-27 14:48:50.824196',3,2),(6,'Milk','2018-06-27 14:48:59.512233','2018-06-27 14:48:59.512262',4,2);
/*!40000 ALTER TABLE `api_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Token',7,'add_token'),(20,'Can change Token',7,'change_token'),(21,'Can delete Token',7,'delete_token'),(22,'Can add phone user',8,'add_phoneuser'),(23,'Can change phone user',8,'change_phoneuser'),(24,'Can delete phone user',8,'delete_phoneuser'),(25,'Can add social user',9,'add_socialuser'),(26,'Can change social user',9,'change_socialuser'),(27,'Can delete social user',9,'delete_socialuser'),(28,'Can add user profile',10,'add_userprofile'),(29,'Can change user profile',10,'change_userprofile'),(30,'Can delete user profile',10,'delete_userprofile'),(31,'Can add store branch',11,'add_storebranch'),(32,'Can change store branch',11,'change_storebranch'),(33,'Can delete store branch',11,'delete_storebranch'),(34,'Can add sub category',12,'add_subcategory'),(35,'Can change sub category',12,'change_subcategory'),(36,'Can delete sub category',12,'delete_subcategory'),(37,'Can add ordered product',13,'add_orderedproduct'),(38,'Can change ordered product',13,'change_orderedproduct'),(39,'Can delete ordered product',13,'delete_orderedproduct'),(40,'Can add category',14,'add_category'),(41,'Can change category',14,'change_category'),(42,'Can delete category',14,'delete_category'),(43,'Can add order',15,'add_order'),(44,'Can change order',15,'change_order'),(45,'Can delete order',15,'delete_order'),(46,'Can add order address',16,'add_orderaddress'),(47,'Can change order address',16,'change_orderaddress'),(48,'Can delete order address',16,'delete_orderaddress'),(49,'Can add store',17,'add_store'),(50,'Can change store',17,'change_store'),(51,'Can delete store',17,'delete_store'),(52,'Can add product',18,'add_product'),(53,'Can change product',18,'change_product'),(54,'Can delete product',18,'delete_product'),(55,'Can add product variation',19,'add_productvariation'),(56,'Can change product variation',19,'change_productvariation'),(57,'Can delete product variation',19,'delete_productvariation'),(58,'Can add product picture',20,'add_productpicture'),(59,'Can change product picture',20,'change_productpicture'),(60,'Can delete product picture',20,'delete_productpicture');
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
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$3qlhAgzDdpoT$AHXMqhdZ66kfCsf1KelhzqKS5H2soSfN8hVP7NlIXUE=','2018-06-27 12:41:13.205634',1,'admin','','','moinku07@gmail.com',1,1,'2018-06-27 12:41:08.784021'),(2,'pbkdf2_sha256$100000$WlZl7wuzVMCN$PAdwO38oG3LJ0X7K6WKGbhiBqKYMgM3K1kRas2s15J0=',NULL,0,'facebook_1560790550651507','Test','User3','test3@user.com',0,1,'2018-06-27 12:41:29.461345');
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
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('d26099ac7e8d829f060313bc630a1ee3b8e4b21e','2018-06-27 12:41:31.183333',2);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-06-27 14:35:10.723333','1','Kmart',1,'[{\"added\": {}}]',17,1),(2,'2018-06-27 14:35:52.078090','2','IGA',1,'[{\"added\": {}}]',17,1),(3,'2018-06-27 14:40:03.166572','1','Kardinya - Kmart',1,'[{\"added\": {}}]',11,1),(4,'2018-06-27 14:41:18.382585','2','Innaloo - Kmart',1,'[{\"added\": {}}]',11,1),(5,'2018-06-27 14:44:17.783683','3','Broadway IGA - IGA',1,'[{\"added\": {}}]',11,1),(6,'2018-06-27 14:45:07.113185','1','Men - Kmart',1,'[{\"added\": {}}]',14,1),(7,'2018-06-27 14:45:15.308531','2','Women - Kmart',1,'[{\"added\": {}}]',14,1),(8,'2018-06-27 14:46:50.849122','3','Bakery - IGA',1,'[{\"added\": {}}]',14,1),(9,'2018-06-27 14:47:03.524633','4','Dairy - IGA',1,'[{\"added\": {}}]',14,1),(10,'2018-06-27 14:47:32.226210','1','Mens Top - Men (Kmart)',1,'[{\"added\": {}}]',12,1),(11,'2018-06-27 14:48:02.614022','2','Jackets & Coats - Men (Kmart)',1,'[{\"added\": {}}]',12,1),(12,'2018-06-27 14:48:09.747065','1','Top - Men (Kmart)',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',12,1),(13,'2018-06-27 14:48:26.283347','3','Tops - Women (Kmart)',1,'[{\"added\": {}}]',12,1),(14,'2018-06-27 14:48:35.509637','4','Pants - Women (Kmart)',1,'[{\"added\": {}}]',12,1),(15,'2018-06-27 14:48:50.824568','5','Bread - Bakery (IGA)',1,'[{\"added\": {}}]',12,1),(16,'2018-06-27 14:48:59.512664','6','Milk - Dairy (IGA)',1,'[{\"added\": {}}]',12,1),(17,'2018-06-27 14:53:46.959802','3','Flannel Shirt',1,'[{\"added\": {}}]',18,1),(18,'2018-06-27 14:58:53.550768','1','ProductPicture object (1)',1,'[{\"added\": {}}]',20,1),(19,'2018-06-27 14:59:08.481235','2','ProductPicture object (2)',1,'[{\"added\": {}}]',20,1),(20,'2018-06-27 15:00:03.774907','2','Flannel Shirt - L - Red',1,'[{\"added\": {}}]',19,1),(21,'2018-06-27 15:00:37.202398','3','Flannel Shirt - M - Blue',1,'[{\"added\": {}}]',19,1),(22,'2018-06-27 15:02:57.559029','1','81 Waratah Ave, Dalkeith 6009 (-31.9820862,115.8019081)',1,'[{\"added\": {}}]',16,1),(23,'2018-06-27 15:03:26.306496','1','1 - Test',1,'[{\"added\": {}}]',15,1),(24,'2018-06-27 15:04:05.123819','1','Flannel Shirt (3)',1,'[{\"added\": {}}]',13,1),(25,'2018-06-27 15:04:21.262885','2','Flannel Shirt (3)',1,'[{\"added\": {}}]',13,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(14,'api','category'),(15,'api','order'),(16,'api','orderaddress'),(13,'api','orderedproduct'),(18,'api','product'),(20,'api','productpicture'),(19,'api','productvariation'),(17,'api','store'),(11,'api','storebranch'),(12,'api','subcategory'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(5,'contenttypes','contenttype'),(8,'drf_auth','phoneuser'),(9,'drf_auth','socialuser'),(10,'drf_auth','userprofile'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-06-27 12:33:58.994434'),(2,'auth','0001_initial','2018-06-27 12:34:00.008658'),(3,'admin','0001_initial','2018-06-27 12:34:00.146065'),(4,'admin','0002_logentry_remove_auto_add','2018-06-27 12:34:00.155187'),(5,'contenttypes','0002_remove_content_type_name','2018-06-27 12:34:00.277648'),(6,'auth','0002_alter_permission_name_max_length','2018-06-27 12:34:00.345375'),(7,'auth','0003_alter_user_email_max_length','2018-06-27 12:34:00.396923'),(8,'auth','0004_alter_user_username_opts','2018-06-27 12:34:00.412099'),(9,'auth','0005_alter_user_last_login_null','2018-06-27 12:34:00.446152'),(10,'auth','0006_require_contenttypes_0002','2018-06-27 12:34:00.447744'),(11,'auth','0007_alter_validators_add_error_messages','2018-06-27 12:34:00.464648'),(12,'auth','0008_alter_user_username_max_length','2018-06-27 12:34:00.521638'),(13,'auth','0009_alter_user_last_name_max_length','2018-06-27 12:34:00.569850'),(14,'sessions','0001_initial','2018-06-27 12:34:00.668669'),(15,'authtoken','0001_initial','2018-06-27 12:39:08.169346'),(16,'authtoken','0002_auto_20160226_1747','2018-06-27 12:39:08.285821'),(17,'drf_auth','0001_initial','2018-06-27 12:39:08.522537'),(18,'api','0001_initial','2018-06-27 14:30:03.743901'),(19,'api','0002_auto_20180627_1434','2018-06-27 14:34:17.092975'),(20,'api','0003_storebranch_phone','2018-06-27 14:37:30.229349'),(21,'api','0004_productvariation_product_picture','2018-06-27 14:57:39.536467');
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
INSERT INTO `django_session` VALUES ('t61z6nxtz35xelyztshwt5f8drjchfov','NjYxZjk4N2YyYTc5MjVjNjc0MDkyM2Q0ZGM0ZDdhMjRjMTQ5ODIxYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWQyZTVlYzMzMThkMjgyMWU2Y2Q1M2EwMDMxNTNhZTY3NWZiYjljIn0=','2018-07-11 12:41:13.207591');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drf_auth_phoneuser`
--

DROP TABLE IF EXISTS `drf_auth_phoneuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drf_auth_phoneuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `drf_auth_phoneuser_user_id_77742d89_fk_auth_user_id` (`user_id`),
  CONSTRAINT `drf_auth_phoneuser_user_id_77742d89_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drf_auth_phoneuser`
--

LOCK TABLES `drf_auth_phoneuser` WRITE;
/*!40000 ALTER TABLE `drf_auth_phoneuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `drf_auth_phoneuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drf_auth_socialuser`
--

DROP TABLE IF EXISTS `drf_auth_socialuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drf_auth_socialuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `network` varchar(30) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `token` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drf_auth_socialuser_user_id_84eb61f4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `drf_auth_socialuser_user_id_84eb61f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drf_auth_socialuser`
--

LOCK TABLES `drf_auth_socialuser` WRITE;
/*!40000 ALTER TABLE `drf_auth_socialuser` DISABLE KEYS */;
INSERT INTO `drf_auth_socialuser` VALUES (1,'facebook','1560790550651507','N/A',2);
/*!40000 ALTER TABLE `drf_auth_socialuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drf_auth_userprofile`
--

DROP TABLE IF EXISTS `drf_auth_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drf_auth_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_photo` varchar(100) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drf_auth_userprofile_user_id_84655080_fk_auth_user_id` (`user_id`),
  CONSTRAINT `drf_auth_userprofile_user_id_84655080_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drf_auth_userprofile`
--

LOCK TABLES `drf_auth_userprofile` WRITE;
/*!40000 ALTER TABLE `drf_auth_userprofile` DISABLE KEYS */;
INSERT INTO `drf_auth_userprofile` VALUES (1,'users/profile-photos/asid1560790550651507height200width200ext1530362490hashAeTt_2vJ2_7UTNeF.jpg',NULL,0,2);
/*!40000 ALTER TABLE `drf_auth_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-27 23:30:34
