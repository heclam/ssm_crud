-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: ssm_crud
-- ------------------------------------------------------
-- Server version	5.7.26-log

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
-- Table structure for table `tbl_dept`
--

DROP TABLE IF EXISTS `tbl_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dept`
--

LOCK TABLES `tbl_dept` WRITE;
/*!40000 ALTER TABLE `tbl_dept` DISABLE KEYS */;
INSERT INTO `tbl_dept` VALUES (1,'人力资源部'),(2,'会计部'),(3,'设计部');
/*!40000 ALTER TABLE `tbl_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_emp`
--

DROP TABLE IF EXISTS `tbl_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept` (`d_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_emp`
--

LOCK TABLES `tbl_emp` WRITE;
/*!40000 ALTER TABLE `tbl_emp` DISABLE KEYS */;
INSERT INTO `tbl_emp` VALUES (10,'95aeb8','M','aaaa8@luo.com',2),(11,'7f8889','M','7f8889@luo.com',1),(12,'4c04610','M','4c04610@luo.com',1),(13,'f621011','M','f621011@luo.com',1),(14,'1194712','F','1194712@luo.com',1),(15,'66b7413','M','66b7413@luo.com',1),(16,'0883014','M','0883014@luo.com',1),(17,'95cd015','M','95cd015@luo.com',1),(18,'3b8d116','M','3b8d116@luo.com',1),(19,'02b2a17','M','02b2a17@luo.com',1),(20,'016b718','M','016b718@luo.com',1),(21,'d829819','M','d829819@luo.com',1),(22,'df08720','M','df08720@luo.com',1),(23,'a5d3721','M','a5d3721@luo.com',1),(24,'b25f922','M','b25f922@luo.com',1),(25,'8050623','F','bbb@luo.com',3),(26,'e220624','M','e220624@luo.com',1),(27,'3973225','M','3973225@luo.com',1),(28,'1b7b426','M','1b7b426@luo.com',1),(29,'bd63127','M','bd63127@luo.com',1),(30,'284dd28','M','284dd28@luo.com',1),(31,'6717229','M','6717229@luo.com',1),(32,'1ba8c30','M','1ba8c30@luo.com',1),(33,'dc86031','M','dc86031@luo.com',1),(34,'81ee232','M','81ee232@luo.com',1),(35,'3c7ad33','M','3c7ad33@luo.com',1),(36,'b319434','M','b319434@luo.com',1),(37,'380e735','M','380e735@luo.com',1),(38,'1bb2636','M','1bb2636@luo.com',1),(39,'4837b37','M','4837b37@luo.com',1),(40,'a576338','M','a576338@luo.com',1),(41,'43e3e39','M','43e3e39@luo.com',1),(42,'62d0240','M','62d0240@luo.com',1),(43,'270d041','M','270d041@luo.com',1),(44,'dc28a42','M','dc28a42@luo.com',1),(45,'9d33c43','M','9d33c43@luo.com',1),(46,'96b9e44','M','96b9e44@luo.com',1),(47,'d800e45','M','d800e45@luo.com',1),(48,'6292846','M','6292846@luo.com',1),(49,'b1ad247','M','b1ad247@luo.com',1),(50,'5d4a048','M','5d4a048@luo.com',1),(51,'a7e2249','M','a7e2249@luo.com',1),(52,'8c73350','M','8c73350@luo.com',1),(53,'3566951','M','3566951@luo.com',1),(54,'1e95c52','M','1e95c52@luo.com',1),(55,'d841a53','M','d841a53@luo.com',1),(56,'9018e54','M','9018e54@luo.com',1),(57,'737e755','M','737e755@luo.com',1),(58,'5054f56','M','5054f56@luo.com',1),(59,'db1c857','M','db1c857@luo.com',1),(60,'c8ffe58','M','c8ffe58@luo.com',1),(61,'5e12159','M','5e12159@luo.com',1),(62,'a4d9460','M','a4d9460@luo.com',1),(63,'ac3a461','M','ac3a461@luo.com',1),(64,'7ee4162','M','7ee4162@luo.com',1),(65,'9141c63','M','9141c63@luo.com',1),(66,'b275864','M','b275864@luo.com',1),(67,'19ac165','M','19ac165@luo.com',1),(68,'b1d9766','M','b1d9766@luo.com',1),(69,'13a9c67','M','13a9c67@luo.com',1),(70,'0d7e068','M','0d7e068@luo.com',1),(71,'df37c69','M','df37c69@luo.com',1),(72,'2deb570','M','2deb570@luo.com',1),(73,'e480971','M','e480971@luo.com',1),(74,'d961772','M','d961772@luo.com',1),(75,'dd18773','M','dd18773@luo.com',1),(76,'cba8274','M','cba8274@luo.com',1),(77,'d69b575','M','d69b575@luo.com',1),(78,'ebbf776','M','ebbf776@luo.com',1),(79,'7a34577','M','7a34577@luo.com',1),(80,'8804678','M','8804678@luo.com',1),(81,'1494879','M','1494879@luo.com',1),(82,'d93fb80','M','d93fb80@luo.com',1),(83,'9335e81','M','9335e81@luo.com',1),(84,'2ffb382','M','2ffb382@luo.com',1),(85,'7973883','M','7973883@luo.com',1),(86,'468b284','M','468b284@luo.com',1),(87,'43f7085','M','43f7085@luo.com',1),(88,'f406786','M','f406786@luo.com',1),(89,'e092187','M','e092187@luo.com',1),(90,'8f05888','M','8f05888@luo.com',1),(91,'4a7bf89','M','4a7bf89@luo.com',1),(92,'910e990','M','910e990@luo.com',1),(93,'4ae6591','M','4ae6591@luo.com',1),(94,'643c792','M','643c792@luo.com',1),(95,'a0e4193','M','a0e4193@luo.com',1),(96,'8c21d94','M','8c21d94@luo.com',1),(97,'5c8f995','M','5c8f995@luo.com',1),(98,'6470196','M','6470196@luo.com',1),(99,'049db97','M','049db97@luo.com',1),(100,'dea6298','M','dea6298@luo.com',1),(101,'415c499','M','415c499@luo.com',1),(102,'chen','F','1234@qq.com',3),(103,'huang','M','1234@qq.com',2),(104,'ss','M','sdf',1),(105,'sdfsdf','M','sdf',1),(106,'sd','M','123',1),(107,'sd12312','M','123',1),(108,'sd12312','M','123',1),(109,'sd12312','M','wer',1),(111,'123123','M','123',1),(112,'123123','M','123',1),(113,'qq','M','qw',1),(114,'qqqweqw','M','qw',1),(115,'asd','M','asd',1),(116,'asdqweqwe','M','asdqwe',1),(117,'feifei','M','1234@qq.com',1),(118,'feifei','M','1234@qq.com',1),(119,'feifei','F','1234@qq.com',2),(120,'feifei','F','1234@qq.com',2);
/*!40000 ALTER TABLE `tbl_emp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-25  1:02:10
