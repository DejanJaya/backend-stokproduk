-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.8-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema db_stokproduk
--

CREATE DATABASE IF NOT EXISTS db_stokproduk;
USE db_stokproduk;

--
-- Definition of table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;


--
-- Definition of table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache_locks`
--

/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;


--
-- Definition of table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;


--
-- Definition of table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_batches`
--

/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;


--
-- Definition of table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;


--
-- Definition of table `kategoris`
--

DROP TABLE IF EXISTS `kategoris`;
CREATE TABLE `kategoris` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategoris`
--

/*!40000 ALTER TABLE `kategoris` DISABLE KEYS */;
INSERT INTO `kategoris` (`id`,`nama_kategori`,`deskripsi`,`created_at`,`updated_at`) VALUES 
 (1,'makanan','Produk konsumsi makanan sehari - hari','2025-10-03 15:04:36','2025-10-03 15:04:36'),
 (2,'minumans','Produk untuk kebutuhan minuman sehari -haris','2025-10-03 15:05:04','2025-10-03 15:22:01');
/*!40000 ALTER TABLE `kategoris` ENABLE KEYS */;


--
-- Definition of table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES 
 (1,'0001_01_01_000000_create_users_table',1),
 (2,'0001_01_01_000001_create_cache_table',1),
 (3,'0001_01_01_000002_create_jobs_table',1),
 (4,'2025_09_24_030640_create_personal_access_tokens_table',1),
 (5,'2025_10_03_140719_create_kategoris_table',2),
 (6,'2025_10_03_141044_create_produks_table',3),
 (7,'2025_10_04_022758_create_transaksis_table',4),
 (8,'2025_10_04_022831_create_transaksi_details_table',4),
 (9,'2025_10_04_023547_create_transaksi_details_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


--
-- Definition of table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;


--
-- Definition of table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` (`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) VALUES 
 (1,'App\\Models\\User',1,'App','a5be64bc669650fbef95502eeb298e79afa3098257ec5f937c4f375ca2a198cf','[\"*\"]',NULL,NULL,'2025-10-03 09:59:39','2025-10-03 09:59:39'),
 (2,'App\\Models\\User',1,'App','24a500742648ed954db67f857f55bf82695df730ca7d7a9a6316deb6c573ee73','[\"*\"]','2025-10-03 13:51:52',NULL,'2025-10-03 11:47:03','2025-10-03 13:51:52'),
 (3,'App\\Models\\User',1,'App','e5637f2e3a16776f20c5442d1f330e7c36c332c1c70ebc6c6d3fd71e1a654f4e','[\"*\"]','2025-10-03 13:55:40',NULL,'2025-10-03 13:52:04','2025-10-03 13:55:40'),
 (4,'App\\Models\\User',1,'App','6b87f91051fd18de867da46410d38128e4e8cb7bff657042b5df100fbbc196a4','[\"*\"]','2025-10-04 00:38:15',NULL,'2025-10-03 13:52:23','2025-10-04 00:38:15'),
 (5,'App\\Models\\User',1,'App','aeca885439a260ad224e223a5b3b93883ab3a275ef524f633bb99901eaf148b9','[\"*\"]',NULL,NULL,'2025-10-04 00:38:27','2025-10-04 00:38:27'),
 (6,'App\\Models\\User',1,'App','85895f5a2130481d0502e60c57d171954ded0e8b074c9668716b4577dfa2a63b','[\"*\"]',NULL,NULL,'2025-10-04 00:39:19','2025-10-04 00:39:19'),
 (7,'App\\Models\\User',1,'App','af9df5de5596295b255aa374fcbf06c43a49c8c4c81e894ba419b42f47db3a50','[\"*\"]',NULL,NULL,'2025-10-04 00:39:42','2025-10-04 00:39:42'),
 (8,'App\\Models\\User',1,'App','a3a9cab85a6e1bdc0f1c2bbf00151d17a1d2d78ec9714b59e7c331d6c3a2a868','[\"*\"]','2025-10-04 04:18:05',NULL,'2025-10-04 00:40:13','2025-10-04 04:18:05'),
 (9,'App\\Models\\User',3,'App','c4f19b101130fd65641ac4872a9aaca87fff4b9e5b1a3ae9b78b9f45363424b8','[\"*\"]','2025-10-04 04:25:26',NULL,'2025-10-04 04:18:18','2025-10-04 04:25:26'),
 (10,'App\\Models\\User',3,'App','041f6626095dc692265925e788a7294c8faad70368d10c19a2b06d1ff44cc2a8','[\"*\"]',NULL,NULL,'2025-10-04 04:18:57','2025-10-04 04:18:57'),
 (11,'App\\Models\\User',1,'App','1074f9f3b3ac1cf9468c29b082e08229a6de1af3a69ea20e2c6614dc47bb208f','[\"*\"]',NULL,NULL,'2025-10-04 04:25:38','2025-10-04 04:25:38'),
 (12,'App\\Models\\User',1,'App','5c1592589d18d600e243d2b41af10c10cac0b0552119d56fea46ba67f164166a','[\"*\"]','2025-10-04 04:26:52',NULL,'2025-10-04 04:25:49','2025-10-04 04:26:52'),
 (13,'App\\Models\\User',1,'App','6bb50c5cac734f759ced7b6ea239c8da5de7e09c46873596749dd435a742654b','[\"*\"]',NULL,NULL,'2025-10-04 04:26:02','2025-10-04 04:26:02'),
 (14,'App\\Models\\User',1,'App','b61e4ae0496344c1cface0a2ee058e055fd810514c6234760b1a7fdf9d82f78b','[\"*\"]',NULL,NULL,'2025-10-04 04:50:48','2025-10-04 04:50:48'),
 (15,'App\\Models\\User',1,'App','1894691e66a2f76556b1b4f287bda5dd9eb6512093f3fd08f7b13b57a1644145','[\"*\"]',NULL,NULL,'2025-10-04 04:51:01','2025-10-04 04:51:01'),
 (16,'App\\Models\\User',1,'App','b9c0f51313e19ad8ca3d1f47c5b12a44c3e61b0874b85925413e2ca4364cb69f','[\"*\"]',NULL,NULL,'2025-10-04 04:51:13','2025-10-04 04:51:13');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;


--
-- Definition of table `produks`
--

DROP TABLE IF EXISTS `produks`;
CREATE TABLE `produks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori_id` bigint(20) unsigned NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produks_kategori_id_foreign` (`kategori_id`),
  CONSTRAINT `produks_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produks`
--

/*!40000 ALTER TABLE `produks` DISABLE KEYS */;
INSERT INTO `produks` (`id`,`nama_produk`,`deskripsi`,`gambar`,`kategori_id`,`stok`,`created_at`,`updated_at`) VALUES 
 (2,'Nee Tea','Minuman Teh Manis','produks/HBDDAZOnEMrjJsH2CMoDnioZaa3dMwurZDZQVyX1.jpg',1,9,'2025-10-04 02:13:30','2025-10-04 04:08:01'),
 (3,'silverqueen','makanan coklat','produks/yqQdktiBeaZT1lCWijbtHvdcC340bhQ87pmeloba.jpg',1,2,'2025-10-04 03:35:33','2025-10-04 04:04:30');
/*!40000 ALTER TABLE `produks` ENABLE KEYS */;


--
-- Definition of table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


--
-- Definition of table `transaksi_details`
--

DROP TABLE IF EXISTS `transaksi_details`;
CREATE TABLE `transaksi_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaksi_id` bigint(20) unsigned NOT NULL,
  `produk_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaksi_details_transaksi_id_foreign` (`transaksi_id`),
  KEY `transaksi_details_produk_id_foreign` (`produk_id`),
  CONSTRAINT `transaksi_details_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`),
  CONSTRAINT `transaksi_details_transaksi_id_foreign` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi_details`
--

/*!40000 ALTER TABLE `transaksi_details` DISABLE KEYS */;
INSERT INTO `transaksi_details` (`id`,`transaksi_id`,`produk_id`,`quantity`,`created_at`,`updated_at`) VALUES 
 (1,2,2,2,'2025-10-04 04:00:13','2025-10-04 04:00:13'),
 (2,3,2,10,'2025-10-04 04:04:30','2025-10-04 04:04:30'),
 (3,3,3,8,'2025-10-04 04:04:30','2025-10-04 04:04:30'),
 (4,4,2,8,'2025-10-04 04:08:01','2025-10-04 04:08:01');
/*!40000 ALTER TABLE `transaksi_details` ENABLE KEYS */;


--
-- Definition of table `transaksis`
--

DROP TABLE IF EXISTS `transaksis`;
CREATE TABLE `transaksis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `type` enum('in','out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_input` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaksis_user_id_foreign` (`user_id`),
  CONSTRAINT `transaksis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

/*!40000 ALTER TABLE `transaksis` DISABLE KEYS */;
INSERT INTO `transaksis` (`id`,`user_id`,`type`,`tgl_input`,`created_at`,`updated_at`) VALUES 
 (2,1,'in','2025-10-04','2025-10-04 04:00:13','2025-10-04 04:00:13'),
 (3,1,'out','2025-10-04','2025-10-04 04:04:30','2025-10-04 04:04:30'),
 (4,1,'in','2025-10-05','2025-10-04 04:08:01','2025-10-04 04:08:01');
/*!40000 ALTER TABLE `transaksis` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_depan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`nama_depan`,`nama_belakang`,`email`,`tgl_lahir`,`jenis_kelamin`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (1,'Adminss','Satu','admin@gmail.com','1993-08-01','L',NULL,'$2y$12$DeDd7KdzA0D8ccDGfObyv.iJzC3o0uGxHe3DNJhUq2HE/9X5u386K',NULL,'2025-10-03 09:42:53','2025-10-04 04:25:22'),
 (3,'Admin','Duass','admin2@gmail.com','2025-10-01','P',NULL,'$2y$12$3LzHURYRv0FgTuMcchYxSubqsSSauMQB4rSEG9UYAxD5Co7tKz7QC',NULL,'2025-10-04 04:17:56','2025-10-04 04:23:23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
