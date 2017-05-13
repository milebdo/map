-- MySQL dump 10.13  Distrib 5.6.16, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: map
-- ------------------------------------------------------
-- Server version	5.6.16-1~exp1

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `slogan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `css` longtext COLLATE utf8_unicode_ci NOT NULL,
  `config` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Brand','Brand slogan...','Brand description','keyword','author','picture.png',1,'','','2017-04-24 06:27:29','2017-04-24 06:27:29');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `lang` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `seo_slug` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `publish_start` date DEFAULT NULL,
  `publish_end` date DEFAULT NULL,
  `role_permission` enum('NONE','ROLE','USER') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `contents_seo_slug_unique` (`seo_slug`),
  KEY `contents_user_id_foreign` (`user_id`),
  CONSTRAINT `contents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,1,'en','Demo','demo','Demo','Demo','demo','admin','picture.png','<p>Content...<br></p>','2015-07-01',NULL,'NONE','2017-04-24 06:27:29','2017-04-24 06:27:29'),(2,1,'en','Open Street Map','open-street-map',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NONE','2017-04-24 06:27:30','2017-04-24 06:27:30'),(3,1,'en','Markers','markers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NONE','2017-04-24 06:27:30','2017-04-24 06:27:30'),(4,1,'en','Map1','map1',NULL,NULL,NULL,NULL,NULL,NULL,'2015-07-01',NULL,'NONE','2017-04-24 06:27:31','2017-04-24 06:27:31'),(5,1,'en','riza','riza',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NONE','2017-05-02 05:05:31','2017-05-02 05:05:31'),(6,1,'en','Bandung','bandung',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NONE','2017-05-05 08:07:32','2017-05-05 08:07:32'),(7,1,'en','Bandungx','bandungx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NONE','2017-05-07 03:22:09','2017-05-07 03:22:09'),(8,1,'en','Bandung 1','bandung-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NONE','2017-05-12 22:40:43','2017-05-12 22:40:43'),(9,1,'en','Base Kota Bandung','base-kota-bandung',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NONE','2017-05-12 22:42:30','2017-05-12 22:42:30'),(10,1,'en','Tes','tes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NONE','2017-05-12 22:43:04','2017-05-12 22:43:04');
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `events_content_id_foreign` (`content_id`),
  CONSTRAINT `events_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,1,'2015-07-01','2015-07-02','2017-04-24 06:27:29','2017-04-24 06:27:29');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layeritem`
--

DROP TABLE IF EXISTS `layeritem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layeritem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `layer_id` int(10) unsigned NOT NULL,
  `map_id` int(10) unsigned NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `baselayer` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `layeritem_layer_id_foreign` (`layer_id`),
  KEY `layeritem_map_id_foreign` (`map_id`),
  CONSTRAINT `layeritem_layer_id_foreign` FOREIGN KEY (`layer_id`) REFERENCES `layers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `layeritem_map_id_foreign` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layeritem`
--

LOCK TABLES `layeritem` WRITE;
/*!40000 ALTER TABLE `layeritem` DISABLE KEYS */;
INSERT INTO `layeritem` VALUES (4,0,1,3,1,1,'2017-05-12 22:46:41','2017-05-12 22:46:41',1),(5,0,6,3,1,2,'2017-05-12 22:47:02','2017-05-12 22:47:02',0);
/*!40000 ALTER TABLE `layeritem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layers`
--

DROP TABLE IF EXISTS `layers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `content_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bing_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bing_imageryset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mapquest_layer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wms_servertype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wms_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wms_layers` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wms_tiled` tinyint(1) DEFAULT NULL,
  `wms_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wfs_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wfs_typename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feature_info_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wfs_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ol_style_static_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ol_style_static_fill_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ol_style_static_stroke_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ol_style_static_stroke_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ol_style_field_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ol_style_field_fill_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ol_style_field_stroke_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ol_style_field_stroke_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `projection_id` int(10) unsigned NOT NULL,
  `gpx_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kml_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postgis_schema` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postgis_table` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postgis_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postgis_attributes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geojson_geomtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geojson_attributes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geojson_features` longtext COLLATE utf8_unicode_ci,
  `postgis_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postgis_port` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postgis_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postgis_pass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postgis_dbname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shapefile_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shapefile_geomtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shapefile_wmsurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shapefile_msclass` longtext COLLATE utf8_unicode_ci,
  `geopackage_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geopackage_table` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geopackage_fields` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `layers_user_id_foreign` (`user_id`),
  KEY `layers_content_id_foreign` (`content_id`),
  KEY `layers_projection_id_foreign` (`projection_id`),
  CONSTRAINT `layers_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `layers_projection_id_foreign` FOREIGN KEY (`projection_id`) REFERENCES `projections` (`srid`) ON DELETE CASCADE,
  CONSTRAINT `layers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layers`
--

LOCK TABLES `layers` WRITE;
/*!40000 ALTER TABLE `layers` DISABLE KEYS */;
INSERT INTO `layers` VALUES (1,1,2,'osm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-24 06:27:30','2017-04-24 06:27:30',3857,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,3,'geojson',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>{{ item.label }}</p>',NULL,'ol_style_static_icon.png','','','',NULL,NULL,NULL,NULL,'2017-04-24 06:27:30','2017-04-24 06:27:30',3857,NULL,NULL,NULL,NULL,NULL,NULL,'label','Point','label','{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[-851576.57182518,4456806.642252369]},\"properties\":{\"label\":\"Tavira\"}}],\"crs\":{\"type\":\"name\",\"properties\":{\"name\":\"EPSG:3857\"}}}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,6,'kml','','Road','sat','mapserver','','',0,'1.0.0','','','','1.0.0',NULL,'','','','','','','','2017-05-05 08:07:32','2017-05-05 08:07:32',3857,NULL,'kmlfile.kml',NULL,NULL,NULL,'','','Point','','','','5432','admin@isp.com',NULL,'',NULL,'POINT',NULL,'',NULL,'',''),(5,1,9,'kml','','Road','sat','mapserver','','',0,'1.0.0','','','','1.0.0',NULL,'','','','','','','','2017-05-12 22:42:30','2017-05-12 22:42:31',3857,NULL,'kmlfile.kml',NULL,NULL,NULL,'','','Point','','','','5432','admin@isp.com',NULL,'',NULL,'POINT',NULL,'',NULL,'',''),(6,1,10,'kml','','Road','sat','mapserver','','',0,'1.0.0','','','','1.0.0',NULL,'','','','','','','','2017-05-12 22:43:04','2017-05-12 22:43:04',3857,NULL,'kmlfile.kml',NULL,NULL,NULL,'','','Point','','','','5432','admin@isp.com',NULL,'',NULL,'POINT',NULL,'',NULL,'','');
/*!40000 ALTER TABLE `layers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zoom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `locations_content_id_foreign` (`content_id`),
  CONSTRAINT `locations_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,1,'Lisbon, Portugal','38.7222524','-9.139336599999979','5','2017-04-24 06:27:29','2017-04-24 06:27:29');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maps`
--

DROP TABLE IF EXISTS `maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `content_id` int(10) unsigned NOT NULL,
  `center` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zoom` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `projection_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maps_user_id_foreign` (`user_id`),
  KEY `maps_content_id_foreign` (`content_id`),
  KEY `maps_projection_id_foreign` (`projection_id`),
  CONSTRAINT `maps_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `maps_projection_id_foreign` FOREIGN KEY (`projection_id`) REFERENCES `projections` (`srid`) ON DELETE CASCADE,
  CONSTRAINT `maps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maps`
--

LOCK TABLES `maps` WRITE;
/*!40000 ALTER TABLE `maps` DISABLE KEYS */;
INSERT INTO `maps` VALUES (3,1,8,'11982313 -771407',13,'2017-05-12 22:40:43','2017-05-13 00:00:07',3857);
/*!40000 ALTER TABLE `maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2015_07_27_111334_create_roles_table',1),('2015_07_27_111940_create_role_user_table',1),('2015_07_27_143814_create_permissions_table',1),('2015_07_27_144020_create_permission_role_table',1),('2015_07_28_093442_create_contents_table',1),('2015_07_29_133906_create_brands_table',1),('2015_07_29_160935_create_pages_table',1),('2015_07_30_125322_create_events_table',1),('2015_07_30_125332_create_locations_table',1),('2015_07_31_143553_create_visits_table',1),('2015_08_05_143113_users_add_avatar',1),('2015_10_05_084758_create_maps_table',1),('2015_10_05_084816_create_layers_table',1),('2015_10_05_142819_create_layer_map_table',1),('2015_10_26_130255_create_projection_table',1),('2015_10_26_145339_map_add_projection',1),('2015_10_26_145346_layer_add_projection',1),('2015_11_02_112839_layer_add_gpx',1),('2015_11_02_120150_layer_add_kml',1),('2015_11_03_093505_layer_add_postgis',1),('2015_11_04_094237_layer_add_search',1),('2015_11_05_153135_layer_add_geojson',1),('2015_11_10_202456_layer_add_postgis_connection',1),('2015_11_10_220655_layer_add_shapefile',1),('2015_11_13_200314_layeritem_add_baselayer',1),('2016_05_07_120900_layer_add_geopackage',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'demo_notfound','page/notfound',1,'2017-04-24 06:27:29','2017-04-24 06:27:29'),(2,'demo_home','demo/home',1,'2017-04-24 06:27:29','2017-04-24 06:27:29'),(3,'demo_content','{slug}',1,'2017-04-24 06:27:29','2017-04-24 06:27:29'),(4,'demo_events','demo/events',1,'2017-04-24 06:27:29','2017-04-24 06:27:29'),(5,'demo_map','demo/map',1,'2017-04-24 06:27:30','2017-04-24 06:27:30'),(6,'demo_webgis','/',1,'2017-04-24 06:27:30','2017-04-24 06:27:30');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `access` enum('ALLOW','DENY') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1,3,'DENY'),(2,2,2,'DENY'),(3,3,2,'DENY'),(4,4,2,'DENY'),(5,5,2,'DENY'),(6,6,2,'DENY'),(7,7,2,'DENY'),(8,8,2,'DENY');
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
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `http` enum('GET','POST','PUT','DELETE') COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Backoffice','GET','admin','2017-04-24 06:27:28','2017-04-24 06:27:28'),(2,'Pages List','GET','admin/pages/list','2017-04-24 06:27:28','2017-04-24 06:27:28'),(3,'Users List','GET','admin/users/list','2017-04-24 06:27:28','2017-04-24 06:27:28'),(4,'Roles List','GET','admin/roles/list','2017-04-24 06:27:29','2017-04-24 06:27:29'),(5,'Permissions List','GET','admin/permissions/list','2017-04-24 06:27:29','2017-04-24 06:27:29'),(6,'Site Brand','GET','admin/brands/list','2017-04-24 06:27:29','2017-04-24 06:27:29'),(7,'Delete Content','GET','admin/contents/delete','2017-04-24 06:27:29','2017-04-24 06:27:29'),(8,'Change Content Ownership','GET','admin/contents/ownership','2017-04-24 06:27:29','2017-04-24 06:27:29');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projections`
--

DROP TABLE IF EXISTS `projections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `srid` int(10) unsigned NOT NULL,
  `proj4_params` text COLLATE utf8_unicode_ci NOT NULL,
  `extent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `projections_srid_unique` (`srid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projections`
--

LOCK TABLES `projections` WRITE;
/*!40000 ALTER TABLE `projections` DISABLE KEYS */;
INSERT INTO `projections` VALUES (1,3857,'+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs','-20026376.39 -20048966.10 20026376.39 20048966.10','2017-04-24 06:27:30','2017-04-24 06:27:30'),(2,32748,'+proj=utm +zone=48 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs ','166021.4431 1116915.0440 833978.5569 10000000.0000','2017-05-05 08:03:22','2017-05-05 08:03:22');
/*!40000 ALTER TABLE `projections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,1);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_permission` enum('NONE','ROLE','USER') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','NONE','2017-04-24 06:27:28','2017-04-24 06:27:28'),(2,'Backoffice User','ROLE','2017-04-24 06:27:28','2017-04-24 06:27:28'),(3,'Registered','NONE','2017-04-24 06:27:28','2017-04-24 06:27:28');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `twitter_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@isp.com','$2y$10$vQwkEnbCLe0JJZ3h1wbwDOAuzH0hYdEpuL5M.BCpi7r7q3nemjaw2','','','','xAUkip1KnH6HtHWuW0K2yUW8AoQMn7xKomu0XBzS3ewebpnfw0Sww92LvEAf','2017-04-24 06:27:28','2017-05-05 07:44:42','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `http_url` text COLLATE utf8_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `http_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `visits_content_id_foreign` (`content_id`),
  KEY `visits_user_id_foreign` (`user_id`),
  CONSTRAINT `visits_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `visits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,NULL,NULL,'http://localhost:8080/public','GET','public','127.0.0.1','2017-04-24 06:29:25','2017-04-24 06:29:25'),(2,NULL,NULL,'http://localhost:8080/public','GET','public','127.0.0.1','2017-04-24 06:51:29','2017-04-24 06:51:29'),(3,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:00:47','2017-04-24 07:00:47'),(4,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:12:30','2017-04-24 07:12:30'),(5,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:15:29','2017-04-24 07:15:29'),(6,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:18:28','2017-04-24 07:18:28'),(7,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:27:12','2017-04-24 07:27:12'),(8,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:27:42','2017-04-24 07:27:42'),(9,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:31:34','2017-04-24 07:31:34'),(10,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:34:21','2017-04-24 07:34:21'),(11,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:36:46','2017-04-24 07:36:46'),(12,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:37:37','2017-04-24 07:37:37'),(13,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:42:01','2017-04-24 07:42:01'),(14,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:46:13','2017-04-24 07:46:13'),(15,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 07:46:42','2017-04-24 07:46:42'),(16,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-04-24 08:30:28','2017-04-24 08:30:28'),(17,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:37:46','2017-05-02 04:37:46'),(18,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:37:46','2017-05-02 04:37:46'),(19,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:40:54','2017-05-02 04:40:54'),(20,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:40:55','2017-05-02 04:40:55'),(21,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:41:45','2017-05-02 04:41:45'),(22,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:41:45','2017-05-02 04:41:45'),(23,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:41:46','2017-05-02 04:41:46'),(24,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:41:46','2017-05-02 04:41:46'),(25,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:42:41','2017-05-02 04:42:41'),(26,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:48:30','2017-05-02 04:48:30'),(27,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:50:09','2017-05-02 04:50:09'),(28,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 04:56:11','2017-05-02 04:56:11'),(29,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-02 05:17:59','2017-05-02 05:17:59'),(30,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-05 07:35:08','2017-05-05 07:35:08'),(31,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-05 07:35:09','2017-05-05 07:35:09'),(32,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-05 07:35:58','2017-05-05 07:35:58'),(33,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-05 07:36:03','2017-05-05 07:36:03'),(34,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-05 07:37:47','2017-05-05 07:37:47'),(35,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-05 07:38:14','2017-05-05 07:38:14'),(36,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-05 07:38:38','2017-05-05 07:38:38'),(37,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-05 07:39:56','2017-05-05 07:39:56'),(38,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-05 07:44:42','2017-05-05 07:44:42'),(39,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-05 08:57:08','2017-05-05 08:57:08'),(40,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-05 09:34:32','2017-05-05 09:34:32'),(41,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-06 07:02:54','2017-05-06 07:02:54'),(42,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-06 07:02:54','2017-05-06 07:02:54'),(43,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-06 07:04:55','2017-05-06 07:04:55'),(44,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-06 07:10:42','2017-05-06 07:10:42'),(45,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-07 03:21:10','2017-05-07 03:21:10'),(46,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-07 03:21:11','2017-05-07 03:21:11'),(47,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-07 03:24:59','2017-05-07 03:24:59'),(48,NULL,NULL,'http://localhost:8081','GET','/','127.0.0.1','2017-05-09 06:33:57','2017-05-09 06:33:57'),(49,NULL,1,'http://localhost:8081','GET','/','127.0.0.1','2017-05-09 07:16:44','2017-05-09 07:16:44'),(50,NULL,1,'http://localhost:8081','GET','/','127.0.0.1','2017-05-09 08:07:30','2017-05-09 08:07:30'),(51,NULL,NULL,'http://localhost:8001','GET','/','127.0.0.1','2017-05-11 00:47:32','2017-05-11 00:47:32'),(52,NULL,1,'http://localhost:8001','GET','/','127.0.0.1','2017-05-11 01:05:51','2017-05-11 01:05:51'),(53,NULL,1,'http://localhost:8001','GET','/','127.0.0.1','2017-05-11 01:43:23','2017-05-11 01:43:23'),(54,NULL,1,'http://localhost:8001','GET','/','127.0.0.1','2017-05-11 01:55:53','2017-05-11 01:55:53'),(55,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 16:01:43','2017-05-12 16:01:43'),(56,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 16:01:43','2017-05-12 16:01:43'),(57,NULL,NULL,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 21:32:39','2017-05-12 21:32:39'),(58,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 21:33:34','2017-05-12 21:33:34'),(59,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 21:33:36','2017-05-12 21:33:36'),(60,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 21:34:11','2017-05-12 21:34:11'),(61,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 22:47:10','2017-05-12 22:47:10'),(62,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 22:48:30','2017-05-12 22:48:30'),(63,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 22:48:46','2017-05-12 22:48:46'),(64,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 22:57:54','2017-05-12 22:57:54'),(65,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 22:58:20','2017-05-12 22:58:20'),(66,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-12 23:59:49','2017-05-12 23:59:49'),(67,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-13 00:00:09','2017-05-13 00:00:09'),(68,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-13 00:00:29','2017-05-13 00:00:29'),(69,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-13 00:33:54','2017-05-13 00:33:54'),(70,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-13 00:34:05','2017-05-13 00:34:05'),(71,NULL,1,'http://localhost:8080','GET','/','127.0.0.1','2017-05-13 00:36:02','2017-05-13 00:36:02');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-13 14:40:15
