CREATE DATABASE  IF NOT EXISTS `issue_tracker` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `issue_tracker`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: issue_tracker
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `error_type`
--

DROP TABLE IF EXISTS `error_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_type` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Source` varchar(45) DEFAULT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_type`
--

LOCK TABLES `error_type` WRITE;
/*!40000 ALTER TABLE `error_type` DISABLE KEYS */;
INSERT INTO `error_type` VALUES (1,'syntax','Errors Due To The Fact That The Syntax Of The Language Is Not Respected','Language Fundamentals',101,'2016-09-27 14:45:01',101,'2016-09-19 19:14:47'),(2,'semantic','errors due to an improper use of program statements','statements',101,'2016-09-27 14:45:01',103,'2016-09-19 19:35:13'),(3,'Logical','errors due to the fact that the specification is not respected','logic',103,'2016-09-27 14:45:01',102,'2016-09-19 19:36:15'),(4,'compile time','syntax errors and static semantic errors indicated by the compiler.','compiler',104,'2016-09-27 14:45:01',104,'2016-09-19 19:36:47'),(5,'Run time','dynamic semantic errors, and logical errors, that cannot be detected by the compiler (debugging).','run time',105,'2016-09-27 14:45:01',106,'2016-09-19 19:37:32'),(6,'system','system errors are thrown system down time.','system maintenance',109,'2016-09-27 14:45:01',110,'2016-09-21 02:30:51');
/*!40000 ALTER TABLE `error_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (6,'Error','An event that indicates a significant problem such as loss of data or loss of functionality.'),(7,'Warning','An event that is not necessarily significant, but may indicate a possible future problem.'),(8,'Information','An event that describes the successful operation of an application, driver, or service.'),(9,'Success Audit','An event that records an audited security access attempt that is successful.'),(10,'Failure Audit','If user tries to access a network drive and fails, the attempt is logged as a Failure Audit event.');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_status`
--

DROP TABLE IF EXISTS `issue_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `shortcode` varchar(15) NOT NULL,
  `description` varchar(45) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `shortcode_UNIQUE` (`shortcode`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_status`
--

LOCK TABLES `issue_status` WRITE;
/*!40000 ALTER TABLE `issue_status` DISABLE KEYS */;
INSERT INTO `issue_status` VALUES (1,'Application Failure Issue','Fatal','Application has a fatal failure',1,'2016-12-19 16:06:27',1,'2016-12-19 16:06:27'),(3,'Application Critical Issue','Critical','Critial failure but system runs',1,'2016-12-19 16:11:39',1,'2016-12-19 16:11:39'),(4,'Application Moderate Issue','Moderate','Moderate failure but system runs',1,'2016-12-19 16:11:39',1,'2016-12-19 16:11:39'),(5,'Enhancement','Enhancement','Application request for system enhancement',1,'2016-12-19 16:11:39',1,'2016-12-19 16:11:39'),(6,'Application Minor Issue','Minor','Minor issue but system runs',1,'2016-12-19 16:11:39',1,'2016-12-19 16:11:39'),(7,'Issue Resolved','Resolved','Issue has been resolved by engineer',1,'2016-12-19 21:40:20',1,'2016-12-19 21:40:20');
/*!40000 ALTER TABLE `issue_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_type`
--

DROP TABLE IF EXISTS `issue_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_type` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(225) DEFAULT NULL,
  `Created_On` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Modified_On` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_By` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_type`
--

LOCK TABLES `issue_type` WRITE;
/*!40000 ALTER TABLE `issue_type` DISABLE KEYS */;
INSERT INTO `issue_type` VALUES (1,'Database','Database Error','2016-12-19 00:00:00',1,'2016-12-19 00:00:00',1),(2,'PHP','PHP error','2016-12-19 00:00:00',1,'2016-12-19 00:00:00',1),(3,'Web Page','UI Error','2016-12-19 00:00:00',1,'2016-12-19 00:00:00',1),(4,'Server','Web Server Error','2016-12-19 00:00:00',1,'2016-12-19 00:00:00',1),(5,'Network','Network Error','2016-12-19 00:00:00',1,'2016-12-19 00:00:00',1);
/*!40000 ALTER TABLE `issue_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type` int(11) NOT NULL,
  `issue_description` varchar(4000) NOT NULL,
  `issue_status` int(11) NOT NULL,
  `identified_by` varchar(64) NOT NULL,
  `identified_date` date NOT NULL,
  `priority` varchar(16) NOT NULL,
  `solution` varchar(4000) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (3,1,'I forgot my password',1,'4','2016-12-20','1','',NULL,'2016-12-19 00:00:00',1,'2016-12-19 00:00:00',4),(5,1,'I cant find my car keys',5,'1','2016-11-15','1','','uploads/placeholder-slider.png','2016-11-15 00:00:00',1,'2016-12-19 00:00:00',4),(7,2,'Where do I press is the any key?',1,'2','2016-12-18','3','Done','uploads/placeholder-slider.png','2016-12-18 00:00:00',1,'2016-12-19 00:00:00',4),(8,5,'Cannot connect to my website',3,'4','2016-12-01','3','','','2016-12-19 00:00:00',4,'2016-12-19 00:00:00',4),(10,4,'Web server load balancer is not working',3,'4','2016-12-12','2','','uploads/placeholder-slider.png','2016-12-19 00:00:00',4,'2016-12-19 00:00:00',4);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Question` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Question_UNIQUE` (`Question`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'2+2'),(2,'What is your first attended school ?'),(3,'what is your first mobile number ?'),(4,'who are u?'),(5,'who is your bestie?');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (1,'edit','edit rights'),(2,'view','view rights');
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_events`
--

DROP TABLE IF EXISTS `system_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventId` int(11) NOT NULL,
  `procedureName` int(11) NOT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `eventId_idx` (`eventId`),
  CONSTRAINT `eventId` FOREIGN KEY (`eventId`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_events`
--

LOCK TABLES `system_events` WRITE;
/*!40000 ALTER TABLE `system_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_questions`
--

DROP TABLE IF EXISTS `user_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_questions` (
  `User_Id` int(11) NOT NULL,
  `Question_Id` int(11) NOT NULL,
  `Answer` varchar(255) NOT NULL,
  PRIMARY KEY (`User_Id`,`Question_Id`),
  KEY `Question_Id_idx` (`Question_Id`),
  CONSTRAINT `Question_Id` FOREIGN KEY (`Question_Id`) REFERENCES `questions` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `User_Id` FOREIGN KEY (`User_Id`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_questions`
--

LOCK TABLES `user_questions` WRITE;
/*!40000 ALTER TABLE `user_questions` DISABLE KEYS */;
INSERT INTO `user_questions` VALUES (4,2,'Fairfield University');
/*!40000 ALTER TABLE `user_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rights`
--

DROP TABLE IF EXISTS `user_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rights` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `RightsId` int(11) NOT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rights`
--

LOCK TABLES `user_rights` WRITE;
/*!40000 ALTER TABLE `user_rights` DISABLE KEYS */;
INSERT INTO `user_rights` VALUES (1,4,1,'',1,'2016-11-30 16:16:54',1,'2016-11-30 16:16:54'),(2,3,2,'',1,'2016-12-03 09:45:00',1,'2016-12-13 15:41:52');
/*!40000 ALTER TABLE `user_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL COMMENT 'Encrypted',
  `Email` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `JoinedDate` datetime NOT NULL,
  `BirthDate` datetime NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `SecurityQuestion` varchar(45) NOT NULL,
  `SecurityAnswer` varchar(45) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserKey_UNIQUE` (`Id`),
  UNIQUE KEY `UserName_UNIQUE` (`UserName`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'R2','$A^D*@$K','ryan@me.net','Ryan','Hirschthal','2012-06-13 00:00:00','2000-09-13 00:00:00','Male','','',0,'2016-09-27 14:57:42',NULL,'2016-09-27 14:57:42'),(2,'DeltaFire','a!kje#hi%','Peter@me.net','Peter','Pan','2012-06-13 00:00:00','2000-06-13 00:00:00','Male','','',0,'2016-09-27 14:57:42',NULL,'2016-09-27 14:57:42'),(3,'awilson','password0','Adrienne@me.net','Adrienne','Wilson','2012-06-13 00:00:00','2000-06-13 00:00:00','Female','','',0,'2016-09-27 14:57:42',NULL,'2016-09-27 14:57:42'),(4,'jwilson','password1','jonathan.wilson@fairfield.edu','Jon','Wilson','2016-11-03 00:00:00','1975-02-06 00:00:00','Male','What is my favorite class?','SW516',4,'2016-11-04 13:18:56',4,'2016-11-04 13:18:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'issue_tracker'
--

--
-- Dumping routines for database 'issue_tracker'
--
/*!50003 DROP PROCEDURE IF EXISTS `check_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `check_user`(IN _Email VARCHAR(45))
BEGIN
	SELECT
		u.Id as User_Id, q.Id as Question_Id, q.Question, uq.Answer
	FROM 
		user_questions uq JOIN questions q 
			ON uq.Question_Id = q.Id join
		users u
			ON u.Id = uq.User_Id
	WHERE 
		u.Email = _Email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_errorType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `del_errorType`(IN `_id` INT, OUT _return_value INT)
BEGIN

	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;

	DELETE FROM `errortype` WHERE Id = _id;
    
    SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_issues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `del_issues`(
	-- Stored procedure parameters
	IN _id      		INT,
    OUT _return_value INT)
BEGIN

	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;
	
    DELETE FROM issues WHERE i.id =_id;
    
    SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_issue_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sw516_agent`@`localhost` PROCEDURE `del_issue_status`(
	IN _statusId INT,
    OUT _return_value INT
)
BEGIN
	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;
    
	DELETE FROM `issue_tracker`.`issue_status` WHERE id = _statusId;
    
	SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_issue_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `del_issue_type`(
	IN _id INT,
    OUT _return_value INT
)
BEGIN
	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;
    
	DELETE FROM `issue_type` WHERE	issue_Id = _id;
           
	SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_system_events` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sw516_agent`@`localhost` PROCEDURE `del_system_events`(
	IN _systemEventId INT,
    OUT _return_value INT
)
BEGIN
	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;
    
	DELETE FROM `issue_tracker`.`system_events` WHERE id = _systemEventId;
    
	SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sw516_agent`@`localhost` PROCEDURE `del_users`( 
	-- Starting Params
	IN _UserKey INT,
    OUT _return_value INT
)
BEGIN
	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;
    
	-- Prove it exists before we try to delete
	IF EXISTS ( SELECT 1 FROM UserTable i WHERE i.UserKey = _UserKey ) THEN  
		DELETE FROM UserTable where id = _UserKey;
	END IF;
    
    SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_user_rights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `del_user_rights`(
	IN _ID INT,
    OUT _return_value INT
)
BEGIN
	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;

	DELETE FROM user_rights	WHERE Id = _ID;
    
    SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetErrorTypeName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `GetErrorTypeName`(IN _errortypeName VARCHAR(45))
BEGIN
	SELECT
		`Name`, 
        `Description`,
        `Source`, 
        `CreatedBy`,
        `UpdatedBy`,
        `UpdatedOn`
	FROM 
		ErrorType
    WHERE 
		`Name` = _errortypeName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_upd_issues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `ins_upd_issues`(
	-- Stored procedure parameters
	IN _id 		     		INT,
    IN _issue_type			INT,
    IN _issue_description  	VARCHAR(4000),
    IN _issue_status		INT,
	IN _identified_by   	VARCHAR(64),
    IN _identified_date     DATETIME,    
    IN _priority	   		VARCHAR(16),
	IN _solution			VARCHAR(4000),
	IN _modified_by			INT,
    OUT _return_value INT)
BEGIN

	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;
    
    -- If the record exists in the issue_tracker table updated else add it to the table
    IF EXISTS(SELECT 1 FROM issues i WHERE i.issue_id = _issue_id) THEN
		UPDATE 
			`issues`
		SET
			`_id` = _id,
			`issue_type` = _issue_type,
			`issue_description` = _issue_description,
			`issue_status` = _issue_status,
			`identified_by` = _identified_by,
			`identified_date` = _identified_date,
			`priority` = _priority,
			`solution` = _solution,
			`modified_on` = Current_Timestamp,
			`modified_by` = _modified_by
		WHERE
			`id` = _id;
    ELSE
		INSERT INTO `issues`(
			`_id`,
			`issue_type`,
			`issue_description`,
			`issue_status`,
			`identified_by`,
			`identified_date`,
			`priority`,
			`solution`,
            `created_by`,
			`modified_by`)
		VALUES(
			_id,
			_issue_type,
			_issue_description,
			_issue_status,
			_identified_by,
			_identified_date,
			_priority,
			_solution,
			_modified_by,
			_modified_by);
	END IF;
    
    SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_upd_issue_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sw516_agent`@`localhost` PROCEDURE `ins_upd_issue_status`(
	IN _id INT,
    IN _name VARCHAR(45),
    IN _shortcode DATETIME,
    IN _description VARCHAR(4000),
    OUT _return_value INT
)
BEGIN
	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;
    
    IF EXISTS(SELECT 1 FROM issue_status s WHERE s.id = _id) THEN
		UPDATE `issue_tracker`.`issue_status`
		SET
			`name` = _name,
			`shortcode` = _shortcode,
			`description` = _description
			WHERE `id` = _id;
	ELSE
		INSERT INTO `issue_tracker`.`issue_status`
		(`name`,
		`shortcode`,
		`description`)
		VALUES
		(_name,
		_shortcode,
		_description);
	END IF;    
    
    SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_upd_issue_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `ins_upd_issue_type`( 
	IN _id INT,
    IN _name VARCHAR(50),
    IN _description VARCHAR(255),
    IN _createdBy datetime,
    OUT _return_value INT
)
BEGIN
	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;
    
	IF EXISTS (SELECT * from issue_type i WHERE i.Id = _id) THEN
			
            UPDATE
				issue_type
			SET
				Name = _name,
				Description = _description,
				Modified_On = CURRENT_TIMESTAMP,
                Modified_By = _createdBy
			WHERE 
				`issuetype_Id` = _id;
				
			ELSE 
            
			INSERT INTO `issuemanagement`.`issuetype` (
				`issue_type`.`Name`,
				`issue_type`.`Description`,
				`issue_type`.`Created_By`,
				`issue_type`.`Modified_By`
			)                 
			VALUES (
                _name,
                _description,
				_createdBy,
                _createdBy
			);
			
           END IF;
           
           SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_upd_system_events` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sw516_agent`@`localhost` PROCEDURE `ins_upd_system_events`(
	IN _systemEventId INT,
    IN _eventId INT,
    IN _procedureName INT,
    IN _createdOn DATETIME,
    IN _createdBy INT,
    OUT _return_value INT
)
BEGIN
	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;		-- cleaner way to handle errors
	END;
    
    IF EXISTS(SELECT 1 FROM system_events se WHERE se.id = _systemEventId) THEN
		UPDATE `issue_tracker`.`system_events`
		SET
		`eventId` = _eventId,
		`procedureName` = _procedureName,
		`createdOn` = _createdOn,
		`createdBy` = _createdBy
		WHERE `id` = _systemEventId;
	ELSE
		INSERT INTO `issue_tracker`.`system_events`
		(`eventId`,
		`procedureName`,
		`createdOn`,
		`createdBy`)
		VALUES (
        _eventId,
		_procedureName,
		_createdOn,
		_createdBy
        );
	END IF;   
    
    SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_upd_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `ins_upd_update`(IN `_id` INT, IN `_name` VARCHAR(50), IN `_description` VARCHAR(255), IN `_source` VARCHAR(50), IN `_createdBy` INT, IN `_updatedBy` INT, IN `_updatedOn` TIMESTAMP, OUT _return_value INT)
BEGIN

	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;
    
    IF EXISTS (SELECT * from errortype et WHERE et.Id = _id) THEN
			
            UPDATE
				`errortype`
			SET
				`Name` = _name,
				`Description` = _description,
				`Source` = _source,
				`CreatedBy` = _createdBy,
				`UpdatedBy` = _updatedBy,
				`UpdatedOn` = CURRENT_TIMESTAMP
			WHERE 
				`Id` = _id;
				
			ELSE 
            
			INSERT INTO `errortype` (
                `Name`, 
                `Description`,
                `Source`, 
                `CreatedBy`,
                `UpdatedBy`,
                `UpdatedOn`
                ) 
                
                VALUES (
                _name,
                _description,
                _source,
                _createdBy,
                _updatedBy,
                _updatedOn );
			
		END IF;
           
		SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_upd_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sw516_agent`@`localhost` PROCEDURE `ins_upd_users`(
	-- Stored procedure parameters
	IN _UserKey INT,
	IN _UserName VARCHAR(45),
	IN _Password VARCHAR(45),
	IN _Email VARCHAR(45),
	IN _FirstName VARCHAR(45),
	IN _LastName VARCHAR(45),
	IN _JoinedDate DATETIME,
	IN _BirthDate DATETIME,
	IN _Gender VARCHAR(45),
    OUT _return_value INT)
BEGIN

	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;
    
	-- If the record exists in the item table updated else add it to the table
	IF EXISTS(SELECT 1 FROM users i WHERE i.id = _UserKey) THEN
		UPDATE
			issue_tracker.users
		SET
			UserName = _UserName,
			Password = _Password,
			Email = _Email,
			FirstName = _FirstName,
			LastName =_LastName ,
			JoinedDate = _JoinedDate,
			BirthDate = _BirthDate,
			Gender = _Gender
		WHERE
			id = _UserKey;
	ELSE
		INSERT INTO users(
			UserName,
			Password,
			Email,
			FirstName,
			LastName,
			JoinedDate,
			BirthDate,
			Gender
		)
		VALUES(
			_UserName,
			_Password,
			_Email,
			_FirstName,
			_LastName,
			_JoinedDate,
			_BirthDate,
			_Gender
		);
	END IF;
    
    SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_upd_user_rights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `ins_upd_user_rights`(
	-- Stored procedure parameters
    IN _ID 			INT,
    IN _UsrID 		INT,
    IN _RightsId 	INT,
    IN _IsActive	BIT,
    IN _ModifiedBy	INT,
    OUT _return_value INT
)
BEGIN

	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;

    -- If the record exists in the rights table updated else add it to the table
    IF EXISTS(SELECT 1 FROM user_rights r WHERE r.id = _id) THEN
		UPDATE 
			user_rights
		SET
			`UserId` = _UsrID,
			`RightsId` = _RightsId,
			`IsActive` = _IsActive,
			`UpdatedBy` = _ModifiedBy,
			`UpdatedOn` = current_timestamp()
		WHERE
			Id	=	_ID;
    ELSE
		INSERT INTO user_rights(
			`UserId`,
			`RightsId`,
			`IsActive`,
			`CreatedBy`,
			`UpdatedBy`
		) VALUES (			
			_UsrID,
			_RightsId,
			_IsActive,
			_ModifiedBy,
			_ModifiedBy            
		);
	END IF;
    
    SET _return_value = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_errorTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `sel_errorTypes`(IN _id INT)
BEGIN
		
			SELECT 
                `Name`, 
                `Description`,
                `Source`, 
                `CreatedBy`,
                `UpdatedBy`,
                `UpdatedOn`
                
			FROM
				`errortype`
			WHERE
				Id = _id;
			
		END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_issues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `sel_issues`(
	-- Stored procedure parameters
	IN _id      		INT
)
BEGIN
	SELECT 
		`issues`.`id`,
		`issues`.`issue_type`,
		`issues`.`issue_description`,
		`issues`.`issue_status`,
		`issues`.`identified_by`,
		`issues`.`identified_date`,
		`issues`.`priority`,
		`issues`.`solution`,
		`issues`.`created_on`,
		`issues`.`created_by`,
		`issues`.`modified_on`,
		`issues`.`modified_by`
	FROM 
		`issue_tracker`.`issues`
	WHERE
		`issues`.`id` = _id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_issue_du_by_filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `sel_issue_du_by_filter`(IN `_from` DATE, IN `_to` DATE)
BEGIN
	SELECT 
		id,
		(SELECT it.Name FROM issue_type it WHERE it.Id = i.issue_type) as issue_type, 
		issue_description, 
		(SELECT ist.shortcode FROM issue_status ist WHERE ist.Id = i.issue_status) as issue_status,
		(SELECT CONCAT(u.FirstName, ' ', u.LastName) FROM users u WHERE u.id = i.identified_by) as identified_by,
		identified_date,
		CASE 
			WHEN priority = 3 THEN 'High'
			WHEN priority = 2 THEN 'Medium'
			WHEN priority = 1 THEN 'Low'
		END AS priority,
		solution,
		filename,
		created_on,
		created_by,
		modified_on,
		modified_by 
	FROM 
		issues i
	WHERE
		i.identified_date BETWEEN _from AND _to;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_issue_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sw516_agent`@`localhost` PROCEDURE `sel_issue_status`(
	-- starting params
	IN _id INT
)
BEGIN
	SELECT `issue_status`.`id`,
    `issue_status`.`name`,
    `issue_status`.`shortcode`,
    `issue_status`.`description`
	FROM `issue_tracker`.`issue_status`
    WHERE 0 = _id OR
		  `issue_status`.`id` = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_issue_status_filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `sel_issue_status_filter`(IN `_status` INT(11))
BEGIN
	SELECT 
		id,
		(SELECT it.Name FROM issue_type it WHERE it.Id = i.issue_type) as issue_type, 
		issue_description, 
		(SELECT ist.shortcode FROM issue_status ist WHERE ist.Id = i.issue_status) as issue_status,
		(SELECT CONCAT(u.FirstName, ' ', u.LastName) FROM users u WHERE u.id = i.identified_by) as identified_by,
		identified_date,
		CASE 
			WHEN priority = 3 THEN 'High'
			WHEN priority = 2 THEN 'Medium'
			WHEN priority = 1 THEN 'Low'
		END AS priority,
		solution,
		filename,
		created_on,
		created_by,
		modified_on,
		modified_by 
	FROM 
		issues i
	WHERE
		i.issue_status = _status;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_issue_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `sel_issue_type`( IN _id INT )
BEGIN

	SELECT 
		`issue_type`.`Id`,
		`issue_type`.`Name`,
		`issue_type`.`Description`,
		`issue_type`.`Created_On`,
		`issue_type`.`Created_By`,
		`issue_type`.`Modified_On`,
		`issue_type`.`Modified_By`
	FROM 
		`issue_tracker`.`issue_type`
	WHERE
		0						= _id OR
		`issue_type`.`Id` 	= _id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_issue_type_filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `sel_issue_type_filter`(IN `_type` INT(11))
BEGIN
	SELECT 
		id,
		(SELECT it.Name FROM issue_type it WHERE it.Id = i.issue_type) as issue_type, 
		issue_description, 
		(SELECT ist.shortcode FROM issue_status ist WHERE ist.Id = i.issue_status) as issue_status,
		(SELECT CONCAT(u.FirstName, ' ', u.LastName) FROM users u WHERE u.id = i.identified_by) as identified_by,
		identified_date,
		CASE 
			WHEN priority = 3 THEN 'High'
			WHEN priority = 2 THEN 'Medium'
			WHEN priority = 1 THEN 'Low'
		END AS priority,
		solution,
		filename,
		created_on,
		created_by,
		modified_on,
		modified_by 
	FROM 
		issues i
	WHERE
		i.issue_type = _type;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_system_events` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sw516_agent`@`localhost` PROCEDURE `sel_system_events`(
	IN _systemEventId INT,
    OUT _return_value INT
)
BEGIN
	-- Setup a error handler
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;  							-- rollback any changes made in the transaction
		RESIGNAL;  							-- raise again the sql exception to the caller
        SET _return_value = MYSQL_ERRNO;	-- cleaner way to handle errors
	END;
    
    SELECT 
		`system_events`.`id`,
		`system_events`.`eventId`,
		`system_events`.`procedureName`,
		`system_events`.`createdOn`,
		`system_events`.`createdBy`
	FROM 
		`issue_tracker`.`system_events`
	WHERE
		_systemEventId 		=		0 or
        _systemEventId		= 		`system_events`.`id`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sw516_agent`@`localhost` PROCEDURE `sel_users`(
	-- starting params
	IN _UserKey INT
)
BEGIN
	SELECT Id, UserName, Password, Email, FirstName, LastName, JoinedDate, BirthDate, Gender
	FROM UserKey i
	WHERE i.Id = _UserKey;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sel_user_rights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jwilson`@`%` PROCEDURE `sel_user_rights`(
	IN _ID INT
)
BEGIN
	SELECT 
		`user_rights`.`Id`,
		`user_rights`.`UserId`,
		`user_rights`.`RightsId`,
		`user_rights`.`IsActive`,
		`user_rights`.`CreatedBy`,
		`user_rights`.`CreatedOn`,
		`user_rights`.`UpdatedBy`,
		`user_rights`.`UpdatedOn`
	FROM 
		`issue_tracker`.`user_rights`
	WHERE(
		_ID		=		0 OR
        _ID		=		Id );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-19 22:01:25
