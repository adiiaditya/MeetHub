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
-- Table structure for table `FriendList`
--

DROP TABLE IF EXISTS `FriendList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FriendList` (
  `username` varchar(40) NOT NULL,
  `friendname` varchar(40) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`username`,`friendname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FriendList`
--

LOCK TABLES `FriendList` WRITE;
/*!40000 ALTER TABLE `FriendList` DISABLE KEYS */;
INSERT INTO `FriendList` VALUES ('aditya@hawk.iit.edu','akulk2@uis.edu','accepted'),('aditya@hawk.iit.edu','titus@hawk.iit.edu','accepted'),('aditya@hawk.iit.edu','vkai@hawk.iit.edu','accepted'),('akulk2@uis.edu','aditya@hawk.iit.edu','accepted'),('akulk2@uis.edu','titus@hawk.iit.edu','accepted'),('titus@hawk.iit.edu','aditya@hawk.iit.edu','accepted'),('titus@hawk.iit.edu','akulk2@uis.edu','accepted'),('titus@hawk.iit.edu','unaaz@hawk.iit.edu','pending'),('titus@hawk.iit.edu','vkai@hawk.iit.edu','accepted'),('unaaz@hawk.iit.edu','vkai@hawk.iit.edu','accepted'),('vkai@hawk.iit.edu','aditya@hawk.iit.edu','accepted'),('vkai@hawk.iit.edu','titus@hawk.iit.edu','accepted'),('vkai@hawk.iit.edu','unaaz@hawk.iit.edu','accepted');
/*!40000 ALTER TABLE `FriendList` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-02 21:05:56
