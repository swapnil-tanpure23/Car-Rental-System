-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: carsrental
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `VIN` varchar(18) NOT NULL DEFAULT '',
  `category_id` int unsigned DEFAULT NULL,
  `license_plate` char(8) NOT NULL,
  `availability` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`VIN`),
  UNIQUE KEY `uc_licenseplate` (`license_plate`),
  UNIQUE KEY `uc_VIN` (`VIN`,`category_id`),
  KEY `index_car_VIN` (`VIN`),
  KEY `index_car_category` (`category_id`),
  KEY `index_car_licenseplate` (`license_plate`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `carcategory` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('1HD1KAV106Y69592',6001,'GHB-7865',1),('1HD1KAV106Y695921',6002,'BHG-5678',1),('1HD1KAV106Y695922',6002,'VGJ-5678',1),('1LNLM9842KY774961',6003,'DFG-3456',1),('2BNPDDJH51K97100',6001,'ABD-768',1),('2HGES16535HG81755',6001,'SDF-8765',1),('2HGES16535HG81756',6002,'HHJ-4567',1),('2HGES16535HG81758',6004,'SDF-4456',1),('2HGES16535HG81759',6003,'CGH-8765',1),('2HGES16535HG81760',6004,'SDF-8762',1),('2HGES16535HG81761',6005,'BHJK-456',1),('2HGES16535HG81763',6006,'BVF-5679',0),('2KJPDDJH51K971089',6001,'LCH-3210',1),('2WKPDDJH51K970989',6001,'BGD-4321',1),('2WKPDDJH51K97099',6003,'FGB-5676',1),('2WKPDDJH51K970990',6002,'CJG-5678',1),('2WKPDDJH51K970995',6004,'VGH-4221',1),('2WKPDDJH51K970997',6005,'VBJ-6778',1),('3FRWW6FC3DV072954',6002,'BJR-8765',1),('3FRWW6FC3DV072957',6003,'CKK-6787',1),('5GAET13M262340847',6001,'NJH-8765',1),('5GAET13M262340848',6001,'DVG-7653',1),('5GAET13M262340851',6003,'XCF-4322',1),('5GAET13M262340852',6004,'BGG-8759',1),('5GAET13M262340853',6005,'BHH-5678',1),('5GAET13M262340854',6005,'VHH-5567',1),('5GAET13M262340855',6005,'NGG-4567',1),('5GAET13M262341848',6002,'JHF-5678',1),('JS1GL52A4D2145863',6002,'KKF-7654',1),('JS1GL52A4D2145864',6003,'CFF-5567',1),('KMHHU6KJ1DU186741',6001,'CVF-7865',1),('KMHHU6KJ1DU186742',6002,'LKJ-9879',1),('KMHHU6KJ1DU186744',6004,'CFF-5435',1),('KMHHU6KJ1DU186747',6005,'VHJ-7656',1),('KMHHU6KJ1DU186749',6004,'VBH-6645',1);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carcategory`
--

DROP TABLE IF EXISTS `carcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carcategory` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) NOT NULL,
  `renting_price` double NOT NULL DEFAULT '0',
  `availability` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`),
  KEY `index_carcategory_id` (`category_id`),
  KEY `index_carcategory_name` (`category_name`),
  KEY `index_carcategory_price` (`renting_price`)
) ENGINE=InnoDB AUTO_INCREMENT=6011 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carcategory`
--

LOCK TABLES `carcategory` WRITE;
/*!40000 ALTER TABLE `carcategory` DISABLE KEYS */;
INSERT INTO `carcategory` VALUES (6001,'Economy',25,1),(6002,'Intermediate',24,1),(6003,'SUV',28,1),(6004,'Luxury',35,1),(6005,'Compact',23,1),(6006,'Family',26,0),(6007,'Convertible',28,1),(6008,'Cargo Van',34,1),(6009,'Mid-Level',24,1),(6010,'Roadster',34,1);
/*!40000 ALTER TABLE `carcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `email_id` varchar(30) NOT NULL DEFAULT '',
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone_number` char(10) NOT NULL,
  `registration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_id`),
  KEY `index_customer_email` (`email_id`),
  KEY `index_customer_phone` (`phone_number`),
  KEY `index_customer_name` (`last_name`,`first_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('aaradhana@gmail.com','Aaradhana','','Raghunathan','980765453','2015-12-11 03:45:41'),('admin@carrentalsystem.com','Admin_first','Admin_middle','Admin_last','9999999999','2015-12-11 03:41:45'),('akash@gmail.com','Akash','Venkata Naga','Ungarala','9803378946','2015-12-11 03:43:06'),('alex@gmail.com','Alex','','Phillips','765654321','2015-12-11 03:47:07'),('imani@gmail.com','Imani',NULL,'Bansal','3152108765','2015-12-11 03:44:13'),('madhuvani@gmail.com','Madhuvani','','Vanam','987678654','2015-12-11 03:46:23');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `reservation_id` int unsigned NOT NULL DEFAULT '0',
  `license_id` varchar(15) NOT NULL DEFAULT '',
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) NOT NULL,
  PRIMARY KEY (`reservation_id`,`license_id`),
  KEY `index_driver_reservation` (`reservation_id`,`license_id`),
  KEY `index_driver_name` (`last_name`,`first_name`),
  CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (2,'887543214578','Aiko','Roth','Carney'),(3,'454534','Akash','Venkata Naga','Ungarala'),(4,'AK8472','Akash','Venkata Naga','Ungarala');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registeredcustomer`
--

DROP TABLE IF EXISTS `registeredcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registeredcustomer` (
  `membership_id` int unsigned NOT NULL AUTO_INCREMENT,
  `email_id` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `num_rentals` int DEFAULT '0',
  PRIMARY KEY (`membership_id`),
  UNIQUE KEY `email_id` (`email_id`),
  UNIQUE KEY `uc_member` (`email_id`,`membership_id`),
  UNIQUE KEY `uc_login` (`email_id`,`password`),
  KEY `index_registeredcustomer_membership` (`membership_id`),
  KEY `index_registeredcustomer_email` (`email_id`),
  CONSTRAINT `registeredcustomer_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `customer` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registeredcustomer`
--

LOCK TABLES `registeredcustomer` WRITE;
/*!40000 ALTER TABLE `registeredcustomer` DISABLE KEYS */;
INSERT INTO `registeredcustomer` VALUES (1000,'admin@carrentalsystem.com','admin',0),(1001,'akash@gmail.com','ungarala',2),(1002,'imani@gmail.com','bansal',0),(1003,'aaradhana@gmail.com','raghunathan',0),(1004,'madhuvani@gmail.com','vanam',0);
/*!40000 ALTER TABLE `registeredcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `rental_id` int unsigned NOT NULL AUTO_INCREMENT,
  `reservation_id` int unsigned DEFAULT NULL,
  `license_id` varchar(15) DEFAULT NULL,
  `VIN` char(18) DEFAULT NULL,
  `pick_up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `return_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cc_name` varchar(30) NOT NULL,
  `cc_number` char(16) NOT NULL,
  `cc_cvv` char(3) NOT NULL,
  `cc_expiry_date_year` char(4) NOT NULL,
  `cc_expiry_date_month` char(2) NOT NULL,
  `over_due_amount` double DEFAULT NULL,
  `amount_to_pay` double DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  UNIQUE KEY `uc_rental` (`reservation_id`,`license_id`,`VIN`),
  KEY `index_rental_id` (`rental_id`),
  KEY `index_rental_reservation` (`reservation_id`),
  KEY `index_rental_license` (`license_id`),
  KEY `index_rental_VIN` (`VIN`),
  KEY `index_rental_ccname` (`cc_name`),
  KEY `index_rental_ccnumber` (`cc_number`),
  CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`reservation_id`, `license_id`) REFERENCES `driver` (`reservation_id`, `license_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`VIN`) REFERENCES `car` (`VIN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (6,2,'887543214578','1HD1KAV106Y69592','2015-12-16 05:25:02','2015-12-16 05:26:30','Venkata Naga Akash','1234567899876541','785','2020','08',0,25.98),(17,4,'AK8472','2HGES16535HG81758','2015-12-10 14:06:31','2015-12-16 14:09:38','Venkata Naga Akash','2583691473691472','475','2018','08',0,227.325);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int unsigned NOT NULL AUTO_INCREMENT,
  `email_id` varchar(30) DEFAULT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `pick_up_date` date NOT NULL,
  `return_date` date NOT NULL,
  `discount_amount` double DEFAULT '0',
  `transaction_amount` double DEFAULT '0',
  PRIMARY KEY (`reservation_id`),
  UNIQUE KEY `uc_reservation` (`reservation_id`,`email_id`,`category_id`),
  KEY `category_id` (`category_id`),
  KEY `index_reservation_id` (`reservation_id`),
  KEY `index_reservation_email` (`email_id`),
  KEY `index_reservation_pickupdate` (`pick_up_date`),
  KEY `index_reservation_returndate` (`return_date`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `customer` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `carcategory` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (2,'akash@gmail.com',6002,'2015-12-15','2015-12-25',0,259.8),(3,'akash@gmail.com',6006,'2015-12-07','2015-12-21',0,394.03),(4,'akash@gmail.com',6004,'2015-12-10','2015-12-20',0,378.875);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_category_available_carcount`
--

DROP TABLE IF EXISTS `v_category_available_carcount`;
/*!50001 DROP VIEW IF EXISTS `v_category_available_carcount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_category_available_carcount` AS SELECT 
 1 AS `CategoryID`,
 1 AS `AvailableCarCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_category_carcount`
--

DROP TABLE IF EXISTS `v_category_carcount`;
/*!50001 DROP VIEW IF EXISTS `v_category_carcount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_category_carcount` AS SELECT 
 1 AS `CategoryID`,
 1 AS `TotalCarCount`,
 1 AS `AvailableCarCount`,
 1 AS `RentedCarCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_category_total_carcount`
--

DROP TABLE IF EXISTS `v_category_total_carcount`;
/*!50001 DROP VIEW IF EXISTS `v_category_total_carcount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_category_total_carcount` AS SELECT 
 1 AS `CategoryID`,
 1 AS `TotalCarCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_category_available_carcount`
--

/*!50001 DROP VIEW IF EXISTS `v_category_available_carcount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_category_available_carcount` AS select `cc`.`category_id` AS `CategoryID`,count(`c`.`VIN`) AS `AvailableCarCount` from (`carcategory` `cc` left join `car` `c` on((`cc`.`category_id` = `c`.`category_id`))) where (`c`.`availability` = 1) group by `cc`.`category_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_category_carcount`
--

/*!50001 DROP VIEW IF EXISTS `v_category_carcount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_category_carcount` AS select `t`.`CategoryID` AS `CategoryID`,`t`.`TotalCarCount` AS `TotalCarCount`,`a`.`AvailableCarCount` AS `AvailableCarCount`,(`t`.`TotalCarCount` - `a`.`AvailableCarCount`) AS `RentedCarCount` from (`v_category_total_carcount` `t` join `v_category_available_carcount` `a` on((`t`.`CategoryID` = `a`.`CategoryID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_category_total_carcount`
--

/*!50001 DROP VIEW IF EXISTS `v_category_total_carcount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_category_total_carcount` AS select `cc`.`category_id` AS `CategoryID`,count(`c`.`VIN`) AS `TotalCarCount` from (`carcategory` `cc` left join `car` `c` on((`cc`.`category_id` = `c`.`category_id`))) group by `cc`.`category_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-27 21:34:14
