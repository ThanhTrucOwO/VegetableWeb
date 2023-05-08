-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 08, 2023 lúc 04:20 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `market3`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `CatagoryID` int(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`CatagoryID`, `Name`, `Description`) VALUES
(1, 'Fruit', 'The kind that can be eaten without cooking'),
(2, 'Green Vegetables', 'The kind used to make salads or soups'),
(3, 'Spices', 'The kind used to enhance the taste of food');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Fullname` varchar(40) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`CustomerID`, `Password`, `Fullname`, `Address`, `City`, `Username`) VALUES
(1, 'Abcd1234', 'John Smith', '30 Broadway', 'London', 'pro'),
(2, 'Abcd1234', 'Jonny English', '99 River View', 'Reading', ''),
(3, 'Abcd1234', 'Elizabeth', '23 Buckinghamshire', 'York', ''),
(4, 'Abcd1234', 'Beatrix', '66 Royal Crescent', 'Bath', ''),
(6, '123', 'Huong', 'Thu Duc', 'HCM', ''),
(7, '', 'John Smith', '30 Broadway 1111', 'London 1111', ''),
(8, '123', 'thanh', 'q5', 'binh duong', 'thanhtruc'),
(11, '123', 'Thanh Truc', '273 adv', NULL, 'thanhtruc123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `OrderID` int(10) UNSIGNED NOT NULL,
  `CustomerID` int(10) NOT NULL,
  `Date` date NOT NULL,
  `Total` float NOT NULL,
  `Note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`OrderID`, `CustomerID`, `Date`, `Total`, `Note`) VALUES
(0, 1, '2021-08-15', 150, 'Use environmental protection bags'),
(1, 2, '2021-08-16', 235, ''),
(2, 3, '2021-08-16', 65, 'Need fast delivery'),
(3, 3, '2021-08-17', 80, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `stt` int(11) NOT NULL,
  `OrderID` int(10) NOT NULL,
  `VegetableID` int(10) NOT NULL,
  `Quantity` tinyint(4) NOT NULL,
  `Price` float NOT NULL,
  `date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`stt`, `OrderID`, `VegetableID`, `Quantity`, `Price`, `date`, `note`, `total`) VALUES
(1, 0, 1, 1, 30, NULL, NULL, NULL),
(2, 0, 8, 1, 120, NULL, NULL, NULL),
(3, 1, 4, 1, 80, NULL, NULL, NULL),
(4, 1, 2, 1, 35, NULL, NULL, NULL),
(5, 1, 3, 1, 150, NULL, NULL, NULL),
(6, 2, 5, 1, 35, NULL, NULL, NULL),
(7, 2, 7, 2, 30, NULL, NULL, NULL),
(8, 3, 6, 2, 80, NULL, NULL, NULL),
(17, 9, 6, 1, 40, NULL, NULL, NULL),
(18, 9, 1, 2, 30, NULL, NULL, NULL),
(19, 10, 1, 10, 30, NULL, NULL, NULL),
(20, 10, 2, 10, 35, NULL, NULL, NULL),
(21, 1, 2, 1, 35, NULL, NULL, NULL),
(22, 69, 2, 1, 35, NULL, NULL, NULL),
(34, 4, 1, 1, 30, NULL, NULL, NULL),
(35, 79, 1, 3, 90, NULL, NULL, NULL),
(36, 79, 8, 4, 480, NULL, NULL, NULL),
(37, 80, 1, 3, 90, NULL, NULL, NULL),
(38, 80, 8, 4, 480, NULL, NULL, NULL),
(39, 81, 1, 3, 90, NULL, NULL, NULL),
(40, 81, 8, 4, 480, NULL, NULL, NULL),
(41, 82, 7, 4, 60, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vegetable`
--

CREATE TABLE `vegetable` (
  `VegetableID` int(11) NOT NULL,
  `CatagoryID` int(10) NOT NULL,
  `Vegetable_Name` varchar(50) DEFAULT NULL,
  `Unit` varchar(20) NOT NULL,
  `Amount` int(10) NOT NULL,
  `Image` varchar(50) NOT NULL,
  `Price` float NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vegetable`
--

INSERT INTO `vegetable` (`VegetableID`, `CatagoryID`, `Vegetable_Name`, `Unit`, `Amount`, `Image`, `Price`, `description`, `categoryid`) VALUES
(1, 1, 'Tomato', 'kg', 100, 'tomato.jpg', 30, NULL, NULL),
(2, 1, 'potato', 'kg', 150, 'potato.jpg', 35, NULL, NULL),
(3, 1, 'Apple', 'bag', 50, 'apple.jpg', 150, NULL, NULL),
(4, 1, 'Water melon', 'per fruit', 20, 'watermelon.jpg', 80, NULL, NULL),
(5, 2, ' broccoli', 'kg', 50, 'broccoli.jpg', 35, NULL, NULL),
(6, 2, 'celery', 'kg', 80, 'celery.jpg', 40, NULL, NULL),
(7, 3, ' spring onion', 'bunch', 50, 'springonion.jpg', 15, NULL, NULL),
(8, 3, 'garlic', 'kg', 30, 'garlic.jpg', 120, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CatagoryID`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`stt`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `VegetableID` (`VegetableID`);

--
-- Chỉ mục cho bảng `vegetable`
--
ALTER TABLE `vegetable`
  ADD PRIMARY KEY (`VegetableID`),
  ADD KEY `CatagoryID` (`CatagoryID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `vegetable`
--
ALTER TABLE `vegetable`
  MODIFY `VegetableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Các ràng buộc cho bảng `vegetable`
--
ALTER TABLE `vegetable`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`CatagoryID`) REFERENCES `category` (`CatagoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
