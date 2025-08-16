-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 16, 2025 at 02:28 AM
-- Server version: 8.0.43
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asset_manager`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `Asset`
-- (See below for the actual view)
--
CREATE TABLE `Asset` (
`id` int
,`code` varchar(50)
,`name` varchar(100)
,`categoryId` int
,`assetTypeId` int
,`imageUrl` varchar(255)
,`slug` varchar(100)
,`status` varchar(50)
,`createdDate` datetime
,`createdBy` varchar(50)
,`lastUpdatedDate` datetime
,`lastUpdatedBy` varchar(50)
,`stockInHand` int
,`metadata` json
,`size` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `AssetType`
--

CREATE TABLE `AssetType` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `categoryId` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(50) DEFAULT NULL,
  `lastUpdatedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdatedBy` varchar(50) DEFAULT NULL,
  `size` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AssetType`
--

INSERT INTO `AssetType` (`id`, `code`, `categoryId`, `name`, `imageUrl`, `status`, `createdDate`, `createdBy`, `lastUpdatedDate`, `lastUpdatedBy`, `size`) VALUES
(1, 'S', 1, 'Spares', NULL, 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 10:45:38', NULL, NULL),
(2, 'L', 1, 'Lighting', NULL, 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 10:45:38', NULL, NULL),
(3, 'F', 1, 'Fitting', NULL, 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 10:45:38', NULL, NULL),
(4, 'C', 1, 'Consumables', NULL, 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 10:45:38', NULL, NULL),
(5, 'L', 1, 'lighting', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(6, 'S', 2, 'Spares', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(7, 'C', 2, 'Consumables', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(8, 'V', 3, 'Valves', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(9, 'TF2', 3, 'Toilet Fittings', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(10, 'T&M', 3, 'Taps & Mixers', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(11, 'C', 3, 'Consumables', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(12, 'U', 3, 'Uncategorized', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(13, 'BF2', 3, 'Bathroom Fixtures', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(14, 'PF2', 3, 'Pipe Fittings', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(15, 'P&F', 3, 'Pipes & Fittings', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(16, 'S', 3, 'Spares', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(17, 'M', 3, 'Mixers', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(18, 'S&G', 3, 'Seals & Gaskets', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(19, 'D', 3, 'Drainage', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(20, 'A', 3, 'Accessories', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(21, 'HS001', 2, 'Misc Handyman Stock', '', 'active', '2025-05-13 16:48:21', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-05-13 16:48:37', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', ''),
(22, 'O', 5, 'Other', '', 'active', '2025-05-22 14:29:08', '42eb4519-1f70-11f0-b081-d21cc41a9548', '2025-05-22 14:29:08', '42eb4519-1f70-11f0-b081-d21cc41a9548', '');

-- --------------------------------------------------------

--
-- Table structure for table `asset_categories`
--

CREATE TABLE `asset_categories` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `asset_categories`
--

INSERT INTO `asset_categories` (`id`, `name`, `description`, `is_active`) VALUES
(1, 'Electronics', 'TVs, fridges, kettles', 1),
(2, 'Furniture', 'Beds, chairs, tables', 1),
(3, 'Energy', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `asset_items`
--

CREATE TABLE `asset_items` (
  `id` int NOT NULL,
  `asset_type_id` int NOT NULL,
  `asset_code` varchar(100) NOT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `condition_label` varchar(50) DEFAULT NULL,
  `warranty_expiry` date DEFAULT NULL,
  `status` enum('Active','In Maintenance','Disposed') DEFAULT 'Active',
  `current_location_id` int DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `asset_items`
--

INSERT INTO `asset_items` (`id`, `asset_type_id`, `asset_code`, `serial_number`, `condition_label`, `warranty_expiry`, `status`, `current_location_id`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 1, 'TV-001', 'A1B2C3', 'New', '2026-08-13', 'Active', 2, NULL, '2025-08-13 17:34:49', '2025-08-13 17:34:49'),
(2, 1, 'TV-002', 'D4E5F6', 'New', '2026-08-13', 'Active', 4, '[]', '2025-08-13 17:34:49', '2025-08-15 12:51:16'),
(3, 1, 'TV-003', 'GF8 99', 'New', '2027-08-15', 'Active', 2, '[]', '2025-08-15 04:02:00', '2025-08-15 04:02:00'),
(4, 2, 'BLK-CHAIR-001', 'BLK-CHAIR-001', 'New', '2026-08-15', 'Active', 2, '[]', '2025-08-15 04:21:58', '2025-08-16 02:18:29'),
(5, 2, 'BLK-CHAIR-002', 'SN-00001', 'New', '2028-08-15', 'Active', 2, '[]', '2025-08-15 04:42:30', '2025-08-16 02:19:20'),
(6, 2, 'BLK-CHAIR-003', 'SN-00002', 'New', '2028-08-15', 'Active', 2, '[]', '2025-08-15 04:42:30', '2025-08-16 02:19:35'),
(7, 2, 'BLK-CHAIR-004', 'SN-00003', 'New', '2028-08-15', 'Active', 2, '[]', '2025-08-15 04:42:30', '2025-08-16 02:21:00'),
(8, 2, 'BLK-CHAIR-005', 'SN-00004', 'New', '2028-08-15', 'Active', 3, '[]', '2025-08-15 04:42:30', '2025-08-16 02:21:09'),
(9, 2, 'BLK-CHAIR-006', 'SN-00005', 'New', '2028-08-15', 'Active', 1, '[]', '2025-08-15 04:42:30', '2025-08-15 04:42:30'),
(10, 2, 'BLK-CHAIR-007', 'SN-00006', 'New', '2028-08-15', 'Active', 1, '[]', '2025-08-15 04:42:30', '2025-08-15 04:42:30'),
(11, 2, 'BLK-CHAIR-008', 'SN-00007', 'New', '2028-08-15', 'Active', 1, '[]', '2025-08-15 04:42:30', '2025-08-15 04:42:30'),
(12, 2, 'BLK-CHAIR-009', 'SN-00008', 'New', '2028-08-15', 'Active', 1, '[]', '2025-08-15 04:42:30', '2025-08-15 04:42:30'),
(13, 2, 'BLK-CHAIR-010', 'SN-00009', 'New', '2028-08-15', 'Active', 1, '[]', '2025-08-15 04:42:30', '2025-08-15 04:42:30'),
(14, 2, 'BLK-CHAIR-011', 'SN-00010', 'New', '2028-08-15', 'Active', 1, '[]', '2025-08-15 04:42:30', '2025-08-15 04:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `asset_item_transfers`
--

CREATE TABLE `asset_item_transfers` (
  `id` int NOT NULL,
  `asset_item_id` int NOT NULL,
  `from_location_id` int DEFAULT NULL,
  `to_location_id` int NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `done_by` int DEFAULT NULL,
  `metadata` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `asset_item_transfers`
--

INSERT INTO `asset_item_transfers` (`id`, `asset_item_id`, `from_location_id`, `to_location_id`, `reason`, `date`, `done_by`, `metadata`) VALUES
(1, 1, 1, 2, 'Initial room assignment', '2025-08-13 17:34:49', NULL, NULL),
(2, 1, 2, 3, 'Screen issue', '2025-08-13 17:34:49', NULL, NULL),
(3, 1, 3, 2, 'Maintenance complete', '2025-08-13 17:34:49', NULL, NULL),
(4, 2, 2, 4, 'End of life - damaged', '2025-08-13 17:34:49', NULL, NULL),
(5, 4, 1, 2, 'Relocation', '2025-08-16 02:18:29', NULL, NULL),
(6, 5, 1, 2, 'Relocation', '2025-08-16 02:19:20', NULL, NULL),
(7, 6, 1, 2, 'Relocation', '2025-08-16 02:19:35', NULL, NULL),
(8, 7, 1, 2, 'Audit Adjustment', '2025-08-16 02:21:00', NULL, NULL),
(9, 8, 1, 3, 'Relocation', '2025-08-16 02:21:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `asset_location_agg`
-- (See below for the actual view)
--
CREATE TABLE `asset_location_agg` (
`asset_type_id` int
,`location_id` int
,`quantity` bigint
);

-- --------------------------------------------------------

--
-- Table structure for table `asset_types`
--

CREATE TABLE `asset_types` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `asset_code` varchar(20) DEFAULT NULL,
  `asset_category_id` int DEFAULT NULL,
  `description` text,
  `default_cost` decimal(12,2) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `asset_types`
--

INSERT INTO `asset_types` (`id`, `name`, `asset_code`, `asset_category_id`, `description`, `default_cost`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 'Samsung 40\" LED TV', 'TV-S40', 1, '40-inch LED TV', 4500.00, NULL, '2025-08-13 17:34:49', '2025-08-14 19:27:32'),
(2, 'Black Plastic Chair', 'CHAIR-BLK-PLS', 2, 'Stackable black plastic chair suitable for indoor and outdoor us', 180.00, '[]', '2025-08-15 03:09:07', '2025-08-15 03:09:07');

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `slug` varchar(100) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(50) DEFAULT NULL,
  `lastUpdatedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `code`, `name`, `imageUrl`, `slug`, `status`, `createdDate`, `createdBy`, `lastUpdatedDate`, `lastUpdatedBy`) VALUES
(1, 'ELEC', 'Electrical', NULL, 'slug-1', 'active', '2025-05-12 10:45:38', 'import', '2025-05-13 16:47:02', NULL),
(2, 'HMSK', 'Handyman Stock', NULL, 'slug-2', 'active', '2025-05-12 10:45:39', 'import', '2025-05-13 16:47:20', NULL),
(3, 'PLMB', 'Plumbing', NULL, 'slug-3', 'active', '2025-05-12 10:45:39', 'import', '2025-05-13 16:47:29', NULL),
(5, 'CONS', 'Consumables', '', 'id-481-mazcjl3d', 'active', '2025-05-22 14:27:16', '', '2025-05-23 13:45:18', '');

-- --------------------------------------------------------

--
-- Table structure for table `Features`
--

CREATE TABLE `Features` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Features`
--

INSERT INTO `Features` (`id`, `name`) VALUES
(1, 'List Assets'),
(3, 'Add Assets');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `building` varchar(255) DEFAULT NULL,
  `floor` varchar(100) DEFAULT NULL,
  `type` enum('Store','Room','Maintenance','Disposal') NOT NULL DEFAULT 'Room',
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `building`, `floor`, `type`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 'Main Store', 'Central Depot', 'G', 'Store', '[]', '2025-08-13 17:34:49', '2025-08-14 04:37:23'),
(2, 'Room 101', 'Block A', '1', 'Room', '{\"note\": \"mock\"}', '2025-08-13 17:34:49', '2025-08-13 17:42:23'),
(3, 'Maintenance Bay', 'Workshop', 'G', 'Maintenance', NULL, '2025-08-13 17:34:49', '2025-08-13 17:34:49'),
(4, 'Main Store', 'Central Depot', 'G', 'Store', '\"{\\\"note\\\": \\\"mock\\\"}\"', '2025-08-13 17:34:49', '2025-08-15 14:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `other_info`
--

CREATE TABLE `other_info` (
  `Id` int NOT NULL,
  `Name` text NOT NULL,
  `ItemType` varchar(500) NOT NULL,
  `ImageUrl` text NOT NULL,
  `ParentId` varchar(400) NOT NULL,
  `Notes` text NOT NULL,
  `ItemValue` text NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Decription` text NOT NULL,
  `Rules` text NOT NULL,
  `ItemCode` text NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Slug` varchar(1000) DEFAULT NULL,
  `OwnerId` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `other_info`
--

INSERT INTO `other_info` (`Id`, `Name`, `ItemType`, `ImageUrl`, `ParentId`, `Notes`, `ItemValue`, `Status`, `Decription`, `Rules`, `ItemCode`, `CreateDate`, `Slug`, `OwnerId`) VALUES
(6, 'Main Store room', 'Locations', '', '1', '', '{\"Name\":\"Main Store room\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"35\",\"Floor\":\"P2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-02-04 09:42:50', 'main-store-room-6', '1'),
(7, 'NetWorks SA', 'Suppliers', '', '1', '', '{\"Name\":\"NetWorks SA\",\"Address\":\"36 Browns Ave\",\"Email\":\"info@networkssa.co.za\",\"PhoneNumber\":\"0832268762\",\"AlternateNumber\":\"0826266679\",\"Comments\":[],\"ContactPerson\":\"Zayd\"}', 'Active', '', '', '', '2025-02-04 09:44:35', 'networks-sa-7', '1'),
(8, '101', 'Locations', '', '1', '', '{\"Name\":\"101\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-02-04 09:57:38', '1001-8', '1'),
(9, 'Bizzar Bizzar', 'Suppliers', '', '1', '', '{\"Name\":\"Bizzar Bizzar\",\"Address\":\"Block 56 The William, William Nicol Drive &, Broadacres Dr, Zevenfontein 407-Jr\",\"Email\":\"accountstt@tybo.co.za\",\"PhoneNumber\":\"0842529472\",\"AlternateNumber\":\"\",\"Comments\":[],\"ContactPerson\":\"Ndumiso Mthembu\"}', 'Active', '', '', '', '2025-02-18 21:33:28', 'ndumiso-mthembu-9', '1'),
(26, '102', 'Locations', '', '1', '', '{\"Name\":\"102\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-02-25 17:10:42', '1002-26', '1'),
(27, '103', 'Locations', '', '1', '', '{\"Name\":\"103\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-02-25 17:10:54', '1003-27', '1'),
(28, '104', 'Locations', '', '1', '', '{\"Name\":\"104\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-02-25 17:11:24', '104-28', '1'),
(29, '105', 'Locations', '', '1', '', '{\"Name\":\"105\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-02-25 17:12:21', '1005-29', '1'),
(30, '106', 'Locations', '', '1', '', '{\"Name\":\"106\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-03-25 14:24:10', '2002-30', '1'),
(35, 'Storage Facility', 'LocationTypes', '', '1', '', '{\"key\":\"\",\"value\":\"Storage Facility\"}', 'Active', '', '', '', '2025-05-13 16:50:11', 'storage-facility-35', '1'),
(36, 'Room', 'LocationTypes', '', '1', '', '{\"key\":\"\",\"value\":\"Room\"}', 'Active', '', '', '', '2025-05-13 16:50:16', 'room-36', '1'),
(37, 'Site', 'LocationTypes', '', '1', '', '{\"key\":\"\",\"value\":\"Site\"}', 'Active', '', '', '', '2025-05-13 16:54:53', 'site-37', '1'),
(38, 'SeaBoard Hotel', 'Locations', '', '1', '', '{\"Name\":\"SeaBoard Hotel\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"37\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"Yes\"}', 'Active', '', '', '', '2025-05-13 16:55:32', 'seaboard-hotel-holiday-apartments--38', '1'),
(39, '107', 'Locations', '', '1', '', '{\"Name\":\"107\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:27:07', '107-39', '1'),
(40, '108', 'Locations', '', '1', '', '{\"Name\":\"108\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:27:24', '108-40', '1'),
(41, '109', 'Locations', '', '1', '', '{\"Name\":\"109\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:27:31', '109-41', '1'),
(42, '110', 'Locations', '', '1', '', '{\"Name\":\"110\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:27:37', '110-42', '1'),
(43, '111', 'Locations', '', '1', '', '{\"Name\":\"111\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:27:44', '111-43', '1'),
(44, '112', 'Locations', '', '1', '', '{\"Name\":\"112\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:27:50', '112-44', '1'),
(45, '113', 'Locations', '', '1', '', '{\"Name\":\"113\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:27:56', '113-45', '1'),
(46, '114', 'Locations', '', '1', '', '{\"Name\":\"114\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:28:06', '114-46', '1'),
(47, '115', 'Locations', '', '1', '', '{\"Name\":\"115\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:28:21', '115-47', '1'),
(48, '116', 'Locations', '', '1', '', '{\"Name\":\"116\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:28:27', '116-48', '1'),
(49, '117', 'Locations', '', '1', '', '{\"Name\":\"117\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:28:34', '117-49', '1'),
(50, '118', 'Locations', '', '1', '', '{\"Name\":\"118\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-13 20:28:39', '117-50', '1'),
(51, '119', 'Locations', '', '1', '', '{\"Name\":\"119\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:44:50', '119-51', '1'),
(52, '120', 'Locations', '', '1', '', '{\"Name\":\"120\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:45:02', '120-52', '1'),
(53, '121', 'Locations', '', '1', '', '{\"Name\":\"121\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:45:18', '121-53', '1'),
(54, '122', 'Locations', '', '1', '', '{\"Name\":\"122\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:45:28', '122-54', '1'),
(55, '123', 'Locations', '', '1', '', '{\"Name\":\"123\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:45:37', '123-55', '1'),
(56, '124', 'Locations', '', '1', '', '{\"Name\":\"124\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:45:47', '124-56', '1'),
(57, '125', 'Locations', '', '1', '', '{\"Name\":\"125\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:46:00', '125-57', '1'),
(58, '126', 'Locations', '', '1', '', '{\"Name\":\"126\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:46:14', '126-58', '1'),
(59, '127', 'Locations', '', '1', '', '{\"Name\":\"127\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:46:27', '127-59', '1'),
(60, '128', 'Locations', '', '1', '', '{\"Name\":\"128\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:46:42', '128-60', '1'),
(61, '129', 'Locations', '', '1', '', '{\"Name\":\"129\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:49:44', '129-61', '1'),
(62, '130', 'Locations', '', '1', '', '{\"Name\":\"130\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:49:54', '130-62', '1'),
(63, '131', 'Locations', '', '1', '', '{\"Name\":\"131\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:50:05', '131-63', '1'),
(64, '132', 'Locations', '', '1', '', '{\"Name\":\"132\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:50:27', '132-64', '1'),
(65, '133', 'Locations', '', '1', '', '{\"Name\":\"133\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:50:27', '132-65', '1'),
(66, '134', 'Locations', '', '1', '', '{\"Name\":\"134\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:51:12', '134-66', '1'),
(67, '135', 'Locations', '', '1', '', '{\"Name\":\"135\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:51:29', '135-67', '1'),
(68, '136', 'Locations', '', '1', '', '{\"Name\":\"136\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:51:59', '136-68', '1'),
(69, '137', 'Locations', '', '1', '', '{\"Name\":\"137\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:52:17', '137-69', '1'),
(70, '138', 'Locations', '', '1', '', '{\"Name\":\"138\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:52:34', '138-70', '1'),
(71, '139', 'Locations', '', '1', '', '{\"Name\":\"139\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:52:54', '139-71', '1'),
(72, '140', 'Locations', '', '1', '', '{\"Name\":\"140\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:53:08', '140-72', '1'),
(73, '141', 'Locations', '', '1', '', '{\"Name\":\"141\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:53:23', '141-73', '1'),
(74, '142', 'Locations', '', '1', '', '{\"Name\":\"142\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:53:40', '142-74', '1'),
(75, '143', 'Locations', '', '1', '', '{\"Name\":\"143\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:54:13', '143-75', '1'),
(76, '144', 'Locations', '', '1', '', '{\"Name\":\"144\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:54:32', '144-76', '1'),
(77, '145', 'Locations', '', '1', '', '{\"Name\":\"145\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:55:21', '145-77', '1'),
(78, '146', 'Locations', '', '1', '', '{\"Name\":\"146\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Inactive', '', '', '', '2025-05-15 08:55:31', '146-78', '1'),
(79, '201', 'Locations', '', '1', '', '{\"Name\":\"201\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:59:13', '201-79', '1'),
(80, '202', 'Locations', '', '1', '', '{\"Name\":\"202\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:59:27', '202-80', '1'),
(81, '203', 'Locations', '', '1', '', '{\"Name\":\"203\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:59:44', '203-81', '1'),
(82, '204', 'Locations', '', '1', '', '{\"Name\":\"204\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 08:59:57', '204-82', '1'),
(83, '205', 'Locations', '', '1', '', '{\"Name\":\"205\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:00:07', '205-83', '1'),
(84, '206', 'Locations', '', '1', '', '{\"Name\":\"206\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:00:29', '206-84', '1'),
(85, '207', 'Locations', '', '1', '', '{\"Name\":\"207\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:00:40', '207-85', '1'),
(86, '208', 'Locations', '', '1', '', '{\"Name\":\"208\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:00:51', '208-86', '1'),
(87, '209', 'Locations', '', '1', '', '{\"Name\":\"209\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:01:04', '209-87', '1'),
(88, '210', 'Locations', '', '1', '', '{\"Name\":\"210\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:01:13', '210-88', '1'),
(89, '211', 'Locations', '', '1', '', '{\"Name\":\"211\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:01:26', '211-89', '1'),
(90, '212', 'Locations', '', '1', '', '{\"Name\":\"212\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:01:40', '212-90', '1'),
(91, '213', 'Locations', '', '1', '', '{\"Name\":\"213\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:01:50', '213-91', '1'),
(92, '214', 'Locations', '', '1', '', '{\"Name\":\"214\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:02:11', '214-92', '1'),
(93, '215', 'Locations', '', '1', '', '{\"Name\":\"215\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:02:26', '215-93', '1'),
(94, 'PMB Head Office', 'Locations', '', '1', '', '{\"Name\":\"PMB Head Office\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"37\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"Yes\"}', 'Active', '', '', '', '2025-05-15 09:02:37', '216-94', '1'),
(95, '301', 'Locations', '', '1', '', '{\"Name\":\"301\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:03:18', '301-95', '1'),
(96, '302', 'Locations', '', '1', '', '{\"Name\":\"302\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:03:36', '302-96', '1'),
(97, '303', 'Locations', '', '1', '', '{\"Name\":\"303\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:05:50', '303-97', '1'),
(98, '304', 'Locations', '', '1', '', '{\"Name\":\"304\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:06:01', '304-98', '1'),
(99, '305', 'Locations', '', '1', '', '{\"Name\":\"305\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:06:11', '305-99', '1'),
(100, '306', 'Locations', '', '1', '', '{\"Name\":\"306\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:07:09', '306-100', '1'),
(101, '307', 'Locations', '', '1', '', '{\"Name\":\"307\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:07:27', '307-101', '1'),
(102, '308', 'Locations', '', '1', '', '{\"Name\":\"308\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:08:24', '308-102', '1'),
(103, '309', 'Locations', '', '1', '', '{\"Name\":\"309\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:09:19', '309-103', '1'),
(104, '310', 'Locations', '', '1', '', '{\"Name\":\"310\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:09:43', '310-104', '1'),
(105, '311', 'Locations', '', '1', '', '{\"Name\":\"311\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:09:55', '311-105', '1'),
(106, '312', 'Locations', '', '1', '', '{\"Name\":\"312\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:10:07', '312-106', '1'),
(107, '313', 'Locations', '', '1', '', '{\"Name\":\"313\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:10:16', '313-107', '1'),
(108, '314', 'Locations', '', '1', '', '{\"Name\":\"314\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:10:45', '314-108', '1'),
(109, '315', 'Locations', '', '1', '', '{\"Name\":\"315\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:11:03', '315-109', '1'),
(110, 'Kamdar House- Umhlanga', 'Locations', '', '1', '', '{\"Name\":\"Kamdar House- Umhlanga\",\"Slug\":\"\",\"AddressLine1\":\"68 Richefond Cir, Umhlanga Ridge, uMhlanga, 4319\",\"AddressLine2\":\"\",\"Type\":\"37\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"Yes\"}', 'Active', '', '', '', '2025-05-15 09:11:18', '316-110', '1'),
(111, '401', 'Locations', '', '1', '', '{\"Name\":\"401\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:11:56', '401-111', '1'),
(112, '402', 'Locations', '', '1', '', '{\"Name\":\"402\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:12:15', '402-112', '1'),
(113, '403', 'Locations', '', '1', '', '{\"Name\":\"403\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:16:40', '403-113', '1'),
(114, '404', 'Locations', '', '1', '', '{\"Name\":\"404\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:16:56', '404-114', '1'),
(115, '405', 'Locations', '', '1', '', '{\"Name\":\"405\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:17:04', '405-115', '1'),
(116, '406', 'Locations', '', '1', '', '{\"Name\":\"406\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:17:17', '406-116', '1'),
(117, '407', 'Locations', '', '1', '', '{\"Name\":\"407\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:17:51', '407-117', '1'),
(118, '408', 'Locations', '', '1', '', '{\"Name\":\"408\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:18:03', '408-118', '1'),
(119, '409', 'Locations', '', '1', '', '{\"Name\":\"409\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:18:14', '409-119', '1'),
(120, '410', 'Locations', '', '1', '', '{\"Name\":\"410\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:18:39', '410-120', '1'),
(121, '411', 'Locations', '', '1', '', '{\"Name\":\"411\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:19:00', '411-121', '1'),
(122, '412', 'Locations', '', '1', '', '{\"Name\":\"412\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:19:07', '412-122', '1'),
(123, '413', 'Locations', '', '1', '', '{\"Name\":\"413\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:19:16', '413-123', '1'),
(124, '414', 'Locations', '', '1', '', '{\"Name\":\"414\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:19:38', '414-124', '1'),
(125, '415', 'Locations', '', '1', '', '{\"Name\":\"415\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:19:51', '415-125', '1'),
(126, '501', 'Locations', '', '1', '', '{\"Name\":\"501\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:22:46', '501-126', '1'),
(127, '502', 'Locations', '', '1', '', '{\"Name\":\"502\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:23:00', '502-127', '1'),
(128, '503', 'Locations', '', '1', '', '{\"Name\":\"503\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:23:09', '503-128', '1'),
(129, '504', 'Locations', '', '1', '', '{\"Name\":\"504\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:23:42', '504-129', '1'),
(130, '505', 'Locations', '', '1', '', '{\"Name\":\"505\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:24:01', '505-130', '1'),
(131, '506', 'Locations', '', '1', '', '{\"Name\":\"506\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:24:19', '506-131', '1'),
(132, '507', 'Locations', '', '1', '', '{\"Name\":\"507\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:24:42', '507-132', '1'),
(133, '508', 'Locations', '', '1', '', '{\"Name\":\"508\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:24:52', '508-133', '1'),
(134, '509', 'Locations', '', '1', '', '{\"Name\":\"509\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:25:04', '509-134', '1'),
(135, '510', 'Locations', '', '1', '', '{\"Name\":\"510\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:25:13', '510-135', '1'),
(136, '511', 'Locations', '', '1', '', '{\"Name\":\"511\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:25:26', '511-136', '1'),
(137, '512', 'Locations', '', '1', '', '{\"Name\":\"512\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:25:52', '512-137', '1'),
(138, '513', 'Locations', '', '1', '', '{\"Name\":\"513\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:26:02', '513-138', '1'),
(139, '514', 'Locations', '', '1', '', '{\"Name\":\"514\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:26:14', '514-139', '1'),
(140, '515', 'Locations', '', '1', '', '{\"Name\":\"515\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 09:26:27', '515-140', '1'),
(141, '601', 'Locations', '', '1', '', '{\"Name\":\"601\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 10:14:04', '601-141', '1'),
(142, '602', 'Locations', '', '1', '', '{\"Name\":\"602\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 10:14:14', '602-142', '1'),
(143, '603', 'Locations', '', '1', '', '{\"Name\":\"603\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 10:14:37', '603-143', '1'),
(144, '604', 'Locations', '', '1', '', '{\"Name\":\"604\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 10:15:04', '604-144', '1'),
(145, '605', 'Locations', '', '1', '', '{\"Name\":\"605\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 10:15:16', '605-145', '1'),
(146, '606', 'Locations', '', '1', '', '{\"Name\":\"606\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 10:16:48', '606-146', '1'),
(147, '607', 'Locations', '', '1', '', '{\"Name\":\"607\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 11:35:03', '607-147', '1'),
(148, '608', 'Locations', '', '1', '', '{\"Name\":\"608\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 11:35:51', '608-148', '1'),
(149, '609', 'Locations', '', '1', '', '{\"Name\":\"609\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 11:36:27', '609-149', '1'),
(150, '610', 'Locations', '', '1', '', '{\"Name\":\"610\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 11:40:41', '610-150', '1'),
(151, '611', 'Locations', '', '1', '', '{\"Name\":\"611\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 11:41:32', '611-151', '1'),
(152, '612', 'Locations', '', '1', '', '{\"Name\":\"612\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 11:41:45', '612-152', '1'),
(153, '613', 'Locations', '', '1', '', '{\"Name\":\"613\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 11:41:55', '613-153', '1'),
(154, '614', 'Locations', '', '1', '', '{\"Name\":\"614\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 11:42:03', '614-154', '1'),
(155, '615', 'Locations', '', '1', '', '{\"Name\":\"615\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-15 11:42:15', '615-155', '1'),
(156, '701', 'Locations', '', '1', '', '{\"Name\":\"701\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:19:19', '701-156', '1'),
(157, '702', 'Locations', '', '1', '', '{\"Name\":\"702\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:19:27', '702-157', '1'),
(158, '703', 'Locations', '', '1', '', '{\"Name\":\"703\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:19:34', '703-158', '1'),
(159, '704', 'Locations', '', '1', '', '{\"Name\":\"704\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:19:41', '704-159', '1'),
(160, '705', 'Locations', '', '1', '', '{\"Name\":\"705\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:19:49', '705-160', '1'),
(161, '706', 'Locations', '', '1', '', '{\"Name\":\"706\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:19:57', '706-161', '1'),
(162, '707', 'Locations', '', '1', '', '{\"Name\":\"707\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:20:05', '708-162', '1'),
(163, '708', 'Locations', '', '1', '', '{\"Name\":\"708\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:20:15', '709-163', '1'),
(164, '709', 'Locations', '', '1', '', '{\"Name\":\"709\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:20:26', '710-164', '1'),
(165, '710', 'Locations', '', '1', '', '{\"Name\":\"710\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:21:30', '710-165', '1'),
(166, '711', 'Locations', '', '1', '', '{\"Name\":\"711\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:23:11', '711-166', '1'),
(167, '712', 'Locations', '', '1', '', '{\"Name\":\"712\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:23:21', '712-167', '1'),
(168, '713', 'Locations', '', '1', '', '{\"Name\":\"713\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:23:30', '713-168', '1'),
(169, '714', 'Locations', '', '1', '', '{\"Name\":\"714\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:23:39', '714-169', '1'),
(170, '715', 'Locations', '', '1', '', '{\"Name\":\"715\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-16 09:23:49', '715-170', '1'),
(171, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"1\",\"AssetName\":\"GEYSER ELEMENTS\",\"AssetCode\":\"E001\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":7,\"TheoreticalQuantity\":\"0\",\"Variance\":7,\"Date\":\"2025-05-21T09:40:30.465Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-171', '1'),
(172, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"2\",\"AssetName\":\"GEYSER THERMOSTATS\",\"AssetCode\":\"E002\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":5,\"TheoreticalQuantity\":\"0\",\"Variance\":5,\"Date\":\"2025-05-21T09:40:30.465Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-172', '1'),
(173, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"3\",\"AssetName\":\"GEYSER GASKETS\",\"AssetCode\":\"E003\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":21,\"TheoreticalQuantity\":\"0\",\"Variance\":21,\"Date\":\"2025-05-21T09:40:30.465Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-173', '1'),
(174, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"4\",\"AssetName\":\"45 AMPS STOVE ISOLATOR \",\"AssetCode\":\"E004\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":17,\"TheoreticalQuantity\":\"0\",\"Variance\":17,\"Date\":\"2025-05-21T09:40:30.465Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-174', '1'),
(175, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"5\",\"AssetName\":\"DOWNLIGHT HOLDER\",\"AssetCode\":\"E008\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":33,\"TheoreticalQuantity\":\"0\",\"Variance\":33,\"Date\":\"2025-05-21T09:40:30.465Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-175', '1'),
(176, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"6\",\"AssetName\":\"2 LEVER LIGHT SWITCH - 4x2\",\"AssetCode\":\"E009\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":9,\"TheoreticalQuantity\":\"0\",\"Variance\":9,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-176', '1'),
(177, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"7\",\"AssetName\":\"BLANK COVER PVC WHITE - 4x4\",\"AssetCode\":\"E010\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-177', '1'),
(178, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"8\",\"AssetName\":\"BLANK COVER PVC WHITE - 4x2\",\"AssetCode\":\"E011\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-178', '1'),
(179, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"9\",\"AssetName\":\"DOUBLE PLUG POINT \",\"AssetCode\":\"E012\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":5,\"TheoreticalQuantity\":\"0\",\"Variance\":5,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-179', '1'),
(180, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"10\",\"AssetName\":\"CIRCUIT BREAKER - 50AMPS\",\"AssetCode\":\"E013\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":9,\"TheoreticalQuantity\":\"0\",\"Variance\":9,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-180', '1'),
(181, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"11\",\"AssetName\":\"CIRCUIT BREAKER - 32AMPS\",\"AssetCode\":\"E014\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-181', '1'),
(182, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"12\",\"AssetName\":\"CURCUIT  BREAKER MAIN SWITCH - 63AMPS\",\"AssetCode\":\"E015\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":4,\"TheoreticalQuantity\":\"0\",\"Variance\":4,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-182', '1'),
(183, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"13\",\"AssetName\":\"CIRCUIT BREAKER - 20AMPS\",\"AssetCode\":\"E016\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":7,\"TheoreticalQuantity\":\"0\",\"Variance\":7,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-183', '1'),
(184, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"14\",\"AssetName\":\"EARTH LEAKAGE MCB\",\"AssetCode\":\"E018\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":20,\"TheoreticalQuantity\":\"0\",\"Variance\":20,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-184', '1'),
(185, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"15\",\"AssetName\":\"COPPER BUSBAR\",\"AssetCode\":\"E019\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-185', '1'),
(186, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"16\",\"AssetName\":\"3 PHASE CIRCUIT BREAKER- SB2 RISERS\",\"AssetCode\":\"E020\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-186', '1'),
(187, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"17\",\"AssetName\":\"STOVE CONNECTOR\",\"AssetCode\":\"E022\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-187', '1'),
(188, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"18\",\"AssetName\":\"EXTENSION BOX  - 4x2\",\"AssetCode\":\"E025\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":5,\"TheoreticalQuantity\":\"0\",\"Variance\":5,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-188', '1'),
(189, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"19\",\"AssetName\":\"VING CARD READERS\",\"AssetCode\":\"E035\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-189', '1'),
(190, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"20\",\"AssetName\":\"VING CARD BATTERY CASSETTES\",\"AssetCode\":\"E036\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-190', '1'),
(191, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"21\",\"AssetName\":\"LEVER SWITCH 4x4 - SB1\",\"AssetCode\":\"E005\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":11,\"TheoreticalQuantity\":\"0\",\"Variance\":11,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-191', '1'),
(192, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"22\",\"AssetName\":\"LED DOWNLIGHTS \",\"AssetCode\":\"E006\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":50,\"TheoreticalQuantity\":\"0\",\"Variance\":50,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-192', '1'),
(193, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"23\",\"AssetName\":\"DOWN LIGHT FITTING\",\"AssetCode\":\"E007\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":60,\"TheoreticalQuantity\":\"0\",\"Variance\":60,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-193', '1'),
(194, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"24\",\"AssetName\":\"e27 LIGHT FITTING\",\"AssetCode\":\"E023\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-194', '1'),
(195, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"25\",\"AssetName\":\"INSULATION TAPE\",\"AssetCode\":\"E017\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":4,\"TheoreticalQuantity\":\"0\",\"Variance\":4,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-195', '1'),
(196, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"26\",\"AssetName\":\"CABLE TIES\",\"AssetCode\":\"E026\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-196', '1'),
(197, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"27\",\"AssetName\":\"SURFIX CABLE - 3 CORE FLAT - PER METER\",\"AssetCode\":\"E027\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-197', '1'),
(198, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"28\",\"AssetName\":\"SURFIX  CABLE - PER METER\",\"AssetCode\":\"E028\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-198', '1'),
(199, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"29\",\"AssetName\":\"CONDUIT 20MM SABS PVC \",\"AssetCode\":\"E029\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-199', '1'),
(200, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"30\",\"AssetName\":\"PVC SOCKET 2OMM\",\"AssetCode\":\"E030\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-200', '1'),
(201, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"31\",\"AssetName\":\"TRUNKING 16 x 16 PVC \",\"AssetCode\":\"E031\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-201', '1');
INSERT INTO `other_info` (`Id`, `Name`, `ItemType`, `ImageUrl`, `ParentId`, `Notes`, `ItemValue`, `Status`, `Decription`, `Rules`, `ItemCode`, `CreateDate`, `Slug`, `OwnerId`) VALUES
(202, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"32\",\"AssetName\":\"GASKET SMALL\",\"AssetCode\":\"E032\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":4,\"TheoreticalQuantity\":\"0\",\"Variance\":4,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-202', '1'),
(203, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"33\",\"AssetName\":\"CIRCUIT BREAKER - 10AMPS\",\"AssetCode\":\"E033\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":7,\"TheoreticalQuantity\":\"0\",\"Variance\":7,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-203', '1'),
(204, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"34\",\"AssetName\":\"CIRCUIT BREAKER - 25AMPS\",\"AssetCode\":\"E034\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-204', '1'),
(205, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"35\",\"AssetName\":\"AAA BATTERIES\",\"AssetCode\":\"E037\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":220,\"TheoreticalQuantity\":\"0\",\"Variance\":220,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-205', '1'),
(206, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"36\",\"AssetName\":\"AA BATTERIES\",\"AssetCode\":\"E038\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-206', '1'),
(207, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"38\",\"AssetName\":\"BULKHEAD LIGHTS \",\"AssetCode\":\"E021\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":40,\"TheoreticalQuantity\":\"0\",\"Variance\":40,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-207', '1'),
(208, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"39\",\"AssetName\":\"e27 STUDY LIGHT GLOBE\",\"AssetCode\":\"E024\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":122,\"TheoreticalQuantity\":\"0\",\"Variance\":122,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:45', '21-05-2025-11-40-30-208', '1'),
(209, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"40\",\"AssetName\":\"POP RIVET GUN\",\"AssetCode\":\"HM001\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-209', '1'),
(210, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"41\",\"AssetName\":\"SCREWDRIVER BITS SET 2PCS 50MM\",\"AssetCode\":\"HM006\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-210', '1'),
(211, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"42\",\"AssetName\":\"BLADE SNAP OFF 82MM\",\"AssetCode\":\"HM007\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-211', '1'),
(212, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"43\",\"AssetName\":\"JIG SAW BLADE 4MM\",\"AssetCode\":\"HM009\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-212', '1'),
(213, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"44\",\"AssetName\":\"JIG SAW BLADE 2.5MM\",\"AssetCode\":\"HM010\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-213', '1'),
(214, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"45\",\"AssetName\":\"HITTIES 100s\",\"AssetCode\":\"HM011\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-214', '1'),
(215, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"46\",\"AssetName\":\"HITTIES\",\"AssetCode\":\"HM012\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":29,\"TheoreticalQuantity\":\"0\",\"Variance\":29,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-215', '1'),
(216, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"47\",\"AssetName\":\"SILICONE CLEAR\",\"AssetCode\":\"HM013\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":25,\"TheoreticalQuantity\":\"0\",\"Variance\":25,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-216', '1'),
(217, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"48\",\"AssetName\":\"ACRYLIC SILICONE WHITE\",\"AssetCode\":\"HM014\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-217', '1'),
(218, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"49\",\"AssetName\":\"FRACTION STAYS\",\"AssetCode\":\"HM015\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":120,\"TheoreticalQuantity\":\"0\",\"Variance\":120,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-218', '1'),
(219, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"50\",\"AssetName\":\"CORNER CLICKS FOR WINDOWS\",\"AssetCode\":\"HM016\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-219', '1'),
(220, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"51\",\"AssetName\":\"DOOR CLOSER UNION\",\"AssetCode\":\"HM017\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":16,\"TheoreticalQuantity\":\"0\",\"Variance\":16,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-220', '1'),
(221, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"52\",\"AssetName\":\"WINDOWS HANDLE SB2\",\"AssetCode\":\"HM018\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":54,\"TheoreticalQuantity\":\"0\",\"Variance\":54,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-221', '1'),
(222, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"54\",\"AssetName\":\"DIAMOND SAW BLADE \",\"AssetCode\":\"HM020\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-222', '1'),
(223, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"55\",\"AssetName\":\"CUTTING DISC STEEL STANDARD\",\"AssetCode\":\"HM021\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":5,\"TheoreticalQuantity\":\"0\",\"Variance\":5,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-223', '1'),
(224, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"56\",\"AssetName\":\"CUTTING BRUSH - 25MM\",\"AssetCode\":\"HM022\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-224', '1'),
(225, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"57\",\"AssetName\":\"CUTTING BRUSH - 1.5MM\",\"AssetCode\":\"HM023\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-225', '1'),
(226, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"58\",\"AssetName\":\"TURPENTINE                                       5LITRES\",\"AssetCode\":\"HM024\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-226', '1'),
(227, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"59\",\"AssetName\":\"THINERS                                               5LITRES\",\"AssetCode\":\"HM025\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-227', '1'),
(228, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"60\",\"AssetName\":\"BATHROOM LATCH LOCK\",\"AssetCode\":\"HM026\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-228', '1'),
(229, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"61\",\"AssetName\":\"DOOR HINGES\",\"AssetCode\":\"HM027\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":58,\"TheoreticalQuantity\":\"0\",\"Variance\":58,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-229', '1'),
(230, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"62\",\"AssetName\":\"TILES SIZE 33x33  - LOOSE\",\"AssetCode\":\"HM028\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":32,\"TheoreticalQuantity\":\"0\",\"Variance\":32,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-230', '1'),
(231, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"63\",\"AssetName\":\"TILES SIZE 45x45 - LOOSE\",\"AssetCode\":\"HM029\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-231', '1'),
(232, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"64\",\"AssetName\":\"TILES SIZE 30x30 - LOOSE\",\"AssetCode\":\"HM030\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":32,\"TheoreticalQuantity\":\"0\",\"Variance\":32,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-232', '1'),
(233, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"65\",\"AssetName\":\"CEILING TILES - 600x600 - SB2\",\"AssetCode\":\"HM031\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":16,\"TheoreticalQuantity\":\"0\",\"Variance\":16,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-233', '1'),
(234, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"66\",\"AssetName\":\"CEILING TILES - 1200x1200 - SB1\",\"AssetCode\":\"HM032\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-234', '1'),
(235, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"67\",\"AssetName\":\"RHINOLITE 50 KG\",\"AssetCode\":\"HM033\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-235', '1'),
(236, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"68\",\"AssetName\":\"WATERPROOF DEBI GUN\",\"AssetCode\":\"HM034\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-236', '1'),
(237, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"69\",\"AssetName\":\"CEMENT 50 KG\",\"AssetCode\":\"HM035\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-237', '1'),
(238, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"70\",\"AssetName\":\"TOILET ROLL HOLDERS - GELMAR\",\"AssetCode\":\"HM036\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-238', '1'),
(239, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"71\",\"AssetName\":\"MILELLIUM BOARD\",\"AssetCode\":\"HM037\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-239', '1'),
(240, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"72\",\"AssetName\":\"ACRYLIC WATER PROOFING        5LITRES\",\"AssetCode\":\"HM038\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-240', '1'),
(241, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"73\",\"AssetName\":\"ROLLER BRUSH TRAY\",\"AssetCode\":\"HM039\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-241', '1'),
(242, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"74\",\"AssetName\":\"ROLLER BRUSH\",\"AssetCode\":\"HM040\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-242', '1'),
(243, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"75\",\"AssetName\":\"POP RIVETS - 4.8MM\",\"AssetCode\":\"HM041\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":300,\"TheoreticalQuantity\":\"0\",\"Variance\":300,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-243', '1'),
(244, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"76\",\"AssetName\":\"POP RIVETS - 4.8MMx1.5MM\",\"AssetCode\":\"HM042\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":100,\"TheoreticalQuantity\":\"0\",\"Variance\":100,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-244', '1'),
(245, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"77\",\"AssetName\":\"DRY WALL  SCREW\",\"AssetCode\":\"HM043\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-245', '1'),
(246, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"78\",\"AssetName\":\"SAND PAPER - 60MM\",\"AssetCode\":\"HM044\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-246', '1'),
(247, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"79\",\"AssetName\":\"SAND PAPER - 80MM\",\"AssetCode\":\"HM045\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-247', '1'),
(248, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"80\",\"AssetName\":\"STAINLESS DRILL BIT - 6MM\",\"AssetCode\":\"HM046\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":17,\"TheoreticalQuantity\":\"0\",\"Variance\":17,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-248', '1'),
(249, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"81\",\"AssetName\":\"STAINLESS DRILL BIT - 5MM\",\"AssetCode\":\"HM047\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-249', '1'),
(250, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"82\",\"AssetName\":\"STAINLESS DRILL BIT - 4MM\",\"AssetCode\":\"HM048\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-250', '1'),
(251, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"83\",\"AssetName\":\"CLOUT NAILS 32mm\",\"AssetCode\":\"HM049\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":200,\"TheoreticalQuantity\":\"0\",\"Variance\":200,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-251', '1'),
(252, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"84\",\"AssetName\":\" NAILS STANDARD  \",\"AssetCode\":\"HM050\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":100,\"TheoreticalQuantity\":\"0\",\"Variance\":100,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-252', '1'),
(253, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"86\",\"AssetName\":\"CONTACT GLUE\",\"AssetCode\":\"HM052\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-253', '1'),
(254, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"87\",\"AssetName\":\"HEADLESS NAILS \",\"AssetCode\":\"HM053\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":100,\"TheoreticalQuantity\":\"0\",\"Variance\":100,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-254', '1'),
(255, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"88\",\"AssetName\":\"PVA WHITE PAINT PRO STAR 10LT\",\"AssetCode\":\"HM054\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-255', '1'),
(256, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"89\",\"AssetName\":\"ENAMEL PAINT BLACK 5LT\",\"AssetCode\":\"HM055\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-256', '1'),
(257, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"90\",\"AssetName\":\"GAZ BOTTLE 50KG\",\"AssetCode\":\"HM056\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-257', '1'),
(258, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"91\",\"AssetName\":\"Q 20\",\"AssetCode\":\"HM057\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-258', '1'),
(259, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"92\",\"AssetName\":\"DRILL BIT 16MMX210MM SDS \",\"AssetCode\":\"HM058\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-259', '1'),
(260, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"93\",\"AssetName\":\"DRILL BIT SDS 6X160MM\",\"AssetCode\":\"HM059\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-260', '1'),
(261, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"94\",\"AssetName\":\"DRILL BIT SDS 10X160MM\",\"AssetCode\":\"HM060\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-261', '1'),
(262, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"95\",\"AssetName\":\"DRILL BIT SDS 8X160MM\",\"AssetCode\":\"HM061\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-262', '1'),
(263, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"96\",\"AssetName\":\"MASONITE BOARD    SHEET\",\"AssetCode\":\"HM062\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-263', '1'),
(264, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"97\",\"AssetName\":\"DRY WALL SCREWS - LOOSE\",\"AssetCode\":\"HM063\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":100,\"TheoreticalQuantity\":\"0\",\"Variance\":100,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-264', '1'),
(265, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"98\",\"AssetName\":\"DRILL BIT 12MMX160MM SDS \",\"AssetCode\":\"HM064\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-265', '1'),
(266, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"99\",\"AssetName\":\"EVASTICK MOSAIC ADHESIVE\",\"AssetCode\":\"HM065\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-266', '1'),
(267, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"100\",\"AssetName\":\"POWABOND\",\"AssetCode\":\"HM066\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-267', '1'),
(268, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"101\",\"AssetName\":\"MASKING TAPE SMALL - 10MM\",\"AssetCode\":\"HM067\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-268', '1'),
(269, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"102\",\"AssetName\":\"8MM X 50 HILTIS\",\"AssetCode\":\"HM068\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-269', '1'),
(270, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"103\",\"AssetName\":\"SUGAR SOAP\",\"AssetCode\":\"HM069\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":4,\"TheoreticalQuantity\":\"0\",\"Variance\":4,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-270', '1'),
(271, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"104\",\"AssetName\":\"CUPBOARD RUNNERS\",\"AssetCode\":\"HM070\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":6,\"TheoreticalQuantity\":\"0\",\"Variance\":6,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-271', '1'),
(272, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"107\",\"AssetName\":\"PLY WOOD BOARD\",\"AssetCode\":\"HM051\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-272', '1'),
(273, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"109\",\"AssetName\":\"WOOD GLUE MULTIPURPOSE - 500ML\",\"AssetCode\":\"HM002\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":7,\"TheoreticalQuantity\":\"0\",\"Variance\":7,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-273', '1'),
(274, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"110\",\"AssetName\":\"SCRAPPER 100MM\",\"AssetCode\":\"HM003\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-274', '1'),
(275, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"111\",\"AssetName\":\"TROWEL GAUGING 150MM LASHER\",\"AssetCode\":\"HM004\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-275', '1'),
(276, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"112\",\"AssetName\":\"TRIMMING KNIFE PVC 82MM 1 PAIR\",\"AssetCode\":\"HM005\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-276', '1'),
(277, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"113\",\"AssetName\":\"EPOXY CLEAR\",\"AssetCode\":\"HM008\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-277', '1'),
(278, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"114\",\"AssetName\":\"PRESSURE CONTROLER VALVE\",\"AssetCode\":\"P001\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":24,\"TheoreticalQuantity\":\"0\",\"Variance\":24,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-278', '1'),
(279, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"115\",\"AssetName\":\"TOILET BALL VALVE \",\"AssetCode\":\"P015\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-279', '1'),
(280, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"116\",\"AssetName\":\"15MM ANGLE VALVE \",\"AssetCode\":\"P032\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-280', '1'),
(281, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"117\",\"AssetName\":\"400KPA SAFETY VALVES\",\"AssetCode\":\"P034\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":8,\"TheoreticalQuantity\":\"0\",\"Variance\":8,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-281', '1'),
(282, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"118\",\"AssetName\":\"600KPA SAFETY VALVES\",\"AssetCode\":\"P036\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-282', '1'),
(283, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"119\",\"AssetName\":\"22MM BALL O STOP\",\"AssetCode\":\"P056\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":16,\"TheoreticalQuantity\":\"0\",\"Variance\":16,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-283', '1'),
(284, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"120\",\"AssetName\":\"15MM BALL O STOP\",\"AssetCode\":\"P066\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-284', '1'),
(285, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"121\",\"AssetName\":\"15MM STOP END  DELCOP\",\"AssetCode\":\"P067\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-285', '1'),
(286, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"123\",\"AssetName\":\"BUTTERFLY NUTS\",\"AssetCode\":\"P002\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":8,\"TheoreticalQuantity\":\"0\",\"Variance\":8,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-286', '1'),
(287, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"124\",\"AssetName\":\"TOILET TANKS\",\"AssetCode\":\"P033\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":8,\"TheoreticalQuantity\":\"0\",\"Variance\":8,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-287', '1'),
(288, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"125\",\"AssetName\":\"TOILET SEAT COVER\",\"AssetCode\":\"P037\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":11,\"TheoreticalQuantity\":\"0\",\"Variance\":11,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-288', '1'),
(289, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"126\",\"AssetName\":\"FLUSH HANDLE ARM\",\"AssetCode\":\"P046\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":18,\"TheoreticalQuantity\":\"0\",\"Variance\":18,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-289', '1'),
(290, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"127\",\"AssetName\":\"TOILET FLUSH HANDLE\",\"AssetCode\":\"P047\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-290', '1'),
(291, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"128\",\"AssetName\":\"TOILET SEAT COVER FIXATIONS NUTS\",\"AssetCode\":\"P057\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":16,\"TheoreticalQuantity\":\"0\",\"Variance\":16,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-291', '1'),
(292, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"129\",\"AssetName\":\"RUBBER BANG TOILET\",\"AssetCode\":\"P093\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-292', '1'),
(293, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"130\",\"AssetName\":\"54MM POLYCORP PIPE - PER METER\",\"AssetCode\":\"P104\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":6,\"TheoreticalQuantity\":\"0\",\"Variance\":6,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-293', '1'),
(294, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"131\",\"AssetName\":\"BALL FLOAT \",\"AssetCode\":\"P118\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":7,\"TheoreticalQuantity\":\"0\",\"Variance\":7,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-294', '1'),
(295, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"133\",\"AssetName\":\"BASIN MIXER FASTENING SET -DOUBLE POLE M6\",\"AssetCode\":\"P003\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":8,\"TheoreticalQuantity\":\"0\",\"Variance\":8,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-295', '1'),
(296, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"134\",\"AssetName\":\"BASIN MIXER \",\"AssetCode\":\"P004\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":4,\"TheoreticalQuantity\":\"0\",\"Variance\":4,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-296', '1'),
(297, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"135\",\"AssetName\":\"GARDEN TAP\",\"AssetCode\":\"P011\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-297', '1'),
(298, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"136\",\"AssetName\":\"SHOWER MIXER\",\"AssetCode\":\"P012\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-298', '1'),
(299, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"137\",\"AssetName\":\"KITCHEN MIXER \",\"AssetCode\":\"P013\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-299', '1'),
(300, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"138\",\"AssetName\":\"MIXER HANDLE\",\"AssetCode\":\"P068\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-300', '1'),
(301, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"139\",\"AssetName\":\"BALL O STOP - 16MM\",\"AssetCode\":\"P101\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-301', '1'),
(302, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"140\",\"AssetName\":\"SHOWER TAP HEAD SET\",\"AssetCode\":\"P102\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-302', '1'),
(303, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"141\",\"AssetName\":\"PVC PIPE - PER METER\",\"AssetCode\":\"P103\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-303', '1'),
(304, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"142\",\"AssetName\":\"TAP WASHER 1\\/4 \\\"\",\"AssetCode\":\"P107\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-304', '1'),
(305, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"146\",\"AssetName\":\"WINDOWS PUTTY\",\"AssetCode\":\"P005\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-305', '1'),
(306, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"147\",\"AssetName\":\"EPOXY \",\"AssetCode\":\"P006\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-306', '1'),
(307, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"148\",\"AssetName\":\"NASCO FLUX\",\"AssetCode\":\"P009\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-307', '1'),
(308, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"149\",\"AssetName\":\"M10 RAWL BOLT\",\"AssetCode\":\"P029\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":35,\"TheoreticalQuantity\":\"0\",\"Variance\":35,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-308', '1'),
(309, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"150\",\"AssetName\":\"THREAD TAPE\",\"AssetCode\":\"P030\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":16,\"TheoreticalQuantity\":\"0\",\"Variance\":16,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-309', '1');
INSERT INTO `other_info` (`Id`, `Name`, `ItemType`, `ImageUrl`, `ParentId`, `Notes`, `ItemValue`, `Status`, `Decription`, `Rules`, `ItemCode`, `CreateDate`, `Slug`, `OwnerId`) VALUES
(310, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"151\",\"AssetName\":\"BASIN FIXING BOLT \",\"AssetCode\":\"P044\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-310', '1'),
(311, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"152\",\"AssetName\":\"750ML GAS CARTRIDGE\",\"AssetCode\":\"P053\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-311', '1'),
(312, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"153\",\"AssetName\":\"TANGIT PVC\",\"AssetCode\":\"P007\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-312', '1'),
(313, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"154\",\"AssetName\":\"BANG OUT\",\"AssetCode\":\"P035\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-313', '1'),
(314, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"155\",\"AssetName\":\"110MM ALUMINIUM HOLDER BAT\",\"AssetCode\":\"P052\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":8,\"TheoreticalQuantity\":\"0\",\"Variance\":8,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-314', '1'),
(315, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"156\",\"AssetName\":\"15MM HOLDERBAT\",\"AssetCode\":\"P058\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-315', '1'),
(316, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"157\",\"AssetName\":\"22X15X22MM REDUCER TEE\",\"AssetCode\":\"P064\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":5,\"TheoreticalQuantity\":\"0\",\"Variance\":5,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-316', '1'),
(317, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"158\",\"AssetName\":\"VACUUM BRACKERS\",\"AssetCode\":\"P070\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-317', '1'),
(318, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"159\",\"AssetName\":\"FLEX HOSE FEMALE\",\"AssetCode\":\"P071\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":14,\"TheoreticalQuantity\":\"0\",\"Variance\":14,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-318', '1'),
(319, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"160\",\"AssetName\":\"FLEX HOSE MALE\",\"AssetCode\":\"P072\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":14,\"TheoreticalQuantity\":\"0\",\"Variance\":14,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-319', '1'),
(320, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"161\",\"AssetName\":\"CASCADE FULL CLAMP 75X150\",\"AssetCode\":\"P080\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-320', '1'),
(321, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"162\",\"AssetName\":\"CONCRETE SINK STAND\",\"AssetCode\":\"P091\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":6,\"TheoreticalQuantity\":\"0\",\"Variance\":6,\"Date\":\"2025-05-21T09:40:30.466Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-321', '1'),
(322, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"163\",\"AssetName\":\"DENZO TAPE\",\"AssetCode\":\"P100\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-322', '1'),
(323, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"164\",\"AssetName\":\"PVC GALI HEAD\",\"AssetCode\":\"P113\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-323', '1'),
(324, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"165\",\"AssetName\":\"PVC GALI GRID\",\"AssetCode\":\"P114\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-324', '1'),
(325, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"167\",\"AssetName\":\"VANITY  BASIN\",\"AssetCode\":\"P008\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-325', '1'),
(326, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"168\",\"AssetName\":\"SHOWER ROSE\",\"AssetCode\":\"P016\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-326', '1'),
(327, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"169\",\"AssetName\":\"SHOWER ARM\",\"AssetCode\":\"P017\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-327', '1'),
(328, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"170\",\"AssetName\":\"BASIN  WASTE AND PLUG\",\"AssetCode\":\"P019\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-328', '1'),
(329, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"171\",\"AssetName\":\"P-TRAP BASIN AREA - 3.2x40\",\"AssetCode\":\"P087\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-329', '1'),
(330, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"172\",\"AssetName\":\"PLASTIC JUNIOR WASH HAND BASIN\",\"AssetCode\":\"P117\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-330', '1'),
(331, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"173\",\"AssetName\":\"EXTENDABLE PAN CONNECTOR\",\"AssetCode\":\"P010\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-331', '1'),
(332, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"174\",\"AssetName\":\"45 DEGREES PVC BEND\",\"AssetCode\":\"P014\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-332', '1'),
(333, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"175\",\"AssetName\":\"T JOINT PVC \",\"AssetCode\":\"P020\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":4,\"TheoreticalQuantity\":\"0\",\"Variance\":4,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-333', '1'),
(334, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"176\",\"AssetName\":\"110MM SS COUPLING\",\"AssetCode\":\"P021\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":4,\"TheoreticalQuantity\":\"0\",\"Variance\":4,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-334', '1'),
(335, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"177\",\"AssetName\":\"160MM SS COUPLING\",\"AssetCode\":\"P022\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-335', '1'),
(336, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"178\",\"AssetName\":\"75MM SS COUPLING\",\"AssetCode\":\"P023\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-336', '1'),
(337, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"179\",\"AssetName\":\"50MM SS COUPLING\",\"AssetCode\":\"P024\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-337', '1'),
(338, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"180\",\"AssetName\":\" 110X75 REDUCER PVC\",\"AssetCode\":\"P026\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-338', '1'),
(339, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"181\",\"AssetName\":\" 110X90 DEGREE PVC SV BEND\",\"AssetCode\":\"P027\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-339', '1'),
(340, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"182\",\"AssetName\":\" 110MM SINGLE SOCKET\",\"AssetCode\":\"P028\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":9,\"TheoreticalQuantity\":\"0\",\"Variance\":9,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-340', '1'),
(341, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"183\",\"AssetName\":\"15MM CONNEX TEE\",\"AssetCode\":\"P039\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-341', '1'),
(342, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"184\",\"AssetName\":\"22MM CONNEX TEE\",\"AssetCode\":\"P040\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-342', '1'),
(343, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"185\",\"AssetName\":\"15MM STRAIGHT CONNEX\",\"AssetCode\":\"P041\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-343', '1'),
(344, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"186\",\"AssetName\":\"15MM CONNEX ELBOW\",\"AssetCode\":\"P042\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-344', '1'),
(345, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"187\",\"AssetName\":\"22MM STRAIGHT CONNEX\",\"AssetCode\":\"P043\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-345', '1'),
(346, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"188\",\"AssetName\":\"15MM STOP END CONNEX\",\"AssetCode\":\"P050\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-346', '1'),
(347, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"189\",\"AssetName\":\"50MM PVC STRAIGHTER COUPLER\",\"AssetCode\":\"P051\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":8,\"TheoreticalQuantity\":\"0\",\"Variance\":8,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-347', '1'),
(348, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"190\",\"AssetName\":\"15MM DELCOP ELBOW\",\"AssetCode\":\"P059\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-348', '1'),
(349, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"191\",\"AssetName\":\"22MM DELCOP ELBOW\",\"AssetCode\":\"P060\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":31,\"TheoreticalQuantity\":\"0\",\"Variance\":31,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-349', '1'),
(350, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"192\",\"AssetName\":\"15MM EQUAL EQUAL TEE\",\"AssetCode\":\"P061\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":10,\"TheoreticalQuantity\":\"0\",\"Variance\":10,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-350', '1'),
(351, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"193\",\"AssetName\":\"22MM EQUAL TEE\",\"AssetCode\":\"P062\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-351', '1'),
(352, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"194\",\"AssetName\":\"22X15MM DELCOP REDUCER\",\"AssetCode\":\"P063\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-352', '1'),
(353, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"195\",\"AssetName\":\"15MM STRAIGHT COUPLER DELCOP\",\"AssetCode\":\"P065\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":6,\"TheoreticalQuantity\":\"0\",\"Variance\":6,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-353', '1'),
(354, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"196\",\"AssetName\":\"PVC BEND - 90MM\",\"AssetCode\":\"P069\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":17,\"TheoreticalQuantity\":\"0\",\"Variance\":17,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-354', '1'),
(355, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"197\",\"AssetName\":\"76X76X54MM REDUCING TEE\",\"AssetCode\":\"P078\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-355', '1'),
(356, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"198\",\"AssetName\":\"54MM STRAIGHT COUPLER\",\"AssetCode\":\"P079\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-356', '1'),
(357, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"199\",\"AssetName\":\"76MM SLIP COUPLER\",\"AssetCode\":\"P081\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-357', '1'),
(358, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"200\",\"AssetName\":\"GALVANISER PLUG FEMALE\",\"AssetCode\":\"P083\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-358', '1'),
(359, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"201\",\"AssetName\":\"GALVANISER PLUG MALE\",\"AssetCode\":\"P084\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":12,\"TheoreticalQuantity\":\"0\",\"Variance\":12,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-359', '1'),
(360, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"202\",\"AssetName\":\"DROP IN VANITY BASIN\",\"AssetCode\":\"P088\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-360', '1'),
(361, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"203\",\"AssetName\":\"MASTERBAT\",\"AssetCode\":\"P092\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-361', '1'),
(362, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"204\",\"AssetName\":\"GALVANISED NIPPLE\",\"AssetCode\":\"P096\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":4,\"TheoreticalQuantity\":\"0\",\"Variance\":4,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-362', '1'),
(363, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"205\",\"AssetName\":\"PVC BENDS\",\"AssetCode\":\"P098\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-363', '1'),
(364, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"206\",\"AssetName\":\"PVC Y - JUNCTION\",\"AssetCode\":\"P099\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-364', '1'),
(365, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"207\",\"AssetName\":\"FRENCH ELBOW 90*\",\"AssetCode\":\"P109\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-365', '1'),
(366, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"208\",\"AssetName\":\"GEYSER TRAY MALE ADAPTOR\",\"AssetCode\":\"P110\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-366', '1'),
(367, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"209\",\"AssetName\":\"PVC PAN CONNECTOR 110MM\",\"AssetCode\":\"P111\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":5,\"TheoreticalQuantity\":\"0\",\"Variance\":5,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-367', '1'),
(368, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"210\",\"AssetName\":\"PLASTIC PILLAR TAP\",\"AssetCode\":\"P112\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-368', '1'),
(369, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"211\",\"AssetName\":\"PVC BEND\",\"AssetCode\":\"P115\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-369', '1'),
(370, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"212\",\"AssetName\":\"50MM PVC PIPE\",\"AssetCode\":\"P018\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-370', '1'),
(371, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"213\",\"AssetName\":\"110MM PVC PIPE\",\"AssetCode\":\"P025\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-371', '1'),
(372, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"214\",\"AssetName\":\"40MM COPPER PIPE - PER METER\",\"AssetCode\":\"P038\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-372', '1'),
(373, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"215\",\"AssetName\":\"22MM COPPER PIPE 5.5MT - PER METER\",\"AssetCode\":\"P074\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":16,\"TheoreticalQuantity\":\"0\",\"Variance\":16,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-373', '1'),
(374, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"216\",\"AssetName\":\"15MM COPPER PIPE 5.5MT - PER METER\",\"AssetCode\":\"P075\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-374', '1'),
(375, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"217\",\"AssetName\":\"54x5.5M COPPER PIPE TUBE - PER METER\",\"AssetCode\":\"P076\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-375', '1'),
(376, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"218\",\"AssetName\":\"76X5.5M COPPER PIPE TUBE - PER METER\",\"AssetCode\":\"P077\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-376', '1'),
(377, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"219\",\"AssetName\":\"COPPER PIPE 22MM - PER METER\",\"AssetCode\":\"P089\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":16,\"TheoreticalQuantity\":\"0\",\"Variance\":16,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-377', '1'),
(378, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"220\",\"AssetName\":\"COPPER PIPE BRACKET - MASTERBAT - 75x50\",\"AssetCode\":\"P094\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":5,\"TheoreticalQuantity\":\"0\",\"Variance\":5,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-378', '1'),
(379, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"221\",\"AssetName\":\"COPPER PIPE BRACKET - MASTERBAT - 52x56\",\"AssetCode\":\"P095\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-379', '1'),
(380, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"222\",\"AssetName\":\"RUBBER FLUSH PIPE CONNECTOR\",\"AssetCode\":\"P097\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":10,\"TheoreticalQuantity\":\"0\",\"Variance\":10,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-380', '1'),
(381, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"223\",\"AssetName\":\"PVC POOL FLEXI PIPE\",\"AssetCode\":\"P116\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-381', '1'),
(382, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"227\",\"AssetName\":\"SINK WASTE FOR SB2 - KITCHEN\",\"AssetCode\":\"P031\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-382', '1'),
(383, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"228\",\"AssetName\":\"100L GEYSERS \",\"AssetCode\":\"P048\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-383', '1'),
(384, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"229\",\"AssetName\":\"40MM SHOWER MIXER CARTRIGE-FLAT\",\"AssetCode\":\"P045\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":11,\"TheoreticalQuantity\":\"0\",\"Variance\":11,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-384', '1'),
(385, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"230\",\"AssetName\":\"32MM GASKET CLAMP\",\"AssetCode\":\"P054\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3,\"TheoreticalQuantity\":\"0\",\"Variance\":3,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-385', '1'),
(386, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"231\",\"AssetName\":\"45-55MM GASKET CLAMP\",\"AssetCode\":\"P055\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-386', '1'),
(387, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"232\",\"AssetName\":\"WAX PAN SEAL RING\",\"AssetCode\":\"P082\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":14,\"TheoreticalQuantity\":\"0\",\"Variance\":14,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-387', '1'),
(388, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"233\",\"AssetName\":\"BATH TRAP\",\"AssetCode\":\"P073\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-388', '1'),
(389, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"234\",\"AssetName\":\"S-TRAP\",\"AssetCode\":\"P085\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":5,\"TheoreticalQuantity\":\"0\",\"Variance\":5,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-389', '1'),
(390, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"235\",\"AssetName\":\"P-TRAP KITCHEN\",\"AssetCode\":\"P086\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":2,\"TheoreticalQuantity\":\"0\",\"Variance\":2,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-390', '1'),
(391, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"236\",\"AssetName\":\"TOILET TANK OVERFLOW PLUG\",\"AssetCode\":\"P090\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":8,\"TheoreticalQuantity\":\"0\",\"Variance\":8,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-391', '1'),
(392, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"237\",\"AssetName\":\"FLEXI ROD\",\"AssetCode\":\"P105\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-392', '1'),
(393, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"238\",\"AssetName\":\"COPPER PIPE 76MM - PER METER\",\"AssetCode\":\"P106\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-393', '1'),
(394, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"239\",\"AssetName\":\"BASIN MIXER - CARTRIDGE\",\"AssetCode\":\"P108\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-394', '1'),
(395, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"240\",\"AssetName\":\"Asset Test \",\"AssetCode\":\"AST1\",\"AssetCategoryName\":\"Electrical\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-395', '1'),
(396, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"241\",\"AssetName\":\"WOOD GLUE MULTIPURPOSE - 1L\",\"AssetCode\":\"HM019\",\"AssetCategoryName\":\"Handyman Stock\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":1,\"TheoreticalQuantity\":\"0\",\"Variance\":1,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-396', '1'),
(397, '21_05_2025_11:40:30', 'StockTake', '', '1', '', '{\"AssetId\":\"242\",\"AssetName\":\"150L GEYSERS\",\"AssetCode\":\"P049\",\"AssetCategoryName\":\"Plumbing\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":0,\"TheoreticalQuantity\":\"0\",\"Variance\":0,\"Date\":\"2025-05-21T09:40:30.467Z\",\"Status\":\"pending\",\"Comments\":[]}', 'Counted', '', '', 'stock-take-976-maxr5ncz', '2025-05-21 13:31:46', '21-05-2025-11-40-30-397', '1'),
(398, 'comments-21_05_2025_11:40:30', 'StockTakeComments', '', '21_05_2025_11:40:30', '', '[{\"comment\":\"First stock take\",\"createdBy\":\"Mr Admin\",\"createdDate\":\"2025-05-22T10:00:08.113Z\"},{\"comment\":\"Adjustment made for stock take capture. Approved: Noor Kamdar\",\"createdBy\":\"Mr Admin\",\"createdDate\":\"2025-05-22T10:03:01.962Z\"}]', 'active', '', '', '', '2025-05-22 12:03:02', 'comments-21-05-2025-11-40-30-398', '1'),
(399, 'Other_Stock_Take', 'StockTake', '', '1', '', '{\"AssetId\":\"243\",\"AssetName\":\"TOILET PAPER ROLLS - LOOSE\",\"AssetCode\":\"O001\",\"AssetCategoryId\":5,\"AssetCategoryName\":\"Other\",\"LocationId\":0,\"LocationName\":\"\",\"Quantity\":3072,\"TheoreticalQuantity\":\"0\",\"Variance\":3072,\"Date\":\"2025-05-22T12:31:37.207Z\",\"Status\":\"pending\",\"Comments\":[]}', 'balanced', '', '', 'stock-take-994-mazcpjw7', '2025-05-22 14:32:24', 'other-stock-take-399', '1'),
(400, 'Pearl T1-1', 'Locations', '', '1', '', '{\"Name\":\"Pearl T1-1\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"37\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"Yes\"}', 'Active', '', '', '', '2025-05-22 15:15:15', 'pearl-400', '1'),
(401, '801', 'Locations', '', '1', '', '{\"Name\":\"801\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:20:26', '801-401', '1'),
(402, '802', 'Locations', '', '1', '', '{\"Name\":\"802\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:20:47', '802-402', '1'),
(403, '803', 'Locations', '', '1', '', '{\"Name\":\"803\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:21:12', '803-403', '1'),
(404, '804', 'Locations', '', '1', '', '{\"Name\":\"804\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:21:55', '804-404', '1'),
(405, '805', 'Locations', '', '1', '', '{\"Name\":\"805\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:22:09', '805-405', '1'),
(406, '806', 'Locations', '', '1', '', '{\"Name\":\"806\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:22:20', '806-406', '1'),
(407, '807', 'Locations', '', '1', '', '{\"Name\":\"807\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:22:29', '807-407', '1'),
(408, '808', 'Locations', '', '1', '', '{\"Name\":\"808\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:22:56', '808-408', '1'),
(409, '809', 'Locations', '', '1', '', '{\"Name\":\"809\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:23:12', '809-409', '1'),
(410, '810', 'Locations', '', '1', '', '{\"Name\":\"810\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:23:21', '810-410', '1'),
(411, '811', 'Locations', '', '1', '', '{\"Name\":\"811\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:23:32', '811-411', '1'),
(412, '812', 'Locations', '', '1', '', '{\"Name\":\"812\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 15:24:53', '812-412', '1'),
(413, '813', 'Locations', '', '1', '', '{\"Name\":\"813\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:30:46', '901-413', '1'),
(414, '814', 'Locations', '', '1', '', '{\"Name\":\"814\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:31:53', '814-414', '1'),
(415, '814', 'Locations', '', '1', '', '{\"Name\":\"814\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:31:53', '814-415', '1'),
(416, '815', 'Locations', '', '1', '', '{\"Name\":\"815\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:32:18', '815-416', '1'),
(417, '901', 'Locations', '', '1', '', '{\"Name\":\"901\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:41:36', '901-417', '1'),
(418, '902', 'Locations', '', '1', '', '{\"Name\":\"902\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:42:15', '902-418', '1'),
(419, '903', 'Locations', '', '1', '', '{\"Name\":\"903\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:42:29', '903-419', '1'),
(420, '904', 'Locations', '', '1', '', '{\"Name\":\"904\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:42:45', '904-420', '1'),
(421, '905', 'Locations', '', '1', '', '{\"Name\":\"905\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:42:59', '905-421', '1'),
(422, '906', 'Locations', '', '1', '', '{\"Name\":\"906\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:43:10', '906-422', '1'),
(423, '907', 'Locations', '', '1', '', '{\"Name\":\"907\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:43:22', '907-423', '1'),
(424, '908', 'Locations', '', '1', '', '{\"Name\":\"908\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:43:40', '908-424', '1'),
(425, '909', 'Locations', '', '1', '', '{\"Name\":\"909\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:43:54', '909-425', '1'),
(426, '910', 'Locations', '', '1', '', '{\"Name\":\"910\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:44:07', '910-426', '1'),
(427, '911', 'Locations', '', '1', '', '{\"Name\":\"911\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:44:20', '911-427', '1'),
(428, '912', 'Locations', '', '1', '', '{\"Name\":\"912\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:44:34', '912-428', '1'),
(429, '913', 'Locations', '', '1', '', '{\"Name\":\"913\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:44:54', '913-429', '1'),
(430, '914', 'Locations', '', '1', '', '{\"Name\":\"914\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:45:36', '914-430', '1'),
(431, '914', 'Locations', '', '1', '', '{\"Name\":\"914\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:45:36', '914-431', '1'),
(432, '915', 'Locations', '', '1', '', '{\"Name\":\"915\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:45:57', '915-432', '1'),
(433, '1001', 'Locations', '', '1', '', '{\"Name\":\"1001\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:45:57', '915-433', '1'),
(434, '1002', 'Locations', '', '1', '', '{\"Name\":\"1002\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:47:06', '1002-434', '1'),
(435, '1003', 'Locations', '', '1', '', '{\"Name\":\"1003\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:47:40', '1003-435', '1');
INSERT INTO `other_info` (`Id`, `Name`, `ItemType`, `ImageUrl`, `ParentId`, `Notes`, `ItemValue`, `Status`, `Decription`, `Rules`, `ItemCode`, `CreateDate`, `Slug`, `OwnerId`) VALUES
(436, '1004', 'Locations', '', '1', '', '{\"Name\":\"1004\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:47:59', '1004-436', '1'),
(437, '1005', 'Locations', '', '1', '', '{\"Name\":\"1005\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:47:59', '1004-437', '1'),
(438, '1006', 'Locations', '', '1', '', '{\"Name\":\"1006\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:48:26', '1005-438', '1'),
(439, '1007', 'Locations', '', '1', '', '{\"Name\":\"1007\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:48:26', '1005-439', '1'),
(440, '1008', 'Locations', '', '1', '', '{\"Name\":\"1008\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:48:26', '1005-440', '1'),
(441, '1005', 'Locations', '', '1', '', '{\"Name\":\"1005\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:48:26', '1005-441', '1'),
(442, '1005', 'Locations', '', '1', '', '{\"Name\":\"1005\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:48:26', '1005-442', '1'),
(443, '1006', 'Locations', '', '1', '', '{\"Name\":\"1006\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:48:45', '1006-443', '1'),
(444, '1007', 'Locations', '', '1', '', '{\"Name\":\"1007\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:48:45', '1006-444', '1'),
(445, '1008', 'Locations', '', '1', '', '{\"Name\":\"1008\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:49:01', '1007-445', '1'),
(446, '1009', 'Locations', '', '1', '', '{\"Name\":\"1009\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:49:23', '1008-446', '1'),
(447, '1010', 'Locations', '', '1', '', '{\"Name\":\"1010\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:49:23', '1008-447', '1'),
(448, '1011', 'Locations', '', '1', '', '{\"Name\":\"1011\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:49:23', '1008-448', '1'),
(449, '1012', 'Locations', '', '1', '', '{\"Name\":\"1012\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:49:23', '1008-449', '1'),
(450, '1013', 'Locations', '', '1', '', '{\"Name\":\"1013\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:49:23', '1008-450', '1'),
(451, '1014', 'Locations', '', '1', '', '{\"Name\":\"1014\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:49:45', '1009-451', '1'),
(452, '1015', 'Locations', '', '1', '', '{\"Name\":\"1015\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:50:03', '1010-452', '1'),
(453, '1101', 'Locations', '', '1', '', '{\"Name\":\"1101\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:50:03', '1010-453', '1'),
(454, '1102', 'Locations', '', '1', '', '{\"Name\":\"1102\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:50:27', '1011-454', '1'),
(455, '1103', 'Locations', '', '1', '', '{\"Name\":\"1103\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:50:27', '1011-455', '1'),
(456, '1104', 'Locations', '', '1', '', '{\"Name\":\"1104\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:50:42', '1012-456', '1'),
(457, '1105', 'Locations', '', '1', '', '{\"Name\":\"1105\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:51:03', '1013-457', '1'),
(458, '1106', 'Locations', '', '1', '', '{\"Name\":\"1106\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:51:36', '1014-458', '1'),
(459, '1107', 'Locations', '', '1', '', '{\"Name\":\"1107\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:51:36', '1014-459', '1'),
(460, '1108', 'Locations', '', '1', '', '{\"Name\":\"1108\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:51:36', '1014-460', '1'),
(461, '1109', 'Locations', '', '1', '', '{\"Name\":\"1109\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:51:36', '1014-461', '1'),
(462, '1110', 'Locations', '', '1', '', '{\"Name\":\"1110\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 16:51:36', '1014-462', '1'),
(463, '1111', 'Locations', '', '1', '', '{\"Name\":\"1111\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 17:06:55', '1111-463', '1'),
(464, '1112', 'Locations', '', '1', '', '{\"Name\":\"1112\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 17:07:18', '1112-464', '1'),
(465, '1113', 'Locations', '', '1', '', '{\"Name\":\"1113\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 17:07:41', '1113-465', '1'),
(466, '1114', 'Locations', '', '1', '', '{\"Name\":\"1114\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 17:08:02', '1114-466', '1'),
(467, '1115', 'Locations', '', '1', '', '{\"Name\":\"1115\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 17:08:33', '1115-467', '1'),
(468, '1201', 'Locations', '', '1', '', '{\"Name\":\"1201\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 17:09:22', '1201-468', '1'),
(469, '1202', 'Locations', '', '1', '', '{\"Name\":\"1202\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 17:09:38', '1202-469', '1'),
(470, '1203', 'Locations', '', '1', '', '{\"Name\":\"1203\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 17:10:04', '1203-470', '1'),
(471, '1204', 'Locations', '', '1', '', '{\"Name\":\"1204\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 17:10:19', '1204-471', '1'),
(472, '1205', 'Locations', '', '1', '', '{\"Name\":\"1205\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-22 17:10:37', '1205-472', '1'),
(473, '1206', 'Locations', '', '1', '', '{\"Name\":\"1206\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 08:26:21', '1206-473', '1'),
(474, '1207', 'Locations', '', '1', '', '{\"Name\":\"1207\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 08:26:41', '1207-474', '1'),
(475, '1208', 'Locations', '', '1', '', '{\"Name\":\"1208\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 08:27:08', '1208-475', '1'),
(476, '1209', 'Locations', '', '1', '', '{\"Name\":\"1209\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 08:27:33', '1209-476', '1'),
(477, '1210', 'Locations', '', '1', '', '{\"Name\":\"1210\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 08:28:09', '1210-477', '1'),
(478, '1211', 'Locations', '', '1', '', '{\"Name\":\"1211\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 08:28:52', '1211-478', '1'),
(479, '1212', 'Locations', '', '1', '', '{\"Name\":\"1212\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 08:29:37', '1212-479', '1'),
(480, '1213', 'Locations', '', '1', '', '{\"Name\":\"1213\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 08:30:25', '1213-480', '1'),
(481, '1214', 'Locations', '', '1', '', '{\"Name\":\"1214\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 08:31:27', '1214-481', '1'),
(482, '1215', 'Locations', '', '1', '', '{\"Name\":\"1215\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 08:36:56', '1215-482', '1'),
(483, '1402', 'Locations', '', '1', '', '{\"Name\":\"1402\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:08:21', '1402-483', '1'),
(484, '1403', 'Locations', '', '1', '', '{\"Name\":\"1403\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:08:35', '1403-484', '1'),
(485, '1404', 'Locations', '', '1', '', '{\"Name\":\"1404\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:08:51', '1404-485', '1'),
(486, '1405', 'Locations', '', '1', '', '{\"Name\":\"1405\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:09:06', '1405-486', '1'),
(487, '1406', 'Locations', '', '1', '', '{\"Name\":\"1406\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:09:21', '1406-487', '1'),
(488, '1407', 'Locations', '', '1', '', '{\"Name\":\"1407\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:09:36', '1407-488', '1'),
(489, '1408', 'Locations', '', '1', '', '{\"Name\":\"1408\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:09:47', '1408-489', '1'),
(490, '1411', 'Locations', '', '1', '', '{\"Name\":\"1411\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:10:04', '1411-490', '1'),
(491, '1412', 'Locations', '', '1', '', '{\"Name\":\"1412\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:10:19', '1412-491', '1'),
(492, '1413', 'Locations', '', '1', '', '{\"Name\":\"1413\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:10:35', '1413-492', '1'),
(493, '1414', 'Locations', '', '1', '', '{\"Name\":\"1414\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:10:51', '1414-493', '1'),
(494, '1415', 'Locations', '', '1', '', '{\"Name\":\"1415\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:11:06', '1415-494', '1'),
(495, '1501', 'Locations', '', '1', '', '{\"Name\":\"1501\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:14:40', '1501-495', '1'),
(496, '1502', 'Locations', '', '1', '', '{\"Name\":\"1502\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:14:58', '1502-496', '1'),
(497, '1504', 'Locations', '', '1', '', '{\"Name\":\"1504\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:15:19', '1504-497', '1'),
(498, '1505', 'Locations', '', '1', '', '{\"Name\":\"1505\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:15:36', '1505-498', '1'),
(499, '1507', 'Locations', '', '1', '', '{\"Name\":\"1507\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:16:02', '1507-499', '1'),
(500, '1508', 'Locations', '', '1', '', '{\"Name\":\"1508\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:16:19', '1508-500', '1'),
(501, '1509', 'Locations', '', '1', '', '{\"Name\":\"1509\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:16:39', '1509-501', '1'),
(502, '1510', 'Locations', '', '1', '', '{\"Name\":\"1510\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:16:54', '1510-502', '1'),
(503, '1511', 'Locations', '', '1', '', '{\"Name\":\"1511\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:17:11', '1511-503', '1'),
(504, '1512', 'Locations', '', '1', '', '{\"Name\":\"1512\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:17:28', '1512-504', '1'),
(505, '1514', 'Locations', '', '1', '', '{\"Name\":\"1514\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:17:44', '1514-505', '1'),
(506, '1602', 'Locations', '', '1', '', '{\"Name\":\"1602\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:17:58', '1602-506', '1'),
(507, '1603', 'Locations', '', '1', '', '{\"Name\":\"1603\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:18:14', '1603-507', '1'),
(508, '1604', 'Locations', '', '1', '', '{\"Name\":\"1604\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:18:29', '1604-508', '1'),
(509, '1605', 'Locations', '', '1', '', '{\"Name\":\"1605\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:18:43', '1605-509', '1'),
(510, '1606', 'Locations', '', '1', '', '{\"Name\":\"1606\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:18:59', '1606-510', '1'),
(511, '1607', 'Locations', '', '1', '', '{\"Name\":\"1607\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:19:13', '1607-511', '1'),
(512, '1609', 'Locations', '', '1', '', '{\"Name\":\"1609\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:19:36', '1609-512', '1'),
(513, '1610', 'Locations', '', '1', '', '{\"Name\":\"1610\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:20:08', '1610-513', '1'),
(514, '1611', 'Locations', '', '1', '', '{\"Name\":\"1611\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:20:26', '1611-514', '1'),
(515, '1612', 'Locations', '', '1', '', '{\"Name\":\"1612\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:20:44', '1612-515', '1'),
(516, '1613', 'Locations', '', '1', '', '{\"Name\":\"1613\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:21:01', '1613-516', '1'),
(517, '1615', 'Locations', '', '1', '', '{\"Name\":\"1615\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:21:19', '1615-517', '1'),
(518, '1701', 'Locations', '', '1', '', '{\"Name\":\"1701\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"17\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:21:34', '1701-518', '1'),
(519, '1702', 'Locations', '', '1', '', '{\"Name\":\"1702\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"17\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:21:53', '1702-519', '1'),
(520, '1704', 'Locations', '', '1', '', '{\"Name\":\"1704\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"17\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:22:14', '1704-520', '1'),
(521, '1705', 'Locations', '', '1', '', '{\"Name\":\"1705\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"17\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:22:34', '1705-521', '1'),
(522, '1707', 'Locations', '', '1', '', '{\"Name\":\"1707\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"17\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:22:52', '1707-522', '1'),
(523, '1708', 'Locations', '', '1', '', '{\"Name\":\"1708\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"17\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:23:07', '1708-523', '1'),
(524, '1711', 'Locations', '', '1', '', '{\"Name\":\"1711\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"17\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:23:21', '1711-524', '1'),
(525, '1712', 'Locations', '', '1', '', '{\"Name\":\"1712\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"17\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:23:34', '1712-525', '1'),
(526, '1714', 'Locations', '', '1', '', '{\"Name\":\"1714\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"17\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:23:49', '1714-526', '1'),
(527, '1801', 'Locations', '', '1', '', '{\"Name\":\"1801\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"18\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:26:03', '1801-527', '1'),
(528, '1802', 'Locations', '', '1', '', '{\"Name\":\"1802\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"18\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:26:30', '1802-528', '1'),
(529, '1805', 'Locations', '', '1', '', '{\"Name\":\"1805\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"18\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:27:01', '1805-529', '1'),
(530, '1808', 'Locations', '', '1', '', '{\"Name\":\"1808\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"18\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:27:20', '1808-530', '1'),
(531, '1809', 'Locations', '', '1', '', '{\"Name\":\"1809\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"18\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:27:36', '1809-531', '1'),
(532, '1811', 'Locations', '', '1', '', '{\"Name\":\"1811\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"18\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:27:53', '1811-532', '1'),
(533, '1812', 'Locations', '', '1', '', '{\"Name\":\"1812\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"18\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:28:17', '1812-533', '1'),
(534, '1813', 'Locations', '', '1', '', '{\"Name\":\"1813\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"18\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:28:33', '1813-534', '1'),
(535, '1814', 'Locations', '', '1', '', '{\"Name\":\"1814\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"18\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:28:49', '1814-535', '1'),
(536, '1815', 'Locations', '', '1', '', '{\"Name\":\"1815\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"18\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:29:06', '1815-536', '1'),
(537, '1902', 'Locations', '', '1', '', '{\"Name\":\"1902\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"19\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:29:23', '1902-537', '1'),
(538, '1903', 'Locations', '', '1', '', '{\"Name\":\"1903\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"19\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:29:39', '1903-538', '1'),
(539, '1904', 'Locations', '', '1', '', '{\"Name\":\"1904\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"19\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:30:01', '1904-539', '1'),
(540, '1906', 'Locations', '', '1', '', '{\"Name\":\"1906\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"19\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:30:19', '1906-540', '1'),
(541, '1907', 'Locations', '', '1', '', '{\"Name\":\"1907\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"19\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:30:34', '1907-541', '1'),
(542, '1908', 'Locations', '', '1', '', '{\"Name\":\"1908\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"19\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:30:49', '1908-542', '1'),
(543, '1909', 'Locations', '', '1', '', '{\"Name\":\"1909\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"19\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:31:06', '1909-543', '1'),
(544, '1910', 'Locations', '', '1', '', '{\"Name\":\"1910\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"19\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:31:23', '1910-544', '1'),
(545, '1911', 'Locations', '', '1', '', '{\"Name\":\"1911\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"19\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:31:42', '1911-545', '1'),
(546, '1915', 'Locations', '', '1', '', '{\"Name\":\"1915\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"19\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:32:01', '1915-546', '1'),
(547, '2002', 'Locations', '', '1', '', '{\"Name\":\"2002\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"20\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:32:20', '2002-547', '1'),
(548, '2003', 'Locations', '', '1', '', '{\"Name\":\"2003\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:33:55', '2003-548', '1'),
(549, '2004', 'Locations', '', '1', '', '{\"Name\":\"2004\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"20\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:35:05', '2004-549', '1'),
(550, '2005', 'Locations', '', '1', '', '{\"Name\":\"2005\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"20\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:36:43', '2005-550', '1'),
(551, '2006', 'Locations', '', '1', '', '{\"Name\":\"2006\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"20\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:37:00', '2006-551', '1'),
(552, '2007', 'Locations', '', '1', '', '{\"Name\":\"2007\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"20\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:38:02', '2007-552', '1'),
(553, '2009', 'Locations', '', '1', '', '{\"Name\":\"2009\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"20\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:39:18', '2009-553', '1'),
(554, '2012', 'Locations', '', '1', '', '{\"Name\":\"2012\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"20\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:39:47', '2012-554', '1'),
(555, '2013', 'Locations', '', '1', '', '{\"Name\":\"2013\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"20\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:40:06', '2013-555', '1'),
(556, '2014', 'Locations', '', '1', '', '{\"Name\":\"2014\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"20\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:40:23', '2014-556', '1'),
(557, '2101', 'Locations', '', '1', '', '{\"Name\":\"2101\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:45:51', '2101-557', '1'),
(558, '2102', 'Locations', '', '1', '', '{\"Name\":\"2102\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:46:05', '2102-558', '1'),
(559, '2103', 'Locations', '', '1', '', '{\"Name\":\"2103\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:46:21', '2103-559', '1'),
(560, '2104', 'Locations', '', '1', '', '{\"Name\":\"2104\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:46:35', '2104-560', '1'),
(561, '2105', 'Locations', '', '1', '', '{\"Name\":\"2105\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:46:55', '2105-561', '1'),
(562, '2106', 'Locations', '', '1', '', '{\"Name\":\"2106\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:47:12', '2106-562', '1'),
(563, '2107', 'Locations', '', '1', '', '{\"Name\":\"2107\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:47:30', '2107-563', '1'),
(564, '2108', 'Locations', '', '1', '', '{\"Name\":\"2108\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:47:45', '2108-564', '1'),
(565, '2109', 'Locations', '', '1', '', '{\"Name\":\"2109\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:48:02', '2109-565', '1'),
(566, '2110', 'Locations', '', '1', '', '{\"Name\":\"2110\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:48:30', '2110-566', '1'),
(567, '2111', 'Locations', '', '1', '', '{\"Name\":\"2111\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:48:44', '2111-567', '1'),
(568, '2112', 'Locations', '', '1', '', '{\"Name\":\"2112\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:49:00', '2112-568', '1'),
(569, '2114', 'Locations', '', '1', '', '{\"Name\":\"2114\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:49:17', '2114-569', '1'),
(570, '2203', 'Locations', '', '1', '', '{\"Name\":\"2203\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"22\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:49:35', '2203-570', '1'),
(571, '2204', 'Locations', '', '1', '', '{\"Name\":\"2204\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"22\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:49:52', '2204-571', '1'),
(572, '2205', 'Locations', '', '1', '', '{\"Name\":\"2205\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"22\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:50:19', '2205-572', '1'),
(573, '2206', 'Locations', '', '1', '', '{\"Name\":\"2206\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"22\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:51:02', '2206-573', '1'),
(574, '2210', 'Locations', '', '1', '', '{\"Name\":\"2210\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"22\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:51:26', '2210-574', '1'),
(575, '2211', 'Locations', '', '1', '', '{\"Name\":\"2211\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"22\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:51:59', '2211-575', '1'),
(576, '2213', 'Locations', '', '1', '', '{\"Name\":\"2213\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"22\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:52:17', '2213-576', '1'),
(577, '2302', 'Locations', '', '1', '', '{\"Name\":\"2302\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"23\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:52:32', '2302-577', '1'),
(578, '2303', 'Locations', '', '1', '', '{\"Name\":\"2303\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"23\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:52:48', '2303-578', '1'),
(579, '2305', 'Locations', '', '1', '', '{\"Name\":\"2305\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"23\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:53:05', '2305-579', '1'),
(580, '2306', 'Locations', '', '1', '', '{\"Name\":\"2306\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"23\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:53:24', '2306-580', '1'),
(581, '2308', 'Locations', '', '1', '', '{\"Name\":\"2308\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"23\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:53:45', '2308-581', '1'),
(582, '2309', 'Locations', '', '1', '', '{\"Name\":\"2309\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"23\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:54:21', '2309-582', '1'),
(583, '2310', 'Locations', '', '1', '', '{\"Name\":\"2310\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"23\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:54:43', '2310-583', '1'),
(584, '2311', 'Locations', '', '1', '', '{\"Name\":\"2311\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"23\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:55:26', '2311-584', '1'),
(585, '2312', 'Locations', '', '1', '', '{\"Name\":\"2312\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"23\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:56:02', '2312-585', '1'),
(586, '2313', 'Locations', '', '1', '', '{\"Name\":\"2313\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"23\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:56:25', '2313-586', '1'),
(587, '2401', 'Locations', '', '1', '', '{\"Name\":\"2401\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:56:44', '2401-587', '1'),
(588, '2402', 'Locations', '', '1', '', '{\"Name\":\"2402\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:57:02', '2402-588', '1'),
(589, '2403', 'Locations', '', '1', '', '{\"Name\":\"2403\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:57:22', '2403-589', '1'),
(590, '2404', 'Locations', '', '1', '', '{\"Name\":\"2404\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:57:35', '2404-590', '1'),
(591, '2405', 'Locations', '', '1', '', '{\"Name\":\"2405\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:58:03', '2405-591', '1'),
(592, '2406', 'Locations', '', '1', '', '{\"Name\":\"2406\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:58:34', '2406-592', '1'),
(593, '2407', 'Locations', '', '1', '', '{\"Name\":\"2407\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:58:54', '2407-593', '1'),
(594, '2408', 'Locations', '', '1', '', '{\"Name\":\"2408\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:59:20', '2408-594', '1'),
(595, '2409', 'Locations', '', '1', '', '{\"Name\":\"2409\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 12:59:49', '2409-595', '1'),
(596, '2410', 'Locations', '', '1', '', '{\"Name\":\"2410\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:00:10', '2410-596', '1'),
(597, '2412', 'Locations', '', '1', '', '{\"Name\":\"2412\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:00:26', '2412-597', '1'),
(598, '2413', 'Locations', '', '1', '', '{\"Name\":\"2413\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:00:51', '2413-598', '1'),
(599, '2414', 'Locations', '', '1', '', '{\"Name\":\"2414\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:01:06', '2414-599', '1'),
(600, '2505', 'Locations', '', '1', '', '{\"Name\":\"2505\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"25\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:07:34', '2505-600', '1'),
(601, '2508', 'Locations', '', '1', '', '{\"Name\":\"2508\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"25\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:07:54', '2508-601', '1'),
(602, '2509', 'Locations', '', '1', '', '{\"Name\":\"2509\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:08:07', '2509-602', '1'),
(603, '2510', 'Locations', '', '1', '', '{\"Name\":\"2510\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"25\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:08:21', '2510-603', '1'),
(604, '2511', 'Locations', '', '1', '', '{\"Name\":\"2511\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"25\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:08:44', '2511-604', '1'),
(605, '2512', 'Locations', '', '1', '', '{\"Name\":\"2512\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"25\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:09:00', '2512-605', '1'),
(606, '2513', 'Locations', '', '1', '', '{\"Name\":\"2513\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"25\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:09:21', '2513-606', '1'),
(607, '2515', 'Locations', '', '1', '', '{\"Name\":\"2515\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"25\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:09:42', '2515-607', '1'),
(608, '2601', 'Locations', '', '1', '', '{\"Name\":\"2601\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:10:15', '2601-608', '1'),
(609, '2602', 'Locations', '', '1', '', '{\"Name\":\"2602\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:10:27', '2602-609', '1'),
(610, '2603', 'Locations', '', '1', '', '{\"Name\":\"2603\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:10:39', '2603-610', '1'),
(611, '2604', 'Locations', '', '1', '', '{\"Name\":\"2604\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:10:55', '2604-611', '1'),
(612, '2605', 'Locations', '', '1', '', '{\"Name\":\"2605\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:11:10', '2605-612', '1'),
(613, '2606', 'Locations', '', '1', '', '{\"Name\":\"2606\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:11:24', '2606-613', '1'),
(614, '2607', 'Locations', '', '1', '', '{\"Name\":\"2607\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:11:38', '2607-614', '1'),
(615, '2608', 'Locations', '', '1', '', '{\"Name\":\"2608\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:11:55', '2608-615', '1'),
(616, '2609', 'Locations', '', '1', '', '{\"Name\":\"2609\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:12:11', '2609-616', '1'),
(617, '2610', 'Locations', '', '1', '', '{\"Name\":\"2610\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:12:28', '2610-617', '1'),
(618, '2611', 'Locations', '', '1', '', '{\"Name\":\"2611\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:12:43', '2611-618', '1'),
(619, '2612', 'Locations', '', '1', '', '{\"Name\":\"2612\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:13:03', '2612-619', '1'),
(620, '2613', 'Locations', '', '1', '', '{\"Name\":\"2613\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:13:36', '2613-620', '1'),
(621, '2614', 'Locations', '', '1', '', '{\"Name\":\"2614\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:14:00', '2614-621', '1'),
(622, '2615', 'Locations', '', '1', '', '{\"Name\":\"2615\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:14:56', '2615-622', '1'),
(623, '2701', 'Locations', '', '1', '', '{\"Name\":\"2701\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:15:28', '2701-623', '1'),
(624, '2702', 'Locations', '', '1', '', '{\"Name\":\"2702\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:15:47', '2702-624', '1'),
(625, '2703', 'Locations', '', '1', '', '{\"Name\":\"2703\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:16:11', '2703-625', '1'),
(626, '2704', 'Locations', '', '1', '', '{\"Name\":\"2704\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:16:29', '2704-626', '1'),
(627, '2705', 'Locations', '', '1', '', '{\"Name\":\"2705\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:16:44', '2705-627', '1'),
(628, '2706', 'Locations', '', '1', '', '{\"Name\":\"2706\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:17:12', '2706-628', '1'),
(629, '2707', 'Locations', '', '1', '', '{\"Name\":\"2707\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:17:32', '2707-629', '1'),
(630, '2708', 'Locations', '', '1', '', '{\"Name\":\"2708\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:17:47', '2708-630', '1'),
(631, '2709', 'Locations', '', '1', '', '{\"Name\":\"2709\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:18:01', '2709-631', '1'),
(632, '2710', 'Locations', '', '1', '', '{\"Name\":\"2710\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:18:20', '2710-632', '1'),
(633, '2711', 'Locations', '', '1', '', '{\"Name\":\"2711\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:19:00', '2711-633', '1'),
(634, '2712', 'Locations', '', '1', '', '{\"Name\":\"2712\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:19:34', '2712-634', '1'),
(635, '2713', 'Locations', '', '1', '', '{\"Name\":\"2713\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:20:00', '2713-635', '1');
INSERT INTO `other_info` (`Id`, `Name`, `ItemType`, `ImageUrl`, `ParentId`, `Notes`, `ItemValue`, `Status`, `Decription`, `Rules`, `ItemCode`, `CreateDate`, `Slug`, `OwnerId`) VALUES
(636, '2714', 'Locations', '', '1', '', '{\"Name\":\"2714\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:20:55', '2714-636', '1'),
(637, '2715', 'Locations', '', '1', '', '{\"Name\":\"2715\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:21:12', '2715-637', '1'),
(638, '2801', 'Locations', '', '1', '', '{\"Name\":\"2801\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:28:36', '2801-638', '1'),
(639, '2802', 'Locations', '', '1', '', '{\"Name\":\"2802\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:36:01', '2802-639', '1'),
(640, '2803', 'Locations', '', '1', '', '{\"Name\":\"2803\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-23 13:40:05', '2803-640', '1'),
(641, '2804', 'Locations', '', '1', '', '{\"Name\":\"2804\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:11:32', '2804-641', '1'),
(642, '2805', 'Locations', '', '1', '', '{\"Name\":\"2805\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:12:02', '2805-642', '1'),
(643, '2806', 'Locations', '', '1', '', '{\"Name\":\"2806\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:12:25', '2806-643', '1'),
(644, '2807', 'Locations', '', '1', '', '{\"Name\":\"2807\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:13:15', '2807-644', '1'),
(645, '2808', 'Locations', '', '1', '', '{\"Name\":\"2808\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:13:38', '2808-645', '1'),
(646, '2809', 'Locations', '', '1', '', '{\"Name\":\"2809\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:14:11', '2809-646', '1'),
(647, '2810', 'Locations', '', '1', '', '{\"Name\":\"2810\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:14:33', '2810-647', '1'),
(648, '2811', 'Locations', '', '1', '', '{\"Name\":\"2811\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:14:48', '2811-648', '1'),
(649, '2812', 'Locations', '', '1', '', '{\"Name\":\"2812\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:15:11', '2812-649', '1'),
(650, '2813', 'Locations', '', '1', '', '{\"Name\":\"2813\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:15:32', '2813-650', '1'),
(651, '2814', 'Locations', '', '1', '', '{\"Name\":\"2814\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:15:51', '2814-651', '1'),
(652, '2815', 'Locations', '', '1', '', '{\"Name\":\"2815\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:16:11', '2815-652', '1'),
(653, '2901', 'Locations', '', '1', '', '{\"Name\":\"2901\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:16:26', '2901-653', '1'),
(654, '2902', 'Locations', '', '1', '', '{\"Name\":\"2902\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:16:48', '2902-654', '1'),
(655, '2903', 'Locations', '', '1', '', '{\"Name\":\"2903\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:17:08', '2903-655', '1'),
(656, '2904', 'Locations', '', '1', '', '{\"Name\":\"2904\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:17:25', '2904-656', '1'),
(657, '2905', 'Locations', '', '1', '', '{\"Name\":\"2905\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:17:42', '2905-657', '1'),
(658, '2906', 'Locations', '', '1', '', '{\"Name\":\"2906\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:17:56', '2906-658', '1'),
(659, '2907', 'Locations', '', '1', '', '{\"Name\":\"2907\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:18:21', '2907-659', '1'),
(660, '2908', 'Locations', '', '1', '', '{\"Name\":\"2908\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:18:37', '2908-660', '1'),
(661, '2909', 'Locations', '', '1', '', '{\"Name\":\"2909\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:18:57', '2909-661', '1'),
(662, '2910', 'Locations', '', '1', '', '{\"Name\":\"2910\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:19:18', '2910-662', '1'),
(663, '2911', 'Locations', '', '1', '', '{\"Name\":\"2911\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:19:52', '2911-663', '1'),
(664, '2912', 'Locations', '', '1', '', '{\"Name\":\"2912\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:20:10', '2912-664', '1'),
(665, '2913', 'Locations', '', '1', '', '{\"Name\":\"2913\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:20:24', '2913-665', '1'),
(666, '2914', 'Locations', '', '1', '', '{\"Name\":\"2914\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:20:39', '2914-666', '1'),
(667, '2915', 'Locations', '', '1', '', '{\"Name\":\"2915\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 12:20:52', '2915-667', '1'),
(668, '3001', 'Locations', '', '1', '', '{\"Name\":\"3001\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:48:13', '3001-668', '1'),
(669, '3002', 'Locations', '', '1', '', '{\"Name\":\"3002\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:48:30', '3002-669', '1'),
(670, '3003', 'Locations', '', '1', '', '{\"Name\":\"3003\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:48:49', '3003-670', '1'),
(671, '3004', 'Locations', '', '1', '', '{\"Name\":\"3004\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:49:19', '3004-671', '1'),
(672, '3005', 'Locations', '', '1', '', '{\"Name\":\"3005\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:49:44', '3005-672', '1'),
(673, '3006', 'Locations', '', '1', '', '{\"Name\":\"3006\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:55:21', '3006-673', '1'),
(674, '3007', 'Locations', '', '1', '', '{\"Name\":\"3007\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:55:43', '3007-674', '1'),
(675, '3008', 'Locations', '', '1', '', '{\"Name\":\"3008\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:56:07', '3008-675', '1'),
(676, '3009', 'Locations', '', '1', '', '{\"Name\":\"3009\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:56:43', '3009-676', '1'),
(677, '3010', 'Locations', '', '1', '', '{\"Name\":\"3010\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:57:00', '3010-677', '1'),
(678, '3011', 'Locations', '', '1', '', '{\"Name\":\"3011\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:57:17', '3011-678', '1'),
(679, '3012', 'Locations', '', '1', '', '{\"Name\":\"3012\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:57:39', '3012-679', '1'),
(680, '3013', 'Locations', '', '1', '', '{\"Name\":\"3013\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:58:21', '3013-680', '1'),
(681, '3014', 'Locations', '', '1', '', '{\"Name\":\"3014\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:59:04', '3014-681', '1'),
(682, '3015', 'Locations', '', '1', '', '{\"Name\":\"3015\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:59:25', '3015-682', '1'),
(683, '3101', 'Locations', '', '1', '', '{\"Name\":\"3101\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"31\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 13:59:58', '3101-683', '1'),
(684, '3102', 'Locations', '', '1', '', '{\"Name\":\"3102\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"31\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 14:00:31', '3102-684', '1'),
(685, '3103', 'Locations', '', '1', '', '{\"Name\":\"3103\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"31\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 14:00:46', '3103-685', '1'),
(686, '3104', 'Locations', '', '1', '', '{\"Name\":\"3104\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"31\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 14:01:04', '3104-686', '1'),
(687, '3105', 'Locations', '', '1', '', '{\"Name\":\"3105\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"31\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 14:01:21', '3105-687', '1'),
(688, '3106', 'Locations', '', '1', '', '{\"Name\":\"3106\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"31\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 14:01:47', '3106-688', '1'),
(689, '3107', 'Locations', '', '1', '', '{\"Name\":\"3107\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"31\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 14:02:08', '3107-689', '1'),
(690, '3108', 'Locations', '', '1', '', '{\"Name\":\"3108\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"31\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 14:02:27', '3108-690', '1'),
(691, '3109', 'Locations', '', '1', '', '{\"Name\":\"3109\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"31\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 14:02:54', '3109-691', '1'),
(692, '3110', 'Locations', '', '1', '', '{\"Name\":\"3110\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"31\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-05-26 14:03:12', '3110-692', '1'),
(693, '1st Floor ', 'Locations', '', '1', '', '{\"Name\":\"1st Floor \",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"1\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:52:47', '1st-floor--693', '1'),
(694, '2nd floor', 'Locations', '', '1', '', '{\"Name\":\"2nd floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"2\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:53:21', '2nd-floor-694', '1'),
(695, '3rd floor', 'Locations', '', '1', '', '{\"Name\":\"3rd floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"3\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:53:52', '3rd-floor-695', '1'),
(696, '4th floor', 'Locations', '', '1', '', '{\"Name\":\"4th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"4\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:54:18', '4th-floor-696', '1'),
(697, '5th floor', 'Locations', '', '1', '', '{\"Name\":\"5th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"5\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:54:33', '5th-floor-697', '1'),
(698, '6th floor', 'Locations', '', '1', '', '{\"Name\":\"6th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"6\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:54:52', '6th-floor-698', '1'),
(699, '7th floor', 'Locations', '', '1', '', '{\"Name\":\"7th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"7\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:55:29', '7th-floor-699', '1'),
(700, '8th floor', 'Locations', '', '1', '', '{\"Name\":\"8th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"8\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:55:58', '8th-floor-700', '1'),
(701, '9th floor', 'Locations', '', '1', '', '{\"Name\":\"9th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"9\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:56:22', '9th-floor-701', '1'),
(702, '10th floor', 'Locations', '', '1', '', '{\"Name\":\"10th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"10\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:56:36', '10th-floor-702', '1'),
(703, '11th floor', 'Locations', '', '1', '', '{\"Name\":\"11th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"11\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:56:55', '11th-floor-703', '1'),
(704, '12th floor', 'Locations', '', '1', '', '{\"Name\":\"12th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"12\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:57:19', '12th-floor-704', '1'),
(705, '13th floor', 'Locations', '', '1', '', '{\"Name\":\"13th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"13\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:58:05', '13th-floor-705', '1'),
(706, '14th floor', 'Locations', '', '1', '', '{\"Name\":\"14th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"14\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:58:21', '14th-floor-706', '1'),
(707, '15th floor', 'Locations', '', '1', '', '{\"Name\":\"15th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"15\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:58:38', '15th-floor-707', '1'),
(708, '16th floor', 'Locations', '', '1', '', '{\"Name\":\"16th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"16\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:59:20', '16th-floor-708', '1'),
(709, '17th floor', 'Locations', '', '1', '', '{\"Name\":\"17th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"17\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 15:59:53', '17th-floor-709', '1'),
(710, '18th floor', 'Locations', '', '1', '', '{\"Name\":\"18th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"18\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:00:06', '18th-floor-710', '1'),
(711, '19th floor', 'Locations', '', '1', '', '{\"Name\":\"19th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"19\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:00:20', '19th-floor-711', '1'),
(712, '20th floor', 'Locations', '', '1', '', '{\"Name\":\"20th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"20\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:00:52', '20th-floor-712', '1'),
(713, '21st floor', 'Locations', '', '1', '', '{\"Name\":\"21st floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"21\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:01:05', '21-713', '1'),
(714, '22nd floor', 'Locations', '', '1', '', '{\"Name\":\"22nd floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"22\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:01:25', '22nd-floor-714', '1'),
(715, '23rd floor', 'Locations', '', '1', '', '{\"Name\":\"23rd floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"23\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:01:40', '23rd-floor-715', '1'),
(716, '24th floor', 'Locations', '', '1', '', '{\"Name\":\"24th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"24\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:02:04', '24th-floor-716', '1'),
(717, '25th floor', 'Locations', '', '1', '', '{\"Name\":\"25th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"25\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:02:21', '25th-floor-717', '1'),
(718, '26th floor ', 'Locations', '', '1', '', '{\"Name\":\"26th floor \",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"26\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:02:41', '26th-floor--718', '1'),
(719, '27th floor', 'Locations', '', '1', '', '{\"Name\":\"27th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"27\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:02:57', '27th-floor-719', '1'),
(720, '28th floor', 'Locations', '', '1', '', '{\"Name\":\"28th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"28\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:03:12', '28th-floor-720', '1'),
(721, '29th floor', 'Locations', '', '1', '', '{\"Name\":\"29th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"29\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:03:33', '29th-floor-721', '1'),
(722, '30th floor', 'Locations', '', '1', '', '{\"Name\":\"30th floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"30\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:03:58', '30th-floor-722', '1'),
(723, '31st floor', 'Locations', '', '1', '', '{\"Name\":\"31st floor\",\"Slug\":\"\",\"AddressLine1\":\"\",\"AddressLine2\":\"\",\"Type\":\"36\",\"Floor\":\"31\",\"RoomNo\":\"\",\"IsSite\":\"No\"}', 'Active', '', '', '', '2025-06-02 16:05:35', '31st-floor-723', '1');

-- --------------------------------------------------------

--
-- Table structure for table `reasons`
--

CREATE TABLE `reasons` (
  `id` int NOT NULL,
  `tenant_id` int NOT NULL,
  `reason_type` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `sort_order` int NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `metadata` json DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reasons`
--

INSERT INTO `reasons` (`id`, `tenant_id`, `reason_type`, `name`, `description`, `sort_order`, `active`, `metadata`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'stock_management', 'Replacement (Broken)', NULL, 10, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(2, 1, 'stock_management', 'Replacement (Damaged)', NULL, 20, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(3, 1, 'stock_management', 'Replacement (Stolen)', NULL, 30, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(4, 1, 'stock_management', 'New Allocation', NULL, 40, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(5, 1, 'stock_management', 'Reversal of duplication', NULL, 50, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(6, 1, 'stock_management', 'Reversal of stock adjustment', NULL, 60, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(7, 1, 'stock_management', 'Reversal of stock take', NULL, 70, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(8, 1, 'stock_management', 'Reversal due to error', NULL, 80, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(9, 1, 'stock_management', 'Other', 'Generic catch-all', 999, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(10, 1, 'asset_movement', 'Initial room assignment', NULL, 10, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(11, 1, 'asset_movement', 'Room change', NULL, 20, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(12, 1, 'asset_movement', 'Relocation (same building)', NULL, 30, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(13, 1, 'asset_movement', 'Relocation (different site)', NULL, 40, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(14, 1, 'asset_movement', 'Move to storage', 'Temporarily stored', 50, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(15, 1, 'asset_movement', 'Sent to maintenance', 'Moved to maintenance bay/vendor', 60, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(16, 1, 'asset_movement', 'Maintenance complete', 'Returned to service', 70, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(17, 1, 'asset_movement', 'Temporary relocation (event)', 'Short-term move for an event', 80, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(18, 1, 'asset_movement', 'Loaned out', 'Issued to user/team temporarily', 90, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(19, 1, 'asset_movement', 'Loan returned', NULL, 100, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(20, 1, 'asset_movement', 'Swap with another item', 'Exchange between locations', 110, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(21, 1, 'asset_movement', 'Audit reconciliation move', 'Correcting audit variance', 120, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(22, 1, 'asset_movement', 'Correction: previous error', 'Fixing wrong location entry', 130, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(23, 1, 'asset_movement', 'Security relocation', 'Moved for safety/security reasons', 140, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22'),
(24, 1, 'asset_movement', 'Other', 'Generic catch-all', 999, 1, NULL, NULL, NULL, '2025-08-16 02:28:22', '2025-08-16 02:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `Requisition`
--

CREATE TABLE `Requisition` (
  `id` int NOT NULL,
  `requestNumber` varchar(50) NOT NULL,
  `site` varchar(255) NOT NULL,
  `requestedBy` varchar(50) NOT NULL,
  `type` enum('stock','purchase') NOT NULL,
  `status` enum('pending','approved','rejected','completed') DEFAULT 'pending',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdatedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approvedBy` varchar(50) DEFAULT NULL,
  `metadata` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Requisition`
--

INSERT INTO `Requisition` (`id`, `requestNumber`, `site`, `requestedBy`, `type`, `status`, `createdDate`, `lastUpdatedDate`, `approvedBy`, `metadata`) VALUES
(1, 'R0001', '38', 'Zayd', 'stock', 'approved', '2025-05-13 16:56:27', '2025-05-13 17:01:29', 'Manager', '{\"notes\": \"\"}'),
(2, 'R0002', '38', 'Zayd', 'purchase', 'approved', '2025-05-13 17:03:11', '2025-05-13 17:03:15', 'Manager', '{\"notes\": \"\"}'),
(3, 'R0003', '0', '', 'stock', 'pending', '2025-05-14 15:21:56', '2025-05-14 15:21:56', NULL, '{\"notes\": \"\"}'),
(4, 'R0004', '0', '', 'stock', 'pending', '2025-05-14 16:23:32', '2025-05-14 16:23:32', NULL, '{\"notes\": \"\"}'),
(5, 'R0005', '38', 'Zayd', 'stock', 'pending', '2025-05-16 09:28:16', '2025-05-16 09:28:16', NULL, '{\"notes\": \"\"}'),
(6, 'R0006', '94', 'Ndumiso', 'stock', 'approved', '2025-05-19 11:17:44', '2025-05-19 11:17:56', 'Manager', '{\"notes\": \"\"}'),
(7, 'R0007', '94', 'Ndumiso', 'purchase', 'approved', '2025-05-19 13:45:53', '2025-05-19 13:47:21', 'Manager', '{\"notes\": \"\"}'),
(8, 'R0008', '38', 'Zayd', 'stock', 'approved', '2025-05-19 14:14:16', '2025-05-19 14:15:45', 'Manager', '{\"notes\": \"\"}'),
(9, 'R0009', '38', 'Zayd', 'stock', 'approved', '2025-05-19 14:16:30', '2025-05-19 14:16:36', 'Manager', '{\"notes\": \"\"}'),
(10, 'R0010', '94', 'Zayd', 'stock', 'pending', '2025-05-19 14:18:35', '2025-05-19 14:18:35', NULL, '{\"notes\": \"\"}'),
(11, 'R0011', '94', 'Zayd', 'stock', 'approved', '2025-05-19 14:18:35', '2025-05-19 14:18:52', 'Manager', '{\"notes\": \"\"}'),
(12, 'R0012', '94', 'Zayd', 'stock', 'approved', '2025-05-19 14:19:43', '2025-05-19 14:19:50', 'Manager', '{\"notes\": \"\"}'),
(13, 'R0013', '110', 'Zayd', 'stock', 'approved', '2025-05-19 14:22:14', '2025-05-19 14:22:25', 'Manager', '{\"notes\": \"\"}');

-- --------------------------------------------------------

--
-- Table structure for table `RequisitionItem`
--

CREATE TABLE `RequisitionItem` (
  `id` int NOT NULL,
  `requisitionId` int NOT NULL,
  `itemType` enum('asset','custom') NOT NULL,
  `assetId` int DEFAULT NULL,
  `description` text NOT NULL,
  `jobDetails` text,
  `quantity` int NOT NULL,
  `availability` enum('yes','no') DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `roomId` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `RequisitionItem`
--

INSERT INTO `RequisitionItem` (`id`, `requisitionId`, `itemType`, `assetId`, `description`, `jobDetails`, `quantity`, `availability`, `status`, `createdDate`, `roomId`) VALUES
(1, 1, 'asset', 2, '', '', 5, 'no', 'pending', '2025-05-13 16:56:27', 38),
(2, 1, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-13 16:56:27', 0),
(3, 1, 'asset', 2, '', '', 2, 'no', 'pending', '2025-05-13 16:56:27', 38),
(4, 2, 'asset', 2, '', '', 50, 'no', 'pending', '2025-05-13 17:03:11', 38),
(5, 3, 'asset', 228, '', '', 1, 'no', 'pending', '2025-05-14 15:21:56', 0),
(6, 4, 'asset', 228, '', '', 2, 'no', 'pending', '2025-05-14 16:23:32', 0),
(7, 5, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-16 09:28:16', 0),
(8, 6, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 11:17:44', 94),
(9, 7, 'asset', 3, '', '', 2, 'no', 'pending', '2025-05-19 13:45:53', 46),
(10, 8, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 14:14:16', 169),
(11, 8, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 14:14:16', 45),
(12, 9, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 14:16:30', 8),
(13, 10, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 14:18:35', 26),
(14, 10, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 14:18:35', 27),
(15, 10, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 14:18:35', 28),
(16, 11, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 14:18:35', 26),
(17, 11, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 14:18:35', 27),
(18, 11, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 14:18:35', 28),
(19, 12, 'asset', 2, '', '', 1, 'no', 'pending', '2025-05-19 14:19:43', 8),
(20, 12, 'asset', 1, '', '', 5, 'no', 'pending', '2025-05-19 14:19:43', 0),
(21, 13, 'asset', 1, '', '', 2, 'no', 'pending', '2025-05-19 14:22:14', 8),
(22, 13, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 14:22:14', 27),
(23, 13, 'asset', 1, '', '', 1, 'no', 'pending', '2025-05-19 14:22:14', 42);

-- --------------------------------------------------------

--
-- Table structure for table `RoleFeatures`
--

CREATE TABLE `RoleFeatures` (
  `roleId` int NOT NULL,
  `featureId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `RoleFeatures`
--

INSERT INTO `RoleFeatures` (`roleId`, `featureId`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(2, 7),
(2, 11),
(2, 12),
(2, 15),
(2, 16),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22);

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE `Roles` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Roles`
--

INSERT INTO `Roles` (`id`, `name`, `description`) VALUES
(1, 'Admin', 'Admin'),
(2, 'Capturer', 'Capturer'),
(3, 'Branch Manager', 'Branch Manager'),
(4, 'Audit', 'Audit');

-- --------------------------------------------------------

--
-- Table structure for table `StockItem`
--

CREATE TABLE `StockItem` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `categoryId` int DEFAULT NULL,
  `stockTypeId` int NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `slug` varchar(100) NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Active',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(50) DEFAULT NULL,
  `lastUpdatedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdatedBy` varchar(50) DEFAULT NULL,
  `stockInHand` int NOT NULL DEFAULT '10',
  `metadata` json NOT NULL,
  `size` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `StockItem`
--

INSERT INTO `StockItem` (`id`, `code`, `name`, `categoryId`, `stockTypeId`, `imageUrl`, `slug`, `status`, `createdDate`, `createdBy`, `lastUpdatedDate`, `lastUpdatedBy`, `stockInHand`, `metadata`, `size`) VALUES
(1, 'E001', 'GEYSER ELEMENTS', 1, 1, NULL, 'slug-1', 'active', '2025-05-12 10:45:38', 'import', '2025-07-26 13:48:45', NULL, 1, '{\"comment\": \"import\", \"minimumStockAlert\": 4}', ''),
(2, 'E002', 'GEYSER THERMOSTATS', 1, 1, NULL, 'slug-2', 'active', '2025-05-12 10:45:38', 'import', '2025-07-23 11:02:33', NULL, 0, '{\"comment\": \"import\"}', ''),
(3, 'E003', 'GEYSER GASKETS', 1, 1, NULL, 'slug-3', 'active', '2025-05-12 10:45:38', 'import', '2025-07-26 14:28:10', NULL, 17, '{\"comment\": \"import\"}', ''),
(4, 'E004', '45 AMPS STOVE ISOLATOR ', 1, 1, NULL, 'slug-4', 'active', '2025-05-12 10:45:38', 'import', '2025-07-14 12:53:38', NULL, 29, '{\"comment\": \"import\"}', '4X4'),
(5, 'E008', 'DOWNLIGHT HOLDER', 1, 1, NULL, 'slug-5', 'active', '2025-05-12 10:45:38', 'import', '2025-06-19 16:07:41', NULL, 32, '{\"comment\": \"import\"}', ''),
(6, 'E009', '2 LEVER LIGHT SWITCH - 4x2', 1, 1, NULL, 'slug-6', 'active', '2025-05-12 10:45:38', 'import', '2025-07-14 12:55:05', NULL, 7, '{\"comment\": \"import\"}', '4 X 4'),
(7, 'E010', 'BLANK COVER PVC WHITE - 4x4', 1, 1, NULL, 'slug-7', 'active', '2025-05-12 10:45:38', 'import', '2025-07-14 12:59:40', NULL, 0, '{\"comment\": \"import\"}', '4X2'),
(8, 'E011', 'BLANK COVER PVC WHITE - 4x2', 1, 1, NULL, 'slug-8', 'active', '2025-05-12 10:45:38', 'import', '2025-05-22 12:04:12', NULL, 3, '{\"comment\": \"import\"}', '4x4'),
(9, 'E012', 'DOUBLE PLUG POINT ', 1, 1, NULL, 'slug-9', 'active', '2025-05-12 10:45:38', 'import', '2025-06-19 14:03:03', NULL, 3, '{\"comment\": \"import\"}', '4X4'),
(10, 'E013', 'CIRCUIT BREAKER - 50AMPS', 1, 1, NULL, 'slug-10', 'active', '2025-05-12 10:45:38', 'import', '2025-06-10 15:54:53', NULL, 8, '{\"comment\": \"import\"}', '63 AMPS'),
(11, 'E014', 'CIRCUIT BREAKER - 32AMPS', 1, 1, NULL, 'slug-11', 'active', '2025-05-12 10:45:38', 'import', '2025-05-22 12:04:18', NULL, 1, '{\"comment\": \"import\"}', '10 AMPS'),
(12, 'E015', 'CURCUIT  BREAKER MAIN SWITCH - 63AMPS', 1, 1, NULL, 'slug-12', 'active', '2025-05-12 10:45:38', 'import', '2025-05-22 12:04:19', NULL, 4, '{\"comment\": \"import\"}', '50 AMPS'),
(13, 'E016', 'CIRCUIT BREAKER - 20AMPS', 1, 1, NULL, 'slug-13', 'active', '2025-05-12 10:45:38', 'import', '2025-05-22 12:04:20', NULL, 7, '{\"comment\": \"import\"}', '20 AMPS'),
(14, 'E018', 'EARTH LEAKAGE MCB', 1, 1, NULL, 'slug-14', 'active', '2025-05-12 10:45:38', 'import', '2025-07-14 13:01:35', NULL, 18, '{\"comment\": \"import\"}', '63 AMPS'),
(15, 'E019', 'COPPER BUSBAR', 1, 1, NULL, 'slug-15', 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(16, 'E020', '3 PHASE CIRCUIT BREAKER- SB2 RISERS', 1, 1, NULL, 'slug-16', 'active', '2025-05-12 10:45:38', 'import', '2025-05-22 12:04:24', NULL, 1, '{\"comment\": \"import\"}', '200 AMPS'),
(17, 'E022', 'STOVE CONNECTOR', 1, 1, NULL, 'slug-17', 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(18, 'E025', 'EXTENSION BOX  - 4x2', 1, 1, NULL, 'slug-18', 'active', '2025-05-12 10:45:38', 'import', '2025-06-09 16:23:11', NULL, 0, '{\"comment\": \"import\"}', '4X4'),
(19, 'E035', 'VING CARD READERS', 1, 1, NULL, 'slug-19', 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(20, 'E036', 'VING CARD BATTERY CASSETTES', 1, 1, NULL, 'slug-20', 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(21, 'E005', 'LEVER SWITCH 4x4 - SB1', 1, 2, NULL, 'slug-21', 'active', '2025-05-12 10:45:38', 'import', '2025-05-22 12:04:38', NULL, 11, '{\"comment\": \"import\"}', 'DOUBLE 4x2'),
(22, 'E006', 'LED DOWNLIGHTS ', 1, 2, NULL, 'slug-22', 'active', '2025-05-12 10:45:38', 'import', '2025-06-26 13:04:21', NULL, 0, '{\"comment\": \"import\"}', '5.5 WATTS'),
(23, 'E007', 'DOWN LIGHT FITTING', 1, 3, NULL, 'slug-23', 'active', '2025-05-12 10:45:38', 'import', '2025-05-22 12:04:43', NULL, 60, '{\"comment\": \"import\"}', ''),
(24, 'E023', 'e27 LIGHT FITTING', 1, 3, NULL, 'slug-24', 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(25, 'E017', 'INSULATION TAPE', 1, 4, NULL, 'slug-25', 'active', '2025-05-12 10:45:38', 'import', '2025-06-12 10:54:43', NULL, 2, '{\"comment\": \"import\"}', '20m'),
(26, 'E026', 'CABLE TIES', 1, 4, NULL, 'slug-26', 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', '305X4,7MM'),
(27, 'E027', 'SURFIX CABLE - 3 CORE FLAT - PER METER', 1, 4, NULL, 'slug-27', 'active', '2025-05-12 10:45:38', 'import', '2025-05-20 14:21:27', NULL, 0, '{\"comment\": \"import\"}', '2,5MM'),
(28, 'E028', 'SURFIX  CABLE - PER METER', 1, 4, NULL, 'slug-28', 'active', '2025-05-12 10:45:38', 'import', '2025-05-20 14:21:49', NULL, 0, '{\"comment\": \"import\"}', '1,5MM'),
(29, 'E029', 'CONDUIT 20MM SABS PVC ', 1, 4, NULL, 'slug-29', 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', '20MM'),
(30, 'E030', 'PVC SOCKET 2OMM', 1, 4, NULL, 'slug-30', 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', '20MM'),
(31, 'E031', 'TRUNKING 16 x 16 PVC ', 1, 4, NULL, 'slug-31', 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', '3M'),
(32, 'E032', 'GASKET SMALL', 1, 4, NULL, 'slug-32', 'active', '2025-05-12 10:45:38', 'import', '2025-05-22 12:05:15', NULL, 4, '{\"comment\": \"import\"}', '6X42'),
(33, 'E033', 'CIRCUIT BREAKER - 10AMPS', 1, 4, NULL, 'slug-33', 'active', '2025-05-12 10:45:38', 'import', '2025-05-22 12:05:17', NULL, 7, '{\"comment\": \"import\"}', '115mm'),
(34, 'E034', 'CIRCUIT BREAKER - 25AMPS', 1, 4, NULL, 'slug-34', 'active', '2025-05-12 10:45:38', 'import', '2025-05-22 12:05:19', NULL, 1, '{\"comment\": \"import\"}', ''),
(35, 'E037', 'AAA BATTERIES', 1, 4, NULL, 'slug-35', 'active', '2025-05-12 10:45:38', 'import', '2025-05-22 12:05:21', NULL, 220, '{\"comment\": \"import\"}', ''),
(36, 'E038', 'AA BATTERIES', 1, 4, NULL, 'slug-36', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(38, 'E021', 'BULKHEAD LIGHTS ', 1, 5, NULL, 'slug-38', 'active', '2025-05-12 10:45:39', 'import', '2025-07-14 12:49:53', NULL, 26, '{\"comment\": \"import\"}', ''),
(39, 'E024', 'e27 STUDY LIGHT GLOBE', 1, 5, NULL, 'slug-39', 'active', '2025-05-12 10:45:39', 'import', '2025-07-11 17:05:56', NULL, 10, '{\"comment\": \"import\"}', ''),
(40, 'HM001', 'POP RIVET GUN', 2, 6, NULL, 'slug-40', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:05:36', NULL, 2, '{\"comment\": \"import\"}', ''),
(41, 'HM006', 'SCREWDRIVER BITS SET 2PCS 50MM', 2, 6, NULL, 'slug-41', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:05:40', NULL, 1, '{\"comment\": \"import\"}', '50MM'),
(42, 'HM007', 'BLADE SNAP OFF 82MM', 2, 6, NULL, 'slug-42', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:06:00', NULL, 1, '{\"comment\": \"import\"}', '18MM'),
(43, 'HM009', 'JIG SAW BLADE 4MM', 2, 6, NULL, 'slug-43', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', '4MM'),
(44, 'HM010', 'JIG SAW BLADE 2.5MM', 2, 6, NULL, 'slug-44', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(45, 'HM011', 'HITTIES 100s', 2, 6, NULL, 'slug-45', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:06:05', NULL, 1, '{\"comment\": \"import\"}', '6mm'),
(46, 'HM012', 'HITTIES', 2, 6, NULL, 'slug-46', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:06:08', NULL, 29, '{\"comment\": \"import\"}', '8mm x 50'),
(47, 'HM013', 'SILICONE CLEAR', 2, 6, NULL, 'slug-47', 'active', '2025-05-12 10:45:39', 'import', '2025-07-23 11:52:30', NULL, 12, '{\"comment\": \"import\"}', ''),
(48, 'HM014', 'ACRYLIC SILICONE WHITE', 2, 6, NULL, 'slug-48', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(49, 'HM015', 'FRICTION STAYS', 2, 6, NULL, 'slug-49', 'active', '2025-05-12 10:45:39', 'import', '2025-06-19 15:52:25', NULL, 114, '{\"comment\": \"import\"}', ''),
(50, 'HM016', 'CORNER CLICKS FOR WINDOWS', 2, 6, NULL, 'slug-50', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:06:24', NULL, 2, '{\"comment\": \"import\"}', ''),
(51, 'HM017', 'DOOR CLOSER UNION', 2, 6, NULL, 'slug-51', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:06:26', NULL, 16, '{\"comment\": \"import\"}', ''),
(52, 'HM018', 'WINDOWS HANDLE SB2', 2, 6, NULL, 'slug-52', 'active', '2025-05-12 10:45:39', 'import', '2025-06-19 15:51:50', NULL, 48, '{\"comment\": \"import\"}', 'RIGHT HAND'),
(54, 'HM020', 'DIAMOND SAW BLADE ', 2, 6, NULL, 'slug-54', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:06:30', NULL, 1, '{\"comment\": \"import\"}', '115MM'),
(55, 'HM021', 'CUTTING DISC STEEL STANDARD', 2, 6, NULL, 'slug-55', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 15:17:51', NULL, 3, '{\"comment\": \"import\"}', ''),
(56, 'HM022', 'CUTTING BRUSH - 25MM', 2, 6, NULL, 'slug-56', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:06:37', NULL, 2, '{\"comment\": \"import\"}', '75MM'),
(57, 'HM023', 'CUTTING BRUSH - 1.5MM', 2, 6, NULL, 'slug-57', 'active', '2025-05-12 10:45:39', 'import', '2025-05-19 15:10:03', NULL, 0, '{\"comment\": \"import\"}', '25MM'),
(58, 'HM024', 'TURPENTINE                                       5LITRES', 2, 6, NULL, 'slug-58', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(59, 'HM025', 'THINERS                                               5LITRES', 2, 6, NULL, 'slug-59', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(60, 'HM026', 'BATHROOM LATCH LOCK', 2, 6, NULL, 'slug-60', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(61, 'HM027', 'DOOR HINGES', 2, 6, NULL, 'slug-61', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:06:48', NULL, 58, '{\"comment\": \"import\"}', 'SETS'),
(62, 'HM028', 'TILES SIZE 33x33  - LOOSE', 2, 6, NULL, 'slug-62', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:06:51', NULL, 32, '{\"comment\": \"import\"}', 'BOXES'),
(63, 'HM029', 'TILES SIZE 45x45 - LOOSE', 2, 6, NULL, 'slug-63', 'active', '2025-05-12 10:45:39', 'import', '2025-05-19 15:27:55', NULL, 0, '{\"comment\": \"import\"}', '45/45'),
(64, 'HM030', 'TILES SIZE 30x30 - LOOSE', 2, 6, NULL, 'slug-64', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:06:59', NULL, 32, '{\"comment\": \"import\"}', '30/30'),
(65, 'HM031', 'CEILING TILES - 600x600 - SB2', 2, 6, NULL, 'slug-65', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:10:23', NULL, 17, '{\"comment\": \"import\"}', '600MM/600MM'),
(66, 'HM032', 'CEILING TILES - 1200x1200 - SB1', 2, 6, NULL, 'slug-66', 'active', '2025-05-12 10:45:39', 'import', '2025-05-19 15:10:53', NULL, 0, '{\"comment\": \"import\"}', '1200MM/600MM'),
(67, 'HM033', 'RHINOLITE 50 KG', 2, 6, NULL, 'slug-67', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:10:25', NULL, 1, '{\"comment\": \"import\"}', '50KG'),
(68, 'HM034', 'WATERPROOF DEBI GUN', 2, 6, NULL, 'slug-68', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:10:31', NULL, 1, '{\"comment\": \"import\"}', 'ROLL'),
(69, 'HM035', 'CEMENT 50 KG', 2, 6, NULL, 'slug-69', 'active', '2025-05-12 10:45:39', 'import', '2025-05-20 14:30:25', NULL, 0, '{\"comment\": \"import\"}', '50KG'),
(70, 'HM036', 'TOILET ROLL HOLDERS - GELMAR', 2, 6, NULL, 'slug-70', 'active', '2025-05-12 10:45:39', 'import', '2025-05-20 14:28:23', NULL, 0, '{\"comment\": \"import\"}', '600MM/600MM'),
(71, 'HM037', 'MELAMINE BOARD', 2, 6, NULL, 'slug-71', 'active', '2025-05-12 10:45:39', 'import', '2025-07-16 13:08:33', NULL, 3, '{\"comment\": \"import\"}', '1200MM/600MM'),
(72, 'HM038', 'ACRYLIC WATER PROOFING        5LITRES', 2, 6, NULL, 'slug-72', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(73, 'HM039', 'ROLLER BRUSH TRAY', 2, 6, NULL, 'slug-73', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:10:44', NULL, 2, '{\"comment\": \"import\"}', '160MM'),
(74, 'HM040', 'ROLLER BRUSH', 2, 6, NULL, 'slug-74', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:10:46', NULL, 1, '{\"comment\": \"import\"}', '225MM'),
(75, 'HM041', 'POP RIVETS - 4.8MM', 2, 6, NULL, 'slug-75', 'active', '2025-05-12 10:45:39', 'import', '2025-06-19 15:54:37', NULL, 250, '{\"comment\": \"import\"}', '4,8X12,0 MM'),
(76, 'HM042', 'POP RIVETS - 4.8MMx1.5MM', 2, 6, NULL, 'slug-76', 'active', '2025-05-12 10:45:39', 'import', '2025-06-09 16:12:27', NULL, 75, '{\"comment\": \"import\"}', '12 x 5.8'),
(77, 'HM043', 'DRY WALL  SCREW', 2, 6, NULL, 'slug-77', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', '3.5x41'),
(78, 'HM044', 'SAND PAPER - 60MM', 2, 6, NULL, 'slug-78', 'active', '2025-05-12 10:45:39', 'import', '2025-05-20 14:30:51', NULL, 0, '{\"comment\": \"import\"}', '80GRIT'),
(79, 'HM045', 'SAND PAPER - 80MM', 2, 6, NULL, 'slug-79', 'active', '2025-05-12 10:45:39', 'import', '2025-07-16 14:39:55', NULL, 1, '{\"comment\": \"import\"}', '60GRIT'),
(80, 'HM046', 'STAINLESS DRILL BIT - 6MM', 2, 6, NULL, 'slug-80', 'active', '2025-05-12 10:45:39', 'import', '2025-06-09 16:14:28', NULL, 15, '{\"comment\": \"import\"}', '5MM'),
(81, 'HM047', 'STAINLESS DRILL BIT - 5MM', 2, 6, NULL, 'slug-81', 'active', '2025-05-12 10:45:39', 'import', '2025-05-19 15:14:27', NULL, 0, '{\"comment\": \"import\"}', '6MM'),
(82, 'HM048', 'STAINLESS DRILL BIT - 4MM', 2, 6, NULL, 'slug-82', 'active', '2025-05-12 10:45:39', 'import', '2025-05-19 15:14:44', NULL, 0, '{\"comment\": \"import\"}', '8MM'),
(83, 'HM049', 'CLOUT NAILS 32mm', 2, 6, NULL, 'slug-83', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:11:56', NULL, 200, '{\"comment\": \"import\"}', ' SIZE 32mm'),
(84, 'HM050', ' NAILS STANDARD  ', 2, 6, NULL, 'slug-84', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:12:03', NULL, 100, '{\"comment\": \"import\"}', '2.5 INCH'),
(86, 'HM052', 'CONTACT GLUE', 2, 6, NULL, 'slug-86', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', '1LITRE'),
(87, 'HM053', 'HEADLESS NAILS ', 2, 6, NULL, 'slug-87', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:12:06', NULL, 100, '{\"comment\": \"import\"}', '1,5 INCH'),
(88, 'HM054', 'PVA WHITE PAINT PRO STAR 10LT', 2, 6, NULL, 'slug-88', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', '20LITRES'),
(89, 'HM055', 'ENAMEL PAINT BLACK 5LT', 2, 6, NULL, 'slug-89', 'active', '2025-05-12 10:45:39', 'import', '2025-07-16 14:39:27', NULL, 1, '{\"comment\": \"import\"}', ''),
(90, 'HM056', 'GAZ BOTTLE 50KG', 2, 6, NULL, 'slug-90', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:12:13', NULL, 1, '{\"comment\": \"import\"}', '50KG'),
(91, 'HM057', 'Q 20', 2, 6, NULL, 'slug-91', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:12:15', NULL, 1, '{\"comment\": \"import\"}', ''),
(92, 'HM058', 'DRILL BIT 16MMX210MM SDS ', 2, 6, NULL, 'slug-92', 'active', '2025-05-12 10:45:39', 'import', '2025-05-19 15:15:27', NULL, 0, '{\"comment\": \"import\"}', ''),
(93, 'HM059', 'DRILL BIT SDS 6X160MM', 2, 6, NULL, 'slug-93', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(94, 'HM060', 'DRILL BIT SDS 10X160MM', 2, 6, NULL, 'slug-94', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(95, 'HM061', 'DRILL BIT SDS 8X160MM', 2, 6, NULL, 'slug-95', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(96, 'HM062', 'MASONITE BOARD    SHEET', 2, 6, NULL, 'slug-96', 'active', '2025-05-12 10:45:39', 'import', '2025-07-16 13:12:30', NULL, 1, '{\"comment\": \"import\"}', 'SHEET'),
(97, 'HM063', 'DRY WALL SCREWS - LOOSE', 2, 6, NULL, 'slug-97', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:12:20', NULL, 100, '{\"comment\": \"import\"}', '6 x 32 PACKS'),
(98, 'HM064', 'DRILL BIT 12MMX160MM SDS ', 2, 6, NULL, 'slug-98', 'active', '2025-05-12 10:45:39', 'import', '2025-05-19 15:16:04', NULL, 0, '{\"comment\": \"import\"}', ''),
(99, 'HM065', 'EVASTICK MOSAIC ADHESIVE', 2, 6, NULL, 'slug-99', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(100, 'HM066', 'POWABOND', 2, 6, NULL, 'slug-100', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(101, 'HM067', 'MASKING TAPE SMALL - 10MM', 2, 6, NULL, 'slug-101', 'active', '2025-05-12 10:45:39', 'import', '2025-05-19 15:16:25', NULL, 0, '{\"comment\": \"import\"}', ''),
(102, 'HM068', '8MM X 50 HILTIS', 2, 6, NULL, 'slug-102', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', 'BOX '),
(103, 'HM069', 'SUGAR SOAP', 2, 6, NULL, 'slug-103', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:12:27', NULL, 4, '{\"comment\": \"import\"}', 'BOX '),
(104, 'HM070', 'CUPBOARD RUNNERS', 2, 6, NULL, 'slug-104', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:12:30', NULL, 6, '{\"comment\": \"import\"}', 'SETS'),
(107, 'HM051', 'PLY WOOD BOARD', 2, 6, NULL, 'slug-107', 'active', '2025-05-12 10:45:39', 'import', '2025-07-16 13:12:58', NULL, 4, '{\"comment\": \"import\"}', ''),
(109, 'HM002', 'WOOD GLUE MULTIPURPOSE - 500ML', 2, 7, NULL, 'slug-109', 'active', '2025-05-12 10:45:39', 'import', '2025-06-06 15:59:18', NULL, 6, '{\"comment\": \"import\"}', '500ml'),
(110, 'HM003', 'SCRAPPER 100MM', 2, 7, NULL, 'slug-110', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:12:35', NULL, 1, '{\"comment\": \"import\"}', ''),
(111, 'HM004', 'TROWEL GAUGING 150MM LASHER', 2, 7, NULL, 'slug-111', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:12:39', NULL, 2, '{\"comment\": \"import\"}', '150MM'),
(112, 'HM005', 'TRIMMING KNIFE PVC 82MM 1 PAIR', 2, 7, NULL, 'slug-112', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:12:52', NULL, 1, '{\"comment\": \"import\"}', '18MM'),
(113, 'HM008', 'EPOXY CLEAR', 2, 7, NULL, 'slug-113', 'active', '2025-05-12 10:45:39', 'import', '2025-06-06 15:56:30', NULL, 0, '{\"comment\": \"import\"}', '500 ML KIT'),
(114, 'P001', 'PRESSURE CONTROLER VALVE', 3, 8, NULL, 'slug-114', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:13:00', NULL, 24, '{\"comment\": \"import\"}', ''),
(115, 'P015', 'TOILET BALL VALVE ', 3, 8, NULL, 'slug-115', 'active', '2025-05-12 10:45:39', 'import', '2025-07-18 11:24:59', NULL, 14, '{\"comment\": \"import\"}', ''),
(116, 'P032', '15MM ANGLE VALVE ', 3, 8, NULL, 'slug-116', 'active', '2025-05-12 10:45:39', 'import', '2025-05-28 16:26:57', NULL, 10, '{\"comment\": \"import\"}', ''),
(117, 'P034', '400KPA SAFETY VALVES', 3, 8, NULL, 'slug-117', 'active', '2025-05-12 10:45:39', 'import', '2025-06-20 16:34:00', NULL, 4, '{\"comment\": \"import\"}', ''),
(118, 'P036', '600KPA SAFETY VALVES', 3, 8, NULL, 'slug-118', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(119, 'P056', '22MM BALL O STOP', 3, 8, NULL, 'slug-119', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:13:09', NULL, 16, '{\"comment\": \"import\"}', ''),
(120, 'P066', '15MM BALL O STOP (CONNEX)', 3, 8, NULL, 'slug-120', 'active', '2025-05-12 10:45:39', 'import', '2025-05-30 16:49:00', NULL, 10, '{\"comment\": \"import\"}', ''),
(121, 'P067', '15MM STOP END  DELCOP', 3, 8, NULL, 'slug-121', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(123, 'P002', 'BUTTERFLY NUTS', 3, 9, NULL, 'slug-123', 'active', '2025-05-12 10:45:39', 'import', '2025-06-26 14:01:04', NULL, 5, '{\"comment\": \"import\"}', ''),
(124, 'P033', 'TOILET TANKS', 3, 9, NULL, 'slug-124', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:13:15', NULL, 8, '{\"comment\": \"import\"}', ''),
(125, 'P037', 'TOILET SEAT COVER', 3, 9, NULL, 'slug-125', 'active', '2025-05-12 10:45:39', 'import', '2025-07-14 13:31:30', NULL, 6, '{\"comment\": \"import\"}', ''),
(126, 'P046', 'FLUSH HANDLE ARM', 3, 9, NULL, 'slug-126', 'active', '2025-05-12 10:45:39', 'import', '2025-07-14 13:18:58', NULL, 19, '{\"comment\": \"import\"}', ''),
(127, 'P047', 'TOILET FLUSH HANDLE', 3, 9, NULL, 'slug-127', 'active', '2025-05-12 10:45:39', 'import', '2025-07-14 13:16:58', NULL, 2, '{\"comment\": \"import\"}', ''),
(128, 'P057', 'TOILET SEAT COVER FIXATIONS NUTS', 3, 9, NULL, 'slug-128', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:13:32', NULL, 16, '{\"comment\": \"import\"}', ''),
(129, 'P093', 'RUBBER BANG TOILET', 3, 9, NULL, 'slug-129', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(130, 'P104', '54MM POLYCORP PIPE - PER METER', 3, 9, NULL, 'slug-130', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:13:34', NULL, 6, '{\"comment\": \"import\"}', ''),
(131, 'P118', 'BALL FLOAT ', 3, 9, NULL, 'slug-131', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:13:36', NULL, 7, '{\"comment\": \"import\"}', ''),
(133, 'P003', 'BASIN MIXER FASTENING SET -DOUBLE POLE M6', 3, 10, NULL, 'slug-133', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:13:43', NULL, 12, '{\"comment\": \"import\"}', ''),
(134, 'P004', 'BASIN MIXER ', 3, 10, NULL, 'slug-134', 'active', '2025-05-12 10:45:39', 'import', '2025-07-23 11:40:53', NULL, 0, '{\"comment\": \"import\"}', ''),
(135, 'P011', 'GARDEN TAP', 3, 10, NULL, 'slug-135', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(136, 'P012', 'SHOWER MIXER', 3, 10, NULL, 'slug-136', 'active', '2025-05-12 10:45:39', 'import', '2025-05-30 16:35:20', NULL, 1, '{\"comment\": \"import\"}', ''),
(137, 'P013', 'KITCHEN MIXER ', 3, 10, NULL, 'slug-137', 'active', '2025-05-12 10:45:39', 'import', '2025-06-10 12:10:28', NULL, 3, '{\"comment\": \"import\"}', ''),
(138, 'P068', 'MIXER HANDLE', 3, 10, NULL, 'slug-138', 'active', '2025-05-12 10:45:39', 'import', '2025-05-30 15:55:51', NULL, 10, '{\"comment\": \"import\"}', ''),
(139, 'P101', 'BALL O STOP - 16MM', 3, 10, NULL, 'slug-139', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:13:51', NULL, 1, '{\"comment\": \"import\"}', ''),
(140, 'P102', '1/4 INCH SHOWER TAP HEAD SET', 3, 10, NULL, 'slug-140', 'active', '2025-05-12 10:45:39', 'import', '2025-07-23 13:03:07', NULL, 7, '{\"comment\": \"import\"}', ''),
(141, 'P103', 'PVC PIPE - PER METER', 3, 10, NULL, 'slug-141', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:13:54', NULL, 1, '{\"comment\": \"import\"}', ''),
(142, 'P107', 'TAP WASHER 1/4 \"', 3, 10, NULL, 'slug-142', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(146, 'P005', 'WINDOWS PUTTY', 3, 11, NULL, 'slug-146', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:13:55', NULL, 1, '{\"comment\": \"import\"}', ''),
(147, 'P006', 'EPOXY ', 3, 11, NULL, 'slug-147', 'active', '2025-05-12 10:45:39', 'import', '2025-05-23 15:30:38', NULL, 5, '{\"comment\": \"import\"}', ''),
(148, 'P009', 'NASCO FLUX', 3, 11, NULL, 'slug-148', 'active', '2025-05-12 10:45:39', 'import', '2025-06-26 14:02:45', NULL, 0, '{\"comment\": \"import\"}', ''),
(149, 'P029', 'M10 RAWL BOLT', 3, 11, NULL, 'slug-149', 'active', '2025-05-12 10:45:39', 'import', '2025-06-20 16:29:29', NULL, 27, '{\"comment\": \"import\"}', ''),
(150, 'P030', 'THREAD TAPE', 3, 11, NULL, 'slug-150', 'active', '2025-05-12 10:45:39', 'import', '2025-06-20 16:27:45', NULL, 12, '{\"comment\": \"import\"}', ''),
(151, 'P044', 'BASIN FIXING BOLT ', 3, 11, NULL, 'slug-151', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(152, 'P053', '750ML GAS CARTRIDGE', 3, 11, NULL, 'slug-152', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:14:29', NULL, 1, '{\"comment\": \"import\"}', ''),
(153, 'P007', 'TANGIT PVC', 3, 12, NULL, 'slug-153', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:14:31', NULL, 1, '{\"comment\": \"import\"}', ''),
(154, 'P035', 'BANG OUT', 3, 12, NULL, 'slug-154', 'active', '2025-05-12 10:45:39', 'import', '2025-06-06 15:41:41', NULL, 10, '{\"comment\": \"import\"}', ''),
(155, 'P052', '110MM ALUMINIUM HOLDER BAT', 3, 12, NULL, 'slug-155', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:14:34', NULL, 8, '{\"comment\": \"import\"}', ''),
(156, 'P058', '15MM HOLDERBAT', 3, 12, NULL, 'slug-156', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(157, 'P064', '22X15X22MM REDUCER TEE', 3, 12, NULL, 'slug-157', 'active', '2025-05-12 10:45:39', 'import', '2025-05-30 16:55:15', NULL, 6, '{\"comment\": \"import\"}', ''),
(158, 'P070', 'VACUUM BRACKERS', 3, 12, NULL, 'slug-158', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(159, 'P071', 'FLEX HOSE FEMALE', 3, 12, NULL, 'slug-159', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:15:46', NULL, 14, '{\"comment\": \"import\"}', ''),
(160, 'P072', 'FLEX HOSE MALE', 3, 12, NULL, 'slug-160', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(161, 'P080', 'CASCADE FULL CLAMP 75X150', 3, 12, NULL, 'slug-161', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(162, 'P091', 'CONCRETE SINK STAND', 3, 12, NULL, 'slug-162', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:19:41', NULL, 6, '{\"comment\": \"import\"}', ''),
(163, 'P100', 'DENZO TAPE', 3, 12, NULL, 'slug-163', 'active', '2025-05-12 10:45:39', 'import', '2025-05-23 15:42:54', NULL, 1, '{\"comment\": \"import\"}', ''),
(164, 'P113', 'PVC GALI HEAD', 3, 12, NULL, 'slug-164', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:19:47', NULL, 2, '{\"comment\": \"import\"}', ''),
(165, 'P114', 'PVC GALI GRID', 3, 12, NULL, 'slug-165', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:19:56', NULL, 2, '{\"comment\": \"import\"}', ''),
(167, 'P008', 'VANITY  BASIN', 3, 13, NULL, 'slug-167', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:19:59', NULL, 3, '{\"comment\": \"import\"}', ''),
(168, 'P016', 'SHOWER ROSE', 3, 13, NULL, 'slug-168', 'active', '2025-05-12 10:45:39', 'import', '2025-06-26 14:05:13', NULL, 16, '{\"comment\": \"import\"}', ''),
(169, 'P017', 'SHOWER ARM', 3, 13, NULL, 'slug-169', 'active', '2025-05-12 10:45:39', 'import', '2025-05-28 16:03:46', NULL, 8, '{\"comment\": \"import\"}', ''),
(170, 'P019', 'BASIN  WASTE AND PLUG', 3, 13, NULL, 'slug-170', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:20:18', NULL, 3, '{\"comment\": \"import\"}', ''),
(171, 'P087', 'P-TRAP BASIN AREA - 3.2x40', 3, 13, NULL, 'slug-171', 'active', '2025-05-12 10:45:39', 'import', '2025-05-21 10:18:23', NULL, 0, '{\"comment\": \"import\"}', ''),
(172, 'P117', 'PLASTIC JUNIOR WASH HAND BASIN', 3, 13, NULL, 'slug-172', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:20:21', NULL, 1, '{\"comment\": \"import\"}', ''),
(173, 'P010', 'EXTENDABLE PAN CONNECTOR', 3, 14, NULL, 'slug-173', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:20:28', NULL, 2, '{\"comment\": \"import\"}', ''),
(174, 'P014', '45 DEGREES PVC BEND', 3, 14, NULL, 'slug-174', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:20:36', NULL, 1, '{\"comment\": \"import\"}', ''),
(175, 'P020', 'T JOINT PVC ', 3, 14, NULL, 'slug-175', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:20:40', NULL, 4, '{\"comment\": \"import\"}', ''),
(176, 'P021', '110MM SS COUPLING', 3, 14, NULL, 'slug-176', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:20:42', NULL, 4, '{\"comment\": \"import\"}', ''),
(177, 'P022', '160MM SS COUPLING', 3, 14, NULL, 'slug-177', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:30:50', NULL, 1, '{\"comment\": \"import\"}', ''),
(178, 'P023', '75MM SS COUPLING', 3, 14, NULL, 'slug-178', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:30:53', NULL, 1, '{\"comment\": \"import\"}', ''),
(179, 'P024', '50MM SS COUPLING', 3, 14, NULL, 'slug-179', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(180, 'P026', ' 110X75 REDUCER PVC', 3, 14, NULL, 'slug-180', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(181, 'P027', ' 110X90 DEGREE PVC SV BEND', 3, 14, NULL, 'slug-181', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(182, 'P028', ' 110MM SINGLE SOCKET', 3, 14, NULL, 'slug-182', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:30:55', NULL, 9, '{\"comment\": \"import\"}', ''),
(183, 'P039', '15MM CONNEX TEE', 3, 14, NULL, 'slug-183', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(184, 'P040', '22MM CONNEX TEE', 3, 14, NULL, 'slug-184', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(185, 'P041', '15MM STRAIGHT CONNEX', 3, 14, NULL, 'slug-185', 'active', '2025-05-12 10:45:39', 'import', '2025-05-28 11:14:57', NULL, 5, '{\"comment\": \"import\"}', ''),
(186, 'P042', '15MM CONNEX ELBOW', 3, 14, NULL, 'slug-186', 'active', '2025-05-12 10:45:39', 'import', '2025-05-28 16:04:48', NULL, 10, '{\"comment\": \"import\"}', ''),
(187, 'P043', '22MM STRAIGHT CONNEX', 3, 14, NULL, 'slug-187', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(188, 'P050', '15MM STOP END CONNEX', 3, 14, NULL, 'slug-188', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(189, 'P051', '50MM PVC STRAIGHTER COUPLER', 3, 14, NULL, 'slug-189', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:33:07', NULL, 8, '{\"comment\": \"import\"}', ''),
(190, 'P059', '15MM DELCOP ELBOW', 3, 14, NULL, 'slug-190', 'active', '2025-05-12 10:45:39', 'import', '2025-05-30 16:50:30', NULL, 6, '{\"comment\": \"import\"}', ''),
(191, 'P060', '22MM DELCOP ELBOW', 3, 14, NULL, 'slug-191', 'active', '2025-05-12 10:45:39', 'import', '2025-06-20 16:30:39', NULL, 23, '{\"comment\": \"import\"}', ''),
(192, 'P061', '15MM DELCOP EQUAL TEE', 3, 14, NULL, 'slug-192', 'active', '2025-05-12 10:45:39', 'import', '2025-07-03 11:03:47', NULL, 10, '{\"comment\": \"import\"}', ''),
(193, 'P062', '22MM EQUAL TEE', 3, 14, NULL, 'slug-193', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(194, 'P063', '22X15MM DELCOP REDUCER', 3, 14, NULL, 'slug-194', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(195, 'P065', '15MM STRAIGHT COUPLER DELCOP', 3, 14, NULL, 'slug-195', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:31:06', NULL, 6, '{\"comment\": \"import\"}', ''),
(196, 'P069', 'PVC BEND - 90MM', 3, 14, NULL, 'slug-196', 'active', '2025-05-12 10:45:39', 'import', '2025-05-22 12:31:08', NULL, 17, '{\"comment\": \"import\"}', ''),
(197, 'P078', '76X76X54MM REDUCING TEE', 3, 14, NULL, 'slug-197', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(198, 'P079', '54MM STRAIGHT COUPLER', 3, 14, NULL, 'slug-198', 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(199, 'P081', '76MM SLIP COUPLER', 3, 14, NULL, 'slug-199', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:10', NULL, 1, '{\"comment\": \"import\"}', ''),
(200, 'P083', 'GALVANISER PLUG FEMALE', 3, 14, NULL, 'slug-200', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:14', NULL, 3, '{\"comment\": \"import\"}', ''),
(201, 'P084', '22MM GALVANISED MALE PLUG', 3, 14, NULL, 'slug-201', 'active', '2025-05-12 10:45:40', 'import', '2025-05-30 16:00:25', NULL, 17, '{\"comment\": \"import\"}', ''),
(202, 'P088', 'DROP IN VANITY BASIN', 3, 14, NULL, 'slug-202', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:18', NULL, 3, '{\"comment\": \"import\"}', ''),
(203, 'P092', 'MASTERBAT', 3, 14, NULL, 'slug-203', 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(204, 'P096', 'GALVANISED NIPPLE', 3, 14, NULL, 'slug-204', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:21', NULL, 4, '{\"comment\": \"import\"}', ''),
(205, 'P098', 'PVC BENDS', 3, 14, NULL, 'slug-205', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:23', NULL, 3, '{\"comment\": \"import\"}', ''),
(206, 'P099', 'PVC Y - JUNCTION', 3, 14, NULL, 'slug-206', 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 12:50:48', NULL, 0, '{\"comment\": \"import\"}', ''),
(207, 'P109', 'FRENCH ELBOW 90*', 3, 14, NULL, 'slug-207', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:27', NULL, 1, '{\"comment\": \"import\"}', ''),
(208, 'P110', 'GEYSER TRAY MALE ADAPTOR', 3, 14, NULL, 'slug-208', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:30', NULL, 2, '{\"comment\": \"import\"}', ''),
(209, 'P111', 'PVC PAN CONNECTOR 110MM', 3, 14, NULL, 'slug-209', 'active', '2025-05-12 10:45:40', 'import', '2025-05-28 16:21:03', NULL, 15, '{\"comment\": \"import\"}', ''),
(210, 'P112', 'PLASTIC PILLAR TAP', 3, 14, NULL, 'slug-210', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:36', NULL, 2, '{\"comment\": \"import\"}', ''),
(211, 'P115', 'PVC BEND', 3, 14, NULL, 'slug-211', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:39', NULL, 2, '{\"comment\": \"import\"}', ''),
(212, 'P018', '50MM PVC PIPE', 3, 15, NULL, 'slug-212', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:44', NULL, 1, '{\"comment\": \"import\"}', ''),
(213, 'P025', '110MM PVC PIPE', 3, 15, NULL, 'slug-213', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:42', NULL, 3, '{\"comment\": \"import\"}', ''),
(214, 'P038', '40MM COPPER PIPE - PER METER', 3, 15, NULL, 'slug-214', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:46', NULL, 1, '{\"comment\": \"import\"}', ''),
(215, 'P074', '22MM COPPER PIPE 5.5MT - PER METER', 3, 15, NULL, 'slug-215', 'active', '2025-05-12 10:45:40', 'import', '2025-06-20 16:28:40', NULL, 14, '{\"comment\": \"import\"}', ''),
(216, 'P075', '15MM COPPER PIPE 5.5MT - PER METER', 3, 15, NULL, 'slug-216', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:55', NULL, 2, '{\"comment\": \"import\"}', ''),
(217, 'P076', '54x5.5M COPPER PIPE TUBE - PER METER', 3, 15, NULL, 'slug-217', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:57', NULL, 2, '{\"comment\": \"import\"}', ''),
(218, 'P077', '76X5.5M COPPER PIPE TUBE - PER METER', 3, 15, NULL, 'slug-218', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:31:59', NULL, 1, '{\"comment\": \"import\"}', ''),
(219, 'P089', 'COPPER PIPE 22MM - PER METER', 3, 15, NULL, 'slug-219', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:01', NULL, 16, '{\"comment\": \"import\"}', ''),
(220, 'P094', 'COPPER PIPE BRACKET - MASTERBAT - 75x50', 3, 15, NULL, 'slug-220', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:03', NULL, 5, '{\"comment\": \"import\"}', ''),
(221, 'P095', 'COPPER PIPE BRACKET - MASTERBAT - 52x56', 3, 15, NULL, 'slug-221', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:08', NULL, 1, '{\"comment\": \"import\"}', ''),
(222, 'P097', 'RUBBER FLUSH PIPE CONNECTOR', 3, 15, NULL, 'slug-222', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:15', NULL, 10, '{\"comment\": \"import\"}', ''),
(223, 'P116', 'PVC POOL FLEXI PIPE', 3, 15, NULL, 'slug-223', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:17', NULL, 1, '{\"comment\": \"import\"}', ''),
(227, 'P031', 'SINK WASTE FOR SB2 - KITCHEN', 3, 16, NULL, 'slug-227', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:19', NULL, 3, '{\"comment\": \"import\"}', ''),
(228, 'P048', '100L GEYSERS ', 3, 16, NULL, 'slug-228', 'active', '2025-05-12 10:45:40', 'import', '2025-07-26 13:47:30', NULL, 0, '{\"comment\": \"import\"}', ''),
(229, 'P045', '40MM SHOWER MIXER CARTRIGE-FLAT', 3, 17, NULL, 'slug-229', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:24', NULL, 11, '{\"comment\": \"import\"}', ''),
(230, 'P054', '32MM GASKET CLAMP', 3, 18, NULL, 'slug-230', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:26', NULL, 3, '{\"comment\": \"import\"}', ''),
(231, 'P055', '45-55MM GASKET CLAMP', 3, 18, NULL, 'slug-231', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:29', NULL, 1, '{\"comment\": \"import\"}', ''),
(232, 'P082', 'WAX PAN SEAL RING', 3, 18, NULL, 'slug-232', 'active', '2025-05-12 10:45:40', 'import', '2025-06-10 16:05:11', NULL, 22, '{\"comment\": \"import\"}', ''),
(233, 'P073', 'BATH TRAP', 3, 19, NULL, 'slug-233', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:33', NULL, 2, '{\"comment\": \"import\"}', ''),
(234, 'P085', 'S-TRAP', 3, 19, NULL, 'slug-234', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:34', NULL, 5, '{\"comment\": \"import\"}', ''),
(235, 'P086', 'P-TRAP KITCHEN', 3, 19, NULL, 'slug-235', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:41', NULL, 6, '{\"comment\": \"import\"}', ''),
(236, 'P090', 'TOILET TANK OVERFLOW PLUG', 3, 19, NULL, 'slug-236', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:43', NULL, 8, '{\"comment\": \"import\"}', ''),
(237, 'P105', 'FLEXI ROD', 3, 20, NULL, 'slug-237', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:48', NULL, 1, '{\"comment\": \"import\"}', ''),
(238, 'P106', 'COPPER PIPE 76MM - PER METER', 3, 20, NULL, 'slug-238', 'active', '2025-05-12 10:45:40', 'import', '2025-05-22 12:32:51', NULL, 1, '{\"comment\": \"import\"}', ''),
(239, 'P108', 'BASIN MIXER - CARTRIDGE', 3, 20, NULL, 'slug-239', 'active', '2025-05-12 10:45:40', 'import', '2025-05-21 10:53:34', NULL, 0, '{\"comment\": \"import\"}', ''),
(240, 'AST1', 'Asset Test ', 1, 3, '', 'id-276-manx1rah', 'active', '2025-05-14 14:28:14', '', '2025-08-12 13:06:00', '', 2, '{\"supplierId\": 0, \"serialNumber\": \"78654321\", \"supplierName\": \"\", \"minimumStockAlert\": 5}', ''),
(241, 'HM019', 'WOOD GLUE MULTIPURPOSE - 1L', 2, 21, '', 'id-14-mav31en8', 'active', '2025-05-19 14:50:14', '', '2025-05-22 12:32:53', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(242, 'P049', '150L GEYSERS', 3, 16, '', 'id-360-mawcfitr', 'active', '2025-05-20 12:01:17', '', '2025-05-20 12:01:17', '', 0, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(243, 'C001', 'TOILET PAPER ROLLS - LOOSE', 5, 4, '', 'id-272-mazcmndz', 'active', '2025-05-22 14:29:35', '', '2025-07-28 10:01:08', '', 44, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(244, 'P200', '500grm Soldering Wire', 3, 20, '', 'id-508-mb7thi8j', 'active', '2025-05-28 12:40:37', '', '2025-06-26 14:03:21', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(245, 'P201', '22MM DELCOP SOCKET', 3, 15, '', 'id-713-mb7u19t0', 'active', '2025-05-28 12:53:49', '', '2025-05-28 14:27:33', '', 10, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(246, 'P202', '15MM BALL O STOP (FEMALE)', 3, 8, '', 'id-921-mb7u9bnp', 'active', '2025-05-28 13:00:12', '', '2025-05-28 15:03:33', '', 5, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(247, 'P203', '1/4 INCH PILLAR TAP HEAD', 3, 8, '', 'id-876-mb7uj640', 'active', '2025-05-28 13:07:40', '', '2025-06-10 16:00:04', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(248, 'P204', '32MM MIXER CARTRIDGE-RAISED', 3, 17, '', 'id-413-mb7z0blv', 'active', '2025-05-28 15:14:26', '', '2025-05-28 15:33:34', '', 12, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(249, 'P205', '32MM MIXER CARTRIDGE-FLAT', 3, 17, '', 'id-14-mb7zgxxu', 'active', '2025-05-28 15:26:05', '', '2025-07-23 13:02:21', '', 9, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(250, 'P206', '110MM FLEX PAN CONNECTOR-SHORT', 3, 9, '', 'id-410-mb8115m0', 'active', '2025-05-28 16:09:51', '', '2025-05-28 16:09:51', '', 0, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(251, 'P207', '22x15MM CONNEX REDUCER', 3, 14, '', 'id-807-mbax7wfu', 'active', '2025-05-30 16:46:57', '', '2025-05-30 16:48:04', '', 4, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(252, 'E040', 'SAMITE WHITE DB BLANK-BIG', 1, 4, '', 'id-437-mbf081qo', 'active', '2025-06-02 13:21:02', '', '2025-06-02 14:45:08', '', 10, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(253, 'E041', 'SAMITE WHITE DB BLANK-SML', 1, 4, '', 'id-89-mbf097k8', 'active', '2025-06-02 13:22:09', '', '2025-06-02 14:45:45', '', 4, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(254, 'E042', 'DIN RAIL SLOTTED', 1, 4, '', 'id-550-mbf0aql7', 'active', '2025-06-02 13:23:10', '', '2025-06-05 09:34:41', '', 0, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(255, 'E043', 'CLIP IN NEUTRAL BAR-din 7way', 1, 4, '', 'id-117-mbf0djxr', 'active', '2025-06-02 13:25:47', '', '2025-06-09 16:27:30', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(256, 'E044', '20AMP  WEATHERPROOF LEVER ISLOATOR', 1, 4, '', 'id-911-mbf2fwq2', 'active', '2025-06-02 14:22:56', '', '2025-06-02 14:48:38', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(257, 'E045', '4X2 1 LEVER SWITCH', 1, 4, '', 'id-538-mbf2gs7y', 'active', '2025-06-02 14:24:21', '', '2025-06-19 14:03:44', '', 10, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(258, 'E046', '63AMPS MAIN SWITCH-double pole', 1, 4, '', 'id-971-mbf2iulj', 'active', '2025-06-02 14:25:23', '', '2025-06-05 09:19:55', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(259, 'E047', '10AMPS SINGLE POLE', 1, 4, '', 'id-92-mbf2k9jy', 'active', '2025-06-02 14:26:23', '', '2025-06-05 09:22:07', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(260, 'E048', '40AMPS SINGLE POLE', 1, 4, '', 'id-44-mbf2l9py', 'active', '2025-06-02 14:27:39', '', '2025-06-05 09:24:04', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(261, 'E049', '63AMPS EARTH LEAKAGE- double pole', 1, 4, '', 'id-662-mbf2n72s', 'active', '2025-06-02 14:28:57', '', '2025-06-05 09:24:49', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(262, 'E050', '20AMP SINGLE POLE', 1, 4, '', 'id-843-mbf2op8c', 'active', '2025-06-02 14:29:44', '', '2025-06-05 09:33:02', '', 2, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(263, 'E051', '20AMPS GEYSER ISOLATOR-double pole', 1, 4, '', 'id-450-mbf2uy64', 'active', '2025-06-02 14:34:58', '', '2025-06-05 09:33:38', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(264, 'E052', '10MM RED HOUSE WIRE', 1, 4, '', 'id-152-mbf2wn96', 'active', '2025-06-02 14:35:56', '', '2025-06-02 15:29:42', '', 4, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(265, 'E053', '10MM BLACK HOUSE WIRE', 1, 4, '', 'id-382-mbf2xnea', 'active', '2025-06-02 14:36:50', '', '2025-06-02 15:30:30', '', 4, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(266, 'E054', '4X4 DOUBLE PLUG', 1, 4, '', 'id-785-mbf32ks3', 'active', '2025-06-02 14:41:37', '', '2025-07-14 12:53:03', '', 5, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(267, 'HM071', 'DULUX ACRYLIC PVA WHITE PAINT-20L', 2, 21, '', 'id-110-mbf568qw', 'active', '2025-06-02 15:39:18', '', '2025-07-23 11:53:35', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(268, 'AST2', 'Asset Test 2', 1, 1, '', 'id-396-mbuk97tk', 'Completed', '2025-06-13 10:44:02', '', '2025-06-13 10:44:02', '', 0, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(269, 'E055', 'CRIMPING COPPER LUGS-70MMX10', 1, 1, '', 'id-842-mbulrj9n', 'Completed', '2025-06-13 11:20:09', '', '2025-06-19 13:07:56', '', 0, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(270, 'E056', 'LUG - 70X10', 1, 1, '', 'id-341-mc39ubom', 'Completed', '2025-06-19 12:56:35', '', '2025-06-19 13:07:38', '', 0, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(271, 'E057', 'CORE ECC CABLE - 70x4', 1, 1, '', 'id-746-mc39vd0a', 'Completed', '2025-06-19 12:59:30', '', '2025-06-19 13:07:09', '', 0, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(272, 'HM072', 'MANDERIAN TUSK PAINT-20L', 2, 21, '', 'id-478-mcyqgcin', 'Completed', '2025-07-11 13:23:45', '', '2025-07-18 15:32:30', '', 2, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(273, 'HM073', 'ENAMEL PAINT WHILTE-5L', 2, 21, '', 'id-872-mcyqokvs', 'Completed', '2025-07-11 13:28:48', '', '2025-07-16 16:02:07', '', 0, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(274, 'HM074', 'DARK GREY PAINT-5L', 2, 21, '', 'id-707-mcyqqw3i', 'Completed', '2025-07-11 13:30:33', '', '2025-07-16 16:02:32', '', 0, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(275, 'HM075', 'EDGING TAPE', 2, 21, '', 'id-832-md5v9adv', 'Completed', '2025-07-16 13:11:37', '', '2025-07-16 13:12:01', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(276, 'HM076', 'SAND PAPER- 100MM', 2, 21, '', 'id-873-md5yh6nm', 'Completed', '2025-07-16 14:41:21', '', '2025-07-16 14:41:40', '', 1, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(277, 'HM077', '20kg TILE FIX', 2, 21, '', 'id-750-md8wliph', 'Completed', '2025-07-18 16:12:02', '', '2025-07-18 16:12:53', '', 7, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(278, 'HM078', '600x600 IVORY NANO PORCELAIN TILE', 2, 21, '', 'id-840-md8x9kig', 'Completed', '2025-07-18 16:48:57', '', '2025-07-18 16:50:45', '', 3, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', ''),
(279, 'HM079', '400X400 CHISEL BEIGE CERAMIC TILE', 2, 21, '', 'id-399-md8y0lcc', 'Completed', '2025-07-18 16:52:10', '', '2025-07-18 16:52:55', '', 14, '{\"supplierId\": 0, \"serialNumber\": \"\", \"supplierName\": \"\"}', '');

-- --------------------------------------------------------

--
-- Table structure for table `StockType`
--

CREATE TABLE `StockType` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `categoryId` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(50) DEFAULT NULL,
  `lastUpdatedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdatedBy` varchar(50) DEFAULT NULL,
  `size` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `StockType`
--

INSERT INTO `StockType` (`id`, `code`, `categoryId`, `name`, `imageUrl`, `status`, `createdDate`, `createdBy`, `lastUpdatedDate`, `lastUpdatedBy`, `size`) VALUES
(1, 'S', 1, 'Spares', NULL, 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 10:45:38', NULL, NULL),
(2, 'L', 1, 'Lighting', NULL, 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 10:45:38', NULL, NULL),
(3, 'F', 1, 'Fitting', NULL, 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 10:45:38', NULL, NULL),
(4, 'C', 1, 'Consumables', NULL, 'active', '2025-05-12 10:45:38', 'import', '2025-05-12 10:45:38', NULL, NULL),
(5, 'L', 1, 'lighting', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(6, 'S', 2, 'Spares', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(7, 'C', 2, 'Consumables', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(8, 'V', 3, 'Valves', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(9, 'TF2', 3, 'Toilet Fittings', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(10, 'T&M', 3, 'Taps & Mixers', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(11, 'C', 3, 'Consumables', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(12, 'U', 3, 'Uncategorized', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(13, 'BF2', 3, 'Bathroom Fixtures', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(14, 'PF2', 3, 'Pipe Fittings', NULL, 'active', '2025-05-12 10:45:39', 'import', '2025-05-12 10:45:39', NULL, NULL),
(15, 'P&F', 3, 'Pipes & Fittings', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(16, 'S', 3, 'Spares', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(17, 'M', 3, 'Mixers', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(18, 'S&G', 3, 'Seals & Gaskets', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(19, 'D', 3, 'Drainage', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(20, 'A', 3, 'Accessories', NULL, 'active', '2025-05-12 10:45:40', 'import', '2025-05-12 10:45:40', NULL, NULL),
(21, 'HS001', 2, 'Misc Handyman Stock', '', 'active', '2025-05-13 16:48:21', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-05-13 16:48:37', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', ''),
(22, 'O', 5, 'Other', '', 'active', '2025-05-22 14:29:08', '42eb4519-1f70-11f0-b081-d21cc41a9548', '2025-05-22 14:29:08', '42eb4519-1f70-11f0-b081-d21cc41a9548', '');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `name`, `company_name`, `email`, `phone`, `address`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 'Demo Tenant', 'Demo Company', 'demo@example.com', '+27 000 000 0000', NULL, NULL, '2025-08-16 02:25:43', '2025-08-16 02:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `Transactions`
--

CREATE TABLE `Transactions` (
  `id` int NOT NULL,
  `stockItemId` int DEFAULT NULL,
  `transactionType` enum('restock','usage','stock-adjustment','damaged') NOT NULL,
  `quantity` int NOT NULL,
  `transactionDate` varchar(100) NOT NULL,
  `status` varchar(80) DEFAULT 'Pending',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(50) DEFAULT NULL,
  `lastUpdatedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdatedBy` varchar(50) DEFAULT NULL,
  `metadata` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Transactions`
--

INSERT INTO `Transactions` (`id`, `stockItemId`, `transactionType`, `quantity`, `transactionDate`, `status`, `createdDate`, `createdBy`, `lastUpdatedDate`, `lastUpdatedBy`, `metadata`) VALUES
(1, 1, 'usage', 1, '2025-05-13T15:01:29.768Z', 'completed', '2025-05-13 17:01:29', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"0\", \"comments\": [{\"comment\": \"Requisition 1 - stock\", \"createdBy\": \"System\", \"createdDate\": \"2025-05-13T15:01:29.770Z\"}], \"reasonCode\": \"\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(2, 2, 'usage', 5, '2025-05-13T15:01:29.771Z', 'completed', '2025-05-13 17:01:29', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [{\"comment\": \"Requisition 1 - stock\", \"createdBy\": \"System\", \"createdDate\": \"2025-05-13T15:01:29.771Z\"}], \"reasonCode\": \"\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(3, 2, 'restock', 20, '2025-05-13T15:02:10.756Z', 'completed', '2025-05-13 17:02:27', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"condition\": \"New\", \"reasonCode\": \"Restock\", \"supplierId\": \"7\", \"requestedBy\": \"Zayd\", \"requestedById\": 0}'),
(4, 2, 'restock', 50, '2025-05-13T15:03:16.280Z', 'completed', '2025-05-13 17:03:16', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [{\"comment\": \"Requisition 2 - purchase\", \"createdBy\": \"System\", \"createdDate\": \"2025-05-13T15:03:16.280Z\"}], \"reasonCode\": \"\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(5, 2, 'usage', 30, '2025-05-13T15:03:29.517Z', 'completed', '2025-05-13 17:03:44', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"Replacement (Stolen)\", \"requestedBy\": \"SHAMIR\", \"requestedById\": 0}'),
(6, 1, 'restock', 10, '2025-05-19T07:24:46.387Z', 'completed', '2025-05-19 09:25:05', 'c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"44\", \"comments\": [], \"condition\": \"New\", \"reasonCode\": \"Return\", \"supplierId\": \"7\", \"requestedBy\": \"Ndumiso MM\", \"requestedById\": 0}'),
(25, 1, 'usage', 2, '2025-05-19T11:39:59.036Z', 'completed', '2025-05-19 13:40:09', 'c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"44\", \"comments\": [], \"reasonCode\": \"Replacement (Stolen)\", \"requestedBy\": \"Ndumiso MM\", \"requestedById\": 0}'),
(26, 1, 'restock', 100, '2025-05-19T11:40:12.344Z', 'completed', '2025-05-19 13:40:21', 'c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"46\", \"comments\": [], \"condition\": \"Fair\", \"reasonCode\": \"Return\", \"supplierId\": \"7\", \"requestedBy\": \"Ndumiso MM\", \"requestedById\": 0}'),
(27, 1, 'usage', 1, '2025-05-19T11:45:15.791Z', 'completed', '2025-05-19 13:45:21', 'c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"46\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Ndumiso MM\", \"requestedById\": 0}'),
(28, 3, 'restock', 2, '2025-05-19T11:47:21.548Z', 'completed', '2025-05-19 13:47:21', 'c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"46\", \"comments\": [{\"comment\": \"Requisition 7 - purchase\", \"createdBy\": \"System\", \"createdDate\": \"2025-05-19T11:47:21.548Z\"}], \"reasonCode\": \"\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(29, 1, 'usage', 98, '2025-05-19T12:10:56.912Z', 'completed', '2025-05-19 14:11:10', '0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(30, 1, 'usage', 1, '2025-05-19T12:15:48.561Z', 'completed', '2025-05-19 14:15:48', '0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"169\", \"comments\": [{\"comment\": \"Requisition 8 - stock\", \"createdBy\": \"System\", \"createdDate\": \"2025-05-19T12:15:48.561Z\"}], \"reasonCode\": \"\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(31, 1, 'usage', 1, '2025-05-19T12:16:36.597Z', 'completed', '2025-05-19 14:16:36', '0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"8\", \"comments\": [{\"comment\": \"Requisition 9 - stock\", \"createdBy\": \"System\", \"createdDate\": \"2025-05-19T12:16:36.597Z\"}], \"reasonCode\": \"\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(32, 1, 'restock', 1, '2025-05-19T12:17:31.434Z', 'completed', '2025-05-19 14:17:45', '0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"condition\": \"New\", \"reasonCode\": \"Restock\", \"supplierId\": \"7\", \"requestedBy\": \"Z\", \"requestedById\": 0}'),
(33, 1, 'usage', 1, '2025-05-19T12:18:52.993Z', 'completed', '2025-05-19 14:18:53', '0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"26\", \"comments\": [{\"comment\": \"Requisition 11 - stock\", \"createdBy\": \"System\", \"createdDate\": \"2025-05-19T12:18:52.993Z\"}], \"reasonCode\": \"\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(34, 1, 'usage', 5, '2025-05-19T12:19:51.160Z', 'completed', '2025-05-19 14:19:51', '0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"0\", \"comments\": [{\"comment\": \"Requisition 12 - stock\", \"createdBy\": \"System\", \"createdDate\": \"2025-05-19T12:19:51.160Z\"}], \"reasonCode\": \"\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(35, 2, 'usage', 1, '2025-05-19T12:19:51.162Z', 'completed', '2025-05-19 14:19:51', '0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"8\", \"comments\": [{\"comment\": \"Requisition 12 - stock\", \"createdBy\": \"System\", \"createdDate\": \"2025-05-19T12:19:51.162Z\"}], \"reasonCode\": \"\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(36, 1, 'usage', 2, '2025-05-19T12:22:25.870Z', 'completed', '2025-05-19 14:22:26', '0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"8\", \"comments\": [{\"comment\": \"Requisition 13 - stock\", \"createdBy\": \"System\", \"createdDate\": \"2025-05-19T12:22:25.870Z\"}], \"reasonCode\": \"\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(37, 1, 'restock', 8, '2025-05-19T12:27:57.651Z', 'completed', '2025-05-19 14:28:13', '0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"condition\": \"Good\", \"reasonCode\": \"Restock\", \"supplierId\": \"7\", \"requestedBy\": \"Z\", \"requestedById\": 0}'),
(38, 2, 'usage', 44, '2025-05-19T12:28:24.317Z', 'completed', '2025-05-19 14:28:35', '0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(39, 3, 'usage', 2, '2025-05-19T12:28:42.712Z', 'completed', '2025-05-19 14:28:52', '0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Z\", \"requestedById\": 0}'),
(40, 1, 'stock-adjustment', 7, '2025-05-22T08:59:53.908Z', 'completed', '2025-05-22 10:59:56', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(41, 2, 'stock-adjustment', 5, '2025-05-22T10:02:49.001Z', 'completed', '2025-05-22 12:02:51', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(42, 3, 'stock-adjustment', 21, '2025-05-22T10:02:58.790Z', 'completed', '2025-05-22 12:03:00', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(43, 4, 'stock-adjustment', 17, '2025-05-22T10:03:03.588Z', 'completed', '2025-05-22 12:03:17', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(44, 4, 'stock-adjustment', 17, '2025-05-22T10:03:03.588Z', 'completed', '2025-05-22 12:03:17', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(45, 5, 'stock-adjustment', 33, '2025-05-22T10:03:46.465Z', 'completed', '2025-05-22 12:04:01', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(46, 6, 'stock-adjustment', 9, '2025-05-22T10:04:03.147Z', 'completed', '2025-05-22 12:04:04', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(47, 7, 'stock-adjustment', 3, '2025-05-22T10:04:04.798Z', 'completed', '2025-05-22 12:04:09', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(48, 8, 'stock-adjustment', 3, '2025-05-22T10:04:11.670Z', 'completed', '2025-05-22 12:04:12', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(49, 9, 'stock-adjustment', 5, '2025-05-22T10:04:13.145Z', 'completed', '2025-05-22 12:04:13', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(50, 10, 'stock-adjustment', 9, '2025-05-22T10:04:14.415Z', 'completed', '2025-05-22 12:04:15', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(51, 11, 'stock-adjustment', 1, '2025-05-22T10:04:17.229Z', 'completed', '2025-05-22 12:04:18', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(52, 12, 'stock-adjustment', 4, '2025-05-22T10:04:18.597Z', 'completed', '2025-05-22 12:04:19', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(53, 13, 'stock-adjustment', 7, '2025-05-22T10:04:19.814Z', 'completed', '2025-05-22 12:04:20', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(54, 14, 'stock-adjustment', 20, '2025-05-22T10:04:21.174Z', 'completed', '2025-05-22 12:04:21', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(55, 15, 'stock-adjustment', 0, '2025-05-22T10:04:22.414Z', 'completed', '2025-05-22 12:04:23', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(56, 16, 'stock-adjustment', 1, '2025-05-22T10:04:23.761Z', 'completed', '2025-05-22 12:04:24', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(57, 17, 'stock-adjustment', 0, '2025-05-22T10:04:30.234Z', 'completed', '2025-05-22 12:04:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(58, 18, 'stock-adjustment', 5, '2025-05-22T10:04:31.838Z', 'completed', '2025-05-22 12:04:32', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(59, 19, 'stock-adjustment', 0, '2025-05-22T10:04:33.429Z', 'completed', '2025-05-22 12:04:34', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(60, 20, 'stock-adjustment', 0, '2025-05-22T10:04:34.958Z', 'completed', '2025-05-22 12:04:35', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(61, 21, 'stock-adjustment', 11, '2025-05-22T10:04:36.874Z', 'completed', '2025-05-22 12:04:38', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(62, 22, 'stock-adjustment', 50, '2025-05-22T10:04:39.923Z', 'completed', '2025-05-22 12:04:40', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(63, 23, 'stock-adjustment', 60, '2025-05-22T10:04:42.343Z', 'completed', '2025-05-22 12:04:43', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(64, 25, 'stock-adjustment', 4, '2025-05-22T10:04:45.087Z', 'completed', '2025-05-22 12:04:48', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(65, 24, 'stock-adjustment', 0, '2025-05-22T10:04:53.356Z', 'completed', '2025-05-22 12:04:54', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(66, 26, 'stock-adjustment', 0, '2025-05-22T10:04:54.917Z', 'completed', '2025-05-22 12:04:55', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(67, 27, 'stock-adjustment', 0, '2025-05-22T10:04:56.165Z', 'completed', '2025-05-22 12:04:56', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(68, 28, 'stock-adjustment', 0, '2025-05-22T10:04:58.151Z', 'completed', '2025-05-22 12:04:58', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(69, 29, 'stock-adjustment', 0, '2025-05-22T10:05:04.558Z', 'completed', '2025-05-22 12:05:05', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(70, 32, 'stock-adjustment', 4, '2025-05-22T10:05:13.582Z', 'completed', '2025-05-22 12:05:15', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(71, 33, 'stock-adjustment', 7, '2025-05-22T10:05:16.429Z', 'completed', '2025-05-22 12:05:17', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(72, 34, 'stock-adjustment', 1, '2025-05-22T10:05:18.221Z', 'completed', '2025-05-22 12:05:19', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(73, 35, 'stock-adjustment', 220, '2025-05-22T10:05:20.150Z', 'completed', '2025-05-22 12:05:21', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(74, 38, 'stock-adjustment', 40, '2025-05-22T10:05:24.861Z', 'completed', '2025-05-22 12:05:25', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(75, 39, 'stock-adjustment', 122, '2025-05-22T10:05:26.737Z', 'completed', '2025-05-22 12:05:27', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(76, 40, 'stock-adjustment', 1, '2025-05-22T10:05:29.288Z', 'completed', '2025-05-22 12:05:30', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(77, 40, 'stock-adjustment', 1, '2025-05-22T10:05:29.288Z', 'completed', '2025-05-22 12:05:36', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(78, 41, 'stock-adjustment', 1, '2025-05-22T10:05:39.116Z', 'completed', '2025-05-22 12:05:40', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(79, 42, 'stock-adjustment', 1, '2025-05-22T10:05:58.158Z', 'completed', '2025-05-22 12:06:00', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(80, 45, 'stock-adjustment', 1, '2025-05-22T10:06:04.571Z', 'completed', '2025-05-22 12:06:05', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(81, 46, 'stock-adjustment', 29, '2025-05-22T10:06:07.371Z', 'completed', '2025-05-22 12:06:08', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(82, 47, 'stock-adjustment', 25, '2025-05-22T10:06:12.526Z', 'completed', '2025-05-22 12:06:13', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(83, 49, 'stock-adjustment', 120, '2025-05-22T10:06:20.079Z', 'completed', '2025-05-22 12:06:21', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(84, 50, 'stock-adjustment', 2, '2025-05-22T10:06:23.006Z', 'completed', '2025-05-22 12:06:23', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(85, 51, 'stock-adjustment', 16, '2025-05-22T10:06:25.454Z', 'completed', '2025-05-22 12:06:26', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(86, 52, 'stock-adjustment', 54, '2025-05-22T10:06:27.532Z', 'completed', '2025-05-22 12:06:28', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(87, 54, 'stock-adjustment', 1, '2025-05-22T10:06:29.622Z', 'completed', '2025-05-22 12:06:30', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(88, 55, 'stock-adjustment', 5, '2025-05-22T10:06:33.924Z', 'completed', '2025-05-22 12:06:35', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(89, 56, 'stock-adjustment', 2, '2025-05-22T10:06:36.131Z', 'completed', '2025-05-22 12:06:37', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(90, 61, 'stock-adjustment', 58, '2025-05-22T10:06:46.793Z', 'completed', '2025-05-22 12:06:48', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(91, 62, 'stock-adjustment', 32, '2025-05-22T10:06:50.501Z', 'completed', '2025-05-22 12:06:51', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(92, 64, 'stock-adjustment', 32, '2025-05-22T10:06:58.174Z', 'completed', '2025-05-22 12:06:59', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(93, 65, 'stock-adjustment', 1, '2025-05-22T10:10:18.889Z', 'completed', '2025-05-22 12:10:20', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(94, 65, 'stock-adjustment', 16, '2025-05-22T10:10:22.292Z', 'completed', '2025-05-22 12:10:23', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(95, 67, 'stock-adjustment', 1, '2025-05-22T10:10:24.398Z', 'completed', '2025-05-22 12:10:25', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(96, 68, 'stock-adjustment', 1, '2025-05-22T10:10:29.871Z', 'completed', '2025-05-22 12:10:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(97, 73, 'stock-adjustment', 1, '2025-05-22T10:10:35.292Z', 'completed', '2025-05-22 12:10:44', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(98, 73, 'stock-adjustment', 1, '2025-05-22T10:10:35.292Z', 'completed', '2025-05-22 12:10:44', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(99, 74, 'stock-adjustment', 1, '2025-05-22T10:10:45.730Z', 'completed', '2025-05-22 12:10:46', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(100, 75, 'stock-adjustment', 300, '2025-05-22T10:10:48.245Z', 'completed', '2025-05-22 12:10:49', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(101, 76, 'stock-adjustment', 100, '2025-05-22T10:11:02.696Z', 'completed', '2025-05-22 12:11:32', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(102, 80, 'stock-adjustment', 17, '2025-05-22T10:11:50.846Z', 'completed', '2025-05-22 12:11:52', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(103, 83, 'stock-adjustment', 200, '2025-05-22T10:11:55.009Z', 'completed', '2025-05-22 12:11:55', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(104, 84, 'stock-adjustment', 100, '2025-05-22T10:12:02.437Z', 'completed', '2025-05-22 12:12:03', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(105, 87, 'stock-adjustment', 100, '2025-05-22T10:12:05.036Z', 'completed', '2025-05-22 12:12:06', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(106, 90, 'stock-adjustment', 1, '2025-05-22T10:12:11.999Z', 'completed', '2025-05-22 12:12:13', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(107, 91, 'stock-adjustment', 1, '2025-05-22T10:12:14.853Z', 'completed', '2025-05-22 12:12:15', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(108, 97, 'stock-adjustment', 100, '2025-05-22T10:12:19.428Z', 'completed', '2025-05-22 12:12:20', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(109, 103, 'stock-adjustment', 4, '2025-05-22T10:12:26.324Z', 'completed', '2025-05-22 12:12:27', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(110, 104, 'stock-adjustment', 6, '2025-05-22T10:12:29.473Z', 'completed', '2025-05-22 12:12:30', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(111, 109, 'stock-adjustment', 7, '2025-05-22T10:12:32.154Z', 'completed', '2025-05-22 12:12:33', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(112, 110, 'stock-adjustment', 1, '2025-05-22T10:12:34.535Z', 'completed', '2025-05-22 12:12:35', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(113, 111, 'stock-adjustment', 1, '2025-05-22T10:12:36.332Z', 'completed', '2025-05-22 12:12:39', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(114, 111, 'stock-adjustment', 1, '2025-05-22T10:12:36.332Z', 'completed', '2025-05-22 12:12:39', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(115, 112, 'stock-adjustment', 1, '2025-05-22T10:12:51.110Z', 'completed', '2025-05-22 12:12:52', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(116, 113, 'stock-adjustment', 1, '2025-05-22T10:12:53.506Z', 'completed', '2025-05-22 12:12:54', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(117, 114, 'stock-adjustment', 24, '2025-05-22T10:12:55.789Z', 'completed', '2025-05-22 12:12:59', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(118, 115, 'stock-adjustment', 1, '2025-05-22T10:13:01.504Z', 'completed', '2025-05-22 12:13:02', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(119, 117, 'stock-adjustment', 8, '2025-05-22T10:13:03.933Z', 'completed', '2025-05-22 12:13:04', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(120, 119, 'stock-adjustment', 16, '2025-05-22T10:13:08.372Z', 'completed', '2025-05-22 12:13:09', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(121, 120, 'stock-adjustment', 1, '2025-05-22T10:13:11.040Z', 'completed', '2025-05-22 12:13:11', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(122, 123, 'stock-adjustment', 8, '2025-05-22T10:13:13.012Z', 'completed', '2025-05-22 12:13:13', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(123, 124, 'stock-adjustment', 8, '2025-05-22T10:13:14.577Z', 'completed', '2025-05-22 12:13:15', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(124, 125, 'stock-adjustment', 11, '2025-05-22T10:13:16.017Z', 'completed', '2025-05-22 12:13:22', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(125, 126, 'stock-adjustment', 18, '2025-05-22T10:13:24.736Z', 'completed', '2025-05-22 12:13:26', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(126, 128, 'stock-adjustment', 16, '2025-05-22T10:13:30.613Z', 'completed', '2025-05-22 12:13:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(127, 130, 'stock-adjustment', 6, '2025-05-22T10:13:33.540Z', 'completed', '2025-05-22 12:13:34', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(128, 131, 'stock-adjustment', 7, '2025-05-22T10:13:35.297Z', 'completed', '2025-05-22 12:13:36', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(129, 133, 'stock-adjustment', 4, '2025-05-22T10:13:40.067Z', 'completed', '2025-05-22 12:13:41', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(130, 133, 'stock-adjustment', 8, '2025-05-22T10:13:42.291Z', 'completed', '2025-05-22 12:13:43', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(131, 137, 'stock-adjustment', 3, '2025-05-22T10:13:47.873Z', 'completed', '2025-05-22 12:13:48', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(132, 139, 'stock-adjustment', 1, '2025-05-22T10:13:50.431Z', 'completed', '2025-05-22 12:13:51', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(133, 141, 'stock-adjustment', 1, '2025-05-22T10:13:53.030Z', 'completed', '2025-05-22 12:13:53', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(134, 146, 'stock-adjustment', 1, '2025-05-22T10:13:54.903Z', 'completed', '2025-05-22 12:13:55', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(135, 147, 'stock-adjustment', 2, '2025-05-22T10:14:12.117Z', 'completed', '2025-05-22 12:14:13', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(136, 149, 'stock-adjustment', 35, '2025-05-22T10:14:15.483Z', 'completed', '2025-05-22 12:14:16', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(137, 147, 'stock-adjustment', 1, '2025-05-22T10:14:24.184Z', 'completed', '2025-05-22 12:14:25', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(138, 150, 'stock-adjustment', 16, '2025-05-22T10:14:26.717Z', 'completed', '2025-05-22 12:14:27', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(139, 152, 'stock-adjustment', 1, '2025-05-22T10:14:28.870Z', 'completed', '2025-05-22 12:14:29', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(140, 153, 'stock-adjustment', 1, '2025-05-22T10:14:30.798Z', 'completed', '2025-05-22 12:14:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(141, 154, 'stock-adjustment', 2, '2025-05-22T10:14:32.074Z', 'completed', '2025-05-22 12:14:32', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(142, 155, 'stock-adjustment', 8, '2025-05-22T10:14:33.491Z', 'completed', '2025-05-22 12:14:34', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(143, 157, 'stock-adjustment', 5, '2025-05-22T10:14:35.397Z', 'completed', '2025-05-22 12:14:36', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(144, 159, 'stock-adjustment', 14, '2025-05-22T10:14:45.254Z', 'completed', '2025-05-22 12:15:45', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(145, 162, 'stock-adjustment', 6, '2025-05-22T10:19:34.637Z', 'completed', '2025-05-22 12:19:41', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(146, 164, 'stock-adjustment', 2, '2025-05-22T10:19:43.207Z', 'completed', '2025-05-22 12:19:47', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(147, 165, 'stock-adjustment', 2, '2025-05-22T10:19:49.455Z', 'completed', '2025-05-22 12:19:56', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(148, 167, 'stock-adjustment', 3, '2025-05-22T10:19:57.835Z', 'completed', '2025-05-22 12:19:58', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(149, 169, 'stock-adjustment', 2, '2025-05-22T10:20:06.240Z', 'completed', '2025-05-22 12:20:10', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(150, 170, 'stock-adjustment', 3, '2025-05-22T10:20:17.501Z', 'completed', '2025-05-22 12:20:18', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(151, 172, 'stock-adjustment', 1, '2025-05-22T10:20:20.341Z', 'completed', '2025-05-22 12:20:21', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(152, 173, 'stock-adjustment', 2, '2025-05-22T10:20:26.924Z', 'completed', '2025-05-22 12:20:27', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(153, 174, 'stock-adjustment', 1, '2025-05-22T10:20:33.388Z', 'completed', '2025-05-22 12:20:36', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(154, 175, 'stock-adjustment', 4, '2025-05-22T10:20:39.293Z', 'completed', '2025-05-22 12:20:40', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(155, 176, 'stock-adjustment', 4, '2025-05-22T10:20:42.132Z', 'completed', '2025-05-22 12:20:42', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(156, 177, 'stock-adjustment', 1, '2025-05-22T10:30:49.680Z', 'completed', '2025-05-22 12:30:50', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(157, 178, 'stock-adjustment', 1, '2025-05-22T10:30:52.064Z', 'completed', '2025-05-22 12:30:53', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(158, 182, 'stock-adjustment', 9, '2025-05-22T10:30:54.830Z', 'completed', '2025-05-22 12:30:55', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(159, 191, 'stock-adjustment', 31, '2025-05-22T10:30:59.518Z', 'completed', '2025-05-22 12:31:00', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(160, 192, 'stock-adjustment', 10, '2025-05-22T10:31:01.020Z', 'completed', '2025-05-22 12:31:01', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(161, 195, 'stock-adjustment', 6, '2025-05-22T10:31:04.747Z', 'completed', '2025-05-22 12:31:06', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(162, 196, 'stock-adjustment', 17, '2025-05-22T10:31:07.502Z', 'completed', '2025-05-22 12:31:08', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(163, 199, 'stock-adjustment', 1, '2025-05-22T10:31:09.715Z', 'completed', '2025-05-22 12:31:10', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(164, 201, 'stock-adjustment', 12, '2025-05-22T10:31:11.860Z', 'completed', '2025-05-22 12:31:12', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(165, 200, 'stock-adjustment', 3, '2025-05-22T10:31:13.614Z', 'completed', '2025-05-22 12:31:14', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(166, 202, 'stock-adjustment', 3, '2025-05-22T10:31:17.661Z', 'completed', '2025-05-22 12:31:18', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}');
INSERT INTO `Transactions` (`id`, `stockItemId`, `transactionType`, `quantity`, `transactionDate`, `status`, `createdDate`, `createdBy`, `lastUpdatedDate`, `lastUpdatedBy`, `metadata`) VALUES
(167, 204, 'stock-adjustment', 4, '2025-05-22T10:31:20.243Z', 'completed', '2025-05-22 12:31:21', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(168, 205, 'stock-adjustment', 3, '2025-05-22T10:31:22.475Z', 'completed', '2025-05-22 12:31:23', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(169, 207, 'stock-adjustment', 1, '2025-05-22T10:31:26.213Z', 'completed', '2025-05-22 12:31:27', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(170, 208, 'stock-adjustment', 2, '2025-05-22T10:31:29.201Z', 'completed', '2025-05-22 12:31:29', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(171, 209, 'stock-adjustment', 5, '2025-05-22T10:31:31.250Z', 'completed', '2025-05-22 12:31:32', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(172, 210, 'stock-adjustment', 2, '2025-05-22T10:31:35.443Z', 'completed', '2025-05-22 12:31:36', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(173, 211, 'stock-adjustment', 2, '2025-05-22T10:31:38.098Z', 'completed', '2025-05-22 12:31:38', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(174, 213, 'stock-adjustment', 3, '2025-05-22T10:31:41.459Z', 'completed', '2025-05-22 12:31:42', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(175, 212, 'stock-adjustment', 1, '2025-05-22T10:31:43.269Z', 'completed', '2025-05-22 12:31:43', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(176, 214, 'stock-adjustment', 1, '2025-05-22T10:31:45.198Z', 'completed', '2025-05-22 12:31:45', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(177, 215, 'stock-adjustment', 16, '2025-05-22T10:31:47.012Z', 'completed', '2025-05-22 12:31:48', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(178, 216, 'stock-adjustment', 1, '2025-05-22T10:31:51.233Z', 'completed', '2025-05-22 12:31:55', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(179, 216, 'stock-adjustment', 1, '2025-05-22T10:31:51.233Z', 'completed', '2025-05-22 12:31:55', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(180, 217, 'stock-adjustment', 2, '2025-05-22T10:31:56.530Z', 'completed', '2025-05-22 12:31:57', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(181, 218, 'stock-adjustment', 1, '2025-05-22T10:31:58.083Z', 'completed', '2025-05-22 12:31:59', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(182, 219, 'stock-adjustment', 16, '2025-05-22T10:31:59.959Z', 'completed', '2025-05-22 12:32:00', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(183, 220, 'stock-adjustment', 5, '2025-05-22T10:32:01.743Z', 'completed', '2025-05-22 12:32:03', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(184, 221, 'stock-adjustment', 1, '2025-05-22T10:32:07.148Z', 'completed', '2025-05-22 12:32:08', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(185, 222, 'stock-adjustment', 10, '2025-05-22T10:32:14.822Z', 'completed', '2025-05-22 12:32:15', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(186, 223, 'stock-adjustment', 1, '2025-05-22T10:32:16.638Z', 'completed', '2025-05-22 12:32:17', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(187, 227, 'stock-adjustment', 3, '2025-05-22T10:32:18.309Z', 'completed', '2025-05-22 12:32:19', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(188, 228, 'stock-adjustment', 3, '2025-05-22T10:32:21.790Z', 'completed', '2025-05-22 12:32:22', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(189, 229, 'stock-adjustment', 11, '2025-05-22T10:32:23.588Z', 'completed', '2025-05-22 12:32:24', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(190, 230, 'stock-adjustment', 3, '2025-05-22T10:32:25.169Z', 'completed', '2025-05-22 12:32:25', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(191, 231, 'stock-adjustment', 1, '2025-05-22T10:32:28.577Z', 'completed', '2025-05-22 12:32:29', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(192, 232, 'stock-adjustment', 14, '2025-05-22T10:32:30.435Z', 'completed', '2025-05-22 12:32:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(193, 233, 'stock-adjustment', 2, '2025-05-22T10:32:32.280Z', 'completed', '2025-05-22 12:32:33', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(194, 234, 'stock-adjustment', 5, '2025-05-22T10:32:33.876Z', 'completed', '2025-05-22 12:32:34', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(195, 235, 'stock-adjustment', 2, '2025-05-22T10:32:35.329Z', 'completed', '2025-05-22 12:32:41', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(196, 235, 'stock-adjustment', 2, '2025-05-22T10:32:35.329Z', 'completed', '2025-05-22 12:32:41', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(197, 235, 'stock-adjustment', 2, '2025-05-22T10:32:35.329Z', 'completed', '2025-05-22 12:32:41', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(198, 236, 'stock-adjustment', 8, '2025-05-22T10:32:42.342Z', 'completed', '2025-05-22 12:32:43', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(199, 237, 'stock-adjustment', 1, '2025-05-22T10:32:47.425Z', 'completed', '2025-05-22 12:32:48', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(200, 238, 'stock-adjustment', 1, '2025-05-22T10:32:49.679Z', 'completed', '2025-05-22 12:32:50', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(201, 241, 'stock-adjustment', 1, '2025-05-22T10:32:52.733Z', 'completed', '2025-05-22 12:32:53', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(202, 189, 'stock-adjustment', 8, '2025-05-22T10:33:05.759Z', 'completed', '2025-05-22 12:33:06', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(203, 243, 'stock-adjustment', 3072, '2025-05-22T12:33:01.767Z', 'completed', '2025-05-22 14:33:56', '42eb4519-1f70-11f0-b081-d21cc41a9548', '2025-08-11 19:49:31', '42eb4519-1f70-11f0-b081-d21cc41a9548', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(204, 55, 'usage', 1, '2025-05-22T13:22:55.787Z', 'completed', '2025-05-22 15:17:51', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"400\", \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"Shamir\", \"requestedById\": 0}'),
(205, 55, 'usage', 1, '2025-05-22T13:22:55.787Z', 'completed', '2025-05-22 15:17:51', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"400\", \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"Shamir\", \"requestedById\": 0}'),
(206, 240, 'restock', 1, '2025-05-22T18:17:08.980Z', 'completed', '2025-05-22 20:17:27', '77536134-3738-11f0-a16e-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"condition\": \"New\", \"reasonCode\": \"Restock\", \"supplierId\": \"7\", \"requestedBy\": \"Zayd\", \"requestedById\": 0}'),
(207, 240, 'usage', 1, '2025-05-22T18:18:29.486Z', 'completed', '2025-05-22 20:18:39', '77536134-3738-11f0-a16e-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"Zayd\", \"requestedById\": 0}'),
(208, 30, 'stock-adjustment', 0, '2025-05-22T18:25:52.913Z', 'completed', '2025-05-22 20:25:55', '77536134-3738-11f0-a16e-d21cc41a9548', '2025-08-11 19:49:31', '77536134-3738-11f0-a16e-d21cc41a9548', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(209, 31, 'stock-adjustment', 0, '2025-05-22T18:26:03.553Z', 'completed', '2025-05-22 20:26:05', '77536134-3738-11f0-a16e-d21cc41a9548', '2025-08-11 19:49:31', '77536134-3738-11f0-a16e-d21cc41a9548', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Capture Error\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(210, 147, 'restock', 2, '2025-05-23T13:36:18.243Z', 'completed', '2025-05-23 15:30:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(211, 154, 'restock', 10, '2025-05-23T13:37:12.651Z', 'completed', '2025-05-23 15:31:26', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(212, 163, 'restock', 1, '2025-05-23T13:48:49.426Z', 'completed', '2025-05-23 15:42:54', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(213, 148, 'restock', 2, '2025-05-23T13:50:38.018Z', 'completed', '2025-05-23 15:44:52', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(214, 168, 'restock', 5, '2025-05-23T13:52:26.898Z', 'completed', '2025-05-23 15:46:32', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(215, 232, 'restock', 5, '2025-05-23T13:53:20.906Z', 'completed', '2025-05-23 15:47:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(216, 127, 'restock', 10, '2025-05-23T13:53:57.754Z', 'completed', '2025-05-23 15:48:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(217, 126, 'restock', 20, '2025-05-23T13:55:15.002Z', 'completed', '2025-05-23 15:49:17', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(218, 185, 'restock', 5, '2025-05-28T09:08:59.487Z', 'completed', '2025-05-28 11:14:57', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(219, 244, 'restock', 2, '2025-05-28T10:47:06.933Z', 'completed', '2025-05-28 12:41:16', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(220, 245, 'restock', 10, '2025-05-28T11:21:01.300Z', 'completed', '2025-05-28 13:15:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(221, 245, 'restock', 10, '2025-05-28T11:21:01.300Z', 'completed', '2025-05-28 13:15:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(222, 245, 'restock', 10, '2025-05-28T11:21:01.300Z', 'completed', '2025-05-28 13:15:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(223, 245, 'usage', 20, '2025-05-28T12:26:33.775Z', 'completed', '2025-05-28 14:27:32', '77536134-3738-11f0-a16e-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(224, 120, 'restock', 5, '2025-05-28T13:06:57.802Z', 'completed', '2025-05-28 15:02:09', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(225, 246, 'restock', 5, '2025-05-28T13:09:28.465Z', 'completed', '2025-05-28 15:03:33', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(226, 247, 'restock', 2, '2025-05-28T13:11:31.241Z', 'completed', '2025-05-28 15:05:42', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(227, 248, 'restock', 12, '2025-05-28T13:37:05.377Z', 'completed', '2025-05-28 15:33:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(228, 169, 'restock', 6, '2025-05-28T14:09:35.256Z', 'completed', '2025-05-28 16:03:46', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(229, 186, 'restock', 10, '2025-05-28T14:10:42.280Z', 'completed', '2025-05-28 16:04:48', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(230, 209, 'restock', 10, '2025-05-28T14:24:59.776Z', 'completed', '2025-05-28 16:21:03', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(231, 115, 'restock', 5, '2025-05-28T14:29:30.183Z', 'completed', '2025-05-28 16:23:43', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(232, 201, 'restock', 5, '2025-05-28T14:32:14.623Z', 'completed', '2025-05-28 16:26:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(233, 116, 'restock', 10, '2025-05-28T14:32:55.119Z', 'completed', '2025-05-28 16:26:57', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(234, 127, 'restock', 20, '2025-05-30T12:07:38.236Z', 'completed', '2025-05-30 14:01:50', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(235, 126, 'restock', 10, '2025-05-30T12:08:31.573Z', 'completed', '2025-05-30 14:02:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(236, 249, 'restock', 12, '2025-05-30T12:12:38.161Z', 'completed', '2025-05-30 14:06:58', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(237, 168, 'restock', 15, '2025-05-30T13:37:07.860Z', 'completed', '2025-05-30 15:31:12', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(238, 232, 'restock', 5, '2025-05-30T13:47:03.637Z', 'completed', '2025-05-30 15:41:36', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(239, 115, 'restock', 10, '2025-05-30T13:48:37.623Z', 'completed', '2025-05-30 15:43:43', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(240, 140, 'restock', 9, '2025-05-30T13:55:55.250Z', 'completed', '2025-05-30 15:50:15', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(241, 138, 'restock', 10, '2025-05-30T14:01:32.892Z', 'completed', '2025-05-30 15:55:51', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(242, 134, 'restock', 1, '2025-05-30T14:39:14.435Z', 'completed', '2025-05-30 16:34:12', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"room 1609\", \"requestedById\": 0}'),
(243, 136, 'restock', 1, '2025-05-30T14:40:44.814Z', 'completed', '2025-05-30 16:35:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"room 1609\", \"requestedById\": 0}'),
(244, 137, 'restock', 1, '2025-05-30T14:41:54.471Z', 'completed', '2025-05-30 16:37:12', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"room 1609\", \"requestedById\": 0}'),
(245, 251, 'restock', 4, '2025-05-30T14:53:24.743Z', 'completed', '2025-05-30 16:48:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"room 1609\", \"requestedById\": 0}'),
(246, 120, 'restock', 4, '2025-05-30T14:54:41.752Z', 'completed', '2025-05-30 16:49:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"room 1609\", \"requestedById\": 0}'),
(247, 190, 'restock', 6, '2025-05-30T14:56:19.889Z', 'completed', '2025-05-30 16:50:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"room 1609\", \"requestedById\": 0}'),
(248, 157, 'restock', 1, '2025-05-30T14:58:54.143Z', 'completed', '2025-05-30 16:55:15', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"room 1609\", \"requestedById\": 0}'),
(249, 168, 'restock', 1, '2025-05-30T15:01:53.812Z', 'completed', '2025-05-30 16:56:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"room 1609\", \"requestedById\": 0}'),
(250, 244, 'restock', 1, '2025-05-30T15:03:05.402Z', 'completed', '2025-05-30 16:57:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Other\", \"requestedBy\": \"room 1609\", \"requestedById\": 0}'),
(251, 257, 'restock', 11, '2025-06-02T12:48:59.873Z', 'completed', '2025-06-02 14:43:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(252, 252, 'restock', 10, '2025-06-02T12:50:59.781Z', 'completed', '2025-06-02 14:45:07', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(253, 253, 'restock', 4, '2025-06-02T12:51:34.079Z', 'completed', '2025-06-02 14:45:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(254, 254, 'restock', 1, '2025-06-02T12:52:14.344Z', 'completed', '2025-06-02 14:46:35', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(255, 255, 'restock', 2, '2025-06-02T12:53:03.771Z', 'completed', '2025-06-02 14:47:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(256, 256, 'restock', 1, '2025-06-02T12:54:08.661Z', 'completed', '2025-06-02 14:48:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(257, 258, 'restock', 2, '2025-06-02T13:07:52.012Z', 'completed', '2025-06-02 15:02:19', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(258, 259, 'restock', 2, '2025-06-02T13:08:55.217Z', 'completed', '2025-06-02 15:03:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(259, 260, 'restock', 2, '2025-06-02T13:09:45.643Z', 'completed', '2025-06-02 15:04:19', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(260, 261, 'restock', 2, '2025-06-02T13:13:50.288Z', 'completed', '2025-06-02 15:24:16', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(261, 262, 'restock', 4, '2025-06-02T13:30:59.929Z', 'completed', '2025-06-02 15:25:13', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(262, 263, 'restock', 2, '2025-06-02T13:31:54.553Z', 'completed', '2025-06-02 15:26:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(263, 264, 'restock', 4, '2025-06-02T13:34:32.864Z', 'completed', '2025-06-02 15:29:42', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(264, 265, 'restock', 4, '2025-06-02T13:36:16.751Z', 'completed', '2025-06-02 15:30:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(265, 266, 'restock', 14, '2025-06-02T13:38:19.884Z', 'completed', '2025-06-02 15:32:46', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609 & 1511\", \"requestedById\": 0}'),
(266, 267, 'restock', 1, '2025-06-02T13:45:43.753Z', 'completed', '2025-06-02 15:39:54', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"room 1609\", \"requestedById\": 0}'),
(267, 243, 'usage', 116, '2025-06-04T12:30:59.769Z', 'completed', '2025-06-04 14:35:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"694\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(268, 243, 'usage', 116, '2025-06-04T12:42:19.648Z', 'Completed', '2025-06-04 14:36:15', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [{\"comment\": \"3rd floor\", \"createdBy\": \"Noor Mohammed Kamdar\", \"createdDate\": \"2025-06-05T08:14:33.692Z\"}], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(269, 243, 'usage', 116, '2025-06-04T12:43:31.241Z', 'completed', '2025-06-04 14:37:54', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"696\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(270, 243, 'usage', 116, '2025-06-04T12:43:31.241Z', 'completed', '2025-06-04 14:37:54', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"696\", \"comments\": [{\"comment\": \"7th floor\", \"createdBy\": \"Noor Mohammed Kamdar\", \"createdDate\": \"2025-06-05T08:17:17.548Z\"}], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(271, 243, 'usage', 108, '2025-06-04T12:46:59.984Z', 'completed', '2025-06-04 14:41:19', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(272, 243, 'usage', 110, '2025-06-04T12:47:36.400Z', 'completed', '2025-06-04 14:41:57', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"698\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(273, 243, 'usage', 116, '2025-06-04T12:48:24.456Z', 'completed', '2025-06-04 14:42:44', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"700\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(274, 243, 'usage', 100, '2025-06-04T12:49:09.824Z', 'completed', '2025-06-04 14:43:33', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"701\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(275, 243, 'usage', 116, '2025-06-04T12:49:51.528Z', 'completed', '2025-06-04 14:44:14', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"702\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(276, 243, 'usage', 102, '2025-06-04T12:50:41.792Z', 'completed', '2025-06-04 14:45:01', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"703\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(277, 243, 'usage', 102, '2025-06-04T13:06:02.559Z', 'completed', '2025-06-04 15:00:16', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"703\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(278, 243, 'usage', 110, '2025-06-04T13:07:01.856Z', 'completed', '2025-06-04 15:02:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"704\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(279, 243, 'usage', 96, '2025-06-04T13:08:20.863Z', 'completed', '2025-06-04 15:02:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"706\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(280, 243, 'usage', 76, '2025-06-04T13:09:43.160Z', 'completed', '2025-06-04 15:04:01', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"707\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(281, 243, 'usage', 76, '2025-06-04T13:09:43.160Z', 'completed', '2025-06-04 15:04:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"707\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(282, 243, 'usage', 72, '2025-06-04T13:11:05.855Z', 'completed', '2025-06-04 15:06:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"708\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(283, 243, 'usage', 72, '2025-06-04T13:12:34.047Z', 'completed', '2025-06-04 15:06:43', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"709\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(284, 243, 'usage', 80, '2025-06-04T13:13:03.703Z', 'completed', '2025-06-04 15:07:35', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"710\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(285, 243, 'usage', 80, '2025-06-04T13:13:03.703Z', 'completed', '2025-06-04 15:07:35', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"710\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(286, 243, 'usage', 54, '2025-06-04T13:13:56.007Z', 'completed', '2025-06-04 15:08:19', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"711\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(287, 243, 'usage', 78, '2025-06-04T13:14:39.951Z', 'completed', '2025-06-04 15:08:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"712\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(288, 243, 'usage', 100, '2025-06-04T13:15:02.751Z', 'completed', '2025-06-04 15:09:36', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"713\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(289, 243, 'usage', 100, '2025-06-04T13:15:02.751Z', 'completed', '2025-06-04 15:09:36', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"713\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(290, 243, 'usage', 46, '2025-06-04T13:15:50.383Z', 'completed', '2025-06-04 15:10:09', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"714\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(291, 243, 'usage', 76, '2025-06-04T13:17:46.887Z', 'completed', '2025-06-04 15:17:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"715\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(292, 243, 'usage', 82, '2025-06-04T13:26:19.615Z', 'completed', '2025-06-04 15:21:39', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"716\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(293, 243, 'usage', 58, '2025-06-04T13:28:48.175Z', 'completed', '2025-06-04 15:23:24', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"717\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(294, 243, 'usage', 90, '2025-06-04T13:29:43.966Z', 'completed', '2025-06-04 15:23:50', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"718\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(295, 243, 'usage', 104, '2025-06-04T13:30:21.966Z', 'completed', '2025-06-04 15:24:42', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"719\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(296, 243, 'usage', 106, '2025-06-04T13:31:06.166Z', 'completed', '2025-06-04 15:25:31', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"720\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(297, 243, 'usage', 96, '2025-06-04T13:31:48.766Z', 'completed', '2025-06-04 15:26:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"721\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(298, 243, 'usage', 108, '2025-06-04T13:32:26.054Z', 'completed', '2025-06-04 15:26:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"722\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(299, 243, 'usage', 66, '2025-06-04T13:33:46.886Z', 'completed', '2025-06-04 15:28:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"723\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(300, 117, 'usage', 1, '2025-06-04T13:35:22.518Z', 'completed', '2025-06-04 15:30:05', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"584\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(301, 266, 'usage', 7, '2025-06-05T07:23:29.400Z', 'completed', '2025-06-05 09:18:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"707\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"room 1511\", \"requestedById\": 0}'),
(302, 258, 'usage', 1, '2025-06-05T07:25:30.272Z', 'completed', '2025-06-05 09:19:55', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"707\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"room 1511\", \"requestedById\": 0}'),
(303, 259, 'usage', 1, '2025-06-05T07:26:52.184Z', 'completed', '2025-06-05 09:22:06', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Raheed\", \"requestedById\": 0}'),
(304, 260, 'usage', 1, '2025-06-05T07:29:57.360Z', 'completed', '2025-06-05 09:24:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Raheed\", \"requestedById\": 0}'),
(305, 261, 'usage', 1, '2025-06-05T07:30:33.248Z', 'completed', '2025-06-05 09:24:49', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Raheed\", \"requestedById\": 0}'),
(306, 262, 'usage', 2, '2025-06-05T07:38:58.399Z', 'completed', '2025-06-05 09:33:02', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Raheed\", \"requestedById\": 0}'),
(307, 263, 'usage', 1, '2025-06-05T07:39:32.351Z', 'completed', '2025-06-05 09:33:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(308, 254, 'usage', 1, '2025-06-05T07:40:19.343Z', 'completed', '2025-06-05 09:34:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Raheed\", \"requestedById\": 0}'),
(309, 255, 'usage', 1, '2025-06-05T07:41:09.223Z', 'completed', '2025-06-05 09:35:17', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Raheed\", \"requestedById\": 0}'),
(310, 243, 'restock', 358, '2025-06-05T08:18:36.541Z', 'completed', '2025-06-05 10:19:21', '77536134-3738-11f0-a16e-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"condition\": \"New\", \"reasonCode\": \"Return\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(311, 243, 'usage', 86, '2025-06-05T08:19:55.711Z', 'completed', '2025-06-05 10:20:26', '77536134-3738-11f0-a16e-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"693\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Sne\", \"requestedById\": 0}'),
(312, 49, 'usage', 2, '2025-06-05T10:25:59.423Z', 'completed', '2025-06-05 12:20:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"98\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(313, 49, 'usage', 2, '2025-06-05T10:27:43.822Z', 'completed', '2025-06-05 12:21:52', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"411\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(314, 47, 'usage', 1, '2025-06-05T10:29:21.414Z', 'completed', '2025-06-05 12:23:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"98\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(315, 80, 'usage', 1, '2025-06-05T10:30:52.790Z', 'completed', '2025-06-05 12:25:02', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"98\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(316, 240, 'restock', 5, '2025-06-05T17:53:28.695Z', 'completed', '2025-06-05 19:53:37', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"Zayd\", \"requestedById\": 0}'),
(317, 240, 'usage', 1, '2025-06-05T17:53:39.567Z', 'completed', '2025-06-05 19:53:49', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"8\", \"comments\": [], \"reasonCode\": \"Replacement (Stolen)\", \"requestedBy\": \"Ndumiso MM\", \"requestedById\": 0}'),
(318, 115, 'usage', 1, '2025-06-06T08:28:20.016Z', 'completed', '2025-06-06 10:22:39', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"693\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(319, 38, 'usage', 1, '2025-06-06T08:31:01.336Z', 'completed', '2025-06-06 10:25:19', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"685\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(320, 39, 'usage', 1, '2025-06-06T08:31:39.727Z', 'completed', '2025-06-06 10:25:54', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"685\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(321, 232, 'usage', 1, '2025-06-06T13:43:51.998Z', 'completed', '2025-06-06 15:38:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"440\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(322, 154, 'usage', 1, '2025-06-06T13:44:26.894Z', 'completed', '2025-06-06 15:38:36', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"552\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(323, 154, 'usage', 1, '2025-06-06T13:47:38.662Z', 'completed', '2025-06-06 15:41:41', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"669\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(324, 1, 'usage', 1, '2025-06-06T13:54:35.334Z', 'completed', '2025-06-06 15:48:53', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"516\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(325, 2, 'usage', 1, '2025-06-06T13:55:17.310Z', 'completed', '2025-06-06 15:49:27', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"516\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(326, 3, 'usage', 1, '2025-06-06T13:57:28.534Z', 'completed', '2025-06-06 15:51:31', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"516\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"SBU\", \"requestedById\": 0}'),
(327, 113, 'usage', 1, '2025-06-06T14:02:03.853Z', 'completed', '2025-06-06 15:56:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"500\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(328, 47, 'usage', 1, '2025-06-06T14:03:30.005Z', 'completed', '2025-06-06 15:57:40', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"500\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(329, 75, 'usage', 10, '2025-06-06T14:04:09.741Z', 'completed', '2025-06-06 15:58:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"500\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}');
INSERT INTO `Transactions` (`id`, `stockItemId`, `transactionType`, `quantity`, `transactionDate`, `status`, `createdDate`, `createdBy`, `lastUpdatedDate`, `lastUpdatedBy`, `metadata`) VALUES
(330, 109, 'usage', 1, '2025-06-06T14:05:11.853Z', 'completed', '2025-06-06 15:59:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"500\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(331, 240, 'usage', 1, '2025-06-09T08:33:30.541Z', 'Completed', '2025-06-09 10:33:47', 'ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Reversal of duplication\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(332, 47, 'usage', 2, '2025-06-09T14:15:23.342Z', 'Completed', '2025-06-09 16:10:37', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(333, 75, 'usage', 25, '2025-06-09T14:17:14.462Z', 'Completed', '2025-06-09 16:11:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(334, 76, 'usage', 25, '2025-06-09T14:18:05.510Z', 'Completed', '2025-06-09 16:12:27', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(335, 80, 'usage', 1, '2025-06-09T14:19:20.270Z', 'Completed', '2025-06-09 16:14:28', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(336, 38, 'usage', 3, '2025-06-09T14:28:25.302Z', 'Completed', '2025-06-09 16:22:36', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Raheed\", \"requestedById\": 0}'),
(337, 18, 'usage', 5, '2025-06-09T14:29:10.077Z', 'Completed', '2025-06-09 16:23:11', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Raheed\", \"requestedById\": 0}'),
(338, 39, 'usage', 4, '2025-06-09T14:36:43.693Z', 'Completed', '2025-06-09 16:30:47', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Raheed\", \"requestedById\": 0}'),
(339, 25, 'usage', 1, '2025-06-09T14:37:47.029Z', 'Completed', '2025-06-09 16:32:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Raheed\", \"requestedById\": 0}'),
(340, 39, 'usage', 1, '2025-06-10T10:10:56.728Z', 'Completed', '2025-06-10 12:05:12', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"461\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(341, 39, 'usage', 1, '2025-06-10T10:11:44.728Z', 'Completed', '2025-06-10 12:05:48', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"402\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(342, 137, 'usage', 1, '2025-06-10T10:15:08.344Z', 'Completed', '2025-06-10 12:10:28', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"101\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(343, 47, 'usage', 1, '2025-06-10T10:50:04.350Z', 'Completed', '2025-06-10 12:44:07', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"420\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(344, 22, 'usage', 2, '2025-06-10T11:52:39.146Z', 'Completed', '2025-06-10 15:40:39', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"157\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(345, 22, 'usage', 2, '2025-06-10T13:46:55.308Z', 'Completed', '2025-06-10 15:41:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"163\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(346, 22, 'usage', 2, '2025-06-10T13:47:18.588Z', 'Completed', '2025-06-10 15:41:27', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"164\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(347, 22, 'usage', 4, '2025-06-10T13:47:43.844Z', 'Completed', '2025-06-10 15:41:46', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"166\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(348, 22, 'usage', 6, '2025-06-10T13:48:02.124Z', 'Completed', '2025-06-10 15:42:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"165\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(349, 22, 'usage', 7, '2025-06-10T13:48:43.492Z', 'Completed', '2025-06-10 15:42:46', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"168\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(350, 22, 'usage', 4, '2025-06-10T13:49:05.844Z', 'Completed', '2025-06-10 15:43:15', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"167\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(351, 22, 'usage', 4, '2025-06-10T13:49:33.156Z', 'Completed', '2025-06-10 15:43:51', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"169\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(352, 39, 'usage', 1, '2025-06-10T13:51:32.876Z', 'Completed', '2025-06-10 15:45:36', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"157\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(353, 39, 'usage', 1, '2025-06-10T13:51:53.060Z', 'Completed', '2025-06-10 15:46:09', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"164\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(354, 39, 'usage', 1, '2025-06-10T13:52:25.300Z', 'Completed', '2025-06-10 15:47:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"166\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(355, 39, 'usage', 2, '2025-06-10T13:53:36.156Z', 'Completed', '2025-06-10 15:47:47', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"165\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(356, 39, 'usage', 3, '2025-06-10T13:54:09.356Z', 'Completed', '2025-06-10 15:48:13', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"168\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(357, 39, 'usage', 2, '2025-06-10T13:54:40.948Z', 'Completed', '2025-06-10 15:48:52', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"169\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(358, 4, 'usage', 1, '2025-06-10T13:55:41.531Z', 'Completed', '2025-06-10 15:50:05', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"475\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(359, 1, 'usage', 1, '2025-06-10T13:57:54.171Z', 'Completed', '2025-06-10 15:52:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"402\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(360, 14, 'usage', 1, '2025-06-10T13:59:48.972Z', 'Completed', '2025-06-10 15:54:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"687\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(361, 10, 'usage', 1, '2025-06-10T14:00:44.371Z', 'Completed', '2025-06-10 15:54:53', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"607\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(362, 2, 'usage', 1, '2025-06-10T14:01:20.883Z', 'Completed', '2025-06-10 15:55:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"537\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(363, 4, 'usage', 1, '2025-06-10T14:02:57.843Z', 'Completed', '2025-06-10 15:57:03', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"550\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(364, 247, 'usage', 1, '2025-06-10T14:05:44.059Z', 'Completed', '2025-06-10 16:00:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"156\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(365, 123, 'usage', 1, '2025-06-10T14:06:39.011Z', 'Completed', '2025-06-10 16:00:54', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"598\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(366, 232, 'usage', 1, '2025-06-10T14:08:20.035Z', 'Completed', '2025-06-10 16:05:11', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"598\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(367, 115, 'usage', 1, '2025-06-10T14:12:04.987Z', 'Completed', '2025-06-10 16:06:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"630\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(368, 127, 'usage', 1, '2025-06-10T14:13:31.666Z', 'Completed', '2025-06-10 16:08:31', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"630\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(369, 126, 'usage', 1, '2025-06-10T15:17:49.967Z', 'Completed', '2025-06-10 17:12:03', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"630\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(370, 126, 'usage', 1, '2025-06-10T15:18:18.943Z', 'Completed', '2025-06-10 17:12:21', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"564\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(371, 126, 'usage', 1, '2025-06-10T15:18:36.879Z', 'Completed', '2025-06-10 17:12:39', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"611\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(372, 126, 'usage', 1, '2025-06-10T15:18:54.255Z', 'Completed', '2025-06-10 17:12:51', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"607\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(373, 126, 'usage', 1, '2025-06-10T15:19:07.287Z', 'Completed', '2025-06-10 17:13:07', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"601\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(374, 126, 'usage', 1, '2025-06-10T15:19:24.223Z', 'Completed', '2025-06-10 17:13:56', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"589\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(375, 126, 'usage', 1, '2025-06-10T15:20:12.063Z', 'Completed', '2025-06-10 17:14:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"585\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(376, 126, 'usage', 1, '2025-06-10T15:20:38.295Z', 'Completed', '2025-06-10 17:14:46', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"554\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(377, 25, 'usage', 1, '2025-06-12T09:00:10.133Z', 'Completed', '2025-06-12 10:54:43', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Themba\", \"requestedById\": 0}'),
(378, 4, 'usage', 1, '2025-06-12T10:26:17.648Z', 'Completed', '2025-06-12 12:21:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"480\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(379, 117, 'usage', 1, '2025-06-12T10:27:32.857Z', 'Completed', '2025-06-12 12:21:31', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"99\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(380, 2, 'usage', 1, '2025-06-12T10:28:05.776Z', 'Completed', '2025-06-12 12:22:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"99\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(381, 2, 'usage', 1, '2025-06-12T10:28:38.232Z', 'Completed', '2025-06-12 12:22:39', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"95\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(382, 3, 'usage', 1, '2025-06-12T10:29:16.176Z', 'Completed', '2025-06-12 12:23:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"95\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(383, 1, 'usage', 1, '2025-06-12T10:30:07.128Z', 'Completed', '2025-06-12 12:24:05', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"95\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(384, 4, 'usage', 1, '2025-06-12T10:32:25.304Z', 'Completed', '2025-06-12 12:33:21', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"640\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(385, 38, 'usage', 1, '2025-06-12T10:39:48.680Z', 'Completed', '2025-06-12 12:34:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"579\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(386, 39, 'usage', 2, '2025-06-12T10:42:47.552Z', 'Completed', '2025-06-12 12:37:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"453\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(387, 39, 'usage', 1, '2025-06-12T10:43:48.952Z', 'Completed', '2025-06-12 12:38:03', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"455\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(388, 39, 'usage', 1, '2025-06-12T10:44:35.736Z', 'Completed', '2025-06-12 12:38:48', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"457\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(389, 39, 'usage', 2, '2025-06-12T10:45:06.815Z', 'Completed', '2025-06-12 12:39:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"459\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(390, 39, 'usage', 2, '2025-06-12T10:45:41.192Z', 'Completed', '2025-06-12 12:40:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"465\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(391, 39, 'usage', 2, '2025-06-12T10:46:19.191Z', 'Completed', '2025-06-12 12:40:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"467\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(392, 125, 'usage', 1, '2025-06-12T11:01:56.543Z', 'Completed', '2025-06-12 12:56:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"110\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"MI\", \"requestedById\": 0}'),
(393, 243, 'restock', 11136, '2025-06-12T12:42:37.771Z', 'Completed', '2025-06-12 14:39:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(394, 243, 'usage', 116, '2025-06-12T13:53:55.261Z', 'Completed', '2025-06-12 15:48:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"694\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(395, 243, 'usage', 48, '2025-06-13T06:59:41.834Z', 'Completed', '2025-06-13 08:54:14', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"110\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Thando\", \"requestedById\": 0}'),
(396, 243, 'usage', 116, '2025-06-13T07:01:54.792Z', 'Completed', '2025-06-13 09:18:46', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"695\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(397, 243, 'usage', 116, '2025-06-13T07:29:50.313Z', 'Completed', '2025-06-13 09:24:01', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"696\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(398, 243, 'usage', 108, '2025-06-13T07:30:54.786Z', 'Completed', '2025-06-13 09:25:12', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(399, 243, 'usage', 110, '2025-06-13T07:31:36.875Z', 'Completed', '2025-06-13 09:25:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"698\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(400, 243, 'usage', 116, '2025-06-13T07:32:53.297Z', 'Completed', '2025-06-13 09:27:09', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"699\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(401, 243, 'usage', 116, '2025-06-13T07:33:35.439Z', 'Completed', '2025-06-13 09:27:53', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"700\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(402, 243, 'usage', 100, '2025-06-13T07:34:38.411Z', 'Completed', '2025-06-13 09:28:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"701\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(403, 243, 'usage', 116, '2025-06-13T07:35:49.412Z', 'Completed', '2025-06-13 09:29:58', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"702\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(404, 243, 'usage', 102, '2025-06-13T07:36:40.694Z', 'Completed', '2025-06-13 09:30:48', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"703\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(405, 243, 'usage', 110, '2025-06-13T07:37:21.465Z', 'Completed', '2025-06-13 09:31:47', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"704\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(406, 243, 'usage', 96, '2025-06-13T07:38:20.616Z', 'Completed', '2025-06-13 09:32:39', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"706\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(407, 243, 'usage', 76, '2025-06-13T07:39:07.520Z', 'Completed', '2025-06-13 09:33:10', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"707\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(408, 243, 'usage', 72, '2025-06-13T07:40:27.239Z', 'Completed', '2025-06-13 09:34:50', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"708\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(409, 243, 'usage', 72, '2025-06-13T07:41:15.553Z', 'Completed', '2025-06-13 09:35:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"709\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(410, 243, 'usage', 72, '2025-06-13T08:58:04.669Z', 'Completed', '2025-06-13 10:54:23', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"709\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(411, 243, 'usage', 80, '2025-06-13T09:00:52.765Z', 'Completed', '2025-06-13 10:56:13', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"710\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(412, 243, 'usage', 54, '2025-06-13T09:02:40.001Z', 'Completed', '2025-06-13 10:56:47', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"711\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(413, 243, 'usage', 78, '2025-06-13T09:03:14.167Z', 'Completed', '2025-06-13 10:57:21', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"712\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(414, 243, 'usage', 100, '2025-06-13T09:03:43.669Z', 'Completed', '2025-06-13 10:57:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"713\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(415, 243, 'usage', 46, '2025-06-13T09:04:42.335Z', 'Completed', '2025-06-13 10:59:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"714\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(416, 243, 'usage', 76, '2025-06-13T09:05:56.402Z', 'Completed', '2025-06-13 11:01:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"715\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(417, 243, 'usage', 76, '2025-06-13T09:11:00.457Z', 'Completed', '2025-06-13 11:05:21', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"715\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(418, 243, 'usage', 82, '2025-06-13T09:12:18.279Z', 'Completed', '2025-06-13 11:06:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"716\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(419, 243, 'usage', 58, '2025-06-13T09:12:55.678Z', 'Completed', '2025-06-13 11:07:50', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"717\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(420, 243, 'usage', 90, '2025-06-13T09:14:13.529Z', 'Completed', '2025-06-13 11:08:52', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"718\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(421, 243, 'usage', 104, '2025-06-13T09:15:16.301Z', 'Completed', '2025-06-13 11:09:24', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"719\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(422, 243, 'usage', 106, '2025-06-13T09:19:17.118Z', 'Completed', '2025-06-13 11:13:19', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"720\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(423, 243, 'usage', 96, '2025-06-13T09:19:51.820Z', 'Completed', '2025-06-13 11:13:58', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"721\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(424, 243, 'usage', 108, '2025-06-13T09:20:26.685Z', 'Completed', '2025-06-13 11:14:36', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"722\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(425, 243, 'usage', 66, '2025-06-13T09:21:06.744Z', 'Completed', '2025-06-13 11:15:11', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"723\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(426, 243, 'usage', 184, '2025-06-13T09:23:27.928Z', 'Completed', '2025-06-13 11:17:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"693\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(427, 269, 'restock', 4, '2025-06-19T11:06:18.342Z', 'Completed', '2025-06-19 13:01:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(428, 270, 'restock', 8, '2025-06-19T11:07:26.582Z', 'Completed', '2025-06-19 13:05:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(429, 271, 'restock', 1, '2025-06-19T11:11:25.205Z', 'Completed', '2025-06-19 13:06:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(430, 271, 'usage', 1, '2025-06-19T11:13:01.958Z', 'Completed', '2025-06-19 13:07:09', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(431, 270, 'usage', 8, '2025-06-19T11:13:36.455Z', 'Completed', '2025-06-19 13:07:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(432, 269, 'usage', 4, '2025-06-19T11:14:02.701Z', 'Completed', '2025-06-19 13:07:56', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(433, 243, 'usage', 116, '2025-06-19T11:15:42.821Z', 'Completed', '2025-06-19 13:09:51', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"694\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(434, 243, 'usage', 116, '2025-06-19T11:16:22.349Z', 'Completed', '2025-06-19 13:10:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"695\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(435, 243, 'usage', 116, '2025-06-19T11:16:49.941Z', 'Completed', '2025-06-19 13:10:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"696\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(436, 243, 'usage', 108, '2025-06-19T11:17:14.493Z', 'Completed', '2025-06-19 13:11:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(437, 243, 'usage', 110, '2025-06-19T11:17:40.805Z', 'Completed', '2025-06-19 13:11:47', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"698\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(438, 243, 'usage', 116, '2025-06-19T11:18:16.525Z', 'Completed', '2025-06-19 13:12:16', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"699\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(439, 243, 'usage', 116, '2025-06-19T11:19:30.901Z', 'Completed', '2025-06-19 13:13:29', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"700\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(440, 243, 'usage', 100, '2025-06-19T11:19:58.037Z', 'Completed', '2025-06-19 13:13:55', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"701\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(441, 243, 'usage', 116, '2025-06-19T11:20:24.989Z', 'Completed', '2025-06-19 13:14:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"702\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(442, 243, 'usage', 102, '2025-06-19T11:20:48.325Z', 'Completed', '2025-06-19 13:15:26', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"703\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(443, 243, 'usage', 110, '2025-06-19T11:22:03.437Z', 'Completed', '2025-06-19 13:16:07', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"704\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(444, 243, 'usage', 96, '2025-06-19T11:22:44.197Z', 'Completed', '2025-06-19 13:17:06', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"706\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(445, 243, 'usage', 76, '2025-06-19T11:23:40.373Z', 'Completed', '2025-06-19 13:18:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"707\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(446, 243, 'usage', 72, '2025-06-19T11:24:51.453Z', 'Completed', '2025-06-19 13:18:56', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"708\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(447, 243, 'usage', 72, '2025-06-19T11:25:16.605Z', 'Completed', '2025-06-19 13:19:14', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"709\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(448, 243, 'usage', 80, '2025-06-19T11:26:30.541Z', 'Completed', '2025-06-19 13:20:46', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"710\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(449, 243, 'usage', 54, '2025-06-19T11:27:12.268Z', 'Completed', '2025-06-19 13:21:16', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"711\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(450, 243, 'usage', 78, '2025-06-19T11:27:43.700Z', 'Completed', '2025-06-19 13:21:42', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"712\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(451, 243, 'usage', 100, '2025-06-19T11:28:08.596Z', 'Completed', '2025-06-19 13:22:07', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"713\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(452, 243, 'usage', 46, '2025-06-19T11:28:38.916Z', 'Completed', '2025-06-19 13:22:37', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"714\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(453, 243, 'usage', 76, '2025-06-19T11:29:04.228Z', 'Completed', '2025-06-19 13:23:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"715\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(454, 243, 'usage', 82, '2025-06-19T11:29:32.653Z', 'Completed', '2025-06-19 13:23:37', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"716\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(455, 243, 'usage', 58, '2025-06-19T11:30:35.324Z', 'Completed', '2025-06-19 13:24:32', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"717\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(456, 243, 'usage', 90, '2025-06-19T11:31:05.060Z', 'Completed', '2025-06-19 13:25:05', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"718\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(457, 243, 'usage', 104, '2025-06-19T11:31:25.492Z', 'Completed', '2025-06-19 13:25:24', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"719\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(458, 243, 'usage', 106, '2025-06-19T11:31:48.964Z', 'Completed', '2025-06-19 13:25:51', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"720\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(459, 243, 'usage', 96, '2025-06-19T11:32:19.884Z', 'Completed', '2025-06-19 13:26:17', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"721\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(460, 243, 'usage', 108, '2025-06-19T11:32:41.596Z', 'Completed', '2025-06-19 13:26:41', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"722\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(461, 243, 'usage', 66, '2025-06-19T11:33:08.364Z', 'Completed', '2025-06-19 13:27:03', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"723\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(462, 243, 'usage', 86, '2025-06-19T11:41:36.084Z', 'Completed', '2025-06-19 13:35:40', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"693\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(463, 127, 'usage', 1, '2025-06-19T11:43:45.627Z', 'Completed', '2025-06-19 13:38:02', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"97\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(464, 127, 'usage', 1, '2025-06-19T11:44:23.099Z', 'Completed', '2025-06-19 13:38:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"109\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(465, 127, 'usage', 1, '2025-06-19T11:44:39.579Z', 'Completed', '2025-06-19 13:38:35', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"401\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(466, 127, 'usage', 1, '2025-06-19T11:44:57.227Z', 'Completed', '2025-06-19 13:38:53', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"157\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(467, 127, 'usage', 1, '2025-06-19T11:45:14.323Z', 'Completed', '2025-06-19 13:39:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"161\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(468, 127, 'usage', 1, '2025-06-19T11:46:03.339Z', 'Completed', '2025-06-19 13:40:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"83\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(469, 127, 'usage', 1, '2025-06-19T11:46:21.435Z', 'Completed', '2025-06-19 13:40:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"589\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(470, 127, 'usage', 1, '2025-06-19T11:46:39.467Z', 'Completed', '2025-06-19 13:40:35', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"665\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(471, 127, 'usage', 1, '2025-06-19T11:46:58.635Z', 'Completed', '2025-06-19 13:40:57', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"567\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(472, 127, 'usage', 1, '2025-06-19T11:47:19.371Z', 'Completed', '2025-06-19 13:41:21', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"554\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(473, 127, 'usage', 1, '2025-06-19T11:47:42.699Z', 'Completed', '2025-06-19 13:41:37', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"507\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(474, 127, 'usage', 1, '2025-06-19T11:47:59.531Z', 'Completed', '2025-06-19 13:41:54', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"517\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(475, 127, 'usage', 1, '2025-06-19T11:48:16.235Z', 'Completed', '2025-06-19 13:42:09', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"526\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(476, 126, 'usage', 1, '2025-06-19T11:49:03.203Z', 'Completed', '2025-06-19 13:43:02', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"97\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(477, 126, 'usage', 1, '2025-06-19T12:00:59.387Z', 'Completed', '2025-06-19 13:54:55', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"97\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(478, 126, 'usage', 1, '2025-06-19T12:01:19.466Z', 'Completed', '2025-06-19 13:55:12', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"109\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(479, 126, 'usage', 1, '2025-06-19T12:01:35.595Z', 'Completed', '2025-06-19 13:55:32', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"401\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(480, 126, 'usage', 1, '2025-06-19T12:01:52.074Z', 'Completed', '2025-06-19 13:56:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"157\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(481, 126, 'usage', 1, '2025-06-19T12:02:22.106Z', 'Completed', '2025-06-19 13:56:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"161\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(482, 126, 'usage', 1, '2025-06-19T12:02:40.922Z', 'Completed', '2025-06-19 13:56:33', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"83\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(483, 126, 'usage', 1, '2025-06-19T12:02:55.354Z', 'Completed', '2025-06-19 13:56:49', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"589\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(484, 126, 'usage', 1, '2025-06-19T12:03:10.690Z', 'Completed', '2025-06-19 13:57:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"665\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(485, 126, 'usage', 1, '2025-06-19T12:03:30.866Z', 'Completed', '2025-06-19 13:57:23', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"567\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(486, 126, 'usage', 1, '2025-06-19T12:03:44.714Z', 'Completed', '2025-06-19 13:57:35', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"554\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(487, 126, 'usage', 1, '2025-06-19T12:03:58.242Z', 'Completed', '2025-06-19 13:57:58', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"507\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(488, 126, 'usage', 1, '2025-06-19T12:04:18.298Z', 'Completed', '2025-06-19 13:58:11', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"517\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(489, 126, 'usage', 1, '2025-06-19T12:04:33.138Z', 'Completed', '2025-06-19 13:58:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"526\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(490, 22, 'usage', 10, '2025-06-19T12:06:06.706Z', 'Completed', '2025-06-19 14:00:10', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"136\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(491, 22, 'usage', 3, '2025-06-19T12:06:30.570Z', 'Completed', '2025-06-19 14:00:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"153\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(492, 22, 'usage', 1, '2025-06-19T12:06:53.402Z', 'Completed', '2025-06-19 14:00:54', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"145\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(493, 39, 'usage', 2, '2025-06-19T12:07:29.706Z', 'Completed', '2025-06-19 14:01:37', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"136\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(494, 39, 'usage', 2, '2025-06-19T12:07:57.282Z', 'Completed', '2025-06-19 14:01:50', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"149\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(495, 9, 'usage', 1, '2025-06-19T12:08:45.762Z', 'Completed', '2025-06-19 14:02:42', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"136\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}');
INSERT INTO `Transactions` (`id`, `stockItemId`, `transactionType`, `quantity`, `transactionDate`, `status`, `createdDate`, `createdBy`, `lastUpdatedDate`, `lastUpdatedBy`, `metadata`) VALUES
(496, 9, 'usage', 1, '2025-06-19T12:09:02.594Z', 'Completed', '2025-06-19 14:03:03', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"151\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(497, 257, 'usage', 1, '2025-06-19T12:09:43.786Z', 'Completed', '2025-06-19 14:03:44', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"138\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(498, 52, 'usage', 2, '2025-06-19T13:56:13.724Z', 'Completed', '2025-06-19 15:50:55', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"451\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(499, 52, 'usage', 2, '2025-06-19T13:57:18.476Z', 'Completed', '2025-06-19 15:51:27', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"407\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(500, 52, 'usage', 2, '2025-06-19T13:57:49.620Z', 'Completed', '2025-06-19 15:51:50', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"96\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(501, 49, 'usage', 2, '2025-06-19T13:58:28.516Z', 'Completed', '2025-06-19 15:52:24', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"440\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(502, 47, 'usage', 1, '2025-06-19T13:59:02.620Z', 'Completed', '2025-06-19 15:53:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(503, 75, 'usage', 15, '2025-06-19T14:00:17.708Z', 'Completed', '2025-06-19 15:54:37', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(504, 47, 'usage', 1, '2025-06-19T14:01:33.764Z', 'Completed', '2025-06-19 15:56:05', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"95\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Spha\", \"requestedById\": 0}'),
(505, 228, 'usage', 1, '2025-06-19T14:09:44.771Z', 'Completed', '2025-06-19 16:05:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"648\", \"comments\": [{\"comment\": \"Serial # C467765\", \"createdBy\": \"Sne Khuzwayo\", \"createdDate\": \"2025-06-19T14:11:25.533Z\"}], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(506, 228, 'usage', 1, '2025-06-19T14:11:40.371Z', 'Completed', '2025-06-19 16:06:55', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"646\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(507, 5, 'usage', 1, '2025-06-19T14:13:41.563Z', 'Completed', '2025-06-19 16:07:41', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"149\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(508, 1, 'usage', 1, '2025-06-19T14:14:12.811Z', 'Completed', '2025-06-19 16:20:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"646\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(509, 1, 'usage', 1, '2025-06-19T14:27:19.434Z', 'Completed', '2025-06-19 16:21:26', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"447\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(510, 39, 'usage', 1, '2025-06-20T14:27:20.163Z', 'Completed', '2025-06-20 16:21:35', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"461\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(511, 39, 'usage', 1, '2025-06-20T14:27:56.684Z', 'Completed', '2025-06-20 16:22:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"410\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(512, 39, 'usage', 1, '2025-06-20T14:28:29.259Z', 'Completed', '2025-06-20 16:22:26', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"648\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(513, 215, 'usage', 1, '2025-06-20T14:30:25.147Z', 'Completed', '2025-06-20 16:24:39', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"648\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(514, 149, 'usage', 4, '2025-06-20T14:31:12.035Z', 'Completed', '2025-06-20 16:25:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"648\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(515, 191, 'usage', 4, '2025-06-20T14:31:52.059Z', 'Completed', '2025-06-20 16:25:49', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"648\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(516, 150, 'usage', 2, '2025-06-20T14:33:07.427Z', 'Completed', '2025-06-20 16:27:09', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"648\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(517, 150, 'usage', 2, '2025-06-20T14:33:46.747Z', 'Completed', '2025-06-20 16:27:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"646\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(518, 215, 'usage', 1, '2025-06-20T14:34:28.731Z', 'Completed', '2025-06-20 16:28:40', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"646\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(519, 149, 'usage', 4, '2025-06-20T14:35:30.075Z', 'Completed', '2025-06-20 16:29:29', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"646\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(520, 191, 'usage', 4, '2025-06-20T14:36:38.675Z', 'Completed', '2025-06-20 16:30:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"646\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(521, 244, 'usage', 1, '2025-06-20T14:37:16.171Z', 'Completed', '2025-06-20 16:31:26', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"646\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(522, 148, 'usage', 1, '2025-06-20T14:38:01.699Z', 'Completed', '2025-06-20 16:32:27', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"646\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(523, 117, 'usage', 1, '2025-06-20T14:39:00.138Z', 'Completed', '2025-06-20 16:33:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"663\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(524, 117, 'usage', 1, '2025-06-20T14:39:45.411Z', 'Completed', '2025-06-20 16:33:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"646\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(525, 22, 'usage', 4, '2025-06-26T11:09:41.672Z', 'Completed', '2025-06-26 13:04:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"155\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(526, 22, 'usage', 1, '2025-06-26T11:10:28.656Z', 'Completed', '2025-06-26 13:04:21', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"420\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(527, 39, 'usage', 1, '2025-06-26T11:11:51.168Z', 'Completed', '2025-06-26 13:05:46', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"149\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(528, 123, 'usage', 1, '2025-06-26T12:03:26.613Z', 'Completed', '2025-06-26 13:57:43', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"516\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(529, 127, 'usage', 1, '2025-06-26T12:04:37.037Z', 'Completed', '2025-06-26 13:58:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"516\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(530, 127, 'usage', 1, '2025-06-26T12:05:08.549Z', 'Completed', '2025-06-26 13:59:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"517\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(531, 126, 'usage', 1, '2025-06-26T12:05:57.293Z', 'Completed', '2025-06-26 13:59:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"516\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(532, 126, 'usage', 1, '2025-06-26T12:06:09.261Z', 'Completed', '2025-06-26 13:59:57', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"517\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(533, 168, 'usage', 1, '2025-06-26T12:06:33.285Z', 'Completed', '2025-06-26 14:00:28', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"694\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(534, 123, 'usage', 1, '2025-06-26T12:07:15.693Z', 'Completed', '2025-06-26 14:01:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"652\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(535, 140, 'usage', 1, '2025-06-26T12:07:52.397Z', 'Completed', '2025-06-26 14:01:43', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"421\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(536, 148, 'usage', 1, '2025-06-26T12:08:44.813Z', 'Completed', '2025-06-26 14:02:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"557\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(537, 244, 'usage', 1, '2025-06-26T12:09:26.517Z', 'Completed', '2025-06-26 14:03:21', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"557\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(538, 168, 'usage', 1, '2025-06-26T12:10:31.261Z', 'Completed', '2025-06-26 14:04:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"503\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(539, 168, 'usage', 2, '2025-06-26T12:10:44.157Z', 'Completed', '2025-06-26 14:04:52', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"693\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(540, 168, 'usage', 1, '2025-06-26T12:11:19.245Z', 'Completed', '2025-06-26 14:05:13', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"627\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(541, 127, 'usage', 1, '2025-06-26T12:51:49.020Z', 'Completed', '2025-06-26 14:46:01', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"564\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(542, 127, 'usage', 1, '2025-06-26T12:52:27.739Z', 'Completed', '2025-06-26 14:46:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"611\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(543, 127, 'usage', 1, '2025-06-26T12:52:45.082Z', 'Completed', '2025-06-26 14:46:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"607\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(544, 127, 'usage', 1, '2025-06-26T12:52:58.258Z', 'Completed', '2025-06-26 14:46:50', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"601\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(545, 127, 'usage', 1, '2025-06-26T12:53:13.954Z', 'Completed', '2025-06-26 14:47:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"589\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(546, 127, 'usage', 1, '2025-06-26T12:53:31.362Z', 'Completed', '2025-06-26 14:47:24', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"585\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(547, 127, 'usage', 1, '2025-06-26T12:53:53.266Z', 'Completed', '2025-06-26 14:47:43', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"554\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(548, 47, 'usage', 1, '2025-06-26T13:03:07.251Z', 'Completed', '2025-06-26 14:56:57', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"672\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(549, 243, 'usage', 116, '2025-06-26T13:19:36.553Z', 'Completed', '2025-06-26 15:13:36', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"694\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(550, 243, 'usage', 116, '2025-06-26T13:20:08.841Z', 'Completed', '2025-06-26 15:13:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"695\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(551, 243, 'usage', 116, '2025-06-26T13:20:29.433Z', 'Completed', '2025-06-26 15:14:24', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"696\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(552, 243, 'usage', 108, '2025-06-26T13:20:55.297Z', 'Completed', '2025-06-26 15:14:46', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(553, 243, 'usage', 110, '2025-06-26T13:21:16.329Z', 'Completed', '2025-06-26 15:15:17', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"698\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(554, 243, 'usage', 116, '2025-06-26T13:21:50.921Z', 'Completed', '2025-06-26 15:15:40', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"699\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(555, 243, 'usage', 116, '2025-06-26T13:22:12.201Z', 'Completed', '2025-06-26 15:16:02', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"700\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(556, 243, 'usage', 100, '2025-06-26T13:22:31.609Z', 'Completed', '2025-06-26 15:16:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"701\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(557, 243, 'usage', 116, '2025-06-26T13:22:57.041Z', 'Completed', '2025-06-26 15:16:47', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"702\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(558, 243, 'usage', 102, '2025-06-26T13:23:18.977Z', 'Completed', '2025-06-26 15:17:21', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"703\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(559, 243, 'usage', 110, '2025-06-26T13:23:51.337Z', 'Completed', '2025-06-26 15:17:47', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"704\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(560, 243, 'usage', 96, '2025-06-26T13:24:19.025Z', 'Completed', '2025-06-26 15:18:11', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"706\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(561, 243, 'usage', 76, '2025-06-26T13:24:42.921Z', 'Completed', '2025-06-26 15:18:35', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"707\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(562, 243, 'usage', 72, '2025-06-26T13:25:05.657Z', 'Completed', '2025-06-26 15:18:58', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"708\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(563, 243, 'usage', 72, '2025-06-26T13:25:30.649Z', 'Completed', '2025-06-26 15:19:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"709\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(564, 243, 'usage', 80, '2025-06-26T13:25:55.385Z', 'Completed', '2025-06-26 15:19:47', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"710\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(565, 243, 'usage', 80, '2025-06-26T13:26:41.033Z', 'Completed', '2025-06-26 15:20:29', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"710\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(566, 243, 'usage', 54, '2025-06-26T13:32:04.601Z', 'Completed', '2025-06-26 15:25:54', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"711\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(567, 243, 'usage', 78, '2025-06-26T13:32:24.576Z', 'Completed', '2025-06-26 15:26:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"712\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(568, 243, 'usage', 100, '2025-06-26T13:32:55.521Z', 'Completed', '2025-06-26 15:27:05', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"713\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(569, 243, 'usage', 46, '2025-06-26T13:33:38.832Z', 'Completed', '2025-06-26 15:27:31', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"714\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(570, 243, 'usage', 76, '2025-06-26T13:34:05.209Z', 'Completed', '2025-06-26 15:27:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"715\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(571, 243, 'usage', 82, '2025-06-26T13:34:32.201Z', 'Completed', '2025-06-26 15:28:36', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"716\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(572, 243, 'usage', 58, '2025-06-26T13:35:00.480Z', 'Completed', '2025-06-26 15:30:56', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"717\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(573, 243, 'usage', 90, '2025-06-26T13:37:29.272Z', 'Completed', '2025-06-26 15:31:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"718\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(574, 243, 'usage', 104, '2025-06-26T13:39:34.040Z', 'Completed', '2025-06-26 15:33:50', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"719\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(575, 243, 'usage', 106, '2025-06-26T13:40:35.737Z', 'Completed', '2025-06-26 15:34:32', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"720\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(576, 243, 'usage', 96, '2025-06-26T13:41:06.640Z', 'Completed', '2025-06-26 15:34:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"721\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(577, 243, 'usage', 108, '2025-06-26T13:41:31.936Z', 'Completed', '2025-06-26 15:35:21', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"722\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(578, 243, 'usage', 66, '2025-06-26T13:41:51.776Z', 'Completed', '2025-06-26 15:37:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"723\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(579, 243, 'usage', 86, '2025-06-26T13:43:48.496Z', 'Completed', '2025-06-26 15:37:47', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"693\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(580, 249, 'usage', 1, '2025-06-27T13:45:39.183Z', 'Completed', '2025-06-27 15:39:42', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"693\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(581, 115, 'restock', 35, '2025-07-04T12:21:39.877Z', 'Completed', '2025-07-04 14:16:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(582, 39, 'usage', 3, '2025-07-07T09:13:25.859Z', 'Completed', '2025-07-07 11:53:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"513\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(583, 47, 'usage', 2, '2025-07-11T10:05:36.002Z', 'Completed', '2025-07-11 11:59:31', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(584, 267, 'restock', 6, '2025-07-11T11:23:42.949Z', 'Completed', '2025-07-11 13:21:06', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(585, 272, 'restock', 7, '2025-07-11T11:32:55.685Z', 'Completed', '2025-07-11 13:27:06', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(586, 273, 'restock', 1, '2025-07-11T11:35:28.716Z', 'Completed', '2025-07-11 13:29:28', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(587, 274, 'restock', 1, '2025-07-11T11:37:15.084Z', 'Completed', '2025-07-11 13:31:15', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(588, 39, 'usage', 1, '2025-07-11T11:43:54.172Z', 'Completed', '2025-07-11 13:37:44', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"141\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(589, 39, 'usage', 2, '2025-07-11T11:44:19.748Z', 'Completed', '2025-07-11 13:38:07', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"150\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(590, 39, 'usage', 1, '2025-07-11T11:44:42.004Z', 'Completed', '2025-07-11 13:38:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"146\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(591, 39, 'usage', 2, '2025-07-11T11:44:56.780Z', 'Completed', '2025-07-11 13:38:40', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"153\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(592, 39, 'usage', 2, '2025-07-11T11:45:14.524Z', 'Completed', '2025-07-11 14:21:48', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"90\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(593, 39, 'usage', 1, '2025-07-11T12:28:23.610Z', 'Completed', '2025-07-11 14:22:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"84\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(594, 39, 'usage', 2, '2025-07-11T12:28:57.546Z', 'Completed', '2025-07-11 14:22:42', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"92\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(595, 39, 'usage', 2, '2025-07-11T12:29:46.458Z', 'Completed', '2025-07-11 14:23:31', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"92\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(596, 39, 'usage', 1, '2025-07-11T12:30:07.929Z', 'Completed', '2025-07-11 14:25:14', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"95\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(597, 39, 'usage', 1, '2025-07-11T12:31:49.929Z', 'Completed', '2025-07-11 14:25:49', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"101\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(598, 39, 'usage', 1, '2025-07-11T12:32:25.585Z', 'Completed', '2025-07-11 14:26:32', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"106\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(599, 39, 'usage', 2, '2025-07-11T12:33:06.905Z', 'Completed', '2025-07-11 14:26:48', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"108\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(600, 39, 'usage', 4, '2025-07-11T13:43:15.141Z', 'Completed', '2025-07-11 15:38:41', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"485\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(601, 39, 'usage', 1, '2025-07-11T13:45:20.725Z', 'Completed', '2025-07-11 15:39:02', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"566\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(602, 39, 'usage', 1, '2025-07-11T13:45:43.157Z', 'Completed', '2025-07-11 15:39:41', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"661\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(603, 39, 'usage', 4, '2025-07-11T13:46:20.805Z', 'Completed', '2025-07-11 15:40:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"556\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(604, 39, 'usage', 1, '2025-07-11T13:46:40.797Z', 'Completed', '2025-07-11 15:40:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"560\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(605, 39, 'usage', 2, '2025-07-11T13:47:04.525Z', 'Completed', '2025-07-11 15:40:57', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"569\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(606, 39, 'usage', 1, '2025-07-11T13:47:32.470Z', 'Completed', '2025-07-11 15:41:14', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"491\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(607, 39, 'usage', 1, '2025-07-11T13:47:46.493Z', 'Completed', '2025-07-11 15:41:28', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"490\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(608, 39, 'usage', 1, '2025-07-11T13:48:01.781Z', 'Completed', '2025-07-11 15:41:43', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"489\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(609, 39, 'usage', 2, '2025-07-11T13:48:27.077Z', 'Completed', '2025-07-11 15:42:13', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"487\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(610, 39, 'usage', 1, '2025-07-11T13:48:47.029Z', 'Completed', '2025-07-11 15:42:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"647\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(611, 39, 'usage', 1, '2025-07-11T13:49:18.005Z', 'Completed', '2025-07-11 15:43:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"649\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(612, 39, 'usage', 1, '2025-07-11T13:49:34.573Z', 'Completed', '2025-07-11 15:43:14', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"636\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(613, 39, 'usage', 1, '2025-07-11T13:49:57.877Z', 'Completed', '2025-07-11 15:43:46', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"633\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(614, 39, 'usage', 1, '2025-07-11T13:50:19.645Z', 'Completed', '2025-07-11 15:44:03', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"610\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(615, 39, 'usage', 2, '2025-07-11T14:05:30.430Z', 'Completed', '2025-07-11 15:59:14', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"611\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(616, 39, 'usage', 1, '2025-07-11T14:05:47.843Z', 'Completed', '2025-07-11 16:00:35', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"645\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(617, 39, 'usage', 1, '2025-07-11T14:07:37.381Z', 'Completed', '2025-07-11 16:01:43', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"620\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(618, 39, 'usage', 2, '2025-07-11T14:08:18.948Z', 'Completed', '2025-07-11 16:02:01', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"622\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(619, 39, 'usage', 1, '2025-07-11T14:08:37.948Z', 'Completed', '2025-07-11 16:02:26', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"607\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(620, 39, 'usage', 1, '2025-07-11T14:09:01.988Z', 'Completed', '2025-07-11 16:02:49', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"606\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(621, 39, 'usage', 1, '2025-07-11T14:14:40.084Z', 'Completed', '2025-07-11 16:08:36', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"602\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(622, 39, 'usage', 2, '2025-07-11T14:15:09.708Z', 'Completed', '2025-07-11 16:08:55', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"598\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(623, 39, 'usage', 1, '2025-07-11T14:15:29.020Z', 'Completed', '2025-07-11 16:09:10', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"594\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(624, 39, 'usage', 1, '2025-07-11T14:15:46.780Z', 'Completed', '2025-07-11 16:09:35', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"593\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(625, 39, 'usage', 1, '2025-07-11T14:19:03.204Z', 'Completed', '2025-07-11 17:01:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"587\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(626, 39, 'usage', 1, '2025-07-11T15:08:13.865Z', 'Completed', '2025-07-11 17:01:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"585\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(627, 39, 'usage', 1, '2025-07-11T15:08:32.225Z', 'Completed', '2025-07-11 17:02:14', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"582\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(628, 39, 'usage', 1, '2025-07-11T15:08:48.321Z', 'Completed', '2025-07-11 17:02:27', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"580\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(629, 39, 'usage', 1, '2025-07-11T15:09:11.433Z', 'Completed', '2025-07-11 17:02:52', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"570\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(630, 39, 'usage', 1, '2025-07-11T15:09:25.889Z', 'Completed', '2025-07-11 17:03:03', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"576\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(631, 39, 'usage', 5, '2025-07-11T15:09:37.273Z', 'Completed', '2025-07-11 17:03:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"692\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(632, 39, 'usage', 2, '2025-07-11T15:09:54.361Z', 'Completed', '2025-07-11 17:03:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"687\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(633, 39, 'usage', 1, '2025-07-11T15:10:08.729Z', 'Completed', '2025-07-11 17:03:53', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"685\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(634, 39, 'usage', 1, '2025-07-11T15:10:26.065Z', 'Completed', '2025-07-11 17:04:05', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"690\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(635, 39, 'usage', 2, '2025-07-11T15:10:38.729Z', 'Completed', '2025-07-11 17:04:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"670\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(636, 39, 'usage', 1, '2025-07-11T15:10:52.825Z', 'Completed', '2025-07-11 17:05:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"654\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(637, 39, 'usage', 1, '2025-07-11T15:11:59.353Z', 'Completed', '2025-07-11 17:05:42', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"664\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(638, 39, 'usage', 1, '2025-07-11T15:12:17.721Z', 'Completed', '2025-07-11 17:05:56', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"640\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(639, 38, 'usage', 1, '2025-07-14T10:48:34.467Z', 'Completed', '2025-07-14 12:44:33', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"500\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(640, 38, 'usage', 1, '2025-07-14T10:51:08.870Z', 'Completed', '2025-07-14 12:45:14', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"494\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(641, 38, 'usage', 1, '2025-07-14T10:51:51.474Z', 'Completed', '2025-07-14 12:46:23', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"492\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(642, 38, 'usage', 1, '2025-07-14T10:53:06.030Z', 'Completed', '2025-07-14 12:47:57', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"489\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(643, 38, 'usage', 1, '2025-07-14T10:54:37.144Z', 'Completed', '2025-07-14 12:48:31', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"641\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(644, 38, 'usage', 1, '2025-07-14T10:55:05.953Z', 'Completed', '2025-07-14 12:49:27', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"575\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(645, 38, 'usage', 3, '2025-07-14T10:56:02.182Z', 'Completed', '2025-07-14 12:49:52', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"690\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(646, 266, 'usage', 1, '2025-07-14T10:57:41.723Z', 'Completed', '2025-07-14 12:52:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"677\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(647, 266, 'usage', 1, '2025-07-14T10:58:55.236Z', 'Completed', '2025-07-14 12:53:03', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"638\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(648, 4, 'usage', 1, '2025-07-14T10:59:57.186Z', 'Completed', '2025-07-14 12:53:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"608\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(649, 6, 'usage', 1, '2025-07-14T11:00:36.155Z', 'Completed', '2025-07-14 12:54:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"618\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(650, 6, 'usage', 1, '2025-07-14T11:01:05.045Z', 'Completed', '2025-07-14 12:55:05', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"594\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(651, 7, 'usage', 1, '2025-07-14T11:04:57.873Z', 'Completed', '2025-07-14 12:58:52', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"502\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(652, 7, 'usage', 1, '2025-07-14T11:05:32.467Z', 'Completed', '2025-07-14 12:59:22', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"566\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(653, 7, 'usage', 1, '2025-07-14T11:05:57.104Z', 'Completed', '2025-07-14 12:59:40', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"592\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(654, 14, 'usage', 1, '2025-07-14T11:07:34.645Z', 'Completed', '2025-07-14 13:01:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"497\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(655, 127, 'usage', 1, '2025-07-14T11:21:17.082Z', 'Completed', '2025-07-14 13:15:05', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"530\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(656, 127, 'usage', 1, '2025-07-14T11:21:41.061Z', 'Completed', '2025-07-14 13:15:40', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"517\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(657, 127, 'usage', 1, '2025-07-14T11:22:15.632Z', 'Completed', '2025-07-14 13:16:03', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"497\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(658, 127, 'usage', 1, '2025-07-14T11:22:41.139Z', 'Completed', '2025-07-14 13:16:31', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"580\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(659, 127, 'usage', 1, '2025-07-14T11:23:06.550Z', 'Completed', '2025-07-14 13:16:58', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"594\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(660, 126, 'usage', 1, '2025-07-14T11:24:01.879Z', 'Completed', '2025-07-14 13:17:47', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"530\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}');
INSERT INTO `Transactions` (`id`, `stockItemId`, `transactionType`, `quantity`, `transactionDate`, `status`, `createdDate`, `createdBy`, `lastUpdatedDate`, `lastUpdatedBy`, `metadata`) VALUES
(661, 126, 'usage', 1, '2025-07-14T11:24:22.226Z', 'Completed', '2025-07-14 13:18:09', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"517\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(662, 126, 'usage', 1, '2025-07-14T11:24:45.023Z', 'Completed', '2025-07-14 13:18:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"497\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(663, 126, 'usage', 1, '2025-07-14T11:25:00.410Z', 'Completed', '2025-07-14 13:18:41', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"580\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(664, 126, 'usage', 1, '2025-07-14T11:25:16.523Z', 'Completed', '2025-07-14 13:18:58', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"594\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(665, 125, 'usage', 1, '2025-07-14T11:36:44.364Z', 'Completed', '2025-07-14 13:30:41', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"541\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(666, 125, 'usage', 1, '2025-07-14T11:37:15.546Z', 'Completed', '2025-07-14 13:31:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"483\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(667, 125, 'usage', 1, '2025-07-14T11:37:35.507Z', 'Completed', '2025-07-14 13:31:13', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"679\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(668, 125, 'usage', 1, '2025-07-14T11:37:47.949Z', 'Completed', '2025-07-14 13:31:29', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"598\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(669, 47, 'usage', 1, '2025-07-14T13:26:50.066Z', 'Completed', '2025-07-14 15:20:35', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Spha\", \"requestedById\": 0}'),
(670, 71, 'restock', 3, '2025-07-16T11:14:50.205Z', 'Completed', '2025-07-16 13:08:33', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(671, 275, 'restock', 1, '2025-07-16T11:18:16.885Z', 'Completed', '2025-07-16 13:12:01', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(672, 96, 'restock', 1, '2025-07-16T11:18:56.749Z', 'Completed', '2025-07-16 13:12:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(673, 107, 'restock', 4, '2025-07-16T11:19:16.709Z', 'Completed', '2025-07-16 13:12:58', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(674, 89, 'restock', 1, '2025-07-16T12:45:50.768Z', 'Completed', '2025-07-16 14:39:27', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(675, 79, 'restock', 1, '2025-07-16T12:46:18.648Z', 'Completed', '2025-07-16 14:39:55', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(676, 276, 'restock', 1, '2025-07-16T12:48:03.712Z', 'Completed', '2025-07-16 14:41:40', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(677, 272, 'usage', 7, '2025-07-16T14:07:03.140Z', 'Completed', '2025-07-16 16:00:51', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": 0, \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(678, 267, 'usage', 6, '2025-07-16T14:07:35.356Z', 'Completed', '2025-07-16 16:01:39', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(679, 273, 'usage', 1, '2025-07-16T14:08:21.932Z', 'Completed', '2025-07-16 16:02:07', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(680, 274, 'usage', 1, '2025-07-16T14:08:47.908Z', 'Completed', '2025-07-16 16:02:32', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(681, 115, 'usage', 1, '2025-07-18T09:19:53.684Z', 'Completed', '2025-07-18 11:13:50', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"97\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(682, 115, 'usage', 1, '2025-07-18T09:20:33.044Z', 'Completed', '2025-07-18 11:14:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"109\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(683, 115, 'usage', 1, '2025-07-18T09:20:52.004Z', 'Completed', '2025-07-18 11:14:24', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"142\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(684, 115, 'usage', 1, '2025-07-18T09:21:06.796Z', 'Completed', '2025-07-18 11:14:41', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"157\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(685, 115, 'usage', 1, '2025-07-18T09:21:24.588Z', 'Completed', '2025-07-18 11:14:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"401\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(686, 115, 'usage', 1, '2025-07-18T09:21:40.972Z', 'Completed', '2025-07-18 11:15:15', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"497\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(687, 115, 'usage', 1, '2025-07-18T09:21:58.580Z', 'Completed', '2025-07-18 11:15:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"507\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(688, 115, 'usage', 1, '2025-07-18T09:22:15.100Z', 'Completed', '2025-07-18 11:15:55', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"462\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(689, 115, 'usage', 1, '2025-07-18T09:22:46.716Z', 'Completed', '2025-07-18 11:16:23', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"647\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(690, 115, 'usage', 1, '2025-07-18T09:23:04.436Z', 'Completed', '2025-07-18 11:16:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"169\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(691, 115, 'usage', 1, '2025-07-18T09:23:19.292Z', 'Completed', '2025-07-18 11:16:54', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"486\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(692, 115, 'usage', 1, '2025-07-18T09:23:38.924Z', 'Completed', '2025-07-18 11:17:19', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"611\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(693, 115, 'usage', 1, '2025-07-18T09:23:59.244Z', 'Completed', '2025-07-18 11:17:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"627\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(694, 115, 'usage', 1, '2025-07-18T09:24:18.724Z', 'Completed', '2025-07-18 11:18:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"656\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(695, 115, 'usage', 1, '2025-07-18T09:24:48.372Z', 'Completed', '2025-07-18 11:18:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"668\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(696, 115, 'usage', 1, '2025-07-18T09:25:05.804Z', 'Completed', '2025-07-18 11:18:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"689\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(697, 115, 'usage', 1, '2025-07-18T09:25:25.212Z', 'Completed', '2025-07-18 11:19:03', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"548\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(698, 115, 'usage', 1, '2025-07-18T09:25:43.428Z', 'Completed', '2025-07-18 11:19:17', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"551\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(699, 115, 'usage', 1, '2025-07-18T09:25:57.332Z', 'Completed', '2025-07-18 11:19:31', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"562\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(700, 115, 'usage', 1, '2025-07-18T09:26:11.732Z', 'Completed', '2025-07-18 11:19:47', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"571\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(701, 115, 'usage', 1, '2025-07-18T09:26:45.556Z', 'Completed', '2025-07-18 11:20:19', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"572\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(702, 115, 'usage', 1, '2025-07-18T09:26:59.972Z', 'Completed', '2025-07-18 11:20:33', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"589\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(703, 115, 'usage', 1, '2025-07-18T09:27:19.892Z', 'Completed', '2025-07-18 11:20:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"458\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(704, 115, 'usage', 1, '2025-07-18T09:27:40.684Z', 'Completed', '2025-07-18 11:21:24', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"151\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(705, 115, 'usage', 1, '2025-07-18T09:28:06.843Z', 'Completed', '2025-07-18 11:21:48', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"525\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(706, 115, 'usage', 1, '2025-07-18T09:28:25.043Z', 'Completed', '2025-07-18 11:22:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"637\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(707, 115, 'usage', 1, '2025-07-18T09:28:53.804Z', 'Completed', '2025-07-18 11:22:28', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"653\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(708, 115, 'usage', 1, '2025-07-18T09:29:11.940Z', 'Completed', '2025-07-18 11:22:48', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"635\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(709, 115, 'usage', 1, '2025-07-18T09:29:27.251Z', 'Completed', '2025-07-18 11:23:13', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"629\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(710, 115, 'usage', 1, '2025-07-18T09:29:53.788Z', 'Completed', '2025-07-18 11:23:28', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"538\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(711, 115, 'usage', 1, '2025-07-18T09:30:08.939Z', 'Completed', '2025-07-18 11:23:53', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"508\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(712, 115, 'usage', 1, '2025-07-18T09:30:34.332Z', 'Completed', '2025-07-18 11:24:11', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"491\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(713, 115, 'usage', 1, '2025-07-18T09:30:51.763Z', 'Completed', '2025-07-18 11:24:25', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"476\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(714, 115, 'usage', 1, '2025-07-18T09:31:06.299Z', 'Completed', '2025-07-18 11:24:42', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"152\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(715, 115, 'usage', 1, '2025-07-18T09:31:24.003Z', 'Completed', '2025-07-18 11:24:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"136\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(716, 272, 'restock', 2, '2025-07-18T13:38:36.534Z', 'Completed', '2025-07-18 15:32:29', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(717, 267, 'restock', 1, '2025-07-18T13:39:24.942Z', 'Completed', '2025-07-18 15:33:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(718, 277, 'restock', 7, '2025-07-18T14:18:46.283Z', 'Completed', '2025-07-18 16:12:53', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(719, 278, 'restock', 3, '2025-07-18T14:55:48.578Z', 'Completed', '2025-07-18 16:50:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(720, 279, 'restock', 14, '2025-07-18T14:58:57.145Z', 'Completed', '2025-07-18 16:52:54', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"6\", \"comments\": [], \"reasonCode\": \"Restock\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(721, 2, 'usage', 1, '2025-07-23T09:08:59.459Z', 'Completed', '2025-07-23 11:02:33', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"518\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(722, 3, 'usage', 1, '2025-07-23T09:09:21.067Z', 'Completed', '2025-07-23 11:03:06', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"518\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Sbu\", \"requestedById\": 0}'),
(723, 134, 'usage', 1, '2025-07-23T09:47:15.249Z', 'Completed', '2025-07-23 11:40:53', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"472\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(724, 47, 'usage', 1, '2025-07-23T09:58:39.912Z', 'Completed', '2025-07-23 11:52:15', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Sipho\", \"requestedById\": 0}'),
(725, 47, 'usage', 1, '2025-07-23T09:58:55.792Z', 'Completed', '2025-07-23 11:52:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Spha\", \"requestedById\": 0}'),
(726, 267, 'usage', 1, '2025-07-23T09:59:37.960Z', 'Completed', '2025-07-23 11:53:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"38\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"JMK\", \"requestedById\": 0}'),
(727, 249, 'usage', 1, '2025-07-23T11:07:43.700Z', 'Completed', '2025-07-23 13:01:53', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"596\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(728, 249, 'usage', 1, '2025-07-23T11:08:41.388Z', 'Completed', '2025-07-23 13:02:21', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"454\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(729, 140, 'usage', 1, '2025-07-23T11:09:26.468Z', 'Completed', '2025-07-23 13:03:07', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"426\", \"comments\": [], \"reasonCode\": \"Replacement (Broken)\", \"requestedBy\": \"Lameck\", \"requestedById\": 0}'),
(730, 228, 'usage', 1, '2025-07-26T11:53:28.786Z', 'Completed', '2025-07-26 13:47:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"538\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(731, 1, 'usage', 1, '2025-07-26T11:54:56.234Z', 'Completed', '2025-07-26 13:48:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"538\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(732, 3, 'usage', 1, '2025-07-26T12:32:51.192Z', 'Completed', '2025-07-26 14:28:10', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"538\", \"comments\": [], \"reasonCode\": \"Replacement (Damaged)\", \"requestedBy\": \"Prince\", \"requestedById\": 0}'),
(733, 243, 'usage', 116, '2025-07-28T07:35:02.290Z', 'Completed', '2025-07-28 09:28:37', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"694\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(734, 243, 'usage', 116, '2025-07-28T07:35:28.100Z', 'Completed', '2025-07-28 09:28:59', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"694\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(735, 243, 'usage', 116, '2025-07-28T07:35:50.603Z', 'Completed', '2025-07-28 09:29:20', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"696\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(736, 243, 'usage', 108, '2025-07-28T07:36:16.635Z', 'Completed', '2025-07-28 09:29:50', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"697\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(737, 243, 'usage', 110, '2025-07-28T07:37:35.891Z', 'Completed', '2025-07-28 09:31:05', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"698\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(738, 243, 'usage', 116, '2025-07-28T07:38:04.315Z', 'Completed', '2025-07-28 09:31:34', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"699\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(739, 243, 'usage', 116, '2025-07-28T07:38:26.467Z', 'Completed', '2025-07-28 09:31:57', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"700\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(740, 243, 'usage', 100, '2025-07-28T07:39:06.948Z', 'Completed', '2025-07-28 09:32:40', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"701\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(741, 243, 'usage', 116, '2025-07-28T07:39:32.683Z', 'Completed', '2025-07-28 09:33:04', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"702\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(742, 243, 'usage', 102, '2025-07-28T07:39:59.467Z', 'Completed', '2025-07-28 09:33:27', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"703\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(743, 243, 'usage', 110, '2025-07-28T07:40:22.243Z', 'Completed', '2025-07-28 09:33:49', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"704\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(744, 243, 'usage', 96, '2025-07-28T07:40:55.707Z', 'Completed', '2025-07-28 09:34:30', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"706\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(745, 243, 'usage', 76, '2025-07-28T07:43:04.635Z', 'Completed', '2025-07-28 09:36:38', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"707\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(746, 243, 'usage', 72, '2025-07-28T07:48:08.836Z', 'Completed', '2025-07-28 09:41:37', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"708\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(747, 243, 'usage', 80, '2025-07-28T07:48:37.531Z', 'Completed', '2025-07-28 09:42:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"710\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(748, 243, 'usage', 54, '2025-07-28T07:48:59.827Z', 'Completed', '2025-07-28 09:42:27', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"711\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(749, 243, 'usage', 78, '2025-07-28T07:49:23.419Z', 'Completed', '2025-07-28 09:43:02', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"712\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(750, 243, 'usage', 100, '2025-07-28T07:49:55.067Z', 'Completed', '2025-07-28 09:43:26', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"713\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(751, 243, 'usage', 46, '2025-07-28T07:50:15.962Z', 'Completed', '2025-07-28 09:43:45', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"714\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(752, 243, 'usage', 76, '2025-07-28T07:50:36.890Z', 'Completed', '2025-07-28 09:44:07', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"715\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(753, 243, 'usage', 82, '2025-07-28T07:51:01.243Z', 'Completed', '2025-07-28 09:44:28', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"716\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(754, 243, 'usage', 58, '2025-07-28T07:51:25.243Z', 'Completed', '2025-07-28 09:45:00', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"717\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(755, 243, 'usage', 90, '2025-07-28T07:51:52.290Z', 'Completed', '2025-07-28 09:45:23', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"718\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(756, 243, 'usage', 104, '2025-07-28T07:52:18.811Z', 'Completed', '2025-07-28 09:45:56', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"719\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(757, 243, 'usage', 106, '2025-07-28T07:52:44.666Z', 'Completed', '2025-07-28 09:46:18', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"720\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(758, 243, 'usage', 96, '2025-07-28T07:53:13.555Z', 'Completed', '2025-07-28 09:46:46', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"721\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(759, 243, 'usage', 108, '2025-07-28T07:53:36.323Z', 'Completed', '2025-07-28 09:47:14', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"722\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(760, 243, 'usage', 66, '2025-07-28T07:53:57.362Z', 'Completed', '2025-07-28 10:00:48', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"723\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(761, 243, 'usage', 88, '2025-07-28T08:07:30.818Z', 'Completed', '2025-07-28 10:01:08', '30d83c45-096e-11f0-a237-d21cc41a9548', '2025-08-11 19:49:31', '', '{\"room\": \"\", \"roomId\": \"693\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"\", \"requestedById\": 0}'),
(762, NULL, 'usage', 2, '2025-08-12T12:52:05.036Z', 'Completed', '2025-08-12 12:52:27', 'c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '2025-08-12 12:52:27', '', '{\"room\": \"409\", \"roomId\": \"119\", \"comments\": [], \"reasonCode\": \"Replacement (Stolen)\", \"requestedBy\": \"Ndumiso MM\", \"requestedById\": 0}'),
(763, NULL, 'restock', 2, '2025-08-12T12:52:45.257Z', 'Completed', '2025-08-12 12:52:56', 'c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '2025-08-12 12:52:56', '', '{\"room\": \"113\", \"roomId\": \"45\", \"comments\": [], \"condition\": \"Poor\", \"reasonCode\": \"Reversal of duplication\", \"supplierId\": \"7\", \"requestedBy\": \"Ndumiso MM\", \"supplierName\": \"NetWorks SA\", \"requestedById\": 0}'),
(764, NULL, 'usage', 2, '2025-08-12T12:54:01.966Z', 'Completed', '2025-08-12 12:54:14', 'c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '2025-08-12 12:54:14', '', '{\"room\": \"115\", \"roomId\": \"47\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Ndumiso MM\", \"requestedById\": 0}'),
(765, NULL, 'usage', 1, '2025-08-12T12:59:59.699Z', 'Completed', '2025-08-12 13:00:10', 'c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '2025-08-12 13:00:10', '', '{\"room\": \"212\", \"roomId\": \"90\", \"comments\": [], \"reasonCode\": \"Replacement (Stolen)\", \"requestedBy\": \"Ndumiso MM\", \"requestedById\": 0}'),
(766, 240, 'usage', 1, '2025-08-12T13:02:09.337Z', 'Completed', '2025-08-12 13:02:16', 'c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '2025-08-12 13:02:16', '', '{\"room\": \"112\", \"roomId\": \"44\", \"comments\": [], \"reasonCode\": \"Replacement (Stolen)\", \"requestedBy\": \"Ndumiso MM\", \"requestedById\": 0}'),
(767, 240, 'usage', 1, '2025-08-12T13:05:52.765Z', 'Completed', '2025-08-12 13:06:00', 'c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '2025-08-12 13:06:00', '', '{\"room\": \"113\", \"roomId\": \"45\", \"comments\": [], \"reasonCode\": \"New Allocation\", \"requestedBy\": \"Ndumiso MM\", \"requestedById\": 0}');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` varchar(225) NOT NULL,
  `CompanyId` varchar(225) DEFAULT NULL,
  `ParentCompanyId` varchar(225) DEFAULT NULL,
  `UserType` varchar(30) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Email` varchar(500) NOT NULL,
  `PhoneNumber` varchar(225) DEFAULT NULL,
  `Password` varchar(100) NOT NULL,
  `Dp` text,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` varchar(50) NOT NULL,
  `UserToken` varchar(225) DEFAULT NULL,
  `AddressLineHome` text,
  `AddressUrlHome` text,
  `AddressLineWork` text,
  `AddressUrlWork` text,
  `ReferralCode` varchar(100) DEFAULT NULL,
  `ParentReferralCode` varchar(100) DEFAULT NULL,
  `AddressLine2` text NOT NULL,
  `BuildingType` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `CompanyName` varchar(100) NOT NULL,
  `PostalCode` varchar(50) NOT NULL,
  `Suburb` varchar(100) NOT NULL,
  `Measurements` text,
  `Metadata` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `CompanyId`, `ParentCompanyId`, `UserType`, `Name`, `Surname`, `Email`, `PhoneNumber`, `Password`, `Dp`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`, `UserToken`, `AddressLineHome`, `AddressUrlHome`, `AddressLineWork`, `AddressUrlWork`, `ReferralCode`, `ParentReferralCode`, `AddressLine2`, `BuildingType`, `City`, `CompanyName`, `PostalCode`, `Suburb`, `Measurements`, `Metadata`) VALUES
('08a1e8bd-1122-11f0-89b2-d21cc41a9548', '', NULL, '3', 'Maxwell', '', 'internalauditor@seaboardliving.co.za', '0683840415', 'Maxwell@123', '', '2025-04-04 08:57:11', '', '2025-04-04 08:57:11', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}'),
('0be576e5-cb73-11ef-a3e6-ac1f6be20d6c', '', NULL, '3', 'Zayd', '', 'zayd.ahmed786@gmail.com', '083 226 8762', '78654321', '', '2025-01-05 16:40:45', '', '2025-03-25 15:09:42', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}'),
('14c5268a-c6b8-11ef-a3e6-ac1f6be20d6c', '', NULL, '2', 'Jane ', '', 'jane@mail.com', '', 'jane@mail.com', '', '2024-12-30 16:12:19', '', '2025-03-14 11:56:30', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}'),
('30d83c45-096e-11f0-a237-d21cc41a9548', '', NULL, '2', 'Sne Khuzwayo', '', 'maintenancecoordinator@seaboardliving.co.za', '0631466721', 'Sne@0408', '', '2025-03-25 13:42:11', '', '2025-04-04 09:43:47', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}'),
('4b25f5ae-1122-11f0-89b2-d21cc41a9548', '', NULL, '2', 'Nobukhosi Mpala', '', 'opsmanagerdbn@seaboardliving.co.za', '0682540765', 'Siya@2011', '', '2025-04-04 08:59:03', '', '2025-04-15 09:29:27', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}'),
('60397908-ccea-11ef-a3e6-ac1f6be20d6c', '', NULL, '3', 'Shamir Ahmed', '', 'stores@seaboardliving.co.za', '083 786 2750', 'Juwi', '', '2025-01-07 13:27:28', '', '2025-03-25 15:20:48', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}'),
('77536134-3738-11f0-a16e-d21cc41a9548', '', NULL, '3', 'Noor Mohammed Kamdar', '', 'accounts1@kamdargroup.co.za', '0832800357', 'Nnomoka786', '', '2025-05-22 20:13:30', '', '2025-05-22 20:13:30', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}'),
('7a9c3a3d-1122-11f0-89b2-d21cc41a9548', '', NULL, '1', 'Ahmed Moolla', '', 'accounts@kamdargroup.co.za', '0769447564', 'Aem786=-', '', '2025-04-04 09:00:23', '', '2025-04-04 09:00:23', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}'),
('ab947e56-b7ef-11ef-9b40-ac1f6be20d6c', '', NULL, '1', 'Mr Admin', '', 'admin@seaboard.co.za', '', 'Seaboard@1', '', '2024-12-11 20:42:27', '', '2025-03-25 15:06:06', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}'),
('c3e4d8fd-bc61-11ef-9b40-ac1f6be20d6c', '', NULL, '1', 'Developer', '', 'ndumiso@tybo.co.za', '', '1234567', '', '2024-12-17 12:29:15', '', '2025-03-25 15:07:30', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}'),
('f8f6640b-c6b8-11ef-a3e6-ac1f6be20d6c', '', NULL, '3', 'Zama', '', '08425229472', '08425229472', '', '', '2024-12-30 16:18:42', '', '2025-03-25 15:20:58', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}'),
('f9db42d8-1134-11f0-89b2-d21cc41a9548', '', NULL, '3', 'M I', '', 'admin3@kamdargroup.co.za', '', 'mojo7861', '', '2025-04-04 11:12:47', '', '2025-05-22 11:03:00', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '[]', '{\"Source\": \"Online\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AssetType`
--
ALTER TABLE `AssetType`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_categories`
--
ALTER TABLE `asset_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `asset_items`
--
ALTER TABLE `asset_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_code` (`asset_code`),
  ADD UNIQUE KEY `uq_assettype_serial` (`asset_type_id`,`serial_number`),
  ADD KEY `fk_items_location` (`current_location_id`),
  ADD KEY `idx_items_status_loc` (`status`,`current_location_id`),
  ADD KEY `idx_items_warranty` (`warranty_expiry`);

--
-- Indexes for table `asset_item_transfers`
--
ALTER TABLE `asset_item_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_itemtrans_item` (`asset_item_id`),
  ADD KEY `fk_itemtrans_fromloc` (`from_location_id`),
  ADD KEY `fk_itemtrans_toloc` (`to_location_id`);

--
-- Indexes for table `asset_types`
--
ALTER TABLE `asset_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_assettypes_category` (`asset_category_id`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `Features`
--
ALTER TABLE `Features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_info`
--
ALTER TABLE `other_info`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `reasons`
--
ALTER TABLE `reasons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_reason_unique` (`tenant_id`,`reason_type`,`name`),
  ADD KEY `idx_reason_type` (`tenant_id`,`reason_type`,`active`,`sort_order`);

--
-- Indexes for table `Requisition`
--
ALTER TABLE `Requisition`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `requestNumber` (`requestNumber`);

--
-- Indexes for table `RequisitionItem`
--
ALTER TABLE `RequisitionItem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `RoleFeatures`
--
ALTER TABLE `RoleFeatures`
  ADD PRIMARY KEY (`roleId`,`featureId`);

--
-- Indexes for table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `StockItem`
--
ALTER TABLE `StockItem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `StockType`
--
ALTER TABLE `StockType`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_tenant_name` (`name`);

--
-- Indexes for table `Transactions`
--
ALTER TABLE `Transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AssetType`
--
ALTER TABLE `AssetType`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `asset_categories`
--
ALTER TABLE `asset_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `asset_items`
--
ALTER TABLE `asset_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `asset_item_transfers`
--
ALTER TABLE `asset_item_transfers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `asset_types`
--
ALTER TABLE `asset_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Features`
--
ALTER TABLE `Features`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `other_info`
--
ALTER TABLE `other_info`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=724;

--
-- AUTO_INCREMENT for table `reasons`
--
ALTER TABLE `reasons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `Requisition`
--
ALTER TABLE `Requisition`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `RequisitionItem`
--
ALTER TABLE `RequisitionItem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `Roles`
--
ALTER TABLE `Roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `StockItem`
--
ALTER TABLE `StockItem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `StockType`
--
ALTER TABLE `StockType`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Transactions`
--
ALTER TABLE `Transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=768;

-- --------------------------------------------------------

--
-- Structure for view `Asset`
--
DROP TABLE IF EXISTS `Asset`;

CREATE ALGORITHM=UNDEFINED DEFINER=`docker`@`%` SQL SECURITY DEFINER VIEW `Asset`  AS SELECT `si`.`id` AS `id`, `si`.`code` AS `code`, `si`.`name` AS `name`, `si`.`categoryId` AS `categoryId`, `si`.`stockTypeId` AS `assetTypeId`, `si`.`imageUrl` AS `imageUrl`, `si`.`slug` AS `slug`, `si`.`status` AS `status`, `si`.`createdDate` AS `createdDate`, `si`.`createdBy` AS `createdBy`, `si`.`lastUpdatedDate` AS `lastUpdatedDate`, `si`.`lastUpdatedBy` AS `lastUpdatedBy`, `si`.`stockInHand` AS `stockInHand`, `si`.`metadata` AS `metadata`, `si`.`size` AS `size` FROM `StockItem` AS `si` ;

-- --------------------------------------------------------

--
-- Structure for view `asset_location_agg`
--
DROP TABLE IF EXISTS `asset_location_agg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`docker`@`%` SQL SECURITY DEFINER VIEW `asset_location_agg`  AS SELECT `ai`.`asset_type_id` AS `asset_type_id`, `ai`.`current_location_id` AS `location_id`, count(0) AS `quantity` FROM `asset_items` AS `ai` WHERE (`ai`.`status` <> 'Disposed') GROUP BY `ai`.`asset_type_id`, `ai`.`current_location_id` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asset_items`
--
ALTER TABLE `asset_items`
  ADD CONSTRAINT `fk_items_location` FOREIGN KEY (`current_location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_items_type` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `asset_item_transfers`
--
ALTER TABLE `asset_item_transfers`
  ADD CONSTRAINT `fk_itemtrans_fromloc` FOREIGN KEY (`from_location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_itemtrans_item` FOREIGN KEY (`asset_item_id`) REFERENCES `asset_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_itemtrans_toloc` FOREIGN KEY (`to_location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `asset_types`
--
ALTER TABLE `asset_types`
  ADD CONSTRAINT `fk_assettypes_category` FOREIGN KEY (`asset_category_id`) REFERENCES `asset_categories` (`id`);

--
-- Constraints for table `reasons`
--
ALTER TABLE `reasons`
  ADD CONSTRAINT `fk_reasons_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
