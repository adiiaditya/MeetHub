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
-- Table structure for table `UserProfile`
--

DROP TABLE IF EXISTS `UserProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserProfile` (
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `profilepic` varchar(1000) DEFAULT NULL,
  `coverpic` varchar(1000) DEFAULT NULL,
  `university` varchar(40) DEFAULT NULL,
  `dateofbirth` varchar(40) DEFAULT NULL,
  `major` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `joindate` varchar(40) DEFAULT NULL,
  `leavingdate` varchar(40) DEFAULT NULL,
  `gender` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserProfile`
--

LOCK TABLES `UserProfile` WRITE;
/*!40000 ALTER TABLE `UserProfile` DISABLE KEYS */;
INSERT INTO `UserProfile` VALUES ('aditya kumar','aditya@hawk.iit.edu','1234','aditya@hawk.iit.eduaditya.jpg','aditya@hawk.iit.educhicago.jpg','Illinois Tech','1992-01-01','Computer Science','Chicago','2011-05-01','2017-06-01','Male','3129081092'),('Ankita Kulkarni','akulk2@uis.edu','neelaobi','akulk2@uis.eduankita.jpg','defaultCover.gif','University Of Illinois','1992-12-17','Computer Science','Springfield','2015-08-24','2016-12-05','Female','2178624953'),('Keerthana KP','kkolurp1@hawk.iit.edu','1234','kkolurp1@hawk.iit.edukeerthana.jpg','defaultCover.gif','Illinois Tech','1993-01-01','Computer Science','Chicago','2015-08-25','2017-06-25','Female','4253051051'),('Titus Thomas','titus@hawk.iit.edu','1234','titus@hawk.iit.edutitus.jpg','titus@hawk.iit.educhicago.jpg','Illinois Tech','1991-01-01','Computer Science','Chicago','2016-01-01','2018-01-02','Male','3125361192'),('Uzma Naaz','unaaz@hawk.iit.edu','1234','unaaz@hawk.iit.eduuzma.jpeg','defaultCover.gif','Illinois Tech','1993-01-01','Computer Science','Chicago','2016-08-25','2018-05-26','Female','3129081092'),('Vinay Kai','vkai@hawk.iit.edu','1234','vkai@hawk.iit.eduganesh.jpg','defaultCover.gif','Illinois Tech','1993-04-20','Computer Science','Chicago','2015-08-25','2017-06-25','Male','3043822122');
/*!40000 ALTER TABLE `UserProfile` ENABLE KEYS */;
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
