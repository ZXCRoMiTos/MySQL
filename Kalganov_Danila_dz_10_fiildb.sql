-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_20
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

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
-- Table structure for table `avatars`
--

DROP DATABASE IF EXISTS project;
CREATE DATABASE project;
USE project;


DROP TABLE IF EXISTS `avatars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `filename` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `avatars_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatars`
--

LOCK TABLES `avatars` WRITE;
/*!40000 ALTER TABLE `avatars` DISABLE KEYS */;
INSERT INTO `avatars` VALUES (1,1,'/20a59349a9774cf31c4ae70d9745d6e0.jpg'),(2,2,'/0718d145a5549296c04eb15a50d0ccf7.jpg'),(3,3,'/c94d59c48991f4ca66bff480bb86a7f7.jpg'),(4,4,'/9e927b2f1f95c35d22cb92d59893f354.jpg'),(5,5,'/e48daca18f98f45a6e3f2a0e1966eef8.jpg'),(6,6,'/badd451b4face66cbdd54ac31bfb7496.jpg'),(7,7,'/15e4089bb400ecec5cd072ee2a9e9928.jpg'),(8,8,'/81ec28107073d1c5fa7a04b7ea76bdac.jpg'),(9,9,'/4cdaedc668854ff4ebd90692ba6a0536.jpg'),(10,10,'/b7ee87db7edd7d3e85b2b3ad277e794b.jpg');
/*!40000 ALTER TABLE `avatars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultants`
--

DROP TABLE IF EXISTS `consultants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultants`
--

LOCK TABLES `consultants` WRITE;
/*!40000 ALTER TABLE `consultants` DISABLE KEYS */;
INSERT INTO `consultants` VALUES (1,'Kamren','Harvey','casper.emelie@example.net'),(2,'Aiyana','Feest','vgoyette@example.com'),(3,'Alize','Ebert','cartwright.jocelyn@example.net'),(4,'Angie','Klocko','dereck.bode@example.net'),(5,'Corene','Fay','skuvalis@example.com'),(6,'Lonny','Gutmann','wmarvin@example.net'),(7,'Phoebe','Ferry','prosacco.laurie@example.com'),(8,'Thad','Haag','sanford.elda@example.org'),(9,'Isac','Hammes','nicolette52@example.net'),(10,'Randi','Cronin','hbrown@example.com'),(11,'Delpha','Cormier','heathcote.giovani@example.com'),(12,'Selena','Rice','toy.vita@example.org'),(13,'Torrance','Mayer','cedrick02@example.org'),(14,'Osborne','Upton','sedrick.sipes@example.net'),(15,'Jasper','Hirthe','dahlia00@example.com'),(16,'Abe','Corwin','yjacobson@example.com'),(17,'Ladarius','Welch','aiden.bailey@example.org'),(18,'Theo','Mayert','breanne.reynolds@example.org'),(19,'Matilda','Price','augusta.swaniawski@example.org'),(20,'Lia','Balistreri','pattie23@example.org'),(21,'Barrett','Runolfsdottir','emard.joe@example.org'),(22,'Winnifred','Kutch','vonrueden.xander@example.org'),(23,'Ole','Hamill','ymraz@example.org'),(24,'Melany','Trantow','frederick12@example.org'),(25,'Astrid','Kiehn','mmaggio@example.com'),(26,'Ubaldo','Macejkovic','durgan.malinda@example.net'),(27,'Jessyca','Kutch','qcorwin@example.net'),(28,'Darrion','Powlowski','lucie.buckridge@example.com'),(29,'Reva','Lynch','garret63@example.net'),(30,'Tony','Rice','ngrant@example.org'),(31,'Madalyn','Osinski','fkovacek@example.org'),(32,'Florencio','Ebert','austin.homenick@example.com'),(33,'Donald','Bechtelar','murphy.retta@example.com'),(34,'Rosetta','Kunze','trudie.pagac@example.net'),(35,'Waylon','Zulauf','justice81@example.org'),(36,'Fanny','Metz','stokes.arlie@example.net'),(37,'Abigail','Okuneva','ryley.abbott@example.net'),(38,'Jaycee','O\'Reilly','luther.jacobs@example.org'),(39,'Corene','Herzog','swaniawski.leonora@example.net'),(40,'Adonis','Runolfsson','vivian11@example.com'),(41,'Kory','O\'Reilly','rgoldner@example.net'),(42,'Fanny','Hegmann','gisselle09@example.com'),(43,'Della','Emmerich','kling.wendy@example.com'),(44,'Floyd','Dach','christiansen.emilio@example.org'),(45,'Arvid','Wuckert','twaters@example.net'),(46,'Maria','Emard','gorczany.kian@example.net'),(47,'Joshuah','Schuster','cale64@example.net'),(48,'Ansel','Hayes','qkovacek@example.com'),(49,'Alphonso','Hamill','witting.nathan@example.com'),(50,'Arely','Aufderhar','qwitting@example.net'),(51,'Brandyn','Hodkiewicz','lynch.hazle@example.com'),(52,'Idell','Lehner','adolphus68@example.net'),(53,'Sean','Wilderman','jmarks@example.org'),(54,'Dorian','Yundt','dmann@example.org'),(55,'Florine','Lesch','eichmann.clay@example.org'),(56,'Vern','Schroeder','clara32@example.org'),(57,'Archibald','Kautzer','foster20@example.org'),(58,'Tyler','Johnson','tschinner@example.org'),(59,'Troy','Maggio','schiller.linda@example.net'),(60,'Myron','Bauch','dante.eichmann@example.com'),(61,'Danika','Huel','reichel.susana@example.com'),(62,'Moses','Carter','adolf.cassin@example.net'),(63,'Emiliano','Lehner','katheryn77@example.com'),(64,'Oceane','Dooley','josue56@example.com'),(65,'Meghan','West','odie.ruecker@example.org'),(66,'Tod','O\'Conner','casey.jacobs@example.org'),(67,'Adela','Fisher','cronin.herta@example.com'),(68,'Abdul','Walsh','ortiz.olin@example.net'),(69,'Eino','Roberts','to\'kon@example.org'),(70,'Brittany','Quigley','evert06@example.net'),(71,'Wilburn','Murray','davis.quinten@example.com'),(72,'Marta','O\'Keefe','desmond.roob@example.net'),(73,'Remington','Von','flavie86@example.net'),(74,'Fatima','Cartwright','estel.koelpin@example.org'),(75,'Leopoldo','McGlynn','agustina77@example.org'),(76,'Jonatan','Waters','ecummings@example.net'),(77,'Lucious','Hoppe','alden05@example.com'),(78,'Horace','Wehner','becker.sophia@example.org'),(79,'Mariane','Monahan','gene.bosco@example.net'),(80,'Vida','Ernser','jessie.crist@example.net'),(81,'Annette','Mosciski','fortiz@example.org'),(82,'Lou','Daniel','pouros.guy@example.org'),(83,'Nils','Smitham','ken64@example.net'),(84,'Wanda','Wolf','hilpert.ebony@example.com'),(85,'Katelyn','Kunze','deion24@example.net'),(86,'Cynthia','Becker','fisher.webster@example.org'),(87,'Alison','Hartmann','august.tillman@example.com'),(88,'Addison','Runte','drew58@example.org'),(89,'Lizeth','Gerlach','ischinner@example.net'),(90,'Wilma','Weber','jennings00@example.net'),(91,'Gerda','Volkman','austin45@example.net'),(92,'Theresia','Schuster','lebert@example.net'),(93,'Isai','Collins','hartmann.carmella@example.com'),(94,'Hipolito','Romaguera','schmitt.henri@example.com'),(95,'Bryana','Lebsack','allie.wolf@example.org'),(96,'Russell','Gleason','lorna44@example.org'),(97,'Marty','Schinner','connelly.luciano@example.org'),(98,'Noemy','Heidenreich','cicero37@example.com'),(99,'Piper','Ankunding','cferry@example.com'),(100,'Kara','Maggio','hkessler@example.net');
/*!40000 ALTER TABLE `consultants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donate_category`
--

DROP TABLE IF EXISTS `donate_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donate_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donate_category`
--

LOCK TABLES `donate_category` WRITE;
/*!40000 ALTER TABLE `donate_category` DISABLE KEYS */;
INSERT INTO `donate_category` VALUES (1,'dolorem'),(2,'et'),(3,'ut'),(4,'voluptatem'),(5,'distinctio'),(6,'itaque'),(7,'aut'),(8,'repellat'),(9,'voluptatibus'),(10,'explicabo');
/*!40000 ALTER TABLE `donate_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donate_log`
--

DROP TABLE IF EXISTS `donate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donate_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `product_id` (`product_id`),
  CONSTRAINT `donate_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `donate_log_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donate_log`
--

LOCK TABLES `donate_log` WRITE;
/*!40000 ALTER TABLE `donate_log` DISABLE KEYS */;
INSERT INTO `donate_log` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `donate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `switch` bit(1) DEFAULT NULL COMMENT '0: from_consultant, to_user 2: from_user, to_consultant',
  `user_id` bigint(20) unsigned NOT NULL,
  `consult_id` bigint(20) unsigned NOT NULL,
  `text` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `consult_id` (`consult_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`consult_id`) REFERENCES `consultants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'\0',1,1,'Repellat ut ducimus quos. Provident magni sunt tenetur commodi necessitatibus. Debitis earum molestiae quia doloribus tempora ut consequatur.'),(2,'\0',2,2,'Numquam rem eos incidunt. Doloribus voluptatem debitis autem cumque vero. Qui quas voluptate id voluptatem voluptatibus. Rerum nesciunt voluptatem dignissimos cumque.'),(3,'',3,3,'Et consequatur aspernatur unde officiis recusandae ut fuga. Incidunt consequatur cum suscipit debitis.'),(4,'',4,4,'Quia sunt est qui vero eveniet. Autem excepturi dignissimos id nobis nisi modi. A quis voluptatem placeat ipsam quos.\nVel eos ad ea. Rerum et omnis facere fugiat incidunt error velit magnam.'),(5,'\0',5,5,'Quasi et sapiente libero ea mollitia veritatis. Totam quia ut voluptas voluptatum animi. Corporis voluptates expedita quo totam consequuntur corporis. Corrupti et cum blanditiis beatae dolore animi.'),(6,'',6,6,'Iure sit fuga enim eaque et possimus non. Porro voluptatem adipisci quis maxime quo a. Et qui sint qui esse sunt illo.'),(7,'',7,7,'Eos minus amet eos impedit quaerat. Odit incidunt officiis voluptas natus totam eos. Voluptatem magni aut voluptas voluptas minus. Id et reiciendis placeat possimus reiciendis.'),(8,'\0',8,8,'Quas dolores in excepturi itaque. Sed quia autem ut.\nSequi sint tenetur voluptatem magnam in quidem. Suscipit qui commodi quia voluptas. Non est reiciendis minus aut in nam ut.'),(9,'',9,9,'Ut et est facere voluptatem dolorum. Eos molestiae sunt error velit minima. Laborum atque beatae cum voluptas quia incidunt. Deserunt ea ut facilis sapiente.'),(10,'\0',10,10,'Est eum sint quis vel consequuntur vitae. Modi iure ipsam inventore adipisci quo minus hic. Molestiae nihil laudantium enim sapiente nemo in veritatis.');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(10) unsigned NOT NULL,
  `discount` int(10) unsigned DEFAULT 0,
  `discription` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `donate_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'et',2162444,5,'Nemo nobis aut ut debitis. Ut tempore error magni odit quas.'),(2,2,'tenetur',48979837,6,'Delectus iste nihil nihil consequuntur. Ipsam veritatis eveniet repellendus consequuntur cum rerum commodi. Pariatur perferendis cupiditate accusantium architecto qui.'),(3,3,'doloribus',22,9,'Vel quia nesciunt labore amet cum architecto porro. Ut ut voluptas eius ut at cumque consectetur. Asperiores soluta sunt similique ducimus doloribus quas.'),(4,4,'debitis',176399646,9,'Repellat eos sint et molestias rem modi. Excepturi nesciunt hic qui corrupti enim. Sit ut libero aspernatur veritatis nam laboriosam.'),(5,5,'modi',2,8,'Nisi assumenda in inventore nisi. Corrupti autem optio eaque. Porro cum laborum et harum et.'),(6,6,'doloribus',815874,1,'Minus sit sit natus et nihil aut assumenda. Quia nemo sit eveniet perspiciatis est id cupiditate. In corporis rerum sint nisi minima ratione. Amet laboriosam soluta enim ut fuga aut veritatis.'),(7,7,'minus',1907,3,'Sequi aperiam minima assumenda odit quia quia animi. Harum aliquid voluptatem labore et quae qui quo.'),(8,8,'illo',38890,3,'Ut consequatur possimus repudiandae odit quo. Corporis sed voluptates officiis id. Ex ullam voluptas voluptatibus id dicta sed sunt.'),(9,9,'aut',804,6,'Voluptates eum praesentium dolorem assumenda incidunt delectus qui fugit. Delectus at esse repellat ut aperiam hic velit. Consectetur aut amet nobis harum omnis. Libero quisquam nisi sed.'),(10,10,'deserunt',989167,4,'Quos temporibus est sit debitis accusantium minima quia tempore. Ea atque qui sed. Quis ut culpa voluptatum possimus blanditiis.');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `nickname` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `avatar_id` bigint(20) unsigned DEFAULT NULL,
  `skin_id` bigint(20) unsigned DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  `authenticator` bit(1) DEFAULT b'0',
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `nickname` (`nickname`),
  KEY `avatar_id` (`avatar_id`),
  KEY `skin_id` (`skin_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `profiles_ibfk_2` FOREIGN KEY (`avatar_id`) REFERENCES `avatars` (`id`),
  CONSTRAINT `profiles_ibfk_3` FOREIGN KEY (`skin_id`) REFERENCES `skins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'perspiciatis','C','1977-07-08',1,1,50219,'',''),(2,'et','H','1989-11-20',2,2,46126542,'','\0'),(3,'nihil','C','2002-06-07',3,3,250712,'',''),(4,'voluptatem','J','2000-03-27',4,4,1,'','\0'),(5,'explicabo','M','2014-05-19',5,5,18002,'',''),(6,'sed','T','1973-10-16',6,6,647,'','\0'),(7,'nulla','M','1986-03-07',7,7,798,'',''),(8,'eligendi','V','2014-02-14',8,8,0,'','\0'),(9,'dignissimos','D','1971-03-02',9,9,598,'','\0'),(10,'repellendus','A','2002-01-10',10,10,1780,'','\0');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

UPDATE profiles
	set gender = 'f';

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `points` enum('5','4','3','2','1') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `product_id` (`product_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (101,1,1,'1','Non sed id molestiae aperiam. Omnis iste aut et placeat vitae. Vel qui beatae sed optio.'),(102,2,2,'4','Aut et rem distinctio et. Qui ipsa minus deserunt hic est.\nEt tempora earum quasi. Dignissimos ex itaque voluptate ipsum nemo. Et maiores aliquam labore sint pariatur ut.'),(103,3,3,'2','Et amet culpa recusandae non. In animi dolores veniam in voluptatum. Facere quia voluptate magnam.'),(104,4,4,'3','Et impedit ducimus pariatur aut ut recusandae. Eligendi laborum autem nam veritatis et aut. Laborum qui ipsum cupiditate eos est. Sit sit ea sapiente et aspernatur repellendus sapiente.'),(105,5,5,'1','Eum quibusdam ex aut ut vero necessitatibus nam qui. Atque totam aut illo praesentium qui aut. Repudiandae sunt quos accusantium a soluta.'),(106,6,6,'2','Aspernatur ad tempora odio maiores perferendis consequatur. Adipisci provident illo quis odit incidunt natus rerum. Delectus eos quibusdam quasi eos sint officia.'),(107,7,7,'4','Neque deserunt accusamus maiores ipsam voluptatem. Voluptas est corporis recusandae consectetur ea nisi.'),(108,8,8,'4','Cupiditate assumenda ab voluptate fugiat vel est fuga. Necessitatibus aspernatur ullam voluptate facilis dolorem. Molestiae at rerum ipsum qui. Placeat molestiae numquam vitae tempora est.'),(109,9,9,'3','Est ut ut nesciunt veniam. Reiciendis delectus quia quaerat. Excepturi et ut velit delectus qui voluptas et. Et quia tempora aut quod dolore qui.'),(110,10,10,'2','Reprehenderit tenetur voluptas aliquam libero. In qui qui provident numquam rerum consequuntur delectus. Unde explicabo voluptas voluptatibus est.');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skins`
--

DROP TABLE IF EXISTS `skins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `skin_filename` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cloak_filename` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HD` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `skins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skins`
--

LOCK TABLES `skins` WRITE;
/*!40000 ALTER TABLE `skins` DISABLE KEYS */;
INSERT INTO `skins` VALUES (1,1,'mdi','odp','\0'),(2,2,'sh','fly',''),(3,3,'geo','ecma','\0'),(4,4,'mpp','ipk','\0'),(5,5,'ivp','flac','\0'),(6,6,'sisx','esf','\0'),(7,7,'appcache','vcx','\0'),(8,8,'xsm','hdf','\0'),(9,9,'sql','fhc','\0'),(10,10,'ogv','mpp','');
/*!40000 ALTER TABLE `skins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Green','1ebb2075424123968f0df8816dd3d2a5','breinger@example.net','2018-03-21 16:06:34'),(2,'Devonte','8c4142b0be1352133494c3c44f9ea73e','lakin.addison@example.com','1985-07-06 20:29:35'),(3,'Kayden','fad9f947c2ef54e14195ba4addceb0ff','stark.donnie@example.com','1992-11-21 04:18:29'),(4,'Fidel','c51e8e3152f3040a0b12bcefbfd1ae8c','treutel.dillon@example.org','2008-06-21 11:45:53'),(5,'Skye','959ab5e2bfea69ee695c4de964861c64','lkirlin@example.net','1996-12-24 08:40:57'),(6,'Mark','4510faa53a247cba5aa1b2e46ea41bd0','assunta01@example.org','2006-06-11 02:26:58'),(7,'Lazaro','a9ad493e6caca7dad9f356bb6a0a59f0','icole@example.org','1978-07-17 17:16:51'),(8,'Jadon','093f63785141b465cb06d6c4e762d9bc','lacey73@example.com','2010-12-06 04:37:59'),(9,'Kale','1e4391d07dd20f7e7ba1b026d5d64ed1','mernser@example.net','1998-03-14 07:49:28'),(10,'Demond','6fd3ae77f2f703f48981e27720c572dd','jude.adams@example.com','2019-11-23 13:24:07');
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

-- Dump completed on 2021-08-30  8:25:42
