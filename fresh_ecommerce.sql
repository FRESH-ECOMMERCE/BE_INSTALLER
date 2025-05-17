-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 17, 2025 at 02:20 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fresh_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `address_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address_user_id` varchar(255) NOT NULL,
  `address_user_name` varchar(255) NOT NULL,
  `address_kontak` varchar(255) NOT NULL,
  `address_detail` varchar(255) NOT NULL,
  `address_postal_code` varchar(255) NOT NULL,
  `address_provinsi` varchar(255) NOT NULL,
  `address_kabupaten` varchar(255) NOT NULL,
  `address_kecamatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `created_at`, `updated_at`, `deleted`, `address_id`, `address_user_id`, `address_user_name`, `address_kontak`, `address_detail`, `address_postal_code`, `address_provinsi`, `address_kabupaten`, `address_kecamatan`) VALUES
(1, '2025-05-16 03:53:27', NULL, 0, '424323423423erwerewr23423rewr', '66aba427-4b2b-437e-b427-65f2b3f1eca2', 'Jack', '081233339099', 'Jl, Hadi Subroto, desa Bandar, kec.Mesuji kec.Batang , Provinsi Jawa Tengah ', '3433', 'Jawa Tengah', 'Batang', 'Mesuji');

-- --------------------------------------------------------

--
-- Table structure for table `bank_settings`
--

CREATE TABLE `bank_settings` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `bank_setting_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `bank_setting_name` varchar(50) NOT NULL,
  `bank_setting_number` varchar(100) NOT NULL,
  `bank_setting_owner_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `cart_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cart_user_id` varchar(255) NOT NULL,
  `cart_product_id` varchar(255) NOT NULL,
  `cart_product_color_selected` varchar(255) DEFAULT NULL,
  `cart_product_size_selected` varchar(255) DEFAULT NULL,
  `cart_total_item` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `created_at`, `updated_at`, `deleted`, `cart_id`, `cart_user_id`, `cart_product_id`, `cart_product_color_selected`, `cart_product_size_selected`, `cart_total_item`) VALUES
(1, '2025-05-16 03:53:27', NULL, 0, 'werew53rewr', '66aba427-4b2b-437e-b427-65f2b3f1eca2', '424323423423erwerewr23423rewr', 'Hitam', 'XL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category1`
--

CREATE TABLE `category1` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `category_icon` text,
  `category_id1` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category1`
--

INSERT INTO `category1` (`id`, `created_at`, `updated_at`, `deleted`, `category_icon`, `category_id1`, `category_name`) VALUES
(1, '2025-05-16 03:53:27', NULL, 0, 'https://cdn-icons-png.flaticon.com/512/6165/6165574.png', 'dfd324324rwer', 'fashion');

-- --------------------------------------------------------

--
-- Table structure for table `category2`
--

CREATE TABLE `category2` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `category_id1` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `category_id2` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category2`
--

INSERT INTO `category2` (`id`, `created_at`, `updated_at`, `deleted`, `category_id1`, `category_id2`, `category_name`) VALUES
(1, '2025-05-16 03:53:27', NULL, 0, 'dfd324324rwer', 'sdsd32sdsd4324rwer', 'pakaian');

-- --------------------------------------------------------

--
-- Table structure for table `category3`
--

CREATE TABLE `category3` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `category_id1` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `category_id2` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `category_id3` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category3`
--

INSERT INTO `category3` (`id`, `created_at`, `updated_at`, `deleted`, `category_id1`, `category_id2`, `category_id3`, `category_name`) VALUES
(1, '2025-05-16 03:53:27', NULL, 0, 'dfd324324rwer', 'sdsd32sdsd4324rwer', '4534534sdsdd32sdsd4324rwer', 'kaos');

-- --------------------------------------------------------

--
-- Table structure for table `my_addresses`
--

CREATE TABLE `my_addresses` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `my_address_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `my_address_name` varchar(255) NOT NULL,
  `my_address_kontak` varchar(255) NOT NULL,
  `my_address_detail` varchar(255) NOT NULL,
  `my_address_postal_code` varchar(255) NOT NULL,
  `my_address_provinsi` varchar(255) NOT NULL,
  `my_address_kabupaten` varchar(255) NOT NULL,
  `my_address_kecamatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `my_addresses`
--

INSERT INTO `my_addresses` (`id`, `created_at`, `updated_at`, `deleted`, `my_address_id`, `my_address_name`, `my_address_kontak`, `my_address_detail`, `my_address_postal_code`, `my_address_provinsi`, `my_address_kabupaten`, `my_address_kecamatan`) VALUES
(1, '2025-05-16 03:53:27', NULL, 0, 'sdsdasrwerewr23sd3e3ewq', 'Joko', '081233339099', 'Jl, Hadi Subroto, desa Bandar, kec.Mesuji kec.Batang , Provinsi Jawa Tengah ', '3433', 'Jawa Tengah', 'Batang', 'Mesuji');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `notification_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `notification_name` varchar(255) NOT NULL,
  `notification_message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `created_at`, `updated_at`, `deleted`, `notification_id`, `notification_name`, `notification_message`) VALUES
(1, '2025-05-16 03:53:27', NULL, 0, 'tregrek4trew34', 'welcome', 'Hello world');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `order_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `order_user_id` varchar(255) NOT NULL,
  `order_product_id` varchar(255) NOT NULL,
  `order_product_price` decimal(10,0) NOT NULL,
  `order_total_product_price` decimal(10,0) NOT NULL,
  `order_ongkir_price` decimal(10,0) NOT NULL,
  `order_total_item` int(11) NOT NULL,
  `order_product_size_selected` varchar(50) DEFAULT NULL,
  `order_product_color_selected` varchar(50) DEFAULT NULL,
  `order_status` enum('waiting','process','delivery','done','cancel') NOT NULL DEFAULT 'waiting',
  `order_transfer_bank_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `product_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_images` text NOT NULL,
  `product_description` text NOT NULL,
  `product_price` int(11) NOT NULL DEFAULT '0',
  `product_category_id1` varchar(100) NOT NULL,
  `product_category_id2` varchar(100) NOT NULL,
  `product_category_id3` varchar(100) NOT NULL,
  `product_total_sale` int(11) DEFAULT '0',
  `product_stock` int(11) NOT NULL DEFAULT '0',
  `product_weight` int(11) DEFAULT '0',
  `product_condition` enum('Baru','Bekas') NOT NULL DEFAULT 'Baru',
  `product_discount` int(11) DEFAULT '0',
  `product_colors` text,
  `product_sizes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `deleted`, `product_id`, `product_name`, `product_images`, `product_description`, `product_price`, `product_category_id1`, `product_category_id2`, `product_category_id3`, `product_total_sale`, `product_stock`, `product_weight`, `product_condition`, `product_discount`, `product_colors`, `product_sizes`) VALUES
(1, '2025-05-16 03:53:27', NULL, 0, '424323423423erwerewr23423rewr', 'I phone x', '[\"https://cdn.eraspace.com/media/catalog/product/i/p/iphone_14_pro_deep_purple_1.jpg\", \"https://img.ws.mms.shopee.co.id/id-11134207-7qul6-lhyir6224p9wa4\"]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vulputate feugiat arcu, sed pharetra est. Curabitur interdum eu diam in porttitor. Phasellus purus odio, viverra dignissim vulputate et, facilisis sed diam. Pellentesque fermentum pulvinar pharetra. Aliquam eget augue ultricies, fermentum sem quis, interdum purus. Maecenas eu condimentum quam. Donec congue sollicitudin massa, tincidunt laoreet risus sagittis nec. Vestibulum quam lacus, elementum eu nibh aliquam, venenatis eleifend nibh. Nunc id posuere risus, eu volutpat ipsum. Suspendisse gravida at libero sit amet eleifend. Quisque feugiat mauris ut ullamcorper feugiat. ', 1200000, 'dfd324324rwer', '3432we24324rwewewe', '', 20, 50, 0, 'Baru', 10, '[\"Hitam\", \"Putih\", \"Biru\"]', '[\"S\", \"L\", \"XL\"]');

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('addresses.js'),
('bankSettings.js'),
('carts.js'),
('category1.js'),
('category2.js'),
('category3.js'),
('myAddresses.js'),
('notifications.js'),
('orders.js'),
('products.js'),
('settings.js'),
('transactions.js'),
('twilioSetting.js'),
('users.js'),
('waBlasHistory.js'),
('waBlasSetting.js');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `setting_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `setting_banner` text NOT NULL,
  `setting_whatsapp_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `deleted`, `setting_id`, `setting_banner`, `setting_whatsapp_number`) VALUES
(1, '2025-05-16 03:53:27', NULL, 0, 're32432ewr3454', '[\"https://firebasestorage.googleapis.com/v0/b/mendigitalkan.appspot.com/o/e-commerce%2Fdiscountbanner1.jpeg?alt=media&token=be3b9b94-e502-4e2b-8d97-9b86f2eab226\", \"https://firebasestorage.googleapis.com/v0/b/mendigitalkan.appspot.com/o/e-commerce%2Fdiscountbanner2.webp?alt=media&token=a3aa244e-72bf-44a9-bbe7-67d26030f991\"]', '6283168421426');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `transaction_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `transaction_price` int(11) NOT NULL,
  `transaction_order_id` varchar(255) NOT NULL,
  `transaction_user_id` varchar(255) NOT NULL,
  `transaction_ongkir_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `created_at`, `updated_at`, `deleted`, `transaction_id`, `transaction_price`, `transaction_order_id`, `transaction_user_id`, `transaction_ongkir_price`) VALUES
(1, '2025-05-16 03:53:27', NULL, 0, '4erew4245', 25000, '5referfw454', '66aba427-4b2b-437e-b427-65f2b3f1eca2', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `twilio_settings`
--

CREATE TABLE `twilio_settings` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `twilio_setting_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `twilio_setting_account_sid` varchar(255) NOT NULL,
  `twilio_setting_auth_token` varchar(255) NOT NULL,
  `twilio_setting_verify_service` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_name` varchar(80) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_whats_app_number` varchar(255) DEFAULT NULL,
  `user_photo` varchar(255) DEFAULT NULL,
  `user_role` enum('user','courier','office','admin','superAdmin') NOT NULL DEFAULT 'user',
  `user_coin` int(11) DEFAULT '0',
  `user_fcm_id` varchar(255) DEFAULT NULL,
  `user_gender` enum('pria','wanita') DEFAULT NULL,
  `user_partner_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `deleted`, `user_id`, `user_name`, `user_email`, `user_password`, `user_whats_app_number`, `user_photo`, `user_role`, `user_coin`, `user_fcm_id`, `user_gender`, `user_partner_code`) VALUES
(1, '2025-05-16 03:53:27', NULL, 0, '66aba427-4b2b-437e-b427-65f2b3f1eca2', 'user', 'user@mail.com', 'cf7c906bfbb48e72288fc016bac0e6ed58b0dc2a', '082122335544', 'https://cdn-icons-png.flaticon.com/512/149/149071.png', 'user', 10000, NULL, 'pria', 'AX-082122335544'),
(2, '2025-05-16 03:53:27', NULL, 0, '8f05dd7e-cda7-41fb-bc77-f6bb1eaf1fdc', 'admin', 'admin@mail.com', 'cf7c906bfbb48e72288fc016bac0e6ed58b0dc2a', '083234323243', 'https://cdn-icons-png.flaticon.com/512/149/149071.png', 'admin', 10000, NULL, 'wanita', 'AX-083234323243'),
(3, '2025-05-16 03:53:27', NULL, 0, 'd549913e-5620-42b8-8ed1-3d85ebf848d8', 'super admin', 'superadmin@mail.com', 'cf7c906bfbb48e72288fc016bac0e6ed58b0dc2a', '08332324343', 'https://cdn-icons-png.flaticon.com/512/149/149071.png', 'superAdmin', 10000, NULL, 'pria', 'AA-08332324343'),
(4, '2025-05-16 14:08:46', NULL, 0, '72f8902c-abf6-451e-8485-08732fbfc45a', 'Usera', 'a@maiil.com', 'c7ffa3bc306622e2b2a40241b4ff9152392b8016', '6281379574223', NULL, 'user', 0, 'ExponentPushToken[cr7TcJJCp65hLLSWndIitd]', 'pria', 'JH-6281379574223');

-- --------------------------------------------------------

--
-- Table structure for table `wa_blas_history`
--

CREATE TABLE `wa_blas_history` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `wa_blas_history_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `wa_blas_history_user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `wa_blas_history_user_name` varchar(100) NOT NULL,
  `wa_blas_history_user_phone` varchar(100) NOT NULL,
  `wa_blas_history_title` varchar(100) NOT NULL,
  `wa_blas_history_message` varchar(255) NOT NULL,
  `wa_blas_status` enum('success','fail') NOT NULL DEFAULT 'success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_blas_history`
--

INSERT INTO `wa_blas_history` (`id`, `created_at`, `updated_at`, `deleted`, `wa_blas_history_id`, `wa_blas_history_user_id`, `wa_blas_history_user_name`, `wa_blas_history_user_phone`, `wa_blas_history_title`, `wa_blas_history_message`, `wa_blas_status`) VALUES
(1, '2025-05-16 10:55:38', NULL, 0, 'e2b041b5-ae06-4959-9124-763dd5396e26', '66aba427-4b2b-437e-b427-65f2b3f1eca2', 'user', '082122335544', 'rr', 'rr', 'success'),
(2, '2025-05-16 10:55:38', NULL, 0, 'e2b041b5-ae06-4959-9124-763dd5396e26', '66aba427-4b2b-437e-b427-65f2b3f1eca2', 'user', '082122335544', 'rr', 'rr', 'success'),
(3, '2025-05-17 21:01:41', NULL, 0, '9b22d5ae-5640-4d55-8d32-9837a16a5825', '66aba427-4b2b-437e-b427-65f2b3f1eca2', 'user', '082122335544', 'test 123456', 'test 123456', 'success'),
(4, '2025-05-17 21:01:42', NULL, 0, '9b22d5ae-5640-4d55-8d32-9837a16a5825', '66aba427-4b2b-437e-b427-65f2b3f1eca2', 'user', '082122335544', 'test 123456', 'test 123456', 'success'),
(5, '2025-05-17 21:01:42', NULL, 0, 'b508ed25-3494-4418-8f88-7cff0e63d6f5', '72f8902c-abf6-451e-8485-08732fbfc45a', 'Usera', '6281379574223', 'test 123456', 'test 123456', 'success'),
(6, '2025-05-17 21:01:42', NULL, 0, 'b508ed25-3494-4418-8f88-7cff0e63d6f5', '72f8902c-abf6-451e-8485-08732fbfc45a', 'Usera', '6281379574223', 'test 123456', 'test 123456', 'success');

-- --------------------------------------------------------

--
-- Table structure for table `wa_blas_settings`
--

CREATE TABLE `wa_blas_settings` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `wa_blas_setting_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `wa_blas_setting_token` varchar(255) NOT NULL,
  `wa_blas_setting_server` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_blas_settings`
--

INSERT INTO `wa_blas_settings` (`id`, `created_at`, `updated_at`, `deleted`, `wa_blas_setting_id`, `wa_blas_setting_token`, `wa_blas_setting_server`) VALUES
(1, '2025-05-17 20:52:19', '2025-05-17 20:53:04', 0, 'fb22cdf2-0f5f-4a86-a4ff-0ed1439aaa39', 'IE2duW7OFOvl582x5H2Ckoy4Na7sdRIQS0wK4OgBIojQI18X60GqcoG', 'https://jkt.wablas.com/api');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_settings`
--
ALTER TABLE `bank_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category1`
--
ALTER TABLE `category1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category2`
--
ALTER TABLE `category2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category3`
--
ALTER TABLE `category3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_addresses`
--
ALTER TABLE `my_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `twilio_settings`
--
ALTER TABLE `twilio_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wa_blas_history`
--
ALTER TABLE `wa_blas_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wa_blas_settings`
--
ALTER TABLE `wa_blas_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_settings`
--
ALTER TABLE `bank_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category1`
--
ALTER TABLE `category1`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category2`
--
ALTER TABLE `category2`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category3`
--
ALTER TABLE `category3`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `my_addresses`
--
ALTER TABLE `my_addresses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `twilio_settings`
--
ALTER TABLE `twilio_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wa_blas_history`
--
ALTER TABLE `wa_blas_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wa_blas_settings`
--
ALTER TABLE `wa_blas_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
