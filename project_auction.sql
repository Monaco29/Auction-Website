-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: Localhost:3307:3307
-- Generation Time: Apr 24, 2025 at 03:54 PM
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
-- Database: `project_auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_bidders`
--

CREATE TABLE `active_bidders` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_typing` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `active_bidders`
--

INSERT INTO `active_bidders` (`id`, `buyer_id`, `auction_id`, `joined_at`, `is_typing`) VALUES
(71, 8, 20, '2025-04-24 06:32:20', 0),
(72, 7, 20, '2025-04-24 06:39:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `auction`
--

CREATE TABLE `auction` (
  `auction_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `auction_start` datetime NOT NULL DEFAULT current_timestamp(),
  `auction_end` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('OnGoing','Closed','Upcoming') NOT NULL DEFAULT 'Upcoming',
  `seller_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auction`
--

INSERT INTO `auction` (`auction_id`, `item_id`, `auction_start`, `auction_end`, `status`, `seller_id`, `category_id`, `title`, `description`) VALUES
(17, 19, '2025-04-24 09:45:00', '2025-04-24 10:44:00', 'Closed', 4, 7, 'School bag', 'Stylish school bag'),
(18, 20, '2025-04-24 10:22:00', '2025-04-24 11:20:00', 'Closed', 4, 5, 'Figher jet', 'Fighter jet'),
(19, 21, '2025-04-24 10:33:00', '2025-04-24 11:32:00', 'Closed', 4, 5, 'Buggati toy car', 'toy car'),
(20, 22, '2025-04-24 10:41:00', '2025-04-24 11:41:00', 'Closed', 4, 5, 'Radio control plane', 'Radio control plane');

-- --------------------------------------------------------

--
-- Table structure for table `auction_permission`
--

CREATE TABLE `auction_permission` (
  `per_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `start_auction` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auction_permission`
--

INSERT INTO `auction_permission` (`per_id`, `auction_id`, `start_auction`) VALUES
(28, 17, 0),
(29, 18, 0),
(30, 19, 0),
(31, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `auction_registration`
--

CREATE TABLE `auction_registration` (
  `auction_registration_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','Approved','Rejected') NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auction_registration`
--

INSERT INTO `auction_registration` (`auction_registration_id`, `auction_id`, `buyer_id`, `registered_at`, `status`, `item_id`) VALUES
(22, 17, 9, '2025-04-24 04:15:15', 'Approved', 19),
(23, 17, 8, '2025-04-24 04:16:34', 'Approved', 19),
(24, 18, 9, '2025-04-24 04:42:52', 'Approved', 20),
(25, 18, 7, '2025-04-24 04:42:58', 'Approved', 20),
(26, 18, 8, '2025-04-24 04:43:04', 'Approved', 20),
(27, 19, 9, '2025-04-24 05:03:22', 'Approved', 21),
(28, 19, 7, '2025-04-24 05:03:29', 'Approved', 21),
(29, 19, 8, '2025-04-24 05:04:00', 'Approved', 21),
(30, 20, 8, '2025-04-24 05:11:35', 'Approved', 22),
(31, 20, 9, '2025-04-24 05:11:52', 'Approved', 22),
(32, 20, 7, '2025-04-24 05:11:58', 'Approved', 22);

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

CREATE TABLE `bid` (
  `bid_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `bid_amount` float NOT NULL,
  `bid_time` datetime NOT NULL DEFAULT current_timestamp(),
  `has_won` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bid`
--

INSERT INTO `bid` (`bid_id`, `auction_id`, `buyer_id`, `bid_amount`, `bid_time`, `has_won`) VALUES
(81, 17, 8, 888, '2025-04-24 09:47:19', 0),
(82, 17, 9, 1000, '2025-04-24 09:47:39', 0),
(83, 17, 8, 2000, '2025-04-24 09:47:49', 1),
(84, 18, 8, 1700, '2025-04-24 10:14:02', 0),
(85, 18, 7, 2000, '2025-04-24 10:14:12', 0),
(86, 18, 8, 4000, '2025-04-24 10:14:16', 0),
(87, 18, 7, 4111, '2025-04-24 10:14:31', 0),
(88, 18, 8, 4200, '2025-04-24 10:14:36', 0),
(89, 18, 7, 5555, '2025-04-24 10:14:55', 0),
(90, 18, 8, 6666, '2025-04-24 10:23:28', 0),
(91, 18, 9, 7000, '2025-04-24 10:23:38', 1),
(92, 18, 7, 8000, '2025-04-24 10:28:13', 1),
(93, 19, 8, 700, '2025-04-24 10:34:42', 0),
(94, 19, 7, 800, '2025-04-24 10:34:54', 0),
(95, 19, 8, 900, '2025-04-24 10:35:02', 0),
(96, 19, 9, 1000, '2025-04-24 10:35:08', 1),
(97, 20, 8, 300, '2025-04-24 10:42:56', 0),
(98, 20, 9, 333, '2025-04-24 10:42:59', 0),
(99, 20, 8, 500, '2025-04-24 10:43:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `buyer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wallet_balance` int(11) NOT NULL DEFAULT 50000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`buyer_id`, `user_id`, `wallet_balance`) VALUES
(7, 22, 36445),
(8, 23, 47500),
(9, 25, 42000),
(10, 26, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `description`, `created_at`) VALUES
(5, 'Automobile', 'Automobile products', '2025-04-05 09:22:35'),
(6, 'Cosmatics', 'Cosmatic products', '2025-04-05 09:22:53'),
(7, 'Toys', 'Toys', '2025-04-05 09:35:07'),
(8, 'Electronics', 'Electronic items', '2025-04-15 21:21:21');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(70) NOT NULL,
  `message` varchar(100) NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_tracking`
--

CREATE TABLE `delivery_tracking` (
  `delivery_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `shipping_address` text NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `country` varchar(100) DEFAULT 'India',
  `current_status` varchar(50) DEFAULT 'Pending',
  `tracking_details` text DEFAULT NULL,
  `estimated_delivery_date` date DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tracking_number` varchar(50) DEFAULT NULL,
  `courier_name` varchar(100) DEFAULT NULL,
  `courier_api_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_tracking`
--

INSERT INTO `delivery_tracking` (`delivery_id`, `transaction_id`, `buyer_id`, `shipping_address`, `city`, `state`, `pincode`, `country`, `current_status`, `tracking_details`, `estimated_delivery_date`, `updated_at`, `tracking_number`, `courier_name`, `courier_api_url`) VALUES
(1, 56, 8, 'Sangna society', 'Surat', 'Gujarat', '395010', 'India', 'Pending', 'Package is being prepared for shipment.', '2025-04-28', '2025-04-24 04:18:36', 'TRK6809BB9C98989', 'DemoCourier', 'https://demo.courier.api/track/TRK6809BB9C98989'),
(2, 59, 7, 'D-45 Matrushakti society', 'Surat', 'Gujarat', '395010', 'India', 'Pending', 'Package is being prepared for shipment.', '2025-04-28', '2025-04-24 04:59:19', 'TRK6809C527BC74E', 'DemoCourier', 'https://demo.courier.api/track/TRK6809C527BC74E'),
(3, 60, 9, 'D/45 matru shati society', 'Ahmedabad', 'Surat', '234567', 'India', 'Pending', 'Package is being prepared for shipment.', '2025-04-28', '2025-04-24 05:05:39', 'TRK6809C6A36837C', 'DemoCourier', 'https://demo.courier.api/track/TRK6809C6A36837C'),
(4, 61, 8, 'Sangna society', 'Surat', 'Gujarat', '395010', 'India', 'Pending', 'Package is being prepared for shipment.', '2025-04-28', '2025-04-24 05:16:37', 'TRK6809C93548457', 'DemoCourier', 'https://demo.courier.api/track/TRK6809C93548457');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `invoice_date` datetime DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('Paid','Unpaid') DEFAULT 'Unpaid',
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `transaction_id`, `invoice_date`, `total_amount`, `status`, `buyer_id`, `seller_id`) VALUES
(20, 56, '2025-04-24 09:48:36', 2440.00, 'Paid', 8, 4),
(21, 57, '2025-04-24 10:15:41', 6777.10, 'Paid', 7, 4),
(22, 58, '2025-04-24 10:24:14', 8540.00, 'Paid', 9, 4),
(23, 59, '2025-04-24 10:29:19', 9760.00, 'Paid', 7, 4),
(24, 60, '2025-04-24 10:35:39', 1220.00, 'Paid', 9, 4),
(25, 61, '2025-04-24 10:46:37', 610.00, 'Paid', 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` varchar(200) NOT NULL,
  `start_price` float NOT NULL,
  `end_price` float NOT NULL,
  `picture` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `seller_id`, `name`, `description`, `start_price`, `end_price`, `picture`, `category_id`) VALUES
(19, 4, 'Bag', 'School bag', 200, 2000, 'bag.jpg', 7),
(20, 4, 'Jet', 'Fighter jet', 1000, 8000, 'F-35.jpg', 5),
(21, 4, 'Buggati', 'buggati', 200, 1000, 'buggati.jpg', 5),
(22, 4, 'RC plance', 'Radio Control aircraft', 299, 500, 'rc_plane.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subscribed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletter_subscribers`
--

INSERT INTO `newsletter_subscribers` (`id`, `email`, `subscribed_at`) VALUES
(1, 'parthkachhadiya04@gmail.com', '2025-04-16 08:10:30');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(200) NOT NULL,
  `sent_time` datetime NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `user_id`, `message`, `sent_time`, `is_read`) VALUES
(136, 25, '🎉 Green Light! Your auction request is approved. Prepare your best bid - the auction floor awaits your brilliance 🥳!', '2025-04-24 09:45:36', 1),
(137, 23, '🎉 Green Light! Your auction request is approved. Prepare your best bid - the auction floor awaits your brilliance 🥳!', '2025-04-24 09:46:39', 1),
(138, 25, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 09:47:12', 1),
(139, 23, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 09:47:12', 1),
(140, 23, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 09:48:09', 1),
(141, 23, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 09:48:10', 1),
(142, 23, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 09:48:11', 1),
(143, 25, '🎉 Green Light! Your auction request is approved. Prepare your best bid - the auction floor awaits your brilliance 🥳!', '2025-04-24 10:13:11', 1),
(144, 22, '🎉 Green Light! Your auction request is approved. Prepare your best bid - the auction floor awaits your brilliance 🥳!', '2025-04-24 10:13:13', 1),
(145, 23, '🎉 Green Light! Your auction request is approved. Prepare your best bid - the auction floor awaits your brilliance 🥳!', '2025-04-24 10:13:15', 1),
(146, 25, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:13:34', 1),
(147, 22, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:13:34', 1),
(148, 23, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:13:34', 1),
(149, 22, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:15:09', 1),
(150, 22, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:15:10', 1),
(151, 22, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:15:13', 1),
(152, 22, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:15:13', 1),
(153, 25, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:22:57', 1),
(154, 22, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:22:57', 1),
(155, 23, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:22:57', 1),
(156, 25, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:23:43', 1),
(157, 25, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:23:43', 1),
(158, 25, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:23:45', 1),
(159, 25, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:23:45', 1),
(160, 25, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:27:19', 1),
(161, 22, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:27:19', 1),
(162, 23, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:27:19', 1),
(163, 22, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:28:21', 1),
(164, 22, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:28:22', 1),
(165, 22, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:28:24', 1),
(166, 22, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:28:29', 1),
(167, 25, '🎉 Green Light! Your auction request is approved. Prepare your best bid - the auction floor awaits your brilliance 🥳!', '2025-04-24 10:33:35', 1),
(168, 22, '🎉 Green Light! Your auction request is approved. Prepare your best bid - the auction floor awaits your brilliance 🥳!', '2025-04-24 10:33:38', 1),
(169, 23, '🎉 Green Light! Your auction request is approved. Prepare your best bid - the auction floor awaits your brilliance 🥳!', '2025-04-24 10:34:10', 1),
(170, 25, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:34:34', 1),
(171, 22, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:34:34', 1),
(172, 23, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:34:34', 1),
(173, 25, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:35:14', 1),
(174, 25, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:35:15', 1),
(175, 25, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:35:16', 1),
(176, 25, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:35:18', 1),
(177, 23, '🎉 Green Light! Your auction request is approved. Prepare your best bid - the auction floor awaits your brilliance 🥳!', '2025-04-24 10:42:04', 1),
(178, 25, '🎉 Green Light! Your auction request is approved. Prepare your best bid - the auction floor awaits your brilliance 🥳!', '2025-04-24 10:42:06', 1),
(179, 22, '🎉 Green Light! Your auction request is approved. Prepare your best bid - the auction floor awaits your brilliance 🥳!', '2025-04-24 10:42:09', 1),
(180, 23, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:42:49', 1),
(181, 25, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:42:49', 1),
(182, 22, '🚀 Auction Kickoff! The seller has just launched the auction. Get your bids ready and join the excitement!', '2025-04-24 10:42:49', 1),
(183, 23, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:43:56', 1),
(184, 23, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:43:56', 1),
(185, 23, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:43:57', 1),
(186, 23, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 10:44:01', 1),
(187, 23, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 13:44:53', 0),
(188, 23, '🎉 Victory is Yours! Congratulations on winning the auction! Your bid was unbeatable—enjoy your well-deserved win!', '2025-04-24 13:45:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `receipt_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  `payment_method` varchar(50) DEFAULT NULL,
  `reference_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revenue`
--

CREATE TABLE `revenue` (
  `rev_id` int(11) NOT NULL,
  `revenue_amount` decimal(10,0) NOT NULL,
  `generated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `transection_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `revenue`
--

INSERT INTO `revenue` (`rev_id`, `revenue_amount`, `generated_at`, `transection_id`) VALUES
(16, 80, '2025-04-24 09:48:36', 56),
(17, 222, '2025-04-24 10:15:41', 57),
(18, 280, '2025-04-24 10:24:14', 58),
(19, 320, '2025-04-24 10:29:19', 59),
(20, 40, '2025-04-24 10:35:39', 60),
(21, 20, '2025-04-24 10:46:37', 61);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `comment` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `business_name` varchar(20) NOT NULL,
  `business_address` varchar(70) NOT NULL,
  `business_email` varchar(25) NOT NULL,
  `average_rating` float NOT NULL DEFAULT 0,
  `total_sales` int(11) NOT NULL DEFAULT 0,
  `verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`seller_id`, `user_id`, `business_name`, `business_address`, `business_email`, `average_rating`, `total_sales`, `verified`) VALUES
(4, 24, 'ABC enterprice', 'Punagam', 'alpeshkachhadiya1980@gmai', 0, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transections`
--

CREATE TABLE `transections` (
  `transection_id` int(11) NOT NULL,
  `bid_id` int(11) NOT NULL,
  `transection_date` datetime NOT NULL DEFAULT current_timestamp(),
  `amount` float NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transections`
--

INSERT INTO `transections` (`transection_id`, `bid_id`, `transection_date`, `amount`, `buyer_id`, `seller_id`) VALUES
(56, 83, '2025-04-24 09:48:36', 2440, 8, 4),
(57, 89, '2025-04-24 10:15:41', 6777.1, 7, 4),
(58, 91, '2025-04-24 10:24:14', 8540, 9, 4),
(59, 92, '2025-04-24 10:29:19', 9760, 7, 4),
(60, 96, '2025-04-24 10:35:39', 1220, 9, 4),
(61, 99, '2025-04-24 10:46:37', 610, 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `contect_number` varchar(13) NOT NULL,
  `address` varchar(130) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `contect_number`, `address`, `profile_pic`, `role`, `created_at`) VALUES
(22, 'Parth', 'parthkachhadiya04@gmail.com', 'parth', '8200948012', 'D-45 Matrushakti society', 'sitted.jpg', 'Buyer', '2025-04-24 09:36:18'),
(23, 'Monax', 'monaxbhadiyadra781@gmail.com', 'monaco', '8347878000', 'Sangna society', 'img2.png', 'Buyer', '2025-04-24 09:37:08'),
(24, 'Jay', 'alpeshkachhadiya1980@gmail.com', 'jay', '9879826224', 'D/45 matru shati society', 'img1.jpg', 'Seller', '2025-04-24 09:38:34'),
(25, 'buyer_1', 'buyer1@gmail.com', 'buyer1', '1234567890', 'D/45 matru shati society', 'img2.jpg', 'Buyer', '2025-04-24 09:40:45'),
(26, 'buyer_2', 'buyer2@gmail.com', 'buyer2', '8200948012', 'sangna society', 'pasport_size.jpg', 'Buyer', '2025-04-24 11:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`address_id`, `user_id`, `address`, `city`, `state`, `pincode`, `country`, `created_at`) VALUES
(6, 22, 'D-45 Matrushakti society', 'Surat', 'Gujarat', '395010', 'India', '2025-04-24 09:36:18'),
(7, 23, 'Sangna society', 'Surat', 'Gujarat', '395010', 'India', '2025-04-24 09:37:08'),
(8, 25, 'D/45 matru shati society', 'Ahmedabad', 'Surat', '234567', 'India', '2025-04-24 09:40:45'),
(9, 26, 'sangna society', 'Surat', 'Gujarat', '395010', 'India', '2025-04-24 11:11:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_bidders`
--
ALTER TABLE `active_bidders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `f_first_bidders` (`auction_id`),
  ADD KEY `f_second_bidders` (`buyer_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`auction_id`),
  ADD KEY `f_category` (`category_id`),
  ADD KEY `f_item` (`item_id`),
  ADD KEY `f_seller` (`seller_id`);

--
-- Indexes for table `auction_permission`
--
ALTER TABLE `auction_permission`
  ADD PRIMARY KEY (`per_id`);

--
-- Indexes for table `auction_registration`
--
ALTER TABLE `auction_registration`
  ADD PRIMARY KEY (`auction_registration_id`),
  ADD KEY `f_auction` (`auction_id`),
  ADD KEY `f_buyer` (`buyer_id`),
  ADD KEY `f_itm` (`item_id`);

--
-- Indexes for table `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `f_auction_b` (`buyer_id`),
  ADD KEY `f_auction_s` (`auction_id`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`buyer_id`),
  ADD KEY `f_user_u` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `delivery_tracking`
--
ALTER TABLE `delivery_tracking`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `transection_id` (`transaction_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `invoice_ibfk_1` (`transaction_id`),
  ADD KEY `invoice_ibfk_2` (`buyer_id`),
  ADD KEY `invoice_ibfk_3` (`seller_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `f_first_item` (`seller_id`),
  ADD KEY `f_second_item` (`category_id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `f_first_notification` (`user_id`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`receipt_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `revenue`
--
ALTER TABLE `revenue`
  ADD PRIMARY KEY (`rev_id`),
  ADD KEY `transection_for_iied` (`transection_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `f_first_reviews` (`buyer_id`),
  ADD KEY `f_second_reviews` (`item_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`seller_id`),
  ADD KEY `f_first_seller` (`user_id`);

--
-- Indexes for table `transections`
--
ALTER TABLE `transections`
  ADD PRIMARY KEY (`transection_id`),
  ADD KEY `f_first_trans` (`bid_id`),
  ADD KEY `f_fourth_trans` (`seller_id`),
  ADD KEY `f_second_trans` (`buyer_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `for_user_iid` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_bidders`
--
ALTER TABLE `active_bidders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auction`
--
ALTER TABLE `auction`
  MODIFY `auction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `auction_permission`
--
ALTER TABLE `auction_permission`
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `auction_registration`
--
ALTER TABLE `auction_registration`
  MODIFY `auction_registration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `bid`
--
ALTER TABLE `bid`
  MODIFY `bid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `buyer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_tracking`
--
ALTER TABLE `delivery_tracking`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revenue`
--
ALTER TABLE `revenue`
  MODIFY `rev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transections`
--
ALTER TABLE `transections`
  MODIFY `transection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `active_bidders`
--
ALTER TABLE `active_bidders`
  ADD CONSTRAINT `f_first_bidders` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`auction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `f_second_bidders` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auction`
--
ALTER TABLE `auction`
  ADD CONSTRAINT `f_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `f_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `f_seller` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auction_registration`
--
ALTER TABLE `auction_registration`
  ADD CONSTRAINT `f_auction` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`auction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `f_buyer` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `f_itm` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `f_auction_b` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `f_auction_s` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`auction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `f_user_u` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery_tracking`
--
ALTER TABLE `delivery_tracking`
  ADD CONSTRAINT `ft_buyers_iid` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ft_trans_id` FOREIGN KEY (`transaction_id`) REFERENCES `transections` (`transection_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transections` (`transection_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `f_first_item` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `f_second_item` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `f_first_notification` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints for table `revenue`
--
ALTER TABLE `revenue`
  ADD CONSTRAINT `transection_for_iied` FOREIGN KEY (`transection_id`) REFERENCES `transections` (`transection_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `f_first_reviews` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `f_second_reviews` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `f_first_seller` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transections`
--
ALTER TABLE `transections`
  ADD CONSTRAINT `f_first_trans` FOREIGN KEY (`bid_id`) REFERENCES `bid` (`bid_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `f_fourth_trans` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `f_second_trans` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `for_user_iid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
