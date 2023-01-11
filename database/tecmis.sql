CREATE DATABASE  IF NOT EXISTS `mis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mis`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: mis
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `ca_marks`
--

DROP TABLE IF EXISTS `ca_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ca_marks` (
  `student_id` varchar(15) NOT NULL,
  `subject_id` varchar(8) NOT NULL,
  `quiz1` int DEFAULT NULL,
  `quiz2` int DEFAULT NULL,
  `quiz3` int DEFAULT NULL,
  `quiz4` int DEFAULT NULL,
  `assignment1` int DEFAULT NULL,
  `assignment2` int DEFAULT NULL,
  `assignment3` int DEFAULT NULL,
  `mid` int DEFAULT NULL,
  PRIMARY KEY (`student_id`,`subject_id`),
  KEY `subjectdetails_idx` (`subject_id`),
  CONSTRAINT `studentdetails` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `subjectdetails` FOREIGN KEY (`subject_id`) REFERENCES `course` (`course_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_marks`
--

LOCK TABLES `ca_marks` WRITE;
/*!40000 ALTER TABLE `ca_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_code` varchar(8) NOT NULL,
  `course_namel` varchar(45) NOT NULL,
  `credits` int NOT NULL,
  `department_id` varchar(10) NOT NULL,
  PRIMARY KEY (`course_code`),
  KEY `department_name_idx` (`department_id`),
  CONSTRAINT `department_name` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` varchar(10) NOT NULL,
  `Department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('D01','ICT'),('D02','ET'),('D03','BST');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_marks`
--

DROP TABLE IF EXISTS `final_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `final_marks` (
  `student_id` varchar(15) NOT NULL,
  `subject_id` varchar(8) NOT NULL,
  `theory` int DEFAULT NULL,
  `practical` int DEFAULT NULL,
  PRIMARY KEY (`student_id`,`subject_id`),
  KEY `subject_idx` (`subject_id`),
  CONSTRAINT `student` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `subject` FOREIGN KEY (`subject_id`) REFERENCES `course` (`course_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_marks`
--

LOCK TABLES `final_marks` WRITE;
/*!40000 ALTER TABLE `final_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `final_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical`
--

DROP TABLE IF EXISTS `medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical` (
  `medical_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `type` char(1) NOT NULL,
  `hours` int NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `subject_id` varchar(8) NOT NULL,
  PRIMARY KEY (`medical_id`),
  KEY `student_data_idx` (`student_id`),
  KEY `subject_idx` (`subject_id`),
  CONSTRAINT `student_data` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT,
  CONSTRAINT `sub_data` FOREIGN KEY (`subject_id`) REFERENCES `course` (`course_code`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical`
--

LOCK TABLES `medical` WRITE;
/*!40000 ALTER TABLE `medical` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `notice_id` int NOT NULL,
  `topic` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `content` varchar(400) NOT NULL,
  `department_id` varchar(10) NOT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `department_idx` (`department_id`),
  CONSTRAINT `department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_pic`
--

DROP TABLE IF EXISTS `profile_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_pic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_pic` varchar(255) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `username_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_pic`
--

LOCK TABLES `profile_pic` WRITE;
/*!40000 ALTER TABLE `profile_pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_attendance`
--

DROP TABLE IF EXISTS `student_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_attendance` (
  `student_id` varchar(15) NOT NULL,
  `subject_id` varchar(8) NOT NULL,
  `day` date NOT NULL,
  `type` char(1) NOT NULL,
  `hours` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`student_id`,`subject_id`),
  KEY `subjectid_idx` (`subject_id`),
  CONSTRAINT `studentid` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `subjectid` FOREIGN KEY (`subject_id`) REFERENCES `course` (`course_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_attendance`
--

LOCK TABLES `student_attendance` WRITE;
/*!40000 ALTER TABLE `student_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(15) NOT NULL,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `gender` enum('m','f') NOT NULL,
  `mobile_no` bigint DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('TG/2017/255','Ddddd','Fdgf','2022-05-02','kk@gmail.com','ffff','m',772741450),('TG/2018/555','Dasun','Kumara','1997-02-05','dasun@gmail.com','Rathnapura','m',715465852),('TG/2019/422','Kasun','perera','1998-11-04','kasun@gmail.com','matara','f',714544251),('TG/2019/480','Dilum','Perera','1998-09-06','dilum@gmail.com','Anuradhapura','m',715546856),('TG/2019/491','Tharukee','Malsha','1998-04-05','tharukee@gmail.com','gampaha','f',716542444),('TG/2019/495','Ravindu ','Saputhanthri','1998-11-17','rravindur@gmail.com','galle','m',715546525);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_department`
--

DROP TABLE IF EXISTS `user_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_department` (
  `user_id` varchar(15) NOT NULL,
  `department_id` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`,`department_id`),
  KEY `dep_id_idx` (`department_id`),
  CONSTRAINT `dep_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE RESTRICT,
  CONSTRAINT `usr_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_department`
--

LOCK TABLES `user_department` WRITE;
/*!40000 ALTER TABLE `user_department` DISABLE KEYS */;
INSERT INTO `user_department` VALUES ('TG/2019/480','D01'),('TG/2019/491','D01'),('TG/2017/255','D02'),('TG/2018/555','D02');
/*!40000 ALTER TABLE `user_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_data`
--

DROP TABLE IF EXISTS `user_login_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_data` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` char(2) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_data`
--

LOCK TABLES `user_login_data` WRITE;
/*!40000 ALTER TABLE `user_login_data` DISABLE KEYS */;
INSERT INTO `user_login_data` VALUES ('TG491','2222','st','TG/2019/491'),('TG495','1234','st','TG/2019/495');
/*!40000 ALTER TABLE `user_login_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 21:57:45
