-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2026 at 07:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinebook_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `combos`
--

CREATE TABLE `combos` (
  `id` bigint(20) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` double NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Đang kinh doanh'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `combos`
--

INSERT INTO `combos` (`id`, `code`, `name`, `description`, `price`, `image_url`, `status`) VALUES
(1, 'CB_SOLO', 'Combo Solo', '1 Bắp ngọt vừa + 1 Nước Coca lớn', 69000, 'https://images.unsplash.com/photo-1578849278619-e73505e9610f?w=300', 'Đang kinh doanh'),
(2, 'CB_BIG', 'Combo Siêu To', '1 Bắp lớn + 2 Nước ngọt Coca lớn', 89000, 'https://images.unsplash.com/photo-1585647347483-22b66260dfff?w=300', 'Đang kinh doanh'),
(3, 'CB_FAMILY', 'Combo Gia Đình', '2 Bắp lớn + 4 Nước ngọt + 1 Snack', 159000, 'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=300', 'Đang kinh doanh');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `poster` varchar(550) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `release_date` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Đang chiếu',
  `cast` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `format_type` varchar(255) DEFAULT NULL,
  `poster_url` varchar(500) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `trailer_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `poster`, `duration`, `genre`, `release_date`, `description`, `status`, `cast`, `country`, `director`, `format_type`, `poster_url`, `rating`, `trailer_url`) VALUES
(1, 'Joker: Folie à Deux', 'https://image.tmdb.org/t/p/w500/aciP1Km8wa9ZudL9L23P3I3m3fE.jpg', 138, 'Tâm Lý, Tội Phạm', '2026-05-24', 'Cuộc tình điên rạn giữa Joker và Harley Quinn.', 'Đang chiếu', '', '', '', '2D', '/uploads/1790004377011_images.jpg', 8, ''),
(2, 'Alien: Romulus', 'https://image.tmdb.org/t/p/w500/b33323FuL3R6j4Q8sR2Wv9T3o2.jpg', 119, 'Kinh Dị, Viễn Tưởng', '2026-03-29', 'Sự trở lại của quái vật không gian Alien kinh điển.', 'Đang chiếu', '', '', '', '2D', '/uploads/1790004387788_images_(1).jpg', 8, ''),
(3, 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'https://image.tmdb.org/t/p/w500/1pdfLPoL3V3i12Ie1f0e4b85c1A.jpg', 111, 'Hoạt Hình, Trinh Thám', '2026-03-01', 'Trận chiến kho báu tại Hakodate giữa Conan và Siêu Trộm Kaito Kid.', 'Đang chiếu', '', '', '', '2D', '/uploads/1790004397068_images_(2).jpg', 8, ''),
(4, 'Deadpool & Wolverine', 'https://image.tmdb.org/t/p/w500/8cdWjv1fB2L2z22f2L23f2L23f2.jpg', 128, 'Hành Động, Hài Hước', '2026-07-26', 'Màn kết hợp bùng nổ giữa Deadpool và Wolverine.', 'Đang chiếu', '', '', '', '2D', '/uploads/1790004409239_images_(3).jpg', 8, ''),
(5, 'Despicable Me 4', 'https://image.tmdb.org/t/p/w500/w33323FuL3R6j4Q8sR2Wv9T3o2.jpg', 94, 'Hoạt Hình, Gia Đình', '2026-07-05', 'Kẻ Cắp Mặt Trăng tái xuất cùng dàn Minions siêu quậy.', 'Đang chiếu', '', '', '', '2D', '/uploads/1790004419318_images_(4).jpg', 8, ''),
(6, 'Inside Out 2', 'https://image.tmdb.org/t/p/w500/vpnP91L3V3i12Ie1f0e4b85c1A.jpg', 96, 'Hoạt Hình, Tình Cảm', '2026-06-14', 'Những cảm xúc mới xuất hiện trong tâm trí tuổi teen của Riley.', 'Đang chiếu', '', '', '', '2D', '/uploads/1790004428392_images_(5).jpg', 8, ''),
(7, 'Avatar 3: Fire and Ash', 'https://image.tmdb.org/t/p/w500/vE1111111111111111111111111.jpg', 190, 'Viễn Tưởng, Phiêu Lưu', '2026-12-18', 'Hành trình tiếp theo tại hành tinh Pandora với Tộc Tro Tàn.', 'Sắp chiếu', '', '', '', '2D', '/uploads/1790004438358_images_(6).jpg', 8, ''),
(8, 'Captain America: Brave New World', 'https://image.tmdb.org/t/p/w500/vE2222222222222222222222222.jpg', 135, 'Hành Động, Viễn Tưởng', '2027-02-14', 'Sam Wilson chính thức tiếp bước trở thành Captain America mới.', 'Sắp chiếu', '', '', '', '2D', '/uploads/1790004448698_images_(7).jpg', 8, '');

-- --------------------------------------------------------

--
-- Table structure for table `showtimes`
--

CREATE TABLE `showtimes` (
  `id` bigint(20) NOT NULL,
  `cinema_name` varchar(255) NOT NULL,
  `movie_title` varchar(255) NOT NULL,
  `room` varchar(50) NOT NULL,
  `show_date` varchar(50) NOT NULL,
  `show_time` varchar(50) NOT NULL,
  `ticket_price` double DEFAULT 75000,
  `status` varchar(50) DEFAULT 'Sắp chiếu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `showtimes`
--

INSERT INTO `showtimes` (`id`, `cinema_name`, `movie_title`, `room`, `show_date`, `show_time`, `ticket_price`, `status`) VALUES
(1, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-21', '09:00', 95000, 'Đang chiếu'),
(2, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-21', '14:15', 95000, 'Đang chiếu'),
(3, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-21', '10:30', 85000, 'Đang chiếu'),
(4, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-21', '18:45', 85000, 'Sắp chiếu'),
(5, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-21', '11:00', 75000, 'Đang chiếu'),
(6, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-21', '16:30', 75000, 'Sắp chiếu'),
(7, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-21', '13:00', 100000, 'Đang chiếu'),
(8, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'Phòng 1', '2026-09-21', '15:00', 75000, 'Đang chiếu'),
(9, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(10, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(11, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(12, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(13, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(14, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(15, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(16, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(17, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(18, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(19, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(20, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(21, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(22, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(23, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(24, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(25, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(26, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(27, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(28, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(29, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(30, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(31, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(32, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(33, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(34, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(35, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(36, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(37, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(38, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(39, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(40, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(41, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(42, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(43, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(44, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(45, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(46, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(47, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(48, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(49, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(50, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(51, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(52, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(53, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(54, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(55, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(56, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(57, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(58, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(59, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(60, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(61, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(62, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(63, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(64, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(65, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(66, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(67, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(68, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(69, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(70, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(71, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(72, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(73, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(74, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(75, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(76, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(77, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(78, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(79, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(80, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(81, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(82, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(83, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(84, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(85, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(86, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(87, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(88, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(89, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(90, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(91, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(92, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(93, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(94, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(95, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(96, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(97, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(98, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(99, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(100, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(101, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(102, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(103, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(104, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(105, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(106, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(107, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(108, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(109, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(110, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(111, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(112, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-22', '10:30', 85000, 'Đang chiếu'),
(113, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(114, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(115, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(116, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-22', '12:00', 85000, 'Đang chiếu'),
(117, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(118, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(119, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(120, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-22', '13:30', 85000, 'Đang chiếu'),
(121, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(122, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(123, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(124, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-22', '16:00', 85000, 'Đang chiếu'),
(125, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(126, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(127, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(128, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-22', '19:45', 85000, 'Đang chiếu'),
(129, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(130, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(131, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(132, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(133, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(134, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(135, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(136, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(137, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(138, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(139, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(140, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(141, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(142, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(143, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(144, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(145, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(146, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(147, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(148, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(149, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(150, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(151, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(152, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(153, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(154, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(155, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(156, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(157, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(158, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(159, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(160, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(161, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(162, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(163, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(164, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(165, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(166, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(167, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(168, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(169, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(170, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(171, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(172, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(173, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(174, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(175, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(176, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(177, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(178, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(179, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(180, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(181, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(182, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(183, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(184, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(185, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(186, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(187, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(188, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(189, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(190, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(191, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(192, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(193, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(194, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(195, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(196, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(197, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(198, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(199, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(200, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(201, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(202, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(203, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(204, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(205, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(206, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(207, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(208, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(209, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(210, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(211, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(212, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(213, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(214, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(215, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(216, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(217, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(218, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(219, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(220, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(221, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(222, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(223, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(224, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(225, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(226, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(227, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(228, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(229, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(230, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(231, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(232, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-23', '10:30', 85000, 'Đang chiếu'),
(233, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(234, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(235, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(236, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-23', '12:00', 85000, 'Đang chiếu'),
(237, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(238, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(239, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(240, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-23', '13:30', 85000, 'Đang chiếu'),
(241, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(242, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(243, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(244, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-23', '16:00', 85000, 'Đang chiếu'),
(245, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(246, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(247, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(248, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-23', '19:45', 85000, 'Đang chiếu'),
(249, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(250, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(251, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(252, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(253, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(254, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(255, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(256, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(257, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(258, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(259, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(260, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(261, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(262, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(263, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(264, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(265, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(266, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(267, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(268, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(269, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(270, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(271, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(272, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(273, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(274, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(275, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(276, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(277, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(278, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(279, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(280, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(281, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(282, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(283, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(284, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(285, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(286, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(287, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(288, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(289, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(290, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(291, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(292, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(293, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(294, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(295, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(296, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(297, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(298, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(299, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(300, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(301, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(302, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(303, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(304, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(305, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(306, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(307, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(308, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(309, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(310, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(311, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(312, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(313, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(314, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(315, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(316, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(317, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(318, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(319, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(320, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(321, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(322, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(323, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(324, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(325, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(326, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(327, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(328, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(329, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(330, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(331, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(332, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(333, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(334, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(335, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(336, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(337, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(338, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(339, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(340, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(341, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(342, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(343, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(344, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(345, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(346, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(347, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(348, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(349, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(350, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(351, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(352, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-24', '10:30', 85000, 'Đang chiếu'),
(353, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(354, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(355, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(356, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-24', '12:00', 85000, 'Đang chiếu'),
(357, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(358, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(359, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(360, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-24', '13:30', 85000, 'Đang chiếu'),
(361, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(362, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(363, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(364, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-24', '16:00', 85000, 'Đang chiếu'),
(365, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(366, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(367, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(368, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-24', '19:45', 85000, 'Đang chiếu'),
(369, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(370, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(371, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(372, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(373, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(374, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(375, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(376, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(377, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(378, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(379, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(380, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(381, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(382, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(383, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(384, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(385, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(386, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(387, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(388, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(389, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(390, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(391, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(392, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(393, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(394, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(395, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(396, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(397, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(398, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(399, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(400, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(401, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(402, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(403, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(404, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(405, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(406, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(407, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(408, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(409, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(410, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(411, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(412, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(413, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(414, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(415, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(416, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(417, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(418, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(419, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(420, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(421, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(422, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(423, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(424, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(425, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(426, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(427, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(428, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(429, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(430, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(431, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(432, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(433, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(434, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(435, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(436, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(437, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(438, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-25', '13:30', 85000, 'Đang chiếu');
INSERT INTO `showtimes` (`id`, `cinema_name`, `movie_title`, `room`, `show_date`, `show_time`, `ticket_price`, `status`) VALUES
(439, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(440, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(441, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(442, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(443, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(444, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(445, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(446, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(447, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(448, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(449, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(450, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(451, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(452, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(453, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(454, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(455, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(456, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(457, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(458, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(459, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(460, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(461, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(462, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(463, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(464, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(465, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(466, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(467, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(468, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(469, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(470, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(471, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(472, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-25', '10:30', 85000, 'Đang chiếu'),
(473, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(474, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(475, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(476, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-25', '12:00', 85000, 'Đang chiếu'),
(477, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(478, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(479, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(480, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-25', '13:30', 85000, 'Đang chiếu'),
(481, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(482, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(483, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(484, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-25', '16:00', 85000, 'Đang chiếu'),
(485, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(486, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(487, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(488, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-25', '19:45', 85000, 'Đang chiếu'),
(489, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(490, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(491, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(492, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(493, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(494, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(495, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(496, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(497, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(498, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(499, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(500, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(501, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(502, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(503, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(504, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(505, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(506, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(507, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(508, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(509, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(510, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(511, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(512, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(513, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(514, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(515, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(516, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(517, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(518, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(519, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(520, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(521, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(522, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(523, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(524, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(525, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(526, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(527, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(528, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(529, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(530, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(531, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(532, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(533, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(534, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(535, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(536, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(537, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(538, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(539, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(540, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(541, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(542, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(543, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(544, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(545, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(546, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(547, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(548, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(549, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(550, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(551, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(552, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(553, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(554, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(555, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(556, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(557, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(558, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(559, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(560, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(561, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(562, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(563, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(564, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(565, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(566, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(567, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(568, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(569, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(570, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(571, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(572, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(573, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(574, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(575, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(576, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(577, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(578, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(579, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(580, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(581, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(582, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(583, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(584, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(585, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(586, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(587, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(588, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(589, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(590, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(591, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(592, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-26', '10:30', 85000, 'Đang chiếu'),
(593, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(594, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(595, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(596, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-26', '12:00', 85000, 'Đang chiếu'),
(597, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(598, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(599, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(600, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-26', '13:30', 85000, 'Đang chiếu'),
(601, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(602, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(603, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(604, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-26', '16:00', 85000, 'Đang chiếu'),
(605, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(606, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(607, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(608, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-26', '19:45', 85000, 'Đang chiếu'),
(609, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(610, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(611, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(612, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(613, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(614, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(615, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(616, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(617, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(618, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(619, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(620, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(621, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(622, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(623, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(624, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(625, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(626, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(627, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(628, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(629, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(630, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(631, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(632, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(633, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(634, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(635, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(636, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(637, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(638, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(639, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(640, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(641, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(642, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(643, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(644, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(645, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(646, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(647, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(648, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(649, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(650, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(651, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(652, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(653, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(654, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(655, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(656, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(657, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(658, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(659, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(660, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(661, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(662, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(663, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(664, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(665, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(666, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(667, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(668, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(669, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(670, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(671, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(672, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(673, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(674, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(675, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(676, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(677, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(678, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(679, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(680, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(681, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(682, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(683, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(684, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(685, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(686, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(687, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(688, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(689, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(690, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(691, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(692, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(693, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(694, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(695, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(696, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(697, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(698, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(699, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(700, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(701, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(702, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(703, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(704, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(705, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(706, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(707, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(708, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(709, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(710, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(711, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(712, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-27', '10:30', 85000, 'Đang chiếu'),
(713, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(714, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(715, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(716, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-27', '12:00', 85000, 'Đang chiếu'),
(717, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(718, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(719, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(720, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-27', '13:30', 85000, 'Đang chiếu'),
(721, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(722, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(723, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(724, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-27', '16:00', 85000, 'Đang chiếu'),
(725, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(726, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(727, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(728, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-27', '19:45', 85000, 'Đang chiếu'),
(729, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(730, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(731, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(732, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(733, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(734, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(735, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(736, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(737, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(738, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(739, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(740, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(741, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(742, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(743, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(744, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(745, 'CINEBOOK Vincom Center Đồng Khởi', 'Joker: Folie à Deux', 'IMAX', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(746, 'CINEBOOK Landmark 81', 'Joker: Folie à Deux', 'Phòng 2', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(747, 'CINEBOOK Crescent Mall', 'Joker: Folie à Deux', '3D', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(748, 'CINEBOOK Royal City', 'Joker: Folie à Deux', 'Phòng VIP', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(749, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(750, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(751, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(752, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(753, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(754, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(755, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(756, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(757, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(758, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(759, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(760, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(761, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(762, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(763, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(764, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(765, 'CINEBOOK Vincom Center Đồng Khởi', 'Alien: Romulus', 'IMAX', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(766, 'CINEBOOK Landmark 81', 'Alien: Romulus', 'Phòng 2', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(767, 'CINEBOOK Crescent Mall', 'Alien: Romulus', '3D', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(768, 'CINEBOOK Royal City', 'Alien: Romulus', 'Phòng VIP', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(769, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(770, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(771, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(772, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(773, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(774, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(775, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(776, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(777, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(778, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(779, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(780, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(781, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(782, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(783, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(784, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(785, 'CINEBOOK Vincom Center Đồng Khởi', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'IMAX', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(786, 'CINEBOOK Landmark 81', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng 2', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(787, 'CINEBOOK Crescent Mall', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', '3D', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(788, 'CINEBOOK Royal City', 'Thám Tử Lừng Danh Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', 'Phòng VIP', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(789, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(790, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(791, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(792, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(793, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(794, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(795, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(796, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(797, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(798, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(799, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(800, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(801, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(802, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(803, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(804, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(805, 'CINEBOOK Vincom Center Đồng Khởi', 'Deadpool & Wolverine', 'IMAX', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(806, 'CINEBOOK Landmark 81', 'Deadpool & Wolverine', 'Phòng 2', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(807, 'CINEBOOK Crescent Mall', 'Deadpool & Wolverine', '3D', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(808, 'CINEBOOK Royal City', 'Deadpool & Wolverine', 'Phòng VIP', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(809, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(810, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(811, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(812, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(813, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(814, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(815, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(816, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(817, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(818, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(819, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(820, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(821, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(822, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(823, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(824, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(825, 'CINEBOOK Vincom Center Đồng Khởi', 'Despicable Me 4', 'IMAX', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(826, 'CINEBOOK Landmark 81', 'Despicable Me 4', 'Phòng 2', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(827, 'CINEBOOK Crescent Mall', 'Despicable Me 4', '3D', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(828, 'CINEBOOK Royal City', 'Despicable Me 4', 'Phòng VIP', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(829, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(830, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(831, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(832, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-28', '10:30', 85000, 'Đang chiếu'),
(833, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(834, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(835, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(836, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-28', '12:00', 85000, 'Đang chiếu'),
(837, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(838, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(839, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(840, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-28', '13:30', 85000, 'Đang chiếu'),
(841, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(842, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(843, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(844, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-28', '16:00', 85000, 'Đang chiếu'),
(845, 'CINEBOOK Vincom Center Đồng Khởi', 'Furiosa: A Mad Max Saga', 'IMAX', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(846, 'CINEBOOK Landmark 81', 'Furiosa: A Mad Max Saga', 'Phòng 2', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(847, 'CINEBOOK Crescent Mall', 'Furiosa: A Mad Max Saga', '3D', '2026-09-28', '19:45', 85000, 'Đang chiếu'),
(848, 'CINEBOOK Royal City', 'Furiosa: A Mad Max Saga', 'Phòng VIP', '2026-09-28', '19:45', 85000, 'Đang chiếu');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `movie_title` varchar(255) DEFAULT NULL,
  `cinema` varchar(255) DEFAULT NULL,
  `cinema_name` varchar(255) DEFAULT NULL,
  `show_time` varchar(255) DEFAULT NULL,
  `seats` varchar(255) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `booking_date` datetime DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'Đã thanh toán',
  `combos` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `movie_title`, `cinema`, `cinema_name`, `show_time`, `seats`, `total_price`, `booking_date`, `status`, `combos`) VALUES
(2, 1, 'Furiosa: A Mad Max Saga', 'dong-khoi', 'CINEBOOK Vincom Center Đồng Khởi', '09:00 - 07-09-2026', 'A5', 75000, '2026-09-07 10:20:15', 'Đã hủy', NULL),
(3, 1, 'Furiosa: A Mad Max Saga', 'bien-hoa', 'CINEBOOK Biên Hòa', '09:00 - 07-09-2026', 'A1', 75000, '2026-09-09 07:54:27', 'Chờ thanh toán', NULL),
(4, 1, 'Godzilla x Kong: Đế Chế Mới', 'dong-khoi', 'CINEBOOK Vincom Center Đồng Khởi', '09:00 - 07-09-2026', 'A2', 75000, '2026-09-09 08:49:53', 'Đã thanh toán', NULL),
(5, NULL, 'Thám Tử Lừng Danh Conan', 'CINEBOOK Crescent Mall', 'CINEBOOK Crescent Mall', '11:00 - 2026-09-21', 'C1, C2', 150000, '2026-09-22 12:00:00', 'Đã hủy', NULL),
(6, NULL, 'Furiosa: A Mad Max Saga', 'CINEBOOK Vincom Center Đồng Khởi', 'CINEBOOK Vincom Center Đồng Khởi', '09:00 - 13-09-2026', 'A4', 37500, '2026-09-22 12:00:00', 'Chờ thanh toán', NULL),
(7, NULL, 'Furiosa: A Mad Max Saga', 'CINEBOOK Landmark 81', 'CINEBOOK Landmark 81', '12:00 - 07-09-2026', 'A1', 75000, '2026-09-22 12:00:00', 'Đã thanh toán', NULL),
(8, NULL, 'Furiosa: A Mad Max Saga', 'CINEBOOK Royal City', 'CINEBOOK Royal City', '09:00 - 09-09-2026', 'A1', 52500, '2026-09-22 12:00:00', 'Đã thanh toán', NULL),
(9, NULL, 'Furiosa: A Mad Max Saga', 'CINEBOOK Vincom Center Đồng Khởi', 'CINEBOOK Vincom Center Đồng Khởi', '09:00 - 2026-09-21', 'A2, A3', 150000, '2026-09-22 12:00:00', 'Đã thanh toán', NULL),
(10, NULL, 'Furiosa: A Mad Max Saga', 'CINEBOOK Vincom Center Đồng Khởi', 'CINEBOOK Vincom Center Đồng Khởi', '14:15 - 2026-09-21', 'B4, B3, C5', 225000, '2026-09-22 12:00:00', 'Đã thanh toán', NULL),
(11, 3, 'Furiosa: A Mad Max Saga', 'CINEBOOK Landmark 81', 'CINEBOOK Landmark 81', '13:00 - 2026-09-21', 'D4, D3', 75000, '2026-09-21 16:04:40', 'Đã thanh toán', NULL),
(12, 3, 'Furiosa: A Mad Max Saga', 'CINEBOOK Crescent Mall', 'CINEBOOK Crescent Mall', '16:30 - 2026-09-21', 'C4, C5, F7', 225000, '2026-09-21 16:40:04', 'Đã thanh toán', NULL),
(13, 3, 'Furiosa: A Mad Max Saga', 'CINEBOOK Crescent Mall', 'CINEBOOK Crescent Mall', '16:30 - 2026-09-21', 'G3, G4, G5', 225000, '2026-09-21 16:54:49', 'Đã hủy', NULL),
(14, 3, 'Furiosa: A Mad Max Saga', 'CINEBOOK Crescent Mall', 'CINEBOOK Crescent Mall', '16:30 - 2026-09-21', 'F10, F11, F12', 225000, '2026-09-21 16:54:59', 'Đã thanh toán', NULL),
(15, 3, 'Furiosa: A Mad Max Saga', 'CINEBOOK Vincom Center Đồng Khởi', 'CINEBOOK Vincom Center Đồng Khởi', '12:00 - 2026-09-22', 'C3, C4', 153300, '2026-09-21 17:07:23', 'Đã thanh toán', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `transaction_code` varchar(255) DEFAULT NULL,
  `seats_description` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `status` varchar(255) DEFAULT 'Thành công',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `transaction_code`, `seats_description`, `amount`, `status`, `created_at`) VALUES
(2, 1, '#TR-15545', 'A5', 75000, 'Thành công', '2026-09-07 10:20:15'),
(3, 1, '#TR-67525', 'A1', 75000, 'Thành công', '2026-09-09 07:54:27'),
(4, 1, '#TR-93748', 'A2', 75000, 'Thành công', '2026-09-09 08:49:53'),
(5, 1, '#TR-82017', 'A3', 37500, 'Thành công', '2026-09-09 08:58:02'),
(6, 1, '#TR-86100', 'A4', 37500, 'Thành công', '2026-09-09 09:01:26'),
(7, 1, '#TR-97512', 'A1', 75000, 'Thành công', '2026-09-09 09:18:17'),
(8, 1, '#TR-54730', 'A1', 52500, 'Thành công', '2026-09-09 16:04:14'),
(9, 1, '#TR-97087', 'A2, A3', 150000, 'Thành công', '2026-09-21 09:26:37'),
(10, 3, '#TR-68769', 'B4, B3, C5', 225000, 'Thành công', '2026-09-21 15:47:48'),
(11, 3, '#TR-80522', 'D4, D3', 75000, 'Thành công', '2026-09-21 16:04:40'),
(12, 3, '#TR-4707', 'C4, C5, F7', 225000, 'Thành công', '2026-09-21 16:40:04'),
(13, 3, '#TR-89420', 'G3, G4, G5', 225000, 'Chờ thanh toán', '2026-09-21 16:54:49'),
(14, 3, '#TR-99963', 'F10, F11, F12', 225000, 'Chờ thanh toán', '2026-09-21 16:54:59'),
(15, 3, '#TR-43810', 'C3, C4', 153300, 'Chờ thanh toán', '2026-09-21 17:07:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'USER',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `birthday` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `phone`, `password`, `role`, `created_at`, `birthday`) VALUES
(1, 'Linh Xinh Gái', 'linhgay22@gmail.com', '01234423242', '12345', 'USER', '2026-08-23 17:21:01', '14-10-2000'),
(3, 'Long Trần T', 'longzai14102@gmail.com', '0123332112', '123456@a', 'USER', '2026-08-24 00:46:57', NULL),
(4, 'THIỆU NGUYỄN', 'vanthieu@gmail.com', '012345678', '12345', 'USER', '2026-09-09 03:15:31', NULL),
(8, 'Linh Chu', 'linhchu@gmail.com', '09876789876', '123456', 'USER', '2026-09-09 03:18:29', ''),
(9, 'Admin', 'admin@cinebook.com', '0999999999', '123456', 'ADMIN', '2026-09-09 03:31:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` bigint(20) NOT NULL,
  `code` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `expiry_date` varchar(50) DEFAULT NULL,
  `icon_class` varchar(100) DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `iconClass` varchar(100) DEFAULT 'fa-solid fa-gift'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `code`, `title`, `description`, `expiry_date`, `icon_class`, `is_hot`, `user_id`, `iconClass`) VALUES
(1, 'SUMMER50', 'Ưu đãi chào hè rực rỡ', 'Giảm 50.000đ đơn từ 150k', '2026-12-31', NULL, 1, NULL, 'fa-solid fa-sun'),
(2, 'CINE20', 'Tri ân thành viên mới', 'Giảm 20.000đ cho mọi đơn đặt vé', '2026-10-15', NULL, 0, NULL, 'fa-solid fa-ticket'),
(3, 'HALLOWEEN', 'Đêm tiệc kinh dị Halloween', 'Giảm 30% tổng hóa đơn vé & combo', '2026-10-31', NULL, 1, NULL, 'fa-solid fa-ghost'),
(4, 'VIPMEMBER', 'Đặc quyền thành viên VIP', 'Giảm 100.000đ cho đơn từ 300k', '2026-11-20', NULL, 0, NULL, 'fa-solid fa-crown');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `combos`
--
ALTER TABLE `combos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `showtimes`
--
ALTER TABLE `showtimes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4eqsebpimnjen0q46ja6fl2hl` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_voucher_user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `combos`
--
ALTER TABLE `combos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `showtimes`
--
ALTER TABLE `showtimes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1032;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `FK4eqsebpimnjen0q46ja6fl2hl` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `voucher`
--
ALTER TABLE `voucher`
  ADD CONSTRAINT `fk_voucher_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
