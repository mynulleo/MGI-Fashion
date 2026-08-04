-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 25, 2025 at 06:05 AM
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
-- Database: `bdOrganization`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_heads`
--

CREATE TABLE `account_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_heads`
--

INSERT INTO `account_heads` (`id`, `title`, `type`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 'Subscription', 'Income', '2025-08-21 03:18:52', '2025-08-21 03:18:52', 'active', 1, 1, 1, 1),
(2, 'Registration', 'Income', '2025-08-21 03:19:31', '2025-08-21 03:19:31', 'active', 1, 1, 1, 1),
(3, 'To-Let', 'Income', '2025-08-21 03:19:31', '2025-08-21 03:19:31', 'active', 1, 1, 1, 1),
(4, 'Flat Sale', 'Income', '2025-08-21 03:19:51', '2025-08-21 03:19:51', 'active', 1, 1, 1, 1);

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
(1, 1, 'Nogor Solutions Limited', 'nsl', 'nsl@gmail.com', '$2y$10$PKQDu3CbzRNZkmZmQ2bKvO6iSv0Oq//7pOmvcMLHO7.vDR3FfMVF.', '01700000000', '{\"600x600\":\"upload\\/profile\\/600x600\\/4a021043-8019-4de8-9fc6-ad1647297c55.avif\",\"300x300\":\"upload\\/profile\\/300x300\\/71d92622-b9f7-4b35-8109-4dd1076e6633.avif\",\"50x50\":\"upload\\/profile\\/50x50\\/17ed18a9-8fbf-445a-9226-cecfc4b078b2.avif\",\"original\":\"upload\\/profile\\/original\\/e7dde788-ad1c-4eef-9277-9ef9631789e0.avif\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 'SQbjooKHfYNvzYxfiVGv7jnePVBKvQfza7fgFgdckyysAAJyR0NI6aXVZkOq', NULL, NULL, NULL, NULL, NULL, '2024-07-02 03:14:27', '2025-03-19 03:45:55'),
(2, 2, 'Nogor', 'nogor', 'nogor@gmail.com', '$2y$10$sLMhTQyYJLDwf9.t4gpBgucfh583UiZnuIT9XPpu33mlDUVlvlrwe', '01700000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', 'oKgfMbXlgBjuKYlzd0MQAlKyaq6fXNY8yWpY0q5G3PlYwAb89yTseAlEs25j', NULL, NULL, NULL, NULL, NULL, '2024-07-02 03:14:27', '2024-07-02 03:14:27'),
(3, 1, 'Mynul Islam Leo', NULL, 'leo@nogorsolutions.com', '$2y$10$wQxuIVke2y4xFpv2LKfZDuzDkx8JdzwF/SrE3.9VsATg0rSVqovwm', '01912252095', '{\"600x600\":\"upload\\/profile\\/600x600\\/7adb51d1-3449-49e7-a9cd-35381483f899.avif\",\"300x300\":\"upload\\/profile\\/300x300\\/2f26bb3b-5b6a-48aa-950c-52cf62090581.avif\",\"50x50\":\"upload\\/profile\\/50x50\\/926124fc-033d-49c0-8576-0f29c3262c4c.avif\",\"original\":\"upload\\/profile\\/original\\/2cf8622b-5914-43ec-a561-ee2898755c33.avif\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-11 00:07:35', '2024-10-08 03:03:34'),
(18, 1, 'Shihab', NULL, 'shihab@gmail.com', '$2y$10$eMKmTBuWVUYKIz.oTW/RMu.a2fr7mehFlPNsWccmWYLe4AQd/dRnm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'deactive', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-08 03:44:40', '2025-03-19 08:58:24'),
(19, 1, 'Tuhin', NULL, 'tudin@gmail.com', '$2y$10$JgdRglwYNLG2744coMpNUOoYAN4GkcY1tUkY4e052R.Xq0J335BrS', '01700000000', '{\"600x600\":\"upload\\/profile\\/600x600\\/954bb35c-ec3c-4678-90dd-f46f44f0f941.avif\",\"300x300\":\"upload\\/profile\\/300x300\\/2f0c4061-5dfe-4206-b558-9e379596ca18.avif\",\"50x50\":\"upload\\/profile\\/50x50\\/8e446638-5a3f-48f0-8d95-ef742604c806.avif\",\"original\":\"upload\\/profile\\/original\\/fdc2913c-17ba-4fca-ad0d-49d2f5a218a5.avif\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, '2024-11-06 10:36:56', '2024-10-08 03:47:55', '2024-11-06 10:36:56'),
(21, 1, 'Mehedi Hasan', NULL, 'mehedihasan33x@gmail.com', '$2y$10$b13xzCB6za8HL257KFKMaecsudreIvlSmdBNnt8SZA/JoBIVv3i9C', '01478596969', '{\"600x600\":\"upload\\/profile\\/600x600\\/2c9b696c-2a91-45c5-98cd-31435c7f227a.avif\",\"300x300\":\"upload\\/profile\\/300x300\\/08d688ca-660c-4865-8864-9deefb6c24d9.avif\",\"50x50\":\"upload\\/profile\\/50x50\\/e69ae563-f38b-4e9f-9cf0-82fd5b5458a8.avif\",\"original\":\"upload\\/profile\\/original\\/4318d2ff-b6d2-4ff0-a560-ec9fb4d47449.avif\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-06 11:55:56', '2025-07-26 16:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Photos','Videos') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sorting` tinyint NOT NULL DEFAULT '0',
  `status` enum('active','draft') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `slug`, `type`, `name`, `image`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(8, 'family', 'Photos', 'Family', '{\"600x600\":\"upload\\/album\\/600x600\\/18128fa6-cd81-4ad9-b340-b5ce4021ec68.avif\",\"340x340\":\"upload\\/album\\/340x340\\/d04c8a73-ab09-4c3b-8bec-67458cb6a3ea.avif\",\"242x242\":\"upload\\/album\\/242x242\\/83c99c63-a424-4853-9718-7691777ce970.avif\",\"50x50\":\"upload\\/album\\/50x50\\/3201eabf-69ea-4c74-96ea-b30094626a8b.avif\",\"original\":\"upload\\/album\\/original\\/b13993c6-1972-4002-941d-8bb050c741e4.avif\"}', 5, 'active', '2024-10-03 06:50:01', '2024-10-03 06:50:01'),
(9, 'unique', 'Videos', 'Unique', '{\"600x600\":\"upload\\/album\\/600x600\\/4efc55b3-af72-40ab-8e29-9a40fa9881e5.avif\",\"340x340\":\"upload\\/album\\/340x340\\/ab67845b-0458-4d93-a50d-5075b9e6462d.avif\",\"242x242\":\"upload\\/album\\/242x242\\/f76f4d3e-01e3-40ad-87ca-3705419a4372.avif\",\"50x50\":\"upload\\/album\\/50x50\\/510c0f6e-4872-4bf2-a573-a151eb8065be.avif\",\"original\":\"upload\\/album\\/original\\/48c9e78b-1849-413c-b33e-95ec7d5c43f8.avif\"}', 2, 'active', '2024-10-08 03:56:41', '2024-10-08 03:56:41'),
(10, 'theme', 'Photos', 'Theme', '{\"600x600\":\"upload\\/album\\/600x600\\/b685514e-42c0-45f1-be9b-79f20fc409da.avif\",\"340x340\":\"upload\\/album\\/340x340\\/ce4c99e2-af6a-4d6b-9eef-0344e239ac23.avif\",\"242x242\":\"upload\\/album\\/242x242\\/860fc0be-4203-4c74-a9a3-85ce6d8d4d4f.avif\",\"50x50\":\"upload\\/album\\/50x50\\/88a0e5cb-3efd-431b-a582-0af947aa674b.avif\",\"original\":\"upload\\/album\\/original\\/83eb1085-7146-470b-a56a-6c3b38c92688.avif\"}', 3, 'active', '2024-10-08 03:57:30', '2025-01-01 09:28:11');

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
(28, 'Project', 'Government', 'government', 84, 'active', '2025-06-25 11:01:22', '2025-06-25 11:01:22'),
(29, 'Project', 'International', 'international', 85, 'active', '2025-06-25 11:01:36', '2025-06-25 11:01:36'),
(30, 'Project', 'Private', 'private', 86, 'active', '2025-06-25 11:01:49', '2025-06-25 11:01:49');

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

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hu Lucas', 'rimizoo468@gmail.com', 'Illum iure rerum ma', 'Quia deleniti duis f', 0, 'active', '2025-07-23 06:18:18', '2025-07-23 06:18:18'),
(2, 'Kirby Savage', 'rimizoo468@gmail.com', 'Est qui omnis et sa', 'Optio labore fugiat', 0, 'active', '2025-07-23 06:29:39', '2025-07-23 06:29:39'),
(3, 'Kyra Dickerson', 'rimizoo468@gmail.com', 'Duis eligendi corpor', 'Incididunt eaque ad', 0, 'active', '2025-07-23 06:31:01', '2025-07-23 06:31:01'),
(4, 'Evan Bates', 'woxaha@mailinator.com', 'Voluptas aute adipis', 'Inventore nulla sed', 0, 'active', '2025-07-24 05:58:02', '2025-07-24 05:58:02'),
(5, 'Bryar Joyce', 'nomyjisuk@mailinator.com', 'Aut quo sed at offic', 'Sint do dignissimos', 0, 'active', '2025-09-20 13:13:12', '2025-09-20 13:13:12'),
(6, 'Bruce Brennan', 'rikysaxo@mailinator.com', 'Quaerat nesciunt in', 'Sed ipsam provident Sed ipsam provident Sed ipsam provident Sed ipsam provident', 0, 'active', '2025-09-20 13:14:29', '2025-09-20 13:14:29'),
(7, 'Jin Golden', 'budyt@mailinator.com', 'In consequatur delec', 'Velit temporibus sit', 0, 'active', '2025-09-20 13:15:00', '2025-09-20 13:15:00');

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
(35, 'about-us', 'About us', NULL, '<p data-end=\"576\" data-start=\"153\"><strong data-end=\"195\" data-start=\"153\">অ্যাপার্টমেন্ট ম্যানেজমেন্ট সফটওয়্যার</strong>&nbsp;(BD Organization) হলো একটি স্মার্ট সমাধান, যা অ্যাপার্টমেন্ট বা ভবনের ভাড়া ব্যবস্থাপনা, ফান্ড ম্যানেজমেন্ট এবং বাসিন্দাদের তথ্য সংরক্ষণকে আরও সহজ ও সুশৃঙ্খল করে তোলে। এই সফটওয়্যার ব্যবহার করে আপনি স্বয়ংক্রিয়ভাবে ইনভয়েস তৈরি করতে পারবেন, পেমেন্ট রিসিভ হলে ভাড়াটিয়াদের কাছে এসএমএস নোটিফিকেশন পাঠাতে পারবেন এবং নির্ধারিত দিনে বকেয়া ভাড়াটিয়াদের কাছে স্বয়ংক্রিয়ভাবে রিমাইন্ডার এসএমএস পাঠানো যাবে।</p>\r\n\r\n<p data-end=\"843\" data-start=\"578\">এছাড়া প্রতিটি ফ্ল্যাটের জন্য ভাড়া ও সার্ভিস চার্জ সেটআপ করার সুবিধা রয়েছে। ইউটিলিটি বিল যেমন বিদ্যুৎ, গ্যাস, পানি ইত্যাদি সহজেই যোগ করা যাবে এবং চাইলে ইনভয়েসের সাথে যুক্ত করা যাবে। ভাড়াটিয়া এসএমএস সুবিধা না নিলে তারা ইনভয়েস ও মানি রিসিট প্রিন্ট আকারে নিতে পারবেন।</p>\r\n\r\n<p data-end=\"1096\" data-start=\"845\">ভবনের রক্ষণাবেক্ষণ খরচ ও সম্পূর্ণ হিসাব সিস্টেমে সংরক্ষিত থাকবে, ফলে যেকোনো সময় মেইনটেন্যান্স হিস্ট্রি চেক করা যাবে। এছাড়াও, সফটওয়্যারটি সব ধরনের আয়-ব্যয় ও রিপোর্ট এক ক্লিকেই তৈরি করতে পারে, যা ভবন মালিক বা ম্যানেজমেন্ট কমিটির জন্য অত্যন্ত সহায়ক।</p>', '{\"636x610\":\"upload\\/content\\/636x610\\/5eb81fd3-919d-448e-aea7-c0e81ad6c7b5.avif\",\"583x559\":\"upload\\/content\\/583x559\\/4a426a83-1c3e-4e53-992d-dfc537fb534c.avif\",\"200x192\":\"upload\\/content\\/200x192\\/e66c828f-9eec-4026-929e-d47bdc439f2f.avif\",\"original\":\"upload\\/content\\/original\\/799057e2-09f7-48dc-947c-74d2b18686a4.avif\"}', 'active', 0, '[]', NULL, 3, '2025-07-13 11:59:45', '2025-09-20 04:19:27'),
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
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(21, 'রিমাইন্ডার এসএমএস কিভাবে কাজ করে?', '<p>আপনি নির্দিষ্ট তারিখ সেট করে দিতে পারবেন। ঐ তারিখে যেসব ভাড়াটিয়া ভাড়া পরিশোধ করেনি তাদের স্বয়ংক্রিয়ভাবে রিমাইন্ডার এসএমএস পাঠানো হবে।</p>', 1, 'active', '2024-10-07 21:37:40', '2024-10-07 21:37:40'),
(22, 'এই সফটওয়্যার দিয়ে আমি কী করতে পারব?', '<p>আপনি ভাড়া ম্যানেজমেন্ট, ইনভয়েস জেনারেট, এসএমএস রিমাইন্ডার, রক্ষণাবেক্ষণ খরচের হিসাবসহ আপনার পুরো ভবন ব্যবস্থাপনা করতে পারবেন।</p>', 2, 'active', '2024-10-07 21:38:11', '2024-10-07 21:38:11'),
(23, 'আমি কি ম্যানুয়ালি ইনভয়েস তৈরি করতে পারব?', '<p>হ্যাঁ, আপনি চাইলে যেকোনো সময় ম্যানুয়ালি ইনভয়েস তৈরি করতে পারবেন এবং সেটি প্রিন্ট অথবা এসএমএস/ইমেইলে পাঠাতে পারবেন।</p>', 3, 'active', '2025-09-20 16:31:45', '2025-09-20 16:31:45'),
(24, 'ইউটিলিটি বিল যুক্ত করার সুবিধা আছে কি?', '<p>&nbsp;অবশ্যই। প্রতিটি ইনভয়েসে বিদ্যুৎ, পানি বা গ্যাস বিলের মতো ইউটিলিটি চার্জ যুক্ত করা যাবে।</p>', 4, 'active', '2025-09-20 16:32:21', '2025-09-20 16:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorting` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `icon`, `title`, `description`, `sorting`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, '<i class=\"fa fa-calendar-alt fa-3x text-primary mb-4\"></i>', 'স্বয়ংক্রিয় ইনভয়েস তৈরি', 'ভাড়াটিয়াদের জন্য নির্দিষ্ট তারিখে সিস্টেম নিজে থেকেই ইনভয়েস তৈরি করে। এতে হিসাব-নিকাশের ঝামেলা অনেক কমে যায়। প্রয়োজনে আপনি ম্যানুয়ালভাবেও ইনভয়েস জেনারেট করতে পারবেন।', 1, '2025-09-19 21:31:25', '2025-09-19 21:42:21', 'active', 1, 1, 1, 1),
(2, '<i class=\"fa fa-tasks fa-3x text-primary mb-4\"></i>', 'এসএমএস নোটিফিকেশন', 'ইনভয়েস তৈরী হলে, ভাড়াটিয়া ইনভয়েস পরিশোধ করলে স্বয়ংক্রিয়ভাবে এসএমএস চলে যাবে, যাতে তারা পেমেন্ট কনফার্মেশন পেয়ে যান। এতে বিশ্বাসযোগ্যতা ও স্বচ্ছতা বাড়ে।', 2, '2025-09-19 21:51:04', '2025-09-19 21:51:04', 'active', 1, 1, 1, 1),
(3, '<i class=\"fa fa-pencil-ruler fa-3x text-primary mb-4\"></i>', 'রিমাইন্ডার এসএমএস সুবিধা', 'আপনি নির্দিষ্ট দিন নির্বাচন করতে পারবেন (যেমন ভাড়া দেওয়ার শেষ তারিখের আগে/পরে)। ওই তারিখে যারা ভাড়া পরিশোধ করেননি, তাদের কাছে স্বয়ংক্রিয়ভাবে রিমাইন্ডার এসএমএস পাঠানো হবে।', 3, '2025-09-19 21:53:07', '2025-09-19 21:53:07', 'active', 1, 1, 1, 1),
(4, '<i class=\"fa fa-user fa-3x text-primary mb-4\"></i>', 'ম্যানুয়াল ইনভয়েস ও রসিদ প্রিন্ট', 'যেসব ভাড়াটিয়া এসএমএস সুবিধা ব্যবহার করবেন না, তারা সহজেই প্রিন্ট আকারে ইনভয়েস এবং টাকা জমা দেওয়ার রসিদ সংগ্রহ করতে পারবেন।', 4, '2025-09-19 21:54:01', '2025-09-19 21:54:01', 'active', 1, 1, 1, 1),
(5, '<i class=\"fa fa-hand-holding-usd fa-3x text-primary mb-4\"></i>', 'ফান্ড ব্যবস্থাপনা', 'ভবনের সমস্ত আয়-ব্যয়ের তথ্য এক জায়গায় ট্র্যাক করার সুবিধা। ভাড়া, সার্ভিস চার্জ, মেইনটেন্যান্স ফান্ড ইত্যাদি পরিষ্কারভাবে দেখা ও নিয়ন্ত্রণ করা যাবে।', 5, '2025-09-19 21:54:56', '2025-09-19 21:54:56', 'active', 1, 1, 1, 1),
(6, '<i class=\"fa fa-check fa-3x text-primary mb-4\"></i>', 'ভবন রক্ষণাবেক্ষণ হিসাব', 'ভবনের মেইনটেন্যান্স সংক্রান্ত খরচ ও ইতিহাস সিস্টেমে সংরক্ষিত থাকবে। এতে ভবিষ্যতে খরচের হিসাব পরিষ্কারভাবে দেখা যাবে।', 6, '2025-09-19 21:56:08', '2025-09-19 21:56:08', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_menus`
--

CREATE TABLE `front_menus` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `content_id` int DEFAULT NULL,
  `menu_look_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `sorting` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_menus`
--

INSERT INTO `front_menus` (`id`, `parent_id`, `content_id`, `menu_look_type`, `type`, `url`, `position`, `title`, `slug`, `params`, `status`, `sorting`, `created_at`, `updated_at`) VALUES
(1, NULL, 35, 'normal', 'content', NULL, 'header', 'আমাদের সম্পর্কে', 'about-us', NULL, 'active', 1, '2023-09-06 17:06:22', '2025-09-20 08:29:15'),
(17, NULL, NULL, 'normal', 'internal_link', 'contact', 'header', 'যোগাযোগ', NULL, NULL, 'active', 9, '2025-07-16 10:01:56', '2025-09-20 08:29:42'),
(23, NULL, NULL, 'normal', 'internal_link', 'faq', 'header', 'সাধারণ জিজ্ঞাসা', 'sadharn-jijngasa', NULL, 'active', 5, '2025-09-20 16:34:50', '2025-09-20 16:34:50'),
(24, NULL, 35, 'normal', 'content', NULL, 'footer', 'আমাদের সম্পর্কে', 'amader-smprke', NULL, 'active', 10, '2025-09-21 17:31:12', '2025-09-21 17:31:12'),
(25, NULL, NULL, 'normal', 'internal_link', 'faq', 'footer', 'সাধারণ জিজ্ঞাসা', 'sadharn-jijngasa1', NULL, 'active', 11, '2025-09-21 17:31:53', '2025-09-21 17:31:53'),
(26, NULL, NULL, 'normal', 'internal_link', 'contact', 'footer', 'যোগাযোগ', 'zogazog', NULL, 'active', 12, '2025-09-21 17:33:26', '2025-09-21 17:33:26'),
(27, NULL, 36, 'normal', 'content', NULL, 'footer_bottom', 'শর্তাবলী', 'srtablee', NULL, 'active', 13, '2025-09-23 16:15:23', '2025-09-23 16:15:23'),
(28, NULL, 37, 'normal', 'content', NULL, 'footer_bottom', 'গোপনীয় নীতিমালা', 'gopneez-neetimala', NULL, 'active', 14, '2025-09-23 16:34:43', '2025-09-23 16:34:43');

-- --------------------------------------------------------

--
-- Table structure for table `help_infos`
--

CREATE TABLE `help_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `model_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_type` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_infos`
--

INSERT INTO `help_infos` (`id`, `model_name`, `page_type`, `description`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(3, 'SiteSetting', 'view', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed venenatis ligula vel arcu pharetra, ac fermentum sapien consectetur. Maecenas ut aliquet odio. Nunc id aliquam dolor. Vestibulum tincidunt nisi et nunc molestie blandit. Duis sagittis vel ex et eleifend. Sed vitae massa ac libero pharetra egestas. Cras justo diam, cursus id tortor nec, ultrices interdum erat. Praesent et cursus diam, id volutpat lorem.</p>\r\n\r\n<p>Fusce tempus, justo a interdum mattis, quam ipsum interdum eros, sit amet placerat leo magna in risus. Curabitur venenatis vel sapien id posuere. Sed porta gravida dignissim. Morbi vitae ante vel nulla porta scelerisque. Duis ac nisi ut ex sodales cursus et et orci. Curabitur non porttitor sem. Donec fringilla erat ac est suscipit, eu interdum nibh lacinia. Morbi ut libero imperdiet ipsum placerat accumsan. Quisque mattis lacus sed elit suscipit viverra. Integer id tristique sapien.</p>\r\n\r\n<p>Phasellus lobortis massa ac condimentum interdum. Etiam sagittis ante ac magna pretium, a eleifend neque aliquet. Curabitur dolor odio, ullamcorper vitae tincidunt et, cursus quis lectus. Integer lobortis magna eget orci tempus facilisis. Nullam nec interdum nulla, in pellentesque nisl. Suspendisse potenti. Mauris turpis velit, imperdiet nec elit a, iaculis sollicitudin lorem. Aliquam euismod velit mattis, scelerisque dolor id, convallis magna.</p>\r\n\r\n<p>Vivamus fermentum accumsan metus, id pharetra ipsum vehicula sit amet. Quisque vestibulum orci non est blandit, et posuere dui tristique. Morbi egestas sem ac tellus rhoncus maximus. Nam rutrum mattis erat, eget dapibus felis faucibus a. Ut eget erat et elit sodales congue a maximus augue. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisi. Vivamus ultrices orci accumsan, auctor ipsum efficitur, convallis nulla. Maecenas nibh orci, efficitur eu finibus sit amet, ornare quis magna. Curabitur facilisis dictum pretium. Sed porta augue velit, ac tempor ligula placerat venenatis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse porttitor pharetra mauris, at vehicula lorem blandit vitae.</p>\r\n\r\n<p>Phasellus quis odio accumsan, consequat ante a, dapibus arcu. Aenean sed turpis ligula. Integer vitae mauris purus. Suspendisse condimentum in risus quis elementum. Ut sit amet quam vulputate, scelerisque nibh eu, feugiat lorem. In ac faucibus odio. Suspendisse ultrices egestas leo. In rhoncus sollicitudin viverra. Suspendisse at commodo nunc, a mattis sapien.</p>\r\n\r\n<p>Quisque aliquam eget sem in sollicitudin. Donec quis nulla id est semper luctus. Nam tincidunt sit amet leo eget dapibus. Mauris faucibus fermentum rhoncus. Nunc ut auctor libero, vitae suscipit eros. Mauris auctor, nulla non rutrum semper, diam leo ultrices enim, et volutpat arcu velit vitae justo. Donec et elit eu metus gravida feugiat vel id ipsum. Nullam magna turpis, laoreet non nisl cursus, consequat tempus libero. Praesent dui odio, faucibus fringilla elit ac, euismod mattis lorem. Duis sagittis ut nisi eget aliquet.</p>\r\n\r\n<p>Phasellus quam diam, dignissim dictum bibendum et, maximus eget odio. Donec vitae metus et enim condimentum sodales ut et tortor. Donec neque libero, luctus id porta sed, mollis eu sapien. Vivamus sit amet nisl vel nulla molestie commodo nec a massa. Sed at urna semper, fermentum libero vitae, condimentum sapien. Sed interdum dui eget neque feugiat, in malesuada felis scelerisque. Curabitur dapibus massa sed ex consequat, in dignissim lectus lobortis. Nullam elit ipsum, vestibulum vel feugiat ut, aliquet quis sapien. Vestibulum vulputate urna eu rhoncus consequat. Phasellus dictum luctus augue non porttitor. Sed suscipit mauris quis bibendum elementum. Nunc dapibus elit at pellentesque sodales. Sed nec dolor rutrum, posuere justo at, accumsan augue.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla iaculis lectus eu odio tempus, non bibendum sapien suscipit. Vivamus viverra lacinia sem eget mollis. Pellentesque iaculis leo ut tellus tristique mattis. Sed id condimentum quam, ut commodo odio. Phasellus et turpis eget risus lacinia vestibulum sit amet quis sapien. Duis sit amet metus sed diam lacinia elementum vitae vitae dolor. In quis ligula lorem. Quisque at leo tellus. Maecenas in fermentum lorem. Aliquam et nulla ligula.</p>\r\n\r\n<p>Nam commodo sit amet neque fringilla interdum. Nam semper, ante ut faucibus ullamcorper, ipsum arcu ultrices sapien, sit amet rhoncus magna neque sed lectus. Fusce sit amet libero nec sem gravida porttitor. Duis arcu justo, facilisis eget faucibus et, lacinia commodo dui. Suspendisse quis euismod ipsum. Etiam vel maximus urna. Integer hendrerit varius cursus. Curabitur in tellus convallis ex consequat varius ut vitae eros. Pellentesque vel eros faucibus, malesuada nunc id, efficitur ligula. Quisque eu sagittis ante, nec lacinia tortor. Proin blandit mattis dapibus. Aliquam dapibus dolor sed felis imperdiet aliquet. Praesent a lacinia neque, id ultricies ligula.</p>\r\n\r\n<p>Aliquam venenatis tortor et ultricies faucibus. Fusce et metus id purus tempor accumsan ut a orci. Integer nunc ex, molestie vel neque in, dictum finibus metus. Cras porta mauris non sodales vehicula. Donec ac magna hendrerit sem iaculis faucibus. Suspendisse potenti. Proin nec metus urna.</p>\r\n\r\n<p>In consectetur, turpis non lobortis hendrerit, nibh diam eleifend tellus, sed accumsan erat orci ac leo. Fusce feugiat ac enim non mollis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam suscipit fermentum quam, eu convallis ante. Fusce sed quam tincidunt justo tristique rutrum luctus ac quam. Sed blandit imperdiet mi, non fermentum orci pellentesque a. Vivamus vel commodo ligula.</p>\r\n\r\n<p>Vestibulum ut pellentesque nulla. Aliquam pharetra quis arcu ut egestas. Cras semper felis consectetur fringilla dictum. Proin vel pharetra risus. Aliquam erat volutpat. Morbi et ligula nisl. Sed maximus massa et tempus porta. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis metus elit, dictum vel libero tincidunt, vestibulum feugiat metus. Praesent fringilla laoreet quam, rhoncus dignissim risus bibendum a. Pellentesque malesuada leo nec nisi laoreet iaculis. Aliquam lacinia leo ac mattis iaculis. Donec eu iaculis dolor.</p>\r\n\r\n<p>Nulla mollis condimentum risus. Nulla gravida dui mauris, at congue enim mattis a. Vivamus ut accumsan libero. Aenean dui justo, suscipit nec fringilla at, commodo eget nibh. Nam viverra iaculis nunc quis sagittis. Mauris laoreet massa ac dolor dapibus, nec interdum tortor iaculis. In est mauris, malesuada eget facilisis at, gravida vel lorem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vehicula facilisis velit sodales pellentesque. Phasellus at maximus erat. Proin ac dapibus elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque et elit pretium, semper mauris a, commodo enim. Suspendisse volutpat tempus massa non iaculis.</p>\r\n\r\n<p>Morbi pharetra pulvinar ante volutpat vestibulum. Donec ut elit malesuada, imperdiet nunc nec, egestas dolor. Sed sollicitudin vitae nulla eget fermentum. Mauris vehicula est quis elit fermentum molestie non eu massa. Quisque ac magna interdum est congue finibus. Phasellus pretium diam quam, a vestibulum lectus accumsan at. Aenean justo elit, eleifend vulputate sodales commodo, dapibus et metus. Fusce sed orci elit. Praesent eget purus vel purus interdum sodales at dapibus ante. Nunc in neque massa. Cras nec quam consequat, semper tellus porttitor, sollicitudin felis. Cras tincidunt vel libero quis ultricies. Nullam non diam ac ligula finibus accumsan. Etiam tempor nisl ac viverra faucibus. Sed vitae rutrum diam, at rhoncus metus. Etiam fermentum ac dolor id dapibus.</p>\r\n\r\n<p>Aliquam ullamcorper erat in fringilla imperdiet. In congue convallis dapibus. Nam ac vehicula eros, quis tristique magna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus elementum erat id libero faucibus egestas vitae vitae diam. Etiam dapibus sed justo vel ornare. Cras aliquet orci lacinia iaculis ornare. Pellentesque tempor ut massa quis lacinia. Nulla rutrum quam at nisl dictum cursus. Aenean accumsan mi sit amet risus convallis, id dignissim massa aliquam. In ullamcorper tortor a dui consectetur, ut maximus turpis elementum. Quisque luctus nisi vitae dolor gravida ornare. Fusce eu velit sit amet ligula consequat semper ac sed dolor. Nam efficitur sagittis libero sit amet hendrerit.</p>\r\n\r\n<p>Etiam felis justo, viverra at felis vitae, semper ornare nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi massa ex, sagittis in arcu vel, lobortis lobortis odio. Morbi velit nisi, tempor ac orci ut, fermentum auctor metus. Etiam lacinia nec nisl id interdum. Praesent in ante dapibus, eleifend velit a, laoreet metus. Sed porttitor lorem vitae ante malesuada, id aliquet metus imperdiet.</p>\r\n\r\n<p>Curabitur id semper enim, eu posuere diam. Aliquam erat volutpat. Fusce efficitur erat et magna laoreet venenatis. Duis vulputate in felis fringilla tempus. Donec sed imperdiet nisi, et porttitor purus. Nunc eleifend sapien vel urna pretium, vitae dignissim orci sagittis. Mauris fermentum sagittis nisi eget lacinia. Nam id nisi sollicitudin, ultricies dui eleifend, eleifend nisl. Maecenas in ex purus. Sed interdum augue leo, quis ultricies felis laoreet sit amet. Pellentesque augue orci, tincidunt quis porttitor eu, iaculis eu quam. In hac habitasse platea dictumst. Nulla aliquam eros at feugiat vehicula. Donec congue eget est quis vulputate. Morbi et libero facilisis, egestas lectus a, dignissim felis.</p>\r\n\r\n<p>Quisque eget quam venenatis, consectetur eros laoreet, tempor orci. Maecenas eget augue quis purus suscipit porttitor ut nec nulla. In hac habitasse platea dictumst. Aliquam sodales feugiat quam, et porta leo. Donec ultrices id justo eget rhoncus. Phasellus maximus erat sit amet mattis euismod. Quisque dolor sapien, scelerisque ac nisl a, volutpat dignissim eros. Aliquam egestas quis nisl sit amet mattis. Sed porta, odio sed mollis tristique, felis massa dictum erat, ac ultrices enim metus vitae justo. Praesent a congue lectus. Curabitur vel ultricies risus, nec maximus lectus. Pellentesque in vehicula metus, id finibus enim. Quisque pellentesque sem pretium, venenatis nisl quis, semper mauris.</p>\r\n\r\n<p>Integer imperdiet odio vitae fermentum blandit. Mauris vestibulum sodales lectus non tempus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae eros ante. In et bibendum odio, a euismod libero. Sed in nisi eget mi imperdiet varius. Sed condimentum posuere magna, non laoreet leo maximus in. Aliquam erat volutpat. Maecenas sollicitudin dignissim ligula vitae dictum. Vivamus tempus tellus id magna commodo, non ultricies ligula molestie. Duis et lacus scelerisque, pretium felis sed, tempus augue. Integer bibendum augue et leo lobortis, nec laoreet lorem porttitor. Nulla facilisi.</p>', 8, 'active', '2024-09-18 06:08:08', '2024-09-22 00:27:17'),
(7, 'Page', 'create', '<ul>\r\n	<li>Mauris sit amet orci et mi malesuada vestibulum.</li>\r\n	<li>Donec id est quis elit finibus luctus et vitae magna.</li>\r\n	<li>Fusce a nulla vestibulum velit aliquam ultrices vel et nibh.</li>\r\n	<li>Proin pretium nulla ut consectetur hendrerit.</li>\r\n	<li>Curabitur id justo vehicula, lacinia justo tempus, tincidunt leo.</li>\r\n</ul>', 6, 'active', '2024-09-19 07:06:13', '2024-10-03 02:16:09'),
(12, 'Admin', 'Create', '<p><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">An admin manages system settings and overall platform operations to ensure smooth functionality and security.</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Profile Image (Required):</strong> Upload or select a profile picture.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Email:</strong>Enter the admin&#39;s valid email address.Example:User123@gmail.com</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Password:</strong> Set a secure password for login.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Role:</strong> Choose an admin role from the dropdown.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Mobile:</strong> Input the admin&rsquo;s contact mobile number.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Sorting: </strong>Set the display order for the admin.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Status Switch: </strong>Toggle to activate or deactivate the account.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Submit: </strong>Save all information to create the admin.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<h3 style=\"text-align: justify;\"><br />\r\n&nbsp;</h3>', 1, 'active', '2024-10-07 01:35:20', '2024-10-10 03:31:54'),
(14, 'Admin', 'view', '<ul>\r\n	<li>Print</li>\r\n</ul>', 10, 'active', '2024-10-08 05:32:30', '2024-10-08 05:32:30'),
(15, 'Category', 'Create', '<p><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">This section provides guidance on creating a new category using the <strong>&quot;Add&quot;</strong> button:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Module Name (Required):</strong> Select the relevant module (e.g., News, Event) for the new category.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Title (Required):</strong> Enter a descriptive name for the category.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Sorting:</strong> Set the order in which this category will appear (lower numbers show up earlier).</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Status Button (Switch)</strong>: Toggle to activate or deactivate the category. Activated categories are visible, while deactivated ones remain hidden.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Submit Button: </strong>After completing all fields, click Submit to save the new category.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 10, 'active', '2024-10-10 12:08:58', '2024-10-10 12:15:35'),
(16, 'Category', 'Index', '<p><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">This section assists with navigating the Admin List, offering various search and filter functionalities:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Dropdown Menu for Searching: Allows users to search by </span></span></span></span><span style=\"color:#2980b9;\"><strong><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Title<span style=\"color:#3498db;\"><strong><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"> </span></span></span></strong></span>and<span style=\"color:#3498db;\"><strong><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"> </span></span></span></strong></span>Module</span></span></span></strong></span><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"> for quick access to specific admin records.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Advanced Search: Offers filters for refining results by Status to locate admins based on permissions and activity.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Action Buttons (View, Edit, Delete): Each admin in the list has buttons to:</span></span></span></span></span></span>\r\n	<ul>\r\n		<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">View: Display detailed information.</span></span></span></span></span></span></li>\r\n		<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Edit: Update admin details.</span></span></span></span></span></span></li>\r\n		<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Delete: Remove the admin from the system.</span></span></span></span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Download Options: The admin list can be downloaded in various formats such as Print, Excel, and PDF for reporting or record-keeping purposes.</span></span></span></span></span></span></li>\r\n</ul>', 11, 'active', '2024-10-10 12:19:34', '2024-10-10 12:22:57'),
(18, 'Admin', 'Index', '<p style=\"text-align: justify;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">This section assists in using the Admin List, including search and filtering options to manage admin records efficiently. Below are the list types for each variable, along with user-friendly descriptions of what each filter does:</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.656; margin-top:16px; margin-bottom:16px\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Dropdown Menu for Searching</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.656; margin-top:16px; margin-bottom:16px\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Search By:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Name (Text):</strong> Enter the admin&#39;s name to find specific individuals.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Email (Text):</strong> Search by email address to locate admins quickly.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Mobile (Number):</strong> Find admins using their mobile phone number.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.656; margin-top:16px; margin-bottom:16px\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Advanced Search Options</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.656; margin-top:16px; margin-bottom:16px\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Filter By:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Role (Dropdown):</strong> Filter admins based on their role (e.g., Admin, Editor, Manager), to view users with specific permissions.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Status (Dropdown):</strong> Filter by active or inactive status to see only active users or all users regardless of status.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.656; margin-top:16px; margin-bottom:16px\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Action Buttons:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>View (Button):</strong> View detailed information about a specific admin.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Edit (Button):</strong> Modify the details of an admin user.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Delete (Button):</strong> Remove the admin from the list.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.656; margin-top:16px; margin-bottom:16px\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Download Options:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Print (Button):</strong> Print the admin list for offline use or record-keeping.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Excel (Button):</strong> Download the list in Excel format for further data manipulation.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>PDF (Button):</strong> Export the admin list as a PDF document for easy sharing or storage.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height: 1.656; margin-top: 16px; margin-bottom: 16px; text-align: justify;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Each of these options helps users filter and manage the admin list more effectively, providing control over how data is searched, displayed, and downloaded.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 2, 'active', '2024-10-15 05:08:29', '2024-10-15 06:24:29'),
(19, 'Pageseo', 'Index', '<p style=\"text-align: justify;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">This section provides assistance for navigating and managing the Page SEO List, including search, filter, sorting, and action tools. Below are the list types for each variable, along with user-friendly descriptions:</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Dropdown Menu for Searching</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Search By:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Meta Description (Text):</strong> Enter part or all of the meta description to locate specific SEO metadata for a page.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Advanced Search Options</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Filter By:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Select Page (Dropdown):</strong> Choose a page from the list to view or modify its SEO data.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Status (Dropdown)</strong>: Filter by active or inactive status to display only active SEO records or both.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Action Buttons:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>View (Button)</strong>: Open detailed SEO data for the selected page.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Edit (Button): </strong>Modify the SEO information, such as meta titles or descriptions.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Delete (Button):</strong> Remove the SEO data related to the page from the system.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Sorting Options:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Click Sorting Icon (Header): </strong>Click on the column headers (e.g., Meta Description, Status) to sort the list in ascending or descending order.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Sorting Number (Input Field):</strong> Enter a number in the sorting field to manually reorder the pages based on priority.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Download Options:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Print (Button): </strong>Print the SEO list for record-keeping or offline review.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Excel (Button):</strong> Download the list as an Excel file for further editing or analysis.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>PDF (Button): </strong>Export the SEO list as a PDF for sharing or documentation purposes.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height: 1.38; text-align: justify;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Each filter, search, and sorting function is designed to help users quickly locate and manage SEO information across various pages, ensuring easy access and organization.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 12, 'active', '2024-10-15 05:25:57', '2024-10-15 06:24:59'),
(20, 'Page', 'Index', '<p style=\"text-align: justify;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">This section provides assistance for managing the Page List, which includes search, filter, and action options. Below are the list types for each variable, along with a brief, user-friendly description:</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Dropdown Menu for Searching</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Search By: </span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Title (Text):</strong> Enter part or all of the page title to find specific pages in the list.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Advanced Search Options</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Filter By: </span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Status (Dropdown): </strong>Filter pages by their active or inactive status to display either only active pages or both active and inactive ones.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Action Buttons for Each User:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>View (Button):</strong> Open the page to view its details and content.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Edit (Button):</strong> Modify the page content, title, or settings.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Delete (Button):</strong> Remove the page from the list and the system.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Sorting Options:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Click Sorting Icon (Header):</strong> Click on the column headers (e.g., Title, Status) to sort the list in ascending or descending order.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Download Options:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Print (Button):</strong> Print the page list for offline review or documentation.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Excel (Button):</strong> Download the list as an Excel file for further data manipulation.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>PDF (Button):</strong> Export the list as a PDF document for record-keeping or sharing.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height: 1.38; text-align: justify;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">These options enable users to efficiently manage and organize pages, providing flexibility in how pages are searched, filtered, and downloaded.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 9, 'active', '2024-10-15 05:36:51', '2024-10-15 06:07:47');
INSERT INTO `help_infos` (`id`, `model_name`, `page_type`, `description`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(21, 'Pagesection', 'Index', '<p style=\"text-align: justify;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">This section provides assistance for managing the Page Section List, which includes various search, filter, sorting, and action options. Below are the list types for each variable, along with a brief, user-friendly description:</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Dropdown Menu for Searching</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Search By:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Title (Text):</strong> Enter part or all of the section title to find specific page sections.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Advanced Search Options</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Filter By:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Select Page (Dropdown):</strong> Choose the relevant page to view the sections associated with it.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Status (Dropdown):</strong> Filter by active or inactive status to display either only active sections or both active and inactive sections.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Action Buttons:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>View (Button): </strong>View the section details for a specific page.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Edit (Button):</strong> Modify the section content or settings.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Delete (Button):</strong> Remove the section from the list and system.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Sorting Options:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Click Sorting Icon (Header):</strong> Sort the list by clicking on column headers, such as Title or Status, to arrange sections in ascending or descending order.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Sorting Number (Input Field):</strong> Adjust the display order of sections by entering a custom number to prioritize certain sections.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height:1.38\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Download Options:</span></span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Print (Button): </strong>Print the page section list for offline use or documentation.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>Excel (Button): </strong>Download the list in Excel format for further editing or analysis.</span></span></span></span></span></span></li>\r\n	<li style=\"line-height: 1.38;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"><strong>PDF (Button):</strong> Export the list as a PDF for sharing or archiving.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"line-height: 1.38; text-align: justify;\"><span style=\"font-size:11pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#000000\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">These options help users efficiently manage page sections, providing control over how sections are searched, filtered, sorted, and downloaded for organization and editing.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 10, 'active', '2024-10-15 06:15:43', '2024-10-15 06:24:43');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `organization_id` bigint NOT NULL,
  `invoice_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `paid_amount` decimal(8,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `trxid` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `organization_id`, `invoice_no`, `invoice_date`, `amount`, `paid_amount`, `payment_date`, `trxid`, `card_type`, `payment_status`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `deleted_at`, `created_ip`, `updated_ip`) VALUES
(1, 3, '111', '2025-08-22', 1758.00, 1758.00, '2025-08-22', '250822104604XSSYGAt05NeaZlU', 'BKASH-BKash', 'paid', '2025-08-21 22:45:44', '2025-08-21 23:19:21', 'active', 1, 1, NULL, 1, 1),
(2, 3, '112', '2025-08-22', 1758.00, 0.00, NULL, NULL, NULL, 'Processing', '2025-08-21 23:46:00', '2025-08-21 23:46:00', 'active', 1, 1, NULL, 1, 1),
(3, 3, '113', '2025-08-22', 1758.00, 1758.00, '2025-08-22', '250822114824tfnNgs23pi4Galo', 'BKASH-BKash', 'paid', '2025-08-21 23:48:13', '2025-08-21 23:48:28', 'active', 1, 1, NULL, 1, 1),
(4, 3, '114', '2025-08-22', 586.00, 586.00, '2025-08-22', '250822141138chmlmyXRvu2tStL', 'BKASH-BKash', 'paid', '2025-08-22 02:11:26', '2025-08-22 02:11:42', 'active', 1, 1, NULL, 1, 1),
(5, 3, '115', '2025-08-22', 586.00, 0.00, NULL, NULL, NULL, 'Processing', '2025-08-22 02:47:54', '2025-08-22 02:47:54', 'active', 1, 1, NULL, 1, 1),
(6, 3, '116', '2025-08-22', 1758.00, 1758.00, '2025-08-22', '250822144845o5Q1FrqMsJ9wBnI', 'BKASH-BKash', 'paid', '2025-08-22 02:48:36', '2025-08-22 02:48:49', 'active', 1, 1, NULL, 1, 1),
(7, 4, '117', '2025-08-22', 586.00, 0.00, NULL, NULL, NULL, 'Failed', '2025-08-22 02:56:07', '2025-08-22 02:56:28', 'active', 1, 1, NULL, 1, 1),
(8, 4, '118', '2025-08-22', 586.00, 0.00, NULL, NULL, NULL, 'Failed', '2025-08-22 05:37:12', '2025-08-22 05:37:41', 'active', 1, 1, NULL, 1, 1),
(9, 4, '119', '2025-08-22', 586.00, 0.00, NULL, NULL, NULL, 'Pending', '2025-08-22 05:45:30', '2025-08-22 05:45:30', 'active', 1, 1, NULL, 1, 1),
(10, 4, '120', '2025-08-22', 586.00, 0.00, NULL, NULL, NULL, 'Pending', '2025-08-22 05:47:20', '2025-08-22 05:47:20', 'active', 1, 1, NULL, 1, 1),
(11, 4, '121', '2025-08-22', 586.00, 0.00, NULL, NULL, NULL, 'Pending', '2025-08-22 05:47:25', '2025-08-22 05:47:25', 'active', 1, 1, NULL, 1, 1),
(12, 4, '122', '2025-08-22', 586.00, 0.00, NULL, NULL, NULL, 'Pending', '2025-08-22 05:47:27', '2025-08-22 05:47:27', 'active', 1, 1, NULL, 1, 1),
(13, 4, '123', '2025-08-22', 586.00, 0.00, NULL, NULL, NULL, 'Pending', '2025-08-22 10:56:47', '2025-08-22 10:56:47', 'active', 1, 1, NULL, 1, 1),
(14, 4, '124', '2025-08-22', 586.00, 0.00, NULL, NULL, NULL, 'Failed', '2025-08-22 10:58:23', '2025-08-22 10:58:43', 'active', 1, 1, NULL, 1, 1),
(15, 4, '125', '2025-08-22', 586.00, 0.00, NULL, NULL, NULL, 'Failed', '2025-08-22 11:01:18', '2025-08-22 11:01:37', 'active', 1, 1, NULL, 1, 1),
(16, 4, '126', '2025-08-22', 586.00, 586.00, '2025-08-22', '2508222308211gsosYJtzTIc6Hw', 'BKASH-BKash', 'paid', '2025-08-22 11:08:11', '2025-08-22 11:08:24', 'active', 1, 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_head_id` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `invoice_id`, `account_head_id`, `amount`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `deleted_at`, `created_ip`, `updated_ip`) VALUES
(1, '1', '1', '1758', '2025-08-22 04:45:45', '2025-08-22 04:45:45', 'active', 1, 1, NULL, 1, 1),
(2, '2', '1', '1758', '2025-08-22 05:46:00', '2025-08-22 05:46:00', 'active', 1, 1, NULL, 1, 1),
(3, '3', '1', '1758', '2025-08-22 05:48:13', '2025-08-22 05:48:13', 'active', 1, 1, NULL, 1, 1),
(4, '4', '1', '586', '2025-08-22 08:11:26', '2025-08-22 08:11:26', 'active', 1, 1, NULL, 1, 1),
(5, '5', '1', '586', '2025-08-22 08:47:54', '2025-08-22 08:47:54', 'active', 1, 1, NULL, 1, 1),
(6, '6', '1', '1758', '2025-08-22 08:48:36', '2025-08-22 08:48:36', 'active', 1, 1, NULL, 1, 1),
(7, '7', '1', '586', '2025-08-22 08:56:07', '2025-08-22 08:56:07', 'active', 1, 1, NULL, 1, 1),
(8, '8', '1', '586', '2025-08-22 11:37:12', '2025-08-22 11:37:12', 'active', 1, 1, NULL, 1, 1),
(9, '9', '1', '586', '2025-08-22 11:45:30', '2025-08-22 11:45:30', 'active', 1, 1, NULL, 1, 1),
(10, '10', '1', '586', '2025-08-22 11:47:20', '2025-08-22 11:47:20', 'active', 1, 1, NULL, 1, 1),
(11, '11', '1', '586', '2025-08-22 11:47:25', '2025-08-22 11:47:25', 'active', 1, 1, NULL, 1, 1),
(12, '12', '1', '586', '2025-08-22 11:47:27', '2025-08-22 11:47:27', 'active', 1, 1, NULL, 1, 1),
(13, '13', '1', '586', '2025-08-22 16:56:47', '2025-08-22 16:56:47', 'active', 1, 1, NULL, 1, 1),
(14, '14', '1', '586', '2025-08-22 16:58:23', '2025-08-22 16:58:23', 'active', 1, 1, NULL, 1, 1),
(15, '15', '1', '586', '2025-08-22 17:01:18', '2025-08-22 17:01:18', 'active', 1, 1, NULL, 1, 1),
(16, '16', '1', '586', '2025-08-22 17:08:11', '2025-08-22 17:08:11', 'active', 1, 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `media_validators`
--

CREATE TABLE `media_validators` (
  `id` bigint UNSIGNED NOT NULL,
  `model_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_size` int NOT NULL,
  `min_width` int DEFAULT NULL,
  `min_height` int DEFAULT NULL,
  `resize_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_validators`
--

INSERT INTO `media_validators` (`id`, `model_name`, `field_name`, `field_type`, `max_size`, `min_width`, `min_height`, `resize_value`, `sorting`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`, `created_at`, `updated_at`) VALUES
(2, 'Admin', 'profile', 'image', 5000, 600, 600, '[\"600x600\",\"300x300\",\"50x50\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-10 00:36:15', '2024-09-11 00:50:34'),
(5, 'Album', 'image', 'image', 5120, 600, 600, '[\"600x600\",\"340x340\",\"242x242\",\"50x50\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-10 03:46:00', '2024-09-10 23:29:38'),
(6, 'Content', 'image', 'image', 5000, 636, 610, '[\"636x610\",\"583x559\",\"200x192\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-10 22:41:03', '2024-09-11 05:47:48'),
(9, 'News', 'image', 'image', 5000, 856, 526, '[\"856x526\",\"416x256\",\"110x67\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-14 11:18:50', '2024-09-14 11:18:50'),
(10, 'Video', 'thumbnail', 'image', 500, 400, 400, '[\"300x300\",\"200x200\",\"50x50\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-14 23:45:05', '2024-09-14 23:45:05'),
(11, 'PageSection', 'image', 'image', 500, 64, 64, '[\"64x64\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-14 18:48:48', '2024-09-14 18:48:48'),
(12, 'Events', 'image', 'image', 500, 600, 600, '[\"500x500\",\"300x300\",\"50x50\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-15 00:58:35', '2024-09-15 00:58:35'),
(13, 'PageSeo', 'image', 'image', 500, 600, 600, '[\"600x600\",\"200x200\",\"50x50\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-15 03:50:42', '2024-09-15 03:50:42'),
(14, 'SiteSetting', 'logo_small', 'image', 500, 261, 90, '[\"261x90\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-18 10:14:40', '2024-09-30 12:29:53'),
(15, 'SiteSetting', 'logo', 'image', 500, 300, 90, '[\"300x90\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-18 10:15:23', '2024-09-30 12:30:00'),
(18, 'Service', 'image', 'image', 5000, 1076, 541, '[\"1076x541\"]', 0, 'active', NULL, NULL, NULL, NULL, '2025-06-25 04:13:20', '2025-06-25 04:13:20'),
(19, 'Service', 'image_small', 'image', 5000, 52, 52, '[\"52x52\"]', 0, 'active', NULL, NULL, NULL, NULL, '2025-06-25 04:14:05', '2025-06-25 04:14:05'),
(20, 'Project', 'image', 'image', 5000, 856, 526, '[\"856x526\",\"416x256\"]', 0, 'active', NULL, NULL, NULL, NULL, '2025-07-14 10:02:11', '2025-07-14 10:02:11'),
(21, 'Client', 'image', 'image', 5000, 400, 348, '[\"400x348\"]', 0, 'active', NULL, NULL, NULL, NULL, '2025-07-13 22:45:41', '2025-07-13 22:45:41'),
(22, 'Partnership', 'image', 'image', 5000, 150, 150, '[\"150x150\"]', 0, 'active', NULL, NULL, NULL, NULL, '2025-07-14 05:15:56', '2025-07-14 05:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `menu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `show_dasboard` tinyint NOT NULL DEFAULT '0',
  `show_profile` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `menu_name`, `module_name`, `icon`, `route_name`, `params`, `sorting`, `show_dasboard`, `show_profile`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Dashboard', NULL, '<i class=\'fas fa-cog spin\'></i>', 'dashboard.index', NULL, 0, 0, 0, NULL, NULL),
(2, NULL, 'Admin', NULL, '<i class=\'fa fa-user\'></i>', 'admin.index', NULL, 1, 0, 0, NULL, NULL),
(3, NULL, 'Master Setup', NULL, '<i class=\'fab fa-mastodon\'></i>', NULL, NULL, 2, 0, 0, NULL, NULL),
(4, 3, 'Category', '\\App\\Models\\Category', '<i class=\'fa fa-list text-aqua\'></i>', 'category.index', NULL, 0, 0, 0, NULL, '2024-09-09 00:22:16'),
(5, NULL, 'Contents', NULL, '<i class=\'fa fa-windows\'></i>', NULL, NULL, 3, 0, 0, NULL, NULL),
(6, 5, 'Content List', NULL, '<i class=\'fa fa-list text-aqua\'></i>', 'content.index', NULL, 0, 0, 0, NULL, NULL),
(7, NULL, 'Website', NULL, '<i class=\'fas fa-globe\'></i>', NULL, NULL, 4, 0, 0, NULL, NULL),
(8, 7, 'Contact Us', NULL, '<i class=\'fas fa-address-book\'></i>', 'contacts.index', NULL, 0, 0, 0, NULL, NULL),
(10, 7, 'Faq', '\\App\\Models\\Faq', '<i class=\'fas fa-book-open\'></i>', 'faq.index', NULL, 2, 0, 0, NULL, '2024-09-10 01:43:03'),
(11, 7, 'Notice', NULL, '<i class=\'fab fa-leanpub\'></i>', 'notice.index', NULL, 3, 0, 0, NULL, NULL),
(12, 7, 'News', '\\App\\Models\\Website\\News', '<i class=\'fa fa-newspaper-o\'></i>', 'news.index', NULL, 4, 0, 0, NULL, '2024-09-10 01:41:31'),
(13, NULL, 'Profile', NULL, '<i class=\'fa fa-user-o\'></i>', 'profile.index', NULL, 5, 0, 0, NULL, NULL),
(14, NULL, 'Gallery / Images', NULL, '<i class=\'fa fa-windows\'></i>', NULL, NULL, 6, 0, 0, NULL, NULL),
(15, 14, 'Albums', NULL, '<i class=\'fas fa-photo-video\'></i>', 'album.index', NULL, 0, 0, 0, NULL, '2024-10-02 05:00:01'),
(16, 14, 'Photos', NULL, '<i class=\'fas fa-camera\'></i>', 'photo.index', NULL, 1, 0, 0, NULL, '2024-10-02 04:56:58'),
(17, 14, 'Videos', NULL, '<i class=\'fab fa-youtube\'></i>', 'video.index', NULL, 2, 0, 0, NULL, '2024-10-02 05:15:28'),
(18, 14, 'Sliders', NULL, '<i class=\'far fa-images\'></i>', 'slider.index', NULL, 3, 0, 0, NULL, '2024-10-02 05:08:42'),
(19, NULL, 'System Settings', NULL, '<i class=\'fas fa-cogs\'></i>', NULL, NULL, 7, 0, 0, NULL, '2024-10-02 05:11:15'),
(20, 19, 'User Role', '\\App\\Models\\System\\Role', '<i class=\'fa fa-list text-aqua\'></i>', 'role.index', NULL, 0, 0, 0, NULL, '2024-09-10 01:42:11'),
(21, 19, 'Backend Menu List', NULL, '<i class=\'fa fa-list text-aqua\'></i>', 'menu.index', NULL, 1, 0, 0, NULL, '2024-08-26 22:22:42'),
(22, 19, 'Frontend Menu List', NULL, '<i class=\'fa fa-list text-aqua\'></i>', 'frontMenu.index', NULL, 2, 0, 0, NULL, NULL),
(23, 19, 'Site Settings', NULL, '<i class=\'fa fa-cog text-aqua\'></i>', 'siteSetting.show', NULL, 3, 0, 1, NULL, '2024-10-01 21:09:43'),
(25, 19, 'Module Create', NULL, '<i class=\'fa fa-folder text-aqua\'></i>', 'module.create', NULL, 5, 0, 0, NULL, NULL),
(27, NULL, 'Log', NULL, '<i class=\'fas fa-align-center\'></i>', NULL, NULL, 26, 0, 0, '2024-07-15 03:20:47', '2024-10-02 03:17:07'),
(28, 27, 'Activity Log', '\\App\\Models\\UserLoginHistory', '<i class=\'fas fa-air-freshener\'></i>', 'activityLog.index', 'sdsd', 27, 1, 0, '2024-07-14 21:21:24', '2024-09-09 19:40:34'),
(29, NULL, 'Page SEO', '\\App\\Models\\PageSeo', '<i class=\'fas fa-align-justify\'></i>', 'pageSeo.index', 'bristy', 2, 1, 0, '2024-08-02 23:19:52', '2024-08-11 00:37:21'),
(30, NULL, 'Page', '\\App\\Models\\Page', '<i class=\'fas fa-align-center\'></i>', 'page.index', NULL, 2, 1, 0, '2024-08-02 23:22:04', '2024-08-02 23:23:04'),
(45, NULL, 'Page Section', NULL, '<i class=\'fas fa-book\'></i>', 'pageSection.index', NULL, 2, 0, 0, '2024-08-28 06:11:58', '2024-10-02 05:26:26'),
(46, 3, 'Media Validator', NULL, '<i class=\'fas fa-image\'></i>', 'mediaValidator.index', NULL, 32, 0, 0, '2024-09-09 06:41:49', '2024-09-10 06:50:30'),
(47, NULL, 'SEO', NULL, '<i class=\'fas fa-align-right\'></i>', NULL, NULL, 66, 0, 0, '2024-09-10 00:39:08', '2024-09-11 02:27:52'),
(48, 47, 'SEO Analysis', NULL, '<i class=\'fas fa-angle-double-right\'></i>', 'searchData.index', NULL, 34, 0, 0, '2024-09-10 00:41:24', '2024-09-10 00:41:24'),
(49, 47, 'Robots', NULL, '<i class=\'fas fa-align-left\'></i>', 'robots.index', NULL, 35, 0, 0, '2024-09-10 00:42:45', '2024-09-10 00:42:45'),
(52, 3, 'Help Info', NULL, '<i class=\'fas fa-hands-helping\'></i>', 'helpInfo.index', NULL, 34, 0, 0, '2024-09-18 21:57:28', '2024-09-22 01:35:41'),
(57, 3, 'Theme', NULL, '<i class=\'fab fa-themeisle\'></i>', 'theme.index', NULL, 67, 0, 0, '2025-03-09 06:08:07', '2025-03-09 06:08:07'),
(59, NULL, 'Service', NULL, '<i class=\'fab fa-servicestack\'></i>', 'service.index', NULL, 0, 0, 0, '2025-06-24 03:03:29', '2025-06-24 03:03:29'),
(66, NULL, 'Organization', NULL, '<i class=\'fas fa-building\'></i>', 'Organization.index', NULL, 0, 0, 0, '2025-07-28 22:07:24', '2025-07-28 22:07:24'),
(67, NULL, 'Package', NULL, '<i class=\'fas fa-archive\'></i>', 'package.index', NULL, 0, 0, 0, '2025-07-31 21:46:13', '2025-07-31 21:46:13'),
(68, NULL, 'Invoice', NULL, '<i class=\'fa fa-circle-o text-aqua\'></i>', 'invoice.index', NULL, 0, 0, 0, '2025-08-16 05:06:31', '2025-08-16 05:06:31'),
(69, NULL, 'AccountHead', NULL, '<i class=\'fa fa-circle-o text-aqua\'></i>', 'accountHead.index', NULL, 0, 0, 0, '2025-08-21 03:13:55', '2025-08-21 03:13:55'),
(70, NULL, 'Testimonials', NULL, '<i class=\'fas fa-user-clock\'></i>', 'testimonial.index', NULL, 20, 0, 0, '2025-09-19 04:19:35', '2025-09-19 04:19:35'),
(71, NULL, 'Feature', NULL, '<i class=\'fa fa-circle-o text-aqua\'></i>', 'feature.index', NULL, 0, 0, 0, '2025-09-20 01:42:06', '2025-09-20 01:42:06'),
(72, NULL, 'FAQ', NULL, '<i class=\'fas fa-align-center\'></i>', 'faq.index', NULL, 68, 0, 0, '2025-09-20 09:06:24', '2025-09-20 09:06:24');

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
  `title` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `registration_fee` decimal(12,2) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `yearly_price` decimal(12,2) DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `flat` int DEFAULT NULL,
  `schedule_invoice` tinyint(1) DEFAULT '0',
  `sms` tinyint(1) DEFAULT NULL,
  `reminder_sms` tinyint(1) DEFAULT NULL,
  `feature` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `start_date`, `registration_fee`, `price`, `yearly_price`, `floor`, `flat`, `schedule_invoice`, `sms`, `reminder_sms`, `feature`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(3, 'সুচনা', '2025-09-19', 1000.00, 300.00, 1000.00, 5, 30, 0, 0, 0, 'n/a', '2025-09-19 03:02:52', '2025-09-19 03:02:52', 'active', 1, 1, 1, 1),
(4, 'বিকাশ', '2025-09-19', 1500.00, 500.00, 5000.00, 10, 50, 1, 1, 1, 'n/a', '2025-09-19 03:10:21', '2025-09-19 03:10:21', 'active', 1, 1, 1, 1),
(5, 'পরিপূর্ণতা', '2025-09-19', 2000.00, 1000.00, 10000.00, 100, 300, 1, 1, 1, 'n/a', '2025-09-19 03:13:24', '2025-09-19 03:13:24', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home', 0, 'active', '2025-09-20 00:21:30', '2025-09-20 00:21:30');

-- --------------------------------------------------------

--
-- Table structure for table `page_sections`
--

CREATE TABLE `page_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `page_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `page_id` int DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_sections`
--

INSERT INTO `page_sections` (`id`, `title`, `slug`, `amount`, `page_title`, `sub_title`, `page_id`, `type`, `icon`, `image`, `description`, `url`, `video_url`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Why people choose us', 'why-people-choose-us', 'undefined', 'এই সফটওয়্যারটিকে', 'আপনি কেন পছন্দ করবেন?', 1, 'text', NULL, 'null', '<p>n/a</p>', NULL, NULL, 1, 'active', '2025-09-20 00:41:27', '2025-09-20 00:56:29'),
(9, 'About Us Title', 'about-us-title', 'undefined', 'আমাদের', 'সম্পর্কে', 1, 'text', NULL, 'null', '<p>n/a</p>', NULL, NULL, 2, 'active', '2025-09-20 04:24:10', '2025-09-20 04:24:10'),
(10, 'Title Slogan', 'title-slogan', 'undefined', 'আমাদের সফটওয়্যার', 'আপনার ভবন ব্যবস্থাপনাকে আরও সহজ ও স্মার্ট করে তুলবে', 1, 'text', NULL, 'null', '<p>N/A</p>', NULL, NULL, 3, 'active', '2025-09-20 05:05:46', '2025-09-20 05:05:46'),
(11, 'Contact', 'contact', 'undefined', 'আপনার কি প্রশ্ন আছে?', 'আমাদের সাথে যোগাযোগ করুন', 1, 'text', NULL, 'null', '<p>আপনার প্রশ্ন, পরামর্শ বা মতামত আমাদের কাছে গুরুত্বপূর্ণ। দয়া করে নিচের ফর্ম পূরণ করুন এবং আমরা যত দ্রুত সম্ভব আপনার সাথে যোগাযোগ করব।</p>', NULL, NULL, 4, 'active', '2025-09-20 16:02:35', '2025-09-20 16:02:35'),
(12, 'FAQ', 'faq', 'undefined', 'সাধারণ', 'জিজ্ঞাসা', 1, 'text', NULL, 'null', '<p>এখানে আমরা সাধারণভাবে প্রায়শই জিজ্ঞাস্য প্রশ্নগুলোর উত্তর প্রদান করেছি। আপনার যদি কোনো প্রশ্ন থাকে যা এখানে না থাকে, তাহলে দয়া করে আমাদের সাথে যোগাযোগ করুন। আমরা দ্রুত এবং পরিষ্কার উত্তর দিতে চেষ্টা করব।</p>', NULL, NULL, 5, 'active', '2025-09-20 16:12:13', '2025-09-20 16:30:27'),
(13, 'Footer Text', 'footer-text', 'undefined', 'footer text', NULL, 1, 'text', NULL, 'null', '<p>BD Organization &ndash; একটি স্মার্ট অ্যাপার্টমেন্ট ম্যানেজমেন্ট সফটওয়্যার। ভাড়া ব্যবস্থাপনা, ইনভয়েস ও পেমেন্ট ট্র্যাকিং, ইউটিলিটি বিল, রক্ষণাবেক্ষণ খরচ ও রিপোর্ট&mdash;all in one সমাধান।</p>', NULL, NULL, 6, 'active', '2025-09-21 18:24:04', '2025-09-21 18:24:04'),
(14, 'Copyright', 'copyright', 'undefined', 'copyright', 'undefined', 1, 'text', NULL, 'null', '<p>Quill Information Technology&nbsp;সকল আইনগত অধিকার সংরক্ষিত।&nbsp;</p>', NULL, NULL, 7, 'active', '2025-09-23 17:57:59', '2025-09-23 17:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `page_seos`
--

CREATE TABLE `page_seos` (
  `id` bigint UNSIGNED NOT NULL,
  `page_id` bigint UNSIGNED DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sorting` int DEFAULT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_seos`
--

INSERT INTO `page_seos` (`id`, `page_id`, `image`, `sorting`, `meta_tag`, `meta_description`, `status`, `created_at`, `updated_at`) VALUES
(36, 26, '{\"600x600\":\"upload\\/pageSeo\\/600x600\\/c0ab73eb-9798-441d-bb7a-1527a4d6bb41.avif\",\"200x200\":\"upload\\/pageSeo\\/200x200\\/051d42cf-d2ff-48d4-93ea-b2b56ceeaef6.avif\",\"50x50\":\"upload\\/pageSeo\\/50x50\\/1bf04040-059a-43ee-add1-9399e634edcf.avif\",\"original\":\"upload\\/pageSeo\\/original\\/c7d8f0c7-da65-4e8c-87b9-b07bcaf949d0.avif\"}', 1, '[\"Peak\"]', NULL, 'active', '2024-10-08 03:52:29', '2024-10-08 03:52:29'),
(37, 25, '{\"600x600\":\"upload\\/pageSeo\\/600x600\\/117d15b4-12c8-4c3e-9d7e-9687f47dc7d4.avif\",\"200x200\":\"upload\\/pageSeo\\/200x200\\/c0d4bb4d-f988-4120-b695-36d0ec0ae774.avif\",\"50x50\":\"upload\\/pageSeo\\/50x50\\/c7bcb866-868a-4454-9f7d-f6ff11ce7a44.avif\",\"original\":\"upload\\/pageSeo\\/original\\/c4556b81-a0db-4594-a4a1-bd73fc965c25.avif\"}', 2, '[\"Page\"]', NULL, 'active', '2024-10-15 05:14:46', '2024-11-27 06:59:26'),
(38, 24, '{\"600x600\":\"upload\\/pageSeo\\/600x600\\/370db796-4701-4e66-9b66-28a6db4c9aad.avif\",\"200x200\":\"upload\\/pageSeo\\/200x200\\/f43077c8-e2c6-4bc5-9b19-db126639ceae.avif\",\"50x50\":\"upload\\/pageSeo\\/50x50\\/3eb582c7-fd2e-43b0-86ff-35172d8257d5.avif\",\"original\":\"upload\\/pageSeo\\/original\\/72995131-f342-4ab2-a1be-42f7c10f3c22.avif\"}', 3, '[\"home\",\"home2\"]', 'home', 'active', '2025-07-23 03:55:11', '2025-07-23 03:57:20'),
(39, 29, '{\"600x600\":\"upload\\/pageSeo\\/600x600\\/8bd8e69f-4fe8-4e33-b626-3fd72b791597.avif\",\"200x200\":\"upload\\/pageSeo\\/200x200\\/ec8e810d-5477-44b6-be28-b303003aae35.avif\",\"50x50\":\"upload\\/pageSeo\\/50x50\\/e98742de-7a7e-4970-9905-f7656e943b9d.avif\",\"original\":\"upload\\/pageSeo\\/original\\/f0bd31c2-4be0-41ca-b355-84fd2a5ce200.avif\"}', 4, '[\"about us\"]', 'about us', 'active', '2025-07-23 03:57:00', '2025-07-23 03:57:00'),
(40, 30, '{\"600x600\":\"upload\\/pageSeo\\/600x600\\/b4492bf1-4154-43f3-bc56-ffb72c004924.avif\",\"200x200\":\"upload\\/pageSeo\\/200x200\\/c1396e8a-c473-44ef-99bc-1b014a6c3214.avif\",\"50x50\":\"upload\\/pageSeo\\/50x50\\/fb19d462-b360-45a7-96fc-151dc5ae2984.avif\",\"original\":\"upload\\/pageSeo\\/original\\/8b4a759c-97a8-4a86-93a1-140006aecf06.avif\"}', 5, '[\"service\"]', 'service', 'active', '2025-07-23 03:59:41', '2025-07-23 03:59:41'),
(41, 31, '{\"600x600\":\"upload\\/pageSeo\\/600x600\\/829d5bfc-8984-46ed-88bd-91634b2a010b.avif\",\"200x200\":\"upload\\/pageSeo\\/200x200\\/8024543f-616c-4b5c-a95c-d1402116e9a2.avif\",\"50x50\":\"upload\\/pageSeo\\/50x50\\/3830c13d-3f61-416a-830d-f8702c4e3d67.avif\",\"original\":\"upload\\/pageSeo\\/original\\/ed5da136-93fb-4d2a-b01c-cab5117a252f.avif\"}', 6, '[\"projects\"]', 'project', 'active', '2025-07-23 04:01:18', '2025-07-23 04:01:18'),
(42, 32, '{\"600x600\":\"upload\\/pageSeo\\/600x600\\/509acda2-f273-4f5b-a27a-b69d4174fbdf.avif\",\"200x200\":\"upload\\/pageSeo\\/200x200\\/83dec646-5e40-4c96-9ed3-390e17b3022d.avif\",\"50x50\":\"upload\\/pageSeo\\/50x50\\/5c598e99-9838-4e93-985f-28acbf0ca74c.avif\",\"original\":\"upload\\/pageSeo\\/original\\/cad77679-6ec9-4995-99a0-3bdb0436987f.avif\"}', 7, '[\"clients\"]', 'clients', 'active', '2025-07-23 04:02:59', '2025-07-23 04:02:59'),
(43, 33, '{\"600x600\":\"upload\\/pageSeo\\/600x600\\/2a8d6e34-225e-4500-9c7a-8162eefd94f8.avif\",\"200x200\":\"upload\\/pageSeo\\/200x200\\/a8888089-c2f7-4549-b3f8-c5500dda3314.avif\",\"50x50\":\"upload\\/pageSeo\\/50x50\\/d0266085-8f1c-4910-b76f-38fa56e9b614.avif\",\"original\":\"upload\\/pageSeo\\/original\\/5e64399c-3ff5-4021-ab29-7da5c5832197.avif\"}', 8, '[\"dsdsds\"]', 'news', 'active', '2025-07-23 04:07:59', '2025-07-23 04:08:59'),
(44, 34, '{\"600x600\":\"upload\\/pageSeo\\/600x600\\/448b6f94-f6a6-4f8c-8708-c8cbd61da378.avif\",\"200x200\":\"upload\\/pageSeo\\/200x200\\/33c44998-55ec-4c1f-8606-8d5e00d0aabb.avif\",\"50x50\":\"upload\\/pageSeo\\/50x50\\/973af758-60bd-4c01-ab98-77f468020b8e.avif\",\"original\":\"upload\\/pageSeo\\/original\\/de039be3-8688-4cc6-ba90-29620c4667e2.avif\"}', 9, '[\"career\"]', 'career', 'active', '2025-07-23 04:10:17', '2025-07-23 04:10:17'),
(45, 35, '{\"600x600\":\"upload\\/pageSeo\\/600x600\\/51376ba4-9226-43d5-98b3-74e5a3b182aa.avif\",\"200x200\":\"upload\\/pageSeo\\/200x200\\/d6be9b50-f5dd-45b9-a2de-06bd1ae73247.avif\",\"50x50\":\"upload\\/pageSeo\\/50x50\\/e4381406-adb6-43c7-ae57-667b9e820d08.avif\",\"original\":\"upload\\/pageSeo\\/original\\/7cea1ea9-d796-4203-92b1-159a418ab757.avif\"}', 10, '[\"contact\"]', 'contact', 'active', '2025-07-23 04:11:12', '2025-07-23 04:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(2, 'leo@nogorsolutions.com', '$2y$10$R1x3zFolj4JjoxQbigah1Og/O.S5lulQ7r5G57wMT8BGb.FSRCy5q', '2025-01-02 12:32:03'),
(3, 'nsl@gmail.com', '$2y$10$Lu5xNLN.FbY9VuDZvGQLKelx4QsRQwedgJyV7Im5Mf8lffW.7C7CC', '2025-05-06 11:54:24'),
(7, 'mehedihasan33x@gmail.com', '$2y$10$j1/2d5yes2IxIogbMXIku.7QzGbFwFv5uIOneRej7B3CVGwSGRWny', '2025-05-06 12:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `route`, `parent_id`) VALUES
(1, 'ActivityLogController', NULL, NULL),
(2, 'sitemapData', 'sitemapData.sitemapData', 1),
(3, 'index', 'activityLog.index', 1),
(4, 'show', 'activityLog.show', 1),
(5, 'allRead', 'activityLog.allRead', 1),
(6, 'destroy', 'activityLog.destroy', 1),
(7, 'sitemap', 'sitemap.sitemap', 1),
(8, 'DashboardController', NULL, NULL),
(9, 'index', 'dashboard.index', 8),
(10, 'ContentController', NULL, NULL),
(11, 'index', 'content.index', 10),
(12, 'store', 'content.store', 10),
(13, 'show', 'content.show', 10),
(14, 'create', 'content.create', 10),
(15, 'edit', 'content.edit', 10),
(16, 'file', 'content.file', 10),
(17, 'storeFile', 'content.storeFile', 10),
(18, 'destroy', 'content.destroy', 10),
(19, 'AlbumController', NULL, NULL),
(20, 'index', 'album.index', 19),
(21, 'create', 'album.create', 19),
(22, 'store', 'album.store', 19),
(23, 'show', 'album.show', 19),
(24, 'edit', 'album.edit', 19),
(25, 'update', 'album.update', 19),
(26, 'destroy', 'album.destroy', 19),
(27, 'PhotoController', NULL, NULL),
(28, 'index', 'photo.index', 27),
(29, 'create', 'photo.create', 27),
(30, 'store', 'photo.store', 27),
(31, 'show', 'photo.show', 27),
(32, 'edit', 'photo.edit', 27),
(33, 'update', 'photo.update', 27),
(34, 'destroy', 'photo.destroy', 27),
(35, 'VideoController', NULL, NULL),
(36, 'index', 'video.index', 35),
(37, 'create', 'video.create', 35),
(38, 'store', 'video.store', 35),
(39, 'show', 'video.show', 35),
(40, 'edit', 'video.edit', 35),
(41, 'update', 'video.update', 35),
(42, 'destroy', 'video.destroy', 35),
(43, 'SliderController', NULL, NULL),
(44, 'index', 'slider.index', 43),
(45, 'create', 'slider.create', 43),
(46, 'store', 'slider.store', 43),
(47, 'show', 'slider.show', 43),
(48, 'edit', 'slider.edit', 43),
(49, 'update', 'slider.update', 43),
(50, 'destroy', 'slider.destroy', 43),
(51, 'FrontMenuController', NULL, NULL),
(52, 'index', 'frontMenu.index', 51),
(53, 'create', 'frontMenu.create', 51),
(54, 'store', 'frontMenu.store', 51),
(55, 'show', 'frontMenu.show', 51),
(56, 'edit', 'frontMenu.edit', 51),
(57, 'update', 'frontMenu.update', 51),
(58, 'destroy', 'frontMenu.destroy', 51),
(59, 'NewsController', NULL, NULL),
(60, 'index', 'news.index', 59),
(61, 'create', 'news.create', 59),
(62, 'store', 'news.store', 59),
(63, 'show', 'news.show', 59),
(64, 'edit', 'news.edit', 59),
(65, 'update', 'news.update', 59),
(66, 'destroy', 'news.destroy', 59),
(67, 'NoticeController', NULL, NULL),
(68, 'index', 'notice.index', 67),
(69, 'create', 'notice.create', 67),
(70, 'store', 'notice.store', 67),
(71, 'show', 'notice.show', 67),
(72, 'edit', 'notice.edit', 67),
(73, 'update', 'notice.update', 67),
(74, 'destroy', 'notice.destroy', 67),
(75, 'CategoryController', NULL, NULL),
(76, 'index', 'category.index', 75),
(77, 'create', 'category.create', 75),
(78, 'store', 'category.store', 75),
(79, 'show', 'category.show', 75),
(80, 'edit', 'category.edit', 75),
(81, 'update', 'category.update', 75),
(82, 'destroy', 'category.destroy', 75),
(83, 'ContactsController', NULL, NULL),
(84, 'index', 'contacts.index', 83),
(85, 'create', 'contacts.create', 83),
(86, 'store', 'contacts.store', 83),
(87, 'show', 'contacts.show', 83),
(88, 'edit', 'contacts.edit', 83),
(89, 'update', 'contacts.update', 83),
(90, 'destroy', 'contacts.destroy', 83),
(91, 'FaqController', NULL, NULL),
(92, 'index', 'faq.index', 91),
(93, 'create', 'faq.create', 91),
(94, 'store', 'faq.store', 91),
(95, 'show', 'faq.show', 91),
(96, 'edit', 'faq.edit', 91),
(97, 'update', 'faq.update', 91),
(98, 'destroy', 'faq.destroy', 91),
(99, 'EventsController', NULL, NULL),
(100, 'index', 'events.index', 99),
(101, 'create', 'events.create', 99),
(102, 'store', 'events.store', 99),
(103, 'show', 'events.show', 99),
(104, 'edit', 'events.edit', 99),
(105, 'update', 'events.update', 99),
(106, 'destroy', 'events.destroy', 99),
(107, 'SliderDetailsController', NULL, NULL),
(108, 'index', 'slider-details.index', 107),
(109, 'create', 'slider-details.create', 107),
(110, 'store', 'slider-details.store', 107),
(111, 'show', 'slider-details.show', 107),
(112, 'edit', 'slider-details.edit', 107),
(113, 'update', 'slider-details.update', 107),
(114, 'destroy', 'slider-details.destroy', 107),
(115, 'ModuleController', NULL, NULL),
(116, 'create', 'module.create', 115),
(117, 'RoleController', NULL, NULL),
(118, 'index', 'role.index', 117),
(119, 'create', 'role.create', 117),
(120, 'store', 'role.store', 117),
(121, 'show', 'role.show', 117),
(122, 'edit', 'role.edit', 117),
(123, 'update', 'role.update', 117),
(124, 'destroy', 'role.destroy', 117),
(125, 'MenuController', NULL, NULL),
(126, 'index', 'menu.index', 125),
(127, 'create', 'menu.create', 125),
(128, 'store', 'menu.store', 125),
(129, 'show', 'menu.show', 125),
(130, 'edit', 'menu.edit', 125),
(131, 'update', 'menu.update', 125),
(132, 'destroy', 'menu.destroy', 125),
(133, 'SiteSettingController', NULL, NULL),
(134, 'index', 'siteSetting.index', 133),
(135, 'create', 'siteSetting.create', 133),
(136, 'store', 'siteSetting.store', 133),
(137, 'show', 'siteSetting.show', 133),
(138, 'edit', 'siteSetting.edit', 133),
(139, 'update', 'siteSetting.update', 133),
(140, 'destroy', 'siteSetting.destroy', 133),
(141, 'AdminController', NULL, NULL),
(142, 'index', 'admin.index', 141),
(143, 'create', 'admin.create', 141),
(144, 'store', 'admin.store', 141),
(145, 'show', 'admin.show', 141),
(146, 'edit', 'admin.edit', 141),
(147, 'update', 'admin.update', 141),
(148, 'destroy', 'admin.destroy', 141),
(149, 'PageController', NULL, NULL),
(150, 'index', 'page.index', 149),
(151, 'create', 'page.create', 149),
(152, 'store', 'page.store', 149),
(153, 'show', 'page.show', 149),
(154, 'edit', 'page.edit', 149),
(155, 'update', 'page.update', 149),
(156, 'destroy', 'page.destroy', 149),
(157, 'PageSeoController', NULL, NULL),
(158, 'index', 'pageSeo.index', 157),
(159, 'create', 'pageSeo.create', 157),
(160, 'store', 'pageSeo.store', 157),
(161, 'show', 'pageSeo.show', 157),
(162, 'edit', 'pageSeo.edit', 157),
(163, 'update', 'pageSeo.update', 157),
(164, 'destroy', 'pageSeo.destroy', 157),
(165, 'profileDetails', 'profile.profileDetails', 141),
(166, 'PageSectionController', NULL, NULL),
(167, 'index', 'pageSection.index', 166),
(168, 'create', 'pageSection.create', 166),
(169, 'store', 'pageSection.store', 166),
(170, 'show', 'pageSection.show', 166),
(171, 'edit', 'pageSection.edit', 166),
(172, 'update', 'pageSection.update', 166),
(173, 'destroy', 'pageSection.destroy', 166),
(174, 'RobotController', NULL, NULL),
(175, 'index', 'robots.index', 174),
(176, 'getfilecontent', 'robots.getfilecontent', 174),
(177, 'savefilecontent', 'robots.savefilecontent', 174),
(178, 'XmlController', NULL, NULL),
(179, 'index', 'searchData.index', 178),
(180, 'generateXmlFile', 'searchData.generateXmlFile', 178),
(181, 'getXmlFile', 'searchData.getXmlFile', 178),
(182, 'getBrokenUrl', 'searchData.getBrokenUrl', 178),
(183, 'ImageResizerController', NULL, NULL),
(184, 'index', 'imageResizer.index', 183),
(185, 'create', 'imageResizer.create', 183),
(186, 'store', 'imageResizer.store', 183),
(187, 'show', 'imageResizer.show', 183),
(188, 'edit', 'imageResizer.edit', 183),
(189, 'update', 'imageResizer.update', 183),
(190, 'destroy', 'imageResizer.destroy', 183),
(191, 'MediaValidatorController', NULL, NULL),
(192, 'index', 'mediaValidator.index', 191),
(193, 'create', 'mediaValidator.create', 191),
(194, 'store', 'mediaValidator.store', 191),
(195, 'show', 'mediaValidator.show', 191),
(196, 'edit', 'mediaValidator.edit', 191),
(197, 'update', 'mediaValidator.update', 191),
(198, 'destroy', 'mediaValidator.destroy', 191),
(199, 'restore', 'activityLog.restore', 1),
(200, 'HelpInfoController', NULL, NULL),
(201, 'index', 'helpInfo.index', 200),
(202, 'create', 'helpInfo.create', 200),
(203, 'store', 'helpInfo.store', 200),
(204, 'show', 'helpInfo.show', 200),
(205, 'edit', 'helpInfo.edit', 200),
(206, 'update', 'helpInfo.update', 200),
(207, 'destroy', 'helpInfo.destroy', 200),
(208, 'updateProfile', 'profile.updateProfile', 141),
(209, 'ThemeController', NULL, NULL),
(210, 'index', 'theme.index', 209),
(211, 'create', 'theme.create', 209),
(212, 'store', 'theme.store', 209),
(213, 'show', 'theme.show', 209),
(214, 'edit', 'theme.edit', 209),
(215, 'update', 'theme.update', 209),
(216, 'destroy', 'theme.destroy', 209),
(217, 'ServiceController', NULL, NULL),
(218, 'index', 'service.index', 217),
(219, 'create', 'service.create', 217),
(220, 'store', 'service.store', 217),
(221, 'show', 'service.show', 217),
(222, 'edit', 'service.edit', 217),
(223, 'update', 'service.update', 217),
(224, 'destroy', 'service.destroy', 217),
(225, 'ClientController', NULL, NULL),
(226, 'index', 'client.index', 225),
(227, 'create', 'client.create', 225),
(228, 'store', 'client.store', 225),
(229, 'show', 'client.show', 225),
(230, 'edit', 'client.edit', 225),
(231, 'update', 'client.update', 225),
(232, 'destroy', 'client.destroy', 225),
(233, 'PartnershipController', NULL, NULL),
(234, 'index', 'partnership.index', 233),
(235, 'create', 'partnership.create', 233),
(236, 'store', 'partnership.store', 233),
(237, 'show', 'partnership.show', 233),
(238, 'edit', 'partnership.edit', 233),
(239, 'update', 'partnership.update', 233),
(240, 'destroy', 'partnership.destroy', 233),
(241, 'TestimonialController', NULL, NULL),
(242, 'index', 'testimonial.index', 241),
(243, 'create', 'testimonial.create', 241),
(244, 'store', 'testimonial.store', 241),
(245, 'show', 'testimonial.show', 241),
(246, 'edit', 'testimonial.edit', 241),
(247, 'update', 'testimonial.update', 241),
(248, 'destroy', 'testimonial.destroy', 241),
(249, 'ProjectController', NULL, NULL),
(250, 'index', 'project.index', 249),
(251, 'create', 'project.create', 249),
(252, 'store', 'project.store', 249),
(253, 'show', 'project.show', 249),
(254, 'edit', 'project.edit', 249),
(255, 'update', 'project.update', 249),
(256, 'destroy', 'project.destroy', 249),
(257, 'CareerController', NULL, NULL),
(258, 'index', 'career.index', 257),
(259, 'create', 'career.create', 257),
(260, 'store', 'career.store', 257),
(261, 'show', 'career.show', 257),
(262, 'edit', 'career.edit', 257),
(263, 'update', 'career.update', 257),
(264, 'destroy', 'career.destroy', 257),
(265, 'ApplicationController', NULL, NULL),
(266, 'index', 'application.index', 265),
(267, 'create', 'application.create', 265),
(268, 'store', 'application.store', 265),
(269, 'show', 'application.show', 265),
(270, 'edit', 'application.edit', 265),
(271, 'update', 'application.update', 265),
(272, 'destroy', 'application.destroy', 265),
(273, 'OrganizationController', NULL, NULL),
(274, 'index', 'Organization.index', 273),
(275, 'create', 'Organization.create', 273),
(276, 'store', 'Organization.store', 273),
(277, 'show', 'Organization.show', 273),
(278, 'edit', 'Organization.edit', 273),
(279, 'update', 'Organization.update', 273),
(280, 'destroy', 'Organization.destroy', 273),
(281, 'PackageController', NULL, NULL),
(282, 'index', 'package.index', 281),
(283, 'create', 'package.create', 281),
(284, 'store', 'package.store', 281),
(285, 'show', 'package.show', 281),
(286, 'edit', 'package.edit', 281),
(287, 'update', 'package.update', 281),
(288, 'destroy', 'package.destroy', 281),
(289, 'InvoiceController', NULL, NULL),
(290, 'index', 'invoice.index', 289),
(291, 'create', 'invoice.create', 289),
(292, 'store', 'invoice.store', 289),
(293, 'show', 'invoice.show', 289),
(294, 'edit', 'invoice.edit', 289),
(295, 'update', 'invoice.update', 289),
(296, 'destroy', 'invoice.destroy', 289),
(297, 'AccountHeadController', NULL, NULL),
(298, 'index', 'accountHead.index', 297),
(299, 'create', 'accountHead.create', 297),
(300, 'store', 'accountHead.store', 297),
(301, 'show', 'accountHead.show', 297),
(302, 'edit', 'accountHead.edit', 297),
(303, 'update', 'accountHead.update', 297),
(304, 'destroy', 'accountHead.destroy', 297),
(305, 'FeatureController', NULL, NULL),
(306, 'index', 'feature.index', 305),
(307, 'create', 'feature.create', 305),
(308, 'store', 'feature.store', 305),
(309, 'show', 'feature.show', 305),
(310, 'edit', 'feature.edit', 305),
(311, 'update', 'feature.update', 305),
(312, 'destroy', 'feature.destroy', 305);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint UNSIGNED NOT NULL,
  `album_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `album_id`, `title`, `images`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(35, 10, NULL, '{\"resize0\":\"upload\\/photos\\/resize_50X50\\/241008095744-1379.jpg\",\"resize1\":\"upload\\/photos\\/resize_300X300\\/241008095744-8889.jpg\",\"resize2\":\"upload\\/photos\\/resize_600X600\\/241008095744-7103.jpg\"}', 2, 'active', '2024-10-08 03:57:44', '2024-10-08 03:57:44'),
(36, 10, NULL, '{\"resize0\":\"upload\\/photos\\/resize_50X50\\/241008095744-1809.jpg\",\"resize1\":\"upload\\/photos\\/resize_300X300\\/241008095744-8126.jpg\",\"resize2\":\"upload\\/photos\\/resize_600X600\\/241008095744-2164.jpg\"}', 3, 'active', '2024-10-08 03:57:44', '2024-10-08 03:57:44'),
(37, 10, NULL, '{\"resize0\":\"upload\\/photos\\/resize_50X50\\/241014064025-6412.jpeg\",\"resize1\":\"upload\\/photos\\/resize_300X300\\/241014064025-3859.jpeg\",\"resize2\":\"upload\\/photos\\/resize_600X600\\/241014064025-5072.jpeg\"}', 4, 'active', '2024-10-08 03:57:44', '2024-10-14 12:40:25'),
(38, 8, NULL, '{\"resize0\":\"upload\\/photos\\/resize_50X50\\/241008095820-9304.jpg\",\"resize1\":\"upload\\/photos\\/resize_300X300\\/241008095820-4832.jpg\",\"resize2\":\"upload\\/photos\\/resize_600X600\\/241008095820-5862.jpg\"}', 5, 'active', '2024-10-08 03:58:20', '2024-10-08 03:58:20'),
(39, 8, NULL, '{\"resize0\":\"upload\\/photos\\/resize_50X50\\/241008095820-8375.png\",\"resize1\":\"upload\\/photos\\/resize_300X300\\/241008095820-7288.png\",\"resize2\":\"upload\\/photos\\/resize_600X600\\/241008095820-9612.png\"}', 6, 'active', '2024-10-08 03:58:20', '2024-10-08 03:58:20'),
(40, 8, NULL, '{\"resize0\":\"upload\\/photos\\/resize_50X50\\/241008095820-3902.jpg\",\"resize1\":\"upload\\/photos\\/resize_300X300\\/241008095820-7828.jpg\",\"resize2\":\"upload\\/photos\\/resize_600X600\\/241008095820-1275.jpg\"}', 7, 'active', '2024-10-08 03:58:20', '2024-10-08 03:58:20'),
(41, 8, NULL, '{\"resize0\":\"upload\\/photos\\/resize_50X50\\/241008095905-4394.jpg\",\"resize1\":\"upload\\/photos\\/resize_300X300\\/241008095905-9433.jpg\",\"resize2\":\"upload\\/photos\\/resize_600X600\\/241008095906-7146.jpg\"}', 8, 'active', '2024-10-08 03:59:06', '2024-10-08 03:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `Organizations`
--

CREATE TABLE `Organizations` (
  `id` bigint UNSIGNED NOT NULL,
  `saasno` int NOT NULL,
  `Organization_name` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_name` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_id` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_date` date NOT NULL,
  `expired_date` date NOT NULL,
  `nid` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `db_host` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_user` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `block` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '1',
  `updated_by` int NOT NULL DEFAULT '1',
  `created_ip` int NOT NULL DEFAULT '1',
  `updated_ip` int NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Organizations`
--

INSERT INTO `Organizations` (`id`, `saasno`, `Organization_name`, `owner_name`, `address`, `mobile`, `email`, `package_id`, `reg_date`, `expired_date`, `nid`, `db_host`, `db_name`, `db_user`, `db_password`, `created_at`, `updated_at`, `status`, `block`, `created_by`, `updated_by`, `created_ip`, `updated_ip`, `deleted_at`) VALUES
(3, 113, 'Gulshan Khijir Monjeel', 'Gulshan Khijir Monjil', 'Khilkhet', '01326196759', 'gkm@gmail.com', '1', '2025-08-13', '2025-11-20', '57899', 'localhost', 'apptms', 'root', '', '2025-08-02 09:20:34', '2025-08-22 02:48:49', 'active', 0, 1, 1, 1, 1, NULL),
(4, 114, 'Talukdar Mension', 'Leslie Stein', 'Ainus Bag', '01826561780', 'jasim@gmail.com', '1', '2025-08-14', '2025-09-21', '11732', 'localhost', 'apptms_jasim', 'root', '', '2025-08-02 16:17:36', '2025-09-09 14:15:39', 'active', 0, 1, 1, 1, 1, NULL),
(6, 118, 'Mynul Islam', 'Leo', 'Ainus Bag', '01912252095', 'kazileoleo@gmail.com', '1', '2025-08-14', '2025-09-21', '11732', 'localhost', 'apptms', 'root', '', '2025-08-02 16:17:36', '2025-09-13 16:02:35', 'active', 0, 1, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Organization_users`
--

CREATE TABLE `Organization_users` (
  `id` int NOT NULL,
  `profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `organization_id` int NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `description` text,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` text,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `remember_token` varchar(200) DEFAULT NULL,
  `role_id` int NOT NULL,
  `block` tinyint(1) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Organization_users`
--

INSERT INTO `Organization_users` (`id`, `profile`, `organization_id`, `full_name`, `gender`, `birth_date`, `description`, `mobile`, `email`, `address`, `city`, `state`, `zip_code`, `password`, `remember_token`, `role_id`, `block`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"original\":\"upload\\/profile\\/original\\/9377b423-0c45-4bf4-b115-38a49ffb4e50.webp\",\"600x600\":\"upload\\/profile\\/600x600\\/e28743ab-6b3f-4270-94ed-c4b43b0d4bee.webp\",\"300x300\":\"upload\\/profile\\/300x300\\/6a924355-2843-4b6c-b8e1-8512369028c6.webp\",\"50x50\":\"upload\\/profile\\/50x50\\/9d56014c-cf4d-4b75-bc3c-f4b5d38fb31e.webp\"}', 3, 'Bappy', 'Male', '2025-08-12', NULL, '01326196759', 'gkm@gmail.com', 'Dhaka', 'Dhaka', 'Dhaka', 1230, '$2y$10$9A/cuNRfU/M4gqZGrgP79erOKSJ7WWH9H5hoJWBjoKGQxuH2.D2Pm', NULL, 1, 0, 'active', '2025-08-02 09:20:34', '2025-08-16 01:57:41', NULL),
(2, NULL, 4, 'Jasim', NULL, NULL, NULL, '1826561780', 'jasim@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$9A/cuNRfU/M4gqZGrgP79erOKSJ7WWH9H5hoJWBjoKGQxuH2.D2Pm', NULL, 1, 0, 'active', '2025-08-02 16:17:36', '2025-08-03 08:23:52', NULL),
(3, NULL, 5, 'Kamrul', NULL, NULL, NULL, '1911341293', 'kamrul@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$FIXB5As9J9o7M4pcda1YD.lDiLjMk.n.R.W15sL34sYvZNJRtTxE2', NULL, 1, 0, 'active', '2025-08-06 16:55:54', '2025-08-07 19:28:39', NULL),
(4, NULL, 6, 'Bd Organization Admin', NULL, NULL, NULL, '1912252095', 'kazileoleo@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$FIXB5As9J9o7M4pcda1YD.lDiLjMk.n.R.W15sL34sYvZNJRtTxE2', NULL, 2, 0, 'active', '2025-08-06 16:55:54', '2025-08-07 19:29:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'active', '2024-07-01 21:14:27', '2024-07-01 21:14:27'),
(2, 'Nogor', 'active', '2024-07-02 03:14:27', '2024-07-02 03:14:27'),
(3, 'Test', 'active', '2024-08-10 21:46:51', '2024-08-10 21:46:51'),
(4, 'Pandora Turner', 'deactive', '2024-09-22 23:46:14', '2024-09-22 23:46:14'),
(5, 'Vivian Bishop', 'active', '2024-09-22 23:46:28', '2024-09-22 23:46:28');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(1, 8),
(2, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(1, 10),
(2, 10),
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(5, 11),
(1, 12),
(2, 12),
(3, 12),
(4, 12),
(5, 12),
(1, 13),
(2, 13),
(3, 13),
(4, 13),
(5, 13),
(1, 14),
(2, 14),
(3, 14),
(4, 14),
(5, 14),
(1, 15),
(2, 15),
(3, 15),
(4, 15),
(5, 15),
(1, 16),
(2, 16),
(3, 16),
(4, 16),
(5, 16),
(1, 17),
(2, 17),
(3, 17),
(4, 17),
(5, 17),
(1, 18),
(2, 18),
(3, 18),
(4, 18),
(5, 18),
(1, 19),
(2, 19),
(1, 20),
(2, 20),
(4, 20),
(5, 20),
(1, 21),
(2, 21),
(4, 21),
(5, 21),
(1, 22),
(2, 22),
(4, 22),
(5, 22),
(1, 23),
(2, 23),
(4, 23),
(5, 23),
(1, 24),
(2, 24),
(4, 24),
(5, 24),
(1, 25),
(2, 25),
(4, 25),
(5, 25),
(1, 26),
(2, 26),
(4, 26),
(5, 26),
(1, 27),
(2, 27),
(1, 28),
(2, 28),
(4, 28),
(5, 28),
(1, 29),
(2, 29),
(4, 29),
(5, 29),
(1, 30),
(2, 30),
(4, 30),
(5, 30),
(1, 31),
(2, 31),
(4, 31),
(5, 31),
(1, 32),
(2, 32),
(4, 32),
(5, 32),
(1, 33),
(2, 33),
(4, 33),
(5, 33),
(1, 34),
(2, 34),
(4, 34),
(5, 34),
(1, 35),
(2, 35),
(1, 36),
(2, 36),
(4, 36),
(1, 37),
(2, 37),
(4, 37),
(1, 38),
(2, 38),
(4, 38),
(1, 39),
(2, 39),
(4, 39),
(1, 40),
(2, 40),
(4, 40),
(1, 41),
(2, 41),
(4, 41),
(1, 42),
(2, 42),
(4, 42),
(1, 43),
(2, 43),
(1, 44),
(2, 44),
(4, 44),
(1, 45),
(2, 45),
(4, 45),
(1, 46),
(2, 46),
(4, 46),
(1, 47),
(2, 47),
(4, 47),
(1, 48),
(2, 48),
(4, 48),
(1, 49),
(2, 49),
(4, 49),
(1, 50),
(2, 50),
(4, 50),
(1, 51),
(2, 51),
(1, 52),
(2, 52),
(3, 52),
(4, 52),
(1, 53),
(2, 53),
(3, 53),
(4, 53),
(1, 54),
(2, 54),
(3, 54),
(4, 54),
(1, 55),
(2, 55),
(3, 55),
(4, 55),
(1, 56),
(2, 56),
(3, 56),
(4, 56),
(1, 57),
(2, 57),
(3, 57),
(4, 57),
(1, 58),
(2, 58),
(3, 58),
(4, 58),
(1, 59),
(2, 59),
(1, 60),
(2, 60),
(3, 60),
(4, 60),
(1, 61),
(2, 61),
(3, 61),
(4, 61),
(1, 62),
(2, 62),
(3, 62),
(4, 62),
(1, 63),
(2, 63),
(3, 63),
(4, 63),
(1, 64),
(2, 64),
(3, 64),
(4, 64),
(1, 65),
(2, 65),
(3, 65),
(4, 65),
(1, 66),
(2, 66),
(3, 66),
(4, 66),
(1, 67),
(2, 67),
(1, 68),
(2, 68),
(3, 68),
(4, 68),
(1, 69),
(2, 69),
(3, 69),
(4, 69),
(1, 70),
(2, 70),
(3, 70),
(4, 70),
(1, 71),
(2, 71),
(3, 71),
(4, 71),
(1, 72),
(2, 72),
(3, 72),
(4, 72),
(1, 73),
(2, 73),
(3, 73),
(4, 73),
(1, 74),
(2, 74),
(3, 74),
(4, 74),
(1, 75),
(2, 75),
(1, 76),
(2, 76),
(3, 76),
(4, 76),
(1, 77),
(2, 77),
(3, 77),
(4, 77),
(1, 78),
(2, 78),
(3, 78),
(4, 78),
(1, 79),
(2, 79),
(3, 79),
(4, 79),
(1, 80),
(2, 80),
(3, 80),
(4, 80),
(1, 81),
(2, 81),
(3, 81),
(4, 81),
(1, 82),
(2, 82),
(3, 82),
(4, 82),
(1, 83),
(2, 83),
(1, 84),
(2, 84),
(3, 84),
(4, 84),
(1, 85),
(2, 85),
(3, 85),
(4, 85),
(1, 86),
(2, 86),
(3, 86),
(4, 86),
(1, 87),
(2, 87),
(3, 87),
(4, 87),
(1, 88),
(2, 88),
(3, 88),
(4, 88),
(1, 89),
(2, 89),
(3, 89),
(4, 89),
(1, 90),
(2, 90),
(3, 90),
(4, 90),
(1, 91),
(2, 91),
(1, 92),
(2, 92),
(3, 92),
(4, 92),
(1, 93),
(2, 93),
(3, 93),
(4, 93),
(1, 94),
(2, 94),
(3, 94),
(4, 94),
(1, 95),
(2, 95),
(3, 95),
(4, 95),
(1, 96),
(2, 96),
(3, 96),
(4, 96),
(1, 97),
(2, 97),
(3, 97),
(4, 97),
(1, 98),
(2, 98),
(3, 98),
(4, 98),
(1, 99),
(2, 99),
(1, 100),
(2, 100),
(3, 100),
(4, 100),
(1, 101),
(2, 101),
(3, 101),
(4, 101),
(1, 102),
(2, 102),
(3, 102),
(4, 102),
(1, 103),
(2, 103),
(3, 103),
(4, 103),
(1, 104),
(2, 104),
(3, 104),
(4, 104),
(1, 105),
(2, 105),
(3, 105),
(4, 105),
(1, 106),
(2, 106),
(3, 106),
(4, 106),
(1, 107),
(2, 107),
(1, 108),
(2, 108),
(4, 108),
(1, 109),
(2, 109),
(4, 109),
(1, 110),
(2, 110),
(4, 110),
(1, 111),
(2, 111),
(4, 111),
(1, 112),
(2, 112),
(4, 112),
(1, 113),
(2, 113),
(4, 113),
(1, 114),
(2, 114),
(4, 114),
(1, 115),
(2, 115),
(1, 116),
(2, 116),
(3, 116),
(4, 116),
(1, 117),
(2, 117),
(1, 118),
(2, 118),
(3, 118),
(4, 118),
(1, 119),
(2, 119),
(4, 119),
(1, 120),
(2, 120),
(4, 120),
(1, 121),
(2, 121),
(3, 121),
(4, 121),
(1, 122),
(2, 122),
(4, 122),
(1, 123),
(2, 123),
(4, 123),
(1, 124),
(2, 124),
(4, 124),
(1, 125),
(2, 125),
(1, 126),
(2, 126),
(3, 126),
(4, 126),
(1, 127),
(2, 127),
(3, 127),
(4, 127),
(1, 128),
(2, 128),
(3, 128),
(4, 128),
(1, 129),
(2, 129),
(3, 129),
(4, 129),
(1, 130),
(2, 130),
(3, 130),
(4, 130),
(1, 131),
(2, 131),
(3, 131),
(4, 131),
(1, 132),
(2, 132),
(3, 132),
(4, 132),
(1, 133),
(2, 133),
(1, 134),
(2, 134),
(3, 134),
(4, 134),
(1, 135),
(2, 135),
(4, 135),
(1, 136),
(2, 136),
(4, 136),
(1, 137),
(2, 137),
(3, 137),
(4, 137),
(1, 138),
(2, 138),
(4, 138),
(1, 139),
(2, 139),
(4, 139),
(1, 140),
(2, 140),
(4, 140),
(1, 141),
(2, 141),
(1, 142),
(2, 142),
(4, 142),
(1, 143),
(2, 143),
(4, 143),
(1, 144),
(2, 144),
(4, 144),
(1, 145),
(2, 145),
(4, 145),
(1, 146),
(2, 146),
(4, 146),
(1, 147),
(2, 147),
(4, 147),
(1, 148),
(2, 148),
(4, 148),
(1, 149),
(2, 149),
(1, 150),
(2, 150),
(3, 150),
(4, 150),
(1, 151),
(2, 151),
(3, 151),
(4, 151),
(1, 152),
(2, 152),
(3, 152),
(4, 152),
(1, 153),
(2, 153),
(3, 153),
(4, 153),
(1, 154),
(2, 154),
(3, 154),
(4, 154),
(1, 155),
(2, 155),
(3, 155),
(4, 155),
(1, 156),
(2, 156),
(3, 156),
(4, 156),
(1, 157),
(2, 157),
(1, 158),
(2, 158),
(3, 158),
(4, 158),
(1, 159),
(2, 159),
(3, 159),
(4, 159),
(1, 160),
(2, 160),
(3, 160),
(4, 160),
(1, 161),
(2, 161),
(3, 161),
(4, 161),
(1, 162),
(2, 162),
(3, 162),
(4, 162),
(1, 163),
(2, 163),
(3, 163),
(4, 163),
(1, 164),
(2, 164),
(3, 164),
(4, 164),
(1, 165),
(2, 165),
(4, 165),
(1, 166),
(2, 166),
(1, 167),
(2, 167),
(4, 167),
(1, 168),
(2, 168),
(4, 168),
(1, 169),
(2, 169),
(4, 169),
(1, 170),
(2, 170),
(4, 170),
(1, 171),
(2, 171),
(4, 171),
(1, 172),
(2, 172),
(4, 172),
(1, 173),
(2, 173),
(4, 173),
(1, 174),
(2, 174),
(1, 175),
(2, 175),
(4, 175),
(1, 176),
(2, 176),
(4, 176),
(1, 177),
(2, 177),
(4, 177),
(1, 178),
(2, 178),
(1, 179),
(2, 179),
(4, 179),
(1, 180),
(2, 180),
(4, 180),
(1, 181),
(2, 181),
(4, 181),
(1, 182),
(2, 182),
(4, 182),
(1, 183),
(2, 183),
(1, 184),
(2, 184),
(4, 184),
(1, 185),
(2, 185),
(4, 185),
(1, 186),
(2, 186),
(4, 186),
(1, 187),
(2, 187),
(4, 187),
(1, 188),
(2, 188),
(4, 188),
(1, 189),
(2, 189),
(4, 189),
(1, 190),
(2, 190),
(4, 190),
(1, 191),
(2, 191),
(1, 192),
(2, 192),
(4, 192),
(1, 193),
(2, 193),
(4, 193),
(1, 194),
(2, 194),
(4, 194),
(1, 195),
(2, 195),
(4, 195),
(1, 196),
(2, 196),
(4, 196),
(1, 197),
(2, 197),
(4, 197),
(1, 198),
(2, 198),
(4, 198),
(1, 199),
(2, 199),
(4, 199),
(5, 199),
(1, 200),
(2, 200),
(1, 201),
(2, 201),
(4, 201),
(1, 202),
(2, 202),
(4, 202),
(1, 203),
(2, 203),
(4, 203),
(1, 204),
(2, 204),
(4, 204),
(1, 205),
(2, 205),
(4, 205),
(1, 206),
(2, 206),
(4, 206),
(1, 207),
(2, 207),
(4, 207),
(1, 208),
(2, 208),
(1, 209),
(2, 209),
(1, 210),
(2, 210),
(1, 211),
(2, 211),
(1, 212),
(2, 212),
(1, 213),
(2, 213),
(1, 214),
(2, 214),
(1, 215),
(2, 215),
(1, 216),
(2, 216),
(1, 217),
(2, 217),
(1, 218),
(2, 218),
(1, 219),
(2, 219),
(1, 220),
(2, 220),
(1, 221),
(2, 221),
(1, 222),
(2, 222),
(1, 223),
(2, 223),
(1, 224),
(2, 224),
(1, 225),
(2, 225),
(1, 226),
(2, 226),
(1, 227),
(2, 227),
(1, 228),
(2, 228),
(1, 229),
(2, 229),
(1, 230),
(2, 230),
(1, 231),
(2, 231),
(1, 232),
(2, 232),
(1, 233),
(2, 233),
(1, 234),
(2, 234),
(1, 235),
(2, 235),
(1, 236),
(2, 236),
(1, 237),
(2, 237),
(1, 238),
(2, 238),
(1, 239),
(2, 239),
(1, 240),
(2, 240),
(1, 241),
(2, 241),
(1, 242),
(2, 242),
(1, 243),
(2, 243),
(1, 244),
(2, 244),
(1, 245),
(2, 245),
(1, 246),
(2, 246),
(1, 247),
(2, 247),
(1, 248),
(2, 248),
(1, 249),
(2, 249),
(1, 250),
(2, 250),
(1, 251),
(2, 251),
(1, 252),
(2, 252),
(1, 253),
(2, 253),
(1, 254),
(2, 254),
(1, 255),
(2, 255),
(1, 256),
(2, 256),
(1, 257),
(2, 257),
(1, 258),
(2, 258),
(1, 259),
(2, 259),
(1, 260),
(2, 260),
(1, 261),
(2, 261),
(1, 262),
(2, 262),
(1, 263),
(2, 263),
(1, 264),
(2, 264),
(1, 265),
(2, 265),
(1, 266),
(2, 266),
(1, 267),
(2, 267),
(1, 268),
(2, 268),
(1, 269),
(2, 269),
(1, 270),
(2, 270),
(1, 271),
(2, 271),
(1, 272),
(2, 272),
(1, 273),
(2, 273),
(1, 274),
(2, 274),
(1, 275),
(2, 275),
(1, 276),
(2, 276),
(1, 277),
(2, 277),
(1, 278),
(2, 278),
(1, 279),
(2, 279),
(1, 280),
(2, 280),
(1, 281),
(2, 281),
(1, 282),
(2, 282),
(1, 283),
(2, 283),
(1, 284),
(2, 284),
(1, 285),
(2, 285),
(1, 286),
(2, 286),
(1, 287),
(2, 287),
(1, 288),
(2, 288),
(1, 289),
(2, 289),
(1, 290),
(2, 290),
(1, 291),
(2, 291),
(1, 292),
(2, 292),
(1, 293),
(2, 293),
(1, 294),
(2, 294),
(1, 295),
(2, 295),
(1, 296),
(2, 296),
(1, 297),
(2, 297),
(1, 298),
(2, 298),
(1, 299),
(2, 299),
(1, 300),
(2, 300),
(1, 301),
(2, 301),
(1, 302),
(2, 302),
(1, 303),
(2, 303),
(1, 304),
(2, 304),
(1, 305),
(2, 305),
(1, 306),
(2, 306),
(1, 307),
(2, 307),
(1, 308),
(2, 308),
(1, 309),
(2, 309),
(1, 310),
(2, 310),
(1, 311),
(2, 311),
(1, 312),
(2, 312);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorting` int NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_small` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `services` (`id`, `title`, `image`, `slug`, `sorting`, `meta_tag`, `meta_description`, `image_small`, `description`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(1, 'Apt Management System', '{\"636x610\":\"upload\\/image\\/636x610\\/37bf3efa-0dff-4fc3-b45c-0548f8c110d5.avif\",\"583x559\":\"upload\\/image\\/583x559\\/9366e54f-68a3-4e96-85dc-952700a23a11.avif\",\"200x192\":\"upload\\/image\\/200x192\\/14d1e23d-ab96-4e60-b262-c2c022796482.avif\",\"original\":\"upload\\/image\\/original\\/2aa9d973-e151-4196-9b8b-52ee3d0e22e6.avif\"}', 'apt-management-system', 1, '[\"dsds\"]', 'sdsdsds', '{\"52x52\":\"upload\\/image_small\\/52x52\\/7f7a9207-e3f9-49ec-97bf-e2a733a2c3f9.avif\",\"40x40\":\"upload\\/image_small\\/40x40\\/4d81d843-cad5-4954-918d-f0f13f1a44d8.avif\",\"original\":\"upload\\/image_small\\/original\\/af40069b-991f-41f4-a247-69594d08c4d9.avif\"}', '<p>N/A</p>', '2025-07-26 17:14:59', '2025-07-26 17:14:59', 'active', 1, 1, 1, 1),
(2, 'TO-LET', '{\"636x610\":\"upload\\/image\\/636x610\\/a84aaef4-6baa-45f8-b772-a2b8d8dfd547.avif\",\"583x559\":\"upload\\/image\\/583x559\\/134b9272-0e0d-43e2-a8e4-49dca83367ad.avif\",\"200x192\":\"upload\\/image\\/200x192\\/5669b2a8-3658-4c7f-aa18-6b46f564e03a.avif\",\"original\":\"upload\\/image\\/original\\/c217a3e6-2e34-4da5-a7c3-b8a39336b2b9.avif\"}', 'to-let', 2, '[\"dsf\"]', 'sdfsdf', '{\"52x52\":\"upload\\/image_small\\/52x52\\/6d1ec81e-11da-43a1-b6f2-95d84d6a28ec.avif\",\"40x40\":\"upload\\/image_small\\/40x40\\/1c8cdf2a-5596-46b4-bb9b-c7f57d8e62f4.avif\",\"original\":\"upload\\/image_small\\/original\\/df930ed9-8d17-4af3-b241-4912587d2272.avif\"}', '<p>N/A</p>', '2025-07-26 17:16:40', '2025-07-26 17:16:40', 'active', 1, 1, 1, 1),
(3, 'BUY & SELL', '{\"636x610\":\"upload\\/image\\/636x610\\/7e484530-fc83-46fb-aa6c-0cbfa7025bc9.avif\",\"583x559\":\"upload\\/image\\/583x559\\/e7244d0f-ebe5-46ef-ae81-ce41110d155f.avif\",\"200x192\":\"upload\\/image\\/200x192\\/42cf1091-50c6-40bd-8561-74ade9dee979.avif\",\"original\":\"upload\\/image\\/original\\/c70b8d1e-3d7f-4445-a0c6-2e03650f26df.avif\"}', 'buy-sell', 3, '[\"dsfsf\"]', 'dssdfs', '{\"52x52\":\"upload\\/image_small\\/52x52\\/0451a10e-8470-46d8-ab43-6a57e514087c.avif\",\"40x40\":\"upload\\/image_small\\/40x40\\/36a7a9ab-b1b1-4cb6-be3b-334c9f6ea3a9.avif\",\"original\":\"upload\\/image_small\\/original\\/d94a4141-16ed-418d-9ce9-4b45f5bd9527.avif\"}', '<p>n/A</p>', '2025-07-26 17:18:25', '2025-07-26 17:18:25', 'active', 1, 1, 1, 1);

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
  `Organization` int DEFAULT NULL,
  `flat` int DEFAULT NULL,
  `resident` int DEFAULT NULL,
  `registration` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `title`, `short_title`, `contact_email`, `feedback_email`, `mobile1`, `mobile2`, `logo`, `logo_small`, `favicon`, `address`, `address_two`, `web`, `fb`, `tw`, `ln`, `yt`, `map`, `Organization`, `flat`, `resident`, `registration`, `created_at`, `updated_at`) VALUES
(1, 'BD Organization', 'bdOrganization', 'info@bdOrganization.com', 'info@bdOrganization.com', '+880 1912 252095', '+880 1620 221377', '{\"300x90\":\"upload\\/logo\\/300x90\\/9bb3ef5b-56be-4c7d-afea-84c8d351cf7e.avif\",\"original\":\"upload\\/logo\\/original\\/5d23d849-5201-44f5-8086-638e5c85f1cd.avif\"}', '{\"261x90\":\"upload\\/logo_small\\/261x90\\/0704cd8c-ce34-4295-a263-4b93a2bd7e1c.avif\",\"original\":\"upload\\/logo_small\\/original\\/ea25d322-2f3c-480e-946d-a66b3cbedbb2.avif\"}', 'upload/conf/250924012134-1792favicon.png', 'বাড়ি#৪৩, আনোয়ার বাগ, দক্ষিনখান, ঢাকা', NULL, 'https://bdOrganization.com', 'https://bdOrganization.com', 'https://bdOrganization.com', 'https://bdOrganization.com', 'https://bdOrganization.com', NULL, 12, 934, 934, 20, '2024-07-02 03:14:27', '2025-09-23 19:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `height` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `max_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `sorting` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slug`, `title`, `position`, `width`, `height`, `max_image`, `status`, `sorting`, `created_at`, `updated_at`) VALUES
(6, 'home-page-slider', 'Home page sliders', 'Header', '534', '392', '5', 'active', 2, '2025-07-14 05:58:00', '2025-09-21 10:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `slider_details`
--

CREATE TABLE `slider_details` (
  `id` bigint UNSIGNED NOT NULL,
  `slider_id` bigint UNSIGNED DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_button` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider_details`
--

INSERT INTO `slider_details` (`id`, `slider_id`, `image`, `title`, `sub_title`, `url`, `has_button`, `button_name`, `button_type`, `sorting`, `description`, `status`, `created_at`, `updated_at`) VALUES
(8, 6, '{\"200x200\":\"upload\\/slider\\/home-page-slider\\/200x200\\/aec5fc1a-2af9-4b1f-a124-195c4a54c07d.avif\",\"1280x1920\":\"upload\\/slider\\/home-page-slider\\/1280x1920\\/0fa400f8-0589-4b82-a1dc-ca46f57c9474.avif\",\"original\":\"upload\\/slider\\/home-page-slider\\/original\\/1ed5c9cb-d2ca-4d93-8b0a-952115bd2e4e.avif\"}', 'Welcome to Our Website', 'We are team of talented designers making websites with Bootstrap', 'https://www.youtube.com/watch?v=LolUVl3nSu4&list=RDLolUVl3nSu4&start_radio=1', 'No', NULL, NULL, 1, NULL, 'active', '2025-07-25 22:21:04', '2025-07-25 22:21:04');

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
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `title`, `slug`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(19, 'New Theme', 'new-theme', 0, 'deactive', '2025-03-25 03:46:51', '2025-03-25 03:47:02'),
(20, 'New Theme', 'new-theme', 0, 'deactive', '2025-03-25 03:47:02', '2025-03-25 03:47:31'),
(21, 'New Theme', 'new-theme', 0, 'deactive', '2025-03-25 03:47:31', '2025-03-25 03:48:35'),
(22, 'New Theme', 'new-theme', 0, 'deactive', '2025-03-25 03:48:35', '2025-03-25 03:49:23'),
(23, 'New Theme', 'new-theme', 0, 'deactive', '2025-03-25 03:49:23', '2025-03-25 03:50:02'),
(24, 'New Theme', 'new-theme', 0, 'deactive', '2025-03-25 03:50:02', '2025-03-25 03:52:01'),
(27, 'Ibcs', 'ibcs', 0, 'deactive', '2025-07-13 09:20:46', '2025-07-13 09:29:34');

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

--
-- Dumping data for table `user_login_histories`
--

INSERT INTO `user_login_histories` (`id`, `user_id`, `user_guard`, `login_at`, `login_ip`, `login_browser_client`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'admin', '2024-07-02 10:21:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-07-02 04:21:30', '2024-07-02 04:21:30'),
(2, 1, 'admin', '2024-07-02 10:25:10', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-07-02 04:25:10', '2024-07-02 04:25:10'),
(3, 2, 'admin', '2024-07-02 11:09:20', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-07-02 05:09:20', '2024-07-02 05:09:20'),
(4, 1, 'admin', '2024-07-03 04:52:45', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-07-02 22:52:45', '2024-07-02 22:52:45'),
(5, 1, 'admin', '2024-07-07 05:08:59', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-07-06 23:08:59', '2024-07-06 23:08:59'),
(6, 1, 'admin', '2024-07-11 05:47:21', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-07-10 23:47:21', '2024-07-10 23:47:21'),
(7, 1, 'admin', '2024-07-15 06:23:46', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-07-15 00:23:46', '2024-07-15 00:23:46'),
(8, 1, 'admin', '2024-07-15 09:18:21', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-07-15 03:18:21', '2024-07-15 03:18:21'),
(9, 2, 'admin', '2024-07-27 10:09:21', '104.28.208.84', 'Google Chrome', 0, 'active', '2024-07-27 04:09:21', '2024-07-27 04:09:21'),
(10, 1, 'admin', '2024-07-28 05:34:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-07-27 23:34:28', '2024-07-27 23:34:28'),
(11, 2, 'admin', '2024-07-28 09:10:02', '104.28.208.85', 'Google Chrome', 0, 'active', '2024-07-28 03:10:02', '2024-07-28 03:10:02'),
(12, 1, 'admin', '2024-07-28 09:10:56', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-07-28 03:10:56', '2024-07-28 03:10:56'),
(13, 1, 'admin', '2024-07-28 09:16:48', '84.239.10.130', 'Mozilla Firefox', 0, 'active', '2024-07-28 03:16:48', '2024-07-28 03:16:48'),
(14, 1, 'admin', '2024-07-28 09:22:04', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-07-28 03:22:05', '2024-07-28 03:22:05'),
(15, 1, 'admin', '2024-07-29 03:11:23', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-07-28 21:11:23', '2024-07-28 21:11:23'),
(16, 1, 'admin', '2024-07-29 06:39:48', '84.239.10.135', 'Google Chrome', 0, 'active', '2024-07-29 00:39:48', '2024-07-29 00:39:48'),
(17, 1, 'admin', '2024-07-29 07:05:28', '84.239.10.135', 'Google Chrome', 0, 'active', '2024-07-29 01:05:28', '2024-07-29 01:05:28'),
(18, 1, 'admin', '2024-07-31 07:14:21', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-07-31 01:14:21', '2024-07-31 01:14:21'),
(19, 1, 'admin', '2024-07-31 10:33:41', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-07-31 04:33:41', '2024-07-31 04:33:41'),
(20, 1, 'admin', '2024-07-31 13:42:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-07-31 07:42:20', '2024-07-31 07:42:20'),
(21, 1, 'admin', '2024-08-03 04:16:14', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-02 22:16:14', '2024-08-02 22:16:14'),
(22, 1, 'admin', '2024-08-03 05:05:45', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-02 23:05:45', '2024-08-02 23:05:45'),
(23, 1, 'admin', '2024-08-03 06:40:41', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-03 00:40:41', '2024-08-03 00:40:41'),
(24, 1, 'admin', '2024-08-03 07:18:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-03 01:18:22', '2024-08-03 01:18:22'),
(25, 1, 'admin', '2024-08-03 10:50:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-03 04:50:01', '2024-08-03 04:50:01'),
(26, 1, 'admin', '2024-08-03 11:07:48', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-03 05:07:48', '2024-08-03 05:07:48'),
(27, 1, 'admin', '2024-08-03 11:18:18', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-03 05:18:18', '2024-08-03 05:18:18'),
(28, 1, 'admin', '2024-08-03 16:57:50', '103.168.207.22', 'Mozilla Firefox', 0, 'active', '2024-08-03 10:57:50', '2024-08-03 10:57:50'),
(29, 1, 'admin', '2024-08-04 05:21:30', '103.168.207.22', 'Mozilla Firefox', 0, 'active', '2024-08-03 23:21:30', '2024-08-03 23:21:30'),
(30, 1, 'admin', '2024-08-04 05:35:48', '103.40.156.9', 'Google Chrome', 0, 'active', '2024-08-03 23:35:48', '2024-08-03 23:35:48'),
(31, 1, 'admin', '2024-08-05 03:17:30', '103.205.134.226', 'Google Chrome', 0, 'active', '2024-08-04 21:17:30', '2024-08-04 21:17:30'),
(32, 1, 'admin', '2024-08-06 09:17:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-06 03:17:20', '2024-08-06 03:17:20'),
(33, 1, 'admin', '2024-08-06 09:18:14', '103.168.207.22', 'Mozilla Firefox', 0, 'active', '2024-08-06 03:18:14', '2024-08-06 03:18:14'),
(34, 1, 'admin', '2024-08-07 11:19:45', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-07 05:19:45', '2024-08-07 05:19:45'),
(35, 1, 'admin', '2024-08-07 11:47:31', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-07 05:47:31', '2024-08-07 05:47:31'),
(36, 1, 'admin', '2024-08-08 05:38:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-07 23:38:17', '2024-08-07 23:38:17'),
(37, 1, 'admin', '2024-08-08 06:29:39', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-08 00:29:39', '2024-08-08 00:29:39'),
(38, 1, 'admin', '2024-08-08 12:19:40', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-08 06:19:40', '2024-08-08 06:19:40'),
(39, 1, 'admin', '2024-08-10 03:57:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-09 21:57:02', '2024-08-09 21:57:02'),
(40, 1, 'admin', '2024-08-10 04:00:11', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-09 22:00:11', '2024-08-09 22:00:11'),
(41, 1, 'admin', '2024-08-11 03:29:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-10 21:29:03', '2024-08-10 21:29:03'),
(42, 1, 'admin', '2024-08-11 03:48:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-10 21:48:05', '2024-08-10 21:48:05'),
(43, 1, 'admin', '2024-08-11 05:15:45', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-10 23:15:45', '2024-08-10 23:15:45'),
(44, 1, 'admin', '2024-08-11 10:48:44', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-11 04:48:44', '2024-08-11 04:48:44'),
(45, 1, 'admin', '2024-08-12 04:25:04', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-11 22:25:04', '2024-08-11 22:25:04'),
(46, 1, 'admin', '2024-08-12 10:36:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-12 04:36:46', '2024-08-12 04:36:46'),
(47, 1, 'admin', '2024-08-13 07:00:29', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-13 01:00:29', '2024-08-13 01:00:29'),
(48, 1, 'admin', '2024-08-13 11:16:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-13 05:16:14', '2024-08-13 05:16:14'),
(49, 1, 'admin', '2024-08-14 04:50:51', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-13 22:50:51', '2024-08-13 22:50:51'),
(50, 1, 'admin', '2024-08-14 05:05:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-13 23:05:37', '2024-08-13 23:05:37'),
(51, 1, 'admin', '2024-08-14 05:35:11', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-13 23:35:11', '2024-08-13 23:35:11'),
(52, 1, 'admin', '2024-08-14 05:39:23', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-13 23:39:23', '2024-08-13 23:39:23'),
(53, 1, 'admin', '2024-08-14 09:27:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-14 03:27:25', '2024-08-14 03:27:25'),
(54, 1, 'admin', '2024-08-14 09:53:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-14 03:53:42', '2024-08-14 03:53:42'),
(55, 1, 'admin', '2024-08-15 03:05:22', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-14 21:05:22', '2024-08-14 21:05:22'),
(56, 1, 'admin', '2024-08-15 06:39:24', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-15 00:39:24', '2024-08-15 00:39:24'),
(57, 1, 'admin', '2024-08-15 08:51:52', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-15 02:51:52', '2024-08-15 02:51:52'),
(58, 1, 'admin', '2024-08-15 12:29:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-15 06:29:30', '2024-08-15 06:29:30'),
(59, 1, 'admin', '2024-08-15 12:33:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-15 06:33:02', '2024-08-15 06:33:02'),
(60, 1, 'admin', '2024-08-15 12:42:12', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-15 06:42:12', '2024-08-15 06:42:12'),
(61, 1, 'admin', '2024-08-18 04:12:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-17 22:12:30', '2024-08-17 22:12:30'),
(62, 1, 'admin', '2024-08-18 06:29:12', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-18 00:29:12', '2024-08-18 00:29:12'),
(63, 1, 'admin', '2024-08-19 04:02:33', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-18 22:02:33', '2024-08-18 22:02:33'),
(64, 1, 'admin', '2024-08-19 04:06:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-18 22:06:46', '2024-08-18 22:06:46'),
(65, 1, 'admin', '2024-08-19 09:12:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-19 03:12:46', '2024-08-19 03:12:46'),
(66, 1, 'admin', '2024-08-19 10:31:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-19 04:31:28', '2024-08-19 04:31:28'),
(67, 2, 'admin', '2024-08-19 10:50:43', '103.210.58.113', 'Mozilla Firefox', 0, 'active', '2024-08-19 04:50:43', '2024-08-19 04:50:43'),
(68, 2, 'admin', '2024-08-19 11:12:27', '103.210.58.113', 'Mozilla Firefox', 0, 'active', '2024-08-19 05:12:27', '2024-08-19 05:12:27'),
(69, 1, 'admin', '2024-08-19 11:14:55', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-19 05:14:55', '2024-08-19 05:14:55'),
(70, 1, 'admin', '2024-08-19 12:07:04', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-19 06:07:04', '2024-08-19 06:07:04'),
(71, 1, 'admin', '2024-08-19 12:33:43', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-19 06:33:43', '2024-08-19 06:33:43'),
(72, 2, 'admin', '2024-08-20 05:33:50', '103.210.58.112', 'Mozilla Firefox', 0, 'active', '2024-08-19 23:33:50', '2024-08-19 23:33:50'),
(73, 1, 'admin', '2024-08-20 06:59:41', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-20 00:59:41', '2024-08-20 00:59:41'),
(74, 1, 'admin', '2024-08-20 11:20:31', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-20 05:20:31', '2024-08-20 05:20:31'),
(75, 1, 'admin', '2024-08-21 11:33:53', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-21 05:33:53', '2024-08-21 05:33:53'),
(76, 1, 'admin', '2024-08-22 03:38:35', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-21 21:38:35', '2024-08-21 21:38:35'),
(77, 1, 'admin', '2024-08-22 03:38:35', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-21 21:38:35', '2024-08-21 21:38:35'),
(78, 1, 'admin', '2024-08-22 03:56:10', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-21 21:56:10', '2024-08-21 21:56:10'),
(79, 1, 'admin', '2024-08-22 06:53:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-22 00:53:10', '2024-08-22 00:53:10'),
(80, 1, 'admin', '2024-08-22 11:41:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-22 05:41:26', '2024-08-22 05:41:26'),
(81, 1, 'admin', '2024-08-22 11:42:19', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-22 05:42:19', '2024-08-22 05:42:19'),
(82, 1, 'admin', '2024-08-25 08:55:26', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-25 02:55:26', '2024-08-25 02:55:26'),
(83, 1, 'admin', '2024-08-26 05:22:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-25 23:22:02', '2024-08-25 23:22:02'),
(84, 1, 'admin', '2024-08-26 11:34:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-26 05:34:26', '2024-08-26 05:34:26'),
(85, 1, 'admin', '2024-08-26 11:36:52', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-26 05:36:52', '2024-08-26 05:36:52'),
(86, 1, 'admin', '2024-08-26 12:06:47', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-26 06:06:47', '2024-08-26 06:06:47'),
(87, 1, 'admin', '2024-08-27 03:59:38', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-26 21:59:38', '2024-08-26 21:59:38'),
(88, 1, 'admin', '2024-08-27 04:16:47', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-26 22:16:47', '2024-08-26 22:16:47'),
(89, 1, 'admin', '2024-08-27 10:14:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-27 04:14:42', '2024-08-27 04:14:42'),
(90, 1, 'admin', '2024-08-27 12:49:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-27 06:49:02', '2024-08-27 06:49:02'),
(91, 1, 'admin', '2024-08-28 03:09:26', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-27 21:09:26', '2024-08-27 21:09:26'),
(92, 1, 'admin', '2024-08-28 03:16:13', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-27 21:16:13', '2024-08-27 21:16:13'),
(93, 1, 'admin', '2024-08-28 04:26:07', '103.210.58.114', 'Google Chrome', 0, 'active', '2024-08-27 22:26:07', '2024-08-27 22:26:07'),
(94, 1, 'admin', '2024-08-28 05:58:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-27 23:58:01', '2024-08-27 23:58:01'),
(95, 1, 'admin', '2024-08-28 06:06:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-28 00:06:30', '2024-08-28 00:06:30'),
(96, 1, 'admin', '2024-08-28 08:41:41', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-28 02:41:41', '2024-08-28 02:41:41'),
(97, 1, 'admin', '2024-08-28 09:53:13', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-28 03:53:13', '2024-08-28 03:53:13'),
(98, 1, 'admin', '2024-08-28 09:58:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-28 03:58:46', '2024-08-28 03:58:46'),
(99, 1, 'admin', '2024-08-28 11:28:11', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-28 05:28:11', '2024-08-28 05:28:11'),
(100, 1, 'admin', '2024-08-28 11:39:29', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-28 05:39:29', '2024-08-28 05:39:29'),
(101, 1, 'admin', '2024-08-28 12:10:18', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-28 06:10:18', '2024-08-28 06:10:18'),
(102, 1, 'admin', '2024-08-29 05:46:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-28 23:46:02', '2024-08-28 23:46:02'),
(103, 1, 'admin', '2024-08-29 10:17:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-29 04:17:37', '2024-08-29 04:17:37'),
(104, 1, 'admin', '2024-08-29 10:19:12', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-29 04:19:12', '2024-08-29 04:19:12'),
(105, 1, 'admin', '2024-08-29 10:20:24', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-29 04:20:24', '2024-08-29 04:20:24'),
(106, 1, 'admin', '2024-08-29 11:21:28', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-29 05:21:28', '2024-08-29 05:21:28'),
(107, 1, 'admin', '2024-08-29 11:26:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-29 05:26:01', '2024-08-29 05:26:01'),
(108, 1, 'admin', '2024-08-29 11:27:30', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-29 05:27:30', '2024-08-29 05:27:30'),
(109, 1, 'admin', '2024-08-29 11:28:14', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-29 05:28:14', '2024-08-29 05:28:14'),
(110, 1, 'admin', '2024-08-29 11:28:39', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-29 05:28:39', '2024-08-29 05:28:39'),
(111, 1, 'admin', '2024-08-31 03:18:02', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-30 21:18:02', '2024-08-30 21:18:02'),
(112, 1, 'admin', '2024-08-31 03:26:10', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-30 21:26:10', '2024-08-30 21:26:10'),
(113, 1, 'admin', '2024-08-31 03:37:26', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-30 21:37:26', '2024-08-30 21:37:26'),
(114, 1, 'admin', '2024-08-31 05:28:06', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-30 23:28:06', '2024-08-30 23:28:06'),
(115, 1, 'admin', '2024-08-31 06:45:52', '103.210.58.114', 'Google Chrome', 0, 'active', '2024-08-31 00:45:52', '2024-08-31 00:45:52'),
(116, 1, 'admin', '2024-08-31 08:05:36', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-31 02:05:36', '2024-08-31 02:05:36'),
(117, 1, 'admin', '2024-09-01 04:38:04', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-08-31 22:38:04', '2024-08-31 22:38:04'),
(118, 1, 'admin', '2024-09-01 04:45:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-31 22:45:22', '2024-08-31 22:45:22'),
(119, 1, 'admin', '2024-09-01 05:46:31', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-08-31 23:46:31', '2024-08-31 23:46:31'),
(120, 1, 'admin', '2024-09-01 06:39:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-01 00:39:27', '2024-09-01 00:39:27'),
(121, 1, 'admin', '2024-09-01 08:51:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-01 02:51:05', '2024-09-01 02:51:05'),
(122, 1, 'admin', '2024-09-02 05:45:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-01 23:45:09', '2024-09-01 23:45:09'),
(123, 1, 'admin', '2024-09-02 05:46:38', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-01 23:46:38', '2024-09-01 23:46:38'),
(124, 1, 'admin', '2024-09-02 09:49:16', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-02 03:49:16', '2024-09-02 03:49:16'),
(125, 1, 'admin', '2024-09-02 10:01:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-02 04:01:02', '2024-09-02 04:01:02'),
(126, 1, 'admin', '2024-09-02 10:01:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-02 04:01:17', '2024-09-02 04:01:17'),
(127, 1, 'admin', '2024-09-02 10:02:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-02 04:02:09', '2024-09-02 04:02:09'),
(128, 1, 'admin', '2024-09-02 12:22:10', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-02 06:22:10', '2024-09-02 06:22:10'),
(129, 1, 'admin', '2024-09-02 12:26:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-02 06:26:25', '2024-09-02 06:26:25'),
(130, 1, 'admin', '2024-09-03 05:15:44', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-02 23:15:44', '2024-09-02 23:15:44'),
(131, 1, 'admin', '2024-09-03 05:29:00', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-02 23:29:00', '2024-09-02 23:29:00'),
(132, 1, 'admin', '2024-09-03 05:32:29', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-02 23:32:29', '2024-09-02 23:32:29'),
(133, 1, 'admin', '2024-09-03 12:57:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-03 06:57:10', '2024-09-03 06:57:10'),
(134, 1, 'admin', '2024-09-03 12:57:32', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-03 06:57:32', '2024-09-03 06:57:32'),
(135, 1, 'admin', '2024-09-03 12:57:43', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-03 06:57:43', '2024-09-03 06:57:43'),
(136, 1, 'admin', '2024-09-03 13:13:51', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-03 07:13:51', '2024-09-03 07:13:51'),
(137, 1, 'admin', '2024-09-04 03:51:27', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-03 21:51:27', '2024-09-03 21:51:27'),
(138, 1, 'admin', '2024-09-04 03:51:32', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-03 21:51:32', '2024-09-03 21:51:32'),
(139, 1, 'admin', '2024-09-04 04:17:04', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-03 22:17:04', '2024-09-03 22:17:04'),
(140, 1, 'admin', '2024-09-04 04:19:54', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-03 22:19:54', '2024-09-03 22:19:54'),
(141, 1, 'admin', '2024-09-04 06:36:50', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-04 00:36:50', '2024-09-04 00:36:50'),
(142, 1, 'admin', '2024-09-04 06:51:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-04 00:51:20', '2024-09-04 00:51:20'),
(143, 1, 'admin', '2024-09-04 08:50:47', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-04 02:50:47', '2024-09-04 02:50:47'),
(144, 1, 'admin', '2024-09-05 13:04:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-05 07:04:22', '2024-09-05 07:04:22'),
(145, 1, 'admin', '2024-09-05 13:26:55', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-05 07:26:55', '2024-09-05 07:26:55'),
(146, 1, 'admin', '2024-09-08 03:32:02', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-07 21:32:02', '2024-09-07 21:32:02'),
(147, 1, 'admin', '2024-09-08 04:25:08', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-07 22:25:08', '2024-09-07 22:25:08'),
(148, 1, 'admin', '2024-09-08 12:35:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-08 06:35:02', '2024-09-08 06:35:02'),
(149, 1, 'admin', '2024-09-08 13:03:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-08 07:03:09', '2024-09-08 07:03:09'),
(150, 1, 'admin', '2024-09-08 13:03:12', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-08 07:03:12', '2024-09-08 07:03:12'),
(151, 1, 'admin', '2024-09-09 04:31:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-08 22:31:25', '2024-09-08 22:31:25'),
(152, 1, 'admin', '2024-09-09 05:34:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-08 23:34:42', '2024-09-08 23:34:42'),
(153, 1, 'admin', '2024-09-09 05:47:45', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-08 23:47:45', '2024-09-08 23:47:45'),
(154, 1, 'admin', '2024-09-09 12:40:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-09 06:40:07', '2024-09-09 06:40:07'),
(155, 1, 'admin', '2024-09-09 12:42:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-09 06:42:03', '2024-09-09 06:42:03'),
(156, 1, 'admin', '2024-09-10 05:38:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-09 23:38:57', '2024-09-09 23:38:57'),
(157, 1, 'admin', '2024-09-10 05:53:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-09 23:53:16', '2024-09-09 23:53:16'),
(158, 1, 'admin', '2024-09-10 06:00:53', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-10 00:00:53', '2024-09-10 00:00:53'),
(159, 1, 'admin', '2024-09-10 06:25:25', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-10 00:25:25', '2024-09-10 00:25:25'),
(160, 1, 'admin', '2024-09-10 06:32:22', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-10 00:32:22', '2024-09-10 00:32:22'),
(161, 1, 'admin', '2024-09-10 06:52:27', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-10 00:52:27', '2024-09-10 00:52:27'),
(162, 1, 'admin', '2024-09-10 06:57:29', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-10 00:57:29', '2024-09-10 00:57:29'),
(163, 1, 'admin', '2024-09-10 09:02:49', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-10 03:02:49', '2024-09-10 03:02:49'),
(164, 1, 'admin', '2024-09-10 11:53:18', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-10 05:53:18', '2024-09-10 05:53:18'),
(165, 1, 'admin', '2024-09-10 12:49:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-10 06:49:42', '2024-09-10 06:49:42'),
(166, 1, 'admin', '2024-09-10 12:55:05', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-10 06:55:05', '2024-09-10 06:55:05'),
(167, 1, 'admin', '2024-09-11 04:23:20', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-10 22:23:20', '2024-09-10 22:23:20'),
(168, 1, 'admin', '2024-09-11 04:32:48', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-10 22:32:48', '2024-09-10 22:32:48'),
(169, 1, 'admin', '2024-09-11 06:53:23', '103.210.58.114', 'Google Chrome', 0, 'active', '2024-09-11 00:53:23', '2024-09-11 00:53:23'),
(170, 1, 'admin', '2024-09-11 07:12:53', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-11 01:12:53', '2024-09-11 01:12:53'),
(171, 1, 'admin', '2024-09-11 07:14:21', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-11 01:14:21', '2024-09-11 01:14:21'),
(172, 1, 'admin', '2024-09-11 07:17:11', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-11 01:17:11', '2024-09-11 01:17:11'),
(173, 1, 'admin', '2024-09-11 07:36:49', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-11 01:36:49', '2024-09-11 01:36:49'),
(174, 1, 'admin', '2024-09-11 08:47:15', '103.210.58.114', 'Mozilla Firefox', 0, 'active', '2024-09-11 02:47:15', '2024-09-11 02:47:15'),
(175, 1, 'admin', '2024-09-11 10:36:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-11 04:36:17', '2024-09-11 04:36:17'),
(176, 1, 'admin', '2024-09-11 12:56:38', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-11 06:56:38', '2024-09-11 06:56:38'),
(177, 1, 'admin', '2024-09-12 03:31:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-11 21:31:03', '2024-09-11 21:31:03'),
(178, 1, 'admin', '2024-09-12 04:54:12', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-11 22:54:12', '2024-09-11 22:54:12'),
(179, 1, 'admin', '2024-09-12 04:54:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-11 22:54:28', '2024-09-11 22:54:28'),
(180, 1, 'admin', '2024-09-12 05:02:47', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-11 23:02:47', '2024-09-11 23:02:47'),
(181, 1, 'admin', '2024-09-12 05:14:12', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-11 23:14:12', '2024-09-11 23:14:12'),
(182, 1, 'admin', '2024-09-12 06:08:31', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-12 00:08:31', '2024-09-12 00:08:31'),
(183, 1, 'admin', '2024-09-12 08:53:15', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-12 02:53:15', '2024-09-12 02:53:15'),
(184, 1, 'admin', '2024-09-12 10:14:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-12 04:14:07', '2024-09-12 04:14:07'),
(185, 1, 'admin', '2024-09-12 10:15:22', '103.210.58.114', 'Google Chrome', 0, 'active', '2024-09-12 04:15:22', '2024-09-12 04:15:22'),
(186, 1, 'admin', '2024-09-12 10:26:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-12 04:26:07', '2024-09-12 04:26:07'),
(187, 1, 'admin', '2024-09-12 11:08:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-12 05:08:17', '2024-09-12 05:08:17'),
(188, 1, 'admin', '2024-09-12 11:08:35', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-12 05:08:35', '2024-09-12 05:08:35'),
(189, 1, 'admin', '2024-09-12 12:27:40', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-12 06:27:40', '2024-09-12 06:27:40'),
(190, 1, 'admin', '2024-09-15 06:34:13', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-15 00:34:13', '2024-09-15 00:34:13'),
(191, 1, 'admin', '2024-09-15 06:37:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-15 00:37:02', '2024-09-15 00:37:02'),
(192, 1, 'admin', '2024-09-15 06:37:19', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-15 00:37:19', '2024-09-15 00:37:19'),
(193, 1, 'admin', '2024-09-15 08:14:50', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-15 02:14:50', '2024-09-15 02:14:50'),
(194, 8, 'admin', '2024-09-15 08:16:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-15 02:16:46', '2024-09-15 02:16:46'),
(195, 1, 'admin', '2024-09-15 08:33:27', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-15 02:33:27', '2024-09-15 02:33:27'),
(196, 1, 'admin', '2024-09-15 08:47:51', '103.210.58.114', 'Google Chrome', 0, 'active', '2024-09-15 02:47:51', '2024-09-15 02:47:51'),
(197, 1, 'admin', '2024-09-15 08:48:23', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-15 02:48:23', '2024-09-15 02:48:23'),
(198, 1, 'admin', '2024-09-15 09:00:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-15 03:00:25', '2024-09-15 03:00:25'),
(199, 1, 'admin', '2024-09-15 09:29:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-15 03:29:37', '2024-09-15 03:29:37'),
(200, 1, 'admin', '2024-09-15 11:08:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-15 05:08:03', '2024-09-15 05:08:03'),
(201, 1, 'admin', '2024-09-15 12:08:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-15 06:08:37', '2024-09-15 06:08:37'),
(202, 1, 'admin', '2024-09-15 12:34:03', '103.210.58.114', 'Google Chrome', 0, 'active', '2024-09-15 06:34:03', '2024-09-15 06:34:03'),
(203, 1, 'admin', '2024-09-15 12:56:50', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-15 06:56:50', '2024-09-15 06:56:50'),
(204, 1, 'admin', '2024-09-15 12:59:34', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-15 06:59:34', '2024-09-15 06:59:34'),
(205, 1, 'admin', '2024-09-16 08:41:08', '103.170.141.11', 'Google Chrome', 0, 'active', '2024-09-16 02:41:08', '2024-09-16 02:41:08'),
(206, 1, 'admin', '2024-09-17 04:22:41', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-16 22:22:41', '2024-09-16 22:22:41'),
(207, 1, 'admin', '2024-09-17 04:39:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-16 22:39:14', '2024-09-16 22:39:14'),
(208, 1, 'admin', '2024-09-17 06:25:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-17 00:25:01', '2024-09-17 00:25:01'),
(209, 1, 'admin', '2024-09-17 06:49:04', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-17 00:49:04', '2024-09-17 00:49:04'),
(210, 1, 'admin', '2024-09-17 08:39:25', '103.210.58.114', 'Google Chrome', 0, 'active', '2024-09-17 02:39:25', '2024-09-17 02:39:25'),
(211, 1, 'admin', '2024-09-17 10:51:47', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-17 04:51:47', '2024-09-17 04:51:47'),
(212, 1, 'admin', '2024-09-17 11:01:59', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-17 05:01:59', '2024-09-17 05:01:59'),
(213, 1, 'admin', '2024-09-17 12:04:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-17 06:04:02', '2024-09-17 06:04:02'),
(214, 1, 'admin', '2024-09-17 13:25:15', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-17 07:25:15', '2024-09-17 07:25:15'),
(215, 1, 'admin', '2024-09-17 16:01:48', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-17 10:01:48', '2024-09-17 10:01:48'),
(216, 1, 'admin', '2024-09-18 03:35:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-17 21:35:17', '2024-09-17 21:35:17'),
(217, 1, 'admin', '2024-09-18 03:50:03', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-17 21:50:03', '2024-09-17 21:50:03'),
(218, 1, 'admin', '2024-09-18 06:44:45', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 00:44:45', '2024-09-18 00:44:45'),
(219, 1, 'admin', '2024-09-18 08:56:44', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 02:56:44', '2024-09-18 02:56:44'),
(220, 1, 'admin', '2024-09-18 10:03:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 04:03:27', '2024-09-18 04:03:27'),
(221, 1, 'admin', '2024-09-18 10:40:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 04:40:46', '2024-09-18 04:40:46'),
(222, 1, 'admin', '2024-09-18 10:40:56', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 04:40:56', '2024-09-18 04:40:56'),
(223, 1, 'admin', '2024-09-18 11:40:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 05:40:14', '2024-09-18 05:40:14'),
(224, 1, 'admin', '2024-09-18 12:31:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 06:31:03', '2024-09-18 06:31:03'),
(225, 1, 'admin', '2024-09-18 13:00:39', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-18 07:00:39', '2024-09-18 07:00:39'),
(226, 1, 'admin', '2024-09-18 13:01:00', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-18 07:01:00', '2024-09-18 07:01:00'),
(227, 1, 'admin', '2024-09-18 13:01:32', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-18 07:01:32', '2024-09-18 07:01:32'),
(228, 1, 'admin', '2024-09-18 13:43:52', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 07:43:52', '2024-09-18 07:43:52'),
(229, 1, 'admin', '2024-09-19 03:25:24', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 21:25:24', '2024-09-18 21:25:24'),
(230, 1, 'admin', '2024-09-19 03:36:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 21:36:20', '2024-09-18 21:36:20'),
(231, 1, 'admin', '2024-09-19 03:55:38', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 21:55:38', '2024-09-18 21:55:38'),
(232, 1, 'admin', '2024-09-19 04:16:53', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-18 22:16:53', '2024-09-18 22:16:53'),
(233, 1, 'admin', '2024-09-19 04:40:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 22:40:27', '2024-09-18 22:40:27'),
(234, 1, 'admin', '2024-09-19 04:50:44', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 22:50:44', '2024-09-18 22:50:44'),
(235, 1, 'admin', '2024-09-19 04:58:45', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-18 22:58:45', '2024-09-18 22:58:45'),
(236, 1, 'admin', '2024-09-19 05:50:03', '103.210.58.115', 'Google Chrome', 0, 'active', '2024-09-18 23:50:03', '2024-09-18 23:50:03'),
(237, 1, 'admin', '2024-09-19 09:45:21', '103.210.58.115', 'Google Chrome', 0, 'active', '2024-09-19 03:45:21', '2024-09-19 03:45:21'),
(238, 1, 'admin', '2024-09-19 10:23:23', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-19 04:23:23', '2024-09-19 04:23:23'),
(239, 1, 'admin', '2024-09-19 11:40:59', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-19 05:40:59', '2024-09-19 05:40:59'),
(240, 1, 'admin', '2024-09-19 12:06:13', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-19 06:06:13', '2024-09-19 06:06:13'),
(241, 1, 'admin', '2024-09-19 12:59:36', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-19 06:59:36', '2024-09-19 06:59:36'),
(242, 1, 'admin', '2024-09-19 13:04:12', '103.210.58.115', 'Google Chrome', 0, 'active', '2024-09-19 07:04:12', '2024-09-19 07:04:12'),
(243, 1, 'admin', '2024-09-22 03:27:43', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-21 21:27:43', '2024-09-21 21:27:43'),
(244, 1, 'admin', '2024-09-22 05:33:45', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-21 23:33:45', '2024-09-21 23:33:45'),
(245, 1, 'admin', '2024-09-22 05:52:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-21 23:52:57', '2024-09-21 23:52:57'),
(246, 1, 'admin', '2024-09-22 06:21:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-22 00:21:09', '2024-09-22 00:21:09'),
(247, 1, 'admin', '2024-09-22 06:42:59', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-22 00:42:59', '2024-09-22 00:42:59'),
(248, 1, 'admin', '2024-09-22 07:02:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-22 01:02:09', '2024-09-22 01:02:09'),
(249, 1, 'admin', '2024-09-22 08:37:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-22 02:37:25', '2024-09-22 02:37:25'),
(250, 1, 'admin', '2024-09-22 08:40:31', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-22 02:40:31', '2024-09-22 02:40:31'),
(251, 1, 'admin', '2024-09-22 11:12:13', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-22 05:12:13', '2024-09-22 05:12:13'),
(252, 1, 'admin', '2024-09-22 11:35:18', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-22 05:35:18', '2024-09-22 05:35:18'),
(253, 1, 'admin', '2024-09-22 11:47:29', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-22 05:47:29', '2024-09-22 05:47:29'),
(254, 1, 'admin', '2024-09-23 03:56:50', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-22 21:56:50', '2024-09-22 21:56:50'),
(255, 1, 'admin', '2024-09-23 03:59:04', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-22 21:59:04', '2024-09-22 21:59:04'),
(256, 1, 'admin', '2024-09-23 05:02:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-22 23:02:25', '2024-09-22 23:02:25'),
(257, 1, 'admin', '2024-09-23 10:47:04', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-23 04:47:04', '2024-09-23 04:47:04'),
(258, 1, 'admin', '2024-09-23 12:35:57', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-23 06:35:57', '2024-09-23 06:35:57'),
(259, 1, 'admin', '2024-09-23 12:36:21', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-23 06:36:21', '2024-09-23 06:36:21'),
(260, 1, 'admin', '2024-09-23 12:38:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-23 06:38:37', '2024-09-23 06:38:37'),
(261, 1, 'admin', '2024-09-24 03:24:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-23 21:24:26', '2024-09-23 21:24:26'),
(262, 1, 'admin', '2024-09-24 03:45:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-23 21:45:20', '2024-09-23 21:45:20'),
(263, 1, 'admin', '2024-09-24 05:43:24', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-23 23:43:24', '2024-09-23 23:43:24'),
(264, 1, 'admin', '2024-09-24 07:16:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-24 01:16:37', '2024-09-24 01:16:37'),
(265, 1, 'admin', '2024-09-24 09:32:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-24 03:32:25', '2024-09-24 03:32:25'),
(266, 1, 'admin', '2024-09-24 09:34:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-24 03:34:28', '2024-09-24 03:34:28'),
(267, 1, 'admin', '2024-09-24 09:45:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-24 03:45:02', '2024-09-24 03:45:02'),
(268, 1, 'admin', '2024-09-24 11:12:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-24 05:12:57', '2024-09-24 05:12:57'),
(269, 1, 'admin', '2024-09-24 11:51:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-24 05:51:02', '2024-09-24 05:51:02'),
(270, 1, 'admin', '2024-09-24 11:51:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-24 05:51:14', '2024-09-24 05:51:14'),
(271, 1, 'admin', '2024-09-24 11:51:44', '103.210.58.115', 'Google Chrome', 0, 'active', '2024-09-24 05:51:44', '2024-09-24 05:51:44'),
(272, 1, 'admin', '2024-09-24 11:52:45', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-24 05:52:45', '2024-09-24 05:52:45'),
(273, 1, 'admin', '2024-09-24 11:53:36', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-24 05:53:36', '2024-09-24 05:53:36'),
(274, 1, 'admin', '2024-09-25 03:51:39', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-24 21:51:39', '2024-09-24 21:51:39'),
(275, 1, 'admin', '2024-09-25 04:25:49', '103.210.58.115', 'Google Chrome', 0, 'active', '2024-09-24 22:25:49', '2024-09-24 22:25:49'),
(276, 1, 'admin', '2024-09-25 04:36:12', '103.210.58.115', 'Mozilla Firefox', 0, 'active', '2024-09-24 22:36:12', '2024-09-24 22:36:12'),
(277, 1, 'admin', '2024-09-25 05:31:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-24 23:31:42', '2024-09-24 23:31:42'),
(278, 1, 'admin', '2024-09-25 13:27:00', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-25 07:27:00', '2024-09-25 07:27:00'),
(279, 1, 'admin', '2024-09-26 05:23:56', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-25 23:23:56', '2024-09-25 23:23:56'),
(280, 1, 'admin', '2024-09-26 05:25:48', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-25 23:25:48', '2024-09-25 23:25:48'),
(281, 1, 'admin', '2024-09-26 09:21:52', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-26 03:21:52', '2024-09-26 03:21:52'),
(282, 1, 'admin', '2024-09-26 10:52:21', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-26 04:52:21', '2024-09-26 04:52:21'),
(283, 1, 'admin', '2024-09-26 11:23:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-26 05:23:28', '2024-09-26 05:23:28'),
(284, 1, 'admin', '2024-09-26 12:16:27', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-26 06:16:27', '2024-09-26 06:16:27'),
(285, 1, 'admin', '2024-09-29 03:32:35', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-28 21:32:35', '2024-09-28 21:32:35'),
(286, 1, 'admin', '2024-09-29 08:22:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-29 02:22:37', '2024-09-29 02:22:37'),
(287, 1, 'admin', '2024-09-29 11:06:08', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-29 05:06:08', '2024-09-29 05:06:08'),
(288, 1, 'admin', '2024-09-29 11:28:38', '103.210.58.115', 'Mozilla Firefox', 0, 'active', '2024-09-29 05:28:38', '2024-09-29 05:28:38'),
(289, 1, 'admin', '2024-09-29 11:55:29', '103.210.58.115', 'Google Chrome', 0, 'active', '2024-09-29 05:55:29', '2024-09-29 05:55:29'),
(290, 1, 'admin', '2024-09-30 04:34:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-29 22:34:27', '2024-09-29 22:34:27'),
(291, 1, 'admin', '2024-09-30 04:41:23', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-29 22:41:23', '2024-09-29 22:41:23'),
(292, 1, 'admin', '2024-09-30 04:55:48', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-29 22:55:48', '2024-09-29 22:55:48'),
(293, 1, 'admin', '2024-09-30 10:21:54', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-30 04:21:54', '2024-09-30 04:21:54'),
(294, 1, 'admin', '2024-09-30 10:59:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-30 04:59:46', '2024-09-30 04:59:46'),
(295, 1, 'admin', '2024-09-30 11:35:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-30 05:35:57', '2024-09-30 05:35:57'),
(296, 1, 'admin', '2024-09-30 11:36:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-30 05:36:46', '2024-09-30 05:36:46'),
(297, 1, 'admin', '2024-09-30 12:15:30', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-30 06:15:30', '2024-09-30 06:15:30'),
(298, 1, 'admin', '2024-10-01 03:19:20', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-09-30 21:19:20', '2024-09-30 21:19:20'),
(299, 1, 'admin', '2024-10-01 03:24:19', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-30 21:24:19', '2024-09-30 21:24:19'),
(300, 1, 'admin', '2024-10-01 04:26:08', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-09-30 22:26:08', '2024-09-30 22:26:08'),
(301, 1, 'admin', '2024-10-01 06:22:48', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 00:22:48', '2024-10-01 00:22:48'),
(302, 1, 'admin', '2024-10-01 06:31:12', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-01 00:31:12', '2024-10-01 00:31:12'),
(303, 1, 'admin', '2024-10-01 06:40:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 00:40:22', '2024-10-01 00:40:22'),
(304, 1, 'admin', '2024-10-01 06:44:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 00:44:17', '2024-10-01 00:44:17'),
(305, 1, 'admin', '2024-10-01 07:07:13', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 01:07:13', '2024-10-01 01:07:13'),
(306, 1, 'admin', '2024-10-01 08:47:08', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 02:47:08', '2024-10-01 02:47:08'),
(307, 1, 'admin', '2024-10-01 09:00:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 03:00:03', '2024-10-01 03:00:03'),
(308, 1, 'admin', '2024-10-01 09:52:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 03:52:20', '2024-10-01 03:52:20'),
(309, 1, 'admin', '2024-10-01 10:08:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 04:08:20', '2024-10-01 04:08:20'),
(310, 1, 'admin', '2024-10-01 10:53:08', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-01 04:53:08', '2024-10-01 04:53:08'),
(311, 1, 'admin', '2024-10-01 12:52:54', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-01 06:52:54', '2024-10-01 06:52:54'),
(312, 1, 'admin', '2024-10-01 12:53:12', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-01 06:53:12', '2024-10-01 06:53:12'),
(313, 1, 'admin', '2024-10-01 12:53:42', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-01 06:53:42', '2024-10-01 06:53:42'),
(314, 1, 'admin', '2024-10-01 12:55:26', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-01 06:55:26', '2024-10-01 06:55:26'),
(315, 1, 'admin', '2024-10-01 13:00:16', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-01 07:00:16', '2024-10-01 07:00:16'),
(316, 1, 'admin', '2024-10-01 13:01:17', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-01 07:01:17', '2024-10-01 07:01:17'),
(317, 1, 'admin', '2024-10-01 19:21:50', '119.148.103.158', 'Google Chrome', 0, 'active', '2024-10-01 13:21:50', '2024-10-01 13:21:50'),
(318, 1, 'admin', '2024-10-02 03:09:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 21:09:17', '2024-10-01 21:09:17'),
(319, 1, 'admin', '2024-10-02 04:40:41', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-01 22:40:41', '2024-10-01 22:40:41'),
(320, 1, 'admin', '2024-10-02 04:45:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 22:45:14', '2024-10-01 22:45:14'),
(321, 1, 'admin', '2024-10-02 04:48:56', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-01 22:48:56', '2024-10-01 22:48:56'),
(322, 1, 'admin', '2024-10-02 04:49:32', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-01 22:49:32', '2024-10-01 22:49:32'),
(323, 1, 'admin', '2024-10-02 04:59:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 22:59:10', '2024-10-01 22:59:10'),
(324, 1, 'admin', '2024-10-02 05:00:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 23:00:14', '2024-10-01 23:00:14'),
(325, 1, 'admin', '2024-10-02 05:00:33', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 23:00:33', '2024-10-01 23:00:33'),
(326, 1, 'admin', '2024-10-02 05:05:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 23:05:07', '2024-10-01 23:05:07'),
(327, 1, 'admin', '2024-10-02 05:13:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-01 23:13:30', '2024-10-01 23:13:30'),
(328, 1, 'admin', '2024-10-02 07:06:29', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-02 01:06:29', '2024-10-02 01:06:29'),
(329, 1, 'admin', '2024-10-02 09:01:55', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-02 03:01:55', '2024-10-02 03:01:55'),
(330, 1, 'admin', '2024-10-02 09:02:25', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-02 03:02:25', '2024-10-02 03:02:25'),
(331, 1, 'admin', '2024-10-02 09:02:51', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-02 03:02:51', '2024-10-02 03:02:51'),
(332, 1, 'admin', '2024-10-02 10:26:24', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-02 04:26:24', '2024-10-02 04:26:24'),
(333, 1, 'admin', '2024-10-02 11:43:48', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-02 05:43:48', '2024-10-02 05:43:48'),
(334, 1, 'admin', '2024-10-02 11:50:25', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-02 05:50:25', '2024-10-02 05:50:25'),
(335, 1, 'admin', '2024-10-02 11:51:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-02 05:51:10', '2024-10-02 05:51:10'),
(336, 1, 'admin', '2024-10-02 11:51:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-02 05:51:46', '2024-10-02 05:51:46'),
(337, 1, 'admin', '2024-10-02 11:55:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-02 05:55:22', '2024-10-02 05:55:22'),
(338, 1, 'admin', '2024-10-02 12:14:36', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-02 06:14:36', '2024-10-02 06:14:36'),
(339, 1, 'admin', '2024-10-02 12:26:49', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-02 06:26:49', '2024-10-02 06:26:49'),
(340, 1, 'admin', '2024-10-02 12:27:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-02 06:27:07', '2024-10-02 06:27:07'),
(341, 1, 'admin', '2024-10-02 12:46:37', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-02 06:46:37', '2024-10-02 06:46:37'),
(342, 1, 'admin', '2024-10-03 03:33:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-02 21:33:01', '2024-10-02 21:33:01'),
(343, 1, 'admin', '2024-10-03 04:00:55', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-02 22:00:55', '2024-10-02 22:00:55'),
(344, 1, 'admin', '2024-10-03 05:24:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-02 23:24:46', '2024-10-02 23:24:46'),
(345, 1, 'admin', '2024-10-03 06:39:34', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-03 00:39:34', '2024-10-03 00:39:34'),
(346, 1, 'admin', '2024-10-03 07:33:24', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-03 01:33:24', '2024-10-03 01:33:24'),
(347, 1, 'admin', '2024-10-03 07:33:43', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-03 01:33:43', '2024-10-03 01:33:43'),
(348, 1, 'admin', '2024-10-03 07:37:15', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-03 01:37:15', '2024-10-03 01:37:15'),
(349, 1, 'admin', '2024-10-03 07:38:58', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-03 01:38:58', '2024-10-03 01:38:58'),
(350, 1, 'admin', '2024-10-03 08:15:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-03 02:15:28', '2024-10-03 02:15:28'),
(351, 1, 'admin', '2024-10-03 10:32:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-03 04:32:16', '2024-10-03 04:32:16'),
(352, 1, 'admin', '2024-10-03 10:47:44', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-03 04:47:44', '2024-10-03 04:47:44'),
(353, 1, 'admin', '2024-10-03 11:06:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-03 05:06:01', '2024-10-03 05:06:01'),
(354, 1, 'admin', '2024-10-03 12:48:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-03 06:48:57', '2024-10-03 06:48:57'),
(355, 1, 'admin', '2024-10-03 14:46:37', '103.210.58.112', 'Google Chrome', 0, 'active', '2024-10-03 08:46:37', '2024-10-03 08:46:37'),
(356, 1, 'admin', '2024-10-06 04:12:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-05 22:12:03', '2024-10-05 22:12:03'),
(357, 1, 'admin', '2024-10-06 04:52:48', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-05 22:52:48', '2024-10-05 22:52:48'),
(358, 1, 'admin', '2024-10-06 05:20:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-05 23:20:30', '2024-10-05 23:20:30'),
(359, 1, 'admin', '2024-10-06 08:37:49', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 02:37:49', '2024-10-06 02:37:49'),
(360, 1, 'admin', '2024-10-06 08:48:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 02:48:42', '2024-10-06 02:48:42'),
(361, 1, 'admin', '2024-10-06 09:05:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 03:05:03', '2024-10-06 03:05:03'),
(362, 1, 'admin', '2024-10-06 10:13:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 04:13:10', '2024-10-06 04:13:10'),
(363, 1, 'admin', '2024-10-06 11:25:45', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 05:25:45', '2024-10-06 05:25:45'),
(364, 1, 'admin', '2024-10-06 11:30:59', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 05:30:59', '2024-10-06 05:30:59'),
(365, 1, 'admin', '2024-10-06 12:26:23', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 06:26:23', '2024-10-06 06:26:23'),
(366, 1, 'admin', '2024-10-07 04:01:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 22:01:57', '2024-10-06 22:01:57'),
(367, 1, 'admin', '2024-10-07 04:22:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 22:22:02', '2024-10-06 22:22:02'),
(368, 1, 'admin', '2024-10-07 04:36:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 22:36:02', '2024-10-06 22:36:02'),
(369, 1, 'admin', '2024-10-07 04:49:39', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 22:49:39', '2024-10-06 22:49:39'),
(370, 1, 'admin', '2024-10-07 05:23:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-06 23:23:20', '2024-10-06 23:23:20'),
(371, 1, 'admin', '2024-10-07 06:39:31', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 00:39:31', '2024-10-07 00:39:31');
INSERT INTO `user_login_histories` (`id`, `user_id`, `user_guard`, `login_at`, `login_ip`, `login_browser_client`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(372, 1, 'admin', '2024-10-07 08:14:37', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-07 02:14:37', '2024-10-07 02:14:37'),
(373, 1, 'admin', '2024-10-07 08:54:18', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 02:54:18', '2024-10-07 02:54:18'),
(374, 1, 'admin', '2024-10-07 09:49:00', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-07 03:49:00', '2024-10-07 03:49:00'),
(375, 1, 'admin', '2024-10-07 10:01:51', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-07 04:01:51', '2024-10-07 04:01:51'),
(376, 1, 'admin', '2024-10-07 10:32:56', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 04:32:56', '2024-10-07 04:32:56'),
(377, 1, 'admin', '2024-10-07 10:39:54', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 04:39:54', '2024-10-07 04:39:54'),
(378, 1, 'admin', '2024-10-07 11:04:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 05:04:28', '2024-10-07 05:04:28'),
(379, 1, 'admin', '2024-10-07 11:16:12', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 05:16:12', '2024-10-07 05:16:12'),
(380, 1, 'admin', '2024-10-07 11:17:15', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 05:17:15', '2024-10-07 05:17:15'),
(381, 1, 'admin', '2024-10-07 11:19:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 05:19:57', '2024-10-07 05:19:57'),
(382, 1, 'admin', '2024-10-07 11:52:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 05:52:27', '2024-10-07 05:52:27'),
(383, 1, 'admin', '2024-10-07 12:30:38', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-07 06:30:38', '2024-10-07 06:30:38'),
(384, 1, 'admin', '2024-10-08 04:23:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 22:23:09', '2024-10-07 22:23:09'),
(385, 1, 'admin', '2024-10-08 04:54:54', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 22:54:54', '2024-10-07 22:54:54'),
(386, 1, 'admin', '2024-10-08 05:30:12', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-07 23:30:12', '2024-10-07 23:30:12'),
(387, 1, 'admin', '2024-10-08 06:07:51', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-08 00:07:51', '2024-10-08 00:07:51'),
(388, 1, 'admin', '2024-10-08 09:12:50', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-08 03:12:50', '2024-10-08 03:12:50'),
(389, 1, 'admin', '2024-10-08 11:38:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-08 05:38:17', '2024-10-08 05:38:17'),
(390, 1, 'admin', '2024-10-08 11:51:49', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-08 05:51:49', '2024-10-08 05:51:49'),
(391, 1, 'admin', '2024-10-09 04:18:18', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-08 22:18:18', '2024-10-08 22:18:18'),
(392, 1, 'admin', '2024-10-09 04:55:52', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-08 22:55:52', '2024-10-08 22:55:52'),
(393, 1, 'admin', '2024-10-09 05:24:49', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-08 23:24:49', '2024-10-08 23:24:49'),
(394, 1, 'admin', '2024-10-09 05:27:00', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-08 23:27:00', '2024-10-08 23:27:00'),
(395, 1, 'admin', '2024-10-09 05:28:32', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-08 23:28:32', '2024-10-08 23:28:32'),
(396, 1, 'admin', '2024-10-09 06:31:26', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-09 00:31:26', '2024-10-09 00:31:26'),
(397, 1, 'admin', '2024-10-09 08:35:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-09 02:35:07', '2024-10-09 02:35:07'),
(398, 1, 'admin', '2024-10-09 08:59:50', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-09 02:59:50', '2024-10-09 02:59:50'),
(399, 1, 'admin', '2024-10-09 11:59:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-09 05:59:37', '2024-10-09 05:59:37'),
(400, 1, 'admin', '2024-10-09 12:23:03', '103.210.58.112', 'Google Chrome', 0, 'active', '2024-10-09 06:23:03', '2024-10-09 06:23:03'),
(401, 1, 'admin', '2024-10-09 12:24:01', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-09 06:24:01', '2024-10-09 06:24:01'),
(402, 1, 'admin', '2024-10-10 09:29:55', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-10 03:29:55', '2024-10-10 03:29:55'),
(403, 1, 'admin', '2024-10-10 10:06:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-10 04:06:30', '2024-10-10 04:06:30'),
(404, 1, 'admin', '2024-10-10 11:07:19', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-10 05:07:19', '2024-10-10 05:07:19'),
(405, 1, 'admin', '2024-10-10 12:30:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-10 06:30:25', '2024-10-10 06:30:25'),
(406, 1, 'admin', '2024-10-10 15:21:44', '103.210.58.112', 'Google Chrome', 0, 'active', '2024-10-10 09:21:44', '2024-10-10 09:21:44'),
(407, 1, 'admin', '2024-10-10 15:27:40', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-10 09:27:40', '2024-10-10 09:27:40'),
(408, 1, 'admin', '2024-10-10 18:32:41', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-10 12:32:41', '2024-10-10 12:32:41'),
(409, 1, 'admin', '2024-10-10 18:33:18', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-10 12:33:18', '2024-10-10 12:33:18'),
(410, 1, 'admin', '2024-10-10 18:34:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-10 12:34:05', '2024-10-10 12:34:05'),
(411, 1, 'admin', '2024-10-10 22:15:05', '103.210.58.112', 'Google Chrome', 0, 'active', '2024-10-10 16:15:05', '2024-10-10 16:15:05'),
(412, 1, 'admin', '2024-10-13 09:14:13', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-13 03:14:13', '2024-10-13 03:14:13'),
(413, 1, 'admin', '2024-10-13 10:02:29', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-13 04:02:29', '2024-10-13 04:02:29'),
(414, 1, 'admin', '2024-10-13 11:31:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-13 05:31:03', '2024-10-13 05:31:03'),
(415, 1, 'admin', '2024-10-14 10:14:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-14 04:14:01', '2024-10-14 04:14:01'),
(416, 1, 'admin', '2024-10-14 10:16:58', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-14 04:16:58', '2024-10-14 04:16:58'),
(417, 1, 'admin', '2024-10-14 10:17:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-14 04:17:20', '2024-10-14 04:17:20'),
(418, 1, 'admin', '2024-10-14 12:02:55', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-14 06:02:55', '2024-10-14 06:02:55'),
(419, 1, 'admin', '2024-10-14 12:08:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-14 06:08:10', '2024-10-14 06:08:10'),
(420, 1, 'admin', '2024-10-14 17:42:12', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-14 11:42:12', '2024-10-14 11:42:12'),
(421, 1, 'admin', '2024-10-15 10:24:41', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-15 04:24:41', '2024-10-15 04:24:41'),
(422, 1, 'admin', '2024-10-15 10:59:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-15 04:59:42', '2024-10-15 04:59:42'),
(423, 1, 'admin', '2024-10-16 10:00:32', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-16 04:00:32', '2024-10-16 04:00:32'),
(424, 1, 'admin', '2024-10-16 12:20:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-16 06:20:14', '2024-10-16 06:20:14'),
(425, 1, 'admin', '2024-10-16 15:22:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-16 09:22:20', '2024-10-16 09:22:20'),
(426, 1, 'admin', '2024-10-16 17:00:29', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-16 11:00:29', '2024-10-16 11:00:29'),
(427, 1, 'admin', '2024-10-16 17:04:24', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-16 11:04:24', '2024-10-16 11:04:24'),
(428, 1, 'admin', '2024-10-16 17:05:16', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-16 11:05:16', '2024-10-16 11:05:16'),
(429, 1, 'admin', '2024-10-17 13:07:40', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-17 07:07:40', '2024-10-17 07:07:40'),
(430, 1, 'admin', '2024-10-17 14:13:47', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-17 08:13:47', '2024-10-17 08:13:47'),
(431, 1, 'admin', '2024-10-17 17:09:43', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-17 11:09:43', '2024-10-17 11:09:43'),
(432, 1, 'admin', '2024-10-20 11:21:41', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-20 05:21:41', '2024-10-20 05:21:41'),
(433, 1, 'admin', '2024-10-20 12:39:13', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-20 06:39:13', '2024-10-20 06:39:13'),
(434, 1, 'admin', '2024-10-20 13:06:56', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-20 07:06:56', '2024-10-20 07:06:56'),
(435, 1, 'admin', '2024-10-20 17:06:32', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-20 11:06:32', '2024-10-20 11:06:32'),
(436, 1, 'admin', '2024-10-20 17:21:59', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-20 11:21:59', '2024-10-20 11:21:59'),
(437, 1, 'admin', '2024-10-21 07:37:10', '59.152.97.52', 'Google Chrome', 0, 'active', '2024-10-21 01:37:10', '2024-10-21 01:37:10'),
(438, 1, 'admin', '2024-10-21 10:08:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-21 04:08:14', '2024-10-21 04:08:14'),
(439, 1, 'admin', '2024-10-21 16:01:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-21 10:01:25', '2024-10-21 10:01:25'),
(440, 1, 'admin', '2024-10-21 16:33:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-21 10:33:05', '2024-10-21 10:33:05'),
(441, 1, 'admin', '2024-10-21 18:47:03', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-21 12:47:03', '2024-10-21 12:47:03'),
(442, 1, 'admin', '2024-10-24 13:04:45', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-24 07:04:45', '2024-10-24 07:04:45'),
(443, 1, 'admin', '2024-10-26 21:24:15', '103.230.104.19', 'Google Chrome', 0, 'active', '2024-10-26 15:24:15', '2024-10-26 15:24:15'),
(444, 1, 'admin', '2024-10-27 10:30:00', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-27 04:30:00', '2024-10-27 04:30:00'),
(445, 1, 'admin', '2024-10-27 16:42:56', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-27 10:42:56', '2024-10-27 10:42:56'),
(446, 1, 'admin', '2024-10-29 09:52:53', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-29 03:52:53', '2024-10-29 03:52:53'),
(447, 1, 'admin', '2024-10-29 11:20:59', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-29 05:20:59', '2024-10-29 05:20:59'),
(448, 1, 'admin', '2024-10-29 12:49:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-29 06:49:28', '2024-10-29 06:49:28'),
(449, 1, 'admin', '2024-10-29 16:00:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-29 10:00:10', '2024-10-29 10:00:10'),
(450, 1, 'admin', '2024-10-30 10:57:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-30 04:57:17', '2024-10-30 04:57:17'),
(451, 1, 'admin', '2024-10-30 16:59:13', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-30 10:59:13', '2024-10-30 10:59:13'),
(452, 1, 'admin', '2024-10-31 12:29:15', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-31 06:29:15', '2024-10-31 06:29:15'),
(453, 1, 'admin', '2024-10-31 15:48:06', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-31 09:48:06', '2024-10-31 09:48:06'),
(454, 1, 'admin', '2024-10-31 16:00:32', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-31 10:00:32', '2024-10-31 10:00:32'),
(455, 1, 'admin', '2024-11-03 10:49:35', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-03 04:49:35', '2024-11-03 04:49:35'),
(456, 1, 'admin', '2024-11-03 12:51:18', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-03 06:51:18', '2024-11-03 06:51:18'),
(457, 1, 'admin', '2024-11-03 18:12:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-03 12:12:42', '2024-11-03 12:12:42'),
(458, 1, 'admin', '2024-11-05 10:28:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-05 04:28:10', '2024-11-05 04:28:10'),
(459, 1, 'admin', '2024-11-05 14:44:56', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-05 08:44:56', '2024-11-05 08:44:56'),
(460, 1, 'admin', '2024-11-06 12:15:41', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-06 06:15:41', '2024-11-06 06:15:41'),
(461, 1, 'admin', '2024-11-06 16:36:35', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-06 10:36:35', '2024-11-06 10:36:35'),
(462, 1, 'admin', '2024-11-07 10:43:45', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-07 04:43:45', '2024-11-07 04:43:45'),
(463, 1, 'admin', '2024-11-11 11:23:15', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-11 05:23:15', '2024-11-11 05:23:15'),
(464, 1, 'admin', '2024-11-11 16:49:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-11 10:49:46', '2024-11-11 10:49:46'),
(465, 1, 'admin', '2024-11-12 15:47:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-12 09:47:16', '2024-11-12 09:47:16'),
(466, 1, 'admin', '2024-11-12 16:19:21', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-12 10:19:21', '2024-11-12 10:19:21'),
(467, 1, 'admin', '2024-11-14 14:41:34', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-14 08:41:34', '2024-11-14 08:41:34'),
(468, 1, 'admin', '2024-11-18 10:47:13', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-18 04:47:13', '2024-11-18 04:47:13'),
(469, 1, 'admin', '2024-11-18 12:18:58', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-18 06:18:58', '2024-11-18 06:18:58'),
(470, 1, 'admin', '2024-11-18 16:46:18', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-18 10:46:18', '2024-11-18 10:46:18'),
(471, 1, 'admin', '2024-11-21 13:04:08', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-21 07:04:08', '2024-11-21 07:04:08'),
(472, 1, 'admin', '2024-11-24 15:03:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-24 09:03:05', '2024-11-24 09:03:05'),
(473, 1, 'admin', '2024-11-25 13:25:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-25 07:25:42', '2024-11-25 07:25:42'),
(474, 1, 'admin', '2024-11-25 15:04:41', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-25 09:04:41', '2024-11-25 09:04:41'),
(475, 1, 'admin', '2024-11-25 17:39:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-25 11:39:01', '2024-11-25 11:39:01'),
(476, 1, 'admin', '2024-11-27 12:58:39', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-27 06:58:39', '2024-11-27 06:58:39'),
(477, 1, 'admin', '2024-12-01 13:40:04', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-12-01 07:40:04', '2024-12-01 07:40:04'),
(478, 1, 'admin', '2024-12-09 12:30:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-09 06:30:30', '2024-12-09 06:30:30'),
(479, 1, 'admin', '2024-12-12 16:07:11', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-12 10:07:11', '2024-12-12 10:07:11'),
(480, 1, 'admin', '2024-12-12 18:30:00', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-12 12:30:00', '2024-12-12 12:30:00'),
(481, 1, 'admin', '2024-12-17 10:56:59', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-17 04:56:59', '2024-12-17 04:56:59'),
(482, 1, 'admin', '2024-12-18 15:17:56', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-18 09:17:56', '2024-12-18 09:17:56'),
(483, 1, 'admin', '2024-12-26 18:55:28', '116.58.205.192', 'Mozilla Firefox', 0, 'active', '2024-12-26 12:55:28', '2024-12-26 12:55:28'),
(484, 1, 'admin', '2024-12-29 12:35:49', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-29 06:35:49', '2024-12-29 06:35:49'),
(485, 1, 'admin', '2024-12-30 11:33:07', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-12-30 05:33:07', '2024-12-30 05:33:07'),
(486, 1, 'admin', '2024-12-31 17:38:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-31 11:38:09', '2024-12-31 11:38:09'),
(487, 1, 'admin', '2025-01-01 15:26:23', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-01-01 09:26:23', '2025-01-01 09:26:23'),
(488, 1, 'admin', '2025-01-05 22:47:55', '59.152.97.52', 'Google Chrome', 0, 'active', '2025-01-05 16:47:55', '2025-01-05 16:47:55'),
(489, 1, 'admin', '2025-01-15 17:49:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-15 11:49:01', '2025-01-15 11:49:01'),
(490, 1, 'admin', '2025-01-16 16:37:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-16 10:37:03', '2025-01-16 10:37:03'),
(491, 1, 'admin', '2025-01-19 11:37:30', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-01-19 05:37:30', '2025-01-19 05:37:30'),
(492, 1, 'admin', '2025-01-19 13:26:54', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-19 07:26:54', '2025-01-19 07:26:54'),
(493, 1, 'admin', '2025-01-21 15:04:41', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-21 09:04:41', '2025-01-21 09:04:41'),
(494, 1, 'admin', '2025-01-21 17:54:58', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-21 11:54:58', '2025-01-21 11:54:58'),
(495, 1, 'admin', '2025-01-26 08:59:28', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-01-26 02:59:28', '2025-01-26 02:59:28'),
(496, 1, 'admin', '2025-01-30 14:59:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-30 08:59:17', '2025-01-30 08:59:17'),
(497, 1, 'admin', '2025-01-30 15:32:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-30 09:32:07', '2025-01-30 09:32:07'),
(498, 1, 'admin', '2025-02-04 11:33:49', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-04 05:33:49', '2025-02-04 05:33:49'),
(499, 1, 'admin', '2025-02-05 17:03:23', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-02-05 11:03:23', '2025-02-05 11:03:23'),
(500, 1, 'admin', '2025-02-12 10:11:31', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-12 04:11:31', '2025-02-12 04:11:31'),
(501, 1, 'admin', '2025-02-12 10:46:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-12 04:46:22', '2025-02-12 04:46:22'),
(502, 1, 'admin', '2025-02-12 18:56:47', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-12 12:56:47', '2025-02-12 12:56:47'),
(503, 1, 'admin', '2025-02-16 11:16:35', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-16 05:16:35', '2025-02-16 05:16:35'),
(504, 1, 'admin', '2025-02-16 16:47:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-16 10:47:27', '2025-02-16 10:47:27'),
(505, 1, 'admin', '2025-02-17 10:35:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-17 04:35:10', '2025-02-17 04:35:10'),
(506, 1, 'admin', '2025-02-18 10:41:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-18 04:41:46', '2025-02-18 04:41:46'),
(507, 1, 'admin', '2025-02-25 14:41:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-25 08:41:28', '2025-02-25 08:41:28'),
(508, 1, 'admin', '2025-02-27 12:30:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-27 06:30:28', '2025-02-27 06:30:28'),
(509, 1, 'admin', '2025-03-02 09:52:55', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-02 03:52:55', '2025-03-02 03:52:55'),
(510, 1, 'admin', '2025-03-02 14:29:39', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-02 08:29:39', '2025-03-02 08:29:39'),
(511, 1, 'admin', '2025-03-02 14:51:40', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-02 08:51:40', '2025-03-02 08:51:40'),
(512, 1, 'admin', '2025-03-03 08:55:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-03 02:55:05', '2025-03-03 02:55:05'),
(513, 1, 'admin', '2025-03-03 10:01:19', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-03 04:01:19', '2025-03-03 04:01:19'),
(514, 1, 'admin', '2025-03-03 12:22:36', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-03 06:22:36', '2025-03-03 06:22:36'),
(515, 1, 'admin', '2025-03-03 12:27:40', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-03 06:27:40', '2025-03-03 06:27:40'),
(516, 1, 'admin', '2025-03-03 12:36:57', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-03-03 06:36:57', '2025-03-03 06:36:57'),
(517, 1, 'admin', '2025-03-03 13:17:36', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-03 07:17:36', '2025-03-03 07:17:36'),
(518, 1, 'admin', '2025-03-03 13:20:38', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-03 07:20:38', '2025-03-03 07:20:38'),
(519, 1, 'admin', '2025-03-03 14:49:59', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-03 08:49:59', '2025-03-03 08:49:59'),
(520, 1, 'admin', '2025-03-03 14:50:39', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-03 08:50:39', '2025-03-03 08:50:39'),
(521, 1, 'admin', '2025-03-04 10:52:24', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-04 04:52:24', '2025-03-04 04:52:24'),
(522, 1, 'admin', '2025-03-04 14:38:35', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-04 08:38:35', '2025-03-04 08:38:35'),
(523, 1, 'admin', '2025-03-05 10:20:47', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-05 04:20:47', '2025-03-05 04:20:47'),
(524, 1, 'admin', '2025-03-05 13:12:35', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-05 07:12:35', '2025-03-05 07:12:35'),
(525, 1, 'admin', '2025-03-05 13:13:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-05 07:13:20', '2025-03-05 07:13:20'),
(526, 1, 'admin', '2025-03-05 13:17:31', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-03-05 07:17:31', '2025-03-05 07:17:31'),
(527, 1, 'admin', '2025-03-05 13:21:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-05 07:21:26', '2025-03-05 07:21:26'),
(528, 1, 'admin', '2025-03-05 13:24:11', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-05 07:24:11', '2025-03-05 07:24:11'),
(529, 1, 'admin', '2025-03-05 13:37:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-05 07:37:14', '2025-03-05 07:37:14'),
(530, 1, 'admin', '2025-03-06 08:31:11', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-06 02:31:11', '2025-03-06 02:31:11'),
(531, 1, 'admin', '2025-03-06 14:59:06', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-06 08:59:06', '2025-03-06 08:59:06'),
(532, 1, 'admin', '2025-03-09 08:57:19', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-09 02:57:19', '2025-03-09 02:57:19'),
(533, 1, 'admin', '2025-03-09 09:15:18', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-09 03:15:18', '2025-03-09 03:15:18'),
(534, 1, 'admin', '2025-03-09 12:04:21', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-09 06:04:21', '2025-03-09 06:04:21'),
(535, 1, 'admin', '2025-03-09 15:11:36', '116.58.200.151', 'Google Chrome', 0, 'active', '2025-03-09 09:11:36', '2025-03-09 09:11:36'),
(536, 1, 'admin', '2025-03-10 13:17:29', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-03-10 07:17:29', '2025-03-10 07:17:29'),
(537, 1, 'admin', '2025-03-13 11:51:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-13 05:51:26', '2025-03-13 05:51:26'),
(538, 1, 'admin', '2025-03-13 11:52:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-13 05:52:30', '2025-03-13 05:52:30'),
(539, 1, 'admin', '2025-03-18 11:15:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-18 05:15:30', '2025-03-18 05:15:30'),
(540, 1, 'admin', '2025-03-19 09:25:55', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-03-19 03:25:55', '2025-03-19 03:25:55'),
(541, 1, 'admin', '2025-03-19 09:34:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-19 03:34:10', '2025-03-19 03:34:10'),
(542, 1, 'admin', '2025-03-19 14:55:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-19 08:55:30', '2025-03-19 08:55:30'),
(543, 1, 'admin', '2025-03-20 14:12:11', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-20 08:12:12', '2025-03-20 08:12:12'),
(544, 1, 'admin', '2025-03-20 14:33:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-20 08:33:30', '2025-03-20 08:33:30'),
(545, 1, 'admin', '2025-03-20 14:42:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-20 08:42:27', '2025-03-20 08:42:27'),
(546, 1, 'admin', '2025-03-20 14:44:52', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-20 08:44:52', '2025-03-20 08:44:52'),
(547, 1, 'admin', '2025-03-20 14:57:45', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-20 08:57:45', '2025-03-20 08:57:45'),
(548, 1, 'admin', '2025-03-22 10:13:08', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-22 04:13:08', '2025-03-22 04:13:08'),
(549, 1, 'admin', '2025-03-23 10:20:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-23 04:20:27', '2025-03-23 04:20:27'),
(550, 1, 'admin', '2025-03-23 11:46:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-23 05:46:16', '2025-03-23 05:46:16'),
(551, 1, 'admin', '2025-03-23 12:54:32', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-23 06:54:32', '2025-03-23 06:54:32'),
(552, 1, 'admin', '2025-03-23 12:56:34', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-23 06:56:34', '2025-03-23 06:56:34'),
(553, 1, 'admin', '2025-03-24 10:24:59', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-24 04:24:59', '2025-03-24 04:24:59'),
(554, 1, 'admin', '2025-03-25 09:38:05', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-03-25 03:38:05', '2025-03-25 03:38:05'),
(555, 1, 'admin', '2025-03-25 10:12:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-25 04:12:10', '2025-03-25 04:12:10'),
(556, 1, 'admin', '2025-03-25 11:55:32', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-03-25 05:55:32', '2025-03-25 05:55:32'),
(557, 1, 'admin', '2025-04-07 13:25:26', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-04-07 07:25:26', '2025-04-07 07:25:26'),
(558, 1, 'admin', '2025-04-07 16:05:29', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-04-07 10:05:29', '2025-04-07 10:05:29'),
(559, 1, 'admin', '2025-04-10 14:17:16', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-04-10 08:17:16', '2025-04-10 08:17:16'),
(560, 1, 'admin', '2025-04-20 15:20:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-04-20 09:20:11', '2025-04-20 09:20:11'),
(561, 1, 'admin', '2025-04-24 10:17:51', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-04-24 04:17:51', '2025-04-24 04:17:51'),
(562, 1, 'admin', '2025-04-24 16:58:58', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-04-24 10:58:58', '2025-04-24 10:58:58'),
(563, 1, 'admin', '2025-05-06 17:52:21', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-05-06 11:52:21', '2025-05-06 11:52:21'),
(564, 1, 'admin', '2025-05-06 17:54:44', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-05-06 11:54:44', '2025-05-06 11:54:44'),
(565, 21, 'admin', '2025-05-06 17:56:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-05-06 11:56:16', '2025-05-06 11:56:16'),
(566, 1, 'admin', '2025-05-07 15:04:33', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-05-07 09:04:33', '2025-05-07 09:04:33'),
(567, 1, 'admin', '2025-05-15 18:35:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-05-15 12:35:20', '2025-05-15 12:35:20'),
(568, 1, 'admin', '2025-05-28 12:20:51', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-05-28 06:20:51', '2025-05-28 06:20:51'),
(569, 1, 'admin', '2025-05-28 14:53:29', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-05-28 08:53:29', '2025-05-28 08:53:29'),
(570, 1, 'admin', '2025-06-02 14:55:21', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-06-02 08:55:21', '2025-06-02 08:55:21'),
(571, 1, 'admin', '2025-06-23 15:41:21', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-06-23 09:41:21', '2025-06-23 09:41:21'),
(572, 1, 'admin', '2025-06-24 12:22:33', '::1', 'Google Chrome', 0, 'active', '2025-06-24 06:22:33', '2025-06-24 06:22:33'),
(573, 1, 'admin', '2025-06-24 12:27:25', '::1', 'Google Chrome', 0, 'active', '2025-06-24 06:27:25', '2025-06-24 06:27:25'),
(574, 1, 'admin', '2025-06-24 15:37:31', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-06-24 09:37:31', '2025-06-24 09:37:31'),
(575, 1, 'admin', '2025-06-24 15:56:22', '::1', 'Google Chrome', 0, 'active', '2025-06-24 09:56:22', '2025-06-24 09:56:22'),
(576, 1, 'admin', '2025-06-24 18:02:22', '::1', 'Google Chrome', 0, 'active', '2025-06-24 12:02:22', '2025-06-24 12:02:22'),
(577, 1, 'admin', '2025-06-24 18:20:14', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-06-24 12:20:14', '2025-06-24 12:20:14'),
(578, 1, 'admin', '2025-06-25 08:32:41', '::1', 'Google Chrome', 0, 'active', '2025-06-25 02:32:41', '2025-06-25 02:32:41'),
(579, 1, 'admin', '2025-06-25 08:53:39', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-06-25 02:53:39', '2025-06-25 02:53:39'),
(580, 1, 'admin', '2025-06-25 09:25:02', '::1', 'Google Chrome', 0, 'active', '2025-06-25 03:25:02', '2025-06-25 03:25:02'),
(581, 1, 'admin', '2025-06-25 10:09:19', '::1', 'Google Chrome', 0, 'active', '2025-06-25 04:09:19', '2025-06-25 04:09:19'),
(582, 1, 'admin', '2025-06-25 10:09:42', '::1', 'Google Chrome', 0, 'active', '2025-06-25 04:09:42', '2025-06-25 04:09:42'),
(583, 1, 'admin', '2025-06-25 10:17:05', '::1', 'Google Chrome', 0, 'active', '2025-06-25 04:17:05', '2025-06-25 04:17:05'),
(584, 1, 'admin', '2025-06-25 11:52:09', '::1', 'Google Chrome', 0, 'active', '2025-06-25 05:52:09', '2025-06-25 05:52:09'),
(585, 1, 'admin', '2025-06-25 14:22:21', '::1', 'Google Chrome', 0, 'active', '2025-06-25 08:22:21', '2025-06-25 08:22:21'),
(586, 1, 'admin', '2025-06-25 14:25:33', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-06-25 08:25:33', '2025-06-25 08:25:33'),
(587, 1, 'admin', '2025-06-25 16:53:21', '::1', 'Google Chrome', 0, 'active', '2025-06-25 10:53:21', '2025-06-25 10:53:21'),
(588, 1, 'admin', '2025-06-26 09:19:39', '::1', 'Google Chrome', 0, 'active', '2025-06-26 03:19:39', '2025-06-26 03:19:39'),
(589, 1, 'admin', '2025-06-26 09:39:36', '::1', 'Google Chrome', 0, 'active', '2025-06-26 03:39:36', '2025-06-26 03:39:36'),
(590, 1, 'admin', '2025-06-26 10:25:34', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-06-26 04:25:34', '2025-06-26 04:25:34'),
(591, 1, 'admin', '2025-06-26 10:56:15', '::1', 'Google Chrome', 0, 'active', '2025-06-26 04:56:15', '2025-06-26 04:56:15'),
(592, 1, 'admin', '2025-06-26 12:55:28', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-06-26 06:55:28', '2025-06-26 06:55:28'),
(593, 1, 'admin', '2025-06-26 15:29:45', '::1', 'Google Chrome', 0, 'active', '2025-06-26 09:29:45', '2025-06-26 09:29:45'),
(594, 1, 'admin', '2025-06-26 15:31:11', '::1', 'Google Chrome', 0, 'active', '2025-06-26 09:31:11', '2025-06-26 09:31:11'),
(595, 1, 'admin', '2025-07-13 13:49:16', '::1', 'Google Chrome', 0, 'active', '2025-07-13 07:49:16', '2025-07-13 07:49:16'),
(596, 1, 'admin', '2025-07-13 15:06:28', '::1', 'Google Chrome', 0, 'active', '2025-07-13 09:06:28', '2025-07-13 09:06:28'),
(597, 1, 'admin', '2025-07-14 09:28:01', '::1', 'Google Chrome', 0, 'active', '2025-07-14 03:28:01', '2025-07-14 03:28:01'),
(598, 1, 'admin', '2025-07-14 13:58:09', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-07-14 07:58:09', '2025-07-14 07:58:09'),
(599, 1, 'admin', '2025-07-14 17:19:41', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-07-14 11:19:41', '2025-07-14 11:19:41'),
(600, 1, 'admin', '2025-07-14 17:21:44', '::1', 'Google Chrome', 0, 'active', '2025-07-14 11:21:44', '2025-07-14 11:21:44'),
(601, 1, 'admin', '2025-07-15 17:21:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-15 11:21:26', '2025-07-15 11:21:26'),
(602, 1, 'admin', '2025-07-16 16:00:58', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-16 10:00:58', '2025-07-16 10:00:58'),
(603, 1, 'admin', '2025-07-16 18:28:12', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-16 12:28:12', '2025-07-16 12:28:12'),
(604, 1, 'admin', '2025-07-17 09:37:24', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-17 03:37:24', '2025-07-17 03:37:24'),
(605, 1, 'admin', '2025-07-17 11:18:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-17 05:18:26', '2025-07-17 05:18:26'),
(606, 1, 'admin', '2025-07-17 16:37:56', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-17 10:37:56', '2025-07-17 10:37:56'),
(607, 1, 'admin', '2025-07-20 09:55:38', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-20 03:55:38', '2025-07-20 03:55:38'),
(608, 1, 'admin', '2025-07-20 15:47:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-20 09:47:16', '2025-07-20 09:47:16'),
(609, 1, 'admin', '2025-07-21 13:25:56', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-21 07:25:56', '2025-07-21 07:25:56'),
(610, 1, 'admin', '2025-07-21 13:36:54', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-21 07:36:54', '2025-07-21 07:36:54'),
(611, 1, 'admin', '2025-07-22 18:57:50', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-22 12:57:50', '2025-07-22 12:57:50'),
(612, 1, 'admin', '2025-07-23 09:45:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-23 03:45:17', '2025-07-23 03:45:17'),
(613, 1, 'admin', '2025-07-24 11:16:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-24 05:16:42', '2025-07-24 05:16:42'),
(614, 1, 'admin', '2025-07-24 17:02:00', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-07-24 11:02:00', '2025-07-24 11:02:00'),
(615, 1, 'admin', '2025-07-24 17:31:43', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-07-24 11:31:43', '2025-07-24 11:31:43'),
(616, 1, 'admin', '2025-07-26 10:15:07', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-07-26 04:15:07', '2025-07-26 04:15:07'),
(617, 1, 'admin', '2025-07-26 22:19:03', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-07-26 16:19:03', '2025-07-26 16:19:03'),
(618, 1, 'admin', '2025-07-29 08:40:40', '::1', 'Google Chrome', 0, 'active', '2025-07-29 02:40:40', '2025-07-29 02:40:40'),
(619, 1, 'admin', '2025-07-29 08:41:47', '::1', 'Google Chrome', 0, 'active', '2025-07-29 02:41:47', '2025-07-29 02:41:47'),
(620, 1, 'admin', '2025-08-01 09:42:22', '::1', 'Google Chrome', 0, 'active', '2025-08-01 03:42:22', '2025-08-01 03:42:22'),
(621, 1, 'admin', '2025-08-01 15:21:18', '::1', 'Google Chrome', 0, 'active', '2025-08-01 09:21:18', '2025-08-01 09:21:18'),
(622, 1, 'admin', '2025-08-01 21:52:37', '::1', 'Google Chrome', 0, 'active', '2025-08-01 15:52:37', '2025-08-01 15:52:37'),
(623, 1, 'admin', '2025-08-02 05:35:59', '::1', 'Google Chrome', 0, 'active', '2025-08-01 23:35:59', '2025-08-01 23:35:59'),
(624, 1, 'admin', '2025-08-02 08:54:06', '::1', 'Google Chrome', 0, 'active', '2025-08-02 02:54:06', '2025-08-02 02:54:06'),
(625, 1, 'admin', '2025-08-02 14:37:19', '::1', 'Google Chrome', 0, 'active', '2025-08-02 08:37:19', '2025-08-02 08:37:19'),
(626, 1, 'admin', '2025-08-02 21:54:20', '::1', 'Google Chrome', 0, 'active', '2025-08-02 15:54:20', '2025-08-02 15:54:20'),
(627, 1, 'admin', '2025-08-16 10:59:11', '::1', 'Google Chrome', 0, 'active', '2025-08-16 04:59:11', '2025-08-16 04:59:11'),
(628, 1, 'admin', '2025-08-21 09:10:58', '::1', 'Google Chrome', 0, 'active', '2025-08-21 03:10:58', '2025-08-21 03:10:58'),
(629, 1, 'admin', '2025-09-12 09:21:34', '::1', 'Google Chrome', 0, 'active', '2025-09-12 03:21:34', '2025-09-12 03:21:34'),
(630, 1, 'admin', '2025-09-19 09:55:45', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-09-19 03:55:45', '2025-09-19 03:55:45'),
(631, 1, 'admin', '2025-09-19 14:23:59', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-09-19 08:23:59', '2025-09-19 08:23:59'),
(632, 1, 'admin', '2025-09-20 06:20:04', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-09-20 00:20:05', '2025-09-20 00:20:05'),
(633, 1, 'admin', '2025-09-20 21:57:20', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-09-20 15:57:20', '2025-09-20 15:57:20'),
(634, 1, 'admin', '2025-09-21 09:57:25', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-09-21 03:57:25', '2025-09-21 03:57:25'),
(635, 1, 'admin', '2025-09-21 23:21:31', '::1', 'Google Chrome', 0, 'active', '2025-09-21 17:21:31', '2025-09-21 17:21:31'),
(636, 1, 'admin', '2025-09-22 22:14:29', '::1', 'Google Chrome', 0, 'active', '2025-09-22 16:14:29', '2025-09-22 16:14:29'),
(637, 1, 'admin', '2025-09-23 22:03:54', '::1', 'Google Chrome', 0, 'active', '2025-09-23 16:03:54', '2025-09-23 16:03:54'),
(638, 1, 'admin', '2025-09-24 00:46:37', '127.0.0.1', 'Mozilla Firefox', 0, 'active', '2025-09-23 18:46:37', '2025-09-23 18:46:37');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint UNSIGNED NOT NULL,
  `album_id` bigint UNSIGNED DEFAULT NULL,
  `thumbnail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','draft') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `album_id`, `thumbnail`, `title`, `url`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(7, 9, '{\"300x300\":\"upload\\/video\\/300x300\\/dcf34695-9d5f-401b-8a44-ecec0f784bca.avif\",\"200x200\":\"upload\\/video\\/200x200\\/db8b4ecc-c202-49a1-8e24-018d0782a3b4.avif\",\"50x50\":\"upload\\/video\\/50x50\\/0e18c317-e276-4175-ae69-0dcffa3308e8.avif\",\"original\":\"upload\\/video\\/original\\/471b6551-cf4a-4c9e-a8bd-075f56464194.avif\"}', 'Fower', 'https://www.youtube.com/watch?v=i810CxN5Q6Q', 1, 'active', '2024-10-08 04:05:15', '2024-10-08 04:05:15'),
(8, 9, '{\"300x300\":\"upload\\/video\\/300x300\\/0dcdc7ad-2a5c-4e5e-b416-f577aa351b09.avif\",\"200x200\":\"upload\\/video\\/200x200\\/e9aa5631-ff97-4fde-a001-f8acf50a61db.avif\",\"50x50\":\"upload\\/video\\/50x50\\/ef21d83c-8e15-43b7-88b4-87bedff0b469.avif\",\"original\":\"upload\\/video\\/original\\/a8e12b74-491a-4a39-b21a-5600c4817694.avif\"}', 'Chameli', 'https://www.youtube.com/watch?v=SqKLLd_8Nhs', 2, 'active', '2024-10-08 04:05:51', '2024-10-08 04:05:51'),
(9, 9, '{\"300x300\":\"upload\\/video\\/300x300\\/5afb75ec-a78b-48f1-97d5-573af85f321e.avif\",\"200x200\":\"upload\\/video\\/200x200\\/349c41e0-fd81-4fe7-b829-48c8b772a692.avif\",\"50x50\":\"upload\\/video\\/50x50\\/6e4ec12d-4fcd-46ca-be37-d9b973682e28.avif\",\"original\":\"upload\\/video\\/original\\/6846c38b-4441-464e-a66a-b0522d66488a.avif\"}', 'Golden', 'https://www.youtube.com/watch?v=Ffsuv73QjIQ', 3, 'active', '2024-10-08 04:06:25', '2024-10-08 04:06:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_heads`
--
ALTER TABLE `account_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_role_id_index` (`role_id`);

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
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
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_menus`
--
ALTER TABLE `front_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_infos`
--
ALTER TABLE `help_infos`
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
-- Indexes for table `media_validators`
--
ALTER TABLE `media_validators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
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
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `page_seos`
--
ALTER TABLE `page_seos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_album_id_foreign` (`album_id`);

--
-- Indexes for table `Organizations`
--
ALTER TABLE `Organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_saasno` (`saasno`);

--
-- Indexes for table `Organization_users`
--
ALTER TABLE `Organization_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

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
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_details`
--
ALTER TABLE `slider_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
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
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_album_id_foreign` (`album_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_heads`
--
ALTER TABLE `account_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `front_menus`
--
ALTER TABLE `front_menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `help_infos`
--
ALTER TABLE `help_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `media_validators`
--
ALTER TABLE `media_validators`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_sections`
--
ALTER TABLE `page_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `page_seos`
--
ALTER TABLE `page_seos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `Organizations`
--
ALTER TABLE `Organizations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Organization_users`
--
ALTER TABLE `Organization_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `slider_details`
--
ALTER TABLE `slider_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_login_histories`
--
ALTER TABLE `user_login_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=639;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_files`
--
ALTER TABLE `content_files`
  ADD CONSTRAINT `content_files_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`);

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`);

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
