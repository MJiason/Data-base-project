-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: data_management_system
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `WDI-2019`
--

DROP TABLE IF EXISTS `WDI-2019`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WDI-2019` (
  `ISO` varchar(3) NOT NULL,
  `GDP` int(11) NOT NULL,
  `import` int(11) NOT NULL,
  `export` int(11) NOT NULL,
  PRIMARY KEY (`ISO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WDI-2019`
--

LOCK TABLES `WDI-2019` WRITE;
/*!40000 ALTER TABLE `WDI-2019` DISABLE KEYS */;
INSERT INTO `WDI-2019` VALUES ('AUS',416,13800,14190),('CHN',2127,1437000,2011000),('ENG',2629,310700,412100),('FRC',2856,600700,549900),('GNA',673,23000,15000),('JPN',4872,636800,765200),('RUS',1587,197300,337800),('SCT',245,12120,12430),('SPN',435,14200,35100),('UKR',112,62947,59195),('USA',2040,221000,1560000);
/*!40000 ALTER TABLE `WDI-2019` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assoc`
--

DROP TABLE IF EXISTS `assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assoc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL,
  `datapoint_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_assoc_concept1_idx` (`concept_id`),
  KEY `fk_assoc_datapoint1_idx` (`datapoint_id`),
  CONSTRAINT `fk_assoc_concept1` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`id`),
  CONSTRAINT `fk_assoc_datapoint1` FOREIGN KEY (`datapoint_id`) REFERENCES `datapoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assoc`
--

LOCK TABLES `assoc` WRITE;
/*!40000 ALTER TABLE `assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car-2019`
--

DROP TABLE IF EXISTS `car-2019`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car-2019` (
  `car firm` varchar(255) NOT NULL,
  `numerous selled` int(11) NOT NULL,
  PRIMARY KEY (`car firm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car-2019`
--

LOCK TABLES `car-2019` WRITE;
/*!40000 ALTER TABLE `car-2019` DISABLE KEYS */;
INSERT INTO `car-2019` VALUES ('Audi',130000),('Bentley',1200),('BMW',120000),('Chery',100000),('Dacia',200),('Dodge',1100),('Ferrari',2350),('Honda',35000),('Lada',1000),('Lexus',50000),('Mazda',21000),('Mitsubishi',19000),('Opel',26000),('Peugeot',15000),('Porshe',1200),('Renault',3000),('Skoda',9500),('Tesla',52000),('Toyota',15000),('VolksWagen',15000);
/*!40000 ALTER TABLE `car-2019` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept`
--

DROP TABLE IF EXISTS `concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `abbr` varchar(255) NOT NULL,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept`
--

LOCK TABLES `concept` WRITE;
/*!40000 ALTER TABLE `concept` DISABLE KEYS */;
INSERT INTO `concept` VALUES (1,'import','IMP','import of goods, works, services'),(2,'export','EXP','export abroad of goods sold to a foreign buyer or intended for sale in a foreign market.'),(3,'Gross Domestic Product','GDP','indicator reflecting the market value of all final goods and services'),(4,'sales in the country','SIC','number of cars sold'),(5,'population stat','PPS','country statistics');
/*!40000 ALTER TABLE `concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `geolocation` varchar(45) NOT NULL,
  `ISO` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Entity example';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Ukraine','Europe','UKR'),(2,'Russia','Europe and Asia','RUS'),(3,'USA','America','USA'),(4,'England','Europe','ENG'),(5,'Scotland','Europe','SCT'),(6,'Austria','Europe','AUS'),(7,'Guinea','Africa','GNA'),(8,'Spain','Europe','SPN'),(9,'China','Asia','CHN'),(10,'Japan','Asia','JPN'),(11,'France','Europe','FRC');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datapoint`
--

DROP TABLE IF EXISTS `datapoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datapoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_datapoint_entity_idx` (`entity_id`),
  CONSTRAINT `fk_datapoint_entity` FOREIGN KEY (`entity_id`) REFERENCES `entity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datapoint`
--

LOCK TABLES `datapoint` WRITE;
/*!40000 ALTER TABLE `datapoint` DISABLE KEYS */;
INSERT INTO `datapoint` VALUES (1,'WDI','WDI-2019',1),(2,'car','car-2019',2),(3,'population stat','population stat',3);
/*!40000 ALTER TABLE `datapoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity`
--

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` VALUES (1,'country','country'),(2,'car','car'),(3,'populapion stat','populapion stat');
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `includes`
--

DROP TABLE IF EXISTS `includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `includes` (
  `id` int(11) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `datapoint_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_includes_concept1_idx` (`concept_id`),
  KEY `fk_includes_datapoint_idx` (`datapoint_id`),
  CONSTRAINT `fk_includes_concept1` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`id`),
  CONSTRAINT `fk_includes_datapoint` FOREIGN KEY (`datapoint_id`) REFERENCES `datapoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `includes`
--

LOCK TABLES `includes` WRITE;
/*!40000 ALTER TABLE `includes` DISABLE KEYS */;
INSERT INTO `includes` VALUES (1,'import',1,1),(2,'export',2,1),(3,'Gross Domestic Product',3,1),(4,'car',4,2),(5,'populapion stat',5,3);
/*!40000 ALTER TABLE `includes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `populapion stat`
--

DROP TABLE IF EXISTS `populapion stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `populapion stat` (
  `country ISO` varchar(255) NOT NULL,
  `square` int(11) NOT NULL,
  `population` int(11) NOT NULL,
  `fresh water supplies` int(11) NOT NULL,
  PRIMARY KEY (`country ISO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `populapion stat`
--

LOCK TABLES `populapion stat` WRITE;
/*!40000 ALTER TABLE `populapion stat` DISABLE KEYS */;
INSERT INTO `populapion stat` VALUES ('AUS',83800,8,77),('CHN',9595900,1313,2840),('FRC',547000,62,211),('GNA',462000,10,840),('JPN',377800,127,430),('RUS',17098246,142,4508),('SCT',78700,45,170),('UKR',603000,35,139);
/*!40000 ALTER TABLE `populapion stat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-16 23:12:29
