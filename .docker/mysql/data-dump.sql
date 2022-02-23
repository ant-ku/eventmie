-- MySQL dump 10.17  Distrib 10.3.17-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: event_db
-- ------------------------------------------------------
-- Server version	10.3.17-MariaDB-1:10.3.17+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `button_url` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `button_title` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'Eventmie Pro','Event management & selling platform','banners/August2019/3MIAC8BaLwk8ytlYYvVi.jpg',1,'2022-02-23 16:54:31','2022-02-23 16:54:31',1,'https://eventmie-pro.classiebit.com/events','Get Event Tickets');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `organiser_id` int(10) unsigned DEFAULT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `ticket_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `net_price` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `event_start_date` date DEFAULT NULL,
  `event_end_date` date DEFAULT NULL,
  `event_start_time` time DEFAULT NULL,
  `event_end_time` time DEFAULT NULL,
  `event_repetitive` int(10) unsigned NOT NULL DEFAULT 0,
  `ticket_title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ticket_price` decimal(10,2) unsigned NOT NULL,
  `event_category` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `booking_cancel` int(11) DEFAULT 0,
  `item_sku` varchar(191) COLLATE utf8_unicode_ci DEFAULT '0',
  `order_number` bigint(20) unsigned NOT NULL DEFAULT 0,
  `transaction_id` int(10) unsigned NOT NULL DEFAULT 0,
  `customer_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `customer_email` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_in` tinyint(4) NOT NULL DEFAULT 0,
  `payment_type` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'online',
  `is_paid` tinyint(1) NOT NULL DEFAULT 1,
  `is_bulk` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `thumb` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Business & Seminars','business-&-seminars','2022-02-23 16:54:31','2022-02-23 16:54:31',1,'categories/September2019/qXRVg2PfJlS58FgCocap.jpg',NULL,1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commissions`
--

DROP TABLE IF EXISTS `commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `organiser_id` int(10) unsigned NOT NULL,
  `booking_id` int(10) unsigned DEFAULT NULL,
  `admin_commission` decimal(10,2) unsigned NOT NULL,
  `customer_paid` decimal(10,2) unsigned NOT NULL,
  `organiser_earning` decimal(10,2) unsigned NOT NULL,
  `transferred` tinyint(1) NOT NULL DEFAULT 0,
  `month_year` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_id` int(10) unsigned DEFAULT NULL,
  `admin_tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `settled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `commissions_event_id_foreign` (`event_id`),
  KEY `commissions_booking_id_foreign` (`booking_id`),
  CONSTRAINT `commissions_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `commissions_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commissions`
--

LOCK TABLES `commissions` WRITE;
/*!40000 ALTER TABLE `commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `read` datetime DEFAULT NULL,
  `read_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan',NULL,NULL),(2,'AL','Albania',NULL,NULL),(3,'DZ','Algeria',NULL,NULL),(4,'DS','American Samoa',NULL,NULL),(5,'AD','Andorra',NULL,NULL),(6,'AO','Angola',NULL,NULL),(7,'AI','Anguilla',NULL,NULL),(8,'AQ','Antarctica',NULL,NULL),(9,'AG','Antigua and Barbuda',NULL,NULL),(10,'AR','Argentina',NULL,NULL),(11,'AM','Armenia',NULL,NULL),(12,'AW','Aruba',NULL,NULL),(13,'AU','Australia',NULL,NULL),(14,'AT','Austria',NULL,NULL),(15,'AZ','Azerbaijan',NULL,NULL),(16,'BS','Bahamas',NULL,NULL),(17,'BH','Bahrain',NULL,NULL),(18,'BD','Bangladesh',NULL,NULL),(19,'BB','Barbados',NULL,NULL),(20,'BY','Belarus',NULL,NULL),(21,'BE','Belgium',NULL,NULL),(22,'BZ','Belize',NULL,NULL),(23,'BJ','Benin',NULL,NULL),(24,'BM','Bermuda',NULL,NULL),(25,'BT','Bhutan',NULL,NULL),(26,'BO','Bolivia',NULL,NULL),(27,'BA','Bosnia and Herzegovina',NULL,NULL),(28,'BW','Botswana',NULL,NULL),(29,'BV','Bouvet Island',NULL,NULL),(30,'BR','Brazil',NULL,NULL),(31,'IO','British Indian Ocean Territory',NULL,NULL),(32,'BN','Brunei Darussalam',NULL,NULL),(33,'BG','Bulgaria',NULL,NULL),(34,'BF','Burkina Faso',NULL,NULL),(35,'BI','Burundi',NULL,NULL),(36,'KH','Cambodia',NULL,NULL),(37,'CM','Cameroon',NULL,NULL),(38,'CA','Canada',NULL,NULL),(39,'CV','Cape Verde',NULL,NULL),(40,'KY','Cayman Islands',NULL,NULL),(41,'CF','Central African Republic',NULL,NULL),(42,'TD','Chad',NULL,NULL),(43,'CL','Chile',NULL,NULL),(44,'CN','China',NULL,NULL),(45,'CX','Christmas Island',NULL,NULL),(46,'CC','Cocos (Keeling) Islands',NULL,NULL),(47,'CO','Colombia',NULL,NULL),(48,'KM','Comoros',NULL,NULL),(49,'CG','Congo',NULL,NULL),(50,'CK','Cook Islands',NULL,NULL),(51,'CR','Costa Rica',NULL,NULL),(52,'HR','Croatia (Hrvatska)',NULL,NULL),(53,'CU','Cuba',NULL,NULL),(54,'CY','Cyprus',NULL,NULL),(55,'CZ','Czech Republic',NULL,NULL),(56,'DK','Denmark',NULL,NULL),(57,'DJ','Djibouti',NULL,NULL),(58,'DM','Dominica',NULL,NULL),(59,'DO','Dominican Republic',NULL,NULL),(60,'TP','East Timor',NULL,NULL),(61,'EC','Ecuador',NULL,NULL),(62,'EG','Egypt',NULL,NULL),(63,'SV','El Salvador',NULL,NULL),(64,'GQ','Equatorial Guinea',NULL,NULL),(65,'ER','Eritrea',NULL,NULL),(66,'EE','Estonia',NULL,NULL),(67,'ET','Ethiopia',NULL,NULL),(68,'FK','Falkland Islands (Malvinas)',NULL,NULL),(69,'FO','Faroe Islands',NULL,NULL),(70,'FJ','Fiji',NULL,NULL),(71,'FI','Finland',NULL,NULL),(72,'FR','France',NULL,NULL),(73,'FX','France, Metropolitan',NULL,NULL),(74,'GF','French Guiana',NULL,NULL),(75,'PF','French Polynesia',NULL,NULL),(76,'TF','French Southern Territories',NULL,NULL),(77,'GA','Gabon',NULL,NULL),(78,'GM','Gambia',NULL,NULL),(79,'GE','Georgia',NULL,NULL),(80,'DE','Germany',NULL,NULL),(81,'GH','Ghana',NULL,NULL),(82,'GI','Gibraltar',NULL,NULL),(83,'GK','Guernsey',NULL,NULL),(84,'GR','Greece',NULL,NULL),(85,'GL','Greenland',NULL,NULL),(86,'GD','Grenada',NULL,NULL),(87,'GP','Guadeloupe',NULL,NULL),(88,'GU','Guam',NULL,NULL),(89,'GT','Guatemala',NULL,NULL),(90,'GN','Guinea',NULL,NULL),(91,'GW','Guinea-Bissau',NULL,NULL),(92,'GY','Guyana',NULL,NULL),(93,'HT','Haiti',NULL,NULL),(94,'HM','Heard and Mc Donald Islands',NULL,NULL),(95,'HN','Honduras',NULL,NULL),(96,'HK','Hong Kong',NULL,NULL),(97,'HU','Hungary',NULL,NULL),(98,'IS','Iceland',NULL,NULL),(99,'IN','India',NULL,NULL),(100,'IM','Isle of Man',NULL,NULL),(101,'ID','Indonesia',NULL,NULL),(102,'IR','Iran (Islamic Republic of)',NULL,NULL),(103,'IQ','Iraq',NULL,NULL),(104,'IE','Ireland',NULL,NULL),(105,'IL','Israel',NULL,NULL),(106,'IT','Italy',NULL,NULL),(107,'CI','Ivory Coast',NULL,NULL),(108,'JE','Jersey',NULL,NULL),(109,'JM','Jamaica',NULL,NULL),(110,'JP','Japan',NULL,NULL),(111,'JO','Jordan',NULL,NULL),(112,'KZ','Kazakhstan',NULL,NULL),(113,'KE','Kenya',NULL,NULL),(114,'KI','Kiribati',NULL,NULL),(115,'KP','Korea, Democratic People\'s Republic of',NULL,NULL),(116,'KR','Korea, Republic of',NULL,NULL),(117,'XK','Kosovo',NULL,NULL),(118,'KW','Kuwait',NULL,NULL),(119,'KG','Kyrgyzstan',NULL,NULL),(120,'LA','Lao People\'s Democratic Republic',NULL,NULL),(121,'LV','Latvia',NULL,NULL),(122,'LB','Lebanon',NULL,NULL),(123,'LS','Lesotho',NULL,NULL),(124,'LR','Liberia',NULL,NULL),(125,'LY','Libyan Arab Jamahiriya',NULL,NULL),(126,'LI','Liechtenstein',NULL,NULL),(127,'LT','Lithuania',NULL,NULL),(128,'LU','Luxembourg',NULL,NULL),(129,'MO','Macau',NULL,NULL),(130,'MK','Macedonia',NULL,NULL),(131,'MG','Madagascar',NULL,NULL),(132,'MW','Malawi',NULL,NULL),(133,'MY','Malaysia',NULL,NULL),(134,'MV','Maldives',NULL,NULL),(135,'ML','Mali',NULL,NULL),(136,'MT','Malta',NULL,NULL),(137,'MH','Marshall Islands',NULL,NULL),(138,'MQ','Martinique',NULL,NULL),(139,'MR','Mauritania',NULL,NULL),(140,'MU','Mauritius',NULL,NULL),(141,'TY','Mayotte',NULL,NULL),(142,'MX','Mexico',NULL,NULL),(143,'FM','Micronesia, Federated States of',NULL,NULL),(144,'MD','Moldova, Republic of',NULL,NULL),(145,'MC','Monaco',NULL,NULL),(146,'MN','Mongolia',NULL,NULL),(147,'ME','Montenegro',NULL,NULL),(148,'MS','Montserrat',NULL,NULL),(149,'MA','Morocco',NULL,NULL),(150,'MZ','Mozambique',NULL,NULL),(151,'MM','Myanmar',NULL,NULL),(152,'NA','Namibia',NULL,NULL),(153,'NR','Nauru',NULL,NULL),(154,'NP','Nepal',NULL,NULL),(155,'NL','Netherlands',NULL,NULL),(156,'AN','Netherlands Antilles',NULL,NULL),(157,'NC','New Caledonia',NULL,NULL),(158,'NZ','New Zealand',NULL,NULL),(159,'NI','Nicaragua',NULL,NULL),(160,'NE','Niger',NULL,NULL),(161,'NG','Nigeria',NULL,NULL),(162,'NU','Niue',NULL,NULL),(163,'NF','Norfolk Island',NULL,NULL),(164,'MP','Northern Mariana Islands',NULL,NULL),(165,'NO','Norway',NULL,NULL),(166,'OM','Oman',NULL,NULL),(167,'PK','Pakistan',NULL,NULL),(168,'PW','Palau',NULL,NULL),(169,'PS','Palestine',NULL,NULL),(170,'PA','Panama',NULL,NULL),(171,'PG','Papua New Guinea',NULL,NULL),(172,'PY','Paraguay',NULL,NULL),(173,'PE','Peru',NULL,NULL),(174,'PH','Philippines',NULL,NULL),(175,'PN','Pitcairn',NULL,NULL),(176,'PL','Poland',NULL,NULL),(177,'PT','Portugal',NULL,NULL),(178,'PR','Puerto Rico',NULL,NULL),(179,'QA','Qatar',NULL,NULL),(180,'RE','Reunion',NULL,NULL),(181,'RO','Romania',NULL,NULL),(182,'RU','Russian Federation',NULL,NULL),(183,'RW','Rwanda',NULL,NULL),(184,'KN','Saint Kitts and Nevis',NULL,NULL),(185,'LC','Saint Lucia',NULL,NULL),(186,'VC','Saint Vincent and the Grenadines',NULL,NULL),(187,'WS','Samoa',NULL,NULL),(188,'SM','San Marino',NULL,NULL),(189,'ST','Sao Tome and Principe',NULL,NULL),(190,'SA','Saudi Arabia',NULL,NULL),(191,'SN','Senegal',NULL,NULL),(192,'RS','Serbia',NULL,NULL),(193,'SC','Seychelles',NULL,NULL),(194,'SL','Sierra Leone',NULL,NULL),(195,'SG','Singapore',NULL,NULL),(196,'SK','Slovakia',NULL,NULL),(197,'SI','Slovenia',NULL,NULL),(198,'SB','Solomon Islands',NULL,NULL),(199,'SO','Somalia',NULL,NULL),(200,'ZA','South Africa',NULL,NULL),(201,'GS','South Georgia South Sandwich Islands',NULL,NULL),(202,'SS','South Sudan',NULL,NULL),(203,'ES','Spain',NULL,NULL),(204,'LK','Sri Lanka',NULL,NULL),(205,'SH','St. Helena',NULL,NULL),(206,'PM','St. Pierre and Miquelon',NULL,NULL),(207,'SD','Sudan',NULL,NULL),(208,'SR','Suriname',NULL,NULL),(209,'SJ','Svalbard and Jan Mayen Islands',NULL,NULL),(210,'SZ','Swaziland',NULL,NULL),(211,'SE','Sweden',NULL,NULL),(212,'CH','Switzerland',NULL,NULL),(213,'SY','Syrian Arab Republic',NULL,NULL),(214,'TW','Taiwan',NULL,NULL),(215,'TJ','Tajikistan',NULL,NULL),(216,'TZ','Tanzania, United Republic of',NULL,NULL),(217,'TH','Thailand',NULL,NULL),(218,'TG','Togo',NULL,NULL),(219,'TK','Tokelau',NULL,NULL),(220,'TO','Tonga',NULL,NULL),(221,'TT','Trinidad and Tobago',NULL,NULL),(222,'TN','Tunisia',NULL,NULL),(223,'TR','Turkey',NULL,NULL),(224,'TM','Turkmenistan',NULL,NULL),(225,'TC','Turks and Caicos Islands',NULL,NULL),(226,'TV','Tuvalu',NULL,NULL),(227,'UG','Uganda',NULL,NULL),(228,'UA','Ukraine',NULL,NULL),(229,'AE','United Arab Emirates',NULL,NULL),(230,'GB','United Kingdom',NULL,NULL),(231,'US','United States',NULL,NULL),(232,'UM','United States minor outlying islands',NULL,NULL),(233,'UY','Uruguay',NULL,NULL),(234,'UZ','Uzbekistan',NULL,NULL),(235,'VU','Vanuatu',NULL,NULL),(236,'VA','Vatican City State',NULL,NULL),(237,'VE','Venezuela',NULL,NULL),(238,'VN','Vietnam',NULL,NULL),(239,'VG','Virgin Islands (British)',NULL,NULL),(240,'VI','Virgin Islands (U.S.)',NULL,NULL),(241,'WF','Wallis and Futuna Islands',NULL,NULL),(242,'EH','Western Sahara',NULL,NULL),(243,'YE','Yemen',NULL,NULL),(244,'ZR','Zaire',NULL,NULL),(245,'ZM','Zambia',NULL,NULL),(246,'ZW','Zimbabwe',NULL,NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iso_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'AED','د.إ',NULL,NULL),(2,'ANG','ƒ',NULL,NULL),(3,'AOA','AOA',NULL,NULL),(4,'ARS','$',NULL,NULL),(5,'AUD','$',NULL,NULL),(6,'BAM','KM',NULL,NULL),(7,'BBD','$',NULL,NULL),(8,'BGL','лв',NULL,NULL),(9,'BHD','BD',NULL,NULL),(10,'BND','$',NULL,NULL),(11,'BRL','R$',NULL,NULL),(12,'CAD','$',NULL,NULL),(13,'CHF','Fr',NULL,NULL),(14,'CLF','UF',NULL,NULL),(15,'CLP','$',NULL,NULL),(16,'CNY','¥',NULL,NULL),(17,'COP','$',NULL,NULL),(18,'CRC','₡',NULL,NULL),(19,'CZK','Kč',NULL,NULL),(20,'DKK','kr',NULL,NULL),(21,'EEK','KR',NULL,NULL),(22,'EGP','E£',NULL,NULL),(23,'EUR','€',NULL,NULL),(24,'FJD','FJ$',NULL,NULL),(25,'GBP','£',NULL,NULL),(26,'GTQ','Q',NULL,NULL),(27,'HKD','$',NULL,NULL),(28,'HRK','kn',NULL,NULL),(29,'HUF','Ft',NULL,NULL),(30,'IDR','Rp',NULL,NULL),(31,'ILS','₪',NULL,NULL),(32,'INR','Rs',NULL,NULL),(33,'JOD','د.ا',NULL,NULL),(34,'JPY','¥',NULL,NULL),(35,'KES','KSh',NULL,NULL),(36,'KRW','₩',NULL,NULL),(37,'KWD','KD',NULL,NULL),(38,'KYD','$',NULL,NULL),(39,'LTL','Lt',NULL,NULL),(40,'LVL','Ls',NULL,NULL),(41,'MAD','د.م',NULL,NULL),(42,'MVR','Rf',NULL,NULL),(43,'MXN','$',NULL,NULL),(44,'MYR','RM',NULL,NULL),(45,'NGN','₦',NULL,NULL),(46,'NOK','kr',NULL,NULL),(47,'NZD','$',NULL,NULL),(48,'OMR','OMR',NULL,NULL),(49,'PEN','S/.',NULL,NULL),(50,'PHP','₱',NULL,NULL),(51,'PLN','zł',NULL,NULL),(52,'QAR','QAR',NULL,NULL),(53,'RON','lei',NULL,NULL),(54,'RUB','руб',NULL,NULL),(55,'SAR','SAR',NULL,NULL),(56,'SEK','kr',NULL,NULL),(57,'SGD','$',NULL,NULL),(58,'THB','฿',NULL,NULL),(59,'TRY','TL',NULL,NULL),(60,'TTD','$',NULL,NULL),(61,'TWD','$',NULL,NULL),(62,'UAH','₴',NULL,NULL),(63,'USD','$',NULL,NULL),(64,'VEF','Bs ',NULL,NULL),(65,'VND','₫',NULL,NULL),(66,'XCD','$',NULL,NULL),(67,'ZAR','R',NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,3,'id','number','ID',1,0,0,0,0,0,'\"{}\"',1),(2,3,'name','text','Name',1,1,1,1,1,1,'\"{}\"',2),(3,3,'created_at','timestamp','Created At',0,0,0,0,0,0,'\"{}\"',3),(4,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'\"{}\"',4),(5,3,'display_name','text','Display Name',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:255\"}}',5),(6,1,'id','number','ID',1,1,1,0,0,0,'\"{}\"',1),(7,1,'name','text','Name',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:255\"}}',2),(8,1,'email','text','Email',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|email|max:255|unique:users,email,1\"}}',3),(9,1,'password','password','Password',1,0,0,1,1,0,'\"{}\"',4),(10,1,'remember_token','text','Remember Token',0,0,0,0,0,0,'\"{}\"',5),(11,1,'created_at','timestamp','Created At',0,1,1,0,0,0,'\"{}\"',6),(12,1,'updated_at','timestamp','Updated At',0,0,1,0,0,0,'\"{}\"',7),(13,1,'avatar','image','Avatar',0,0,1,1,1,1,'\"{}\"',8),(14,1,'user_belongsto_role_relationship','relationship','Role',1,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(15,1,'user_belongstomany_role_relationship','relationship','Roles',0,0,0,0,0,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(16,1,'settings','hidden','Settings',0,0,0,0,0,0,'\"{}\"',12),(17,1,'role_id','text','Role',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required\"}}',9),(18,1,'email_verified_at','timestamp','Email Verified At',0,0,0,0,0,0,'\"{}\"',6),(19,1,'organisation','text','Organisation',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable|max:255\"}}',12),(20,1,'bank_name','text','Bank Name',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable|max:255\"}}',13),(21,1,'bank_code','text','Bank Code',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable|max:255\"}}',14),(22,1,'bank_branch_name','text','Bank Branch Name',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable|max:255\"}}',15),(23,1,'bank_branch_code','text','Bank Branch Code',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable|max:255\"}}',16),(24,1,'bank_account_number','text','Bank Account Number',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable|max:255\"}}',17),(25,1,'bank_account_name','text','Bank Account Name',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable|max:255\"}}',18),(26,1,'bank_account_phone','text','Bank Account Phone',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable|max:255\"}}',19),(27,1,'address','text','Address',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable|max:255\"}}',20),(28,1,'phone','text','Phone',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable|max:255\"}}',21),(29,1,'fb_access_token','text','Fb Access Token',0,0,0,0,0,0,'\"{}\"',22),(30,1,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Enabled\",\"0\":\"Disabled\"},\"validation\":{\"rule\":\"required\"}}',22),(31,2,'id','number','ID',1,1,0,0,0,0,'\"{}\"',1),(32,2,'name','text','Name',1,1,0,0,0,0,'\"{}\"',2),(33,2,'created_at','timestamp','Created At',0,0,0,0,0,0,'\"{}\"',3),(34,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'\"{}\"',4),(35,4,'id','number','ID',1,0,0,0,0,0,'\"{}\"',1),(36,4,'author_id','text','Author',1,0,1,1,0,1,'\"{}\"',2),(37,4,'category_id','text','Category',0,0,1,1,1,0,'\"{}\"',3),(38,4,'title','text','Title',1,1,1,1,1,1,'\"{}\"',4),(39,4,'excerpt','text_area','Excerpt',0,0,1,1,1,1,'\"{}\"',5),(40,4,'body','rich_text_box','Body',1,0,1,1,1,1,'\"{}\"',6),(41,4,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(42,4,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(43,4,'meta_description','text_area','Meta Description',0,0,1,1,1,1,'\"{}\"',9),(44,4,'meta_keywords','text_area','Meta Keywords',0,0,1,1,1,1,'\"{}\"',10),(45,4,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(46,4,'created_at','timestamp','Created At',0,1,1,0,0,0,'\"{}\"',12),(47,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'\"{}\"',13),(48,4,'seo_title','text','SEO Title',0,0,1,1,1,1,'\"{}\"',14),(49,4,'featured','checkbox','Featured',0,0,0,0,0,0,'\"{}\"',15),(50,5,'id','number','ID',1,0,0,0,0,0,'\"{}\"',1),(51,5,'author_id','text','Author',1,0,0,0,0,0,'\"{}\"',2),(52,5,'title','text','Title',1,1,1,1,1,1,'\"{}\"',3),(53,5,'excerpt','text_area','Excerpt',0,0,1,1,1,1,'\"{}\"',4),(54,5,'body','rich_text_box','Body',0,0,1,1,1,1,'\"{}\"',5),(55,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(56,5,'meta_description','text','Meta Description',0,0,1,1,1,1,'\"{}\"',7),(57,5,'meta_keywords','text','Meta Keywords',0,0,1,1,1,1,'\"{}\"',8),(58,5,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(59,5,'created_at','timestamp','Created At',0,1,1,0,0,0,'\"{}\"',10),(60,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'\"{}\"',11),(61,5,'image','image','Page Image',0,0,1,1,1,1,'\"{}\"',12),(62,6,'id','text','Id',1,1,0,0,0,0,'\"{}\"',1),(63,6,'title','text','Title',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"max:256|unique:events,title\"}}',2),(64,6,'description','rich_text_box','Description',0,0,1,1,1,1,'\"{}\"',4),(65,6,'faq','rich_text_box','Faq',0,0,1,1,1,1,'\"{}\"',5),(66,6,'thumbnail','image','Thumbnail',0,0,1,1,1,1,'\"{}\"',10),(67,6,'poster','image','Poster',0,0,1,1,1,1,'\"{}\"',11),(68,6,'images','multiple_images','Images',0,0,1,1,1,1,'\"{}\"',12),(69,6,'video_link','text','Video Link',0,0,1,1,1,1,'\"{}\"',13),(70,6,'venue','text','Venue',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"max:256\"},\"display\":{\"width\":\"6\"}}',14),(71,6,'address','text_area','Address',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"max:512\"},\"display\":{\"width\":\"6\"}}',16),(72,6,'city','text','City',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"max:256\"},\"display\":{\"width\":\"3\"}}',17),(73,6,'state','text','State',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"max:256\"},\"display\":{\"width\":\"3\"}}',18),(74,6,'zipcode','text','Zipcode',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"max:64\"},\"display\":{\"width\":\"3\"}}',19),(75,6,'start_date','date','Start Date',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"date|after_or_equal:tomorrow\"},\"display\":{\"width\":\"6\"}}',21),(76,6,'end_date','date','End Date',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"date|after_or_equal:start_date\"},\"display\":{\"width\":\"6\"}}',22),(77,6,'start_time','time','Start Time',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"\"},\"display\":{\"width\":\"6\"}}',23),(78,6,'end_time','time','End Time',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"\"},\"display\":{\"width\":\"6\"}}',24),(79,6,'repetitive','select_dropdown','Repetitive',0,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Yes\",\"0\":\"No\"},\"validation\":{\"rule\":\"required\"}}',25),(80,6,'featured','select_dropdown','Featured',0,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Yes\",\"0\":\"No\"},\"validation\":{\"rule\":\"required\"}}',35),(81,6,'status','select_dropdown','Status',0,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Enabled\",\"0\":\"Disabled\"},\"validation\":{\"rule\":\"required\"}}',36),(82,6,'meta_title','text','Meta Title',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"max:256\"}}',31),(83,6,'meta_description','text_area','Meta Description',0,0,1,1,1,1,'\"{}\"',33),(84,6,'add_to_facebook','text','Add To Facebook',0,0,0,0,0,0,'{\"validation\":{\"rule\":\"nullable\"}}',34),(85,6,'created_at','timestamp','Created At',0,0,1,0,0,0,'\"{}\"',37),(86,6,'updated_at','timestamp','Updated At',0,1,1,0,0,0,'\"{}\"',38),(87,6,'event_hasone_user_relationship','relationship','Organiser',0,1,1,1,1,1,'{\"model\":\"Classiebit\\\\Eventmie\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',7),(88,6,'event_belongsto_category_relationship','relationship','Category',0,1,1,1,1,1,'{\"model\":\"Classiebit\\\\Eventmie\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',6),(89,6,'event_belongsto_country_relationship','relationship','Country',0,0,1,1,1,1,'{\"model\":\"Classiebit\\\\Eventmie\\\\Models\\\\Country\",\"table\":\"countries\",\"type\":\"belongsTo\",\"column\":\"country_id\",\"key\":\"id\",\"label\":\"country_name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',20),(90,6,'country_id','text','Country Id',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"integer\"}}',15),(91,6,'category_id','text','Category Id',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"integer\"}}',29),(92,6,'user_id','text','User Id',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"integer\"}}',30),(93,6,'slug','text','Slug',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"max:512\"},\"slugify\":{\"origin\":\"title\"},\"readonly\":true}',3),(94,6,'price_type','text','Price Type',1,0,1,1,1,1,'\"{}\"',31),(95,6,'latitude','text','Latitude',0,0,1,1,1,1,'\"{}\"',32),(96,6,'longitude','text','Longitude',0,0,1,1,1,1,'\"{}\"',33),(97,6,'item_sku','text','Item Sku',1,0,1,1,1,1,'\"{}\"',34),(98,6,'publish','select_dropdown','Publish',0,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Published\",\"0\":\"Draft\"},\"validation\":{\"rule\":\"required\"}}',35),(99,6,'is_publishable','text','Is Publishable',0,0,1,1,1,1,'\"{}\"',36),(100,6,'merge_schedule','select_dropdown','Payment Frequency',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Monthly\\/Weekly\",\"0\":\"Full Advance\"},\"validation\":{\"rule\":\"required\"}}',37),(101,6,'meta_keywords','text','Meta Keywords',0,0,1,1,1,1,'\"{}\"',23),(102,6,'online_location','text','Online Location',0,1,1,1,1,1,'\"{}\"',36),(103,6,'excerpt','text','Excerpt',0,0,1,1,1,1,'\"{}\"',2),(104,7,'id','text','Id',1,1,0,0,0,0,'\"{}\"',1),(105,7,'name','text','Name',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:64|unique:categories,name,1\"}}',2),(106,7,'slug','text','Slug',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:128|unique:categories,slug,1\"},\"slugify\":{\"origin\":\"name\"}}',3),(107,7,'created_at','timestamp','Created At',0,0,1,0,0,0,'\"{}\"',7),(108,7,'updated_at','timestamp','Updated At',0,1,1,0,0,0,'\"{}\"',8),(109,7,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Enabled\",\"0\":\"Disabled\"},\"validation\":{\"rule\":\"required\"}}',9),(110,7,'thumb','image','Thumb (480x270 px)',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"nullable\"},\"resize\":{\"width\":\"480\",\"height\":\"270\"},\"quality\":\"70%\",\"upsize\":true}',4),(111,7,'image','image','Image',0,0,0,0,0,0,'{\"validation\":{\"rule\":\"nullable\"},\"resize\":{\"width\":\"157\",\"height\":\"467\"},\"quality\":\"70%\",\"upsize\":true}',5),(112,7,'template','radio_btn','Template',1,0,0,0,0,0,'{\"default\":\"1\",\"options\":[\"Template 1\",\"Template 2\",\"Template 3\"],\"validation\":{\"rule\":\"required\"}}',6),(113,8,'id','text','Id',1,1,0,0,0,0,'\"{}\"',1),(114,8,'title','text','Title',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:64|unique:categories,name,1\"}}',2),(115,8,'rate_type','select_dropdown','Rate Type',1,1,1,1,1,1,'{\"default\":\"percent\",\"options\":{\"percent\":\"Percent\",\"fixed\":\"Fixed\"},\"validation\":{\"rule\":\"required|in:fixed,percent\"}}',3),(116,8,'rate','text','Rate',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',4),(117,8,'net_price','select_dropdown','Net Price',1,1,1,1,1,1,'{\"default\":\"including\",\"options\":{\"including\":\"Including\",\"excluding\":\"Excluding\"},\"validation\":{\"rule\":\"required|in:including,excluding\"}}',5),(118,8,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Enabled\",\"0\":\"Disabled\"},\"validation\":{\"rule\":\"required\"}}',6),(119,8,'created_at','timestamp','Created At',0,0,1,0,0,0,'\"{}\"',7),(120,8,'updated_at','timestamp','Updated At',0,1,1,0,0,0,'\"{}\"',8),(121,8,'admin_tax','select_dropdown','Admin Tax',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Yes\",\"0\":\"No\"},\"validation\":{\"rule\":\"required\"}}',9),(122,9,'id','text','Id',1,0,0,0,0,0,'\"{}\"',1),(123,9,'title','text','Title',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"max:64\"}}',2),(124,9,'subtitle','text','Subtitle',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"max:64\"}}',3),(125,9,'image','image','Image',1,1,1,1,1,1,'{\"resize\":{\"width\":\"1920\",\"height\":\"1080\"},\"quality\":\"60%\",\"upsize\":true}',4),(126,9,'status','select_dropdown','Status',0,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Enabled\",\"0\":\"Disabled\"},\"validation\":{\"rule\":\"required\"}}',5),(127,9,'created_at','timestamp','Created At',0,0,1,0,0,0,'\"{}\"',6),(128,9,'updated_at','timestamp','Updated At',0,1,1,0,0,0,'\"{}\"',7),(129,9,'button_url','text','Button URL',0,0,1,1,1,1,'\"{}\"',4),(130,9,'button_title','text','Button Title',0,0,1,1,1,1,'\"{}\"',4),(131,9,'order','number','Order',0,0,1,1,1,1,'\"{}\"',4),(132,10,'id','number','Id',1,0,0,0,0,0,'\"{}\"',1),(133,10,'name','text','Name',1,1,1,0,0,0,'\"{}\"',2),(134,10,'email','text','Email',1,1,1,0,0,0,'\"{}\"',3),(135,10,'title','text','Title',1,1,1,0,0,0,'\"{}\"',4),(136,10,'message','text','Message',1,0,1,0,0,0,'\"{}\"',5),(137,10,'read','timestamp','Read',0,0,0,0,0,0,'\"{}\"',6),(138,10,'read_by','number','Read By',0,0,0,0,0,0,'\"{}\"',7),(139,10,'created_at','timestamp','Created At',0,1,1,0,0,0,'\"{}\"',8),(140,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'\"{}\"',9),(141,11,'id','text','Id',1,1,1,0,0,0,'\"{}\"',1),(142,11,'customer_id','text','Customer Id',1,0,0,0,0,0,'\"{}\"',7),(143,11,'organiser_id','text','Organiser Id',0,0,0,0,0,0,'\"{}\"',8),(144,11,'event_id','text','Event Id',1,0,0,0,0,0,'\"{}\"',9),(145,11,'ticket_id','text','Ticket Id',1,0,0,0,0,0,'\"{}\"',10),(146,11,'quantity','text','Quantity',1,1,1,0,0,0,'\"{}\"',12),(147,11,'price','text','Price',1,0,1,0,0,0,'\"{}\"',13),(148,11,'tax','text','Tax',0,0,1,0,0,0,'\"{}\"',14),(149,11,'net_price','text','Net Price',0,1,1,0,0,0,'\"{}\"',15),(150,11,'status','select_dropdown','Status',1,1,1,1,0,0,'{\"default\":\"1\",\"options\":{\"1\":\"Enabled\",\"0\":\"Disabled\"},\"validation\":{\"rule\":\"required\"}}',26),(151,11,'created_at','timestamp','Created At',0,1,1,0,0,0,'\"{}\"',27),(152,11,'updated_at','timestamp','Updated At',0,0,1,0,0,0,'\"{}\"',28),(153,11,'event_title','text','Event Title',1,1,1,0,0,0,'{\"disabled\":\"true\"}',4),(154,11,'event_start_date','text','Event Start Date',0,0,1,0,0,0,'\"{}\"',17),(155,11,'event_end_date','text','Event End Date',0,0,1,0,0,0,'\"{}\"',18),(156,11,'event_start_time','text','Event Start Time',0,0,1,0,0,0,'\"{}\"',19),(157,11,'event_end_time','text','Event End Time',0,0,1,0,0,0,'\"{}\"',20),(158,11,'event_repetitive','text','Event Repetitive',1,0,1,0,0,0,'\"{}\"',21),(159,11,'ticket_title','text','Ticket Title',1,1,1,0,0,0,'{\"disabled\":\"true\"}',6),(160,11,'ticket_price','text','Ticket Price',1,0,1,0,0,0,'\"{}\"',11),(161,11,'event_category','text','Event Category',1,0,1,0,0,0,'\"{}\"',3),(162,11,'booking_cancel','select_dropdown','Booking Cancel',0,1,1,1,0,0,'{\"default\":\"1\",\"options\":{\"1\":\"Cancellation Pending\",\"2\":\"Approved\",\"3\":\"Refunded\",\"0\":\"No Cancellation\"},\"validation\":{\"rule\":\"required\"}}',25),(163,11,'item_sku','text','Item Sku',1,0,1,0,0,0,'\"{}\"',5),(164,11,'order_number','text','Order Number',1,1,1,0,0,0,'{\"disabled\":\"true\"}',2),(165,11,'transaction_id','text','Transaction Id',1,0,1,0,0,0,'\"{}\"',22),(166,11,'customer_name','text','Customer Name',1,0,1,0,0,0,'{\"disabled\":\"true\"}',23),(167,11,'customer_email','text','Customer Email',1,1,1,0,0,0,'{\"disabled\":\"true\"}',24),(168,11,'currency','text','Currency',0,1,1,0,0,0,'\"{}\"',16),(169,11,'checked_in','select_dropdown','Checked In',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Yes\",\"0\":\"No\"},\"validation\":{\"rule\":\"required\"}}',29),(170,11,'payment_type','select_dropdown','Payment Type',1,1,1,1,1,1,'{\"default\":\"online\",\"options\":{\"online\":\"Online\",\"offline\":\"Offline\"},\"validation\":{\"rule\":\"required\"}}',30),(171,11,'is_paid','select_dropdown','Is Paid',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Yes\",\"0\":\"No\"},\"validation\":{\"rule\":\"required\"}}',31),(172,12,'id','text','Id',1,0,0,0,0,0,'\"{}\"',1),(173,12,'organiser_id','text','Organiser Id',1,1,1,1,1,1,'\"{}\"',2),(174,12,'booking_id','text','Booking Id',1,1,1,1,1,1,'\"{}\"',3),(175,12,'admin_commission','text','Admin Commission',1,1,1,1,1,1,'\"{}\"',4),(176,12,'customer_paid','text','Customer Paid',1,1,1,1,1,1,'\"{}\"',5),(177,12,'organiser_earning','text','Organiser Earning',1,1,1,1,1,1,'\"{}\"',6),(178,12,'transferred','text','Transferred',1,1,1,1,1,1,'\"{}\"',7),(179,12,'month_year','text','Month Year',1,1,1,1,1,1,'\"{}\"',8),(180,12,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Enabled\",\"0\":\"Disabled\"},\"validation\":{\"rule\":\"required\"}}',9),(181,12,'created_at','timestamp','Created At',0,1,1,1,0,1,'\"{}\"',10),(182,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'\"{}\"',11),(183,12,'event_id','text','Event Id',0,1,1,1,1,1,'\"{}\"',2),(184,13,'id','text','Id',1,1,1,0,0,0,'\"{}\"',1),(185,13,'title','text','Title',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:512\"},\"placeholder\":\"e.g John Doe\"}',4),(186,13,'type','text','Type',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:512\"},\"placeholder\":\"e.g speaker\"}',5),(187,13,'organizer_id','organiser','Organizer',1,0,1,1,1,1,'\"{}\"',2),(188,13,'description','rich_text_box','Description',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable\"},\"description\":\"Fill this only if you selected Profile Page - Yes\"}',9),(189,13,'image','image','Image',0,1,1,1,1,1,'{\"validation\":{\"rule\":\"nullable\"},\"resize\":{\"width\":\"512\",\"height\":\"512\"},\"quality\":\"70%\",\"upsize\":true,\"description\":\"upload image of size 512x512 pixels.\"}',3),(190,13,'sub_title','text','Sub Title',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable\"},\"placeholder\":\"e.g Business coach & Entrepreneur\"}',6),(191,13,'website','text','Website',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable\"},\"placeholder\":\"e.g http:\\/\\/example.com\"}',7),(192,13,'is_page','select_dropdown','Profile Page',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Yes\",\"0\":\"No\"},\"validation\":{\"rule\":\"required\"},\"description\":\"Select Yes only if you want to show this tag on it\'s profile page.\"}',8),(193,13,'email','text','Email',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable\"},\"placeholder\":\"Fill this only if you selected Profile Page - Yes\"}',11),(194,13,'phone','text','Phone',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable\"},\"placeholder\":\"Fill this only if you selected Profile Page - Yes\"}',10),(195,13,'facebook','text','Facebook',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable\"},\"placeholder\":\"Fill this only if you selected Profile Page - Yes\"}',12),(196,13,'instagram','text','Instagram',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable\"},\"placeholder\":\"Fill this only if you selected Profile Page - Yes\"}',13),(197,13,'twitter','text','Twitter',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable\"},\"placeholder\":\"Fill this only if you selected Profile Page - Yes\"}',14),(198,13,'linkedin','text','Linkedin',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"nullable\"},\"placeholder\":\"Fill this only if you selected Profile Page - Yes\"}',15),(199,13,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Enabled\",\"0\":\"Disabled\"},\"validation\":{\"rule\":\"required\"}}',16),(200,13,'created_at','timestamp','Created At',0,0,1,0,0,0,'\"{}\"',17),(201,13,'updated_at','timestamp','Updated At',0,1,1,0,0,0,'\"{}\"',18);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(1) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','Classiebit\\Eventmie\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','\\Classiebit\\Eventmie\\Http\\Controllers\\Voyager\\VoyagerUserController',NULL,1,1,'{\"order_column\":\"updated_at\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":\"email\",\"scope\":null}','2022-02-23 16:54:31','2022-02-23 16:54:31'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2022-02-23 16:54:31','2022-02-23 16:54:31'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2022-02-23 16:54:31','2022-02-23 16:54:31'),(4,'posts','posts','Post','Posts','voyager-news','Classiebit\\Eventmie\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy',NULL,NULL,1,1,'{\"order_column\":\"updated_at\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":\"title\",\"scope\":null}','2022-02-23 16:54:31','2022-02-23 16:54:31'),(5,'pages','pages','Page','Pages','voyager-file-text','Classiebit\\Eventmie\\Models\\Page',NULL,NULL,NULL,1,0,'{\"order_column\":\"updated_at\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":\"title\",\"scope\":null}','2022-02-23 16:54:31','2022-02-23 16:54:31'),(6,'events','events','Event','Events','voyager-calendar','Classiebit\\Eventmie\\Models\\Event',NULL,'\\Classiebit\\Eventmie\\Http\\Controllers\\Voyager\\EventsController',NULL,1,1,'{\"order_column\":\"updated_at\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":\"title\",\"scope\":null}','2022-02-23 16:54:31','2022-02-23 16:54:31'),(7,'categories','categories','Category','Categories','voyager-categories','Classiebit\\Eventmie\\Models\\Category',NULL,NULL,NULL,1,1,'{\"order_column\":\"updated_at\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":\"name\",\"scope\":null}','2022-02-23 16:54:31','2022-02-23 16:54:31'),(8,'taxes','taxes','Tax','Taxes','voyager-documentation','Classiebit\\Eventmie\\Models\\Tax',NULL,NULL,NULL,1,1,'{\"order_column\":\"updated_at\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":\"title\",\"scope\":null}','2022-02-23 16:54:31','2022-02-23 16:54:31'),(9,'banners','banners','Banner','Banners','voyager-photo','Classiebit\\Eventmie\\Models\\Banner',NULL,NULL,NULL,1,0,'{\"order_column\":\"updated_at\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":\"title\",\"scope\":null}','2022-02-23 16:54:31','2022-02-23 16:54:31'),(10,'contacts','contacts','Contact','Contacts','voyager-mail','Classiebit\\Eventmie\\Models\\Contact',NULL,'\\Classiebit\\Eventmie\\Http\\Controllers\\Voyager\\ContactsController',NULL,1,1,'{\"order_column\":\"updated_at\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":\"name\",\"scope\":null}','2022-02-23 16:54:31','2022-02-23 16:54:31'),(11,'bookings','bookings','Booking','Bookings','voyager-dollar','Classiebit\\Eventmie\\Models\\Booking',NULL,'\\Classiebit\\Eventmie\\Http\\Controllers\\Voyager\\BookingsController',NULL,1,1,'{\"order_column\":\"updated_at\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":\"event_title\",\"scope\":null}','2022-02-23 16:54:31','2022-02-23 16:54:31'),(12,'commissions','commissions','Commission','Commissions','voyager-wallet','Classiebit\\Eventmie\\Models\\Commission',NULL,'\\Classiebit\\Eventmie\\Http\\Controllers\\Voyager\\CommissionsController',NULL,1,0,'{\"order_column\":\"updated_at\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2022-02-23 16:54:31','2022-02-23 16:54:31'),(13,'tags','tags','Tag','Tags','voyager-puzzle','Classiebit\\Eventmie\\Models\\Tag',NULL,NULL,NULL,1,1,'{\"order_column\":\"updated_at\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":\"title\",\"scope\":null}','2022-02-23 16:54:31','2022-02-23 16:54:31');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_tag`
--

DROP TABLE IF EXISTS `event_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_tag` (
  `event_id` int(10) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  KEY `event_tag_event_id_foreign` (`event_id`),
  KEY `event_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `event_tag_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_tag`
--

LOCK TABLES `event_tag` WRITE;
/*!40000 ALTER TABLE `event_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `faq` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poster` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `venue` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `repetitive` tinyint(1) DEFAULT 0,
  `featured` tinyint(1) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `meta_title` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `add_to_facebook` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `price_type` tinyint(1) NOT NULL DEFAULT 0,
  `latitude` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_sku` bigint(20) unsigned NOT NULL DEFAULT 0,
  `publish` tinyint(1) DEFAULT 0,
  `is_publishable` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `merge_schedule` tinyint(1) NOT NULL DEFAULT 0,
  `online_location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `offline_payment_info` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Digital Marketing Seminar','Resolution diminution conviction so mr at unpleasing simplicity',NULL,'events/September2019/1568624877YMeQtcWsib.jpg','events/September2019/15686248775WZJzctOnp.jpg','[\"events\\/September2019\\/1568624877829.jpg\",\"events\\/September2019\\/1568624877526.jpg\",\"events\\/September2019\\/1568624877881.jpg\",\"events\\/September2019\\/1568624877602.jpg\",\"events\\/September2019\\/1568624877549.jpg\",\"events\\/September2019\\/1568624877486.jpg\"]','y2Ky3Wo37AY','History Museum','Feet evil, occasional boisterous','Nagano','Chūbu','111-1212',110,'2022-11-25','2022-11-25','08:00:00','10:30:00',0,0,1,NULL,NULL,NULL,1,2,NULL,'2022-02-23 16:54:31','2022-02-23 16:54:31','digital-marketing-seminar',1,'36.648138','137.9744245',1567428779193,1,'{\"detail\":1,\"location\":1,\"timing\":1,\"publish\":1,\"media\":1,\"tickets\":1}',0,NULL,'Resolution diminution conviction so mr at unpleasing simplicity',NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat','#000000',NULL,1,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.dashboard',NULL),(2,1,'Categories','','_self','voyager-categories','',NULL,2,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.categories.index',NULL),(3,1,'Tags','','_self','voyager-puzzle','',NULL,3,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.tags.index',NULL),(4,1,'Events','','_self','voyager-calendar','#000000',NULL,4,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.events.index',NULL),(5,1,'Bookings','','_self','voyager-dollar','',NULL,5,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.bookings.index',NULL),(6,1,'Commissions','','_self','voyager-wallet','',NULL,6,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.commissions.index',NULL),(7,1,'Taxes','','_self','voyager-documentation','#000000',NULL,7,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.taxes.index',NULL),(8,1,'Users','','_self','voyager-people','#000000',NULL,8,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.users.index',NULL),(9,1,'Contacts','','_self','voyager-mail','#000000',NULL,9,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.contacts.index',NULL),(10,1,'Media','','_self','voyager-images','',NULL,10,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.media.index',NULL),(11,1,'Banners','','_self','voyager-photo','#000000',NULL,11,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.banners.index',NULL),(12,1,'Pages','','_self','voyager-file-text','',NULL,12,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.pages.index',NULL),(13,1,'Blog Posts','','_self','voyager-news','#000000',NULL,13,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.posts.index',NULL),(14,1,'Header Menu','','_self','voyager-list','#000000',NULL,13,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.menus.builder','2'),(15,1,'Footer Menu','','_self','voyager-list','#000000',NULL,13,'2022-02-23 16:54:32','2022-02-23 16:54:32','voyager.menus.builder','3'),(16,1,'Settings','','_self','voyager-settings','',NULL,14,'2022-02-23 16:54:33','2022-02-23 16:54:33','voyager.settings.index',NULL),(17,2,'Popular Events','#','_self','fas fa-star','',NULL,1,'2022-02-23 16:54:33','2022-02-23 16:54:33',NULL,NULL),(18,2,'Digital Marketing Seminar','#','_self','','',17,1,'2022-02-23 16:54:33','2022-02-23 16:54:33',NULL,NULL),(19,2,'Popular Blogs','#','_self','fas fa-blog','',NULL,2,'2022-02-23 16:54:33','2022-02-23 16:54:33',NULL,NULL),(20,2,'Daily Meditation Classes','#','_self','','',19,1,'2022-02-23 16:54:33','2022-02-23 16:54:33',NULL,NULL),(21,3,'Popular Links','#','_self',NULL,'',NULL,1,'2022-02-23 16:54:33','2022-02-23 16:54:33',NULL,NULL),(22,3,'Catalogue Downloads','#','_self','','',21,1,'2022-02-23 16:54:33','2022-02-23 16:54:33',NULL,NULL),(23,3,'Top Categories','#','_self',NULL,'',NULL,2,'2022-02-23 16:54:33','2022-02-23 16:54:33',NULL,NULL),(24,3,'Boat Parties','#','_self','','',23,1,'2022-02-23 16:54:33','2022-02-23 16:54:33',NULL,NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2022-02-23 16:54:32','2022-02-23 16:54:32'),(2,'header','2022-02-23 16:54:32','2022-02-23 16:54:32'),(3,'footer','2022-02-23 16:54:32','2022-02-23 16:54:32');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_10_23_060351_create_permissions_table',1),(5,'2019_10_23_060352_create_roles_table',1),(6,'2019_10_23_060353_create_translations_table',1),(7,'2019_10_23_060354_create_taxes_table',1),(8,'2019_10_23_060355_create_settings_table',1),(9,'2019_10_23_060356_create_posts_table',1),(10,'2019_10_23_060357_create_pages_table',1),(11,'2019_10_23_060358_create_currencies_table',1),(12,'2019_10_23_060359_create_banners_table',1),(13,'2019_10_23_060360_create_categories_table',1),(14,'2019_10_23_060361_create_contacts_table',1),(15,'2019_10_23_060362_create_countries_table',1),(16,'2019_10_23_060363_create_data_types_table',1),(17,'2019_10_23_060364_create_data_rows_table',1),(18,'2019_10_23_060365_create_events_table',1),(19,'2019_10_23_060370_create_menus_table',1),(20,'2019_10_23_060371_create_menu_items_table',1),(21,'2019_10_23_060372_create_notifications_table',1),(22,'2019_10_23_060373_create_permission_role_table',1),(23,'2019_10_23_060374_create_schedules_table',1),(24,'2019_10_23_060375_alter_users_table',1),(25,'2019_10_23_060376_create_user_roles_table',1),(26,'2019_10_23_060377_create_tickets_table',1),(27,'2019_10_23_060378_create_bookings_table',1),(28,'2019_10_23_060379_create_transactions_table',1),(29,'2019_10_23_060380_create_commissions_table',1),(30,'2019_10_23_060401_add_foreign_keys_to_data_rows_table',1),(31,'2019_10_23_060401_add_foreign_keys_to_menu_items_table',1),(32,'2019_10_23_060401_add_foreign_keys_to_permission_role_table',1),(33,'2019_10_23_060401_add_foreign_keys_to_user_roles_table',1),(34,'2019_10_23_060401_add_foreign_keys_to_users_table',1),(35,'2019_12_14_000001_create_personal_access_tokens_table',1),(36,'2020_02_06_100736_add_checked_in_to_bookings_table',1),(37,'2020_02_06_102941_add_bank_detail_to_users_table',1),(38,'2020_02_11_105837_create_tags_table',1),(39,'2020_02_11_111648_create_event_tag_table',1),(40,'2020_02_13_110401_add_event_id_to_commissions_table',1),(41,'2020_02_13_110402_add_event_id_foreign_to_commissions_table',1),(42,'2020_05_05_110402_add_payment_type_to_bookings_table',1),(43,'2020_05_08_124909_add_status_to_users_table',1),(44,'2020_06_25_111246_add_online_location_to_events_table',1),(45,'2020_06_26_130236_add_admin_tax_to_taxes_table',1),(46,'2020_06_26_132219_alter_taxes_table',1),(47,'2020_06_26_132220_create_tax_ticket_table',1),(48,'2020_06_26_132221_alter_tax_ticket_table',1),(49,'2020_06_29_080855_add_is_paid_to_bookings_table',1),(50,'2020_07_23_080856_alter_description_tickets_table',1),(51,'2020_10_14_114518_alter_item_sku_column_to_bookings_table',1),(52,'2020_10_14_120224_add_add_admin_tax_to_commissions_table',1),(53,'2020_10_24_051706_add_foreign_key_to_commissions_table',1),(54,'2021_03_11_133304_add_columns_to_banners_table',1),(55,'2021_03_12_133305_add_columns_to_events_table',1),(56,'2021_07_06_073509_add_is_bulk_column_to_bookings_table',1),(57,'2021_07_21_140221_add_column_to_tickets_table',1),(58,'2021_09_15_151143_add_offline_payment_info_column_to_events_table',1),(59,'2022_01_08_105746_create_serverside_dates_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `n_type` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,1,'About Us','about','Change about us content',NULL,'about','About us description','eventmie','ACTIVE','2022-02-23 16:54:31','2022-02-23 16:54:31'),(2,1,'Privacy Policy','privacy','Change privacy policy',NULL,'privacy','Privacy Policy','privacy','ACTIVE','2022-02-23 16:54:31','2022-02-23 16:54:31'),(3,1,'Terms and Conditions','terms','Change terms & conditions',NULL,'terms','Terms and Conditions','Terms and Conditions','ACTIVE','2022-02-23 16:54:31','2022-02-23 16:54:31');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2022-02-23 16:54:33','2022-02-23 16:54:33'),(2,'browse_bread',NULL,'2022-02-23 16:54:33','2022-02-23 16:54:33'),(3,'browse_database',NULL,'2022-02-23 16:54:33','2022-02-23 16:54:33'),(4,'browse_media',NULL,'2022-02-23 16:54:33','2022-02-23 16:54:33'),(5,'browse_compass',NULL,'2022-02-23 16:54:33','2022-02-23 16:54:33'),(6,'browse_menus','menus','2022-02-23 16:54:33','2022-02-23 16:54:33'),(7,'read_menus','menus','2022-02-23 16:54:33','2022-02-23 16:54:33'),(8,'edit_menus','menus','2022-02-23 16:54:33','2022-02-23 16:54:33'),(9,'add_menus','menus','2022-02-23 16:54:33','2022-02-23 16:54:33'),(10,'delete_menus','menus','2022-02-23 16:54:33','2022-02-23 16:54:33'),(11,'browse_roles','roles','2022-02-23 16:54:33','2022-02-23 16:54:33'),(12,'read_roles','roles','2022-02-23 16:54:33','2022-02-23 16:54:33'),(13,'edit_roles','roles','2022-02-23 16:54:33','2022-02-23 16:54:33'),(14,'add_roles','roles','2022-02-23 16:54:33','2022-02-23 16:54:33'),(15,'delete_roles','roles','2022-02-23 16:54:33','2022-02-23 16:54:33'),(16,'browse_users','users','2022-02-23 16:54:33','2022-02-23 16:54:33'),(17,'read_users','users','2022-02-23 16:54:33','2022-02-23 16:54:33'),(18,'edit_users','users','2022-02-23 16:54:33','2022-02-23 16:54:33'),(19,'add_users','users','2022-02-23 16:54:33','2022-02-23 16:54:33'),(20,'delete_users','users','2022-02-23 16:54:33','2022-02-23 16:54:33'),(21,'browse_settings','settings','2022-02-23 16:54:33','2022-02-23 16:54:33'),(22,'read_settings','settings','2022-02-23 16:54:33','2022-02-23 16:54:33'),(23,'edit_settings','settings','2022-02-23 16:54:33','2022-02-23 16:54:33'),(24,'add_settings','settings','2022-02-23 16:54:33','2022-02-23 16:54:33'),(25,'delete_settings','settings','2022-02-23 16:54:33','2022-02-23 16:54:33'),(26,'browse_posts','posts','2022-02-23 16:54:33','2022-02-23 16:54:33'),(27,'read_posts','posts','2022-02-23 16:54:33','2022-02-23 16:54:33'),(28,'edit_posts','posts','2022-02-23 16:54:33','2022-02-23 16:54:33'),(29,'add_posts','posts','2022-02-23 16:54:33','2022-02-23 16:54:33'),(30,'delete_posts','posts','2022-02-23 16:54:33','2022-02-23 16:54:33'),(31,'browse_pages','pages','2022-02-23 16:54:33','2022-02-23 16:54:33'),(32,'read_pages','pages','2022-02-23 16:54:33','2022-02-23 16:54:33'),(33,'edit_pages','pages','2022-02-23 16:54:33','2022-02-23 16:54:33'),(34,'add_pages','pages','2022-02-23 16:54:33','2022-02-23 16:54:33'),(35,'delete_pages','pages','2022-02-23 16:54:33','2022-02-23 16:54:33'),(36,'browse_events','events','2022-02-23 16:54:33','2022-02-23 16:54:33'),(37,'read_events','events','2022-02-23 16:54:33','2022-02-23 16:54:33'),(38,'edit_events','events','2022-02-23 16:54:33','2022-02-23 16:54:33'),(39,'add_events','events','2022-02-23 16:54:33','2022-02-23 16:54:33'),(40,'delete_events','events','2022-02-23 16:54:33','2022-02-23 16:54:33'),(41,'browse_curriencies','curriencies','2022-02-23 16:54:33','2022-02-23 16:54:33'),(42,'read_curriencies','curriencies','2022-02-23 16:54:33','2022-02-23 16:54:33'),(43,'edit_curriencies','curriencies','2022-02-23 16:54:33','2022-02-23 16:54:33'),(44,'add_curriencies','curriencies','2022-02-23 16:54:33','2022-02-23 16:54:33'),(45,'delete_curriencies','curriencies','2022-02-23 16:54:33','2022-02-23 16:54:33'),(46,'browse_categories','categories','2022-02-23 16:54:33','2022-02-23 16:54:33'),(47,'read_categories','categories','2022-02-23 16:54:33','2022-02-23 16:54:33'),(48,'edit_categories','categories','2022-02-23 16:54:33','2022-02-23 16:54:33'),(49,'add_categories','categories','2022-02-23 16:54:33','2022-02-23 16:54:33'),(50,'delete_categories','categories','2022-02-23 16:54:33','2022-02-23 16:54:33'),(51,'browse_taxes','taxes','2022-02-23 16:54:33','2022-02-23 16:54:33'),(52,'read_taxes','taxes','2022-02-23 16:54:33','2022-02-23 16:54:33'),(53,'edit_taxes','taxes','2022-02-23 16:54:33','2022-02-23 16:54:33'),(54,'add_taxes','taxes','2022-02-23 16:54:33','2022-02-23 16:54:33'),(55,'delete_taxes','taxes','2022-02-23 16:54:33','2022-02-23 16:54:33'),(56,'browse_banners','banners','2022-02-23 16:54:33','2022-02-23 16:54:33'),(57,'read_banners','banners','2022-02-23 16:54:33','2022-02-23 16:54:33'),(58,'edit_banners','banners','2022-02-23 16:54:33','2022-02-23 16:54:33'),(59,'add_banners','banners','2022-02-23 16:54:33','2022-02-23 16:54:33'),(60,'delete_banners','banners','2022-02-23 16:54:33','2022-02-23 16:54:33'),(61,'browse_contacts','contacts','2022-02-23 16:54:33','2022-02-23 16:54:33'),(62,'read_contacts','contacts','2022-02-23 16:54:33','2022-02-23 16:54:33'),(63,'edit_contacts','contacts','2022-02-23 16:54:33','2022-02-23 16:54:33'),(64,'add_contacts','contacts','2022-02-23 16:54:33','2022-02-23 16:54:33'),(65,'delete_contacts','contacts','2022-02-23 16:54:33','2022-02-23 16:54:33'),(66,'browse_bookings','bookings','2022-02-23 16:54:33','2022-02-23 16:54:33'),(67,'read_bookings','bookings','2022-02-23 16:54:33','2022-02-23 16:54:33'),(68,'edit_bookings','bookings','2022-02-23 16:54:33','2022-02-23 16:54:33'),(69,'add_bookings','bookings','2022-02-23 16:54:33','2022-02-23 16:54:33'),(70,'delete_bookings','bookings','2022-02-23 16:54:33','2022-02-23 16:54:33'),(71,'browse_commissions','commissions','2022-02-23 16:54:33','2022-02-23 16:54:33'),(72,'read_commissions','commissions','2022-02-23 16:54:33','2022-02-23 16:54:33'),(73,'edit_commissions','commissions','2022-02-23 16:54:33','2022-02-23 16:54:33'),(74,'add_commissions','commissions','2022-02-23 16:54:33','2022-02-23 16:54:33'),(75,'delete_commissions','commissions','2022-02-23 16:54:33','2022-02-23 16:54:33'),(76,'browse_tags','tags','2022-02-23 16:54:33','2022-02-23 16:54:33'),(77,'read_tags','tags','2022-02-23 16:54:33','2022-02-23 16:54:33'),(78,'edit_tags','tags','2022-02-23 16:54:33','2022-02-23 16:54:33'),(79,'add_tags','tags','2022-02-23 16:54:33','2022-02-23 16:54:33'),(80,'delete_tags','tags','2022-02-23 16:54:33','2022-02-23 16:54:33');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,1,'How Eventmie Works For Organisers','How Eventmie Works For Organisers','Post demo content','<p><strong>Post demo content</strong>','posts/September2019/fTER87e1L3Oz3jVk5hBm.jpg','how-eventmie-works-for-organisers','Post demo content',NULL,'PUBLISHED',0,'2022-02-23 16:54:31','2022-02-23 16:54:31'),(2,1,1,'How Eventmie Works For Customers','How Eventmie Works For Customers','Post demo content','<p><strong>Post demo content</strong>','posts/September2019/yfPw86UOUDYc4WDgUCrG.jpg','how-eventmie-works-for-customers','Post demo content',NULL,'PUBLISHED',0,'2022-02-23 16:54:31','2022-02-23 16:54:31'),(3,1,1,'How Eventmie Works As Multi-Vendor','How Eventmie Works As Multi-Vendor','Post demo content','<p><strong>Post demo content</strong>','posts/September2019/zU68cPYMfcWlVD7bKIrB.jpg','how-eventmie-works-as-multi-vendor','Post demo content',NULL,'PUBLISHED',0,'2022-02-23 16:54:31','2022-02-23 16:54:31');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2022-02-23 16:54:31','2022-02-23 16:54:31'),(2,'customer','Customer (non-admin)','2022-02-23 16:54:31','2022-02-23 16:54:31'),(3,'organiser','Organiser (Semi-admin)','2022-02-23 16:54:31','2022-02-23 16:54:31');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repetitive_type` tinyint(1) NOT NULL,
  `repetitive_days` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `repetitive_dates` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `from_time` time DEFAULT NULL,
  `to_time` time DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serverside_dates`
--

DROP TABLE IF EXISTS `serverside_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serverside_dates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_date` date NOT NULL,
  `dates` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serverside_dates_event_id_foreign` (`event_id`),
  KEY `serverside_dates_user_id_foreign` (`user_id`),
  CONSTRAINT `serverside_dates_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `serverside_dates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serverside_dates`
--

LOCK TABLES `serverside_dates` WRITE;
/*!40000 ALTER TABLE `serverside_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `serverside_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.site_name','Site Name','Eventmie Pro',NULL,'text',1,'Site'),(2,'site.site_slogan','Site Slogan','Host Events. Sell Tickets.',NULL,'text',2,'Site'),(3,'site.site_footer','Extra Footer Credits','Eventmie Pro <strong>v1.7<strong>. Product by <a href=\'https://www.classiebit.com\' target=\'_blank\'>Classiebit</a>',NULL,'text',2,'Site'),(4,'site.logo','Site Logo','settings/August2019/16q81BieqYZYajLI5zBU.png',NULL,'image',3,'Site'),(5,'site.site_favicon','Site Favicon','settings/August2019/zHUD52Q2ZhZiephfkNxu.png',NULL,'image',4,'Site'),(6,'seo.meta_title','Meta Title','Eventmie Pro',NULL,'text',5,'SEO'),(7,'seo.meta_description','Meta Description','eventmie',NULL,'text',7,'SEO'),(8,'social.facebook','Facebook Page Username','classiebitsoftwares',NULL,'text',8,'Social'),(9,'social.twitter','Twitter Account Username','classiebit',NULL,'text',9,'Social'),(10,'social.instagram','Instagram URL','https://www.instagram.com/classiebitofficial/',NULL,'text',10,'Social'),(11,'social.linkedin','Linkedin URL','https://www.linkedin.com/company/classiebit/',NULL,'text',11,'Social'),(12,'contact.address','Address','85 Golden Street, Darlinghurst ERP 2019, United States',NULL,'text_area',12,'Contact'),(13,'contact.phone','Phone','1800-180-0808',NULL,'text',13,'Contact'),(14,'contact.email','Email','info@eventmie.com',NULL,'text',14,'Contact'),(15,'contact.google_map_lat','Google Map Lat','',NULL,'text',15,'Contact'),(16,'contact.google_map_long','Google Map Long','',NULL,'text',16,'Contact'),(17,'booking.pre_booking_time','Pre Booking Time (hours)','2',NULL,'text',17,'Booking'),(18,'booking.pre_cancellation_time','Pre Cancellation Time (hours)','1',NULL,'text',18,'Booking'),(19,'booking.max_ticket_qty','Max Ticket Qty Limit Per Order','5','{\"description\":\"Set Max ticket quantity limit to be purchased in single order. WARNING: keep it under 100\"}','text',19,'Booking'),(20,'booking.hide_expire_events','Hide Expired Events','0','{\"validation\":{\"rule\":\"in:0,1,on,off\"}}','checkbox',20,'Booking'),(21,'booking.offline_payment_organizer','Allow Offline Payment For Organizer','0','{\"validation\":{\"rule\":\"in:0,1,on,off\"}}','checkbox',21,'Booking'),(22,'booking.offline_payment_customer','Allow Offline Payment For Customer','0','{\"validation\":{\"rule\":\"in:0,1,on,off\"}}','checkbox',22,'Booking'),(23,'multi-vendor.multi_vendor','Multi Organisation/Vendor Mode','1','{\"validation\":{\"rule\":\"in:0,1,on,off\"}}','checkbox',21,'Multi-vendor'),(24,'multi-vendor.admin_commission','Admin Commission % (add positive integer value only e.g 5)','5',NULL,'text',22,'Multi-vendor'),(25,'admin.bg_image','Admin Background Image','settings/August2019/1eGBkULS8ZGkR9Kntzps.jpg',NULL,'image',23,'Admin'),(26,'admin.title','Admin Title','Eventmie Pro',NULL,'text',24,'Admin'),(27,'admin.description','Admin Description','Eventmie Pro Admin Panel',NULL,'text',25,'Admin'),(28,'admin.loader','Admin Loader','',NULL,'image',26,'Admin'),(29,'admin.icon_image','Admin Icon Image','settings/August2019/Lcp6sngWhfOz3sPRLKLx.png',NULL,'image',27,'Admin'),(30,'apps.google_client_id','Google Client ID','',NULL,'text',28,'Apps'),(31,'apps.google_client_secret','Google Client Secret','',NULL,'text',29,'Apps'),(32,'apps.google_map_key','Google Map Key','',NULL,'text',30,'Apps'),(33,'apps.facebook_app_id','Facebook App Id','',NULL,'text',31,'Apps'),(34,'apps.facebook_app_secret','Facebook App Secret','',NULL,'text',32,'Apps'),(35,'apps.paypal_client_id','PayPal Client Id','',NULL,'text',33,'Apps'),(36,'apps.paypal_secret','PayPal Secret','',NULL,'text',34,'Apps'),(37,'apps.paypal_mode','PayPal Production Mode','0','{\"validation\":{\"rule\":\"in:0,1,on,off\"}}','checkbox',35,'Apps'),(38,'mail.mail_driver','Mail Driver','',NULL,'text',36,'Mail'),(39,'mail.mail_host','Mail Host','',NULL,'text',37,'Mail'),(40,'mail.mail_port','Mail Port','',NULL,'text',38,'Mail'),(41,'mail.mail_username','Mail Username','',NULL,'text',39,'Mail'),(42,'mail.mail_password','Mail Password','',NULL,'password',40,'Mail'),(43,'mail.mail_encryption','Mail Encryption','0','{\"default\":\"0\",\"options\":{\"0\":\"Disable\",\"SSL\":\"SSL\",\"TLS\":\"TLS\"}}','select_dropdown',41,'Mail'),(44,'mail.mail_sender_email','Mail Sender Email','eventmie@classiebit.com',NULL,'text',42,'Mail'),(45,'mail.mail_sender_name','Mail Sender Name','Eventmie Pro',NULL,'text',43,'Mail'),(46,'regional.timezone_default','Timezone','Asia/Kolkata','{\"default\":\"Asia\\/Kolkata\",\"options\":{\"Africa\\/Abidjan\":\"Africa\\/Abidjan\",\"Africa\\/Accra\":\"Africa\\/Accra\",\"Africa\\/Algiers\":\"Africa\\/Algiers\",\"Africa\\/Bissau\":\"Africa\\/Bissau\",\"Africa\\/Cairo\":\"Africa\\/Cairo\",\"Africa\\/Casablanca\":\"Africa\\/Casablanca\",\"Africa\\/Ceuta\":\"Africa\\/Ceuta\",\"Africa\\/El_Aaiun\":\"Africa\\/El_Aaiun\",\"Africa\\/Johannesburg\":\"Africa\\/Johannesburg\",\"Africa\\/Juba\":\"Africa\\/Juba\",\"Africa\\/Khartoum\":\"Africa\\/Khartoum\",\"Africa\\/Lagos\":\"Africa\\/Lagos\",\"Africa\\/Maputo\":\"Africa\\/Maputo\",\"Africa\\/Monrovia\":\"Africa\\/Monrovia\",\"Africa\\/Nairobi\":\"Africa\\/Nairobi\",\"Africa\\/Ndjamena\":\"Africa\\/Ndjamena\",\"Africa\\/Sao_Tome\":\"Africa\\/Sao_Tome\",\"Africa\\/Tripoli\":\"Africa\\/Tripoli\",\"Africa\\/Tunis\":\"Africa\\/Tunis\",\"Africa\\/Windhoek\":\"Africa\\/Windhoek\",\"America\\/Adak\":\"America\\/Adak\",\"America\\/Anchorage\":\"America\\/Anchorage\",\"America\\/Araguaina\":\"America\\/Araguaina\",\"America\\/Argentina\\/Buenos_Aires\":\"America\\/Argentina\\/Buenos_Aires\",\"America\\/Argentina\\/Catamarca\":\"America\\/Argentina\\/Catamarca\",\"America\\/Argentina\\/Cordoba\":\"America\\/Argentina\\/Cordoba\",\"America\\/Argentina\\/Jujuy\":\"America\\/Argentina\\/Jujuy\",\"America\\/Argentina\\/La_Rioja\":\"America\\/Argentina\\/La_Rioja\",\"America\\/Argentina\\/Mendoza\":\"America\\/Argentina\\/Mendoza\",\"America\\/Argentina\\/Rio_Gallegos\":\"America\\/Argentina\\/Rio_Gallegos\",\"America\\/Argentina\\/Salta\":\"America\\/Argentina\\/Salta\",\"America\\/Argentina\\/San_Juan\":\"America\\/Argentina\\/San_Juan\",\"America\\/Argentina\\/San_Luis\":\"America\\/Argentina\\/San_Luis\",\"America\\/Argentina\\/Tucuman\":\"America\\/Argentina\\/Tucuman\",\"America\\/Argentina\\/Ushuaia\":\"America\\/Argentina\\/Ushuaia\",\"America\\/Asuncion\":\"America\\/Asuncion\",\"America\\/Atikokan\":\"America\\/Atikokan\",\"America\\/Bahia\":\"America\\/Bahia\",\"America\\/Bahia_Banderas\":\"America\\/Bahia_Banderas\",\"America\\/Barbados\":\"America\\/Barbados\",\"America\\/Belem\":\"America\\/Belem\",\"America\\/Belize\":\"America\\/Belize\",\"America\\/Blanc-Sablon\":\"America\\/Blanc-Sablon\",\"America\\/Boa_Vista\":\"America\\/Boa_Vista\",\"America\\/Bogota\":\"America\\/Bogota\",\"America\\/Boise\":\"America\\/Boise\",\"America\\/Cambridge_Bay\":\"America\\/Cambridge_Bay\",\"America\\/Campo_Grande\":\"America\\/Campo_Grande\",\"America\\/Cancun\":\"America\\/Cancun\",\"America\\/Caracas\":\"America\\/Caracas\",\"America\\/Cayenne\":\"America\\/Cayenne\",\"America\\/Chicago\":\"America\\/Chicago\",\"America\\/Chihuahua\":\"America\\/Chihuahua\",\"America\\/Costa_Rica\":\"America\\/Costa_Rica\",\"America\\/Creston\":\"America\\/Creston\",\"America\\/Cuiaba\":\"America\\/Cuiaba\",\"America\\/Curacao\":\"America\\/Curacao\",\"America\\/Danmarkshavn\":\"America\\/Danmarkshavn\",\"America\\/Dawson\":\"America\\/Dawson\",\"America\\/Dawson_Creek\":\"America\\/Dawson_Creek\",\"America\\/Denver\":\"America\\/Denver\",\"America\\/Detroit\":\"America\\/Detroit\",\"America\\/Edmonton\":\"America\\/Edmonton\",\"America\\/Eirunepe\":\"America\\/Eirunepe\",\"America\\/El_Salvador\":\"America\\/El_Salvador\",\"America\\/Fort_Nelson\":\"America\\/Fort_Nelson\",\"America\\/Fortaleza\":\"America\\/Fortaleza\",\"America\\/Glace_Bay\":\"America\\/Glace_Bay\",\"America\\/Godthab\":\"America\\/Godthab\",\"America\\/Goose_Bay\":\"America\\/Goose_Bay\",\"America\\/Grand_Turk\":\"America\\/Grand_Turk\",\"America\\/Guatemala\":\"America\\/Guatemala\",\"America\\/Guayaquil\":\"America\\/Guayaquil\",\"America\\/Guyana\":\"America\\/Guyana\",\"America\\/Halifax\":\"America\\/Halifax\",\"America\\/Havana\":\"America\\/Havana\",\"America\\/Hermosillo\":\"America\\/Hermosillo\",\"America\\/Indiana\\/Indianapolis\":\"America\\/Indiana\\/Indianapolis\",\"America\\/Indiana\\/Knox\":\"America\\/Indiana\\/Knox\",\"America\\/Indiana\\/Marengo\":\"America\\/Indiana\\/Marengo\",\"America\\/Indiana\\/Petersburg\":\"America\\/Indiana\\/Petersburg\",\"America\\/Indiana\\/Tell_City\":\"America\\/Indiana\\/Tell_City\",\"America\\/Indiana\\/Vevay\":\"America\\/Indiana\\/Vevay\",\"America\\/Indiana\\/Vincennes\":\"America\\/Indiana\\/Vincennes\",\"America\\/Indiana\\/Winamac\":\"America\\/Indiana\\/Winamac\",\"America\\/Inuvik\":\"America\\/Inuvik\",\"America\\/Iqaluit\":\"America\\/Iqaluit\",\"America\\/Jamaica\":\"America\\/Jamaica\",\"America\\/Juneau\":\"America\\/Juneau\",\"America\\/Kentucky\\/Louisville\":\"America\\/Kentucky\\/Louisville\",\"America\\/Kentucky\\/Monticello\":\"America\\/Kentucky\\/Monticello\",\"America\\/La_Paz\":\"America\\/La_Paz\",\"America\\/Lima\":\"America\\/Lima\",\"America\\/Los_Angeles\":\"America\\/Los_Angeles\",\"America\\/Maceio\":\"America\\/Maceio\",\"America\\/Managua\":\"America\\/Managua\",\"America\\/Manaus\":\"America\\/Manaus\",\"America\\/Martinique\":\"America\\/Martinique\",\"America\\/Matamoros\":\"America\\/Matamoros\",\"America\\/Mazatlan\":\"America\\/Mazatlan\",\"America\\/Menominee\":\"America\\/Menominee\",\"America\\/Merida\":\"America\\/Merida\",\"America\\/Metlakatla\":\"America\\/Metlakatla\",\"America\\/Mexico_City\":\"America\\/Mexico_City\",\"America\\/Miquelon\":\"America\\/Miquelon\",\"America\\/Moncton\":\"America\\/Moncton\",\"America\\/Monterrey\":\"America\\/Monterrey\",\"America\\/Montevideo\":\"America\\/Montevideo\",\"America\\/Nassau\":\"America\\/Nassau\",\"America\\/New_York\":\"America\\/New_York\",\"America\\/Nipigon\":\"America\\/Nipigon\",\"America\\/Nome\":\"America\\/Nome\",\"America\\/Noronha\":\"America\\/Noronha\",\"America\\/North_Dakota\\/Beulah\":\"America\\/North_Dakota\\/Beulah\",\"America\\/North_Dakota\\/Center\":\"America\\/North_Dakota\\/Center\",\"America\\/North_Dakota\\/New_Salem\":\"America\\/North_Dakota\\/New_Salem\",\"America\\/Ojinaga\":\"America\\/Ojinaga\",\"America\\/Panama\":\"America\\/Panama\",\"America\\/Pangnirtung\":\"America\\/Pangnirtung\",\"America\\/Paramaribo\":\"America\\/Paramaribo\",\"America\\/Phoenix\":\"America\\/Phoenix\",\"America\\/Port-au-Prince\":\"America\\/Port-au-Prince\",\"America\\/Port_of_Spain\":\"America\\/Port_of_Spain\",\"America\\/Porto_Velho\":\"America\\/Porto_Velho\",\"America\\/Puerto_Rico\":\"America\\/Puerto_Rico\",\"America\\/Punta_Arenas\":\"America\\/Punta_Arenas\",\"America\\/Rainy_River\":\"America\\/Rainy_River\",\"America\\/Rankin_Inlet\":\"America\\/Rankin_Inlet\",\"America\\/Recife\":\"America\\/Recife\",\"America\\/Regina\":\"America\\/Regina\",\"America\\/Resolute\":\"America\\/Resolute\",\"America\\/Rio_Branco\":\"America\\/Rio_Branco\",\"America\\/Santarem\":\"America\\/Santarem\",\"America\\/Santiago\":\"America\\/Santiago\",\"America\\/Santo_Domingo\":\"America\\/Santo_Domingo\",\"America\\/Sao_Paulo\":\"America\\/Sao_Paulo\",\"America\\/Scoresbysund\":\"America\\/Scoresbysund\",\"America\\/Sitka\":\"America\\/Sitka\",\"America\\/St_Johns\":\"America\\/St_Johns\",\"America\\/Swift_Current\":\"America\\/Swift_Current\",\"America\\/Tegucigalpa\":\"America\\/Tegucigalpa\",\"America\\/Thule\":\"America\\/Thule\",\"America\\/Thunder_Bay\":\"America\\/Thunder_Bay\",\"America\\/Tijuana\":\"America\\/Tijuana\",\"America\\/Toronto\":\"America\\/Toronto\",\"America\\/Vancouver\":\"America\\/Vancouver\",\"America\\/Whitehorse\":\"America\\/Whitehorse\",\"America\\/Winnipeg\":\"America\\/Winnipeg\",\"America\\/Yakutat\":\"America\\/Yakutat\",\"America\\/Yellowknife\":\"America\\/Yellowknife\",\"Antarctica\\/Casey\":\"Antarctica\\/Casey\",\"Antarctica\\/Davis\":\"Antarctica\\/Davis\",\"Antarctica\\/DumontDUrville\":\"Antarctica\\/DumontDUrville\",\"Antarctica\\/Macquarie\":\"Antarctica\\/Macquarie\",\"Antarctica\\/Mawson\":\"Antarctica\\/Mawson\",\"Antarctica\\/Palmer\":\"Antarctica\\/Palmer\",\"Antarctica\\/Rothera\":\"Antarctica\\/Rothera\",\"Antarctica\\/Syowa\":\"Antarctica\\/Syowa\",\"Antarctica\\/Troll\":\"Antarctica\\/Troll\",\"Antarctica\\/Vostok\":\"Antarctica\\/Vostok\",\"Asia\\/Almaty\":\"Asia\\/Almaty\",\"Asia\\/Amman\":\"Asia\\/Amman\",\"Asia\\/Anadyr\":\"Asia\\/Anadyr\",\"Asia\\/Aqtau\":\"Asia\\/Aqtau\",\"Asia\\/Aqtobe\":\"Asia\\/Aqtobe\",\"Asia\\/Ashgabat\":\"Asia\\/Ashgabat\",\"Asia\\/Atyrau\":\"Asia\\/Atyrau\",\"Asia\\/Baghdad\":\"Asia\\/Baghdad\",\"Asia\\/Baku\":\"Asia\\/Baku\",\"Asia\\/Bangkok\":\"Asia\\/Bangkok\",\"Asia\\/Barnaul\":\"Asia\\/Barnaul\",\"Asia\\/Beirut\":\"Asia\\/Beirut\",\"Asia\\/Bishkek\":\"Asia\\/Bishkek\",\"Asia\\/Brunei\":\"Asia\\/Brunei\",\"Asia\\/Chita\":\"Asia\\/Chita\",\"Asia\\/Choibalsan\":\"Asia\\/Choibalsan\",\"Asia\\/Colombo\":\"Asia\\/Colombo\",\"Asia\\/Damascus\":\"Asia\\/Damascus\",\"Asia\\/Dhaka\":\"Asia\\/Dhaka\",\"Asia\\/Dili\":\"Asia\\/Dili\",\"Asia\\/Dubai\":\"Asia\\/Dubai\",\"Asia\\/Dushanbe\":\"Asia\\/Dushanbe\",\"Asia\\/Famagusta\":\"Asia\\/Famagusta\",\"Asia\\/Gaza\":\"Asia\\/Gaza\",\"Asia\\/Hebron\":\"Asia\\/Hebron\",\"Asia\\/Ho_Chi_Minh\":\"Asia\\/Ho_Chi_Minh\",\"Asia\\/Hong_Kong\":\"Asia\\/Hong_Kong\",\"Asia\\/Hovd\":\"Asia\\/Hovd\",\"Asia\\/Irkutsk\":\"Asia\\/Irkutsk\",\"Asia\\/Jakarta\":\"Asia\\/Jakarta\",\"Asia\\/Jayapura\":\"Asia\\/Jayapura\",\"Asia\\/Jerusalem\":\"Asia\\/Jerusalem\",\"Asia\\/Kabul\":\"Asia\\/Kabul\",\"Asia\\/Kamchatka\":\"Asia\\/Kamchatka\",\"Asia\\/Karachi\":\"Asia\\/Karachi\",\"Asia\\/Kathmandu\":\"Asia\\/Kathmandu\",\"Asia\\/Khandyga\":\"Asia\\/Khandyga\",\"Asia\\/Kolkata\":\"Asia\\/Kolkata\",\"Asia\\/Krasnoyarsk\":\"Asia\\/Krasnoyarsk\",\"Asia\\/Kuala_Lumpur\":\"Asia\\/Kuala_Lumpur\",\"Asia\\/Kuching\":\"Asia\\/Kuching\",\"Asia\\/Macau\":\"Asia\\/Macau\",\"Asia\\/Magadan\":\"Asia\\/Magadan\",\"Asia\\/Makassar\":\"Asia\\/Makassar\",\"Asia\\/Manila\":\"Asia\\/Manila\",\"Asia\\/Nicosia\":\"Asia\\/Nicosia\",\"Asia\\/Novokuznetsk\":\"Asia\\/Novokuznetsk\",\"Asia\\/Novosibirsk\":\"Asia\\/Novosibirsk\",\"Asia\\/Omsk\":\"Asia\\/Omsk\",\"Asia\\/Oral\":\"Asia\\/Oral\",\"Asia\\/Pontianak\":\"Asia\\/Pontianak\",\"Asia\\/Pyongyang\":\"Asia\\/Pyongyang\",\"Asia\\/Qatar\":\"Asia\\/Qatar\",\"Asia\\/Qostanay\":\"Asia\\/Qostanay\",\"Asia\\/Qyzylorda\":\"Asia\\/Qyzylorda\",\"Asia\\/Riyadh\":\"Asia\\/Riyadh\",\"Asia\\/Sakhalin\":\"Asia\\/Sakhalin\",\"Asia\\/Samarkand\":\"Asia\\/Samarkand\",\"Asia\\/Seoul\":\"Asia\\/Seoul\",\"Asia\\/Shanghai\":\"Asia\\/Shanghai\",\"Asia\\/Singapore\":\"Asia\\/Singapore\",\"Asia\\/Srednekolymsk\":\"Asia\\/Srednekolymsk\",\"Asia\\/Taipei\":\"Asia\\/Taipei\",\"Asia\\/Tashkent\":\"Asia\\/Tashkent\",\"Asia\\/Tbilisi\":\"Asia\\/Tbilisi\",\"Asia\\/Tehran\":\"Asia\\/Tehran\",\"Asia\\/Thimphu\":\"Asia\\/Thimphu\",\"Asia\\/Tokyo\":\"Asia\\/Tokyo\",\"Asia\\/Tomsk\":\"Asia\\/Tomsk\",\"Asia\\/Ulaanbaatar\":\"Asia\\/Ulaanbaatar\",\"Asia\\/Urumqi\":\"Asia\\/Urumqi\",\"Asia\\/Ust-Nera\":\"Asia\\/Ust-Nera\",\"Asia\\/Vladivostok\":\"Asia\\/Vladivostok\",\"Asia\\/Yakutsk\":\"Asia\\/Yakutsk\",\"Asia\\/Yangon\":\"Asia\\/Yangon\",\"Asia\\/Yekaterinburg\":\"Asia\\/Yekaterinburg\",\"Asia\\/Yerevan\":\"Asia\\/Yerevan\",\"Atlantic\\/Azores\":\"Atlantic\\/Azores\",\"Atlantic\\/Bermuda\":\"Atlantic\\/Bermuda\",\"Atlantic\\/Canary\":\"Atlantic\\/Canary\",\"Atlantic\\/Cape_Verde\":\"Atlantic\\/Cape_Verde\",\"Atlantic\\/Faroe\":\"Atlantic\\/Faroe\",\"Atlantic\\/Madeira\":\"Atlantic\\/Madeira\",\"Atlantic\\/Reykjavik\":\"Atlantic\\/Reykjavik\",\"Atlantic\\/South_Georgia\":\"Atlantic\\/South_Georgia\",\"Atlantic\\/Stanley\":\"Atlantic\\/Stanley\",\"Australia\\/Adelaide\":\"Australia\\/Adelaide\",\"Australia\\/Brisbane\":\"Australia\\/Brisbane\",\"Australia\\/Broken_Hill\":\"Australia\\/Broken_Hill\",\"Australia\\/Currie\":\"Australia\\/Currie\",\"Australia\\/Darwin\":\"Australia\\/Darwin\",\"Australia\\/Eucla\":\"Australia\\/Eucla\",\"Australia\\/Hobart\":\"Australia\\/Hobart\",\"Australia\\/Lindeman\":\"Australia\\/Lindeman\",\"Australia\\/Lord_Howe\":\"Australia\\/Lord_Howe\",\"Australia\\/Melbourne\":\"Australia\\/Melbourne\",\"Australia\\/Perth\":\"Australia\\/Perth\",\"Australia\\/Sydney\":\"Australia\\/Sydney\",\"Europe\\/Amsterdam\":\"Europe\\/Amsterdam\",\"Europe\\/Andorra\":\"Europe\\/Andorra\",\"Europe\\/Astrakhan\":\"Europe\\/Astrakhan\",\"Europe\\/Athens\":\"Europe\\/Athens\",\"Europe\\/Belgrade\":\"Europe\\/Belgrade\",\"Europe\\/Berlin\":\"Europe\\/Berlin\",\"Europe\\/Brussels\":\"Europe\\/Brussels\",\"Europe\\/Bucharest\":\"Europe\\/Bucharest\",\"Europe\\/Budapest\":\"Europe\\/Budapest\",\"Europe\\/Chisinau\":\"Europe\\/Chisinau\",\"Europe\\/Copenhagen\":\"Europe\\/Copenhagen\",\"Europe\\/Dublin\":\"Europe\\/Dublin\",\"Europe\\/Gibraltar\":\"Europe\\/Gibraltar\",\"Europe\\/Helsinki\":\"Europe\\/Helsinki\",\"Europe\\/Istanbul\":\"Europe\\/Istanbul\",\"Europe\\/Kaliningrad\":\"Europe\\/Kaliningrad\",\"Europe\\/Kiev\":\"Europe\\/Kiev\",\"Europe\\/Kirov\":\"Europe\\/Kirov\",\"Europe\\/Lisbon\":\"Europe\\/Lisbon\",\"Europe\\/London\":\"Europe\\/London\",\"Europe\\/Luxembourg\":\"Europe\\/Luxembourg\",\"Europe\\/Madrid\":\"Europe\\/Madrid\",\"Europe\\/Malta\":\"Europe\\/Malta\",\"Europe\\/Minsk\":\"Europe\\/Minsk\",\"Europe\\/Monaco\":\"Europe\\/Monaco\",\"Europe\\/Moscow\":\"Europe\\/Moscow\",\"Europe\\/Oslo\":\"Europe\\/Oslo\",\"Europe\\/Paris\":\"Europe\\/Paris\",\"Europe\\/Prague\":\"Europe\\/Prague\",\"Europe\\/Riga\":\"Europe\\/Riga\",\"Europe\\/Rome\":\"Europe\\/Rome\",\"Europe\\/Samara\":\"Europe\\/Samara\",\"Europe\\/Saratov\":\"Europe\\/Saratov\",\"Europe\\/Simferopol\":\"Europe\\/Simferopol\",\"Europe\\/Sofia\":\"Europe\\/Sofia\",\"Europe\\/Stockholm\":\"Europe\\/Stockholm\",\"Europe\\/Tallinn\":\"Europe\\/Tallinn\",\"Europe\\/Tirane\":\"Europe\\/Tirane\",\"Europe\\/Ulyanovsk\":\"Europe\\/Ulyanovsk\",\"Europe\\/Uzhgorod\":\"Europe\\/Uzhgorod\",\"Europe\\/Vienna\":\"Europe\\/Vienna\",\"Europe\\/Vilnius\":\"Europe\\/Vilnius\",\"Europe\\/Volgograd\":\"Europe\\/Volgograd\",\"Europe\\/Warsaw\":\"Europe\\/Warsaw\",\"Europe\\/Zaporozhye\":\"Europe\\/Zaporozhye\",\"Europe\\/Zurich\":\"Europe\\/Zurich\",\"Indian\\/Chagos\":\"Indian\\/Chagos\",\"Indian\\/Christmas\":\"Indian\\/Christmas\",\"Indian\\/Cocos\":\"Indian\\/Cocos\",\"Indian\\/Kerguelen\":\"Indian\\/Kerguelen\",\"Indian\\/Mahe\":\"Indian\\/Mahe\",\"Indian\\/Maldives\":\"Indian\\/Maldives\",\"Indian\\/Mauritius\":\"Indian\\/Mauritius\",\"Indian\\/Reunion\":\"Indian\\/Reunion\",\"Pacific\\/Apia\":\"Pacific\\/Apia\",\"Pacific\\/Auckland\":\"Pacific\\/Auckland\",\"Pacific\\/Bougainville\":\"Pacific\\/Bougainville\",\"Pacific\\/Chatham\":\"Pacific\\/Chatham\",\"Pacific\\/Chuuk\":\"Pacific\\/Chuuk\",\"Pacific\\/Easter\":\"Pacific\\/Easter\",\"Pacific\\/Efate\":\"Pacific\\/Efate\",\"Pacific\\/Enderbury\":\"Pacific\\/Enderbury\",\"Pacific\\/Fakaofo\":\"Pacific\\/Fakaofo\",\"Pacific\\/Fiji\":\"Pacific\\/Fiji\",\"Pacific\\/Funafuti\":\"Pacific\\/Funafuti\",\"Pacific\\/Galapagos\":\"Pacific\\/Galapagos\",\"Pacific\\/Gambier\":\"Pacific\\/Gambier\",\"Pacific\\/Guadalcanal\":\"Pacific\\/Guadalcanal\",\"Pacific\\/Guam\":\"Pacific\\/Guam\",\"Pacific\\/Honolulu\":\"Pacific\\/Honolulu\",\"Pacific\\/Kiritimati\":\"Pacific\\/Kiritimati\",\"Pacific\\/Kosrae\":\"Pacific\\/Kosrae\",\"Pacific\\/Kwajalein\":\"Pacific\\/Kwajalein\",\"Pacific\\/Majuro\":\"Pacific\\/Majuro\",\"Pacific\\/Marquesas\":\"Pacific\\/Marquesas\",\"Pacific\\/Nauru\":\"Pacific\\/Nauru\",\"Pacific\\/Niue\":\"Pacific\\/Niue\",\"Pacific\\/Norfolk\":\"Pacific\\/Norfolk\",\"Pacific\\/Noumea\":\"Pacific\\/Noumea\",\"Pacific\\/Pago_Pago\":\"Pacific\\/Pago_Pago\",\"Pacific\\/Palau\":\"Pacific\\/Palau\",\"Pacific\\/Pitcairn\":\"Pacific\\/Pitcairn\",\"Pacific\\/Pohnpei\":\"Pacific\\/Pohnpei\",\"Pacific\\/Port_Moresby\":\"Pacific\\/Port_Moresby\",\"Pacific\\/Rarotonga\":\"Pacific\\/Rarotonga\",\"Pacific\\/Tahiti\":\"Pacific\\/Tahiti\",\"Pacific\\/Tarawa\":\"Pacific\\/Tarawa\",\"Pacific\\/Tongatapu\":\"Pacific\\/Tongatapu\",\"Pacific\\/Wake\":\"Pacific\\/Wake\",\"Pacific\\/Wallis\":\"Pacific\\/Wallis\"}}','select_dropdown',44,'Regional'),(47,'regional.currency_default','Currency','USD','{\"validation\":{\"rule\":\"required\"},\"description\":\"Add currency shortcode only e.g USD\\/EUR\\/GBP, etc. DO NOT ADD CURRENCY ICON.\"}','text',45,'Regional'),(48,'seo.meta_keywords','Meta Keywords (optional)','',NULL,'text',46,'SEO'),(49,'apps.google_analytics_code','Google Analytics ID','',NULL,'text',31,'Apps'),(50,'multi-vendor.verify_email','Verify Email Before Login','0','{\"default\":\"0\",\"options\":[\"Disabled\",\"Enabled\"]}','select_dropdown',48,'Multi-vendor'),(51,'multi-vendor.verify_publish','Publish Event After Admin Approval','0','{\"default\":\"0\",\"options\":[\"Disabled\",\"Enabled\"]}','select_dropdown',49,'Multi-vendor'),(52,'multi-vendor.manually_approve_organizer','Manually Approve Organizer','0','{\"default\":\"0\",\"options\":[\"Disabled\",\"Enabled\"]}','select_dropdown',50,'Multi-vendor'),(53,'booking.disable_booking_cancellation','Disable Booking Cancellation For Customers','0','{\"default\":\"0\",\"options\":[\"No\",\"Yes\"]}','select_dropdown',50,'Booking'),(54,'booking.hide_ticket_download','Disable Ticket Download For Customers','0','{\"default\":\"0\",\"options\":[\"No\",\"Yes\"]}','select_dropdown',51,'Booking'),(55,'booking.hide_google_calendar','Disable Google Calendar For Customers','0','{\"default\":\"0\",\"options\":[\"No\",\"Yes\"]}','select_dropdown',51,'Booking'),(56,'regional.date_format','Date Format','d M Y::DD MMM YYYY','{\"default\":\"\",\"options\":{\"d M Y::DD MMM YYYY\":\"D M Y (e.g 08 Mar 2021)\",\"d\\/M\\/Y::DD\\/MMM\\/YYYY\":\"D\\/M\\/Y (e.g 08\\/Mar\\/2021)\",\"d-M-Y::DD-MMM-YYYY\":\"D-M-Y (e.g 08-Mar-2021)\",\"d.M.Y::DD.MMM.YYYY\":\"D.M.Y (e.g 08.Mar.2021)\",\"Y M d::YYYY MMM DD\":\"Y M D (e.g 2021 Mar 08)\",\"Y\\/M\\/d::YYYY\\/MMM\\/DD\":\"Y\\/M\\/D (e.g 2021\\/Mar\\/08)\",\"Y-M-d::YYYY-MMM-DD\":\"Y-M-D (e.g 2021-Mar-08)\",\"Y.M.d::YYYY.MMM.DD\":\"Y.M.D (e.g 2021.Mar.08)\",\"M d Y::MMM DD YYYY\":\"M D Y (e.g Mar 08 2021)\",\"M\\/d\\/Y::MMM\\/DD\\/YYYY\":\"M\\/D\\/Y (e.g Mar\\/08\\/2021)\",\"M-d-Y::MMM-DD-YYYY\":\"M-D-Y (e.g Mar-08-2021)\",\"M.d.Y::MMM.DD.YYYY\":\"M.D.Y (e.g Mar.08.2021)\"}}','select_dropdown',45,'Regional'),(57,'regional.time_format','Time Format','12','{\"default\":\"\",\"options\":{\"12\":\"12 Hours\",\"24\":\"24 Hours\"}}','select_dropdown',46,'Regional');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `organizer_id` bigint(20) unsigned NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_title` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_page` tinyint(4) NOT NULL DEFAULT 0,
  `email` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_organizer_id_index` (`organizer_id`),
  CONSTRAINT `tags_organizer_id_foreign` FOREIGN KEY (`organizer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_ticket`
--

DROP TABLE IF EXISTS `tax_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_ticket` (
  `ticket_id` int(10) unsigned NOT NULL,
  `tax_id` int(10) unsigned NOT NULL,
  KEY `tax_ticket_ticket_id_foreign` (`ticket_id`),
  KEY `tax_ticket_tax_id_foreign` (`tax_id`),
  CONSTRAINT `tax_ticket_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_ticket_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_ticket`
--

LOCK TABLES `tax_ticket` WRITE;
/*!40000 ALTER TABLE `tax_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `rate_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'percent',
  `rate` decimal(11,2) unsigned NOT NULL,
  `net_price` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'excluding',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_tax` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
INSERT INTO `taxes` VALUES (1,'Convenience Fee','percent',5.00,'excluding',1,'2022-02-23 16:54:31','2022-02-23 16:54:31',0);
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `customer_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'Free',0.00,10000,'Smile spoke total few great had never their too. Amongst moments do in arrived at my replied.',1,'2022-02-23 16:54:31','2022-02-23 16:54:31',1,NULL),(2,'Early Bird',10.00,10000,'Smile spoke total few great had never their too. Amongst moments do in arrived at my replied.',1,'2022-02-23 16:54:31','2022-02-23 16:54:31',1,NULL),(3,'Regular',20.00,10000,'Smile spoke total few great had never their too. Amongst moments do in arrived at my replied.',1,'2022-02-23 16:54:31','2022-02-23 16:54:31',1,NULL),(4,'VIP',50.00,10000,'Smile spoke total few great had never their too. Amongst moments do in arrived at my replied.',1,'2022-02-23 16:54:31','2022-02-23 16:54:31',1,NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount_paid` decimal(10,2) unsigned NOT NULL DEFAULT 0.00,
  `item_sku` bigint(20) unsigned NOT NULL DEFAULT 0,
  `order_number` bigint(20) unsigned NOT NULL DEFAULT 0,
  `txn_id` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payer_reference` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_gateway` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'pt','Post','2018-12-21 10:25:08','2018-12-21 10:25:08'),(2,'data_types','display_name_singular',6,'pt','Página','2018-12-21 10:25:08','2018-12-21 10:25:08'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2018-12-21 10:25:08','2018-12-21 10:25:08'),(4,'data_types','display_name_singular',4,'pt','Categoria','2018-12-21 10:25:08','2018-12-21 10:25:08'),(5,'data_types','display_name_singular',2,'pt','Menu','2018-12-21 10:25:08','2018-12-21 10:25:08'),(6,'data_types','display_name_singular',3,'pt','Função','2018-12-21 10:25:08','2018-12-21 10:25:08'),(7,'data_types','display_name_plural',5,'pt','Posts','2018-12-21 10:25:08','2018-12-21 10:25:08'),(8,'data_types','display_name_plural',6,'pt','Páginas','2018-12-21 10:25:08','2018-12-21 10:25:08'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2018-12-21 10:25:08','2018-12-21 10:25:08'),(10,'data_types','display_name_plural',4,'pt','Categorias','2018-12-21 10:25:08','2018-12-21 10:25:08'),(11,'data_types','display_name_plural',2,'pt','Menus','2018-12-21 10:25:08','2018-12-21 10:25:08'),(12,'data_types','display_name_plural',3,'pt','Funções','2018-12-21 10:25:08','2018-12-21 10:25:08'),(13,'categories','slug',1,'pt','categoria-1','2018-12-21 10:25:08','2018-12-21 10:25:08'),(14,'categories','name',1,'pt','Categoria 1','2018-12-21 10:25:08','2018-12-21 10:25:08'),(15,'categories','slug',2,'pt','categoria-2','2018-12-21 10:25:08','2018-12-21 10:25:08'),(16,'categories','name',2,'pt','Categoria 2','2018-12-21 10:25:08','2018-12-21 10:25:08'),(17,'pages','title',1,'pt','Olá Mundo','2018-12-21 10:25:08','2018-12-21 10:25:08'),(18,'pages','slug',1,'pt','ola-mundo','2018-12-21 10:25:08','2018-12-21 10:25:08'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2018-12-21 10:25:08','2018-12-21 10:25:08'),(20,'menu_items','title',1,'pt','Painel de Controle','2018-12-21 10:25:08','2018-12-21 10:25:08'),(21,'menu_items','title',2,'pt','Media','2018-12-21 10:25:08','2018-12-21 10:25:08'),(22,'menu_items','title',12,'pt','Publicações','2018-12-21 10:25:08','2018-12-21 10:25:08'),(23,'menu_items','title',3,'pt','Utilizadores','2018-12-21 10:25:08','2018-12-21 10:25:08'),(24,'menu_items','title',11,'pt','Categorias','2018-12-21 10:25:08','2018-12-21 10:25:08'),(25,'menu_items','title',13,'pt','Páginas','2018-12-21 10:25:08','2018-12-21 10:25:08'),(26,'menu_items','title',4,'pt','Funções','2018-12-21 10:25:08','2018-12-21 10:25:08'),(27,'menu_items','title',5,'pt','Ferramentas','2018-12-21 10:25:08','2018-12-21 10:25:08'),(28,'menu_items','title',6,'pt','Menus','2018-12-21 10:25:08','2018-12-21 10:25:08'),(29,'menu_items','title',7,'pt','Base de dados','2018-12-21 10:25:08','2018-12-21 10:25:08'),(30,'menu_items','title',10,'pt','Configurações','2018-12-21 10:25:08','2018-12-21 10:25:08'),(31,'data_types','display_name_singular',7,'fr','Event','2018-12-22 09:29:05','2018-12-22 09:29:05'),(32,'data_types','display_name_plural',7,'fr','Events','2018-12-22 09:29:05','2018-12-22 09:29:05'),(33,'data_types','display_name_singular',9,'fr','Country','2018-12-22 11:07:43','2018-12-22 11:07:43'),(34,'data_types','display_name_plural',9,'fr','Countries','2018-12-22 11:07:43','2018-12-22 11:07:43'),(38,'data_types','display_name_singular',13,'fr','Currency','2018-12-22 11:37:56','2018-12-22 11:37:56'),(39,'data_types','display_name_plural',13,'fr','Currencies','2018-12-22 11:37:56','2018-12-22 11:37:56'),(40,'menu_items','title',19,'fr','Currencies','2018-12-22 11:38:14','2018-12-22 11:38:14'),(41,'data_types','display_name_singular',14,'fr','Ticket','2018-12-22 11:57:36','2018-12-22 11:57:36'),(42,'data_types','display_name_plural',14,'fr','Tickets','2018-12-22 11:57:36','2018-12-22 11:57:36'),(43,'menu_items','title',20,'fr','Tickets','2018-12-22 11:57:47','2018-12-22 11:57:47'),(44,'menu_items','title',21,'fr','','2018-12-22 12:02:59','2018-12-22 12:02:59'),(45,'data_types','display_name_singular',15,'fr','Category','2019-01-11 06:24:37','2019-01-11 06:24:37'),(46,'data_types','display_name_plural',15,'fr','Categories','2019-01-11 06:24:37','2019-01-11 06:24:37'),(47,'data_types','display_name_singular',16,'fr','Speaker','2019-01-11 07:01:39','2019-01-11 07:01:39'),(48,'data_types','display_name_plural',16,'fr','Speakers','2019-01-11 07:01:39','2019-01-11 07:01:39'),(49,'data_types','display_name_singular',17,'fr','Sponsor','2019-01-19 10:54:23','2019-01-19 10:54:23'),(50,'data_types','display_name_plural',17,'fr','Sponsors','2019-01-19 10:54:23','2019-01-19 10:54:23'),(51,'data_types','display_name_singular',18,'fr','Schedule','2019-04-24 05:21:28','2019-04-24 05:21:28'),(52,'data_types','display_name_plural',18,'fr','Schedules','2019-04-24 05:21:28','2019-04-24 05:21:28'),(53,'data_types','display_name_singular',20,'fr','Tax','2019-06-01 05:05:37','2019-06-01 05:05:37'),(54,'data_types','display_name_plural',20,'fr','Taxes','2019-06-01 05:05:37','2019-06-01 05:05:37');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `organisation` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_code` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_branch_name` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_branch_code` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_account_phone` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@admin.com','2019-09-02 07:37:28','$2y$10$yhzcD2B9V/RYXrFWSajhwe.uIgSE2k1JYUeJQ0d9IFTE8k31rxqTu','DUl5G6kvskWDIvfr8wCL2fFpPp3YIrUm806iAo7yKwlRIE9nfBoOvlBGDMqZ','2018-12-21 10:25:08','2019-09-11 04:28:24','users/default.png','{\"locale\":\"en\"}',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,'Gina White','ginawhite@mail.com','2019-09-02 07:37:28','$2y$10$esDtPHDbfSX5kdX/LHOpBevlheBUsLnm9x33FNuu9LdhhLUZX2oq2','Nlg4OLArLedfedIEcZsG0AMhLX4gUSA79iEIXmu8jaRufCQrPIy6iKIKUsct','2019-09-02 07:37:28','2019-09-02 07:37:28','users/default.png','{\"locale\":\"en\"}',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(3,'David Lane','davidlane@mail.com','2019-09-02 07:37:28','$2y$10$4klItuKhRtOKXBj9EHN/V.nB9.Yvb9A/eHb1C0vRKhEinVMxOnoPu','hzbfL7ZVwwSt6Rbqd62VZe45SP5tjq8I1yPGF74TTsH1xcxErbVdv02v0Bbl','2019-09-02 07:26:33','2019-09-14 08:32:31','users/default.png','{\"locale\":\"en\"}',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-23 16:58:43
