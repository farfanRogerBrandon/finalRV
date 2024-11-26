-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: fabalmacenes
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `aircraftID` int NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `aircraftTypeID` int NOT NULL,
  `tailNumber` varchar(50) NOT NULL,
  `serialNumber` varchar(50) NOT NULL,
  `manufactureDate` date NOT NULL,
  `flightDuration` decimal(10,2) NOT NULL DEFAULT '0.00',
  `flightHours` decimal(10,2) NOT NULL DEFAULT '0.00',
  `definedWeight` decimal(10,2) NOT NULL,
  `emptyWeight` decimal(10,2) NOT NULL,
  `maximumWeight` decimal(10,2) NOT NULL,
  `engineModel` varchar(100) NOT NULL,
  `aircraftOrigin` varchar(100) NOT NULL,
  `stateAircraft` varchar(50) NOT NULL,
  `maintenanceHours` decimal(10,2) NOT NULL DEFAULT '0.00',
  `passengerNumber` int NOT NULL,
  `fuelCapacity` int NOT NULL,
  `imageID_performance` int NOT NULL,
  `operationalStatus` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`aircraftID`),
  KEY `aircraftTypeID` (`aircraftTypeID`),
  KEY `aircraft_performance_image` (`imageID_performance`),
  CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`aircraftTypeID`) REFERENCES `aircraft_type` (`typeID`),
  CONSTRAINT `aircraft_performance_image` FOREIGN KEY (`imageID_performance`) REFERENCES `image` (`imageID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'Boeing','747',1,'N12345','SN001','2010-05-15',1000.50,8000.75,400000.00,200000.00,450000.00,'GE CF6','USA','Operational',500.00,400,183000,1,1,'2024-10-09 19:06:44','2024-10-09 19:06:44',1),(2,'Airbus','A320',1,'N54321','SN002','2015-06-20',500.25,4000.60,250000.00,100000.00,275000.00,'CFM56','France','Operational',300.00,150,24210,2,1,'2024-10-09 19:06:44','2024-10-09 19:06:44',1),(3,'Gulfstream','G650',2,'N98765','SN003','2018-03-22',200.50,1500.30,90000.00,45000.00,99000.00,'Rolls-Royce BR725','USA','Operational',150.00,20,4410,3,1,'2024-10-09 19:06:44','2024-10-09 19:06:44',1),(4,'Cessna','Citation X',2,'N24680','SN004','2016-10-11',100.50,800.75,75000.00,35000.00,78000.00,'Rolls-Royce AE3007C','USA','Operational',120.00,12,3500,4,1,'2024-10-09 19:06:44','2024-10-09 19:06:44',1),(5,'Lockheed Martin','F-22 Raptor',4,'AF001','SN005','2012-07-10',300.75,2000.90,40000.00,20000.00,45000.00,'Pratt & Whitney F119','USA','Operational',200.00,1,1800,5,1,'2024-10-09 19:06:44','2024-10-09 19:06:44',1),(6,'Sikorsky','UH-60 Black Hawk',5,'H12345','SN006','2005-01-05',600.40,5000.30,25000.00,12000.00,26000.00,'GE T700','USA','Operational',350.00,14,1000,6,1,'2024-10-09 19:06:44','2024-10-09 19:06:44',1),(7,'DJI','Phantom 4',7,'D001','SN007','2020-09-15',10.25,50.10,1.38,0.75,2.00,'DJI Brushless','China','Operational',5.00,0,0,7,1,'2024-10-09 19:06:44','2024-10-09 19:06:44',1);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft_images`
--

DROP TABLE IF EXISTS `aircraft_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_images` (
  `imageID` int NOT NULL,
  `aircraftID` int NOT NULL,
  KEY `imageID` (`imageID`),
  KEY `aircraftID` (`aircraftID`),
  CONSTRAINT `aircraft_images_ibfk_1` FOREIGN KEY (`imageID`) REFERENCES `image` (`imageID`),
  CONSTRAINT `aircraft_images_ibfk_2` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft_images`
--

LOCK TABLES `aircraft_images` WRITE;
/*!40000 ALTER TABLE `aircraft_images` DISABLE KEYS */;
INSERT INTO `aircraft_images` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7);
/*!40000 ALTER TABLE `aircraft_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft_performance_data`
--

DROP TABLE IF EXISTS `aircraft_performance_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_performance_data` (
  `performanceDataID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `grossWeight` int NOT NULL,
  `temperature` int NOT NULL,
  `groundEffect` tinyint(1) DEFAULT NULL,
  `altitude` int DEFAULT NULL,
  `availableWeight` int DEFAULT NULL,
  `hoGe` int DEFAULT NULL,
  `performanceImageID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `operationID` int DEFAULT NULL,
  PRIMARY KEY (`performanceDataID`),
  KEY `aircraftID` (`aircraftID`),
  KEY `operationID` (`operationID`),
  KEY `aircraftperformance_image_3` (`performanceImageID`),
  CONSTRAINT `aircraft_performance_data_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `aircraft_performance_data_ibfk_2` FOREIGN KEY (`operationID`) REFERENCES `operation` (`operationID`),
  CONSTRAINT `aircraftperformance_image_3` FOREIGN KEY (`performanceImageID`) REFERENCES `image` (`imageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft_performance_data`
--

LOCK TABLES `aircraft_performance_data` WRITE;
/*!40000 ALTER TABLE `aircraft_performance_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraft_performance_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft_requirement`
--

DROP TABLE IF EXISTS `aircraft_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_requirement` (
  `requirementID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `missionTypeID` int NOT NULL,
  `flightDate` date NOT NULL,
  `platformTime` time DEFAULT NULL,
  `takeoffTime` time DEFAULT NULL,
  `requiredHours` time DEFAULT NULL,
  `fuelQuantity` int DEFAULT NULL,
  `missionEquipment` varchar(255) DEFAULT NULL,
  `refuelingNeeded` tinyint(1) DEFAULT NULL,
  `assignedTechnicians` text,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `operationID` int DEFAULT NULL,
  PRIMARY KEY (`requirementID`),
  KEY `aircraftID` (`aircraftID`),
  KEY `missionTypeID` (`missionTypeID`),
  KEY `operationID` (`operationID`),
  CONSTRAINT `aircraft_requirement_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `aircraft_requirement_ibfk_2` FOREIGN KEY (`missionTypeID`) REFERENCES `mission_type` (`missionTypeID`),
  CONSTRAINT `aircraft_requirement_ibfk_3` FOREIGN KEY (`operationID`) REFERENCES `operation` (`operationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft_requirement`
--

LOCK TABLES `aircraft_requirement` WRITE;
/*!40000 ALTER TABLE `aircraft_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraft_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft_type`
--

DROP TABLE IF EXISTS `aircraft_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_type` (
  `typeID` int NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) NOT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft_type`
--

LOCK TABLES `aircraft_type` WRITE;
/*!40000 ALTER TABLE `aircraft_type` DISABLE KEYS */;
INSERT INTO `aircraft_type` VALUES (1,'Commercial Jet'),(2,'Private Jet'),(3,'Cargo Aircraft'),(4,'Military Fighter'),(5,'Helicopter'),(6,'Glider'),(7,'Drone');
/*!40000 ALTER TABLE `aircraft_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `alertID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `description` text,
  `priority` int DEFAULT NULL,
  `readerUserID` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`alertID`),
  KEY `aircraftID` (`aircraftID`),
  KEY `alert_ibfk_2` (`readerUserID`),
  CONSTRAINT `alert_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `alert_ibfk_2` FOREIGN KEY (`readerUserID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_order`
--

DROP TABLE IF EXISTS `buy_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_order` (
  `buyOrderID` int NOT NULL AUTO_INCREMENT,
  `code` varchar(80) NOT NULL,
  `storageID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`buyOrderID`),
  KEY `buyorder_1` (`storageID`),
  CONSTRAINT `buyorder_1` FOREIGN KEY (`storageID`) REFERENCES `storage` (`storageID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_order`
--

LOCK TABLES `buy_order` WRITE;
/*!40000 ALTER TABLE `buy_order` DISABLE KEYS */;
INSERT INTO `buy_order` VALUES (1,'BO-001',1,2,'2024-10-10 09:44:01',NULL,1),(2,'BO-002',2,2,'2024-10-10 09:44:01',NULL,2),(3,'BO-003',3,2,'2024-10-10 09:44:01',NULL,3),(4,'BO-004',4,2,'2024-10-10 09:44:01',NULL,4),(5,'BO-005',5,2,'2024-10-10 09:44:01',NULL,5),(6,'BO-006',6,2,'2024-10-10 09:44:01',NULL,6),(7,'BO-007',7,2,'2024-10-10 09:44:01',NULL,7),(8,'BO-001',1,2,'2024-10-10 10:08:11',NULL,1),(9,'BO-002',2,2,'2024-10-10 10:08:11',NULL,2),(10,'BO-003',3,2,'2024-10-10 10:08:11',NULL,3),(11,'BO-004',4,2,'2024-10-10 10:08:11',NULL,4),(12,'BO-005',5,2,'2024-10-10 10:08:11',NULL,5),(13,'BO-006',6,2,'2024-10-10 10:08:11',NULL,6),(14,'BO-007',7,2,'2024-10-10 10:08:11',NULL,7),(15,'998717',1,2,'2024-10-02 04:00:00',NULL,1),(16,'899881',1,2,'2024-10-29 22:28:16',NULL,1),(19,'87765',1,2,'2024-10-30 03:27:00',NULL,1),(20,'bubuu',1,2,'2024-10-30 04:04:37',NULL,1),(21,'CINTHIA-88',1,2,'2024-11-03 01:17:54',NULL,1),(22,'PN777-002',1,2,'2024-11-20 00:07:21',NULL,1),(23,'HOLANNNN',1,2,'2024-11-20 00:48:35',NULL,1),(24,'PRUEBA-DEF',1,2,'2024-11-20 13:01:37',NULL,1);
/*!40000 ALTER TABLE `buy_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyorderdetails`
--

DROP TABLE IF EXISTS `buyorderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyorderdetails` (
  `buyOrderID` int NOT NULL,
  `itemID` int NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`buyOrderID`,`itemID`),
  KEY `fk_buy_order_has_item_item1_idx` (`itemID`),
  KEY `fk_buy_order_has_item_buy_order1_idx` (`buyOrderID`),
  CONSTRAINT `fk_buy_order_has_item_buy_order1` FOREIGN KEY (`buyOrderID`) REFERENCES `buy_order` (`buyOrderID`),
  CONSTRAINT `fk_buy_order_has_item_item1` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyorderdetails`
--

LOCK TABLES `buyorderdetails` WRITE;
/*!40000 ALTER TABLE `buyorderdetails` DISABLE KEYS */;
INSERT INTO `buyorderdetails` VALUES (1,1,10.00,1,'2024-10-10 10:54:35','2024-10-10 10:54:35',1),(2,2,20.50,1,'2024-10-10 10:54:35','2024-10-10 10:54:35',2),(2,3,6.00,1,'2024-10-23 11:41:53',NULL,1),(2,4,3.00,1,'2024-10-23 11:42:02',NULL,1),(2,5,9.00,1,'2024-10-23 11:42:13',NULL,1),(3,3,15.75,1,'2024-10-10 10:54:35','2024-10-10 10:54:35',3),(4,4,30.00,1,'2024-10-10 10:54:35','2024-10-10 10:54:35',4),(5,5,50.00,1,'2024-10-10 10:54:35','2024-10-10 10:54:35',5),(6,6,25.00,1,'2024-10-10 10:54:35','2024-10-10 10:54:35',6),(7,7,100.00,1,'2024-10-10 10:54:35','2024-10-10 10:54:35',7),(12,1,2.00,1,'2024-10-10 04:00:00',NULL,1),(16,2,10.00,1,'2024-10-29 22:28:16',NULL,1),(19,1,433.00,1,'2024-10-30 03:27:00',NULL,1),(19,6,88.00,1,'2024-10-30 03:27:00',NULL,1),(20,1,99.00,1,'2024-10-30 04:04:37',NULL,1),(21,2,69.00,1,'2024-11-03 01:17:54',NULL,1),(21,4,96.00,1,'2024-11-03 01:17:54',NULL,1),(22,1,1.00,1,'2024-11-20 00:07:21',NULL,1),(22,4,15.00,1,'2024-11-20 00:07:21',NULL,1),(22,5,1.00,1,'2024-11-20 00:07:21',NULL,1),(23,2,12.00,1,'2024-11-20 00:48:35',NULL,1),(24,1,3.00,1,'2024-11-20 13:01:37',NULL,1),(24,2,5.00,1,'2024-11-20 13:01:37',NULL,1),(24,3,2.00,1,'2024-11-20 13:01:37',NULL,1);
/*!40000 ALTER TABLE `buyorderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calibrationhistory`
--

DROP TABLE IF EXISTS `calibrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calibrationhistory` (
  `calibrationHistoryID` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `toolID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`calibrationHistoryID`),
  KEY `fk_calibration_tool1_idx` (`toolID`),
  CONSTRAINT `fk_calibration_tool1` FOREIGN KEY (`toolID`) REFERENCES `tool` (`toolID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calibrationhistory`
--

LOCK TABLES `calibrationhistory` WRITE;
/*!40000 ALTER TABLE `calibrationhistory` DISABLE KEYS */;
INSERT INTO `calibrationhistory` VALUES (1,'2024-11-15',1,1,'2024-11-15 03:27:18',NULL,1);
/*!40000 ALTER TABLE `calibrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Fusilages'),(2,'Categoria 1'),(3,'Categoria 2'),(4,'Categoria 3'),(5,'Categoria 4'),(6,'Categoria 5'),(7,'Categoria 6'),(8,'Categoria 7');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `componentID` int NOT NULL AUTO_INCREMENT,
  `partNumber` varchar(45) NOT NULL,
  `serialNumber` varchar(45) DEFAULT NULL,
  `unitPrice` decimal(7,2) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `aircraftID` int DEFAULT NULL,
  `buyOrderID` int DEFAULT NULL,
  `itemID` int NOT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`componentID`),
  KEY `aircraftID` (`aircraftID`),
  KEY `fk_component_buy_order1_idx` (`buyOrderID`),
  KEY `fk_component_itemID` (`itemID`),
  CONSTRAINT `component_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `fk_component_buy_order1` FOREIGN KEY (`buyOrderID`) REFERENCES `buy_order` (`buyOrderID`),
  CONSTRAINT `fk_component_itemID` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES (1,'PN-001','SN-001',150.00,'1-2-A-3',2,'2024-10-10 09:47:51','2024-11-13 17:48:21',NULL,1,1,1),(2,'PN-002','SN-002',200.00,'1-2-A-3',2,'2024-10-10 09:47:51',NULL,NULL,2,2,2),(3,'PN-003','SN-003',250.00,'1-2-A-3',2,'2024-10-10 09:47:51','2024-11-20 03:30:28',NULL,3,3,3),(4,'PN-004','SN-004',300.00,'1-2-A-3',2,'2024-10-10 09:47:51',NULL,NULL,4,4,4),(5,'PN-005','SN-005',350.00,'1-2-A-3',1,'2024-10-10 09:47:51',NULL,NULL,5,5,5),(6,'PN-006','SN-006',400.00,'1-2-A-3',1,'2024-10-10 09:47:51',NULL,NULL,6,6,6),(7,'PN-007','SN-007',450.00,'1-2-A-3',2,'2024-10-10 09:47:51','2024-11-20 03:30:28',NULL,7,7,7),(8,'PN-001','SN-001',150.00,'1-2-A-3',2,'2024-10-10 09:51:13','2024-11-20 03:30:28',1,1,1,1),(9,'PN-002','SN-002',200.00,'1-2-A-3',2,'2024-10-10 09:51:13',NULL,2,2,2,2),(10,'PN-003','SN-003',250.00,'1-2-A-3',2,'2024-10-10 09:51:13','2024-11-20 03:30:28',3,3,3,3),(11,'PN-004','SN-004',300.00,'1-2-A-3',2,'2024-10-10 09:51:13',NULL,4,4,4,4),(12,'PN-005','SN-005',350.00,'1-2-A-3',1,'2024-10-10 09:51:13',NULL,5,5,5,5),(13,'PN-006','SN-006',400.00,'1-2-A-3',1,'2024-10-10 09:51:13',NULL,6,6,6,6),(14,'PN-007','SN-007',450.00,'1-2-A-3',2,'2024-10-10 09:51:13','2024-11-20 03:30:28',7,7,7,7),(15,'111','SN-00',11.00,'1-2-A-3',2,'2024-10-20 18:47:23','2024-11-20 03:51:37',1,1,1,1),(16,'123HOLA','123HOLA',12.00,'1-2-A-3',2,'2024-10-20 19:20:27','2024-11-20 03:49:34',1,1,1,1),(17,'1234HOLA','1234HOLA',124.00,'1-2-A-3',2,'2024-10-20 19:20:27',NULL,1,1,2,1),(21,'2134','1222',1.00,'2-2-2-HE',2,'2024-10-27 21:35:36',NULL,1,2,4,1),(22,'2134','KKIEJS',1.00,'2-2-7-N',2,'2024-10-27 21:35:36',NULL,1,2,4,1),(23,'2134','99882',1.00,'1-N-1-K',2,'2024-10-27 21:35:36',NULL,1,2,4,1),(24,'2134','1222',1.00,'2-2-2-HE',2,'2024-10-27 21:36:06',NULL,1,2,4,1),(25,'2134','KKIEJS',1.00,'2-2-7-N',2,'2024-10-27 21:36:06',NULL,1,2,4,1),(26,'2134','99882',1.00,'1-N-1-K',2,'2024-10-27 21:36:06',NULL,1,2,4,1),(27,'2134','1222',1.00,'2-2-2-HE',2,'2024-10-27 21:36:43',NULL,1,2,4,1),(28,'2134','KKIEJS',1.00,'2-2-7-N',2,'2024-10-27 21:36:43',NULL,1,2,4,1),(29,'2134','99882',1.00,'1-N-1-K',2,'2024-10-27 21:36:43',NULL,1,2,4,1),(30,'2134','1222',1.00,'2-2-2-HE',2,'2024-10-27 21:40:05',NULL,1,2,4,1),(31,'2134','KKIEJS',1.00,'2-2-7-N',2,'2024-10-27 21:40:05',NULL,1,2,4,1),(32,'2134','99882',1.00,'1-N-1-K',2,'2024-10-27 21:40:05',NULL,1,2,4,1),(33,'2134','1222',1.00,'2-2-2-HE',2,'2024-10-27 21:40:43',NULL,1,2,4,1),(34,'2134','KKIEJS',1.00,'2-2-7-N',2,'2024-10-27 21:40:43',NULL,1,2,4,1),(35,'2134','99882',1.00,'1-N-1-K',2,'2024-10-27 21:40:43',NULL,1,2,4,1),(36,'2134','1222',1.00,'2-2-2-HE',2,'2024-10-27 21:41:56',NULL,1,2,4,1),(37,'2134','KKIEJS',1.00,'2-2-7-N',2,'2024-10-27 21:41:56',NULL,1,2,4,1),(38,'2134','99882',1.00,'1-N-1-K',2,'2024-10-27 21:41:56',NULL,1,2,4,1),(39,'212121','1',12.00,'1-1-2-3',2,'2024-10-27 21:43:02','2024-11-13 17:48:21',1,2,3,1),(40,'212121','2',12.00,'1-3-4-5',2,'2024-10-27 21:43:02','2024-11-13 17:48:21',1,2,3,1),(41,'212121','3',12.00,'1-4-5-6',2,'2024-10-27 21:43:02','2024-11-13 17:48:21',1,2,3,1),(42,'212121','5',12.00,'1-5-6-7',2,'2024-10-27 21:43:02','2024-11-13 17:48:21',1,2,3,1),(43,'212121','7',12.00,'1-7-8-7',1,'2024-10-27 21:43:02',NULL,1,2,3,1),(44,'212121','9',12.00,'1-8-7-6',2,'2024-10-27 21:43:02','2024-11-20 13:12:49',1,2,3,1),(45,'1234','12',1234.00,'1-1-1-1',2,'2024-11-19 22:37:54','2024-11-20 13:12:49',1,2,3,1),(46,'1234','2',1234.00,'1-A-4-A',2,'2024-11-19 22:37:54','2024-11-20 13:12:49',1,2,3,1),(47,'1234','12',1234.00,'2-12-12-12',2,'2024-11-19 22:37:54','2024-11-20 13:12:49',1,2,3,1),(48,'1234','3',1234.00,'2-3-3-3',1,'2024-11-19 22:37:54',NULL,1,2,3,1),(49,'1234','4',1234.00,'2-4-4-4',1,'2024-11-19 22:37:54',NULL,1,2,3,1),(50,'1234','12',1234.00,'2-5-5-5',1,'2024-11-19 22:37:54',NULL,1,2,3,1),(51,'123','1',123.00,'1-1-1-1',1,'2024-11-19 22:56:09',NULL,1,2,5,1),(52,'123','1',123.00,'1-1-1-1',1,'2024-11-19 22:56:09',NULL,1,2,5,1),(53,'123','1',123.00,'1-1-1-1',1,'2024-11-19 22:56:09',NULL,1,2,5,1),(54,'123','2',123.00,'1-2-2-2',1,'2024-11-19 22:56:09',NULL,1,2,5,1),(55,'123','1',123.00,'1-1-1-1',1,'2024-11-19 22:56:09',NULL,1,2,5,1),(56,'123','1',123.00,'1-1-1-1',1,'2024-11-19 22:56:09',NULL,1,2,5,1),(57,'123','1',123.00,'1-1-1-1',1,'2024-11-19 22:56:09',NULL,1,2,5,1),(58,'123','1',123.00,'1-1-1-1',1,'2024-11-19 22:56:09',NULL,1,2,5,1),(59,'123','1',123.00,'1-1-1-1',1,'2024-11-19 22:56:09',NULL,1,2,5,1),(60,'123_ABC','765671',12.00,'1-1-1-A',2,'2024-11-20 00:28:28','2024-11-20 03:51:37',1,22,1,1),(61,'8976','ABA',14.00,'1-1-1-1',1,'2024-11-20 00:34:19',NULL,1,22,5,1),(62,'NRO-PRUEBA-29','CO-HHH',12.00,'1-1-1-H',1,'2024-11-20 13:07:05',NULL,1,24,3,1),(63,'NRO-PRUEBA-29','CO-BBBB',12.00,'1-1-3-V',1,'2024-11-20 13:07:05',NULL,1,24,3,1);
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component_control`
--

DROP TABLE IF EXISTS `component_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component_control` (
  `controlID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `componentID` int NOT NULL,
  `typeComponent` varchar(50) NOT NULL,
  `typeService` varchar(50) NOT NULL,
  `installationDate` date NOT NULL,
  `limit` varchar(50) NOT NULL,
  `margin` varchar(50) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `remaining` varchar(50) NOT NULL,
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` int NOT NULL,
  PRIMARY KEY (`controlID`),
  KEY `aircraftID_idx` (`aircraftID`),
  KEY `componentID_idx` (`componentID`),
  KEY `component_control_ibfk_3` (`userID`),
  CONSTRAINT `component_control_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `component_control_ibfk_2` FOREIGN KEY (`componentID`) REFERENCES `component` (`componentID`),
  CONSTRAINT `component_control_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_control`
--

LOCK TABLES `component_control` WRITE;
/*!40000 ALTER TABLE `component_control` DISABLE KEYS */;
INSERT INTO `component_control` VALUES (1,1,1,'Engine','Routine','2023-01-10','5000 hours','500 hours',1,'4500 hours','2024-10-10 10:58:17','2024-10-10 10:58:17',1),(3,3,3,'Landing Gear','Overhaul','2022-11-01','3000 hours','300 hours',1,'2700 hours','2024-10-10 10:58:17','2024-10-10 10:58:17',3),(4,4,4,'Avionics','Upgrade','2024-02-20','7000 hours','700 hours',1,'6300 hours','2024-10-10 10:58:17','2024-10-10 10:58:17',4),(5,5,5,'Tail','Repair','2023-09-30','6000 hours','600 hours',1,'5400 hours','2024-10-10 10:58:17','2024-10-10 10:58:17',5);
/*!40000 ALTER TABLE `component_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentID` int NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(80) NOT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Santa Cruz'),(2,'Sucre'),(3,'La Paz'),(4,'Potosi'),(5,'Cochabamba'),(6,'Beni'),(7,'Tarija'),(8,'Santa Cruz'),(9,'Sucre'),(10,'La Paz'),(11,'Potosi'),(12,'Cochabamba'),(13,'Beni'),(14,'Tarija');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exitordedetails`
--

DROP TABLE IF EXISTS `exitordedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exitordedetails` (
  `exitOrderID` int NOT NULL,
  `storageItemID` int NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`exitOrderID`,`storageItemID`),
  KEY `fk_exitOrder_has_storageItem_storageItem1_idx` (`storageItemID`),
  KEY `fk_exitOrder_has_storageItem_exitOrder1_idx` (`exitOrderID`),
  CONSTRAINT `fk_exitOrder_has_storageItem_exitOrder1` FOREIGN KEY (`exitOrderID`) REFERENCES `exitorder` (`exitOrderID`),
  CONSTRAINT `fk_exitOrder_has_storageItem_storageItem1` FOREIGN KEY (`storageItemID`) REFERENCES `storageitem` (`storageItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exitordedetails`
--

LOCK TABLES `exitordedetails` WRITE;
/*!40000 ALTER TABLE `exitordedetails` DISABLE KEYS */;
INSERT INTO `exitordedetails` VALUES (1,1,100.00,1,'2024-10-10 10:51:21','2024-10-10 10:51:21',1),(2,2,200.00,1,'2024-10-10 10:51:21','2024-10-10 10:51:21',2),(3,3,150.00,1,'2024-10-10 10:51:21','2024-10-10 10:51:21',3),(4,4,50.00,1,'2024-10-10 10:51:21','2024-10-10 10:51:21',4),(5,5,75.00,1,'2024-10-10 10:51:21','2024-10-10 10:51:21',5),(6,6,125.00,1,'2024-10-10 10:51:21','2024-10-10 10:51:21',6),(7,7,80.00,1,'2024-10-10 10:51:21','2024-10-10 10:51:21',7),(8,20,2.00,2,'2024-11-13 17:48:21',NULL,1),(14,2,12.00,2,'2024-11-20 04:09:26',NULL,1),(14,17,12.00,2,'2024-11-20 04:09:26',NULL,1),(14,19,12.00,2,'2024-11-20 04:09:26',NULL,1),(14,23,3.20,2,'2024-11-20 04:09:26',NULL,1),(14,25,9.00,2,'2024-11-20 04:09:26',NULL,1),(15,27,4.00,2,'2024-11-20 13:12:49',NULL,1);
/*!40000 ALTER TABLE `exitordedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exitorder`
--

DROP TABLE IF EXISTS `exitorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exitorder` (
  `exitOrderID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(150) NOT NULL,
  `storageID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`exitOrderID`),
  KEY `fk_exitOrder_storage1_idx` (`storageID`),
  CONSTRAINT `fk_exitOrder_storage1` FOREIGN KEY (`storageID`) REFERENCES `storage` (`storageID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exitorder`
--

LOCK TABLES `exitorder` WRITE;
/*!40000 ALTER TABLE `exitorder` DISABLE KEYS */;
INSERT INTO `exitorder` VALUES (1,'Exit Order A',1,1,'2024-10-10 09:57:21',NULL,1),(2,'Exit Order B',2,1,'2024-10-10 09:57:21',NULL,2),(3,'Exit Order C',3,1,'2024-10-10 09:57:21',NULL,3),(4,'Exit Order D',4,1,'2024-10-10 09:57:21',NULL,4),(5,'Exit Order E',5,1,'2024-10-10 09:57:21',NULL,5),(6,'Exit Order F',6,1,'2024-10-10 09:57:21',NULL,6),(7,'Exit Order G',7,1,'2024-10-10 09:57:21',NULL,7),(8,'Revisión del Bueno',1,1,'2024-11-13 21:48:21','2024-11-13 21:48:21',1),(9,'',1,1,'2024-11-20 06:41:57','2024-11-20 06:41:57',1),(10,'111',1,1,'2024-11-20 07:08:09','2024-11-20 07:08:09',1),(11,'',1,1,'2024-11-20 07:30:28','2024-11-20 07:30:28',1),(12,'Esta es una orden de salida',1,1,'2024-11-20 07:49:34','2024-11-20 07:49:34',1),(13,'Mi orden de salida',1,1,'2024-11-20 07:51:37','2024-11-20 07:51:37',1),(14,'12',1,1,'2024-11-20 08:09:27','2024-11-20 08:09:27',1),(15,'SALIDA 7',1,1,'2024-11-20 17:12:49','2024-11-20 17:12:49',1);
/*!40000 ALTER TABLE `exitorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exitordercomponet`
--

DROP TABLE IF EXISTS `exitordercomponet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exitordercomponet` (
  `exitOrderID` int NOT NULL,
  `componentID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`exitOrderID`,`componentID`),
  KEY `fk_exitOrder_has_component_component1_idx` (`componentID`),
  KEY `fk_exitOrder_has_component_exitOrder1_idx` (`exitOrderID`),
  CONSTRAINT `fk_exitOrder_has_component_component1` FOREIGN KEY (`componentID`) REFERENCES `component` (`componentID`),
  CONSTRAINT `fk_exitOrder_has_component_exitOrder1` FOREIGN KEY (`exitOrderID`) REFERENCES `exitorder` (`exitOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exitordercomponet`
--

LOCK TABLES `exitordercomponet` WRITE;
/*!40000 ALTER TABLE `exitordercomponet` DISABLE KEYS */;
INSERT INTO `exitordercomponet` VALUES (1,1,1,'2024-10-10 10:33:00','2024-10-10 10:33:00',1),(2,2,1,'2024-10-10 10:33:00','2024-10-10 10:33:00',2),(3,3,1,'2024-10-10 10:33:00','2024-10-10 10:33:00',3),(4,4,1,'2024-10-10 10:33:00','2024-10-10 10:33:00',4),(5,5,1,'2024-10-10 10:33:00','2024-10-10 10:33:00',5),(6,6,1,'2024-10-10 10:33:00','2024-10-10 10:33:00',6),(7,7,1,'2024-10-10 10:33:00','2024-10-10 10:33:00',7),(8,1,1,'2024-11-13 17:48:21',NULL,1),(8,39,1,'2024-11-13 17:48:21',NULL,1),(8,40,1,'2024-11-13 17:48:21',NULL,1),(8,41,1,'2024-11-13 17:48:21',NULL,1),(8,42,1,'2024-11-13 17:48:21',NULL,1),(11,3,1,'2024-11-20 03:30:28',NULL,1),(11,7,1,'2024-11-20 03:30:28',NULL,1),(11,8,1,'2024-11-20 03:30:28',NULL,1),(11,10,1,'2024-11-20 03:30:28',NULL,1),(11,14,1,'2024-11-20 03:30:28',NULL,1),(12,16,1,'2024-11-20 03:49:34',NULL,1),(13,15,1,'2024-11-20 03:51:37',NULL,1),(13,60,1,'2024-11-20 03:51:37',NULL,1),(15,44,1,'2024-11-20 13:12:49',NULL,1),(15,45,1,'2024-11-20 13:12:49',NULL,1),(15,46,1,'2024-11-20 13:12:49',NULL,1),(15,47,1,'2024-11-20 13:12:49',NULL,1);
/*!40000 ALTER TABLE `exitordercomponet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_crew`
--

DROP TABLE IF EXISTS `flight_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_crew` (
  `flightCrewID` int NOT NULL AUTO_INCREMENT,
  `flightRequestID` int NOT NULL,
  `pilotID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`flightCrewID`),
  KEY `flightRequestID` (`flightRequestID`),
  KEY `pilotID` (`pilotID`),
  CONSTRAINT `flight_crew_ibfk_1` FOREIGN KEY (`flightRequestID`) REFERENCES `flight_request` (`flightRequestID`),
  CONSTRAINT `flight_crew_ibfk_2` FOREIGN KEY (`pilotID`) REFERENCES `pilot` (`pilotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_crew`
--

LOCK TABLES `flight_crew` WRITE;
/*!40000 ALTER TABLE `flight_crew` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_location`
--

DROP TABLE IF EXISTS `flight_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_location` (
  `locationID` int NOT NULL AUTO_INCREMENT,
  `flightRequestID` int NOT NULL,
  `origin` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`locationID`),
  KEY `flightRequestID_idx` (`flightRequestID`),
  CONSTRAINT `flight_location_ibfk_1` FOREIGN KEY (`flightRequestID`) REFERENCES `flight_request` (`flightRequestID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_location`
--

LOCK TABLES `flight_location` WRITE;
/*!40000 ALTER TABLE `flight_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_request`
--

DROP TABLE IF EXISTS `flight_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_request` (
  `flightRequestID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `flightDate` date NOT NULL,
  `departureTime` time DEFAULT NULL,
  `arrivalTime` time DEFAULT NULL,
  `flightType` varchar(50) DEFAULT NULL,
  `missionEquipment` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `operationID` int DEFAULT NULL,
  PRIMARY KEY (`flightRequestID`),
  KEY `aircraftID` (`aircraftID`),
  KEY `operationID` (`operationID`),
  CONSTRAINT `flight_request_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `flight_request_ibfk_2` FOREIGN KEY (`operationID`) REFERENCES `operation` (`operationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_request`
--

LOCK TABLES `flight_request` WRITE;
/*!40000 ALTER TABLE `flight_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupfab`
--

DROP TABLE IF EXISTS `groupfab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupfab` (
  `groupID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `status` tinyint DEFAULT '1',
  `registrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupfab`
--

LOCK TABLES `groupfab` WRITE;
/*!40000 ALTER TABLE `groupfab` DISABLE KEYS */;
INSERT INTO `groupfab` VALUES (3,'grupo 1',' ',1,'2024-10-09 19:14:14','2024-10-09 19:14:14');
/*!40000 ALTER TABLE `groupfab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `imageID` int NOT NULL,
  `route` varchar(200) NOT NULL,
  PRIMARY KEY (`imageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'/images/aircraft1.jpg'),(2,'/images/aircraft2.jpg'),(3,'/images/aircraft3.jpg'),(4,'/images/aircraft4.jpg'),(5,'/images/aircraft5.jpg'),(6,'/images/aircraft6.jpg'),(7,'/images/aircraft7.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `categoryID` int DEFAULT NULL,
  `unitMeasurement` varchar(255) NOT NULL,
  `minimumQuantity` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  KEY `categoryID` (`categoryID`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Component 1',1,'unidad',100,1,'2024-10-10 01:59:45',NULL,1),(2,'ACEiTE V.',2,'l.',200,1,'2024-10-10 01:59:45',NULL,2),(3,'Component 2',1,'unidad',50,1,'2024-10-10 01:59:45',NULL,3),(4,'H20  NV',3,'l.',120,1,'2024-10-10 01:59:45',NULL,4),(5,'Component 3',1,'unidad',180,1,'2024-10-10 01:59:45',NULL,5),(6,'Component 4',1,'unidad',60,1,'2024-10-10 01:59:45',NULL,6),(7,'Component 5',1,'unidad',130,1,'2024-10-10 01:59:45',NULL,7);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kit`
--

DROP TABLE IF EXISTS `kit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kit` (
  `kitID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `storageID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`kitID`),
  KEY `fk_kit_storage1_idx` (`storageID`),
  CONSTRAINT `fk_kit_storage1` FOREIGN KEY (`storageID`) REFERENCES `storage` (`storageID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kit`
--

LOCK TABLES `kit` WRITE;
/*!40000 ALTER TABLE `kit` DISABLE KEYS */;
INSERT INTO `kit` VALUES (1,'Kit A',1,1,'2024-10-10 10:39:13','2024-10-10 10:39:13',1),(2,'Kit B',2,1,'2024-10-10 10:39:13','2024-10-10 10:39:13',2),(3,'Kit C',3,1,'2024-10-10 10:39:13','2024-10-10 10:39:13',3),(4,'Kit D',4,1,'2024-10-10 10:39:13','2024-10-10 10:39:13',4),(5,'Kit E',5,1,'2024-10-10 10:39:13','2024-10-10 10:39:13',5),(6,'Kit F',6,1,'2024-10-10 10:39:13','2024-10-10 10:39:13',6),(7,'Kit G',7,1,'2024-10-10 10:39:13','2024-10-10 10:39:13',7);
/*!40000 ALTER TABLE `kit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalcheck`
--

DROP TABLE IF EXISTS `medicalcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalcheck` (
  `medicalID` int NOT NULL AUTO_INCREMENT,
  `ec_145` varchar(15) DEFAULT NULL,
  `as350_b3` varchar(15) DEFAULT NULL,
  `nextCheck` date DEFAULT NULL,
  `observations` varchar(100) DEFAULT NULL,
  `medicalStatus` varchar(25) DEFAULT NULL,
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `pilotID` int DEFAULT NULL,
  PRIMARY KEY (`medicalID`),
  KEY `pilotID` (`pilotID`),
  CONSTRAINT `medicalcheck_ibfk_1` FOREIGN KEY (`pilotID`) REFERENCES `pilot` (`pilotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalcheck`
--

LOCK TABLES `medicalcheck` WRITE;
/*!40000 ALTER TABLE `medicalcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicalcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `military_rank`
--

DROP TABLE IF EXISTS `military_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `military_rank` (
  `rankID` int NOT NULL AUTO_INCREMENT,
  `rankName` int NOT NULL,
  PRIMARY KEY (`rankID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `military_rank`
--

LOCK TABLES `military_rank` WRITE;
/*!40000 ALTER TABLE `military_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `military_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `militaryperson`
--

DROP TABLE IF EXISTS `militaryperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `militaryperson` (
  `militaryPersonID` int NOT NULL,
  `area` varchar(45) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NOT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`militaryPersonID`),
  CONSTRAINT `fk_SMilitaryPerson_SPerson1` FOREIGN KEY (`militaryPersonID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `militaryperson`
--

LOCK TABLES `militaryperson` WRITE;
/*!40000 ALTER TABLE `militaryperson` DISABLE KEYS */;
/*!40000 ALTER TABLE `militaryperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `militarypersonmilitaryrank`
--

DROP TABLE IF EXISTS `militarypersonmilitaryrank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `militarypersonmilitaryrank` (
  `militaryPersonID` int NOT NULL,
  `militaryRankID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NOT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`militaryPersonID`,`militaryRankID`),
  KEY `fk_SMilitaryPerson_has_SMilitaryRank_SMilitaryRank1_idx` (`militaryRankID`),
  KEY `fk_SMilitaryPerson_has_SMilitaryRank_SMilitaryPerson1_idx` (`militaryPersonID`),
  CONSTRAINT `fk_SMilitaryPerson_has_SMilitaryRank_SMilitaryPerson1` FOREIGN KEY (`militaryPersonID`) REFERENCES `militaryperson` (`militaryPersonID`),
  CONSTRAINT `fk_SMilitaryPerson_has_SMilitaryRank_SMilitaryRank1` FOREIGN KEY (`militaryRankID`) REFERENCES `military_rank` (`rankID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `militarypersonmilitaryrank`
--

LOCK TABLES `militarypersonmilitaryrank` WRITE;
/*!40000 ALTER TABLE `militarypersonmilitaryrank` DISABLE KEYS */;
/*!40000 ALTER TABLE `militarypersonmilitaryrank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_type`
--

DROP TABLE IF EXISTS `mission_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_type` (
  `missionTypeID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`missionTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_type`
--

LOCK TABLES `mission_type` WRITE;
/*!40000 ALTER TABLE `mission_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movement`
--

DROP TABLE IF EXISTS `movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movement` (
  `movementID` int NOT NULL AUTO_INCREMENT,
  `personID` int NOT NULL,
  `storageID` int NOT NULL,
  `type` tinyint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`movementID`),
  KEY `fk_movement_person1_idx` (`personID`),
  KEY `fk_movement_storage1_idx` (`storageID`),
  CONSTRAINT `fk_movement_person1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`),
  CONSTRAINT `fk_movement_storage1` FOREIGN KEY (`storageID`) REFERENCES `storage` (`storageID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movement`
--

LOCK TABLES `movement` WRITE;
/*!40000 ALTER TABLE `movement` DISABLE KEYS */;
INSERT INTO `movement` VALUES (1,1,1,1,1,'2024-11-19 01:22:54',NULL,1);
/*!40000 ALTER TABLE `movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movementdetails`
--

DROP TABLE IF EXISTS `movementdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movementdetails` (
  `movementID` int NOT NULL,
  `toolID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`movementID`,`toolID`),
  KEY `fk_movement_has_tool_tool1_idx` (`toolID`),
  KEY `fk_movement_has_tool_movement1_idx` (`movementID`),
  CONSTRAINT `fk_movement_has_tool_movement1` FOREIGN KEY (`movementID`) REFERENCES `movement` (`movementID`),
  CONSTRAINT `fk_movement_has_tool_tool1` FOREIGN KEY (`toolID`) REFERENCES `tool` (`toolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movementdetails`
--

LOCK TABLES `movementdetails` WRITE;
/*!40000 ALTER TABLE `movementdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `movementdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `operationID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `statusOperation` varchar(50) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`operationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `personID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `birthDate` date NOT NULL,
  `ci` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`personID`),
  UNIQUE KEY `ci` (`ci`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'John','Doe','1990-05-15','1234567890','john.doe@example.com','555-1234',1,'2024-10-09 19:20:13','2024-10-09 19:20:13'),(2,'Jane','Smith','1985-08-23','0987654321','jane.smith@example.com','555-5678',1,'2024-10-09 19:20:13','2024-10-09 19:20:13'),(3,'Alice','Johnson','1992-11-12','1122334455','alice.johnson@example.com','555-8765',1,'2024-10-09 19:20:13','2024-10-09 19:20:13'),(4,'Bob','Brown','1988-02-02','5566778899','bob.brown@example.com','555-4321',1,'2024-10-09 19:20:13','2024-10-09 19:20:13'),(5,'Emily','Davis','1995-07-07','6677889900','emily.davis@example.com','555-6789',1,'2024-10-09 19:20:13','2024-10-09 19:20:13'),(6,'Michael','Wilson','1991-12-31','7788990011','michael.wilson@example.com','555-9876',1,'2024-10-09 19:20:13','2024-10-09 19:20:13'),(7,'Sophia','Martinez','1987-03-21','8899001122','sophia.martinez@example.com','555-5432',1,'2024-10-09 19:20:13','2024-10-09 19:20:13');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot`
--

DROP TABLE IF EXISTS `pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot` (
  `pilotID` int NOT NULL,
  `militaryRankID` int NOT NULL,
  `registrationNumber` varchar(10) NOT NULL,
  `flightHours` int DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pilotID`),
  KEY `militaryRankID` (`militaryRankID`),
  CONSTRAINT `pilot_ibfk_1` FOREIGN KEY (`pilotID`) REFERENCES `person` (`personID`),
  CONSTRAINT `pilot_ibfk_2` FOREIGN KEY (`militaryRankID`) REFERENCES `military_rank` (`rankID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot`
--

LOCK TABLES `pilot` WRITE;
/*!40000 ALTER TABLE `pilot` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilotairshiprolecomponent`
--

DROP TABLE IF EXISTS `pilotairshiprolecomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilotairshiprolecomponent` (
  `pilotID` int NOT NULL,
  `aircraftID` int NOT NULL,
  `pilotFunction` varchar(50) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pilotID`,`aircraftID`),
  KEY `aircraftID` (`aircraftID`),
  CONSTRAINT `pilotairshiprole_ibfk_1` FOREIGN KEY (`pilotID`) REFERENCES `pilot` (`pilotID`),
  CONSTRAINT `pilotairshiprole_ibfk_2` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilotairshiprolecomponent`
--

LOCK TABLES `pilotairshiprolecomponent` WRITE;
/*!40000 ALTER TABLE `pilotairshiprolecomponent` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilotairshiprolecomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reception`
--

DROP TABLE IF EXISTS `reception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reception` (
  `receptionID` int NOT NULL AUTO_INCREMENT,
  `buyOrderID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  PRIMARY KEY (`receptionID`),
  KEY `fk_reception_buy_order1_idx` (`buyOrderID`),
  CONSTRAINT `fk_reception_buy_order1` FOREIGN KEY (`buyOrderID`) REFERENCES `buy_order` (`buyOrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reception`
--

LOCK TABLES `reception` WRITE;
/*!40000 ALTER TABLE `reception` DISABLE KEYS */;
INSERT INTO `reception` VALUES (1,1,1,'2024-10-10 10:45:39','2024-10-10 10:45:39',1),(2,2,1,'2024-10-10 10:45:39','2024-10-10 10:45:39',2),(3,3,1,'2024-10-10 10:45:39','2024-10-10 10:45:39',3),(4,4,1,'2024-10-10 10:45:39','2024-10-10 10:45:39',4),(5,5,1,'2024-10-10 10:45:39','2024-10-10 10:45:39',5),(6,6,1,'2024-10-10 10:45:39','2024-10-10 10:45:39',6),(7,7,1,'2024-10-10 10:45:39','2024-10-10 10:45:39',7),(8,1,2,'2024-10-16 04:00:00',NULL,1),(9,3,1,'2024-10-16 13:28:35',NULL,1),(10,2,0,'2024-10-23 12:47:09',NULL,1),(11,2,0,'2024-10-23 12:59:01',NULL,1),(12,5,0,'2024-10-23 13:06:57',NULL,1),(13,3,1,'2024-10-23 13:14:30',NULL,1),(14,1,1,'2024-10-23 17:23:14',NULL,1),(15,8,1,'2024-10-26 22:23:20',NULL,1),(16,2,1,'2024-10-27 03:10:31',NULL,1),(17,2,1,'2024-10-27 04:38:57',NULL,1),(18,2,1,'2024-10-28 01:42:08',NULL,1),(19,19,1,'2024-10-30 03:29:32',NULL,1),(20,21,1,'2024-11-03 01:21:26',NULL,1),(21,21,1,'2024-11-19 18:55:58',NULL,1),(22,19,1,'2024-11-19 19:50:59',NULL,1),(23,16,1,'2024-11-19 22:10:33',NULL,1),(24,20,1,'2024-11-19 22:12:58',NULL,1),(25,15,1,'2024-11-19 22:14:22',NULL,1),(26,2,1,'2024-11-19 22:36:39',NULL,1),(27,22,1,'2024-11-20 00:27:13',NULL,1),(28,23,1,'2024-11-20 00:48:48',NULL,1),(29,24,1,'2024-11-20 13:04:22',NULL,1);
/*!40000 ALTER TABLE `reception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptiondetails`
--

DROP TABLE IF EXISTS `receptiondetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receptiondetails` (
  `receptionID` int NOT NULL,
  `itemID` int NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  `unitPrice` decimal(10,2) DEFAULT NULL,
  `partNumber` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`receptionID`,`itemID`),
  KEY `fk_reception_has_item_item1_idx` (`itemID`),
  KEY `fk_reception_has_item_reception1_idx` (`receptionID`),
  CONSTRAINT `fk_reception_has_item_item1` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`),
  CONSTRAINT `fk_reception_has_item_reception1` FOREIGN KEY (`receptionID`) REFERENCES `reception` (`receptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptiondetails`
--

LOCK TABLES `receptiondetails` WRITE;
/*!40000 ALTER TABLE `receptiondetails` DISABLE KEYS */;
INSERT INTO `receptiondetails` VALUES (1,1,50.00,2,'2024-10-10 10:48:39','2024-10-10 10:48:39',1,123.00,'YG-G22'),(2,2,30.00,2,'2024-10-10 10:48:39','2024-10-10 10:48:39',2,123.00,'YG-G22'),(3,3,40.00,2,'2024-10-10 10:48:39','2024-10-10 10:48:39',3,123.00,'YG-G22'),(4,4,25.00,2,'2024-10-10 10:48:39','2024-10-10 10:48:39',4,123.00,'YG-G22'),(5,5,60.00,1,'2024-10-10 10:48:39','2024-10-10 10:48:39',5,123.00,'YG-G22'),(6,6,35.00,1,'2024-10-10 10:48:39','2024-10-10 10:48:39',6,123.00,'YG-G22'),(7,7,20.00,1,'2024-10-10 10:48:39','2024-10-10 10:48:39',7,123.00,'YG-G22'),(8,1,2.00,1,'2024-10-16 12:53:37',NULL,1,123.00,'YG-G22'),(9,1,10.00,1,'2024-10-16 13:28:35',NULL,1,123.00,'YG-G22'),(9,3,30.00,1,'2024-10-16 13:28:35',NULL,1,123.00,'YG-G22'),(10,2,20.50,1,'2024-10-23 12:47:09',NULL,1,NULL,NULL),(10,3,6.00,1,'2024-10-23 12:47:09',NULL,1,NULL,NULL),(10,4,3.00,1,'2024-10-23 12:47:09',NULL,1,NULL,NULL),(10,5,9.00,1,'2024-10-23 12:47:09',NULL,1,NULL,NULL),(11,2,20.50,1,'2024-10-23 12:59:01',NULL,1,NULL,NULL),(11,3,6.00,1,'2024-10-23 12:59:01',NULL,1,NULL,NULL),(11,4,3.00,1,'2024-10-23 12:59:01',NULL,1,NULL,NULL),(11,5,9.00,1,'2024-10-23 12:59:01',NULL,1,NULL,NULL),(12,5,50.00,1,'2024-10-23 13:06:57',NULL,1,NULL,NULL),(13,3,15.75,1,'2024-10-23 13:14:30',NULL,1,NULL,NULL),(14,1,10.00,1,'2024-10-23 17:23:14',NULL,1,NULL,NULL),(16,2,20.50,1,'2024-10-27 03:10:31',NULL,1,NULL,NULL),(16,3,6.00,1,'2024-10-27 03:10:31',NULL,1,NULL,NULL),(16,4,3.00,1,'2024-10-27 03:10:31',NULL,1,NULL,NULL),(16,5,9.00,1,'2024-10-27 03:10:31',NULL,1,NULL,NULL),(17,2,20.50,1,'2024-10-27 04:38:57',NULL,1,4.00,'124444fece'),(17,3,6.00,2,'2024-10-27 04:38:57',NULL,1,12.00,'212121'),(17,4,3.00,2,'2024-10-27 04:38:57',NULL,1,1.00,'2134'),(17,5,9.00,1,'2024-10-27 04:38:57',NULL,1,12.00,'21212'),(18,2,20.50,2,'2024-10-28 01:42:08',NULL,1,54.00,'HHEEBB'),(18,3,6.00,1,'2024-10-28 01:42:08',NULL,1,4.00,'BBTTUU'),(18,4,3.00,2,'2024-10-28 01:42:08',NULL,1,9.00,'JJHHAA'),(18,5,9.00,1,'2024-10-28 01:42:08',NULL,1,34.00,'eee'),(19,1,433.00,1,'2024-10-30 03:29:32',NULL,1,9.00,'8787788787'),(19,6,88.00,1,'2024-10-30 03:29:32',NULL,1,12.00,'87643'),(20,2,69.00,2,'2024-11-03 01:21:26',NULL,1,12.00,'CINTHY_99'),(20,4,96.00,2,'2024-11-03 01:21:26',NULL,1,99.00,'CINTHY_98'),(21,2,69.00,1,'2024-11-19 18:55:58',NULL,1,12.10,'GT-JUBT'),(21,4,96.00,1,'2024-11-19 18:55:58',NULL,1,11.00,'GT-IAMEH'),(22,1,433.00,1,'2024-11-19 19:50:59',NULL,1,1.00,'12'),(22,6,88.00,1,'2024-11-19 19:50:59',NULL,1,1.00,'21'),(23,2,10.00,2,'2024-11-19 22:10:33',NULL,1,12.00,'GTY_KENE'),(24,1,99.00,1,'2024-11-19 22:12:58',NULL,1,12.00,'33'),(26,2,20.50,2,'2024-11-19 22:36:39',NULL,1,12345.00,'12345'),(26,3,6.00,2,'2024-11-19 22:36:39',NULL,1,1234.00,'1234'),(26,4,3.00,2,'2024-11-19 22:36:39',NULL,1,1234.00,'123456'),(26,5,9.00,2,'2024-11-19 22:36:39',NULL,1,123.00,'123'),(27,1,1.00,2,'2024-11-20 00:27:13',NULL,1,12.00,'123_ABC'),(27,4,15.00,2,'2024-11-20 00:27:13',NULL,1,11.00,'JHY-LOQ'),(27,5,1.00,2,'2024-11-20 00:27:13',NULL,1,14.00,'8976'),(28,2,12.00,1,'2024-11-20 00:48:48',NULL,1,12.00,'12'),(29,1,3.00,1,'2024-11-20 13:04:22',NULL,1,17.00,'NRO-PRUEBA23'),(29,2,5.00,2,'2024-11-20 13:04:22',NULL,1,12.00,'NRO-PRUEBA-65'),(29,3,2.00,2,'2024-11-20 13:04:22',NULL,1,12.00,'NRO-PRUEBA-29');
/*!40000 ALTER TABLE `receptiondetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_condition_type`
--

DROP TABLE IF EXISTS `risk_condition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_condition_type` (
  `conditionTypeID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`conditionTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_condition_type`
--

LOCK TABLES `risk_condition_type` WRITE;
/*!40000 ALTER TABLE `risk_condition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_condition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_factor`
--

DROP TABLE IF EXISTS `risk_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_factor` (
  `riskFactorID` int NOT NULL AUTO_INCREMENT,
  `factorName` varchar(100) NOT NULL,
  PRIMARY KEY (`riskFactorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_factor`
--

LOCK TABLES `risk_factor` WRITE;
/*!40000 ALTER TABLE `risk_factor` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_factor_option`
--

DROP TABLE IF EXISTS `risk_factor_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_factor_option` (
  `optionID` int NOT NULL AUTO_INCREMENT,
  `riskFactorID` int NOT NULL,
  `optionName` varchar(100) NOT NULL,
  `dayValue` int DEFAULT NULL,
  `nightValue` int DEFAULT NULL,
  `svgValue` int DEFAULT NULL,
  PRIMARY KEY (`optionID`),
  KEY `riskFactorID` (`riskFactorID`),
  CONSTRAINT `risk_factor_option_ibfk_1` FOREIGN KEY (`riskFactorID`) REFERENCES `risk_factor` (`riskFactorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_factor_option`
--

LOCK TABLES `risk_factor_option` WRITE;
/*!40000 ALTER TABLE `risk_factor_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_factor_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_matrix`
--

DROP TABLE IF EXISTS `risk_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_matrix` (
  `riskMatrixID` int NOT NULL AUTO_INCREMENT,
  `flightRequestID` int NOT NULL,
  `conditionTypeID` int NOT NULL,
  `overallRiskScore` int DEFAULT NULL,
  `riskAssessment` text,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  `operationID` int DEFAULT NULL,
  PRIMARY KEY (`riskMatrixID`),
  KEY `flightRequestID` (`flightRequestID`),
  KEY `conditionTypeID` (`conditionTypeID`),
  KEY `operationID` (`operationID`),
  CONSTRAINT `risk_matrix_ibfk_1` FOREIGN KEY (`flightRequestID`) REFERENCES `flight_request` (`flightRequestID`),
  CONSTRAINT `risk_matrix_ibfk_2` FOREIGN KEY (`conditionTypeID`) REFERENCES `risk_condition_type` (`conditionTypeID`),
  CONSTRAINT `risk_matrix_ibfk_3` FOREIGN KEY (`operationID`) REFERENCES `operation` (`operationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_matrix`
--

LOCK TABLES `risk_matrix` WRITE;
/*!40000 ALTER TABLE `risk_matrix` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_matrix_selection`
--

DROP TABLE IF EXISTS `risk_matrix_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_matrix_selection` (
  `selectionID` int NOT NULL AUTO_INCREMENT,
  `riskMatrixID` int NOT NULL,
  `riskFactorOptionID` int NOT NULL,
  `selectedValue` int DEFAULT NULL,
  PRIMARY KEY (`selectionID`),
  KEY `riskMatrixID` (`riskMatrixID`),
  KEY `riskFactorOptionID` (`riskFactorOptionID`),
  CONSTRAINT `risk_matrix_selection_ibfk_1` FOREIGN KEY (`riskMatrixID`) REFERENCES `risk_matrix` (`riskMatrixID`),
  CONSTRAINT `risk_matrix_selection_ibfk_2` FOREIGN KEY (`riskFactorOptionID`) REFERENCES `risk_factor_option` (`optionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_matrix_selection`
--

LOCK TABLES `risk_matrix_selection` WRITE;
/*!40000 ALTER TABLE `risk_matrix_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_matrix_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleuser`
--

DROP TABLE IF EXISTS `roleuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleuser` (
  `roleID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `status` tinyint DEFAULT '1',
  `registrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleuser`
--

LOCK TABLES `roleuser` WRITE;
/*!40000 ALTER TABLE `roleuser` DISABLE KEYS */;
INSERT INTO `roleuser` VALUES (1,'Admin',' ',1,'2024-10-09 19:12:42','2024-10-09 19:12:42');
/*!40000 ALTER TABLE `roleuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `storageID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `departmentID` int NOT NULL,
  `groupFabID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` int NOT NULL,
  PRIMARY KEY (`storageID`),
  KEY `departmentID_idx` (`departmentID`),
  KEY `groupFabID_idx` (`groupFabID`),
  CONSTRAINT `fk_storage_department` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`),
  CONSTRAINT `fk_storage_groupfab` FOREIGN KEY (`groupFabID`) REFERENCES `groupfab` (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (1,'Storage A',1,3,1,'2024-10-10 02:20:58','2024-10-10 02:20:58',1),(2,'Storage B',2,3,1,'2024-10-10 02:20:58','2024-10-10 02:20:58',2),(3,'Storage C',3,3,1,'2024-10-10 02:20:58','2024-10-10 02:20:58',3),(4,'Storage D',1,3,1,'2024-10-10 02:20:58','2024-10-10 02:20:58',4),(5,'Storage E',2,3,1,'2024-10-10 02:20:58','2024-10-10 02:20:58',5),(6,'Storage F',3,3,1,'2024-10-10 02:20:58','2024-10-10 02:20:58',6),(7,'Storage G',1,3,1,'2024-10-10 02:20:58','2024-10-10 02:20:58',7);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storageitem`
--

DROP TABLE IF EXISTS `storageitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storageitem` (
  `storageItemID` int NOT NULL AUTO_INCREMENT,
  `storageID` int NOT NULL,
  `itemID` int NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `partNumber` varchar(45) NOT NULL,
  `expirationDate` date DEFAULT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint DEFAULT NULL,
  `unitPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`storageItemID`),
  KEY `fk_storageItem_storage1_idx` (`storageID`),
  KEY `fk_storageItem_item1_idx` (`itemID`),
  CONSTRAINT `fk_storageItem_item1` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`),
  CONSTRAINT `fk_storageItem_storage1` FOREIGN KEY (`storageID`) REFERENCES `storage` (`storageID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storageitem`
--

LOCK TABLES `storageitem` WRITE;
/*!40000 ALTER TABLE `storageitem` DISABLE KEYS */;
INSERT INTO `storageitem` VALUES (1,1,1,100.00,'PN-001','2024-12-31','A1',1,'2024-10-10 10:03:37',NULL,1,10.00),(2,2,2,188.00,'PN-002','2024-12-31','B2',1,'2024-10-10 10:03:37',NULL,2,10.00),(3,3,3,150.00,'PN-003','2024-12-31','C3',1,'2024-10-10 10:03:37',NULL,3,10.00),(4,4,4,180.00,'PN-004','2024-12-31','A1',1,'2024-10-10 10:03:37',NULL,4,10.00),(5,5,5,220.00,'PN-005','2024-12-31','B2',1,'2024-10-10 10:03:37',NULL,5,10.00),(6,6,6,130.00,'PN-006','2024-12-31','C3',1,'2024-10-10 10:03:37',NULL,6,10.00),(7,7,7,170.00,'PN-007','2024-12-31','A1',1,'2024-10-10 10:03:37',NULL,7,10.00),(8,1,1,100.00,'PN-001','2024-12-31','A1',1,'2024-10-10 10:05:45',NULL,1,10.00),(9,2,2,200.00,'PN-002','2024-12-31','B2',1,'2024-10-10 10:05:45',NULL,2,10.00),(10,3,3,150.00,'PN-003','2024-12-31','C3',1,'2024-10-10 10:05:45',NULL,3,10.00),(11,4,4,180.00,'PN-004','2024-12-31','A1',1,'2024-10-10 10:05:45',NULL,4,10.00),(12,5,5,220.00,'PN-005','2024-12-31','B2',1,'2024-10-10 10:05:45',NULL,5,10.00),(13,6,6,130.00,'PN-006','2024-12-31','C3',1,'2024-10-10 10:05:45',NULL,6,10.00),(14,7,7,170.00,'PN-007','2024-12-31','A1',1,'2024-10-10 10:05:45','2024-10-10 10:05:45',7,10.00),(15,1,1,1.00,'hola','2020-02-02','hola',1,'2024-10-21 03:06:56',NULL,1,10.00),(16,1,1,1.00,'HOLAJEJE','2024-10-21','HOLAJEJE',1,'2024-10-21 03:36:52',NULL,1,10.00),(17,1,2,0.00,'HOLAJEJE2','2024-10-21','HOLAJEJE2',1,'2024-10-21 03:36:52',NULL,1,10.00),(18,1,1,99.00,'string','2024-10-21','string',1,'2024-10-21 04:08:09',NULL,1,1.00),(19,1,2,8.50,'HHEEBB','2024-11-08','1-3-6-S',1,'2024-10-28 03:26:26',NULL,1,14.00),(20,1,4,1.00,'JJHHAA',NULL,'1-9-1-1',1,'2024-10-28 03:26:26',NULL,1,14.00),(21,1,2,69.00,'CINTHY_99','2024-11-23','1-12-9-2',1,'2024-11-03 01:22:11',NULL,1,12.00),(22,1,4,96.00,'CINTHY_98','2024-11-27','1-9-1-1',1,'2024-11-03 01:22:11',NULL,1,99.00),(23,1,2,6.80,'GTY_KENE','2024-11-21','1-1-1-1',1,'2024-11-19 22:25:26',NULL,1,12.00),(24,1,4,3.00,'123456','2024-11-20','1-1-2-1',1,'2024-11-19 22:52:32',NULL,1,1234.00),(25,1,2,11.50,'12345','2024-11-05','1-12-1-12',1,'2024-11-19 22:52:32',NULL,1,12345.00),(26,1,4,15.00,'JHY-LOQ',NULL,'1-1-1-1',1,'2024-11-20 00:33:54',NULL,1,11.00),(27,1,2,1.00,'NRO-PRUEBA-65','2024-11-30','1-1-1-B',1,'2024-11-20 13:09:14',NULL,1,12.00);
/*!40000 ALTER TABLE `storageitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technician`
--

DROP TABLE IF EXISTS `technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technician` (
  `technicianID` int NOT NULL AUTO_INCREMENT,
  `specialty` varchar(40) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`technicianID`),
  CONSTRAINT `tec_person_1` FOREIGN KEY (`technicianID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technician`
--

LOCK TABLES `technician` WRITE;
/*!40000 ALTER TABLE `technician` DISABLE KEYS */;
/*!40000 ALTER TABLE `technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool` (
  `toolID` int NOT NULL AUTO_INCREMENT,
  `itemID` int NOT NULL,
  `storageID` int NOT NULL,
  `kitID` int DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL,
  `nextCalibration` date DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  `userID` smallint NOT NULL,
  `partNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`toolID`),
  KEY `fk_tool_item1_idx` (`itemID`),
  KEY `fk_tool_storage1_idx` (`storageID`),
  KEY `fk_tool_kit1_idx` (`kitID`),
  CONSTRAINT `fk_tool_item1` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`),
  CONSTRAINT `fk_tool_kit1` FOREIGN KEY (`kitID`) REFERENCES `kit` (`kitID`),
  CONSTRAINT `fk_tool_storage1` FOREIGN KEY (`storageID`) REFERENCES `storage` (`storageID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES (1,4,1,1,'A1','2024-11-23',1,'2024-10-10 10:42:19','2024-10-10 10:42:19',1,NULL),(3,4,3,3,'C3','2024-10-30',1,'2024-10-10 10:42:19','2024-10-10 10:42:19',3,NULL),(5,4,5,5,'E5','2024-11-05',1,'2024-10-10 10:42:19','2024-10-10 10:42:19',5,NULL),(6,4,6,6,'F6','2024-12-10',1,'2024-10-10 10:42:19','2024-10-10 10:42:19',6,NULL),(7,4,7,7,'G7','2024-11-25',1,'2024-10-10 10:42:19','2024-10-10 10:42:19',7,NULL),(8,4,1,NULL,' 3- 3- 4','2024-11-17',1,'2024-11-17 04:51:52','2024-11-17 04:51:52',1,'23'),(9,4,1,NULL,' 4- 4- 3','2024-11-17',1,'2024-11-17 04:51:52','2024-11-17 04:51:52',1,'1');
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `registrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `roleID` int DEFAULT NULL,
  `groupID` int DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `email` (`email`),
  KEY `roleID` (`roleID`),
  KEY `groupID` (`groupID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `roleuser` (`roleID`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`groupID`) REFERENCES `groupfab` (`groupID`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'john.doe@example.com','password123',1,'2024-10-09 19:21:02','2024-10-09 19:21:02',1,3),(2,'jane.smith@example.com','password123',1,'2024-10-09 19:21:02','2024-10-09 19:21:02',1,3),(3,'alice.jones@example.com','password123',1,'2024-10-09 19:21:02','2024-10-09 19:21:02',1,3),(4,'michael.brown@example.com','password123',1,'2024-10-09 19:21:02','2024-10-09 19:21:02',1,3),(5,'emily.davis@example.com','password123',1,'2024-10-09 19:21:02','2024-10-09 19:21:02',1,3),(6,'david.wilson@example.com','password123',1,'2024-10-09 19:21:02','2024-10-09 19:21:02',1,3),(7,'sophia.martinez@example.com','password123',1,'2024-10-09 19:21:02','2024-10-09 19:21:02',1,3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_order`
--

DROP TABLE IF EXISTS `work_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_order` (
  `workOrderID` int NOT NULL AUTO_INCREMENT,
  `aircraftID` int NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `assignedTechnicianID` int NOT NULL,
  `workDate` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `registrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`workOrderID`),
  KEY `aircraftID` (`aircraftID`),
  KEY `assignedTechnicianID` (`assignedTechnicianID`),
  CONSTRAINT `work_order_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `work_order_ibfk_2` FOREIGN KEY (`assignedTechnicianID`) REFERENCES `technician` (`technicianID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_order`
--

LOCK TABLES `work_order` WRITE;
/*!40000 ALTER TABLE `work_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20  9:17:26
