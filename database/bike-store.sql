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
  `SoLuong` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ct_don_hang`
--

LOCK TABLES `ct_don_hang` WRITE;
/*!40000 ALTER TABLE `ct_don_hang` DISABLE KEYS */;
INSERT INTO `ct_don_hang` VALUES ('1683219151070','TC003TRANGXANH',1),('1683219151070','TC006XANH',1),('1683219194758','XG004TRANG',1),('1683219194758','XG004XANH',1),('1683219235010','PL001XANH',1),('1683219235010','TC012NAU',1),('1683219235010','TC013DOXANH',1),('1683219383514','TC007DEN',1),('1683219383514','TC007DO',1),('1683219383514','TC007TRANG',1),('1683219383514','TC007XANH',1);
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
INSERT INTO `don_hang` VALUES ('1683219151070','Trần Khang Thịnh','2023-05-04 23:52:31',772000000,'Đang xử lí'),('1683219194758','Nguyễn Hữu Khiêm','2023-05-04 23:53:15',62000000,'Đang xử lí'),('1683219235010','Cristiano Ronaldo','2023-05-04 23:53:55',2800000000,'Đã hoàn thành'),('1683219383514','Ông Liêm','2023-05-04 23:56:24',184000000,'Đã huỷ');
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
  `DongCo` int NOT NULL,
  `Thumbnail` varchar(150) DEFAULT NULL,
  `Hero` varchar(150) DEFAULT NULL,
  `ThongSoSP` json DEFAULT NULL,
  PRIMARY KEY (`MaDSP`),
  KEY `MALOAISP_idx` (`MaLoaiSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dong_san_pham`
--

LOCK TABLES `dong_san_pham` WRITE;
/*!40000 ALTER TABLE `dong_san_pham` DISABLE KEYS */;
INSERT INTO `dong_san_pham` VALUES ('PL001','Gold Wing phiên bản 2022','PL',1250000000,1800,'3cdcfe23-a239-430b-a9bd-1e05a8911be1-lq4PRZXt3a4kKjmdTgcv.png','5002d75a-63f6-4d39-8ffc-2040faa912a2-sbfzQV8FgZndVTW3hUfQ.jpg','{\"BinhXang\": \"21 lít\", \"ChieuCao\": \"788 cm\", \"DungTich\": \"1.833 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 6 xi lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"5,53 lít/100 km\", \"TrongLuong\": \"390 kg\", \"CongSuatMax\": \"93 kW tại 5.500 vòng/phút\", \"MomenXoanMax\": \"170 Nm tại 4.500 vòng/phút\"}'),('TC001','CBR 150R','TC',72890000,150,'b4e09c24-0994-4489-85bf-87b4d5ac5a69-2pSqu65qdei9HLkHfOtJ.png','b098b35e-b7d3-47b3-8926-81daa1ca67af-XhNQ54yFln2AoXzLg3du.jpg','{\"BinhXang\": \"12 lít\", \"ChieuCao\": \"788 mm\", \"DungTich\": \" 149,2 cm3\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 1 xi lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"2,91l/100km\", \"TrongLuong\": \"139kg\", \"CongSuatMax\": \"12,6kW/9.000 vòng/phút\", \"MomenXoanMax\": \"14,4Nm/7.000 vòng/phút\"}'),('TC002','CB650R phiên bản 2023','PL',246900000,650,'9f45b7fd-e7eb-4a0b-99a2-cd14d4abf44c-uF4hQaZEiZKgccdUWWVj.jpg','72fa5152-adc9-4dbb-940f-6490d3cfeead-biNxC8NwynE0L740qqjC.jpg','{\"BinhXang\": \"15 Lít\", \"ChieuCao\": \"810 cm\", \"DungTich\": \" 649 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \"4 kỳ, 4 xy-lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"4,99 lít/100km\", \"TrongLuong\": \"202 kg\", \"CongSuatMax\": \"61,7 kW/ 10.000 vòng/ phút\", \"MomenXoanMax\": \" 63 Nm/ 9.500 vòng/ phút\"}'),('TC003','Africa Twin 2023 Adventure Sports','PL',721000000,1100,'adc4708c-da7c-4e07-8600-0fb2d972ee71-9io11b4xf5cNvb0h7xC8.jpg','d9b158e1-4c70-412b-9b45-6f9dc8d818cf-qxBbgqqOOEBCzLrNqEG2.jpg','{\"BinhXang\": \" 24,8 Lít\", \"ChieuCao\": \"788 mm\", \"DungTich\": \" 1.084 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \"4 kỳ, 2 xi-lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"\", \"TrongLuong\": \"213 kg\", \"CongSuatMax\": \"75kW/ 7.500 vòng/ phút\", \"MomenXoanMax\": \"105Nm/ 6.250 vòng/ phút\"}'),('TC004',' Africa Twin 2023 Phiên bản Tiêu chuẩn','PL',591000000,1100,'001baa4f-e5d2-46f8-a2ca-f0054725d399-h5vAHF245L1x8JVmmTdN.jpg','8571aca9-d56b-4424-a110-806794ff818f-W7uZPzI9g60jFrI9O45V.jpg','{\"BinhXang\": \" 24,8 Lít\", \"ChieuCao\": \"788 cm\", \"DungTich\": \" 1.084 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \"4 kỳ, 2 xi-lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"\", \"TrongLuong\": \" 229 kg\", \"CongSuatMax\": \"75kW/ 7.500 vòng/ phút\", \"MomenXoanMax\": \"105Nm/ 6.250 vòng/ phút\"}'),('TC005','Rebel 500 2023','PL',181000000,500,'9d472a88-ca32-4fea-b880-f3ac3b6252d2-IrgZ7A5q9PUVAaHNWH1S.jpg','d279ad3f-da4a-4161-a4a4-7c4709d6fb0a-Lfx27f7C9J2agck7KdJn.jpg','{\"BinhXang\": \" 11,2 Lít\", \"ChieuCao\": \"690 cm\", \"DungTich\": \"471 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \"DOHC, 4 kỳ, 2 xy-lanh, PGM-FI, làm mát bằng chất lỏng.\", \"MucTieuHao\": \" 3,42 lít/100km\", \"TrongLuong\": \" 190 kg\", \"CongSuatMax\": \" 33,5 kW tại 8500 vòng/phút\", \"MomenXoanMax\": \"43,3 Nm tại 6000 vòng/phút\"}'),('TC006','Honda VARIO 160','XG',51000000,160,'1688af26-c17d-4cef-a5cb-eafe177e6bbf-3NsTtbQnERXX3VDbaoks.png','b8b64bd4-d81f-4ea5-a130-254e0b71683e-CGfrUh6EH69VqCclQqiv.jpg','{\"BinhXang\": \"5.5 Lít\", \"ChieuCao\": \"690 cm\", \"DungTich\": \"156,9 cm³\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 1 xi lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"2,20 lít/100km\", \"TrongLuong\": \"139kg\", \"CongSuatMax\": \" 11,3kW/8.500 vòng/phút\", \"MomenXoanMax\": \" 14,1 N・m/6.500 vòng/phút\"}'),('TC007','Winner X','TC',46000000,150,'92037a77-7873-41c0-a9f5-924225c7c8b4-9htoKzh1CZ6775JtOztP.png','b5f5ccdc-54cb-49fe-a2ad-5919a3cc9fc1-ymFtMSRUxhahQG3kn0YU.jpg','{\"BinhXang\": \"4.8 L\", \"ChieuCao\": \"788 cm\", \"DungTich\": \" 149,2 cm3\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 4 van, làm mát bằng dung dịch\", \"MucTieuHao\": \"2,91l/100km\", \"TrongLuong\": \"139kg\", \"CongSuatMax\": \" 11,5kW/9.000 vòng/phút\", \"MomenXoanMax\": \"14,4Nm/7.000 vòng/phút\"}'),('TC008','CBR500R 2022','PL',192000000,500,'a4a2250b-beed-461f-a646-f8d1bd6e9dd2-0fuVUozl9BEsLqJwjCJE.jpg','6f8c702d-4477-42ab-a920-5e6a22e48892-JCqCTLtm6ut04NB8btk1.jpg','{\"BinhXang\": \"17,1 lít\", \"ChieuCao\": \"788 cm\", \"DungTich\": \" 471 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 2 xy-lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \" 3,59 lít/100 km\", \"TrongLuong\": \" 192 kg\", \"CongSuatMax\": \" 35 kW tại 8.600 vòng/phút\", \"MomenXoanMax\": \"43 Nm tại 6.500 vòng/phút\"}'),('TC009','CB500X 2022','PL',194000000,500,'287f97b9-b801-4f80-9d36-15c096d86077-4sIOHkPjfDynvVPaLF1j.jpg','e750c189-0504-4530-add0-a7dfa60df208-8VCOYnCwP4nKsTClij3R.jpg','{\"BinhXang\": \"16,2 lít\", \"ChieuCao\": \"788 cm\", \"DungTich\": \" 471 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 2 xy-lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"4,99 lít/100km\", \"TrongLuong\": \" 172 kg\", \"CongSuatMax\": \" 35 kW tại 8.600 vòng/phút\", \"MomenXoanMax\": \" 43 Nm tại 6.500 vòng/phút\"}'),('TC010','CB500F 2022','PL',180000000,500,'4f35babc-bfd3-4435-9bb0-20fc50a93b42-A12M6V57z2Hk5f2Ctmbq.jpg','32dbf76b-8a86-4bce-8caf-0c78c9faf134-Ni0N9LSewW5cR2MP8uLK.jpg','{\"BinhXang\": \"15 Lít\", \"ChieuCao\": \"810 cm\", \"DungTich\": \" 471 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \"4 kỳ, 2 xi-lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \" 3.63 l/100km\", \"TrongLuong\": \"213 kg\", \"CongSuatMax\": \" 35 kW tại 8.600 vòng/phút\", \"MomenXoanMax\": \" 63 Nm/ 9.500 vòng/ phút\"}'),('TC011','CB150R The Streetster','TC',105000000,150,'fbeac3a8-b0ea-4d79-a152-8b62167a1726-x8ZCNtM5g2QRGQl4udo8.png','b7176726-1fe0-40a6-b9f5-f555b6c32f72-J9a8xOS3etcc9W3tU50c.jpg','{\"BinhXang\": \"12 lít\", \"ChieuCao\": \"788 cm\", \"DungTich\": \" 149,2 cm3\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 1 xi lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"2,91l/100km\", \"TrongLuong\": \"139kg\", \"CongSuatMax\": \"12,6kW/9.000 vòng/phút\", \"MomenXoanMax\": \"14,4Nm/7.000 vòng/phút\"}'),('TC012','Rebel 1100 phiên bản 2022 DCT','PL',500000000,1100,'f608681c-3f7b-46de-8b96-d2eb1f4d1c53-8n4PZOMJWHSXTSdMTDXr.png','38b031a4-4f84-4548-9b1f-f4ae96865b3e-RKB5wdexWshNijLGmj4D.jpg','{\"BinhXang\": \"13,6 lít\", \"ChieuCao\": \"788 cm\", \"DungTich\": \"1.084 cm3\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 2 xy-lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"5,3 l/100 km\", \"TrongLuong\": \"233 Kg\", \"CongSuatMax\": \"64 kW tại 7.000 vòng/phút\", \"MomenXoanMax\": \" 98 Nm tại 4.750 vòng/phút\"}'),('TC013','CBR1000RR-R Fireblade SP','PL',1050000000,1000,'455542bb-3edb-4ff0-9802-70c30b14ce33-8WKM4mZgOuXRyTDrSzhN.png','75a904f4-46f6-4818-a76d-db19032b1174-T0IMBNB1kz8bv6GHlfLX.png','{\"BinhXang\": \"16.1 L\", \"ChieuCao\": \"788 cm\", \"DungTich\": \" 1.000 cm³\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \"4 kỳ, 4 xy-lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"6,3 lít / 100km\", \"TrongLuong\": \"201kg\", \"CongSuatMax\": \" 160Kw/14.500 vòng/phút\", \"MomenXoanMax\": \"113Nm/12.500 vòng/phút\"}'),('XG001','CB1000R 2023','PL',510500000,1000,'1169a9d2-4d15-44b3-8ddb-6adeedd0596d-ceAulU1zOpfVrZ683HgP.jpg','c5d30f4a-2ba5-40f5-99b1-8cef2357d71f-KicOouA6KsnfBk1mti82.jpg','{\"BinhXang\": \"16,2 lít\", \"ChieuCao\": \"830 cm\", \"DungTich\": \"998 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \"4 kỳ, 4 xy-lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \" 5,95 lít/100km\", \"TrongLuong\": \"213 kg\", \"CongSuatMax\": \"107 kW tại 10.500 vòng/phút\", \"MomenXoanMax\": \"104 Nm tại 8.250 vòng/phút\"}'),('XG002','CBR650R phiên bản 2023','PL',254990000,650,'d9a3568e-4d28-4e36-b163-811c3456febf-FC1hDvw1eSb9V0Aflrcg.jpg','96a4322d-ee18-4a6d-bf11-b759c2cc437f-ZKZ3yrFxpMFjPS0ab90d.jpg','{\"BinhXang\": \"15 Lít\", \"ChieuCao\": \"810 cm\", \"DungTich\": \" 649 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \"4 kỳ, 4 xy-lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"5,17 lít/ 100km\", \"TrongLuong\": \"207 kg\", \"CongSuatMax\": \" 61,7 kW/ 10.000 vòng/ phút\", \"MomenXoanMax\": \" 63 Nm/ 9.500 vòng/ phút\"}'),('XG003','Sh mode 125cc','XG',58000000,125,'1381ff12-aec9-4eca-868f-c841f35f7645-AvewE7i9BJl2eQ7gykis.png','3cbda4af-247e-42dd-be98-4f3e1e53e05f-kM7RoUxwnzSATM0OxIqp.jpg','{\"BinhXang\": \" 5,6 lít\", \"ChieuCao\": \"788 cm\", \"DungTich\": \"124,8 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 4 van, làm mát bằng dung dịch\", \"MucTieuHao\": \" 2,16 lít/100km\", \"TrongLuong\": \"139kg\", \"CongSuatMax\": \"8,2kW/8500 vòng/phút\", \"MomenXoanMax\": \" 11,7 N.m/5000 vòng/phút\"}'),('XG004','Vision','XG',31000000,115,'3e320c77-bc78-4f77-af74-d5ab4fc879f8-CBeDSJaY11KQoo5RYhuL.jpg','5f8f5acb-f17d-4ced-9e22-4a19af60be23-fkeaYaS5YGfjlEztEYjS.jpg','{\"BinhXang\": \"4,9 L\", \"ChieuCao\": \"788 cm\", \"DungTich\": \" 109,5 cm3\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \"Xăng, 4 kỳ, 1 xilanh, làm mát bằng không khí\", \"MucTieuHao\": \"1,85 l/100km\", \"TrongLuong\": \" 94 kg\", \"CongSuatMax\": \" 6,59 kW/7.500 rpm\", \"MomenXoanMax\": \" 6,59 kW/7.500 rpm\"}'),('XG005','SH125i','XG',75000000,125,'2b7efdfa-4d19-4579-8e2a-3ce56c55874f-gfUfURy1WBwtBbVFH4FO.png','778938ea-73aa-4218-b9f7-e305170570bd-1iweQpDWX6rFhviBD7fr.png','{\"BinhXang\": \" 7,8 L\", \"ChieuCao\": \"788 cm\", \"DungTich\": \"124.9cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 1 xi lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \" SH125i: 2,46 lít/100km\", \"TrongLuong\": \"133kg\", \"CongSuatMax\": \"9,6kW/8.250 vòng/phút \", \"MomenXoanMax\": \"12N.m/6.500 vòng/phút \"}'),('XG006','Air Blade 125','XG',42000000,125,'a46c38e5-39ae-42ec-8188-8817f21574b6-bckho9q1kDOnzCApjNpq.png','03c2c362-3a1e-412d-9caa-55e1e529120b-L3b54cTddCQUatsGE8wv.jpg','{\"BinhXang\": \" 5,7 L\", \"ChieuCao\": \"788 cm\", \"DungTich\": \"124,8 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 1 xi lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"2,91l/100km\", \"TrongLuong\": \"139kg\", \"CongSuatMax\": \"8,75kW/8.500 vòng/phút\", \"MomenXoanMax\": \"11,3Nm/6.500 vòng/phút\"}'),('XG007','LEAD 125cc','XG',40000000,125,'8ba2693c-a1a6-473f-ad03-45826a0e1011-7asMTwgZUhiX0FBRegRI.png','6f889489-eabb-432b-b333-9addc552dd75-ELAzjUmkQRG0SyOYxUU0.jpg','{\"BinhXang\": \" 6,0 lít\", \"ChieuCao\": \"690 cm\", \"DungTich\": \"124,8 cc\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 1 xi lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \"2,91l/100km\", \"TrongLuong\": \"139kg\", \"CongSuatMax\": \"8,22 kw / 8.500 rpm\", \"MomenXoanMax\": \"14,4Nm/7.000 vòng/phút\"}'),('XM001','Blade 2023','XM',20850000,110,'fe8080b9-0ecc-4256-8b0e-c33410486794-j37sLOXkDQsdX7nnBTOj.png','34c23fca-2cf3-40e0-8078-99ce62535755-yz2Q98Hbz8mYfxcrxZr5.jpg','{\"BinhXang\": \" 3,7 L\", \"ChieuCao\": \"788 cm\", \"DungTich\": \" 109,1 cm3\", \"HTKhoiDong\": \"Đạp chân/Điện\", \"LoaiDongCo\": \"Xăng, 4 kỳ, 1 xilanh, làm mát bằng không khí\", \"MucTieuHao\": \"2,91l/100km\", \"TrongLuong\": \"139kg\", \"CongSuatMax\": \"6,18 kW/7.500 vòng/phút\", \"MomenXoanMax\": \"8,65 Nm/5.500 vòng/phút\"}'),('XM002','SH350i','XG',150000000,350,'fe517b38-e0f6-4880-8876-db52527a700d-VlhEoBOm76qFSuONryD1 (1).png','93a2c254-a614-4779-bd85-a96e8fe0137d-TmKg2s72XmE2GNeptPlC.jpg','{\"BinhXang\": \" 9,3 lít\", \"ChieuCao\": \"788 cm\", \"DungTich\": \"329,6 cm3\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \" 4 kỳ, 1 xi lanh, làm mát bằng chất lỏng\", \"MucTieuHao\": \" 3.63 l/100km\", \"TrongLuong\": \" 172 kg\", \"CongSuatMax\": \" 21,5 kW/7.500 vòng/phút\", \"MomenXoanMax\": \"31,8 Nm/5.250 vòng/phút\"}'),('XM003','Future 125 FI','XM',31000000,125,'e6c99d85-b261-4aed-9f94-67d7a89eca38-mTuI6iTbdYCOkHBMnsNw.png','d4093be4-449c-4bc9-a039-dfac97eabc46-a4Ctelg2ZywkDd8aDfRT.jpg','{\"BinhXang\": \"4,6 lít\", \"ChieuCao\": \" 756 cm\", \"DungTich\": \" 124,9 cm3\", \"HTKhoiDong\": \"Điện & Đạp chân\", \"LoaiDongCo\": \"Xăng, 4 kỳ, 1 xilanh, làm mát bằng không khí\", \"MucTieuHao\": \"1.58L/100km\", \"TrongLuong\": \"104 kg\", \"CongSuatMax\": \" 6,83 kW/7.500 vòng/phút\", \"MomenXoanMax\": \" 10,2 Nm/5.500 vòng/phút\"}'),('XM004','Wave RSX FI 110','XM',22000000,110,'9ab818f1-2390-4f95-8572-17498cb9bdf9-0XrIKxCzABxGxPw18huc.png','0bf1774f-1918-485e-9c6e-ad969006ade0-R9qpquvMkTBX7Qxl94rD.jpg','{\"BinhXang\": \" 3,7 L\", \"ChieuCao\": \"788 cm\", \"DungTich\": \"109,2 cm3\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \"Xăng, 4 kỳ, 1 xilanh, làm mát bằng không khí\", \"MucTieuHao\": \"1,7l/100 km\", \"TrongLuong\": \"99 kg\", \"CongSuatMax\": \" 6,46 kW / 7.500 vòng/phút\", \"MomenXoanMax\": \" 8,7 Nm/6.000 vòng/phút\"}'),('XM005','Wave Alpha 110cc','XM',18000000,110,'82a17e2b-7a9c-46ae-9fe9-cacb40a85a72-EYpeXY7cdjjbQl2BZPed.png','17ce6d82-da54-4d9a-bdd9-8e6f6f015539-egQdQH8QNTZsVzC85trX.png','{\"BinhXang\": \" 3,7 L\", \"ChieuCao\": \"788 cm\", \"DungTich\": \" 109,1 cm3\", \"HTKhoiDong\": \"Điện\", \"LoaiDongCo\": \"Xăng, 4 kỳ, 1 xilanh, làm mát bằng không khí\", \"MucTieuHao\": \"1.9l/100km\", \"TrongLuong\": \"95kg\", \"CongSuatMax\": \"6,18 kW/7.500 vòng/phút\", \"MomenXoanMax\": \"14,4Nm/7.000 vòng/phút\"}'),('XM006','Super Cub C125','XM',88000000,125,'ff97e736-b0cc-47be-85bc-c419cdec1137-Kn2t7CHz4vuaDK9aj6g7.png','7f598d90-62e2-4195-b278-0adc01fd92a8-DBSFFeIyA2rDz3ymUWDL.jpg','{\"BinhXang\": \" 3,7 L\", \"ChieuCao\": \"788 cm\", \"DungTich\": \"124,8 cc\", \"HTKhoiDong\": \"Đạp chân/Điện\", \"LoaiDongCo\": \"Xăng, 4 kỳ, 1 xilanh, làm mát bằng không khí\", \"MucTieuHao\": \"1,85l/100 km\", \"TrongLuong\": \"139kg\", \"CongSuatMax\": \"12,6kW/9.000 vòng/phút\", \"MomenXoanMax\": \"14,4Nm/7.000 vòng/phút\"}');
/*!40000 ALTER TABLE `dong_san_pham` ENABLE KEYS */;
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
INSERT INTO `loai_san_pham` VALUES ('PL','Phân khối lớn'),('TC','Xe tay côn'),('XG','Xe tay ga'),('XM','Xe máy');
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
  PRIMARY KEY (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` VALUES ('PL001DEN','PL001','Đen',1,'53df4c0b-01bf-49a2-a049-1958fe4c1c34-amnjtMY1TRzAud8kBJlN.png'),('PL001TRANG','PL001','Trắng',1,'ff0e59a2-6612-4140-a7bc-878652eef61e-lq4PRZXt3a4kKjmdTgcv.png'),('PL001XANH','PL001','Xanh',1,'14c7f42a-03ca-4755-83c3-6cb937c55852-alFDzFVDgPocjI1cyH4A.png'),('TC001DEN','TC001','Đen',10,'f7a23209-6d7c-480e-8c2e-b8b4e738cb39-2pSqu65qdei9HLkHfOtJ.png'),('TC001DENDO','TC001','Đen đỏ',8,'ebe7fbd3-1a1d-441a-be71-dc5e1578f2f1-HoKX7G9utG4U4VsIOapb.png'),('TC001DO','TC001','Đỏ',12,'64934cc0-98f5-4f1e-adf7-f8ebdb0f4424-jyyDYmkDh4xAFugupf5V.png'),('TC002DEN','TC002','Đen',5,'b0b90261-b607-4580-890c-6d0f61e6571f-fnyrLm7ZFGFMh0ibg3TI.jpg'),('TC002DODEN','TC002','Đỏ đen',2,'487d4006-8e90-4ebb-b265-f9ddd4b3e178-4IMZJ6keEcQJMzeWeldD.jpg'),('TC002XANHDEN','TC002','Xám đen',6,'03bbd65f-b840-4a49-9e6b-3a35f408a4d7-uF4hQaZEiZKgccdUWWVj.jpg'),('TC003TRANGXANH','TC003','Trắng xanh',2,'38481d39-ce13-4cb5-a536-0aa3ac5b1f51-9io11b4xf5cNvb0h7xC8.jpg'),('TC004DEN','TC004','Đen',5,'14bfac9b-4c72-4457-8c1a-8cd067d47491-Pw7uPcwc9N4i586O4DIh.jpg'),('TC004DODEN','TC004','Đỏ đen',5,'1131e2ea-d5c1-465f-a8df-37f841de5024-h5vAHF245L1x8JVmmTdN.jpg'),('TC005DEN','TC005','Đen',4,'13f56c90-1aaa-4e1a-901f-c840f049f7ef-IrgZ7A5q9PUVAaHNWH1S.jpg'),('TC005DO','TC005','Đỏ',1,'65791ec8-856d-4c05-b0a0-d90d1fd38eef-wmtKhw2HE9NQpoVl9yaz.jpg'),('TC005XANH','TC005','Xám',3,'1b59d5a5-3233-4c68-922c-28b2068b1d7c-ruZSLSBcmBdk729bE5zi.jpg'),('TC006DEN','TC006','Đen',6,'5b158f3b-9d58-4a7b-8fc9-9a26d032005c-GOm5BBZcpHe2Pu6RWNgh.png'),('TC006DO','TC006','Đỏ',9,'a86e6ab6-2baf-4a09-a2bd-63cb29463afd-3NsTtbQnERXX3VDbaoks.png'),('TC006XANH','TC006','Xanh',8,'d0c96954-c1bd-40cc-848f-0ad8d0c6f3c3-9zVYrkyMgtcTsdthXVpi.png'),('TC007DEN','TC007','Đen',6,'8c89103c-b577-4abd-b5dd-b05851e0789f-AjAslqMuYpko2d6wmuEs.png'),('TC007DO','TC007','Đỏ',5,'8031c846-5079-4acb-8543-2a012922268d-Lrl35V3OUGKRAJOk9FdZ.png'),('TC007TRANG','TC007','Trắng',6,'4ca67099-58fc-46f9-9197-941fac02b588-edb5naUHLBHvJWI5G8Vd.png'),('TC007XANH','TC007','Xám',5,'6f3630cf-5696-4ec1-99a0-1e0612b59e7c-9htoKzh1CZ6775JtOztP.png'),('TC008DEN','TC008','Đen',3,'3741788d-1db9-4614-9e8c-4ce2c8f1b7f6-CF0g6kqPxoNXRan6hN2H.jpg'),('TC008DO','TC008','Đỏ',3,'44a92235-c61d-4572-af90-eee25a7dab40-0fuVUozl9BEsLqJwjCJE.jpg'),('TC009DEN','TC009','Đen',1,'1fe8dee2-7f7c-4b11-8115-9ca63c7097da-OxZhpkUJeNrNSDAeztVD.jpg'),('TC009DODEN','TC009','Đỏ đen',1,'75b3b70d-caf2-4a1e-b4cd-c0f9b8aee2a4-4sIOHkPjfDynvVPaLF1j.jpg'),('TC010DEN','TC010','Đen',2,'260a3271-4711-4f61-8255-6c7f6eda6cc8-A12M6V57z2Hk5f2Ctmbq.jpg'),('TC010DODEN','TC010','Đỏ đen',2,'14f75dea-68d0-4369-8f69-a56e3ac9add5-R9ElSY1IKhYil9vXOaDG.jpg'),('TC011DEN','TC011','Đen',3,'457dc293-96b8-44ba-a4a1-a7e1a4014414-x8ZCNtM5g2QRGQl4udo8.png'),('TC012DEN','TC012','Đen',1,'5f9b94d1-4179-4489-bc73-3591303ad7d7-Hna2W2be33vMDdhiJ9VB.png'),('TC012NAU','TC012','Nâu',2,'5f2dffb0-4981-4375-af4c-e691a65c4617-8n4PZOMJWHSXTSdMTDXr.png'),('TC013DOXANH','TC013','Đỏ Xanh',1,'47902b13-c269-4edb-9277-549978be1e28-8WKM4mZgOuXRyTDrSzhN.png'),('XG001DEN','XG001','Đen',5,'f3388c1b-d65b-4d80-8e54-aa405a872a21-ceAulU1zOpfVrZ683HgP.jpg'),('XG001DODEN','XG001','Đỏ đen',7,'610c4474-c6f7-48a9-b2d1-d09748cf3fe5-Xjq9566GIJM6KdOHPPyJ.jpg'),('XG001XANHDEN','XG001','Xanh đen',6,'3aff2d67-fb7b-4db2-bff9-16fe98cc2242-ZKZ3yrFxpMFjPS0ab90d.jpg'),('XG002DE','XG002','Đen',5,'326e1f21-d72f-4b76-a4f5-399ab10b6ca0-FC1hDvw1eSb9V0Aflrcg.jpg'),('XG002DODEN','XG002','Đỏ đen',3,'a76fe177-52bc-4d36-be70-f27713f464ed-3yHA9YX7ojYvmCTUIt3L.jpg'),('XG003DEN','XG003','Đen',5,'54c6ae4d-e6f9-4896-8f2f-78c4978d8a9c-nqWK6azOcQk9GhvZvtcS.png'),('XG003DO','XG003','ĐỎ',7,'4c0a0b46-ade8-4f3f-85f9-c71967b7a118-RwFlE5cIdGVu3dWbNaYF.png'),('XG003DODEN','XG003','Đỏ đen',3,'3c92bf73-c23b-4824-aecc-b138c09966c0-1uDqdLnICRlyqe8TSNza.png'),('XG003TRANG','XG003','Trắng',4,'6292eb12-9008-4559-82ab-50c91c7088b3-ifWFSEQJkaCT4jEnrVcy.png'),('XG003XANH','XG003','Xám',5,'3dab9dc3-fa1c-44db-a8fc-63a19e26925e-BLeKgU273qamvxR9LCZA.png'),('XG003XANHDEN','XG003','Xanh đen',2,'e64f8fdf-3a55-4990-a4d5-2f0d63dba38c-AvewE7i9BJl2eQ7gykis (1).png'),('XG004DEN','XG004','Đen',2,'dc98bbeb-5c22-41b4-8246-6a06acfd15f8-gw75k7qwzjFA3NDKRap7.jpg'),('XG004DO','XG004','Đỏ',7,'f8c00440-51f9-491b-9121-87dc58dbb5da-NZBGpkdoYhzAXSph7Pev.jpg'),('XG004TRANG','XG004','Trắng',5,'bed550a0-1b37-45e1-9d3f-38890d57b923-PVv5bAR0a69T7Y2GTvQ9.jpg'),('XG004XANH','XG004','Xanh',8,'bc585455-8f41-450d-84d4-619737174f84-CBeDSJaY11KQoo5RYhuL.jpg'),('XG005DEN','XG005','Đen',3,'d9329dca-42d4-4e50-8389-ced3b760de4c-GrolcmgHfEJmVc6wBNfN.png'),('XG005DO','XG005','Đỏ',5,'fbe7b2be-0d8d-45be-b2d9-663c0938d496-gfUfURy1WBwtBbVFH4FO.png'),('XG005TRANG','XG005','Trắng',6,'d6be65b5-9278-4bf1-84d2-18521a87806b-vPwfrccSbX8oamXsB23Y.png'),('XG006DEN','XG006','Đen',5,'0dd9ef44-c462-4830-bca0-561614aca189-UDvt2b8oUaEjVwt3fY1q.png'),('XG006DO','XG006','Đỏ',6,'062b0403-bbc6-4ddc-8cda-ee0a46480e02-bckho9q1kDOnzCApjNpq.png'),('XG006XANH','XG006','Xanh',5,'95808583-4dee-4498-8273-dd06b345ea2f-JlMhoGY3W3AJLe7BaYPo.png'),('XG007DEN','XG007','Đen',3,'fa4a36a2-322b-46f2-802d-a75c24453ab2-cjemdZcKqzQyG0jdM9rQ.png'),('XG007DO','XG007','Đỏ',3,'4eecc64d-80de-4676-9467-17e555b51022-uL67srpcKiBCGkqAiy1T.png'),('XG007TRANG','XG007','Trắng',3,'20e33851-0a73-4a6f-b697-6c3284d3db4b-7asMTwgZUhiX0FBRegRI.png'),('XG007XANH','XG007','Xanh',3,'1caaf676-bdf7-4346-84a0-4883a21a9a83-epNFnKrqwGBz8iJaWhpM.png'),('XM001DENDO','XM001','Đen đỏ',6,'64bf5e70-8b2e-4133-9409-06020c426927-4Ib2nUTiOd9E1T5wimgZ.png'),('XM001DENHAM','XM001','Đen nhám',9,'961b8636-7ae4-488a-a671-787acbcf43aa-j37sLOXkDQsdX7nnBTOj.png'),('XM001DENXANH','XM001','Đen xanh',4,'212d773e-b355-4f61-9e54-7155a0837555-hbCcmJvpOf9puCZpgbtb.png'),('XM002DEN','XM002','Đen',5,'e12a6052-1ae6-4fdb-9038-199b50c8c5d9-pxNbshmGP0Oz6VXFSZrb.png'),('XM002DODEN','XM002','Đỏ đen',3,'1c9b5c7f-8218-41cb-94da-833bf60a3004-AQRi0Spd16REq2TErCvH.png'),('XM002TRANGDEN','XM002','Trắng đen',4,'445f736a-7966-4078-a4d7-87b339798896-VlhEoBOm76qFSuONryD1.png'),('XM003DEN','XM003','Đen',5,'7532b7c4-83c4-4fc0-8878-1fcfd27bcfa2-gZon0FenCIeoMximU4n2.png'),('XM003DO','XM003','Đỏ',7,'34c60824-d0d7-4d8d-a1ac-c32a7ffd29e2-rlEEDjTrd0E9y8k5uHEN.png'),('XM003TRANG','XM003','Trắng',10,'816d6342-faa2-4075-a74c-c7ce4eb18c41-mTuI6iTbdYCOkHBMnsNw.png'),('XM003XANH','XM003','Xanh',3,'1e42c2c4-6c12-4f1f-93e2-f86df60f29ca-faw9zEMu7AwQXwCHKvdb.png'),('XM004DEN','XM004','Đen',5,'4afa1f94-d97d-48d5-a26c-fe85c7ba3481-X8XdCvdl9V5br7DYGcNh.png'),('XM004DODEN','XM004','Đỏ đen',3,'41360f92-0f81-4ae6-8d8d-2c03b5950589-wwNzjZzNfijQ4YV0OQ8v.png'),('XM004TRANGDEN','XM004','Trắng đen',5,'08223ceb-098d-4c96-ba90-44a7ac104aa9-0XrIKxCzABxGxPw18huc.png'),('XM004XANHDEN','XM004','Xanh đen',4,'15d6ea1d-744e-483c-b282-4b50fdd96113-eZQoJ2xhZ2VjCqjTdFyF.png'),('XM005DEN','XM005','Đen',5,'9574f3c2-e89c-4a0a-89ef-bbafcbc19dd7-FGTa8tJ5LqpxS3s7OnZH.png'),('XM005DO','XM005','Đỏ',6,'966dbaac-f7e9-4f17-9fb0-17a40a283d67-egQdQH8QNTZsVzC85trX.png'),('XM005TRANG','XM005','Trắng',3,'3d8bae5c-461a-411a-a807-f40e39222fd0-EYpeXY7cdjjbQl2BZPed.png'),('XM005XANH','XM005','Xanh',6,'a4a45061-4670-475c-b9d6-937991a00ab1-I3SKQlbvUZWapIxUlAZe.png'),('XM006DEN','XM006','Đen',4,'58acdc61-72d6-4a5a-a234-6a48290873be-Kn2t7CHz4vuaDK9aj6g7.png'),('XM006DO','XM006','Đỏ',4,'d11157cb-88ae-44bc-a14a-f6f9dd77b132-rekvNMjwCvz3tiYHy27g.png'),('XM006XANH','XM006','Xanh',6,'d737971e-05e8-4f38-a2b8-6f3377abc30d-RFDFIO2vttcPv6q6jCfq.png');
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2023-05-05  0:00:34
