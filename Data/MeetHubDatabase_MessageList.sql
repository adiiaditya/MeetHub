-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: MeetHubDatabase
-- ------------------------------------------------------
-- Server version	5.7.15

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
-- Table structure for table `MessageList`
--

DROP TABLE IF EXISTS `MessageList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MessageList` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromEmailID` varchar(200) DEFAULT NULL,
  `toEmailID` varchar(200) DEFAULT NULL,
  `fromUser` varchar(200) DEFAULT NULL,
  `messageText` varchar(500) DEFAULT NULL,
  `sentOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MessageList`
--

LOCK TABLES `MessageList` WRITE;
/*!40000 ALTER TABLE `MessageList` DISABLE KEYS */;
INSERT INTO `MessageList` VALUES (3,'aditya@hawk.iit.edu','titus@hawk.iit.edu','aditya kumar','Hello!','2016-12-02 18:24:21'),(4,'titus@hawk.iit.edu','aditya@hawk.iit.edu','Titus Thomas','Hi!','2016-12-02 18:24:53'),(5,'aditya@hawk.iit.edu','titus@hawk.iit.edu','aditya kumar','wasup','2016-12-02 20:13:58'),(6,'aditya@hawk.iit.edu','titus@hawk.iit.edu','aditya kumar','Wassup','2016-12-02 20:14:10');
/*!40000 ALTER TABLE `MessageList` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-02 21:05:57
