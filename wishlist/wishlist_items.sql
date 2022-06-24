-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: wishlist
-- ------------------------------------------------------
-- Server version	8.0.22

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
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'https://www.alza.cz/realme-c31?dq=7080325','3500','Realme C31 Dual SIM 32GB stříbrná','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=REAM037b1','2022-04-20'),(3,'https://www.alza.cz/alza-officebook-pentium-d6922760.htm','13 990,-','Alza Officebook Pentium','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=ALZAa01e','2022-05-07'),(4,'https://www.alza.cz/insta360-one-x2-d6239267.htm','11 490,-','Insta360 ONE X2','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=Insta360x2','2022-05-07'),(5,'https://www.alza.cz/acer-nitro-5?dq=7002625','31 990,-','Acer Nitro 5 Shale Black','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=NC108c7i07j4','2022-04-20'),(7,'https://www.alza.cz/yubikey-5ci-d7077644.htm','2 190,-','YubiKey 5Ci','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=YUBIK002a6','2022-05-07'),(8,'https://www.alza.cz/ausdom-af660-d6345154.htm','999,-','Ausdom AF660','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=Ausd07','2022-05-06'),(9,'https://www.alza.cz/rapture-gaming-chair-podium-cerna-d6922179.htm','4 990,-','Rapture Gaming Chair PODIUM černá','https://cdn.alza.cz/Foto/f16/RP/RPTGC0200b.jpg','2022-05-06'),(10,'https://www.alza.cz/rapture-cobra-cerna-d6900118.htm','699,-','Rapture COBRA černá','https://cdn.alza.cz/Foto/f16/RP/RPTGM003a.jpg','2022-05-07'),(11,'https://www.alza.cz/hp-pavilion-gaming-15-ec2900nc-shadow-blackghost-white-d6727922.htm','20 990,-','HP Pavilion Gaming 15-ec2900nc Shadow Black/Ghost White','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=HPCN1015y3s4','2022-05-07'),(12,'https://www.alza.cz/siguro-fn-s47-silent-wind-white-d6548162.htm','1 399,-','Siguro FN-S47 Silent Wind White','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=SGR_FN_S470W','2022-05-11'),(13,'https://www.alza.cz/tefal-ff107810-maxi-fry-d5363161.htm','999,-','Tefal FF107810 Maxi Fry','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=TEFFF006','2022-06-24'),(14,'https://www.alza.cz/midea-mf100w60-t-cz-d7111372.htm','4 999,-','MIDEA MF100W60/T-CZ','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=MIDPR004','2022-05-11'),(15,'https://www.alza.cz/logitech-g-pro-wireless-gaming-mouse-league-of-legends-edition-d6789632.htm','2 199,-','Logitech G PRO Wireless Gaming Mouse League of Legends Edition','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=MG137a8d2','2022-05-11'),(16,'https://www.alza.cz/maxi/finish-quantum-infinity-shine-280-ks-d6602163.htm','449,-','FINISH Quantum Infinity Shine 2×80 ks','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=MYC415','2022-05-11'),(17,'https://www.alza.cz/tefal-sada-nadobi-6ks-duetto-g719s674-d5658500.htm','1 599,-','Tefal Sada nádobí 6ks Duetto+ G719S674','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=TEFSN18','2022-06-02'),(18,'https://www.alza.cz/siguro-ek-g21-bright-glass-d7056776.htm','499,-','Siguro EK-G210GL Bright Glass','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=SGR_EK_G210GL','2022-06-02'),(19,'https://www.alza.cz/siguro-sv-r850b-tenderino-black-wifi-d7006614.htm','1 999,-','Siguro SV-R850B Tenderino WiFi/BT','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=SGR_SV_R850B','2022-06-02'),(20,'https://www.alza.cz/steba-sous-vide-sv-2-d2268343.htm','5 439,-','Steba Sous-Vide SV 2','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=EPV2030a','2022-06-02'),(21,'https://www.alza.cz/hracky/pokemon-tcg-rapid-strike-urshifu-vmax-premium-box-d6835047.htm','1 249,-','Pokémon TCG: Rapid Strike Urshifu VMax Premium Box','https://cdn.alza.cz/ImgW.ashx?fd=f16&cd=HRAbz25494','2022-06-24');
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

-- Dump completed on 2022-06-24 18:04:34
