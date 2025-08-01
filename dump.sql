-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: mini_simulio
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Jean Dupont','jean.dupont@example.com','0677890761','10 Rue de la République, 75001 Paris, France','2025-07-31 18:32:15','2025-07-31 19:14:30'),(3,'Sampaniony Rakotoarivelo','sampanionyra55@gmail.com','0771416562','CCCCCCCCCCCCCC','2025-07-31 20:37:44','2025-07-31 20:37:44');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_07_30_172402_create_personal_access_tokens_table',1),(5,'2025_07_30_192804_create_clients_table',1),(6,'2025_07_30_211522_create_personal_access_tokens_table',2),(7,'2025_07_30_211643_create_personal_access_tokens_table',3),(8,'2025_07_30_212141_create_personal_access_tokens_table',4),(9,'2025_07_31_012551_create_simulations_table',5),(10,'2025_07_31_202045_remove_user_id_from_users',6),(11,'2025_07_31_211538_add_client_id_to_simulations_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',4,'auth_token','6534b5035bec67d2702e3d9b667ae0636a9d8b6b638f028d995a39e99b23fc1f','[\"*\"]',NULL,NULL,'2025-07-30 19:28:00','2025-07-30 19:28:00'),(2,'App\\Models\\User',4,'auth_token','c5e78486515ecdef28c61272f83b57880ae3f0806f8a0df57869eb444ac61570','[\"*\"]',NULL,NULL,'2025-07-30 19:28:48','2025-07-30 19:28:48'),(3,'App\\Models\\User',5,'auth_token','c2c96cd6cb56475cfc7dc39677cda915f2ebbb59fc87cde7e46fea7e37455831','[\"*\"]',NULL,NULL,'2025-07-30 21:55:39','2025-07-30 21:55:39'),(4,'App\\Models\\User',6,'auth_token','282509a0701b309ddf18d55c4ca1f8fba6a3c46fcc709ffe2c0456100906d701','[\"*\"]',NULL,NULL,'2025-07-30 22:07:26','2025-07-30 22:07:26'),(5,'App\\Models\\User',7,'auth_token','67a68c2e2d47f9081efbf99bce07696bcf6bc17470b7e8a3289ccede7c99cd82','[\"*\"]',NULL,NULL,'2025-07-30 22:10:08','2025-07-30 22:10:08'),(6,'App\\Models\\User',8,'auth_token','49f657d06a94b46253fba46646b77abdb2666b70d31090aa1659ccb3ac43763c','[\"*\"]',NULL,NULL,'2025-07-30 22:10:20','2025-07-30 22:10:20'),(7,'App\\Models\\User',9,'auth_token','4a82f3483b0f15b8f3bf031d7da5f984a821d6471b12febf5dda4c29fc743f8a','[\"*\"]',NULL,NULL,'2025-07-30 22:11:14','2025-07-30 22:11:14'),(8,'App\\Models\\User',10,'auth_token','f949d91834a2ca330e6475dd52eec20d00c2d31929283811d0f1387b20726479','[\"*\"]',NULL,NULL,'2025-07-30 22:11:51','2025-07-30 22:11:51'),(9,'App\\Models\\User',11,'auth_token','3bf8f11d0b64dcdc4f5212516267f688b5fd943429c83d3f32509064a257dc37','[\"*\"]',NULL,NULL,'2025-07-30 22:12:25','2025-07-30 22:12:25'),(10,'App\\Models\\User',11,'auth_token','cd0fe4e8f791d46b72d695a96fa41c448008a13d64ea199aadb6e7d0c37ce896','[\"*\"]',NULL,NULL,'2025-07-30 22:19:05','2025-07-30 22:19:05'),(11,'App\\Models\\User',11,'auth_token','4f38fc8156e7104ff9aaf99aa0e5cc2e0af174cc1f306ea6ba54d56ce862a20c','[\"*\"]',NULL,NULL,'2025-07-30 22:20:35','2025-07-30 22:20:35'),(12,'App\\Models\\User',11,'auth_token','e8248ff6e247f87c88bba4ed46e5197101514b730cf372a474dd3c327dc84ed4','[\"*\"]',NULL,NULL,'2025-07-30 22:21:33','2025-07-30 22:21:33'),(13,'App\\Models\\User',11,'auth_token','1c49a9f924847204b6c4ab138c9210c22eb575d0bfb763c5f6afe48a94f9d0af','[\"*\"]',NULL,NULL,'2025-07-30 22:22:39','2025-07-30 22:22:39'),(14,'App\\Models\\User',11,'auth_token','41a4ddb30ecffa190faa4c6bb20f522bf33e1d7d1361d0d301a99a90cbbc7425','[\"*\"]','2025-07-30 22:35:56',NULL,'2025-07-30 22:22:51','2025-07-30 22:35:56'),(15,'App\\Models\\User',11,'auth_token','458a665f985bc1eef3c71dd0d94ef83de793dac2c4b8727b9e75de75f3ef43d6','[\"*\"]','2025-07-30 22:38:06',NULL,'2025-07-30 22:36:05','2025-07-30 22:38:06'),(16,'App\\Models\\User',11,'auth_token','ce435c0f85104d882ae1b64256fa069beca771a940147e374bb44297fce4a9b5','[\"*\"]',NULL,NULL,'2025-07-30 22:38:24','2025-07-30 22:38:24'),(17,'App\\Models\\User',11,'auth_token','6210ecc6b2c16a45adeb9edd388d568c9b90c029af34b28634351b2ea63bea14','[\"*\"]','2025-07-30 22:39:53',NULL,'2025-07-30 22:39:10','2025-07-30 22:39:53'),(18,'App\\Models\\User',11,'auth_token','9e2ac174a4cc0ae17071bc44b26d2327542712e43d5395a6f07140ab0582ca37','[\"*\"]','2025-07-30 22:44:12',NULL,'2025-07-30 22:42:42','2025-07-30 22:44:12'),(19,'App\\Models\\User',11,'auth_token','86bdfb9484ad9abe6f4deb812153f53ecbb00b09c24a168d81556658fafab4aa','[\"*\"]','2025-07-30 22:45:48',NULL,'2025-07-30 22:45:45','2025-07-30 22:45:48'),(20,'App\\Models\\User',11,'auth_token','3d1f612499e37650e6ae3b6a8ef94e07988cc3bcefbea4fb1a49575a246a08fa','[\"*\"]','2025-07-30 22:47:12',NULL,'2025-07-30 22:47:10','2025-07-30 22:47:12'),(21,'App\\Models\\User',11,'auth_token','dc824959fc2072e30f876bc23d34f4d4dbfd18d2a61ddd118a3e375689794566','[\"*\"]','2025-07-30 22:51:17',NULL,'2025-07-30 22:48:29','2025-07-30 22:51:17'),(22,'App\\Models\\User',11,'auth_token','92215bc603f939a639cd99822a99eb81655d555aca523081394f6e836ed0260e','[\"*\"]','2025-07-30 22:51:29',NULL,'2025-07-30 22:51:26','2025-07-30 22:51:29'),(23,'App\\Models\\User',11,'auth_token','4a31a2b7ab606d28fb0102a3d5391a9548ea4a69cc4165f183c3f4b511bc0726','[\"*\"]','2025-07-30 22:54:18',NULL,'2025-07-30 22:54:15','2025-07-30 22:54:18'),(24,'App\\Models\\User',11,'auth_token','2a616009846f1167ab234e26cba560dd6f676fc32cba5c38e8da170303db241f','[\"*\"]','2025-07-30 23:01:43',NULL,'2025-07-30 22:58:57','2025-07-30 23:01:43'),(25,'App\\Models\\User',11,'auth_token','09588801f6db51aa6a95adf09091b1e1ae2212e128e98874eb1332d9e0fe4b2c','[\"*\"]','2025-07-30 23:01:51',NULL,'2025-07-30 23:01:51','2025-07-30 23:01:51'),(26,'App\\Models\\User',11,'auth_token','5de0f9e4312850dad1f2403c1697a01d143c8f672c79d0c3be7bd94a8ade55ac','[\"*\"]','2025-07-30 23:01:55',NULL,'2025-07-30 23:01:55','2025-07-30 23:01:55'),(27,'App\\Models\\User',11,'auth_token','8e1f0ca5f4af66857f74a6f262df9401b96bbad22ae74cdd01a9febce62b8a66','[\"*\"]','2025-07-30 23:02:10',NULL,'2025-07-30 23:02:10','2025-07-30 23:02:10'),(28,'App\\Models\\User',11,'auth_token','0d98135bb599f1aadfde9cf9d7e04314ef3f53ec7e1b97ea0634b17647ae0b50','[\"*\"]','2025-07-30 23:02:45',NULL,'2025-07-30 23:02:45','2025-07-30 23:02:45'),(29,'App\\Models\\User',11,'auth_token','92555cd36cd1667d2be4a1183b4be7968ffb1e92b61d4145051c2e940d7c26ae','[\"*\"]','2025-07-30 23:02:48',NULL,'2025-07-30 23:02:48','2025-07-30 23:02:48'),(30,'App\\Models\\User',11,'auth_token','b0e720aa6023abc1487f7cfb4f6826d5d8d873028fbe519802aa918e1e9bf20e','[\"*\"]','2025-07-30 23:03:14',NULL,'2025-07-30 23:03:14','2025-07-30 23:03:14'),(31,'App\\Models\\User',11,'auth_token','0bf2c311b96dcd7af726115bef1f69045bf09ecbf8a586b9b8a05b780f9d23f1','[\"*\"]','2025-07-30 23:03:57',NULL,'2025-07-30 23:03:57','2025-07-30 23:03:57'),(32,'App\\Models\\User',11,'auth_token','0c6d658013d893fe9afb8a560178dd56642cbb4bfb64151363424a5bf6f5e68e','[\"*\"]','2025-07-30 23:04:31',NULL,'2025-07-30 23:04:31','2025-07-30 23:04:31'),(33,'App\\Models\\User',11,'auth_token','7d181b22fc48e0e6fe4def067ddbc5bdc4e2ea2b3cc1710034622c8119b9e7c3','[\"*\"]','2025-07-30 23:04:52',NULL,'2025-07-30 23:04:52','2025-07-30 23:04:52'),(34,'App\\Models\\User',11,'auth_token','47cd136b433ef68dc6203b769ad2c94bf4e36545a5e3f220f45ac04014ac4403','[\"*\"]','2025-07-30 23:05:03',NULL,'2025-07-30 23:05:03','2025-07-30 23:05:03'),(35,'App\\Models\\User',11,'auth_token','f131a5242409e8ce7b456389c7cf804153616b933db051c59f00ad708c19f769','[\"*\"]','2025-07-30 23:05:21',NULL,'2025-07-30 23:05:21','2025-07-30 23:05:21'),(36,'App\\Models\\User',11,'auth_token','1f9fcf933eace7a276ddb825bcad6e1378886077490be1f13b54ded50b5f8dd3','[\"*\"]','2025-07-30 23:05:52',NULL,'2025-07-30 23:05:52','2025-07-30 23:05:52'),(37,'App\\Models\\User',11,'auth_token','bfe578a7c5990341b9682d54c9633569be8447d560daf27026719af8685aaaad','[\"*\"]','2025-07-30 23:06:31',NULL,'2025-07-30 23:06:31','2025-07-30 23:06:31'),(38,'App\\Models\\User',11,'auth_token','43de9442b191f461a2e364896bdcb67bd62012b21ea46a6ecafbe2b943cc3408','[\"*\"]','2025-07-30 23:06:33',NULL,'2025-07-30 23:06:33','2025-07-30 23:06:33'),(39,'App\\Models\\User',11,'auth_token','e2e2bcceda3736ebc3681130bd27e54c18f67853482ac93eab36164c71c3047f','[\"*\"]','2025-07-30 23:06:35',NULL,'2025-07-30 23:06:35','2025-07-30 23:06:35'),(40,'App\\Models\\User',11,'auth_token','9a6a120bd9f234e64b4ecbb3dad6a7eb5d8e5ae25f26c3296f734fcd5dc355f4','[\"*\"]',NULL,NULL,'2025-07-30 23:06:49','2025-07-30 23:06:49'),(41,'App\\Models\\User',11,'auth_token','52cc2b15eb399540d71dfc799e1942e49a50231463afc32780e237347a937f6a','[\"*\"]','2025-07-30 23:07:05',NULL,'2025-07-30 23:07:05','2025-07-30 23:07:05'),(42,'App\\Models\\User',11,'auth_token','13db1b6378206b9d4d2e973ee27d497787a2fd7856fdb9b25523bb22ebd9a395','[\"*\"]','2025-07-30 23:07:21',NULL,'2025-07-30 23:07:21','2025-07-30 23:07:21'),(43,'App\\Models\\User',11,'auth_token','be63749e0219fb7a146ce5babe636f88650e15ead7a96fe3baee6c668dd27542','[\"*\"]','2025-07-30 23:07:31',NULL,'2025-07-30 23:07:31','2025-07-30 23:07:31'),(44,'App\\Models\\User',11,'auth_token','336991cc02f27a293e76bd5c9f97554d6f67a3c1db93f0f3d305c97659a192b8','[\"*\"]','2025-07-30 23:07:57',NULL,'2025-07-30 23:07:57','2025-07-30 23:07:57'),(45,'App\\Models\\User',11,'auth_token','7be57362c672911ca450ec97a92040e2a7b4f82e8f8ecd83acb918af5e410ea0','[\"*\"]','2025-07-30 23:08:27',NULL,'2025-07-30 23:08:27','2025-07-30 23:08:27'),(46,'App\\Models\\User',11,'auth_token','f686ac2d94990fc55ee600545bad1069c938c21f8dc41674a192d150b3252994','[\"*\"]',NULL,NULL,'2025-07-30 23:09:16','2025-07-30 23:09:16'),(47,'App\\Models\\User',11,'auth_token','c29a1dc40af5febca6c6f12ca74fbede0bc402ec11f53669a322b3191ab43ec9','[\"*\"]',NULL,NULL,'2025-07-30 23:09:19','2025-07-30 23:09:19'),(48,'App\\Models\\User',11,'auth_token','4e3c17e4b921336abc42f9e6a31dd31aa0648507984ce8ce78a9843d9c6b1c24','[\"*\"]',NULL,NULL,'2025-07-30 23:09:35','2025-07-30 23:09:35'),(49,'App\\Models\\User',11,'auth_token','ced372e5921f5b7482ae4e2fe6b64859e7c99787340e8353af816065585f270b','[\"*\"]',NULL,NULL,'2025-07-30 23:09:36','2025-07-30 23:09:36'),(50,'App\\Models\\User',11,'auth_token','9e242a90a53caaee107c54c0cf335fb91dcb6a100dac5cb11918e0048474536c','[\"*\"]',NULL,NULL,'2025-07-30 23:09:43','2025-07-30 23:09:43'),(51,'App\\Models\\User',11,'auth_token','868e6317404b5f10ae4801e0c54bddc8e942ee72c260a01be7941983ba53251f','[\"*\"]',NULL,NULL,'2025-07-30 23:10:03','2025-07-30 23:10:03'),(52,'App\\Models\\User',11,'auth_token','5394c42e68551634755b4910ff8519345389eefcc1ba57a9ed2af90ca94553a8','[\"*\"]','2025-07-30 23:10:19',NULL,'2025-07-30 23:10:14','2025-07-30 23:10:19'),(53,'App\\Models\\User',11,'auth_token','62ddb277bee2abae563514f0702fe03d15d995025437d11bb155b82cf5250d9e','[\"*\"]',NULL,NULL,'2025-07-30 23:18:51','2025-07-30 23:18:51'),(54,'App\\Models\\User',11,'auth_token','047f6db181b6ead463f0c1d83b962df6fe8eb5d036c0bbb25cd8eeede284e4b7','[\"*\"]',NULL,NULL,'2025-07-30 23:18:55','2025-07-30 23:18:55'),(55,'App\\Models\\User',11,'auth_token','7216f0c3a913b3221778f82da06976604a74d64b9ee1829bce054faa2f9a912d','[\"*\"]',NULL,NULL,'2025-07-30 23:19:17','2025-07-30 23:19:17'),(56,'App\\Models\\User',11,'auth_token','39be6606da254a99afe1f5bbfe5952a6da3944d0789573d6cb3ece591bfbafc3','[\"*\"]',NULL,NULL,'2025-07-30 23:21:53','2025-07-30 23:21:53'),(57,'App\\Models\\User',12,'auth_token','a36ff6f1541ec8e34646faa178165b109c5d20147759c5380a9ec40beb1c2d55','[\"*\"]',NULL,NULL,'2025-07-31 06:53:48','2025-07-31 06:53:48'),(58,'App\\Models\\User',12,'auth_token','d9b94ab5d13d50c8a7492c0b73fe4d416f7c1d0cb6dc5ac9d2d8650e64b9f563','[\"*\"]',NULL,NULL,'2025-07-31 06:54:00','2025-07-31 06:54:00'),(59,'App\\Models\\User',12,'auth_token','4b4153208476829da3fda419e13bfd6b94c83846d395709401687a919a388028','[\"*\"]','2025-07-31 07:08:49',NULL,'2025-07-31 07:05:28','2025-07-31 07:08:49'),(60,'App\\Models\\User',12,'auth_token','ea87519f018f0af24e1297af5298d5ab89eccccb3dc4834a99cb4fcae1053135','[\"*\"]','2025-07-31 15:32:07',NULL,'2025-07-31 15:06:39','2025-07-31 15:32:07'),(61,'App\\Models\\User',12,'auth_token','3732870329d4e81c53ea296717c9769b850285165ffaf5877f5665d227b2710b','[\"*\"]','2025-07-31 22:20:01',NULL,'2025-07-31 17:37:08','2025-07-31 22:20:01'),(62,'App\\Models\\User',12,'auth_token','7e8520fc8d1b8a1a7f884ab74a0930e30f956dd9f41d68876bd58be2fc02ef6f','[\"*\"]','2025-07-31 21:48:20',NULL,'2025-07-31 18:30:22','2025-07-31 21:48:20'),(63,'App\\Models\\User',12,'auth_token','b013633a764b88740b22e5981989e556b8e1487c0703f1d4646ba1159987cd7e','[\"*\"]',NULL,NULL,'2025-08-01 06:57:42','2025-08-01 06:57:42'),(64,'App\\Models\\User',12,'auth_token','304ac4e7ce094b3781c97b353d331380f0fc43f3a9f2c92f61fdeba95af22db3','[\"*\"]',NULL,NULL,'2025-08-01 06:58:47','2025-08-01 06:58:47'),(65,'App\\Models\\User',12,'auth_token','cd6f620f8b6c014fadfbcf8b83e8ef17b4e926d96a235f2a45e837a7bb8d423e','[\"*\"]','2025-08-01 07:06:38',NULL,'2025-08-01 07:02:45','2025-08-01 07:06:38');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simulations`
--

DROP TABLE IF EXISTS `simulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simulations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned DEFAULT NULL,
  `prix_bien` decimal(15,2) NOT NULL,
  `frais_notaire` decimal(15,2) NOT NULL,
  `garantie_bancaire` decimal(15,2) NOT NULL,
  `frais_agence` decimal(15,2) NOT NULL,
  `apport` decimal(15,2) NOT NULL,
  `total_financer` decimal(15,2) NOT NULL,
  `taux_interet` decimal(5,2) NOT NULL,
  `taux_assurance` decimal(5,2) NOT NULL,
  `mensualite` decimal(15,2) NOT NULL,
  `interets_total` decimal(15,2) NOT NULL,
  `assurance_total` decimal(15,2) NOT NULL,
  `salaire_minimum` int NOT NULL,
  `duree_annees` int NOT NULL,
  `mois_debut` int NOT NULL,
  `annee_debut` int NOT NULL,
  `date_acquisition` date NOT NULL,
  `date_financement` date NOT NULL,
  `revalorisation_bien` decimal(5,2) NOT NULL,
  `travaux` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `simulations_client_id_foreign` (`client_id`),
  CONSTRAINT `simulations_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simulations`
--

LOCK TABLES `simulations` WRITE;
/*!40000 ALTER TABLE `simulations` DISABLE KEYS */;
INSERT INTO `simulations` VALUES (1,NULL,200000.00,5000.00,3000.00,6000.00,0.00,214000.00,4.00,0.30,1183.07,140921.25,16050.00,3380,25,2,2025,'2025-02-01','2050-02-01',1.00,0.00,'2025-07-31 07:08:49','2025-07-31 07:08:49'),(2,NULL,40.00,0.80,0.54,0.40,4.00,37.74,3.50,0.36,0.23,17.51,2.72,0,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 15:32:07','2025-07-31 15:32:07'),(3,NULL,300.00,3.00,3.68,3.00,55.00,254.68,3.50,0.36,1.55,118.14,18.34,4,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 17:37:30','2025-07-31 17:37:30'),(4,NULL,300.00,3.00,3.68,3.00,55.00,254.68,3.50,0.36,1.55,118.14,18.34,4,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 17:38:15','2025-07-31 17:38:15'),(5,NULL,300.00,3.00,3.68,3.00,55.00,254.68,3.50,0.36,1.55,118.14,18.34,4,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 17:38:32','2025-07-31 17:38:32'),(6,NULL,300.00,3.00,3.68,3.00,55.00,254.68,3.50,0.36,1.55,118.14,18.34,4,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 17:38:47','2025-07-31 17:38:47'),(7,NULL,300.00,3.00,3.68,3.00,55.00,254.68,3.50,0.36,1.55,118.14,18.34,4,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 17:39:04','2025-07-31 17:39:04'),(8,NULL,3000.00,30.00,44.96,60.00,3.00,3135.96,3.50,0.36,19.13,1454.78,225.79,54,20,7,2025,'2025-07-01','2045-07-01',2.00,4.00,'2025-07-31 17:41:18','2025-07-31 17:41:18'),(9,NULL,834000.00,62550.00,11760.00,8340.00,50000.00,886649.00,3.50,0.32,4675.21,515915.08,70931.92,13357,25,7,2025,'2025-07-01','2050-07-01',1.00,19999.00,'2025-07-31 17:51:52','2025-07-31 17:51:52'),(10,NULL,834000.00,62550.00,11760.00,25020.00,50000.00,903329.00,3.50,0.32,4763.17,525620.69,72266.32,13609,25,7,2025,'2025-07-01','2050-07-01',1.00,19999.00,'2025-07-31 17:54:43','2025-07-31 17:54:43'),(11,NULL,834000.00,16680000.00,11760.02,2502000.00,49999.00,19981761.02,3.50,0.36,121880.69,9269605.34,1438686.79,348230,20,7,2025,'2025-07-01','2045-07-01',2.00,4000.00,'2025-07-31 18:07:09','2025-07-31 18:07:09'),(12,NULL,834000.00,62550.00,11760.02,25020.00,49999.00,887331.02,3.50,0.36,5412.36,411635.81,63887.83,15463,20,7,2025,'2025-07-01','2045-07-01',2.00,4000.00,'2025-07-31 18:07:50','2025-07-31 18:07:50'),(13,NULL,834000.00,166800.00,12420.00,8340.00,6000.00,1015560.00,3.50,0.36,6194.51,471121.66,73120.32,17698,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 18:14:27','2025-07-31 18:14:27'),(14,NULL,4444.00,88.88,66.62,0.00,3.00,4596.50,3.50,0.36,28.04,2132.33,330.95,80,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 19:30:58','2025-07-31 19:30:58'),(15,NULL,4444.00,88.88,66.62,0.00,3.00,4596.50,3.50,0.36,28.04,2132.33,330.95,80,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 19:31:02','2025-07-31 19:31:02'),(16,NULL,4444.00,88.88,66.62,0.00,3.00,4596.50,3.50,0.36,28.04,2132.33,330.95,80,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 19:31:30','2025-07-31 19:31:30'),(17,NULL,44.00,24444.20,0.62,0.44,3.00,24486.26,3.50,0.36,149.36,11359.26,1763.01,426,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 19:43:34','2025-07-31 19:43:34'),(18,NULL,4444.00,88.88,66.18,44.44,32.00,4611.50,3.50,0.36,28.13,2139.29,332.03,80,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 19:45:01','2025-07-31 19:45:01'),(19,NULL,4444.00,88.88,66.18,44.44,32.00,4611.50,3.50,0.36,28.13,2139.29,332.03,80,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 19:46:36','2025-07-31 19:46:36'),(20,1,4444.00,88.88,66.18,44.44,32.00,4611.50,3.50,0.36,28.13,2139.29,332.03,80,20,7,2025,'2025-07-01','2045-07-01',2.00,0.00,'2025-07-31 19:47:32','2025-07-31 19:47:32'),(21,1,200000.00,2.50,3000.00,3.00,0.00,214000.00,4.00,0.30,1183.07,140921.25,16050.00,3380,25,2,2025,'2025-01-02','2025-01-02',1.00,0.00,'2025-07-31 21:48:20','2025-07-31 21:48:20'),(22,NULL,834000.00,7.50,11760.00,3.00,50000.00,903330.00,3.50,0.32,4763.17,453354.87,72266.40,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,20000.00,'2025-07-31 21:51:52','2025-07-31 21:51:52'),(23,NULL,834000.00,7.50,12210.00,3.00,20000.00,933779.00,3.50,0.31,4915.94,468636.33,72367.87,14045,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-07-31 21:54:39','2025-07-31 21:54:39'),(24,NULL,834000.00,7.50,12210.00,3.00,20000.00,963778.00,3.50,0.31,5073.88,483691.95,74692.80,14496,25,7,2025,'2025-01-07','2025-01-07',1.00,49998.00,'2025-07-31 21:54:57','2025-07-31 21:54:57'),(25,NULL,834000.00,7.50,12210.00,3.00,20000.00,963780.00,3.50,0.31,5073.89,483692.95,74692.95,14496,25,7,2025,'2025-01-07','2025-01-07',1.00,50000.00,'2025-07-31 21:55:05','2025-07-31 21:55:05'),(26,NULL,834000.00,7.50,12210.00,3.00,20000.00,963780.00,3.50,0.32,5081.92,483692.95,77102.40,14519,25,7,2025,'2025-01-07','2025-01-07',1.00,50000.00,'2025-07-31 21:55:17','2025-07-31 21:55:17'),(27,NULL,834000.00,7.50,12210.00,3.00,20000.00,963780.00,3.50,0.32,5081.92,483692.95,77102.40,14519,25,7,2025,'2025-01-07','2025-01-07',1.00,50000.00,'2025-07-31 21:55:18','2025-07-31 21:55:18'),(28,NULL,834000.00,7.50,12210.00,3.00,20000.00,963780.00,3.50,0.32,5081.92,483692.95,77102.40,14519,25,7,2025,'2025-01-07','2025-01-07',1.00,50000.00,'2025-07-31 21:55:19','2025-07-31 21:55:19'),(29,NULL,834000.00,7.50,12210.00,3.00,20000.00,963780.00,3.50,0.32,5081.92,483692.95,77102.40,14519,25,7,2025,'2025-01-07','2025-01-07',1.00,50000.00,'2025-07-31 21:55:19','2025-07-31 21:55:19'),(30,NULL,834000.00,7.50,12210.00,3.00,20000.00,876220.50,3.50,0.32,4620.23,439749.41,70097.64,13200,25,7,2025,'2025-01-07','2025-01-07',1.00,50000.00,'2025-07-31 21:58:28','2025-07-31 21:58:28'),(31,NULL,834000.00,7.50,11760.00,3.00,50000.00,815769.50,3.50,0.32,4301.47,409410.82,65261.56,12289,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-07-31 21:59:12','2025-07-31 21:59:12'),(32,NULL,834000.00,7.50,11760.00,3.00,50000.00,903329.00,3.50,0.32,4763.17,453354.37,72266.32,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-07-31 22:00:11','2025-07-31 22:00:11'),(33,NULL,834000.00,7.50,11760.00,3.00,50000.00,903329.00,3.50,0.32,4763.17,453354.37,72266.32,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-07-31 22:00:18','2025-07-31 22:00:18'),(34,NULL,834000.00,7.50,11760.00,3.00,50000.00,903329.00,3.50,0.32,4763.17,453354.37,72266.32,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-07-31 22:00:19','2025-07-31 22:00:19'),(35,NULL,834000.00,7.50,11760.00,3.00,50000.00,903329.00,3.50,0.32,4763.17,453354.37,72266.32,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-07-31 22:02:26','2025-07-31 22:02:26'),(36,NULL,834000.00,7.50,11760.00,3.00,50000.00,903329.00,3.50,0.32,4763.17,453354.37,72266.32,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-07-31 22:02:35','2025-07-31 22:02:35'),(37,1,834000.00,7.50,11760.00,3.00,50000.00,903330.00,3.50,0.32,4763.17,453354.87,72266.40,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,20000.00,'2025-07-31 22:06:33','2025-07-31 22:06:33'),(38,1,834000.00,7.50,11760.00,3.00,50000.00,903330.00,3.50,0.32,4763.17,453354.87,72266.40,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,20000.00,'2025-07-31 22:06:38','2025-07-31 22:06:38'),(39,1,834000.00,6.50,11760.00,2.00,50000.00,866650.00,3.50,0.32,4569.76,434946.25,69332.00,13056,25,7,2025,'2025-01-07','2025-01-07',1.00,0.00,'2025-07-31 22:07:40','2025-07-31 22:07:40'),(40,1,834000.00,6.50,11760.00,2.00,50000.00,866650.00,7.50,0.32,6635.57,1054690.11,69332.00,18958,25,7,2025,'2025-01-07','2025-01-07',1.00,0.00,'2025-07-31 22:07:59','2025-07-31 22:07:59'),(41,1,834000.00,3.50,11760.00,3.00,50000.00,849970.00,7.50,0.32,6507.86,1034390.99,67997.60,18593,25,7,2025,'2025-01-07','2025-01-07',1.00,0.00,'2025-07-31 22:08:11','2025-07-31 22:08:11'),(42,1,834000.00,3.50,11760.00,3.00,50000.00,869970.00,7.50,0.32,6660.99,1058730.46,69597.60,19031,25,7,2025,'2025-01-07','2025-01-07',1.00,20000.00,'2025-07-31 22:08:35','2025-07-31 22:08:35'),(43,1,834000.00,3.50,11760.00,3.00,50000.00,869970.00,7.50,0.32,6660.99,1058730.46,69597.60,19031,25,7,2025,'2025-01-07','2025-01-07',1.00,20000.00,'2025-07-31 22:09:06','2025-07-31 22:09:06'),(44,NULL,834000.00,7.50,11760.02,3.00,49999.00,903330.02,3.50,0.32,4763.17,453354.88,72266.40,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-07-31 22:09:44','2025-07-31 22:09:44'),(45,NULL,834000.00,62550.00,11760.02,25020.00,49999.00,903330.02,3.50,0.32,4763.17,453354.88,72266.40,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-07-31 22:12:50','2025-07-31 22:12:50'),(46,NULL,834000.00,62550.00,11760.00,25020.00,50000.00,903327.00,3.50,0.32,4763.16,453353.36,72266.16,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19997.00,'2025-07-31 22:13:00','2025-07-31 22:13:00'),(47,1,834000.00,62550.00,11760.02,25020.00,49999.00,903330.02,3.50,0.31,4755.64,453354.88,70008.08,13587,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-08-01 07:04:47','2025-08-01 07:04:47'),(48,1,834000.00,62550.00,11760.00,25020.00,50000.00,903330.00,3.50,0.31,4755.64,453354.87,70008.08,13587,25,7,2025,'2025-01-07','2025-01-07',1.00,20000.00,'2025-08-01 07:04:57','2025-08-01 07:04:57'),(49,1,834000.00,62550.00,11760.00,25020.00,50000.00,903330.00,3.50,0.31,4755.64,453354.87,70008.08,13587,25,7,2025,'2025-01-07','2025-01-07',1.00,20000.00,'2025-08-01 07:04:58','2025-08-01 07:04:58'),(50,1,833999.00,62549.93,11759.99,25019.97,50000.00,903327.88,3.50,0.32,4763.16,453353.81,72266.23,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-08-01 07:06:08','2025-08-01 07:06:08'),(51,1,834000.00,62550.00,11760.00,25020.00,50000.00,903329.00,3.50,0.32,4763.17,453354.37,72266.32,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-08-01 07:06:21','2025-08-01 07:06:21'),(52,1,834000.00,62550.00,11760.00,25020.00,50000.00,903329.00,3.50,0.32,4763.17,453354.37,72266.32,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-08-01 07:06:30','2025-08-01 07:06:30'),(53,1,834000.00,62550.00,11760.00,25020.00,50000.00,903329.00,3.50,0.32,4763.17,453354.37,72266.32,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,19999.00,'2025-08-01 07:06:34','2025-08-01 07:06:34'),(54,1,834000.00,62550.00,11760.00,25020.00,50000.00,903330.00,3.50,0.32,4763.17,453354.87,72266.40,13609,25,7,2025,'2025-01-07','2025-01-07',1.00,20000.00,'2025-08-01 07:06:38','2025-08-01 07:06:38');
/*!40000 ALTER TABLE `simulations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'eizezi','azaz@gmail.com',NULL,'$2y$12$09w.DRY.Pvh2FH82KxdA1elu/rMzM7.ak1Q/JS6XmLBicWbBLKqDS',NULL,'2025-07-30 22:07:26','2025-07-30 22:07:26'),(7,'DDD','sampanionyra55@gmail.com',NULL,'$2y$12$JuJcuJmCjdWni9OgtGQhj.Kxq.CIyezUA6vvTby.JvVFuV75vmjwO',NULL,'2025-07-30 22:10:08','2025-07-30 22:10:08'),(8,'DDD','sampanxionyra55@gmail.com',NULL,'$2y$12$suHDRThykL07i3v1M0ywUOiplQOWxxosNAZ/IS5VytJIIAqGbDbP2',NULL,'2025-07-30 22:10:20','2025-07-30 22:10:20'),(9,'Sampaniony Rakotoarivelo','sampanionccyra55@gmail.com',NULL,'$2y$12$noFas86K7x31PluMRKNg/uBFNcDIfhD9XzqypqeLJTZem9T2owrcu',NULL,'2025-07-30 22:11:14','2025-07-30 22:11:14'),(10,'DDD','admin@admin.com',NULL,'$2y$12$2y5bBCDGbUspBIpU/4JZyOolqSFypPflnGYuP.6nEhcrT552nRLee',NULL,'2025-07-30 22:11:51','2025-07-30 22:11:51'),(11,'Sampaniony Rakotoarivelo','organisateur@org.com',NULL,'$2y$12$9Y5MTP3RhlH1gZjtmChNN.YOLY4vV.d8wPzeKs/HaWsYuHhgQ4GO.',NULL,'2025-07-30 22:12:25','2025-07-30 22:12:25'),(12,'testy','test@test.com',NULL,'$2y$12$MjvY53FbvDQVgKVqJ.BkveBXmctUxHesm1vH7DalVejI4QsCJRsWe',NULL,'2025-07-31 06:53:48','2025-07-31 06:53:48');
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

-- Dump completed on 2025-08-01 11:41:46
