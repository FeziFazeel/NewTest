-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: epos
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `catrelation`
--

DROP TABLE IF EXISTS `catrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catrelation` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdCategory` int(11) NOT NULL,
  `IdProduct` int(11) NOT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(55) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `ModifyBy` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catrelation`
--

LOCK TABLES `catrelation` WRITE;
/*!40000 ALTER TABLE `catrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Mobile` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `Company` varchar(45) DEFAULT NULL,
  `CNIC` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `ModifyBy` varchar(45) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lot` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SupplierId` int(11) NOT NULL,
  `ProductId` varchar(20) DEFAULT NULL,
  `LotDate` datetime NOT NULL,
  `LotCreatedDate` datetime NOT NULL,
  `LotCreatedBy` varchar(20) NOT NULL,
  `LotModifyDate` datetime DEFAULT NULL,
  `LotModifyBy` varchar(20) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Remarks` varchar(45) DEFAULT NULL,
  `Serial` int(11) DEFAULT NULL,
  `Code` varchar(45) DEFAULT NULL,
  `LotPrice` decimal(6,2) NOT NULL,
  `Tax` decimal(6,2) NOT NULL,
  `Discount` decimal(6,2) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot`
--

LOCK TABLES `lot` WRITE;
/*!40000 ALTER TABLE `lot` DISABLE KEYS */;
/*!40000 ALTER TABLE `lot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot_lines`
--

DROP TABLE IF EXISTS `lot_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lot_lines` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` float DEFAULT NULL,
  `lotLinePrice` float DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `ModifyBy` varchar(45) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Remarks` varchar(45) DEFAULT NULL,
  `IdLot` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot_lines`
--

LOCK TABLES `lot_lines` WRITE;
/*!40000 ALTER TABLE `lot_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `lot_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenttransaction`
--

DROP TABLE IF EXISTS `paymenttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymenttransaction` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `ModifyBy` varchar(45) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `Amount` decimal(10,0) NOT NULL DEFAULT '0',
  `CustomerID` int(11) DEFAULT NULL,
  `CostCenterID` int(11) NOT NULL,
  `Saleid` int(11) DEFAULT NULL,
  `TransactionDate` datetime DEFAULT NULL,
  `Remarks` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttransaction`
--

LOCK TABLES `paymenttransaction` WRITE;
/*!40000 ALTER TABLE `paymenttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymenttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `Quantity` float NOT NULL,
  `Unit` varchar(45) NOT NULL,
  `Remarks` varchar(700) DEFAULT NULL,
  `Price` decimal(10,4) NOT NULL,
  `Code` varchar(75) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` varchar(75) NOT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `ModifyBy` varchar(75) DEFAULT NULL,
  `IdSupplier` int(11) DEFAULT NULL,
  `minimumstocklevel` int(11) DEFAULT NULL,
  `PackOf` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `idCustomer` int(11) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `ModifyBy` varchar(45) DEFAULT NULL,
  `ReceivedPayment` decimal(6,2) DEFAULT '0.00',
  `IsOnCash` int(11) NOT NULL,
  `SaleDate` datetime NOT NULL,
  `TotalBill` decimal(6,2) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_line`
--

DROP TABLE IF EXISTS `sale_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_line` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProduct` int(11) NOT NULL,
  `Status` varchar(55) NOT NULL,
  `CreateDdate` datetime NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `ModifyBy` varchar(55) DEFAULT NULL,
  `Quantity` float NOT NULL,
  `Unit` varchar(75) DEFAULT NULL,
  `IdCustomer` int(11) DEFAULT NULL,
  `IdOrder` int(11) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `ProductPurchasePrice` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_line`
--

LOCK TABLES `sale_line` WRITE;
/*!40000 ALTER TABLE `sale_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom`
--

DROP TABLE IF EXISTS `uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uom` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Status` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `ModifyBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom`
--

LOCK TABLES `uom` WRITE;
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;
/*!40000 ALTER TABLE `uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(75) NOT NULL,
  `Email` varchar(75) DEFAULT NULL,
  `Role` varchar(55) NOT NULL,
  `Password` varchar(75) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `Createdby` varchar(55) NOT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `Modifyby` varchar(55) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `MobileNumber` varchar(55) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Telephone` varchar(75) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `Gender` varchar(55) DEFAULT NULL,
  `Image` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-26 15:52:37
