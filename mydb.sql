-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: plantshop
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `uID` varchar(20) NOT NULL,
  `productid` varchar(20) NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`uID`,`productid`),
  KEY `FKne3omhy31ybmgtrfdd3xld3p4` (`productid`),
  CONSTRAINT `FKda6242tsbp8c1hbau8u8f4bs1` FOREIGN KEY (`uID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `FKne3omhy31ybmgtrfdd3xld3p4` FOREIGN KEY (`productid`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `FKo7qnln497whrksp4gl1k5b4l6` FOREIGN KEY (`uID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('US003','PD004',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryID` varchar(255) NOT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('CATE001','Plant'),('CATE002','Cactus');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `CouponID` varchar(255) NOT NULL,
  `CouponCode` varchar(255) DEFAULT NULL,
  `DayExpired` datetime DEFAULT NULL,
  `DayStart` datetime DEFAULT NULL,
  `Discount` double DEFAULT NULL,
  PRIMARY KEY (`CouponID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` varchar(20) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Note` text,
  `Status` varchar(20) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `FKi68scew553c8uwcvbiboo33cm` (`userID`),
  CONSTRAINT `FK50n8908psn64q98x206lpu5mh` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `FKi68scew553c8uwcvbiboo33cm` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('ORD001','Tom','Cruise','Toho',NULL,'New York','Number 5, Tom Street','011335577','admin@example.com','Nothing','SUCCESS','US001'),('ORD002','Tom','Cruise','Toho',NULL,'New York','Number 5, Tom Street','011335577','admin@example.com','Nothing','SUCCESS',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersdetail`
--

DROP TABLE IF EXISTS `ordersdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordersdetail` (
  `orderid` varchar(20) NOT NULL,
  `productid` varchar(20) NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`orderid`,`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersdetail`
--

LOCK TABLES `ordersdetail` WRITE;
/*!40000 ALTER TABLE `ordersdetail` DISABLE KEYS */;
INSERT INTO `ordersdetail` VALUES ('ORD001','PD001',3);
/*!40000 ALTER TABLE `ordersdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersdetails`
--

DROP TABLE IF EXISTS `ordersdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordersdetails` (
  `OrderID` varchar(255) NOT NULL,
  `ProductID` varchar(255) NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `FKi5qxy7ilwx5lxrc8vkd2sb668` (`ProductID`),
  CONSTRAINT `FKi5qxy7ilwx5lxrc8vkd2sb668` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `FKn0iy53338oh4agcexct3okdi1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersdetails`
--

LOCK TABLES `ordersdetails` WRITE;
/*!40000 ALTER TABLE `ordersdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordersdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` varchar(255) NOT NULL,
  `ProductDescription` text,
  `ProductImage` varchar(255) DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `ProductPrice` double DEFAULT NULL,
  `ProductQuantity` int DEFAULT NULL,
  `ProductSale` double DEFAULT NULL,
  `ProductStarRating` int DEFAULT NULL,
  `CategoryID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `FKdy51ybcflnf4vwoo6p2o1dmif` (`CategoryID`),
  CONSTRAINT `FK987q0koesbyk7oqky7lg431xr` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`categoryID`),
  CONSTRAINT `FKdy51ybcflnf4vwoo6p2o1dmif` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('PD001','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/plant3-free-img.jpg','Boncellensis Secullant',37.24,10,0,5,'CATE001'),('PD002','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/cactus2-free-img-768x768.jpg','Cleistocactus',47.74,5,12.5,4,'CATE002'),('PD003','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/cactus6-free-img.jpg','Star Cactus',31.98,5,12.5,4,'CATE002'),('PD004','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/plant5-free-img.jpg','Green Soil Lotus',27.41,10,0,5,'CATE001'),('PD005','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/plant1-free-img.jpg','Aluminum Plant',23.23,10,0,5,'CATE001'),('PD006','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/plant2-collection.jpg','Ball Cactus',37.83,10,0,5,'CATE002'),('PD007','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/plant4-free-img.jpg','Piorro Quisquam',10.82,10,0,5,'CATE001'),('PD009','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/plant6-free-img.jpg','Rattle Snake Tail',36.05,10,0,5,'CATE001'),('PD010','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/plant7-collection.jpg','Mini San Pedro Cactus',42.58,10,0,5,'CATE002'),('PD011','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/plant1-free-img.jpg','Money Plant',13.61,10,0,5,'CATE001'),('PD012','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/plant1-collection.jpg','Aluminum Plant',11.89,10,0,5,'CATE001'),('PD013','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/barrel_cactus.jpg','Barrel Cactus',39.88,10,0,5,'CATE002'),('PD014','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/christmas-cactus-.jpg','Christmas Cactus',40.05,10,0,5,'CATE002'),('PD015','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/crown-cactus.jpg','Crown Cactus',32.17,10,0,5,'CATE002'),('PD016','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/easter-cactus.jpg','Easter Cactus',19.01,10,0,5,'CATE002'),('PD017','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/fishbone-cactus.jpg','Fishbone Cactus',37.6,10,0,5,'CATE002'),('PD018','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/fishhook-cactus.jpg','Fishhook Cactus',25.69,10,0,5,'CATE002'),('PD019','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/ladyfinger-cactus.jpg','Lady Finger Cactus',20.34,10,0,5,'CATE002'),('PD020','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/moon-cactus.jpg','Moon Cactus',12.24,10,0,5,'CATE002'),('PD021','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/organ-pipe-cactus.jpg','Organ Pipe Cactus',40.01,10,0,5,'CATE002'),('PD022','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/peyote-cactus.jpg','Peyote Cactus',46.59,10,0,5,'CATE002'),('PD023','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/queen-of-the-night.jpg','Queen of the Night',43.72,10,0,5,'CATE002'),('PD024','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/saguaro_cactus.jpg','Saguaro Cactus',38.55,10,0,5,'CATE002'),('PD025','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/silver-ball-cactus.jpg','Silver Ball Cactus',12.01,10,0,5,'CATE002'),('PD026','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/spherical_cactus.jpg','Spherical Cactus',23.87,10,0,5,'CATE002'),('PD027','Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur adipisci velit, sed quia non numquam eius modi tempora incidunt lores ta porro ame. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet.','images/prickly-pear-cactus.jpg','Prickly Pear Cactus',27.87,10,0,5,'CATE002');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `reviewid` varchar(20) NOT NULL,
  `NameUser` varchar(100) DEFAULT NULL,
  `EmailUser` varchar(100) DEFAULT NULL,
  `NumberStar` int DEFAULT NULL,
  `productID` varchar(255) DEFAULT NULL,
  `MainReivew` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reviewid`),
  KEY `FKftgi0x4moy1aasb348go3ncdr` (`productID`),
  CONSTRAINT `FKftgi0x4moy1aasb348go3ncdr` FOREIGN KEY (`productID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('RV001','Tome Cruise','example@gmail.com',5,'PD001','Beautiful!'),('RV002','Tom Haley','example@gmail.com',5,'PD001','Great!'),('RV003','Tom Haley','example@gmail.com',5,'PD001','Great!'),('RV004','Iron Man','example@gmail.com',5,'PD001','Beautiful!'),('RV005','Tom Haley','example@gmail.com',5,'PD001','Good to me!'),('RV006','Tom Haley','example@gmail.com',5,'PD001','Good to me!'),('RV007','Tommy Cui','example@gmail.com',5,'PD001','Oh my god!'),('RV008','Hulk Panda','example@gmail.com',5,'PD001','Boncellensis Secullant is so beautiful. I love this.'),('RV009','The Flash','example@gmail.com',5,'PD001','The first time see the Boncellensis Secullant'),('RV010','Superman','example@gmail.com',4,'PD001','So beautiful! I love that'),('RV011','Doraemon','example@gmail.com',5,'PD001','Boncellensis Secullant is beautiful'),('RV012','Nobita','example@gmail.com',5,'PD017','It\'s fucking beautiful!'),('RV013','Nobita','example@gmail.com',5,'PD017','It\'s fucking beautiful!'),('RV014','Nobita','example@gmail.com',5,'PD019','Awsome'),('RV015','Doraemon','example@gmail.com',5,'PD018','Oh my god. I haven\'t seen it yet.'),('RV016','Doraemon','example@gmail.com',5,'PD021','Beautiful!'),('RV017','Doraemon','example@gmail.com',5,'PD023','That looks nice!'),('RV018','Tommy Cuie','example@gmail.com',5,'PD004','Wonderful!'),('RV019','Doraemon','example@gmail.com',5,'PD004','Exactly what I\'m looking for!'),('RV020','Tommy Cuie','anhchuyen7a@gmail.com',5,'PD004','Exactly what I\'m looking for!'),('RV021','Doraemon','example@gmail.com',5,'PD004','Why did you copy me ?'),('RV022','Doraemi','example@gmail.com',5,'PD018','Oh my god. I haven\'t seen it yet. It\'s so cool.'),('RV023','Doraemon','example@gmail.com',5,'PD013','Good to see!'),('RV024','Doraemon','example@gmail.com',5,'PD016','The Anh luoi hoc'),('RV025','Doraemi','van@gmail.com',5,'PD005','Hheheh, looks beautiful');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` varchar(255) NOT NULL,
  `UserPassword` varchar(255) DEFAULT NULL,
  `UserAvatar` varchar(255) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `UserRole` varchar(255) DEFAULT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('US001','123','images/teammate-1.png','admin','1','Park','Sang Hoo','FPT Telecom','Vietnam','Ha Noi','Number 5, Co Bong, Tho Xuan','0978720503','example@gmail.com'),('US002','123','images/teammate-2.png','user1','1','Lee','Chin Hoo','FPT Telecom','Vietnam','Ha Noi','Number 5, Co Bong, Tho Xuan','0978720503','abc@gmail.com'),('US003','123','images/teammate-2.png','user2','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_coupon`
--

DROP TABLE IF EXISTS `user_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_coupon` (
  `CouponID` varchar(255) NOT NULL,
  `uID` varchar(255) NOT NULL,
  `Status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uID`,`CouponID`),
  KEY `FKoo7wau70do5qk0nr90ss0jsbe` (`CouponID`),
  CONSTRAINT `FKbnitopmhki1116pc9rqq14b15` FOREIGN KEY (`uID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `FKisrrjuxhji091s5p4fhpom9yx` FOREIGN KEY (`uID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `FKoo7wau70do5qk0nr90ss0jsbe` FOREIGN KEY (`CouponID`) REFERENCES `coupon` (`CouponID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_coupon`
--

LOCK TABLES `user_coupon` WRITE;
/*!40000 ALTER TABLE `user_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'plantshop'
--

--
-- Dumping routines for database 'plantshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-20 17:03:36
