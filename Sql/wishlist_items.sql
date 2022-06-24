-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: wishlist
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'https://www.alza.cz/realme-c31?dq=7080325','3500','Realme C31 Dual SIM 32GB stříbrná','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=REAM037b1','2022-04-20'),(3,'https://www.alza.cz/alza-officebook-pentium-d6922760.htm','13 990,-','Alza Officebook Pentium','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=ALZAa01e','2022-05-07'),(4,'https://www.alza.cz/insta360-one-x2-d6239267.htm','11 490,-','Insta360 ONE X2','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=Insta360x2','2022-05-07'),(5,'https://www.alza.cz/acer-nitro-5?dq=7002625','31 990,-','Acer Nitro 5 Shale Black','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=NC108c7i07j4','2022-04-20'),(7,'https://www.alza.cz/yubikey-5ci-d7077644.htm','2 190,-','YubiKey 5Ci','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=YUBIK002a6','2022-05-07'),(8,'https://www.alza.cz/ausdom-af660-d6345154.htm','999,-','Ausdom AF660','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=Ausd07','2022-05-06'),(9,'https://www.alza.cz/rapture-gaming-chair-podium-cerna-d6922179.htm','4 990,-','Rapture Gaming Chair PODIUM černá','https://cdn.alza.cz/Foto/f16/RP/RPTGC0200b.jpg','2022-05-06'),(10,'https://www.alza.cz/rapture-cobra-cerna-d6900118.htm','699,-','Rapture COBRA černá','https://cdn.alza.cz/Foto/f16/RP/RPTGM003a.jpg','2022-05-07'),(11,'https://www.alza.cz/hp-pavilion-gaming-15-ec2900nc-shadow-blackghost-white-d6727922.htm','20 990,-','HP Pavilion Gaming 15-ec2900nc Shadow Black/Ghost White','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=HPCN1015y3s4','2022-05-07');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-07 13:40:25
