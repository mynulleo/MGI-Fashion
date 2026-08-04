-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 24, 2026 at 09:23 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sass_isp_demo_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `account_code` int DEFAULT NULL,
  `account_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` enum('Asset','Liability','Income','Expense','Equity') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_group` tinyint NOT NULL DEFAULT '0',
  `reference_type` enum('Client','Supplier','UplinkProvider','Employee','System') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_key_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_fund_account` tinyint DEFAULT NULL,
  `opening_balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  `opening_balance_type` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `parent_id`, `account_code`, `account_name`, `account_type`, `is_group`, `reference_type`, `reference_id`, `system_key_name`, `is_fund_account`, `opening_balance`, `opening_balance_type`, `created_at`, `updated_at`, `deleted_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(21, NULL, 1000, 'Assets', 'Asset', 1, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 04:40:11', NULL, 'active', 0, 0, 0, 0),
(22, 21, 1100, 'Cash', 'Asset', 1, 'System', NULL, 'Cash', 1, 245000.00, 'Debit', '2026-01-07 10:37:00', '2026-02-13 04:57:00', NULL, 'active', 0, 0, 0, 0),
(23, 21, 1110, 'Petty Cash', 'Asset', 0, 'System', '', NULL, 1, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-02-13 09:48:04', NULL, 'active', 0, 0, 0, 0),
(24, 21, 1120, 'Bank', 'Asset', 0, 'System', NULL, 'Bank,Cheque,BankTransfer', 1, 7067345.00, 'Debit', '2026-01-07 22:37:00', '2026-02-13 10:57:07', NULL, 'active', 0, 0, 0, 0),
(25, 21, 1130, 'bKash/Nagad/Rocket', 'Asset', 0, 'System', '', 'MobileBanking', 1, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-02-13 09:48:13', NULL, 'active', 0, 0, 0, 0),
(26, 21, 1200, 'Accounts Receivable', 'Asset', 0, 'System', '', 'accounts-receivable', NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-14 21:05:49', NULL, 'active', 0, 0, 0, 0),
(27, 21, 1300, 'Inventory/Stock', 'Asset', 0, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(28, 21, 1400, 'Office Equipment', 'Asset', 0, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(29, 21, 1500, 'Furniture & Fixtures', 'Asset', 0, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(30, NULL, 2000, 'Liabilities', 'Liability', 1, 'System', '', NULL, NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-09 04:40:16', NULL, 'active', 0, 0, 0, 0),
(31, 30, 2100, 'Accounts Payable', 'Liability', 0, 'System', '', 'accounts-payable', NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-14 21:05:55', NULL, 'active', 0, 0, 0, 0),
(32, 30, 2200, 'Salary Payable', 'Liability', 0, 'System', '', 'salary-payable', NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-14 20:36:03', NULL, 'active', 0, 0, 0, 0),
(33, 30, 2300, 'Bonus Payable', 'Liability', 0, 'System', '', 'bonus-payable', NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-02-06 07:22:24', NULL, 'active', 0, 0, 0, 0),
(34, 30, 2400, 'TAX/VAT Payable', 'Liability', 0, 'System', '', NULL, NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(35, NULL, 3000, 'Equity', 'Equity', 1, 'System', '', NULL, NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-09 04:40:20', NULL, 'active', 0, 0, 0, 0),
(36, 35, 3100, 'Owner Capital', 'Equity', 0, 'System', '', NULL, NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(37, 35, 3200, 'Owner Withdraw', 'Equity', 0, 'System', '', 'owner-withdraw', NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-02-15 10:15:23', NULL, 'active', 0, 0, 0, 0),
(38, 35, 3300, 'Retained Earnings', 'Equity', 0, 'System', '', NULL, NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(39, NULL, 4000, 'Income', 'Income', 1, 'System', '', NULL, NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-09 04:40:25', NULL, 'active', 0, 0, 0, 0),
(40, 39, 4100, 'Sales Revenue', 'Income', 0, 'System', '', 'sales-revenue', NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-14 23:41:52', NULL, 'active', 0, 0, 0, 0),
(41, 39, 4200, 'Service Income', 'Income', 0, 'System', '', NULL, NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(42, 39, 4300, 'Commission Income', 'Income', 0, 'System', '', NULL, NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(43, 39, 4400, 'Other Income', 'Income', 0, 'System', '', NULL, NULL, 0.00, 'Credit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(44, NULL, 5000, 'Expenses', 'Expense', 1, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 04:40:29', NULL, 'active', 0, 0, 0, 0),
(45, 44, 5100, 'Purchase', 'Expense', 0, 'System', '', 'purchase', NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-14 20:27:59', NULL, 'active', 0, 0, 0, 0),
(46, 44, 5200, 'Salary Expense', 'Expense', 0, 'System', '', 'SalaryExpense', NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-12 00:31:28', NULL, 'active', 0, 0, 0, 0),
(47, 44, 5300, 'Rent Expense', 'Expense', 0, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(48, 44, 5400, 'Utility Bills', 'Expense', 0, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(49, 44, 5500, 'Internet/Mobile Bill', 'Expense', 0, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(50, 44, 5600, 'Office Supplies', 'Expense', 0, 'System', '', 'office-supplies-expense', NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-30 21:48:11', NULL, 'active', 0, 0, 0, 0),
(51, 44, 5700, 'Advertisement & Marketing Expense', 'Expense', 0, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(52, 44, 5800, 'Travel Expense', 'Expense', 0, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(53, 44, 5900, 'Bank Charges', 'Expense', 0, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(54, 44, 5910, 'bKash/Nagad Charges', 'Expense', 0, 'System', '', NULL, NULL, 0.00, 'Debit', '2026-01-08 16:37:00', '2026-01-09 16:37:00', NULL, 'active', 0, 0, 0, 0),
(55, 44, 1001, 'Discount', 'Expense', 0, 'System', NULL, NULL, NULL, 0.00, NULL, '2026-01-09 05:22:50', '2026-01-09 05:22:50', NULL, 'active', 1, 1, 1, 1),
(66, 44, 1003, 'Conveyance', 'Expense', 0, 'System', NULL, NULL, NULL, 0.00, NULL, '2026-01-09 23:33:37', '2026-01-09 23:33:37', NULL, 'active', 1, 1, 1, 1),
(68, 31, 1004, '111 - Chester Long', 'Liability', 0, 'Supplier', '1', NULL, NULL, 0.00, 'Debit', '2026-01-10 06:11:55', '2026-01-10 06:11:55', NULL, 'active', 1, 1, 1, 1),
(69, 44, 1005, 'Bandwidth Expense', 'Expense', 0, 'System', NULL, 'bandwidth-expense', NULL, 0.00, NULL, '2026-01-10 06:27:26', '2026-01-12 03:15:05', NULL, 'active', 1, 1, 1, 1),
(70, 39, 1006, 'Bandwidth Income', 'Income', 0, 'System', NULL, 'bandwidth-income', NULL, 0.00, NULL, '2026-01-10 07:22:43', '2026-01-14 23:40:49', NULL, 'active', 1, 1, 1, 1),
(71, 44, 1007, 'Office Loan', 'Expense', 0, 'System', NULL, 'Loan', NULL, 0.00, NULL, '2026-01-11 01:11:41', '2026-01-11 09:44:52', NULL, 'active', 1, 1, 1, 1),
(72, 44, 1008, 'Advance Salary', 'Expense', 0, 'System', NULL, 'Advance', NULL, 0.00, NULL, '2026-01-11 01:12:03', '2026-01-11 09:46:03', NULL, 'active', 1, 1, 1, 1),
(73, 44, 1009, 'Bonus', 'Expense', 0, 'System', NULL, 'bonus-expense', NULL, 0.00, NULL, '2026-01-12 00:32:57', '2026-01-12 00:33:34', NULL, 'active', 1, 1, 1, 1),
(74, 44, 1010, 'Commission Expense', 'Expense', 0, 'System', NULL, 'commission-expense', NULL, 0.00, NULL, '2026-01-12 00:34:55', '2026-01-12 00:35:14', NULL, 'active', 1, 1, 1, 1),
(75, 21, 1011, 'Employee Loan Receivable', 'Asset', 0, 'System', NULL, 'employee-loan-receivable', NULL, 0.00, NULL, '2026-01-12 00:40:54', '2026-01-12 00:41:28', NULL, 'active', 1, 1, 1, 1),
(76, 39, 1012, 'Employee Salary Deduction', 'Asset', 0, 'System', NULL, 'employee-salary-deduction', NULL, 0.00, NULL, '2026-01-12 00:44:21', '2026-02-06 07:09:12', NULL, 'active', 1, 1, 1, 1),
(77, 44, 1013, 'Bannar Printing', 'Expense', 0, 'System', NULL, NULL, NULL, 0.00, NULL, '2026-02-01 14:34:46', '2026-02-01 14:34:46', NULL, 'active', 1, 1, 1, 1),
(78, 44, 1014, 'Leaflet Printing', 'Expense', 0, 'System', NULL, NULL, NULL, 0.00, NULL, '2026-02-01 14:35:17', '2026-02-01 14:35:17', NULL, 'active', 1, 1, 1, 1),
(79, 30, 1015, 'Commission Payable', 'Liability', 0, 'System', NULL, 'commission-payable', NULL, 0.00, NULL, '2026-02-06 07:03:05', '2026-02-06 07:03:48', NULL, 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` tinyint NOT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gender` enum('male','female','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `block` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Active, 1=Deactive',
  `status` enum('active','deactive','trash') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `username`, `email`, `password`, `mobile`, `profile`, `address`, `gender`, `birth_date`, `state`, `zip_code`, `road_number`, `description`, `city`, `block`, `status`, `remember_token`, `created_by`, `created_ip`, `updated_by`, `updated_ip`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nogor Solutions Limited', 'nsl', 'nsl@gmail.com', '$2y$10$PKQDu3CbzRNZkmZmQ2bKvO6iSv0Oq//7pOmvcMLHO7.vDR3FfMVF.', '01700000000', '{\"600x600\":\"upload\\/profile\\/600x600\\/4a021043-8019-4de8-9fc6-ad1647297c55.avif\",\"300x300\":\"upload\\/profile\\/300x300\\/71d92622-b9f7-4b35-8109-4dd1076e6633.avif\",\"50x50\":\"upload\\/profile\\/50x50\\/17ed18a9-8fbf-445a-9226-cecfc4b078b2.avif\",\"original\":\"upload\\/profile\\/original\\/e7dde788-ad1c-4eef-9277-9ef9631789e0.avif\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 'o8TuXdIAzGxq7GaiCBd33ih0dQhYT18lh69pKVZKxXzFNCPKUq2RDGJAl2Wc', NULL, NULL, NULL, NULL, NULL, '2024-07-02 03:14:27', '2025-03-19 03:45:55'),
(2, 2, 'Nogor', 'nogor', 'nogor@gmail.com', '$2y$10$sLMhTQyYJLDwf9.t4gpBgucfh583UiZnuIT9XPpu33mlDUVlvlrwe', '01700000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 'oKgfMbXlgBjuKYlzd0MQAlKyaq6fXNY8yWpY0q5G3PlYwAb89yTseAlEs25j', NULL, NULL, NULL, NULL, NULL, '2024-07-02 03:14:27', '2024-07-02 03:14:27'),
(3, 1, 'Mynul Islam Leo', NULL, 'qadmin@gmail.com', '$2y$10$sxPYifZ2a46Z7L1ld9xNEu/jAZhoBOW3fQDU/L7R33qN3.SEkrYkK', '01912252095', '{\"600x600\":\"upload\\/profile\\/600x600\\/7adb51d1-3449-49e7-a9cd-35381483f899.avif\",\"300x300\":\"upload\\/profile\\/300x300\\/2f26bb3b-5b6a-48aa-950c-52cf62090581.avif\",\"50x50\":\"upload\\/profile\\/50x50\\/926124fc-033d-49c0-8576-0f29c3262c4c.avif\",\"original\":\"upload\\/profile\\/original\\/2cf8622b-5914-43ec-a561-ee2898755c33.avif\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-11 00:07:35', '2024-10-08 03:03:34'),
(18, 1, 'Shihab', NULL, 'shihab@gmail.com', '$2y$10$eMKmTBuWVUYKIz.oTW/RMu.a2fr7mehFlPNsWccmWYLe4AQd/dRnm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'deactive', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-08 03:44:40', '2025-03-19 08:58:24'),
(19, 1, 'Tuhin', NULL, 'tudin@gmail.com', '$2y$10$JgdRglwYNLG2744coMpNUOoYAN4GkcY1tUkY4e052R.Xq0J335BrS', '01700000000', '{\"600x600\":\"upload\\/profile\\/600x600\\/954bb35c-ec3c-4678-90dd-f46f44f0f941.avif\",\"300x300\":\"upload\\/profile\\/300x300\\/2f0c4061-5dfe-4206-b558-9e379596ca18.avif\",\"50x50\":\"upload\\/profile\\/50x50\\/8e446638-5a3f-48f0-8d95-ef742604c806.avif\",\"original\":\"upload\\/profile\\/original\\/fdc2913c-17ba-4fca-ad0d-49d2f5a218a5.avif\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, '2024-11-06 10:36:56', '2024-10-08 03:47:55', '2024-11-06 10:36:56'),
(21, 1, 'Mehedi Hasan', NULL, 'mehedihasan33x@gmail.com', '$2y$10$b13xzCB6za8HL257KFKMaecsudreIvlSmdBNnt8SZA/JoBIVv3i9C', '01478596969', '{\"600x600\":\"upload\\/profile\\/600x600\\/2c9b696c-2a91-45c5-98cd-31435c7f227a.avif\",\"300x300\":\"upload\\/profile\\/300x300\\/08d688ca-660c-4865-8864-9deefb6c24d9.avif\",\"50x50\":\"upload\\/profile\\/50x50\\/e69ae563-f38b-4e9f-9cf0-82fd5b5458a8.avif\",\"original\":\"upload\\/profile\\/original\\/4318d2ff-b6d2-4ff0-a560-ec9fb4d47449.avif\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-06 11:55:56', '2025-07-26 16:19:42'),
(22, 1, 'masudul Islam', NULL, 'masudul.islam@beeonline.com.bd', '$2y$10$jMrmE1dsqKwpfMPguuO6RuAts3iLw9di.12FN2PKmDU6yKggzgO1.', '01676099988', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-28 18:29:18', '2026-01-29 12:42:37'),
(23, 6, 'jahid.hasan@beeonline.com.bd', NULL, 'jahid.hasan@beeonline.com.bd', '$2y$10$gl8e3NURXV8d451nM3h5CegGoKxFjAS.w.L4OfIqRRJMdNibOmt7W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-28 18:32:09', '2026-02-02 16:23:27'),
(24, 7, 'Meherab Hossain', NULL, 'meherab.hasan@beeonline.com.bd', '$2y$10$KbACNEgpfTSy3Ys4cPHKkOt5wgLvb3HVpw/dgvu3GRSXbPpYcK6B6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-29 12:44:12', '2026-01-29 16:13:33');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint UNSIGNED NOT NULL,
  `district_id` int NOT NULL,
  `area_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `district_id`, `area_name`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 13, 'Sector 7, Uttara', '2026-01-26 18:29:42', '2026-01-26 18:29:42', 'active', 1, 1, 1, 1),
(2, 13, 'Sector 8, Uttara', '2026-01-26 18:29:57', '2026-01-26 18:29:57', 'active', 1, 1, 1, 1),
(3, 13, 'Sector 1, Uttara', '2026-01-26 18:30:14', '2026-01-26 18:30:14', 'active', 1, 1, 1, 1),
(4, 13, 'Sector 3, Uttara', '2026-01-26 12:30:46', '2026-01-26 12:30:46', 'active', 1, 1, 1, 1),
(5, 13, 'Sector 2, Uttara', '2026-01-26 18:31:05', '2026-01-26 18:31:05', 'active', 1, 1, 1, 1),
(6, 13, 'Sector 4, Uttara', '2026-01-26 18:31:24', '2026-01-26 18:31:24', 'active', 1, 1, 1, 1),
(7, 13, 'Sector 5, Uttara', '2026-01-26 18:31:39', '2026-01-26 18:31:39', 'active', 1, 1, 1, 1),
(8, 13, 'Sector 6, Uttara', '2026-01-26 18:31:56', '2026-01-26 18:31:56', 'active', 1, 1, 1, 1),
(9, 13, 'Sector 9, Uttara', '2026-01-26 18:32:26', '2026-01-26 18:32:26', 'active', 1, 1, 1, 1),
(10, 13, 'Sector 10, Uttara', '2026-01-26 18:32:43', '2026-01-26 18:32:43', 'active', 1, 1, 1, 1),
(11, 13, 'Sector 11, Uttara', '2026-01-26 18:32:55', '2026-01-26 18:32:55', 'active', 1, 1, 1, 1),
(12, 13, 'Sector 15, Uttara', '2026-01-26 18:33:05', '2026-01-26 18:33:05', 'active', 1, 1, 1, 1),
(13, 13, 'Sector 16, Uttara', '2026-01-26 18:33:15', '2026-01-26 18:33:15', 'active', 1, 1, 1, 1),
(14, 13, 'Sector 17, Uttara', '2026-01-26 18:33:26', '2026-01-26 18:33:26', 'active', 1, 1, 1, 1),
(15, 13, 'Sector 18, Uttara', '2026-01-26 18:33:37', '2026-01-26 18:33:37', 'active', 1, 1, 1, 1),
(16, 13, 'Khilkhet', '2026-01-26 18:34:13', '2026-01-26 18:34:13', 'active', 1, 1, 1, 1),
(17, 13, 'Nikunjo 1', '2026-01-26 18:34:26', '2026-01-26 18:34:26', 'active', 1, 1, 1, 1),
(18, 13, 'Nikunjo 2', '2026-01-26 18:34:38', '2026-01-26 18:34:38', 'active', 1, 1, 1, 1),
(19, 13, 'Banani', '2026-01-26 18:34:57', '2026-01-26 18:34:57', 'active', 1, 1, 1, 1),
(20, 13, 'Gulshan 1', '2026-01-26 18:35:07', '2026-01-26 18:35:07', 'active', 1, 1, 1, 1),
(21, 13, 'Gulshan 2', '2026-01-26 18:35:24', '2026-01-26 18:35:24', 'active', 1, 1, 1, 1),
(22, 28, 'Bhirab Town', '2026-01-26 18:36:07', '2026-01-26 18:36:07', 'active', 1, 1, 1, 1),
(23, 5, 'Lalmohon', '2026-01-26 18:36:23', '2026-01-26 18:36:23', 'active', 1, 1, 1, 1),
(24, 43, 'Palash', '2026-01-26 18:36:59', '2026-01-26 18:36:59', 'active', 1, 1, 1, 1),
(25, 43, 'Narshindi Sadar', '2026-01-26 18:37:28', '2026-01-26 18:37:28', 'active', 1, 1, 1, 1),
(26, 43, 'Chinispur', '2026-01-29 12:47:30', '2026-01-29 12:47:30', 'active', 1, 1, 1, 1),
(27, 42, 'Cawla', '2026-01-29 12:47:42', '2026-01-29 12:47:42', 'active', 1, 1, 1, 1),
(28, 43, 'Birpur', '2026-01-29 12:47:53', '2026-01-29 12:47:53', 'active', 1, 1, 1, 1),
(29, 18, 'College get, Tongi', '2026-01-29 12:49:38', '2026-01-29 12:49:38', 'active', 1, 1, 1, 1),
(30, 18, 'Kashimpur', '2026-01-29 12:49:53', '2026-01-29 12:49:53', 'active', 1, 1, 1, 1),
(31, 18, 'Shilmon', '2026-01-29 12:55:31', '2026-01-29 12:55:31', 'active', 1, 1, 1, 1),
(32, 18, 'Khilkur', '2026-01-29 06:58:00', '2026-01-29 06:58:00', 'active', 1, 1, 1, 1),
(33, 18, 'Boadbazar', '2026-01-29 19:40:11', '2026-01-29 19:40:11', 'active', 1, 1, 1, 1),
(34, 43, 'Hasnabad', '2026-01-31 17:52:12', '2026-01-31 17:52:12', 'active', 1, 1, 1, 1),
(35, 4, 'barishal Sadar', '2026-02-02 10:32:59', '2026-02-02 10:32:59', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bandwidth_histories`
--

CREATE TABLE `bandwidth_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `bhno` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_date` date NOT NULL,
  `uplink_provider_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `total_bandwidth` int NOT NULL,
  `unit_id` int NOT NULL,
  `vat` int DEFAULT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `total_include_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `is_closed` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bandwidth_history_details`
--

CREATE TABLE `bandwidth_history_details` (
  `id` bigint UNSIGNED NOT NULL,
  `bandwidth_history_id` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_vat` tinyint NOT NULL DEFAULT '0',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `linkid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bandwidth` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `days` int DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `exclude_amount` decimal(8,2) NOT NULL,
  `include_amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint UNSIGNED NOT NULL,
  `bank_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `bank_name`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 'Bank Asia', '2026-01-31 05:56:33', '2026-01-31 05:56:33', 'active', 1, 1, 1, 1),
(2, 'Mutual Trust Bank', '2026-01-31 05:58:19', '2026-01-31 05:58:19', 'active', 1, 1, 1, 1),
(3, 'City Bank', '2026-01-31 05:59:07', '2026-01-31 05:59:07', 'active', 1, 1, 1, 1),
(4, 'Dutch Bangla Bank', '2026-02-01 16:09:36', '2026-02-01 16:09:36', 'active', 1, 1, 1, 1),
(5, 'Brac bank PLC', '2026-02-01 19:19:27', '2026-02-01 19:19:27', 'active', 1, 1, 1, 1),
(6, 'Prime bank Limited', '2026-02-01 20:48:06', '2026-02-01 20:48:06', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` int DEFAULT NULL,
  `area_id` int NOT NULL,
  `latitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_name`, `mobile`, `email`, `address`, `district_id`, `area_id`, `latitude`, `longitude`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 'Uttara Head Office', '01626222777', 'info@beeonline.com.bd', 'House 9, Road 2, Sector 7, Uttara,', 13, 1, NULL, NULL, '2026-01-26 18:38:20', '2026-01-26 18:38:20', 'active', 1, 1, 1, 1),
(2, 'Khilkhet POP', '01626222777', 'info@beeonline.com.bd', 'Khikhet bazar, Khikhet Dhaka', 13, 16, NULL, NULL, '2026-01-26 18:39:20', '2026-01-26 18:39:20', 'active', 1, 1, 1, 1),
(3, 'Lalmohon POP', '01719264379', 'test@beeonline.com.bd', 'Talukder Boarding, Lalmohon, Bhola', 5, 23, '22.34005333515656', '90.7344859374057', '2026-01-29 19:33:40', '2026-01-29 19:33:40', 'active', 1, 1, 1, 1),
(4, 'Boadbazar POP', '01926596398', 'test@beeonline.com.bd', 'Block B, Bottola Road, Boadbazar, Gazipur', 18, 33, '23°56\'46.12\"N', '90°23\'4.22\"E', '2026-01-29 19:36:55', '2026-01-29 19:40:42', 'active', 1, 1, 1, 1),
(5, 'College get', '01817040723', 'test@beeonline.com.bd', 'kafil Uddin Road, tongi, Gazipur', 18, 29, '23.911515585201908', '90.39745633667522', '2026-01-29 19:39:41', '2026-01-29 19:39:41', 'active', 1, 1, 1, 1),
(6, 'Bhirab New Town', '01635273581', 'test@beeonline.com.bd', 'Bhirab Bus Stand, Bhirab, Kishoregong', 28, 22, '24.055756514825077', '90.98057244695606', '2026-01-29 19:43:23', '2026-01-29 19:43:23', 'active', 1, 1, 1, 1),
(7, 'Banani POP', '01626222777', 'info@beeonline.com.bd', 'undefined', 13, 19, NULL, NULL, '2026-01-31 01:39:35', '2026-01-31 01:39:35', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `module_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `module_name`, `title`, `slug`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Bandwidth', 'INTERNET', 'internet', 1, 'active', '2025-12-25 03:38:54', '2025-12-25 03:38:54'),
(4, 'Bandwidth', 'FNA', 'facebook', 2, 'active', '2025-12-25 03:39:08', '2025-12-25 03:39:08'),
(5, 'Bandwidth', 'Fiberathome_NTTN_DATA', 'gpt', 3, 'active', '2025-12-24 15:39:26', '2025-12-24 15:39:26'),
(6, 'Item', 'Networking', 'networking', 4, 'active', '2025-12-27 07:05:01', '2025-12-27 07:05:01'),
(7, 'Bandwidth', 'GGC', 'ggc', 5, 'active', '2026-01-26 18:19:29', '2026-01-26 18:19:29'),
(8, 'Bandwidth', 'BDIX', 'bdix', 6, 'active', '2026-01-26 18:19:49', '2026-01-26 18:19:49'),
(9, 'Bandwidth', 'Summit_NTTN_DATA', 'summit-nttn-data', 7, 'active', '2026-01-26 18:21:28', '2026-01-26 18:21:28'),
(17, 'Item', 'OLT', 'olt', 15, 'active', '2026-01-26 19:10:30', '2026-01-26 19:10:30'),
(18, 'Item', 'Patch Cord', 'patch-cord', 16, 'active', '2026-01-26 19:10:43', '2026-01-26 19:10:43'),
(19, 'Item', 'Slipper', 'slipper', 17, 'active', '2026-01-26 19:11:28', '2026-01-26 19:11:28'),
(20, 'Item', 'TJ BOX 2 WAY', 'tj-box-2-way', 18, 'active', '2026-01-26 19:11:47', '2026-01-26 19:11:47'),
(21, 'Item', 'TJ BOX 4 WAY', 'tj-box-4-way', 19, 'active', '2026-01-26 19:11:57', '2026-01-26 19:11:57'),
(22, 'Item', 'TJ BOX 8 WAY', 'tj-box-8-way', 20, 'active', '2026-01-26 19:12:06', '2026-01-26 19:12:06'),
(23, 'Item', 'Crimping tools', 'crimping-tools', 21, 'active', '2026-01-26 19:15:47', '2026-01-26 19:15:47'),
(24, 'Item', 'Cable Testers', 'cable-testers', 22, 'active', '2026-01-26 19:16:06', '2026-01-26 19:16:06'),
(25, 'Bandwidth', 'CDN', 'data', 23, 'active', '2026-01-28 10:47:38', '2026-01-28 10:47:38'),
(27, 'Bandwidth', 'Bison CDN', 'bison-cdn', 24, 'active', '2026-01-29 15:37:02', '2026-01-29 15:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_date` date NOT NULL,
  `service_id` int NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  `package_id` int DEFAULT NULL,
  `ref_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `is_commission` tinyint NOT NULL DEFAULT '0',
  `commission_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `previous_due` decimal(12,2) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `account_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` int DEFAULT NULL,
  `branch` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` int DEFAULT NULL,
  `total_bandwidth` int DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT '0.00',
  `total_include_amount` int DEFAULT NULL,
  `invoice_setup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint UNSIGNED NOT NULL,
  `is_employee` tinyint DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `reference_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_nid` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` int DEFAULT NULL,
  `percentage` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_closed` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `approved_by` int DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_meta` tinyint(1) NOT NULL DEFAULT '0',
  `meta_tag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sorting` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `slug`, `title`, `url`, `description`, `image`, `status`, `is_meta`, `meta_tag`, `meta_description`, `sorting`, `created_at`, `updated_at`) VALUES
(33, 'mollitia-id-officia', 'Mollitia id officia', '', '<p>Mollitia id officia is a phrase that may evoke thoughts about duties and responsibilities related to kindness, care, or taking responsibility for one&#39;s actions. In various contexts, such a phrase could relate to the importance of compassion in professional settings, emphasizing the need for ethical practices and understanding in the workplace.</p>\r\n\r\n<p>In a business environment, it is crucial to foster a culture that prioritizes kindness and empathy among employees. This can lead to strengthened team dynamics, increased morale, and ultimately, enhanced productivity. When individuals feel valued and understood, they are more likely to contribute positively to the organization&#39;s goals.</p>\r\n\r\n<p>Moreover, in customer service, the concept of being mindful and considerate, as suggested by the phrase, highlights the necessity of treating customers with respect and attentiveness. It serves as a reminder that every interaction can significantly impact client satisfaction and loyalty.</p>\r\n\r\n<p>In personal life, embodying the principles behind &quot;mollitia id officia&quot; encourages us to approach relationships with openness and understanding. It invites us to consider the implications of our actions and to nurture bonds that promote mutual respect and support.</p>\r\n\r\n<p>Overall, whether in professional or personal spheres, the essence of this phrase can serve as a guiding principle for fostering a more compassionate and responsible world.</p>', '{\"600x600\":\"upload\\/content\\/600x600\\/e7551e58-34d1-49db-bd55-8c853bbb0d92.avif\",\"200x200\":\"upload\\/content\\/200x200\\/5cf58c69-801c-4049-bb95-bf426d524cd3.avif\",\"50x50\":\"upload\\/content\\/50x50\\/065593cd-214b-4b6b-b82f-d61651f811a7.avif\",\"original\":\"upload\\/content\\/original\\/54af1d8f-0f8c-43f3-ba2a-e6c34b5af9dc.avif\"}', 'active', 0, '[\"test\"]', 'For more information about our award-winning products and services, please visit our website at [insert website URL]', 2, '2024-10-08 05:07:00', '2025-03-03 07:08:07'),
(35, 'about-us', 'About us', NULL, '<p data-end=\"576\" data-start=\"153\"><strong data-end=\"195\" data-start=\"153\">অ্যাপার্টমেন্ট ম্যানেজমেন্ট সফটওয়্যার</strong>&nbsp;(BD RESIDENCE) হলো একটি স্মার্ট সমাধান, যা অ্যাপার্টমেন্ট বা ভবনের ভাড়া ব্যবস্থাপনা, ফান্ড ম্যানেজমেন্ট এবং বাসিন্দাদের তথ্য সংরক্ষণকে আরও সহজ ও সুশৃঙ্খল করে তোলে। এই সফটওয়্যার ব্যবহার করে আপনি স্বয়ংক্রিয়ভাবে ইনভয়েস তৈরি করতে পারবেন, পেমেন্ট রিসিভ হলে ভাড়াটিয়াদের কাছে এসএমএস নোটিফিকেশন পাঠাতে পারবেন এবং নির্ধারিত দিনে বকেয়া ভাড়াটিয়াদের কাছে স্বয়ংক্রিয়ভাবে রিমাইন্ডার এসএমএস পাঠানো যাবে।</p>\r\n\r\n<p data-end=\"843\" data-start=\"578\">এছাড়া প্রতিটি ফ্ল্যাটের জন্য ভাড়া ও সার্ভিস চার্জ সেটআপ করার সুবিধা রয়েছে। ইউটিলিটি বিল যেমন বিদ্যুৎ, গ্যাস, পানি ইত্যাদি সহজেই যোগ করা যাবে এবং চাইলে ইনভয়েসের সাথে যুক্ত করা যাবে। ভাড়াটিয়া এসএমএস সুবিধা না নিলে তারা ইনভয়েস ও মানি রিসিট প্রিন্ট আকারে নিতে পারবেন।</p>\r\n\r\n<p data-end=\"1096\" data-start=\"845\">ভবনের রক্ষণাবেক্ষণ খরচ ও সম্পূর্ণ হিসাব সিস্টেমে সংরক্ষিত থাকবে, ফলে যেকোনো সময় মেইনটেন্যান্স হিস্ট্রি চেক করা যাবে। এছাড়াও, সফটওয়্যারটি সব ধরনের আয়-ব্যয় ও রিপোর্ট এক ক্লিকেই তৈরি করতে পারে, যা ভবন মালিক বা ম্যানেজমেন্ট কমিটির জন্য অত্যন্ত সহায়ক।</p>', '{\"636x610\":\"upload\\/content\\/636x610\\/5eb81fd3-919d-448e-aea7-c0e81ad6c7b5.avif\",\"583x559\":\"upload\\/content\\/583x559\\/4a426a83-1c3e-4e53-992d-dfc537fb534c.avif\",\"200x192\":\"upload\\/content\\/200x192\\/e66c828f-9eec-4026-929e-d47bdc439f2f.avif\",\"original\":\"upload\\/content\\/original\\/799057e2-09f7-48dc-947c-74d2b18686a4.avif\"}', 'active', 0, '[]', NULL, 3, '2025-07-13 11:59:45', '2025-09-20 04:19:27'),
(36, 'terms-condition', 'Terms & Conditions', 'https://nogorsolutions.com/', '<p>Donec pretium ornare neque, ac luctus orci ultrices at. Sed blandit eleifend mi, a consectetur tortor varius in. Sed tincidunt aliquet lorem, eget tincidunt est molestie non. Sed tincidunt aliquet lorem, eget tincidunt est molestie nonac luctus orci ultrices at.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, qui perferendis officia ex, reprehenderit quibusdam corrupti voluptas ut consequatur, ratione soluta! Vero quam sit rem tenetur dicta eligendi fugit quisquam quidem quaerat blanditiis quae temporibus, enim, nesciunt ut quasi facere consequuntur eos soluta eius placeat fugiat libero tempore itaque. Necessitatibus?</p>\r\n\r\n<ul>\r\n	<li>Pellentesque et felis elementum, varius tellus a, eleifend elit.</li>\r\n	<li>Sed ullamcorper enim ut maximus accumsan.</li>\r\n	<li>Cras tristique lacus at gravida vulputate.</li>\r\n	<li>Fusce consectetur purus ac aliquam aliquet.</li>\r\n	<li>Fusce consectetur purus ac aliquam aliquet.</li>\r\n</ul>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, qui perferendis officia ex, reprehenderit quibusdam corrupti voluptas ut consequatur, ratione soluta! Vero quam sit rem tenetur dicta eligendi fugit quisquam quidem quaerat blanditiis quae temporibus, enim, nesciunt ut quasi facere consequuntur eos soluta eius placeat fugiat libero tempore itaque. Necessitatibus?</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, qui perferendis officia ex, reprehenderit quibusdam corrupti voluptas ut consequatur, ratione soluta! Vero quam sit rem tenetur dicta eligendi fugit quisquam quidem quaerat blanditiis quae temporibus, enim, nesciunt ut quasi facere consequuntur eos soluta eius placeat fugiat libero tempore itaque. Necessitatibus?</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, qui perferendis officia ex, reprehenderit quibusdam corrupti voluptas ut consequatur, ratione soluta! Vero quam sit rem tenetur dicta eligendi fugit quisquam quidem quaerat blanditiis quae temporibus, enim, nesciunt ut quasi facere consequuntur eos soluta eius placeat fugiat libero tempore itaque. Necessitatibus?</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, qui perferendis officia ex, reprehenderit quibusdam corrupti voluptas ut consequatur, ratione soluta! Vero quam sit rem tenetur dicta eligendi fugit quisquam quidem quaerat blanditiis quae temporibus, enim, nesciunt ut quasi facere consequuntur eos soluta eius placeat fugiat libero tempore itaque. Necessitatibus?</p>', 'null', 'active', 0, '[]', NULL, 4, '2025-07-16 10:31:36', '2025-07-17 08:54:55'),
(37, 'privacy-policy', 'Privacy Policy', 'https://nogorsolutions.com/', '<p>Donec pretium ornare neque, ac luctus orci ultrices at. Sed blandit eleifend mi, a consectetur tortor varius in. Sed tincidunt aliquet lorem, eget tincidunt est molestie non. Sed tincidunt aliquet lorem, eget tincidunt est molestie nonac luctus orci ultrices at.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, qui perferendis officia ex, reprehenderit quibusdam corrupti voluptas ut consequatur, ratione soluta! Vero quam sit rem tenetur dicta eligendi fugit quisquam quidem quaerat blanditiis quae temporibus, enim, nesciunt ut quasi facere consequuntur eos soluta eius placeat fugiat libero tempore itaque. Necessitatibus?</p>\r\n\r\n<ul>\r\n	<li>Pellentesque et felis elementum, varius tellus a, eleifend elit.</li>\r\n	<li>Sed ullamcorper enim ut maximus accumsan.</li>\r\n	<li>Cras tristique lacus at gravida vulputate.</li>\r\n	<li>Fusce consectetur purus ac aliquam aliquet.</li>\r\n	<li>Fusce consectetur purus ac aliquam aliquet.1</li>\r\n</ul>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, qui perferendis officia ex, reprehenderit quibusdam corrupti voluptas ut consequatur, ratione soluta! Vero quam sit rem tenetur dicta eligendi fugit quisquam quidem quaerat blanditiis quae temporibus, enim, nesciunt ut quasi facere consequuntur eos soluta eius placeat fugiat libero tempore itaque. Necessitatibus?</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, qui perferendis officia ex, reprehenderit quibusdam corrupti voluptas ut consequatur, ratione soluta! Vero quam sit rem tenetur dicta eligendi fugit quisquam quidem quaerat blanditiis quae temporibus, enim, nesciunt ut quasi facere consequuntur eos soluta eius placeat fugiat libero tempore itaque. Necessitatibus?</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, qui perferendis officia ex, reprehenderit quibusdam corrupti voluptas ut consequatur, ratione soluta! Vero quam sit rem tenetur dicta eligendi fugit quisquam quidem quaerat blanditiis quae temporibus, enim, nesciunt ut quasi facere consequuntur eos soluta eius placeat fugiat libero tempore itaque. Necessitatibus?</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, qui perferendis officia ex, reprehenderit quibusdam corrupti voluptas ut consequatur, ratione soluta! Vero quam sit rem tenetur dicta eligendi fugit quisquam quidem quaerat blanditiis quae temporibus, enim, nesciunt ut quasi facere consequuntur eos soluta eius placeat fugiat libero tempore itaque. Necessitatibus?</p>', 'null', 'active', 0, '[]', NULL, 5, '2025-07-16 10:32:06', '2025-07-17 08:55:22');

-- --------------------------------------------------------

--
-- Table structure for table `content_files`
--

CREATE TABLE `content_files` (
  `id` bigint UNSIGNED NOT NULL,
  `content_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_files`
--

INSERT INTO `content_files` (`id`, `content_id`, `title`, `file`, `sorting`, `created_at`, `updated_at`) VALUES
(12, 33, 'Distinctio Voluptat', 'upload/content-files/250115060125-5627Parking Area Management System.docx', NULL, '2024-10-08 05:07:01', '2025-01-15 12:01:25'),
(15, 33, 'kgkjg', 'upload/content-files/250115060125-5303Parking Area Management System.docx', NULL, '2025-01-15 12:01:25', '2025-01-15 12:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic` decimal(12,2) DEFAULT '0.00',
  `house_rent` decimal(12,2) DEFAULT '0.00',
  `medical` decimal(12,2) DEFAULT '0.00',
  `other` decimal(12,2) DEFAULT '0.00',
  `total_salary` decimal(12,2) DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `title`, `basic`, `house_rent`, `medical`, `other`, `total_salary`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 'Manager', 10000.00, 5000.00, 3000.00, 2000.00, 20000.00, '2025-12-17 12:37:12', '2025-12-17 12:37:12', 'active', 1, 1, 1, 1),
(2, 'Accounts Officer', 8000.00, 4000.00, 2000.00, 2000.00, 16000.00, '2025-12-17 12:39:11', '2025-12-17 12:39:11', 'active', 1, 1, 1, 1),
(3, 'Executive Support & Services', 0.00, 0.00, 0.00, 0.00, NULL, '2026-01-26 19:03:59', '2026-01-26 19:03:59', 'active', 1, 1, 1, 1),
(4, 'Cable Technician', 0.00, 0.00, 0.00, 0.00, 0.00, '2026-01-26 19:04:58', '2026-01-26 19:04:58', 'active', 1, 1, 1, 1),
(5, 'Senior Cable Technician', 0.00, 0.00, 0.00, 0.00, 0.00, '2026-01-26 19:05:19', '2026-01-26 19:05:19', 'active', 1, 1, 1, 1),
(6, 'Senior Executive Support & Services', 0.00, 0.00, 0.00, 0.00, 0.00, '2026-01-26 19:05:58', '2026-01-26 19:05:58', 'active', 1, 1, 1, 1),
(7, 'Executive Accounts', 0.00, 0.00, 0.00, 0.00, 0.00, '2026-01-26 19:06:22', '2026-01-26 19:06:22', 'active', 1, 1, 1, 1),
(8, 'Accounts Manager', 0.00, 0.00, 0.00, 0.00, 0.00, '2026-01-26 19:06:37', '2026-01-26 19:06:37', 'active', 1, 1, 1, 1),
(9, 'System Administrator', 0.00, 0.00, 0.00, 0.00, 0.00, '2026-01-26 19:07:06', '2026-01-26 19:07:06', 'active', 1, 1, 1, 1),
(10, 'Chief Technical Officer', 0.00, 0.00, 0.00, 0.00, 0.00, '2026-01-26 19:07:28', '2026-01-26 19:07:28', 'active', 1, 1, 1, 1),
(11, 'Manager Support', 0.00, 0.00, 0.00, 0.00, 0.00, '2026-01-26 19:07:41', '2026-01-26 19:07:41', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint UNSIGNED NOT NULL,
  `district_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `district_name`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 'Bagerhat', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(2, 'Bandarban', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(3, 'Barguna', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(4, 'Barisal', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(5, 'Bhola', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(6, 'Bogra', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(7, 'Brahmanbaria', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(8, 'Chandpur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(9, 'Chittagong', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(10, 'Chuadanga', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(11, 'Comilla', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(12, 'Cox\'s Bazar', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(13, 'Dhaka', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(14, 'Dinajpur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(15, 'Faridpur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(16, 'Feni', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(17, 'Gaibandha', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(18, 'Gazipur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(19, 'Gopalganj', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(20, 'Habiganj', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(21, 'Jamalpur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(22, 'Jessore', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(23, 'Jhalokati', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(24, 'Jhenaidah', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(25, 'Joypurhat', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(26, 'Khagrachhari', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(27, 'Khulna', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(28, 'Kishoreganj', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(29, 'Kurigram', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(30, 'Kushtia', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(31, 'Lakshmipur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(32, 'Lalmonirhat', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(33, 'Madaripur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(34, 'Magura', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(35, 'Manikganj', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(36, 'Meherpur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(37, 'Moulvibazar', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(38, 'Munshiganj', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(39, 'Mymensingh', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(40, 'Naogaon', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(41, 'Narail', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(42, 'Narayanganj', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(43, 'Narsingdi', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(44, 'Natore', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(45, 'Nawabganj', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(46, 'Netrakona', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(47, 'Nilphamari', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(48, 'Noakhali', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(49, 'Pabna', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(50, 'Panchagarh', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(51, 'Patuakhali', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(52, 'Pirojpur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(53, 'Rajbari', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(54, 'Rajshahi', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(55, 'Rangamati', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(56, 'Rangpur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(57, 'Satkhira', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(58, 'Shariatpur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(59, 'Sherpur', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(60, 'Sirajganj', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(61, 'Sunamganj', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(62, 'Sylhet', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(63, 'Tangail', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1),
(64, 'Thakurgaon', '2025-12-17 02:45:27', '2025-12-17 02:45:27', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint UNSIGNED NOT NULL,
  `empid` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `joining_date` date NOT NULL,
  `designation_id` int DEFAULT NULL,
  `salary` decimal(12,2) NOT NULL DEFAULT '0.00',
  `full_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `nid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` int DEFAULT NULL,
  `branch` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_occupation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_nid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_occupation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_nid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `image` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `resign_date` date DEFAULT NULL,
  `resign_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_salaries`
--

CREATE TABLE `employee_salaries` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` int NOT NULL,
  `salary_parameter_id` int NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `expenseid` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_date` date NOT NULL,
  `branch_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `approved_by` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_details`
--

CREATE TABLE `expense_details` (
  `id` bigint UNSIGNED NOT NULL,
  `expense_id` int NOT NULL,
  `account_id` int NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `narration` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_closed` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_years`
--

CREATE TABLE `financial_years` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_current` tinyint NOT NULL,
  `is_closed` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financial_years`
--

INSERT INTO `financial_years` (`id`, `title`, `start_date`, `end_date`, `is_current`, `is_closed`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 'FY 2020 - 2021', '2020-07-01', '2021-06-30', 0, 1, '2025-12-23 21:35:37', '2025-12-23 21:35:37', 'active', 1, 1, 1, 1),
(2, 'FY 2021-2022', '2021-07-01', '2022-06-30', 0, 1, '2025-12-24 03:40:03', '2025-12-24 03:40:03', 'active', 1, 1, 1, 1),
(3, 'FY 2022-2023', '2022-07-01', '2023-06-30', 0, 1, '2025-12-24 03:40:59', '2025-12-24 03:40:59', 'active', 1, 1, 1, 1),
(4, 'FY 2023-2024', '2023-07-01', '2024-06-30', 0, 0, '2025-12-24 03:41:55', '2025-12-24 03:41:55', 'active', 1, 1, 1, 1),
(5, 'FY 2024-2025', '2024-07-01', '2025-06-30', 0, 0, '2025-12-24 03:42:48', '2025-12-24 03:42:48', 'active', 1, 1, 1, 1),
(6, 'FY 2025-2026', '2025-07-01', '2026-06-30', 1, 0, '2025-12-24 03:43:29', '2025-12-24 03:43:29', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `fund_account_balance`
-- (See below for the actual view)
--
CREATE TABLE `fund_account_balance` (
`account_id` bigint unsigned
,`account_name` varchar(150)
,`current_balance` decimal(36,2)
,`opening_balance` decimal(12,2)
,`opening_balance_type` varchar(225)
,`total_credit` decimal(34,2)
,`total_debit` decimal(34,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfers`
--

CREATE TABLE `fund_transfers` (
  `id` bigint UNSIGNED NOT NULL,
  `transfer_date` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int NOT NULL,
  `to_account_id` int NOT NULL,
  `amount` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` int NOT NULL,
  `invoice_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `original_amount` decimal(12,2) NOT NULL,
  `discount` decimal(12,2) DEFAULT NULL,
  `vat` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(8,2) NOT NULL,
  `paid_amount` decimal(8,2) DEFAULT NULL,
  `is_previous_due` tinyint NOT NULL DEFAULT '0',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_count` int DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `month_count` int NOT NULL DEFAULT '0',
  `total_amount` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_months`
--

CREATE TABLE `invoice_months` (
  `id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `client_id` int NOT NULL,
  `invoice_month` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` bigint UNSIGNED NOT NULL,
  `issueno` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` int NOT NULL,
  `department` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_date` date NOT NULL,
  `employee_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `remarks` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issue_details`
--

CREATE TABLE `issue_details` (
  `id` bigint UNSIGNED NOT NULL,
  `issue_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `item_id` int NOT NULL,
  `qty` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint UNSIGNED NOT NULL,
  `barcode` int NOT NULL,
  `category_id` int NOT NULL,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` int NOT NULL,
  `opening_qty` int DEFAULT NULL,
  `opening_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `barcode`, `category_id`, `title`, `image`, `description`, `unit_id`, `opening_qty`, `opening_rate`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 111, 6, 'RJ45', 'upload/item/251228065554-8835591730373_1179176734426113_5920043827941920060_n.jpg', 'n/a', 4, 10, 200.00, '2025-12-28 00:55:54', '2026-01-02 12:59:23', 'active', 1, 1, 1, 1),
(2, 112, 6, 'Cable', 'upload/item/251228072427-8892591730373_1179176734426113_5920043827941920060_n.jpg', 'undefined', 2, 500, 200.00, '2025-12-28 01:24:27', '2026-01-02 12:59:28', 'active', 1, 1, 1, 1),
(3, 113, 6, 'Crimp Tool for Fiber', 'upload/item/260115015745-5979111.jpeg', 'undefined', 3, NULL, 0.00, '2026-01-15 07:57:45', '2026-01-15 07:57:45', 'active', 1, 1, 1, 1),
(4, 114, 6, '5\" Full Flush Cut Side Cutting Pliers', 'upload/item/260115015917-9024112.jpeg', 'undefined', 3, NULL, NULL, '2026-01-15 07:59:17', '2026-01-15 07:59:17', 'active', 1, 1, 1, 1),
(5, 115, 6, 'Cable 2 Core', NULL, 'undefined', 2, NULL, NULL, '2026-01-29 20:14:30', '2026-01-29 20:14:30', 'active', 1, 1, 1, 1),
(6, 116, 6, 'Cable 4 Core', NULL, 'undefined', 2, NULL, NULL, '2026-01-29 20:14:42', '2026-01-29 20:14:42', 'active', 1, 1, 1, 1),
(7, 117, 6, 'Cable 6 Core', NULL, 'undefined', 2, NULL, NULL, '2026-01-29 20:14:58', '2026-01-29 20:14:58', 'active', 1, 1, 1, 1),
(8, 118, 6, 'Cable 12 Core', NULL, 'undefined', 2, NULL, NULL, '2026-01-29 20:15:11', '2026-01-29 20:15:11', 'active', 1, 1, 1, 1),
(9, 119, 6, 'Cable 24 Core', NULL, 'undefined', 2, NULL, NULL, '2026-01-29 20:15:23', '2026-01-29 20:15:23', 'active', 1, 1, 1, 1),
(10, 120, 6, 'OLT', NULL, 'undefined', 3, NULL, NULL, '2026-02-01 19:22:34', '2026-02-01 19:22:34', 'active', 1, 1, 1, 1),
(11, 121, 6, 'PON MODULE', NULL, 'undefined', 3, NULL, NULL, '2026-02-01 19:23:50', '2026-02-01 19:23:50', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `item_stock_summaries`
-- (See below for the actual view)
--
CREATE TABLE `item_stock_summaries` (
`current_stock` decimal(33,0)
,`item_id` int
,`total_qty_in` decimal(32,0)
,`total_qty_out` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `loan_infos`
--

CREATE TABLE `loan_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `trnsid` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trns_date` date NOT NULL,
  `employee_id` int NOT NULL,
  `trns_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `total_installment` int NOT NULL,
  `installment_amount` int NOT NULL,
  `deduct_from_salary` tinyint(1) NOT NULL,
  `schedule_day` int DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `due_amount` decimal(8,2) NOT NULL,
  `reason` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint NOT NULL DEFAULT '0',
  `is_closed` tinyint NOT NULL DEFAULT '0',
  `approved_by` int DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_installments`
--

CREATE TABLE `loan_installments` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deduct_from_salary` tinyint NOT NULL DEFAULT '0',
  `loan_info_id` int NOT NULL,
  `instalment_date` date NOT NULL,
  `is_closed` tinyint NOT NULL DEFAULT '0',
  `amount` decimal(12,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int NOT NULL,
  `created_ip` int NOT NULL,
  `updated_ip` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_05_26_071839_create_roles_table', 1),
(6, '2020_06_01_101148_create_site_settings_table', 1),
(7, '2020_06_01_102821_create_contents_table', 1),
(8, '2020_06_02_044523_create_content_files_table', 1),
(9, '2020_06_08_140638_create_sliders_table', 1),
(10, '2020_06_09_051430_create_albums_table', 1),
(11, '2020_06_09_053929_create_photos_table', 1),
(12, '2020_06_09_072128_create_videos_table', 1),
(13, '2020_06_10_120859_create_front_menus_table', 1),
(14, '2021_02_22_050702_create_permissions_table', 1),
(15, '2021_02_22_050735_create_role_permissions_table', 1),
(16, '2021_02_22_062756_create_menus_table', 1),
(17, '2021_02_26_100135_create_news_table', 1),
(18, '2022_06_23_053641_create_admins_table', 1),
(19, '2022_07_16_095130_create_activity_log_table', 1),
(20, '2022_12_11_104109_create_plugins_table', 1),
(21, '2022_12_21_083741_create_event_schedules_table', 1),
(22, '2023_02_08_033828_create_profiles_table', 1),
(23, '2023_05_04_112200_create_slider_details_table', 1),
(24, '2023_05_11_110836_create_user_login_infos_table', 1),
(25, '2023_06_01_055529_create_notices_table', 1),
(26, '2023_06_05_105945_create_categories_table', 1),
(27, '2023_06_05_111140_create_events_table', 1),
(28, '2023_06_06_122755_create_contacts_table', 1),
(29, '2023_06_07_041032_create_faqs_table', 1),
(30, '2023_06_14_045514_create_countries_table', 1),
(31, '2024_01_01_102809_create_employees_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `notice_date` date NOT NULL,
  `notice_end` date DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `title`, `slug`, `category_id`, `notice_date`, `notice_end`, `type`, `file`, `description`, `sorting`, `status`, `created_at`, `updated_at`, `created_by`, `created_ip`, `updated_by`, `updated_ip`) VALUES
(16, 'Scheduled System Maintenance', 'scheduled-system-maintenance', 21, '2024-10-07', '2024-10-09', 'content', NULL, '<p><strong>Date:</strong>&nbsp;[Insert Date]<br />\r\n<strong>Time:</strong>&nbsp;[Insert Time]<br />\r\n<strong>Duration:</strong>&nbsp;Approximately [Insert Duration]</p>\r\n\r\n<p><strong>Attention Team,</strong></p>\r\n\r\n<p>Please be informed that we will be performing scheduled system maintenance on [insert date] from [insert start time] to [insert end time]. During this period, access to our software applications and internal systems may be limited or temporarily unavailable.</p>\r\n\r\n<p>This maintenance is essential for improving system performance and ensuring the security and reliability of our services. We recommend that you save your work and log out of relevant systems before the maintenance window begins.</p>\r\n\r\n<p>Thank you for your understanding as we work to enhance our software capabilities.</p>\r\n\r\n<p>Best regards,<br />\r\n[Your Name]<br />\r\n[Your Position]<br />\r\n[Company Name]</p>', 1, 'active', '2024-10-08 03:40:05', '2024-10-08 03:40:05', 'Nogor Solutions Limited', '221.120.98.178', NULL, NULL),
(17, 'HR Policy Update', 'hr-policy-update', 22, '2024-10-08', '2024-10-09', 'file', 'upload/notice/241008094128-9737events.pdf', NULL, 2, 'active', '2024-10-08 03:41:28', '2024-10-08 03:41:28', 'Nogor Solutions Limited', '221.120.98.178', NULL, NULL),
(18, 'fgfdgfddsfds', 'fgfdgfd', 21, '2025-03-04', NULL, 'file', 'upload/notice/250303012620-4431pastPresident.pdf', NULL, 3, 'active', '2025-03-03 07:25:53', '2025-03-03 07:26:20', 'Nogor Solutions Limited', '221.120.98.178', 'Nogor Solutions Limited', '221.120.98.178');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint UNSIGNED NOT NULL,
  `service_id` int DEFAULT NULL,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bandwidth` int NOT NULL,
  `unit_id` int DEFAULT NULL,
  `package_price` decimal(12,2) NOT NULL,
  `vat` decimal(12,2) NOT NULL DEFAULT '0.00',
  `price` decimal(8,2) NOT NULL,
  `commission_percentage` int DEFAULT NULL,
  `commission_amount` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `payslipno` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `uplink_provider_id` int DEFAULT NULL,
  `office_expense` tinyint DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `payment_date` date NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `payment_method` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mbanking_type` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chequeno` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` int DEFAULT NULL,
  `branch` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountno` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trxid` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` date DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` int NOT NULL,
  `reference_type` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int NOT NULL,
  `account_id` int DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL,
  `is_closed` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` date DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `invoiceno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` date NOT NULL,
  `supplier_id` int NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `is_closed` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_id` int NOT NULL,
  `category_id` int NOT NULL,
  `item_id` int NOT NULL,
  `qty` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `unit_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_parameters`
--

CREATE TABLE `salary_parameters` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_basic` tinyint NOT NULL DEFAULT '0',
  `percentage_of_basic` int NOT NULL DEFAULT '0',
  `sorting` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_parameters`
--

INSERT INTO `salary_parameters` (`id`, `title`, `is_basic`, `percentage_of_basic`, `sorting`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 'Basic', 1, 0, 0, '2026-01-19 23:47:18', '2026-01-19 23:47:18', 'active', 1, 1, 1, 1),
(2, 'House Rentt', 0, 50, 1, '2026-01-19 17:49:59', '2026-01-19 17:49:59', 'active', 1, 1, 1, 1),
(3, 'Madical', 0, 30, 2, '2026-01-20 10:53:30', '2026-01-20 10:53:30', 'active', 1, 1, 1, 1),
(4, 'Communication', 0, 20, 3, '2026-01-20 10:54:10', '2026-01-20 10:54:10', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salary_sheets`
--

CREATE TABLE `salary_sheets` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `generated_date` date NOT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_sheet_details`
--

CREATE TABLE `salary_sheet_details` (
  `id` bigint UNSIGNED NOT NULL,
  `salary_sheet_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `salary` decimal(8,2) NOT NULL,
  `commission` decimal(12,2) NOT NULL DEFAULT '0.00',
  `bonus` decimal(8,2) NOT NULL DEFAULT '0.00',
  `installment` decimal(12,2) NOT NULL DEFAULT '0.00',
  `installment_history` text COLLATE utf8mb4_unicode_ci,
  `deduct` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total` decimal(8,2) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_invoice` tinyint NOT NULL DEFAULT '0',
  `module` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `slug`, `auto_invoice`, `module`, `sorting`, `description`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(4, 'Home (Retail)', 'home-retail', 1, 'Invoice', 1, 'undefined', '2025-12-16 05:36:12', '2026-02-09 02:01:04', 'active', 1, 1, 1, 1),
(5, 'Corporate', 'corporate', 1, 'Invoice', 2, 'N/A', '2025-12-16 05:39:31', '2026-02-09 01:59:29', 'active', 1, 1, 1, 1),
(6, 'MAC', 'mac', 0, NULL, 3, 'undefined', '2025-12-16 05:39:44', '2025-12-16 05:39:44', 'active', 1, 1, 1, 1),
(7, 'Wholesale', 'wholesale', 1, 'BandwidthHistory', 4, 'N/A', '2025-12-16 05:40:26', '2026-02-09 01:44:28', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo_small` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `favicon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address_two` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `web` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tw` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ln` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `yt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `residence` int DEFAULT NULL,
  `flat` int DEFAULT NULL,
  `resident` int DEFAULT NULL,
  `registration` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `title`, `short_title`, `contact_email`, `feedback_email`, `mobile1`, `mobile2`, `logo`, `logo_small`, `favicon`, `address`, `address_two`, `web`, `fb`, `tw`, `ln`, `yt`, `map`, `residence`, `flat`, `resident`, `registration`, `created_at`, `updated_at`) VALUES
(1, 'BEE ONLINE', 'BEE ONLINE', 'info@beeonline.com.bd', 'info@beeonline.com.bd', '+880 1912 252095', '+880 1620 221377', '{\"300x90\":\"upload\\/logo\\/300x90\\/00b10cc7-ffbc-4e35-b9d9-618c78d164c3.avif\",\"original\":\"upload\\/logo\\/original\\/277721e2-abcd-4a02-9394-c8767ce6ef13.avif\"}', '{\"261x90\":\"upload\\/logo_small\\/261x90\\/3ddda786-3230-461c-a7b8-7878623214d7.avif\",\"original\":\"upload\\/logo_small\\/original\\/7dbf2257-026f-452e-a9bc-57ee99430759.avif\"}', 'upload/conf/251223112038-2765291690958_463993112398175_4431593674443078221_n.jpg', 'Uttara, Dhaka', NULL, 'https://beeonline.com.bd', 'https://beeonline.com.bd', 'https://beeonline.com.bd', 'https://beeonline.com.bd', 'https://beeonline.com.bd', NULL, 12, 934, 934, 20, '2024-07-02 03:14:27', '2026-01-26 18:29:58');

-- --------------------------------------------------------

--
-- Table structure for table `stock_transactions`
--

CREATE TABLE `stock_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` int NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` enum('Opening','Purchase','Issue','Adjustment') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_type` enum('Purchase','Issue','','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_in` int NOT NULL DEFAULT '0',
  `qty_out` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_transactions`
--

INSERT INTO `stock_transactions` (`id`, `item_id`, `transaction_date`, `transaction_type`, `reference_type`, `reference_id`, `qty_in`, `qty_out`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 2, '2026-01-08', 'Purchase', 'Purchase', '1', 2000, 0, '2026-01-29 20:10:31', '2026-01-29 20:10:31', 'active', 1, 1, 1, 1),
(2, 5, '2026-01-08', 'Purchase', 'Purchase', NULL, 2000, 0, '2026-01-29 20:17:20', '2026-01-29 20:17:20', 'active', 1, 1, 1, 1),
(5, 6, '2026-01-08', 'Purchase', 'Purchase', NULL, 3103, 0, '2026-01-29 20:34:31', '2026-01-29 20:34:31', 'active', 1, 1, 1, 1),
(6, 5, '2026-01-08', 'Purchase', 'Purchase', NULL, 1000, 0, '2026-01-29 20:34:31', '2026-01-29 20:34:31', 'active', 1, 1, 1, 1),
(7, 5, '2026-01-08', 'Purchase', 'Purchase', '3', 1000, 0, '2026-01-29 20:41:06', '2026-01-29 20:41:06', 'active', 1, 1, 1, 1),
(8, 6, '2026-01-08', 'Purchase', 'Purchase', '3', 2915, 0, '2026-01-29 20:41:06', '2026-01-29 20:41:06', 'active', 1, 1, 1, 1),
(9, 5, '2026-01-31', 'Purchase', 'Purchase', '4', 2000, 0, '2026-01-31 22:19:32', '2026-01-31 22:19:32', 'active', 1, 1, 1, 1),
(10, 1, '2026-01-31', 'Purchase', 'Purchase', '4', 100, 0, '2026-01-31 22:19:32', '2026-01-31 22:19:32', 'active', 1, 1, 1, 1),
(12, 10, '2026-01-22', 'Purchase', 'Purchase', NULL, 1, 0, '2026-02-01 19:24:36', '2026-02-01 19:24:36', 'active', 1, 1, 1, 1),
(13, 11, '2026-01-22', 'Purchase', 'Purchase', NULL, 4, 0, '2026-02-01 19:24:36', '2026-02-01 19:24:36', 'active', 1, 1, 1, 1),
(14, 6, '2026-02-01', 'Purchase', 'Purchase', '6', 3020, 0, '2026-02-01 21:44:03', '2026-02-01 21:44:03', 'active', 1, 1, 1, 1),
(15, 5, '2026-02-01', 'Purchase', 'Purchase', '7', 2000, 0, '2026-02-01 21:45:42', '2026-02-01 21:45:42', 'active', 1, 1, 1, 1),
(16, 6, '2026-02-01', 'Purchase', 'Purchase', '7', 4007, 0, '2026-02-01 21:45:42', '2026-02-01 21:45:42', 'active', 1, 1, 1, 1),
(17, 5, '2026-02-03', 'Purchase', 'Purchase', '1', 1000, 0, '2026-02-03 08:00:38', '2026-02-03 08:00:38', 'active', 1, 1, 1, 1),
(18, 4, '2026-02-03', 'Purchase', 'Purchase', '1', 1, 0, '2026-02-03 08:00:38', '2026-02-03 08:00:38', 'active', 1, 1, 1, 1),
(20, 5, '2026-02-09', 'Purchase', 'Purchase', '1', 1000, 0, '2026-02-09 14:46:30', '2026-02-09 14:46:30', 'active', 1, 1, 1, 1),
(21, 6, '2026-02-09', 'Purchase', 'Purchase', '1', 1000, 0, '2026-02-09 14:46:30', '2026-02-09 14:46:30', 'active', 1, 1, 1, 1),
(22, 7, '2026-02-09', 'Purchase', 'Purchase', '1', 1000, 0, '2026-02-09 14:46:30', '2026-02-09 14:46:30', 'active', 1, 1, 1, 1),
(24, 1, '2026-02-18', 'Purchase', 'Purchase', NULL, 100, 0, '2026-02-18 06:29:03', '2026-02-18 06:29:03', 'active', 1, 1, 1, 1),
(25, 1, '2026-02-18', 'Purchase', 'Purchase', NULL, 100, 0, '2026-02-18 06:30:29', '2026-02-18 06:30:29', 'active', 1, 1, 1, 1),
(26, 1, '2026-02-18', 'Purchase', 'Purchase', NULL, 100, 0, '2026-02-18 06:31:19', '2026-02-18 06:31:19', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `supid` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `website` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supid`, `org_name`, `name`, `designation`, `mobile`, `email`, `address`, `website`, `account_name`, `bank_name`, `branch`, `account_no`, `routing`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, '111', 'ofs cable industries limited', 'Farid Ahmed', NULL, '01322876519', 'test@beeonline.com.bd', 'House 67, Road 4, Block c, banani, 1213 Dhaka', 'www.ofscables.com', NULL, 'Brac bank PLC', 'banani', '1507205076464001', '060260435', '2026-01-29 20:05:51', '2026-01-29 20:05:51', 'active', 1, 1, 1, 1),
(2, '112', 'SAS TECH Limited', 'Ariful Islam', NULL, '01896293304', 'sales@sastechbd.com', 'Samir Tower, 3rd Floor,,308 Elephant Road, dhaka', NULL, 'ECOM NETWORKS', NULL, 'MOTIZHEL', '2067365640001', NULL, '2026-02-01 19:19:07', '2026-02-01 19:19:07', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorting` int NOT NULL,
  `designation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `image`, `name`, `slug`, `sorting`, `designation`, `description`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(11, '{\"90x90\":\"upload\\/image\\/90x90\\/7adb762e-4881-4491-b963-56663ccb5f3f.avif\",\"30x30\":\"upload\\/image\\/30x30\\/85ccf16d-1cab-413e-8e15-e05b96c5a76f.avif\",\"original\":\"upload\\/image\\/original\\/15760d84-c828-42cb-afb5-56955642d836.avif\"}', 'মোহাম্মাদ মামুন', 'mohammad-mamun', 0, 'প্রগ্রামার, ব্রাক', 'বিডি রেসিডেন্স একটি অসাধারন সফটওয়্যার, আমি নিজে ব্যবহার করছি। এটী একটি যুগপোযোগী সফটওয়্যার। এই সফটওয়্যার ব্যবহার করে আমি এখন নিশ্চিন্ত ভাড়া আদায়ের জন্য কোন চিন্তা করতে হয় না।', '2025-09-19 05:20:40', '2025-09-19 05:20:40', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `module`, `title`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 'Service', 'Mbps', '2025-12-16 05:15:49', '2025-12-16 05:15:49', 'active', 1, 1, 1, 1),
(2, 'Item', 'Meter', '2025-12-16 11:48:59', '2025-12-16 11:48:59', 'active', 1, 1, 1, 1),
(3, 'Item', 'Pcs', '2025-12-28 01:18:01', '2025-12-28 01:18:01', 'active', 1, 1, 1, 1),
(4, 'Item', 'Packet', '2025-12-28 01:18:29', '2025-12-28 01:18:29', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `uplink_providers`
--

CREATE TABLE `uplink_providers` (
  `id` bigint UNSIGNED NOT NULL,
  `org_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_person` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_contacts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` int DEFAULT NULL,
  `branch` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_purchase_date` date DEFAULT NULL,
  `previous_due` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uplink_providers`
--

INSERT INTO `uplink_providers` (`id`, `org_name`, `email`, `phone`, `address`, `contact_person`, `contact_person_mobile`, `alternative_contacts`, `website`, `account_name`, `account_no`, `bank_id`, `branch`, `previous_purchase_date`, `previous_due`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(11, 'Summit Communication Limited', 'partha.sarkar@summitcommunications.net', '01923444999', 'House # 43, Anowerbag', NULL, '01923444999', '[{\"designation\":null,\"contact_person\":null,\"contact_no\":null}]', NULL, 'Summit Communication Limited', '34567', 1, 'Uttara', '2026-01-15', 345670.00, '2025-12-23 12:38:53', '2026-02-07 12:25:23', 'active', 1, 1, 1, 1),
(12, 'Fiber@home Global Limited', 'tech.fgl@fiberathome.net', '01677780466', 'Gulshan Dhaka', NULL, '01677780466', '[{\"designation\":null,\"contact_person\":null,\"contact_no\":null}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-23 12:46:31', '2026-02-01 14:27:39', 'active', 1, 1, 1, 1),
(13, 'Fiber@home Limited', 'khayom.parvez@fiberathome.net', NULL, 'Gulshan Dhaka', NULL, '01678618238', '[{\"designation\":null,\"contact_person\":null,\"contact_no\":null}]', NULL, 'Fiber@home Limited', '234589933455', 1, 'Uttara', NULL, NULL, '2026-01-26 18:43:56', '2026-02-01 15:41:50', 'active', 1, 1, 1, 1),
(14, 'Summit Communication NTTN', 'partha.sarkar@summitcommunications.net', '01923444999', 'Dhaka', 'partho Sarker', '01923444999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-26 18:47:42', '2026-01-26 18:47:42', 'active', 1, 1, 1, 1),
(15, 'virgo communication ltd', 'billing@virgoiig.com', '01958345713', 'Gulshan Dhaka', 'Setu Rahman', '01674439925', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-26 18:50:55', '2026-01-26 18:50:55', 'active', 1, 1, 1, 1),
(16, 'SM MAXHUB', NULL, NULL, 'Badda Dhaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-26 18:51:18', '2026-01-26 18:51:18', 'active', 1, 1, 1, 1),
(17, 'Spectra Technologies Limited', NULL, NULL, 'Elephant road, Dhaka', 'Oliul Haque', '01719988494', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-26 18:53:31', '2026-01-26 19:02:17', 'active', 1, 1, 1, 1),
(18, 'STR', NULL, NULL, 'Kawran bazar', 'Shimul haque', '016290695544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-26 18:55:38', '2026-01-26 18:55:38', 'active', 1, 1, 1, 1),
(19, 'Harding Poole', 'lypajaf@mailinator.com', '+1 (532) 355-6173', 'Explicabo Eu et aut', 'Labore sunt ad volup', '01643377778', '[{\"designation\":\"Tenetur ut anim eum \",\"contact_person\":\"Labore sunt ad volup\",\"contact_no\":\"10633\"}]', 'https://www.vel.org.uk', 'Veronica Stephenson', '32589', 2, 'Uttara', '2026-01-02', 354671.00, '2026-02-07 12:26:39', '2026-02-07 13:12:37', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_login_histories`
--

CREATE TABLE `user_login_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `user_guard` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_at` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_browser_client` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint UNSIGNED NOT NULL,
  `voucherno` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_type` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_date` date NOT NULL,
  `narration` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `financial_year_id` int NOT NULL,
  `payment_id` int DEFAULT NULL,
  `source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_details`
--

CREATE TABLE `voucher_details` (
  `id` bigint UNSIGNED NOT NULL,
  `voucher_id` int NOT NULL,
  `account_id` int NOT NULL,
  `dr_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `cr_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `reference_type` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` int DEFAULT NULL,
  `line_narration` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` date DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawls`
--

CREATE TABLE `withdrawls` (
  `id` bigint UNSIGNED NOT NULL,
  `withdrwal_date` date NOT NULL,
  `amount` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `fund_account_balance`
--
DROP TABLE IF EXISTS `fund_account_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fund_account_balance`  AS SELECT `a`.`id` AS `account_id`, `a`.`account_name` AS `account_name`, `a`.`opening_balance` AS `opening_balance`, `a`.`opening_balance_type` AS `opening_balance_type`, ifnull(sum(`vd`.`dr_amount`),0) AS `total_debit`, ifnull(sum(`vd`.`cr_amount`),0) AS `total_credit`, (((case when (`a`.`opening_balance_type` = 'Credit') then -(`a`.`opening_balance`) else `a`.`opening_balance` end) + ifnull(sum(`vd`.`dr_amount`),0)) - ifnull(sum(`vd`.`cr_amount`),0)) AS `current_balance` FROM (`accounts` `a` left join `voucher_details` `vd` on(((`vd`.`account_id` = `a`.`id`) and (`vd`.`deleted_at` is null) and (`vd`.`status` = 'active')))) WHERE ((`a`.`is_fund_account` = 1) AND (`a`.`status` = 'active')) GROUP BY `a`.`id`, `a`.`account_name`, `a`.`opening_balance`, `a`.`opening_balance_type` ;

-- --------------------------------------------------------

--
-- Structure for view `item_stock_summaries`
--
DROP TABLE IF EXISTS `item_stock_summaries`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `item_stock_summaries`  AS SELECT `stock_transactions`.`item_id` AS `item_id`, sum(`stock_transactions`.`qty_in`) AS `total_qty_in`, sum(`stock_transactions`.`qty_out`) AS `total_qty_out`, (sum(`stock_transactions`.`qty_in`) - sum(`stock_transactions`.`qty_out`)) AS `current_stock` FROM `stock_transactions` WHERE (`stock_transactions`.`status` = 'active') GROUP BY `stock_transactions`.`item_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_role_id_index` (`role_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bandwidth_histories`
--
ALTER TABLE `bandwidth_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bhno` (`bhno`);

--
-- Indexes for table `bandwidth_history_details`
--
ALTER TABLE `bandwidth_history_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_files`
--
ALTER TABLE `content_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_files_content_id_foreign` (`content_id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_salaries`
--
ALTER TABLE `employee_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_details`
--
ALTER TABLE `expense_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financial_years`
--
ALTER TABLE `financial_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_months`
--
ALTER TABLE `invoice_months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue_details`
--
ALTER TABLE `issue_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`);

--
-- Indexes for table `loan_infos`
--
ALTER TABLE `loan_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_installments`
--
ALTER TABLE `loan_installments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_parameters`
--
ALTER TABLE `salary_parameters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_sheets`
--
ALTER TABLE `salary_sheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_sheet_details`
--
ALTER TABLE `salary_sheet_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uplink_providers`
--
ALTER TABLE `uplink_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_login_histories`
--
ALTER TABLE `user_login_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_details`
--
ALTER TABLE `voucher_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawls`
--
ALTER TABLE `withdrawls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `bandwidth_histories`
--
ALTER TABLE `bandwidth_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bandwidth_history_details`
--
ALTER TABLE `bandwidth_history_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `content_files`
--
ALTER TABLE `content_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_salaries`
--
ALTER TABLE `employee_salaries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_details`
--
ALTER TABLE `expense_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial_years`
--
ALTER TABLE `financial_years`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_months`
--
ALTER TABLE `invoice_months`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_details`
--
ALTER TABLE `issue_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `loan_infos`
--
ALTER TABLE `loan_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_installments`
--
ALTER TABLE `loan_installments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_parameters`
--
ALTER TABLE `salary_parameters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salary_sheets`
--
ALTER TABLE `salary_sheets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_sheet_details`
--
ALTER TABLE `salary_sheet_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uplink_providers`
--
ALTER TABLE `uplink_providers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_login_histories`
--
ALTER TABLE `user_login_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_details`
--
ALTER TABLE `voucher_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawls`
--
ALTER TABLE `withdrawls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_files`
--
ALTER TABLE `content_files`
  ADD CONSTRAINT `content_files_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
