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
INSERT INTO `dong_san_pham` VALUES ('PL001','Gold Wing phiên bản 2022','PL',1250000000,8,1800,'213ef1b0-bea1-43b6-b3dd-a8da75e4ce25-amnjtMY1TRzAud8kBJlN.png','486737ae-7e0d-4e76-9867-169ba6650629-FCIJ9NTjE90IWapSBdVq.jpg','{\"BinhXang\": \"21\", \"ChieuCao\": \"780\", \"DungTich\": \"1803\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \" 5,53 lít/100 km\", \"TrongLuong\": \"390\", \"CongSuatMax\": \"93\", \"MomenXoanMax\": \"170\"}'),('PL002','Africa Twin 2023 Phiên bản Tiêu chuẩn','PL',592000000,6,1000,'3e42b188-4641-4725-a351-cb9cc3f519ef-Pw7uPcwc9N4i586O4DIh.jpg','bfd68c44-9f1a-418c-bb81-7c82b8f517c2-ZS2xN2bzxpIRfcTn6A79.jpg','{\"BinhXang\": \"14 Lít\", \"ChieuCao\": \"780\", \"DungTich\": \"1084\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"15 Lít\", \"TrongLuong\": \"210\", \"CongSuatMax\": \"110\", \"MomenXoanMax\": \"170\"}'),('PL003','Rebel 500 2023','PL',181000000,3,500,'d462e30c-38e9-4cb4-af46-79b81d60126b-IrgZ7A5q9PUVAaHNWH1S.jpg','1827fbff-10ce-4a62-abf1-5449d5317ef2-iTc617HlBJm7CrlzB6rR.jpg','{\"BinhXang\": \"12 Lít\", \"ChieuCao\": \"680\", \"DungTich\": \"498\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"3.5 Lít/ 100Km\", \"TrongLuong\": \"181\", \"CongSuatMax\": \" 33,5 kW tại 8500 vòng/phút\", \"MomenXoanMax\": \" 43,3 Nm tại 6000 vòng/phút\"}'),('PL004','CB1000R 2023','PL',500000000,6,1000,'a558e230-264e-40e5-adc8-045a42b1d51b-ceAulU1zOpfVrZ683HgP.jpg','bf24c751-d34b-46c6-bda4-a4d7293ac33f-KicOouA6KsnfBk1mti82.jpg','{\"BinhXang\": \"14 Lít\", \"ChieuCao\": \"781\", \"DungTich\": \"998 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"4.5 Lít/ 100Km\", \"TrongLuong\": \"788 mm\", \"CongSuatMax\": \" 107 kW tại 10.500 vòng/phút\", \"MomenXoanMax\": \" 104 Nm tại 8.250 vòng/phút\"}'),('PL005','CBR650R phiên bản 2023','PL',254000000,6,650,'f8d4c90a-6633-4a30-a5d1-ca9ab880a471-3yHA9YX7ojYvmCTUIt3L.jpg','b8d032ff-5d10-4a72-84cb-4ea3fb073780-w8eSFlKIKQhlvorboGeK.jpg','{\"BinhXang\": \"14 Lít\", \"ChieuCao\": \"680\", \"DungTich\": \"649 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"4.9 Lít/ 100Km\", \"TrongLuong\": \"210 kg\", \"CongSuatMax\": \" 61,7 kW/ 10.000 vòng/ phút\", \"MomenXoanMax\": \"63 Nm/ 9.500 vòng/ phút\"}'),('PL006','CB500X 2022','PL',500000000,2,500,'6facbfd6-b9cc-4d26-8edc-5ac9e0aece89-4sIOHkPjfDynvVPaLF1j.jpg','4bc15ed9-d708-4eea-9dc0-4b1050c700ef-8VCOYnCwP4nKsTClij3R.jpg','{\"BinhXang\": \"14 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"498 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"4.5 Lít/ 100Km\", \"TrongLuong\": \"210 kg\", \"CongSuatMax\": \" 35 kW tại 8.600 vòng/phút\", \"MomenXoanMax\": \" 43 Nm tại 6.500 vòng/phút\"}'),('PL007','CB500F 2022','PL',480000000,1,500,'ecf31e8a-8f92-435b-8f25-8f6bf1764ded-R9ElSY1IKhYil9vXOaDG.jpg','8e6dd68f-0b51-4c50-bef0-8e61e286521e-Ni0N9LSewW5cR2MP8uLK.jpg','{\"BinhXang\": \"14 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"498 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"5.5 Lít/ 100Km\", \"TrongLuong\": \"210 kg\", \"CongSuatMax\": \" 35 kW tại 8.600 vòng/phút\", \"MomenXoanMax\": \" 43 Nm tại 6.500 vòng/phút\"}'),('PL008','Rebel 1100 phiên bản 2022 DCT','PL',550000000,2,1100,'ad1245b5-5b5e-496e-8bad-6d8ee8eb0354-8n4PZOMJWHSXTSdMTDXr.png','20ba5585-be08-4887-b269-a3c9cde1007c-RKB5wdexWshNijLGmj4D.jpg','{\"BinhXang\": \"14 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"1112 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"5.5 Lít/ 100Km\", \"TrongLuong\": \"210 kg\", \"CongSuatMax\": \"64 kW tại 7.000 vòng/phút\", \"MomenXoanMax\": \" 98 Nm tại 4.750 vòng/phút\"}'),('PL009','CBR1000RR-R Fireblade SP','PL',1050000000,6,1000,'b97100b1-d80b-4394-b905-db815c65288e-8WKM4mZgOuXRyTDrSzhN.png','edeca0ce-de9f-4af6-8810-3faf6c62b3b7-T0IMBNB1kz8bv6GHlfLX.png','{\"BinhXang\": \"14 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"1084 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"5.5 Lít/ 100Km\", \"TrongLuong\": \"210 kg\", \"CongSuatMax\": \"160Kw/14.500 vòng/phút\", \"MomenXoanMax\": \" 113Nm/12.500 vòng/phút\"}'),('PL010','CBR500R 2022','PL',500000000,2,500,'905a6414-d6cb-4a65-8958-13baf07457e2-0fuVUozl9BEsLqJwjCJE.jpg','9e8b6a6f-6bc7-4b6d-8532-3b470bef9066-JCqCTLtm6ut04NB8btk1.jpg','{\"BinhXang\": \"14 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"498 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"5.5 Lít/ 100Km\", \"TrongLuong\": \"210 kg\", \"CongSuatMax\": \" 35 kW tại 8.600 vòng/phút\", \"MomenXoanMax\": \" 43 Nm tại 6.500 vòng/phút\"}'),('TC001','Africa Twin 2023 Adventure Sports','PL',720000000,1,1000,'76f75825-0fa9-45d7-8cd6-1a9abc288560-9io11b4xf5cNvb0h7xC8.jpg','ec0e96cc-dd88-493f-97ca-c08d6b78c317-KCe6HxbpH2uSryhd2P1p.jpg','{\"BinhXang\": \"14\", \"ChieuCao\": \"781\", \"DungTich\": \"1084\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"5.5 Lít/ 100Km\", \"TrongLuong\": \"210\", \"CongSuatMax\": \"75\", \"MomenXoanMax\": \"111\"}'),('TC002','CBR150R','TC',75000000,1,150,'01c2daf9-023a-423e-8172-099239ad8db6-HoKX7G9utG4U4VsIOapb.png','f7a7ad96-35ea-4108-aadd-31855349daa5-XhNQ54yFln2AoXzLg3du.jpg','{\"BinhXang\": \"14 Lít\", \"ChieuCao\": \"680\", \"DungTich\": \"149 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"1.9 Lít / 100km\", \"TrongLuong\": \"130 kg\", \"CongSuatMax\": \" 12,6kW/9.000 vòng/phút\", \"MomenXoanMax\": \" 14,4Nm/7.000 vòng/phút\"}'),('TC003','Winner X','TC',35000000,1,150,'b05a56bc-043d-4c67-bf71-2187bc2cf2cf-AjAslqMuYpko2d6wmuEs.png','f3b2a00d-e231-42c2-915e-59d37458b232-ymFtMSRUxhahQG3kn0YU.jpg','{\"BinhXang\": \"5 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"150 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"1.6 Lít/ 100Km\", \"TrongLuong\": \"110 kg\", \"CongSuatMax\": \" 11,5kW/9.000 vòng/phút\", \"MomenXoanMax\": \"\"}'),('TC005','CB150R The Streetster','TC',105000000,1,150,'13e5db51-e749-48bc-a364-3653734c31ac-x8ZCNtM5g2QRGQl4udo8.png','b8f9089f-45a0-41a5-ac7d-e33b7da5b4b2-J9a8xOS3etcc9W3tU50c.jpg','{\"BinhXang\": \"14 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"149.9 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"2.5 Lít/ 100Km\", \"TrongLuong\": \"210 kg\", \"CongSuatMax\": \"12,0kW/9.500rpm\", \"MomenXoanMax\": \" 13,6 Nm\"}'),('XG001','Sh mode 125cc','XG',58000000,1,125,'71cddb67-02f5-41cb-9668-506dc2d85732-AvewE7i9BJl2eQ7gykis.png','04d61595-9e8d-46a4-8ab6-ee6fecbb1a63-kM7RoUxwnzSATM0OxIqp.jpg','{\"BinhXang\": \"5 Lít\", \"ChieuCao\": \"680\", \"DungTich\": \"124 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"2Lít/ 100Km\", \"TrongLuong\": \"150 kg\", \"CongSuatMax\": \" 8,2kW/8500 vòng/phút\", \"MomenXoanMax\": \" 11,7 N.m/5000 vòng/phút\"}'),('XG002','SH350i','XG',150000000,1,350,'afe17e71-fa78-4b54-a77e-de82944af4ed-VlhEoBOm76qFSuONryD1.png','f6255e20-46ee-4fd8-9c2b-fc55135f5dc6-TmKg2s72XmE2GNeptPlC.jpg','{\"BinhXang\": \"7.5 Lít\", \"ChieuCao\": \"680\", \"DungTich\": \"349 cc\", \"HTKhoiDong\": \"180kg\", \"MucTieuHao\": \"3.5 Lít/ 100Km\", \"TrongLuong\": \"210kg\", \"CongSuatMax\": \" 21,5 kW/7.500 vòng/phút\", \"MomenXoanMax\": \" 31,8 Nm/5.250 vòng/phút\"}'),('XG003','Future 125 FI','XG',31000000,1,125,'2a5d2d78-1296-40b8-8b50-d3402dac4225-gZon0FenCIeoMximU4n2.png','f5e48709-51e4-4889-9bfb-e12b46341428-a4Ctelg2ZywkDd8aDfRT.jpg','{\"BinhXang\": \"5 Lít\", \"ChieuCao\": \"680\", \"DungTich\": \"124.9 cc\", \"HTKhoiDong\": \"Điện, đạp\", \"MucTieuHao\": \"1.58 Lít/ 100Km\", \"TrongLuong\": \"110 kg\", \"CongSuatMax\": \" 6,83 kW/7.500 vòng/phút\", \"MomenXoanMax\": \" 10,2 Nm/5.500 vòng/phút\"}'),('XG004','Vision','XG',50000000,1,110,'486bd33c-f8c8-4c72-a5ff-99704ebe4d60-NZBGpkdoYhzAXSph7Pev.jpg','0ce7d9ea-777b-4863-8d4c-154f207cca0a-fkeaYaS5YGfjlEztEYjS.jpg','{\"BinhXang\": \"4.8 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"108 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"2 Lít/ 100Km\", \"TrongLuong\": \"98 kg\", \"CongSuatMax\": \" 6,59 kW/7.500 rpm\", \"MomenXoanMax\": \" 9,29 N.m/6.000 rpm\"}'),('XG005','Honda VARIO 160','XG',51000000,1,160,'f65d43ea-0acb-4601-b0e5-db2c0f64612a-3NsTtbQnERXX3VDbaoks.png','f8c98628-5fcd-4584-9999-970486c823af-CGfrUh6EH69VqCclQqiv.jpg','{\"BinhXang\": \"5 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"158 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"2.5 Lít/ 100Km\", \"TrongLuong\": \"160 kg\", \"CongSuatMax\": \" 11,3kW/8.500 vòng/phút\", \"MomenXoanMax\": \" 14,1 N・m/6.500 vòng/phút\"}'),('XG006','SH160i','XG',75290000,1,160,'3c6a3b3e-7754-4168-b251-86c3481855b8-1XtFTCi5IjN3fkiy3C3m.png','43dc10db-792d-41ef-82e5-a42d2798cf6b-1iweQpDWX6rFhviBD7fr.png','{\"BinhXang\": \"6 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"160 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"1.5 Lít/ 100Km\", \"TrongLuong\": \"110 kg\", \"CongSuatMax\": \"12,4kW/8.500 vòng/phút (SH160i)\", \"MomenXoanMax\": \"14,8N.m/6.500 vòng/phút (SH160i)\"}'),('XG007','Air Blade 125','XG',50000000,1,125,'f1670602-b4e9-4474-aea9-66efa6209083-bckho9q1kDOnzCApjNpq.png','ff673315-832a-4721-8fa3-d6aa75376630-L3b54cTddCQUatsGE8wv.jpg','{\"BinhXang\": \"5 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"125.4 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"2.2 Lít/ 100Km\", \"TrongLuong\": \"115 kg\", \"CongSuatMax\": \"8,75kW/8.500 vòng/phút\", \"MomenXoanMax\": \"11,3Nm/6.500 vòng/phút\"}'),('XG008','LEAD 125cc','XG',40000000,1,125,'63f95938-41bb-4678-825d-e0b925cb7f28-uL67srpcKiBCGkqAiy1T.png','51ad1cd1-bb79-47da-8abe-9e0bbfe2550d-ELAzjUmkQRG0SyOYxUU0.jpg','{\"BinhXang\": \"5 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"124 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"2.5 Lít/ 100Km\", \"TrongLuong\": \"110 kg\", \"CongSuatMax\": \"160Kw/14.500 vòng/phút\", \"MomenXoanMax\": \"6,18 kW/7.500 vòng/phút\"}'),('XS001','Blade 2023','XS',20000000,1,110,'c6b9ccaa-e7c0-4fcf-9a4c-bfd784f74641-iiAYCAnu1Txg54Z6A6Ae.png','5f93947c-42d4-44f5-85a0-997ceb1c662a-yz2Q98Hbz8mYfxcrxZr5.jpg','{\"BinhXang\": \"5 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"109\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"1.9 Lít / 100km\", \"TrongLuong\": \"100kg\", \"CongSuatMax\": \" 6,18 kW/7.500 vòng/phút\", \"MomenXoanMax\": \" 8,65 Nm/5.500 vòng/phút\"}'),('XS002','Wave RSX FI 110','XS',25000000,1,110,'81082d38-05d3-43fb-996d-57eca07570f7-wwNzjZzNfijQ4YV0OQ8v.png','fe1dbc53-2072-4d20-888c-f69b58b96990-R9qpquvMkTBX7Qxl94rD.jpg','{\"BinhXang\": \"3.5 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"113 cc\", \"HTKhoiDong\": \"Điện, đạp\", \"MucTieuHao\": \"1.59 Lít/ 100Km\", \"TrongLuong\": \"98 kg\", \"CongSuatMax\": \" 6,46 kW / 7.500 vòng/phút\", \"MomenXoanMax\": \" 8,7 Nm/6.000 vòng/phút\"}'),('XS003','Wave Alpha 110cc','XS',18000000,1,110,'ce053ebb-9b9a-49d2-92b0-21990b2122cb-egQdQH8QNTZsVzC85trX.png','8fd4e55c-e2d3-463e-95f2-8674db4568aa-ruKI9SSepxqGtMtDfBiZ.jpg','{\"BinhXang\": \"3 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"113 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"2.5 Lít/ 100Km\", \"TrongLuong\": \"93 kg\", \"CongSuatMax\": \" 6,12kW/7.500rpm\", \"MomenXoanMax\": \" 8,44 N・m (5.500rmp)\"}'),('XS005','Super Cub C125','XS',100000000,1,125,'b93e7620-d248-44b9-80c5-0213c9d33003-Kn2t7CHz4vuaDK9aj6g7 (1).png','0328a78b-da1e-4d4b-8e69-666f3a5fbe8d-DBSFFeIyA2rDz3ymUWDL.jpg','{\"BinhXang\": \"5 Lít\", \"ChieuCao\": \"680 mm\", \"DungTich\": \"124 cc\", \"HTKhoiDong\": \"Điện\", \"MucTieuHao\": \"1.5 Lít/ 100Km\", \"TrongLuong\": \"110 kg\", \"CongSuatMax\": \" 6,87kW/7.500 vòng/phút\", \"MomenXoanMax\": \" 10,15Nm/5.000 vòng/phút\"}');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auto_generate_ma_dsp` BEFORE INSERT ON `dong_san_pham` FOR EACH ROW BEGIN
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_dong_co`
--

LOCK TABLES `loai_dong_co` WRITE;
/*!40000 ALTER TABLE `loai_dong_co` DISABLE KEYS */;
INSERT INTO `loai_dong_co` VALUES (1,'Động cơ xi-lanh đơn'),(2,'Động cơ hai xi-lanh thẳng hàng'),(3,'Động cơ V-twin'),(4,'Động cơ Boxer'),(5,'Động cơ 3 xi-lanh thẳng hàng'),(6,'Động cơ 4 xi-lanh thẳng hàng'),(7,'Động cơ V-Four'),(8,'Động cơ 6 xi-lanh nằm ngang'),(9,'Động cơ 6 xi-lanh thẳng hàng');
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
INSERT INTO `san_pham` VALUES ('PL001DEN','PL001','Đen',4,'180c287c-9f33-4a72-ab28-a41117761d10-amnjtMY1TRzAud8kBJlN.png'),('PL001TRANG','PL001','Trắng',3,'d936f255-44da-4a6e-99ec-6cd21607bd8a-lq4PRZXt3a4kKjmdTgcv.png'),('PL001XANH','PL001','Xanh',2,'c857dd32-ff4b-4fc2-9e26-42702b65b720-lq4PRZXt3a4kKjmdTgcv.png'),('PL002DEN','PL002','Đen',3,'40fde4d7-7693-4db3-99ce-3572c7f5735f-Pw7uPcwc9N4i586O4DIh.jpg'),('PL002DODEN','PL002','Đỏ đen',3,'f0131610-e59f-4de9-830f-000841811585-h5vAHF245L1x8JVmmTdN.jpg'),('PL003DEN','PL003','Đen',5,'ed45d143-07f1-4b1e-a4b9-fcfd44297bcd-IrgZ7A5q9PUVAaHNWH1S.jpg'),('PL003DODEN','PL003','Đỏ đen',4,'2f03da46-eeb9-4a5f-aaaa-c3bfb960f186-wmtKhw2HE9NQpoVl9yaz.jpg'),('PL004DEN','PL004','Đen',5,'7c5bb38b-2953-4281-b2c4-26eec23d9b6a-ceAulU1zOpfVrZ683HgP.jpg'),('PL004XANHDEN','PL004','Xanh đen',3,'031cc69c-4751-49ab-a98b-e7ede8a0d752-ZKZ3yrFxpMFjPS0ab90d.jpg'),('PL005DEN','PL005','Đen',5,'33257f2e-ded9-417a-be20-83d296fd0eef-FC1hDvw1eSb9V0Aflrcg.jpg'),('PL005DO','PL005','Đỏ',3,'ce876af8-2f3d-47c6-9d61-75be9d0778ea-3yHA9YX7ojYvmCTUIt3L.jpg'),('PL006DEN','PL006','Đen',3,'41888109-1b00-4a5b-9fb1-4c086fbde2f0-OxZhpkUJeNrNSDAeztVD.jpg'),('PL006DO','PL006','Đỏ',4,'93e63be9-4229-4a64-9b4b-afa0c335f6ca-4sIOHkPjfDynvVPaLF1j.jpg'),('PL007DEN','PL007','Đen',3,'9661cc8b-b0c9-4cce-a94e-032647f2cf7d-A12M6V57z2Hk5f2Ctmbq.jpg'),('PL007DO','PL007','Đỏ',4,'92ee69e6-7ea1-4802-b8ce-3d3ad7bc1481-R9ElSY1IKhYil9vXOaDG.jpg'),('PL008DEN','PL008','Đen',5,'c78b669e-a9b2-4968-83a7-10da669dc943-Hna2W2be33vMDdhiJ9VB.png'),('PL008NAU','PL008','Nâu',2,'9b339ba3-5bae-42dc-9c5d-9a5247995eb3-8n4PZOMJWHSXTSdMTDXr.png'),('PL009DOXANHTRANG','PL009','Đỏ Xanh Trắng',5,'b4d99b6c-9ecf-44bb-93fb-c82c0f5e8397-8WKM4mZgOuXRyTDrSzhN.png'),('PL010DEN','PL010','Đen',4,'e7758ab1-da11-433d-ae0a-d16b7c8faa7e-CF0g6kqPxoNXRan6hN2H.jpg'),('PL010DO','PL010','Đỏ',3,'0a66a2f1-22b3-42b9-8b3d-db83191224f6-0fuVUozl9BEsLqJwjCJE.jpg'),('TC001TRANGXANHDEN','TC001','Trắng xanh đen',2,'fe7c22a0-44ce-4101-ab16-b7f652e682b9-9io11b4xf5cNvb0h7xC8.jpg'),('TC002DEN','TC002','Đen',7,'6c990716-6819-4e4d-9924-9bd24d19b4f4-2pSqu65qdei9HLkHfOtJ.png'),('TC002DO','TC002','Đỏ',5,'0691a642-6a3d-4bcb-85a5-089e1d127001-jyyDYmkDh4xAFugupf5V.png'),('TC002DODEN','TC002','Đỏ đen',6,'5c669346-012f-401a-8457-058ed3b8a361-HoKX7G9utG4U4VsIOapb.png'),('TC003DEN','TC003','Đen',4,'ec4713f1-8613-4c9f-983a-8093f1ccc29a-AjAslqMuYpko2d6wmuEs.png'),('TC003DO','TC003','Đỏ',5,'6399793b-50f8-4c6e-88ac-fb1f43878b6c-v3mHZHIh1RLL4P8nndyd.png'),('TC003TRANG','TC003','Trắng',6,'0623dda6-e2ff-4e87-bbdd-49d4068ab194-edb5naUHLBHvJWI5G8Vd.png'),('TC005DEN','TC005','Đen',4,'cd570dd4-98cd-4992-919b-177aa8cf0219-x8ZCNtM5g2QRGQl4udo8.png'),('XG001DEN','XG001','Đen',3,'b5ec2340-1d10-4805-bf01-7a76a642923b-nqWK6azOcQk9GhvZvtcS.png'),('XG001DO','XG001','Đỏ',3,'4340a554-c9bf-47d4-8c88-77f85c60025c-RwFlE5cIdGVu3dWbNaYF.png'),('XG001TRANG','XG001','Trắng',4,'b021f8dc-eb04-4a25-b888-358306c7262a-ifWFSEQJkaCT4jEnrVcy.png'),('XG001XAM','XG001','Xám',6,'4f4b11ba-c3c4-4bd4-b37d-331794695d54-GzK3fVGuGc38eoLhUy3n.png'),('XG001XANH','XG001','Xanh',3,'15528e85-5e25-4ad2-bd89-90e6f83d6869-AvewE7i9BJl2eQ7gykis.png'),('XG002DEN','XG002','Đen',3,'7a92c7fb-dd5f-44ea-924b-c14269801dbe-pxNbshmGP0Oz6VXFSZrb.png'),('XG002DO','XG002','Đỏ',5,'c55a29b6-d1cd-4d54-9d13-f9a6103bfd8e-AQRi0Spd16REq2TErCvH.png'),('XG002TRANG','XG002','Trắng',3,'65bb552c-7877-4014-931b-ff766cbab5f7-VlhEoBOm76qFSuONryD1.png'),('XG003DEN','XG003','Đen',4,'053d6bcf-d8a2-4d1a-be97-003c68202c6c-gZon0FenCIeoMximU4n2.png'),('XG003DO','XG003','Đỏ',4,'73f74f67-ffe9-4e0f-a1a3-5a4707b58574-rlEEDjTrd0E9y8k5uHEN.png'),('XG003TRANG','XG003','Trắng',5,'66679069-46fc-42a5-806c-b978e23e0be7-mTuI6iTbdYCOkHBMnsNw.png'),('XG004DEN','XG004','Đen',2,'4123ff0d-0942-44d1-a8d1-e4911ce5b5ac-KoqSONTqX6KMl7kux7WL.jpg'),('XG004DO','XG004','Đỏ',3,'8891aede-53f8-4ddc-859b-803377520b3c-NZBGpkdoYhzAXSph7Pev.jpg'),('XG004TRANG','XG004','Trắng',2,'0af86ee0-8d43-407f-a6e3-e784bc039652-PVv5bAR0a69T7Y2GTvQ9.jpg'),('XG005DEN','XG005','Đen',1,'4f6b9342-b441-4c4e-844c-ec84718ee5f8-GOm5BBZcpHe2Pu6RWNgh.png'),('XG005DO','XG005','Đỏ',3,'72f628f0-faae-4d69-80b2-3315c5cab3b2-3NsTtbQnERXX3VDbaoks.png'),('XG005XANH','XG005','Xanh',3,'fbcf05e6-318d-458e-b5f7-62ff5ed98a6f-9zVYrkyMgtcTsdthXVpi.png'),('XG006DEN','XG006','Đen',6,'85b67548-d191-4927-80ce-5dda7d8e2e37-gzBo5Re2aRvu0kc3mGzu.png'),('XG006DO','XG006','Đỏ',5,'05e5740b-2eb6-48bb-9948-234bf10d7b96-gfUfURy1WBwtBbVFH4FO.png'),('XG006TRANG','XG006','Trắng',3,'f80c047f-3b14-49a8-a326-c50ccd91d73b-1XtFTCi5IjN3fkiy3C3m.png'),('XG007DEN','XG007','Đen',2,'881b034c-0ffb-4f18-a493-c6e9698d5d37-UDvt2b8oUaEjVwt3fY1q.png'),('XG007DO','XG007','Đỏ',4,'c27b017e-0471-419f-b544-c26128a9a6bd-bckho9q1kDOnzCApjNpq.png'),('XG008DEN','XG008','Đen',5,'be419b55-840d-4eb3-8a53-b3b8a2407910-cjemdZcKqzQyG0jdM9rQ.png'),('XG008DO','XG008','Đỏ',3,'9ddb6a55-c62a-4dd9-ac86-8b4bc0b48333-uL67srpcKiBCGkqAiy1T.png'),('XG008TRANG','XG008','Trắng',4,'281fc60c-d97c-468d-b4dd-70f1c47471a6-7asMTwgZUhiX0FBRegRI.png'),('XS001DEN','XS001','Đen',4,'1fcd885e-00ce-4194-9ff4-1e5171c61f31-j37sLOXkDQsdX7nnBTOj.png'),('XS001DO','XS001','Đỏ',5,'eedc93b3-66d7-46ee-b7bb-c4ff4719bb2c-iiAYCAnu1Txg54Z6A6Ae.png'),('XS002DEN','XS002','Đen',3,'8fdafc25-da50-4fb2-a855-0d25c360a8da-X8XdCvdl9V5br7DYGcNh.png'),('XS002DO','XS002','Đỏ',3,'b6999990-2dfc-43ab-97b4-bdb69347a225-wwNzjZzNfijQ4YV0OQ8v.png'),('XS003DEN','XS003','Đen',3,'04d213cd-6f21-436c-aa76-e3f3b9032926-FGTa8tJ5LqpxS3s7OnZH.png'),('XS003DO','XS003','Đỏ',5,'d5f7b02d-3699-4d85-9389-676aded3efa2-egQdQH8QNTZsVzC85trX.png'),('XS005DEN','XS005','Đen',3,'b2ebdf5e-fda1-4d52-9427-ffc88a00104c-Kn2t7CHz4vuaDK9aj6g7 (1).png'),('XS005DO','XS005','Đỏ',5,'9e71a115-d94c-450c-be1b-4385426df07f-rekvNMjwCvz3tiYHy27g.png'),('XS005XANH','XS005','Xanh',32,'e1dab27e-450e-462f-84e0-5f1549c888d9-nrsqcdiLirob142y4Qbf.png');
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
INSERT INTO `sessions` VALUES ('SqBb4HN-oMCBQpZNC01-jSUOhYCdF5Uh',1684032680,'{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2023-05-13T15:42:28.152Z\",\"httpOnly\":true,\"path\":\"/\"},\"flashedData\":null,\"uid\":\"1\",\"username\":\"admin\",\"role\":3}'),('YbNPVATlaSF_hh7u3FQsIZ3d51UVtGrg',1683999345,'{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2023-05-13T16:14:01.014Z\",\"httpOnly\":true,\"path\":\"/\"},\"flashedData\":null,\"uid\":\"1\",\"username\":\"admin\",\"role\":3}'),('_MpmL65XMmk-L3T7WsD8Ap2PFZsp4hlR',1683972310,'{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2023-05-11T01:34:33.513Z\",\"httpOnly\":true,\"path\":\"/\"},\"flashedData\":null,\"uid\":null,\"username\":\"admin\",\"role\":3}'),('vqasTyQvByMj_6WQ0jS9OYjQcp19AhQd',1683768252,'{\"cookie\":{\"originalMaxAge\":259200000,\"expires\":\"2023-05-11T01:21:19.720Z\",\"httpOnly\":true,\"path\":\"/\"},\"flashedData\":null,\"uid\":\"1\",\"username\":\"admin\",\"role\":3,\"cart\":{\"items\":[{\"product\":{\"MaSP\":\"XM004DODEN\",\"MaDSP\":\"XM004\",\"TenMau\":\"Đỏ đen\",\"Kho\":3,\"Image\":\"41360f92-0f81-4ae6-8d8d-2c03b5950589-wwNzjZzNfijQ4YV0OQ8v.png\",\"ImagePath\":\"product-data/img/41360f92-0f81-4ae6-8d8d-2c03b5950589-wwNzjZzNfijQ4YV0OQ8v.png\",\"ImageUrl\":\"/products/assets/img/41360f92-0f81-4ae6-8d8d-2c03b5950589-wwNzjZzNfijQ4YV0OQ8v.png\",\"TenDSP\":\"Wave RSX FI 110\",\"Gia\":22000000},\"quantity\":\"5\",\"totalPrice\":110000000},{\"product\":{\"MaSP\":\"XM003DO\",\"MaDSP\":\"XM003\",\"TenMau\":\"Đỏ\",\"Kho\":7,\"Image\":\"34c60824-d0d7-4d8d-a1ac-c32a7ffd29e2-rlEEDjTrd0E9y8k5uHEN.png\",\"ImagePath\":\"product-data/img/34c60824-d0d7-4d8d-a1ac-c32a7ffd29e2-rlEEDjTrd0E9y8k5uHEN.png\",\"ImageUrl\":\"/products/assets/img/34c60824-d0d7-4d8d-a1ac-c32a7ffd29e2-rlEEDjTrd0E9y8k5uHEN.png\",\"TenDSP\":\"Future 125 FI\",\"Gia\":31000000},\"quantity\":\"2\",\"totalPrice\":62000000},{\"product\":{\"MaSP\":\"XM003TRANG\",\"MaDSP\":\"XM003\",\"TenMau\":\"Trắng\",\"Kho\":10,\"Image\":\"816d6342-faa2-4075-a74c-c7ce4eb18c41-mTuI6iTbdYCOkHBMnsNw.png\",\"ImagePath\":\"product-data/img/816d6342-faa2-4075-a74c-c7ce4eb18c41-mTuI6iTbdYCOkHBMnsNw.png\",\"ImageUrl\":\"/products/assets/img/816d6342-faa2-4075-a74c-c7ce4eb18c41-mTuI6iTbdYCOkHBMnsNw.png\",\"TenDSP\":\"Future 125 FI\",\"Gia\":31000000},\"quantity\":\"2\",\"totalPrice\":62000000},{\"product\":{\"MaSP\":\"TC005DO\",\"MaDSP\":\"TC005\",\"TenMau\":\"Đỏ\",\"Kho\":1,\"Image\":\"65791ec8-856d-4c05-b0a0-d90d1fd38eef-wmtKhw2HE9NQpoVl9yaz.jpg\",\"ImagePath\":\"product-data/img/65791ec8-856d-4c05-b0a0-d90d1fd38eef-wmtKhw2HE9NQpoVl9yaz.jpg\",\"ImageUrl\":\"/products/assets/img/65791ec8-856d-4c05-b0a0-d90d1fd38eef-wmtKhw2HE9NQpoVl9yaz.jpg\",\"TenDSP\":\"Rebel 500 2023\",\"Gia\":181000000},\"quantity\":1,\"totalPrice\":181000000},{\"product\":{\"MaSP\":\"TC005XANH\",\"MaDSP\":\"TC005\",\"TenMau\":\"Xám\",\"Kho\":3,\"Image\":\"1b59d5a5-3233-4c68-922c-28b2068b1d7c-ruZSLSBcmBdk729bE5zi.jpg\",\"ImagePath\":\"product-data/img/1b59d5a5-3233-4c68-922c-28b2068b1d7c-ruZSLSBcmBdk729bE5zi.jpg\",\"ImageUrl\":\"/products/assets/img/1b59d5a5-3233-4c68-922c-28b2068b1d7c-ruZSLSBcmBdk729bE5zi.jpg\",\"TenDSP\":\"Rebel 500 2023\",\"Gia\":181000000},\"quantity\":1,\"totalPrice\":181000000},{\"product\":{\"MaSP\":\"XG003TRANG\",\"MaDSP\":\"XG003\",\"TenMau\":\"Trắng\",\"Kho\":4,\"Image\":\"6292eb12-9008-4559-82ab-50c91c7088b3-ifWFSEQJkaCT4jEnrVcy.png\",\"ImagePath\":\"product-data/img/6292eb12-9008-4559-82ab-50c91c7088b3-ifWFSEQJkaCT4jEnrVcy.png\",\"ImageUrl\":\"/products/assets/img/6292eb12-9008-4559-82ab-50c91c7088b3-ifWFSEQJkaCT4jEnrVcy.png\",\"TenDSP\":\"Sh mode 125cc\",\"Gia\":58000000},\"quantity\":2,\"totalPrice\":116000000},{\"product\":{\"MaSP\":\"XG003DO\",\"MaDSP\":\"XG003\",\"TenMau\":\"ĐỎ\",\"Kho\":7,\"Image\":\"4c0a0b46-ade8-4f3f-85f9-c71967b7a118-RwFlE5cIdGVu3dWbNaYF.png\",\"ImagePath\":\"product-data/img/4c0a0b46-ade8-4f3f-85f9-c71967b7a118-RwFlE5cIdGVu3dWbNaYF.png\",\"ImageUrl\":\"/products/assets/img/4c0a0b46-ade8-4f3f-85f9-c71967b7a118-RwFlE5cIdGVu3dWbNaYF.png\",\"TenDSP\":\"Sh mode 125cc\",\"Gia\":58000000},\"quantity\":1,\"totalPrice\":58000000},{\"product\":{\"MaSP\":\"XG003XANH\",\"MaDSP\":\"XG003\",\"TenMau\":\"Xám\",\"Kho\":5,\"Image\":\"3dab9dc3-fa1c-44db-a8fc-63a19e26925e-BLeKgU273qamvxR9LCZA.png\",\"ImagePath\":\"product-data/img/3dab9dc3-fa1c-44db-a8fc-63a19e26925e-BLeKgU273qamvxR9LCZA.png\",\"ImageUrl\":\"/products/assets/img/3dab9dc3-fa1c-44db-a8fc-63a19e26925e-BLeKgU273qamvxR9LCZA.png\",\"TenDSP\":\"Sh mode 125cc\",\"Gia\":58000000},\"quantity\":2,\"totalPrice\":116000000},{\"product\":{\"MaSP\":\"XG003DODEN\",\"MaDSP\":\"XG003\",\"TenMau\":\"Đỏ đen\",\"Kho\":3,\"Image\":\"3c92bf73-c23b-4824-aecc-b138c09966c0-1uDqdLnICRlyqe8TSNza.png\",\"ImagePath\":\"product-data/img/3c92bf73-c23b-4824-aecc-b138c09966c0-1uDqdLnICRlyqe8TSNza.png\",\"ImageUrl\":\"/products/assets/img/3c92bf73-c23b-4824-aecc-b138c09966c0-1uDqdLnICRlyqe8TSNza.png\",\"TenDSP\":\"Sh mode 125cc\",\"Gia\":58000000},\"quantity\":1,\"totalPrice\":58000000},{\"product\":{\"MaSP\":\"XG003XANHDEN\",\"MaDSP\":\"XG003\",\"TenMau\":\"Xanh đen\",\"Kho\":2,\"Image\":\"e64f8fdf-3a55-4990-a4d5-2f0d63dba38c-AvewE7i9BJl2eQ7gykis (1).png\",\"ImagePath\":\"product-data/img/e64f8fdf-3a55-4990-a4d5-2f0d63dba38c-AvewE7i9BJl2eQ7gykis (1).png\",\"ImageUrl\":\"/products/assets/img/e64f8fdf-3a55-4990-a4d5-2f0d63dba38c-AvewE7i9BJl2eQ7gykis (1).png\",\"TenDSP\":\"Sh mode 125cc\",\"Gia\":58000000},\"quantity\":1,\"totalPrice\":58000000}],\"totalQuantity\":18,\"totalPrice\":1002000000}}');
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

-- Dump completed on 2023-05-11  9:52:10
