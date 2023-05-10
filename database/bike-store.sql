-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bike-store
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `ct_don_hang`
--

DROP TABLE IF EXISTS `ct_don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ct_don_hang` (
  `MaDH` char(13) NOT NULL,
  `MaSP` varchar(20) NOT NULL,
  `SoLuong` int NOT NULL,
  KEY `MaDH` (`MaDH`),
  CONSTRAINT `ct_don_hang_ibfk_1` FOREIGN KEY (`MaDH`) REFERENCES `don_hang` (`MaDH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ct_don_hang`
--

LOCK TABLES `ct_don_hang` WRITE;
/*!40000 ALTER TABLE `ct_don_hang` DISABLE KEYS */;
INSERT INTO `ct_don_hang` VALUES ('1683219151070','TC003TRANGXANH',1),('1683219151070','TC006XANH',1),('1683219194758','XG004TRANG',1),('1683219194758','XG004XANH',1),('1683219235010','PL001XANH',1),('1683219235010','TC012NAU',1),('1683219235010','TC013DOXANH',1),('1683219383514','TC007DEN',1),('1683219383514','TC007DO',1),('1683219383514','TC007TRANG',1),('1683219383514','TC007XANH',1),('1683278729027','XM003DO',1),('1683278729027','XM003XANH',1),('1683278762157','XG003DEN',1);
/*!40000 ALTER TABLE `ct_don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_hang` (
  `MaDH` char(13) NOT NULL,
  `NguoiDat` varchar(45) NOT NULL,
  `NgayDat` datetime NOT NULL,
  `TongTien` bigint NOT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaDH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_hang`
--

LOCK TABLES `don_hang` WRITE;
/*!40000 ALTER TABLE `don_hang` DISABLE KEYS */;
INSERT INTO `don_hang` VALUES ('1683219151070','Trần Khang Thịnh','2023-05-04 23:52:31',772000000,'Đã hoàn thành'),('1683219194758','Nguyễn Hữu Khiêm','2023-05-04 23:53:15',62000000,'Đã huỷ'),('1683219235010','Cristiano Ronaldo','2023-05-04 23:53:55',2800000000,'Đã hoàn thành'),('1683219383514','Ông Liêm','2023-05-04 23:56:24',184000000,'Đã huỷ'),('1683278729027','abc','2023-05-05 16:25:29',62000000,'Đã hoàn thành'),('1683278762157','abc','2023-05-05 16:26:02',58000000,'Đã huỷ');
/*!40000 ALTER TABLE `don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dong_san_pham`
--

DROP TABLE IF EXISTS `dong_san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dong_san_pham` (
  `MaDSP` char(5) NOT NULL DEFAULT '""',
  `TenDSP` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MaLoaiSP` char(2) NOT NULL,
  `Gia` int NOT NULL,
  `MaLoaiDongCo` int NOT NULL,
  `DongCo` int NOT NULL,
  `Thumbnail` varchar(150) DEFAULT NULL,
  `Hero` varchar(150) DEFAULT NULL,
  `ThongSoSP` json DEFAULT NULL,
  PRIMARY KEY (`MaDSP`),
  KEY `MALOAISP_idx` (`MaLoaiSP`),
  KEY `FK_MaLoaiDongCo_idx` (`MaLoaiDongCo`),
  CONSTRAINT `FK_MaLoaiDongCo` FOREIGN KEY (`MaLoaiDongCo`) REFERENCES `loai_dong_co` (`MaLoaiDongCo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dong_san_pham`
--

LOCK TABLES `dong_san_pham` WRITE;
/*!40000 ALTER TABLE `dong_san_pham` DISABLE KEYS */;
/*!40000 ALTER TABLE `dong_san_pham` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auto_generate_product_id` BEFORE INSERT ON `dong_san_pham` FOR EACH ROW BEGIN
  DECLARE next_MaDSP INT;
  DECLARE MaLoaiSP CHAR(2);
  SET MaLoaiSP = NEW.MaLoaiSP;
  
  SELECT COALESCE(MAX(SUBSTRING(MaDSP, 3)), 0) + 1 INTO next_MaDSP
  FROM dong_san_pham
  WHERE SUBSTRING(MaDSP, 1, 2) = MaLoaiSP;
  
  SET NEW.MaDSP = CONCAT(MaLoaiSP, LPAD(next_MaDSP, 3, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `loai_dong_co`
--

DROP TABLE IF EXISTS `loai_dong_co`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_dong_co` (
  `MaLoaiDongCo` int NOT NULL AUTO_INCREMENT,
  `TenLoaiDongCo` tinytext NOT NULL,
  PRIMARY KEY (`MaLoaiDongCo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_dong_co`
--

LOCK TABLES `loai_dong_co` WRITE;
/*!40000 ALTER TABLE `loai_dong_co` DISABLE KEYS */;
INSERT INTO `loai_dong_co` VALUES (1,'Loại 1'),(2,'Loại 2'),(3,'Loại 3'),(4,'Loại 4'),(5,'Loại 5'),(6,'Loại 6'),(7,'Loại 7');
/*!40000 ALTER TABLE `loai_dong_co` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_san_pham`
--

DROP TABLE IF EXISTS `loai_san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_san_pham` (
  `MaLoaiSP` char(2) NOT NULL,
  `TenLoaiSP` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaLoaiSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_san_pham`
--

LOCK TABLES `loai_san_pham` WRITE;
/*!40000 ALTER TABLE `loai_san_pham` DISABLE KEYS */;
INSERT INTO `loai_san_pham` VALUES ('PL','Phân khối lớn'),('TC','Xe tay côn'),('XG','Xe tay ga'),('XS','Xe số');
/*!40000 ALTER TABLE `loai_san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phan_quyen`
--

DROP TABLE IF EXISTS `phan_quyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phan_quyen` (
  `MaPhanQuyen` int NOT NULL,
  `MaQuyen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phan_quyen`
--

LOCK TABLES `phan_quyen` WRITE;
/*!40000 ALTER TABLE `phan_quyen` DISABLE KEYS */;
INSERT INTO `phan_quyen` VALUES (1,1),(1,3),(2,1),(2,2),(2,3),(4,1),(4,2),(4,3),(4,4);
/*!40000 ALTER TABLE `phan_quyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quyen`
--

DROP TABLE IF EXISTS `quyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quyen` (
  `MaQuyen` int NOT NULL,
  `TenQuyen` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaQuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quyen`
--

LOCK TABLES `quyen` WRITE;
/*!40000 ALTER TABLE `quyen` DISABLE KEYS */;
INSERT INTO `quyen` VALUES (1,'Xem sản phẩm'),(2,'Sửa/xoá sản phẩm'),(3,'Xem và cập nhật đơn hàng'),(4,'Phân quyền nhân viên');
/*!40000 ALTER TABLE `quyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `san_pham` (
  `MaSP` varchar(20) NOT NULL,
  `MaDSP` char(5) NOT NULL,
  `TenMau` varchar(50) NOT NULL,
  `Kho` int NOT NULL,
  `Image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`MaSP`),
  KEY `MaDSP` (`MaDSP`),
  CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`MaDSP`) REFERENCES `dong_san_pham` (`MaDSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('SqBb4HN-oMCBQpZNC01-jSUOhYCdF5Uh',1683992548,'{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2023-05-13T15:42:28.152Z\",\"httpOnly\":true,\"path\":\"/\"},\"flashedData\":null,\"uid\":null,\"username\":\"admin\",\"role\":3}'),('_MpmL65XMmk-L3T7WsD8Ap2PFZsp4hlR',1683972310,'{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2023-05-11T01:34:33.513Z\",\"httpOnly\":true,\"path\":\"/\"},\"flashedData\":null,\"uid\":null,\"username\":\"admin\",\"role\":3}'),('vqasTyQvByMj_6WQ0jS9OYjQcp19AhQd',1683768252,'{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2023-05-11T01:21:19.720Z\",\"httpOnly\":true,\"path\":\"/\"},\"flashedData\":null,\"uid\":\"1\",\"username\":\"admin\",\"role\":3,\"cart\":{\"items\":[{\"product\":{\"MaSP\":\"XM004DODEN\",\"MaDSP\":\"XM004\",\"TenMau\":\"Đỏ đen\",\"Kho\":3,\"Image\":\"41360f92-0f81-4ae6-8d8d-2c03b5950589-wwNzjZzNfijQ4YV0OQ8v.png\",\"ImagePath\":\"product-data/img/41360f92-0f81-4ae6-8d8d-2c03b5950589-wwNzjZzNfijQ4YV0OQ8v.png\",\"ImageUrl\":\"/products/assets/img/41360f92-0f81-4ae6-8d8d-2c03b5950589-wwNzjZzNfijQ4YV0OQ8v.png\",\"TenDSP\":\"Wave RSX FI 110\",\"Gia\":22000000},\"quantity\":\"5\",\"totalPrice\":110000000},{\"product\":{\"MaSP\":\"XM003DO\",\"MaDSP\":\"XM003\",\"TenMau\":\"Đỏ\",\"Kho\":7,\"Image\":\"34c60824-d0d7-4d8d-a1ac-c32a7ffd29e2-rlEEDjTrd0E9y8k5uHEN.png\",\"ImagePath\":\"product-data/img/34c60824-d0d7-4d8d-a1ac-c32a7ffd29e2-rlEEDjTrd0E9y8k5uHEN.png\",\"ImageUrl\":\"/products/assets/img/34c60824-d0d7-4d8d-a1ac-c32a7ffd29e2-rlEEDjTrd0E9y8k5uHEN.png\",\"TenDSP\":\"Future 125 FI\",\"Gia\":31000000},\"quantity\":\"2\",\"totalPrice\":62000000},{\"product\":{\"MaSP\":\"XM003TRANG\",\"MaDSP\":\"XM003\",\"TenMau\":\"Trắng\",\"Kho\":10,\"Image\":\"816d6342-faa2-4075-a74c-c7ce4eb18c41-mTuI6iTbdYCOkHBMnsNw.png\",\"ImagePath\":\"product-data/img/816d6342-faa2-4075-a74c-c7ce4eb18c41-mTuI6iTbdYCOkHBMnsNw.png\",\"ImageUrl\":\"/products/assets/img/816d6342-faa2-4075-a74c-c7ce4eb18c41-mTuI6iTbdYCOkHBMnsNw.png\",\"TenDSP\":\"Future 125 FI\",\"Gia\":31000000},\"quantity\":\"2\",\"totalPrice\":62000000},{\"product\":{\"MaSP\":\"TC005DO\",\"MaDSP\":\"TC005\",\"TenMau\":\"Đỏ\",\"Kho\":1,\"Image\":\"65791ec8-856d-4c05-b0a0-d90d1fd38eef-wmtKhw2HE9NQpoVl9yaz.jpg\",\"ImagePath\":\"product-data/img/65791ec8-856d-4c05-b0a0-d90d1fd38eef-wmtKhw2HE9NQpoVl9yaz.jpg\",\"ImageUrl\":\"/products/assets/img/65791ec8-856d-4c05-b0a0-d90d1fd38eef-wmtKhw2HE9NQpoVl9yaz.jpg\",\"TenDSP\":\"Rebel 500 2023\",\"Gia\":181000000},\"quantity\":1,\"totalPrice\":181000000},{\"product\":{\"MaSP\":\"TC005XANH\",\"MaDSP\":\"TC005\",\"TenMau\":\"Xám\",\"Kho\":3,\"Image\":\"1b59d5a5-3233-4c68-922c-28b2068b1d7c-ruZSLSBcmBdk729bE5zi.jpg\",\"ImagePath\":\"product-data/img/1b59d5a5-3233-4c68-922c-28b2068b1d7c-ruZSLSBcmBdk729bE5zi.jpg\",\"ImageUrl\":\"/products/assets/img/1b59d5a5-3233-4c68-922c-28b2068b1d7c-ruZSLSBcmBdk729bE5zi.jpg\",\"TenDSP\":\"Rebel 500 2023\",\"Gia\":181000000},\"quantity\":1,\"totalPrice\":181000000},{\"product\":{\"MaSP\":\"XG003TRANG\",\"MaDSP\":\"XG003\",\"TenMau\":\"Trắng\",\"Kho\":4,\"Image\":\"6292eb12-9008-4559-82ab-50c91c7088b3-ifWFSEQJkaCT4jEnrVcy.png\",\"ImagePath\":\"product-data/img/6292eb12-9008-4559-82ab-50c91c7088b3-ifWFSEQJkaCT4jEnrVcy.png\",\"ImageUrl\":\"/products/assets/img/6292eb12-9008-4559-82ab-50c91c7088b3-ifWFSEQJkaCT4jEnrVcy.png\",\"TenDSP\":\"Sh mode 125cc\",\"Gia\":58000000},\"quantity\":2,\"totalPrice\":116000000},{\"product\":{\"MaSP\":\"XG003DO\",\"MaDSP\":\"XG003\",\"TenMau\":\"ĐỎ\",\"Kho\":7,\"Image\":\"4c0a0b46-ade8-4f3f-85f9-c71967b7a118-RwFlE5cIdGVu3dWbNaYF.png\",\"ImagePath\":\"product-data/img/4c0a0b46-ade8-4f3f-85f9-c71967b7a118-RwFlE5cIdGVu3dWbNaYF.png\",\"ImageUrl\":\"/products/assets/img/4c0a0b46-ade8-4f3f-85f9-c71967b7a118-RwFlE5cIdGVu3dWbNaYF.png\",\"TenDSP\":\"Sh mode 125cc\",\"Gia\":58000000},\"quantity\":1,\"totalPrice\":58000000},{\"product\":{\"MaSP\":\"XG003XANH\",\"MaDSP\":\"XG003\",\"TenMau\":\"Xám\",\"Kho\":5,\"Image\":\"3dab9dc3-fa1c-44db-a8fc-63a19e26925e-BLeKgU273qamvxR9LCZA.png\",\"ImagePath\":\"product-data/img/3dab9dc3-fa1c-44db-a8fc-63a19e26925e-BLeKgU273qamvxR9LCZA.png\",\"ImageUrl\":\"/products/assets/img/3dab9dc3-fa1c-44db-a8fc-63a19e26925e-BLeKgU273qamvxR9LCZA.png\",\"TenDSP\":\"Sh mode 125cc\",\"Gia\":58000000},\"quantity\":2,\"totalPrice\":116000000},{\"product\":{\"MaSP\":\"XG003DODEN\",\"MaDSP\":\"XG003\",\"TenMau\":\"Đỏ đen\",\"Kho\":3,\"Image\":\"3c92bf73-c23b-4824-aecc-b138c09966c0-1uDqdLnICRlyqe8TSNza.png\",\"ImagePath\":\"product-data/img/3c92bf73-c23b-4824-aecc-b138c09966c0-1uDqdLnICRlyqe8TSNza.png\",\"ImageUrl\":\"/products/assets/img/3c92bf73-c23b-4824-aecc-b138c09966c0-1uDqdLnICRlyqe8TSNza.png\",\"TenDSP\":\"Sh mode 125cc\",\"Gia\":58000000},\"quantity\":1,\"totalPrice\":58000000},{\"product\":{\"MaSP\":\"XG003XANHDEN\",\"MaDSP\":\"XG003\",\"TenMau\":\"Xanh đen\",\"Kho\":2,\"Image\":\"e64f8fdf-3a55-4990-a4d5-2f0d63dba38c-AvewE7i9BJl2eQ7gykis (1).png\",\"ImagePath\":\"product-data/img/e64f8fdf-3a55-4990-a4d5-2f0d63dba38c-AvewE7i9BJl2eQ7gykis (1).png\",\"ImageUrl\":\"/products/assets/img/e64f8fdf-3a55-4990-a4d5-2f0d63dba38c-AvewE7i9BJl2eQ7gykis (1).png\",\"TenDSP\":\"Sh mode 125cc\",\"Gia\":58000000},\"quantity\":1,\"totalPrice\":58000000}],\"totalQuantity\":18,\"totalPrice\":1002000000}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tai_khoan`
--

DROP TABLE IF EXISTS `tai_khoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tai_khoan` (
  `IDTaiKhoan` int NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(45) NOT NULL,
  `MatKhau` varchar(80) NOT NULL,
  `Email` varchar(80) NOT NULL,
  `HoTen` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NgayTao` date NOT NULL,
  `MaPhanQuyen` int DEFAULT '0',
  PRIMARY KEY (`IDTaiKhoan`),
  KEY `MaPhanQuyen_idx` (`MaPhanQuyen`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoan`
--

LOCK TABLES `tai_khoan` WRITE;
/*!40000 ALTER TABLE `tai_khoan` DISABLE KEYS */;
INSERT INTO `tai_khoan` VALUES (1,'admin','$2a$12$Fy2oeINplxsL1cB99C0lZuanONPYWLstos4Ca9M5ocpS7XGadj1Ce','admin@head.com','Admin','2023-04-20',3),(5,'thinhcb','$2a$12$K/eOm1GiNPLxaKo75.qDQeZv/8j4QkcFY5WxcGgGbbEJUXPL0oofq','khangthinhproz@gmail.com','Trần Khang Thịnh','2023-05-03',1),(6,'phatboy222','$2a$12$N1l0XYSmFGUaSEfBA41VUePwX7m9jdNIiFDWaCm/bN8msh6mSNT3m','test@gmail.com','Châu Nhuận Phát','2023-05-04',0),(7,'bietongliemkhong','$2a$12$9G2imd37pgX1fqfxwPefM.GkXEgS3DEpw6TR2H2s.VSfFqq19jnDy','test1@gmail.com','Ông Liêm','2023-05-04',0),(8,'dotiend','$2a$12$0BPjh3elCBqIiZSZExT3Bu8ycMz9OuDfUHnOahBozVJUXvS/r1.2a','datngu@gmail.com','Tiến Đạt','2023-05-04',2),(9,'siuuuuuu','$2a$12$IJ5NFl4rxEciWLE/10bgyOF2wqHv4S0VTnBQ1e6Q4felL7jrstmam','test2@gmail.com','Cristiano Ronaldo','2023-05-04',0),(10,'hk2003','$2a$12$Qfh3b8D.lgbK5rZzheg6kOw8DGKznVDZY4MAZNVOdOgZGxHZfx.bC','test3@gmail.com','Nguyễn Hữu Khiêm','2023-05-04',0);
/*!40000 ALTER TABLE `tai_khoan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-10 22:54:51
