-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: house_of_barber
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `estabelecimento_id` int(11) NOT NULL,
  `data_agendamento` date NOT NULL,
  `horario_agendamento` time NOT NULL,
  `valor` float NOT NULL,
  `status` varchar(30) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
INSERT INTO `agendamento` VALUES (13,4,4,'2022-08-21','09:00:00',13,'PENDENTE','2022-08-19 03:32:33'),(16,4,4,'2022-08-21','10:30:00',5,'FINALIZADO','2022-08-19 04:44:22'),(17,4,4,'2022-08-28','20:30:00',5,'PENDENTE','2022-08-20 21:02:29'),(18,4,4,'2022-08-21','09:30:00',5,'PENDENTE','2022-08-21 22:24:22'),(19,4,4,'2022-08-21','18:00:00',5,'PENDENTE','2022-08-21 23:17:29'),(20,4,4,'2022-08-21','18:30:00',5,'PENDENTE','2022-08-21 23:18:22');
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agendamento_servico`
--

DROP TABLE IF EXISTS `agendamento_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento_servico` (
  `agendamento_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento_servico`
--

LOCK TABLES `agendamento_servico` WRITE;
/*!40000 ALTER TABLE `agendamento_servico` DISABLE KEYS */;
INSERT INTO `agendamento_servico` VALUES (13,3),(16,3),(16,4),(17,4),(18,4),(18,4),(18,3),(18,3),(19,4),(20,4),(20,3);
/*!40000 ALTER TABLE `agendamento_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_token`
--

DROP TABLE IF EXISTS `api_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_token` (
  `id_api_token` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `perfil` varchar(50) NOT NULL,
  `token` varchar(255) NOT NULL,
  `data_acesso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_token`
--

LOCK TABLES `api_token` WRITE;
/*!40000 ALTER TABLE `api_token` DISABLE KEYS */;
INSERT INTO `api_token` VALUES (1,4,'CLIENTE','889afc8ffeee9e92484b21b8e528e422','2022-08-12 04:06:27'),(2,4,'CLIENTE','9bb68bb0952dbc58a40e3ac60dbc4cb9','2022-08-12 04:07:58'),(3,4,'CLIENTE','a6e4e1e3942a444ad6d951c216d07c3a','2022-08-12 04:08:17'),(4,4,'CLIENTE','8a4f5ad1deffa7c2b4a46a3a26266463','2022-08-12 04:34:13'),(5,4,'CLIENTE','70f30da7456e8d144e00beb09df4f6d3','2022-08-12 04:37:18'),(6,4,'CLIENTE','8d950518ea9034390b14bcfc80712687','2022-08-13 01:21:21'),(7,4,'CLIENTE','e80c82618682d54eb11eb156a5804db9','2022-08-13 02:40:04'),(8,4,'CLIENTE','e597396e93de852973d03cbf49052654','2022-08-13 02:45:38'),(9,4,'CLIENTE','0c64424bb015f6530a55a7c00e27dabb','2022-08-13 03:11:08'),(10,4,'ESTABELECIMENTO','032967b00806d8bd69b6f709f4ddfc5c','2022-08-13 16:58:59'),(11,4,'ESTABELECIMENTO','114bb0790fd594b0baaf85b932a75dbb','2022-08-13 17:01:39'),(12,4,'ESTABELECIMENTO','ee5e03b873400b40369374fe85978f0b','2022-08-13 17:06:00'),(13,4,'ESTABELECIMENTO','b63e3ce41d471fdeb9b1355c2400a815','2022-08-13 17:06:40'),(14,4,'CLIENTE','ba145403902f4db8138cf0a26bc364e3','2022-08-13 23:06:49'),(15,4,'ESTABELECIMENTO','a74ceb1a9b80c6e411dfd96fbcb11b42','2022-08-13 23:09:11'),(16,4,'CLIENTE','f4f4a60864c1e6f9e95be9bc731a31ab','2022-08-14 14:19:33'),(17,4,'ESTABELECIMENTO','332fffd4562248af921376bdd5fee152','2022-08-14 14:22:21'),(18,4,'CLIENTE','a909f070a0cb86c46613675cde8ba8bb','2022-08-14 14:23:47'),(19,4,'CLIENTE','79040930fb20b4d4a1921ce97532f4ff','2022-08-14 18:44:51'),(20,4,'CLIENTE','efcb113a809f63b71cc88ab0e1fc7677','2022-08-15 00:08:09'),(21,4,'CLIENTE','f0eb79b660eafcc9ae7a0fc308f62ef3','2022-08-15 10:13:35'),(22,4,'ESTABELECIMENTO','69539a35b2931d236636ee776c433ba7','2022-08-15 16:45:52'),(23,4,'ESTABELECIMENTO','d0eb1b587ee176bb547a1290ea773a4e','2022-08-15 16:48:35'),(24,4,'ESTABELECIMENTO','dc73b607416c2a70b594413a919d1259','2022-08-15 16:48:47'),(25,4,'ESTABELECIMENTO','91ab831f6811288eb31e10145a496569','2022-08-16 00:45:57'),(26,4,'CLIENTE','7506bef4074e7f3dddd9fd8a20021ef7','2022-08-19 01:37:00'),(27,4,'ESTABELECIMENTO','06cf1b40acae566a83651829008a1657','2022-08-19 01:52:32'),(28,4,'ESTABELECIMENTO','e16b00d799cd6fdba0d03c4aa1c072bd','2022-08-19 03:06:41'),(29,4,'CLIENTE','73cddba3dc096fdca456d15ac778ae1f','2022-08-19 03:27:30'),(30,4,'ESTABELECIMENTO','85a8a77e830a495359fd43e8835559e8','2022-08-20 19:15:26'),(31,4,'ESTABELECIMENTO','32da0d834abbf002aab086bec663c429','2022-08-20 20:02:03'),(32,4,'CLIENTE','d48eaaf1ddbd1f18566bbb8ff03e554f','2022-08-20 21:01:43'),(33,4,'ESTABELECIMENTO','6f25c9f741927e2a27beeb8cadf50bf8','2022-08-21 15:13:02'),(34,4,'CLIENTE','2c1d65f047ebf0de82e964905cda5dba','2022-08-21 15:14:58'),(35,5,'ESTABELECIMENTO','40a88beb02c3450a410f0f4f0df57ace','2023-08-02 02:20:09'),(36,5,'ESTABELECIMENTO','0c6405dcfba475bb8f79b0db2ba362b0','2023-08-02 03:12:02'),(37,6,'ESTABELECIMENTO','e19b55b375222179dccfad6b8f60ec70','2023-08-02 03:16:23'),(38,5,'CLIENTE','aa2f73e6518b049b1ace63fcbb805ba3','2023-08-07 23:08:09'),(39,5,'CLIENTE','ba23d53efea8448254e9ea6ca9e7c9e1','2023-08-12 18:05:36'),(40,7,'ESTABELECIMENTO','b8237bcada9356fd55d32f78b8f1a7e2','2023-08-12 18:17:10'),(41,8,'ESTABELECIMENTO','a815c9ca19f1fe40b80a244947c65d51','2023-08-12 18:24:05'),(42,5,'CLIENTE','dd19b79fce87ab066b320660478cbc99','2023-08-12 18:43:03'),(43,6,'ESTABELECIMENTO','121db85a9f72b5ffc40a35f19fd7f5e7','2023-08-12 18:46:16'),(44,7,'ESTABELECIMENTO','8dc71e328ff06469a17d7962e7f4a467','2023-08-12 18:47:46'),(45,8,'ESTABELECIMENTO','143c1209fa685934fb5910cde56260df','2023-08-12 18:48:27'),(46,5,'CLIENTE','bccfbd4816a16f12f0ba068a6dfc8770','2023-08-12 18:49:19'),(47,5,'CLIENTE','b1b257f1ce45e0e0f610e8c041b22816','2023-08-13 00:57:51'),(48,5,'CLIENTE','74399f8800b711078e86d01e8b6477d3','2023-08-13 19:33:02'),(49,5,'CLIENTE','31ade7879d6d066e61e1f0948b686b3c','2023-08-14 00:58:48'),(50,5,'CLIENTE','f882558c046e4d4b4859ebc1017973d6','2023-08-14 01:15:11'),(51,5,'CLIENTE','92a982bd012887d19e6b983143f798f9','2023-08-14 01:53:13'),(52,5,'CLIENTE','45d40720a3c5300c20da1dd8c3522d97','2023-08-14 03:13:53'),(53,5,'CLIENTE','6bfd29a3838f5803a97bb610e5f65e3d','2023-08-14 03:23:15'),(54,5,'CLIENTE','f439ca6bd6d500c00e7a09476da0d1ab','2023-08-14 21:37:58'),(55,5,'CLIENTE','f40d652fc32de50957a0985390d59a78','2023-08-14 23:47:48'),(56,5,'CLIENTE','d3beeb446f9a9f245beb64300ecb25de','2023-08-15 03:42:47'),(57,5,'CLIENTE','a8f4ce8ac9df90bdb47939db00ed7f34','2023-08-15 03:46:28'),(58,5,'ESTABELECIMENTO','ea28636b58166ec69e03d8dfc2b94c72','2023-08-15 03:50:02'),(59,6,'ESTABELECIMENTO','cd36008f99b1d074ef297a76d34c1468','2023-08-15 03:50:53'),(60,7,'ESTABELECIMENTO','8777e1aaef32aef2ce300600c9967ffb','2023-08-15 03:51:17'),(61,8,'ESTABELECIMENTO','f4fba2504e581d948c6afc15b774417e','2023-08-15 03:51:39'),(62,9,'ESTABELECIMENTO','26197b3336128ab0f7a3bdb36ba85b13','2023-08-15 03:56:51');
/*!40000 ALTER TABLE `api_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `data_nascimento` date NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `sub_google` varchar(50) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (4,'Teste AAAAAA','(75) 88888-8888','2022-08-02','000.000.000-00','teste@teste.com','$2y$10$SHME6Z9lJKWBwivh1NeU.Ov/8Cn9sTU2/QtGyTfYYz/.9ffTbkNf2','','2022-08-13 23:07:50'),(5,'Lipe Teste','(75) 99812-3987','2001-01-01','012.012.012-01','teste@teste4.com','$2y$10$WTKhBbzM5gQS3f/ox5Q5leSgTdtUiqgEdfnmFxwWRnL5mTl5CAagC','','2023-08-07 23:07:52');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias_funcionamento`
--

DROP TABLE IF EXISTS `dias_funcionamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dias_funcionamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia` int(11) NOT NULL,
  `horario_abertura` time NOT NULL,
  `horario_fechamento` time NOT NULL,
  `estabelecimento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias_funcionamento`
--

LOCK TABLES `dias_funcionamento` WRITE;
/*!40000 ALTER TABLE `dias_funcionamento` DISABLE KEYS */;
INSERT INTO `dias_funcionamento` VALUES (7,6,'09:00:00','23:00:00',4),(8,1,'08:00:00','22:00:00',6),(9,0,'08:00:00','22:00:00',6),(10,2,'08:00:00','22:00:00',6),(11,3,'00:00:00','07:00:00',6),(12,5,'08:00:00','22:00:00',6),(13,6,'08:00:00','22:00:00',6),(14,5,'08:00:00','20:00:00',7),(15,6,'10:00:00','19:00:00',7),(16,1,'10:00:00','20:00:00',7),(17,2,'08:00:00','22:00:00',7),(18,1,'08:00:00','22:00:00',8),(19,2,'08:00:00','20:00:00',8),(20,5,'08:00:00','22:00:00',8),(21,6,'10:00:00','19:00:00',8);
/*!40000 ALTER TABLE `dias_funcionamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estabelecimento_id` int(11) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `estado` char(2) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,4,'44032-582','BA','Feira de Santana','Campo Limpo','Rua do Catálogo','2247'),(2,5,'44096-486','BA','Feira de Santana','Aviário','Avenida Deputado Luís Eduardo Magalhães','1'),(3,6,'44002-035','BA','Feira de Santana','Centro','Avenida Senhor dos Passos','10'),(4,7,'44096-486','BA','Feira de Santana','Aviário','Avenida Deputado Luís Eduardo Magalhães','1000'),(5,8,'44002-035','BA','Feira de Santana','Centro','Avenida Senhor dos Passos','500'),(6,9,'44002-035','BA','Feira de Santana','Centro','Avenida Senhor dos Passos','42');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estabelecimento`
--

DROP TABLE IF EXISTS `estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estabelecimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_admin` varchar(50) NOT NULL,
  `telefone_admin` varchar(20) NOT NULL,
  `cpf_admin` varchar(14) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cnpj` varchar(50) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `foto_perfil` text DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estabelecimento`
--

LOCK TABLES `estabelecimento` WRITE;
/*!40000 ALTER TABLE `estabelecimento` DISABLE KEYS */;
INSERT INTO `estabelecimento` VALUES (4,'Nome do admin','(75) 99997-8877','111.111.111-11','teste@email.com','teste123','Nome da barbearia','BARBEARIA','(88) 77777-7777','00.000.0000/0001-00','2023-08-02 02:16:32','dbdbdc0b8505e06936333032373835346136316233.png','ATIVO'),(5,'Phelipe','(75) 99999-1234','012.345.678-90','teste@teste2.com','$2y$10$wCgvH5MGlVkOBWabyGXoX.XLtvrsY86eoz1YM303kFuzJ0ONxLVQ6','Barbearia do Lipe','BARBEARIA','(75) 99999-1234','00.000.001/0100-10','2023-08-15 03:50:38','ac8fffa10a0cfc9036346461663630653666633734.jpg','ATIVO'),(6,'João','(75) 99999-4321','123.654.789-12','teste@teste3.com','$2y$10$mc4OqXjYATBq3Y6m3VoCqOIvO.lj5kJrRQBJ45rVDG6cL9hWAuvPq','Barbearia do João','BARBEARIA','(75) 99999-4321','00.100.001/0100-11','2023-08-15 03:51:02','5bd3568643491e8536346461663632363163343632.jpg','ATIVO'),(7,'Aluno do Ifba','(75) 99999-1244','012.345.678-92','teste@teste5.com','$2y$10$YwY.fpdSE.NqE0xC3YXyMOKaOfDdJ35KOmWP0Q7/28jbcmAioffyC','Barbearia do IFBA','BARBEARIA','(75) 99999-1244','00.000.001/0200-10','2023-08-15 03:51:25','e23c4ca554d9face36346461663633643735326239.jpg','ATIVO'),(8,'Carinha','(75) 99987-1234','012.345.678-44','teste@teste6.com','$2y$10$fpydwF8K2ue0TgYY3WlpMepsbCfR/GNCvSAPgtOcyG2tfeSNWHchG','Barbearia do Carinha','BARBEARIA','(75) 99987-1234','00.000.001/0123-10','2023-08-15 03:51:47','a46f2e9f003052dc36346461663635336536666539.jpg','ATIVO'),(9,'Rabelo','(75) 91987-1234','021.345.678-90','teste@teste7.com','$2y$10$JBjNDrOpUA0EKSceJc6uLeJKWKmUa7q2LBvx7mLIBxlqj0WMlSbaK','Barbearia Nota10','BARBEARIA','(75) 91987-1234','00.012.001/0100-10','2023-08-15 03:57:36','74259adcfce7a12136346461663762306338653565.png','ATIVO');
/*!40000 ALTER TABLE `estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estabelecimento_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `valor` float NOT NULL,
  `estabelecimento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (3,'Corte de cabelo',13,4),(4,'Barba',5,4);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-15  0:59:11
