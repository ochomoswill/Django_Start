-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2016 at 07:32 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_db_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add group', 4, 'add_group'),
(11, 'Can change group', 4, 'change_group'),
(12, 'Can delete group', 4, 'delete_group'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add facial_product', 7, 'add_facial_product'),
(20, 'Can change facial_product', 7, 'change_facial_product'),
(21, 'Can delete facial_product', 7, 'delete_facial_product'),
(22, 'Can add hair_product', 8, 'add_hair_product'),
(23, 'Can change hair_product', 8, 'change_hair_product'),
(24, 'Can delete hair_product', 8, 'delete_hair_product'),
(25, 'Can add accessory', 9, 'add_accessory'),
(26, 'Can change accessory', 9, 'change_accessory'),
(27, 'Can delete accessory', 9, 'delete_accessory'),
(28, 'Can add accessory_category', 10, 'add_accessory_category'),
(29, 'Can change accessory_category', 10, 'change_accessory_category'),
(30, 'Can delete accessory_category', 10, 'delete_accessory_category');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$30000$9aIWhQxqTfK0$e+vTP2cEWEE0lIvAasLloRljaDNtFywzX/lI9hcbrpA=', '2016-12-03 14:09:28.907989', 1, 'ochomoswill', '', '', 'ochomoswill@gmail.com', 1, 1, '2016-11-24 14:45:32.319650'),
(2, 'pbkdf2_sha256$30000$fUjuzS3iigTz$xxKKHxSVFphKqNELYwre4JaNY9EvT03H2OGlT1jJ4KQ=', NULL, 1, 'och', '', '', 'ochomoswill@gmail.com', 1, 1, '2016-11-29 20:58:12.056508'),
(3, 'pbkdf2_sha256$30000$BBhh4GpMXEIS$k/5Pf+uF988vic2nOnB/nxevquBDqSk/ab8wrxUmJSQ=', NULL, 1, 'juni', '', '', 'cortez12@gmail.com', 1, 1, '2016-12-01 15:37:37.034857');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cms_accessory`
--

CREATE TABLE `cms_accessory` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_accessory`
--

INSERT INTO `cms_accessory` (`id`, `name`, `description`, `image`, `price`, `slug`, `category_id`) VALUES
(1, 'Aura Vintage Ankle Chain Style 1', 'Aura Vintage Ankle Chain Style 1', 'accessories_upload/2016/12/02/Aura_vintage_Ankle_chain_style_1ksh_950.JPG', '950.00', 'aura-vintage-ankle-chain-style-1', 1),
(2, 'Aura Shoes Accessory Style 1 Gold', 'Aura Shoes Accessory Style 1 Gold', 'accessories_upload/2016/12/02/Aura_shoes_accessory_style_1_gold_ksh_650.JPG', '650.00', 'aura-shoes-accessory-style-1-gold', 1),
(3, 'Aura Shoes Accessory Style 1 Silver', 'Aura Shoes Accessory Style 1 Silver', 'accessories_upload/2016/12/02/Aura_shoes_accessory_style_1_silver_ksh_650.JPG', '650.00', 'aura-shoes-accessory-style-1-silver', 1),
(4, 'Aura Vintage Ankle Chain Style 2', 'Aura Vintage Ankle Chain Style 2', 'accessories_upload/2016/12/02/Aura_vintage_Ankle_chain_style_2ksh_850.JPG', '850.00', 'aura-vintage-ankle-chain-style-2', 1),
(5, 'Aura Vintage Ankle Chain Style 3', 'Aura Vintage Ankle Chain Style 3', 'accessories_upload/2016/12/02/Aura_vintage_Ankle_chain_style_3ksh_450.JPG', '450.00', 'aura-vintage-ankle-chain-style-3', 1),
(6, 'Aura Body Accessories Style 11', 'Aura Body Accessories Style 11', 'accessories_upload/2016/12/02/Aura_Body_Accessories_style_11ksh500.JPG', '500.00', 'aura-body-accessories-style-11', 2),
(7, 'Aura Body Accessories Style 1', 'Aura Body Accessories Style 1', 'accessories_upload/2016/12/02/Aura_Body_Accessories_style_1_ksh_900.JPG', '900.00', 'aura-body-accessories-style-1', 2),
(8, 'Aura Body Accessories Style 12', 'Aura Body Accessories Style 12', 'accessories_upload/2016/12/02/Aura_Body_Accessories_style_12ksh_700.JPG', '700.00', 'aura-body-accessories-style-12', 2),
(9, 'Aura Body Accessories Style 10', 'Aura Body Accessories Style 10', 'accessories_upload/2016/12/02/Aura_Body_Accessories_style_10ksh_950.JPG', '950.00', 'aura-body-accessories-style-10', 2),
(10, 'Aura Choker Style 3', 'Aura Choker Style 3', 'accessories_upload/2016/12/02/Aura_Choker_style_3_ksh650.JPG', '650.00', 'aura-choker-style-3', 3),
(11, 'Aura Choker Style 2', 'Aura Choker Style 2', 'accessories_upload/2016/12/02/Aura_choker_style_2_ksh750.JPG', '750.00', 'aura-choker-style-2', 3),
(12, 'Aura Choker Style 12', 'Aura Choker Style 12', 'accessories_upload/2016/12/02/Aura_Choker_Style_12ksh_800.JPG', '800.00', 'aura-choker-style-12', 3),
(13, 'Aura Choker Style 11', 'Aura Choker Style 11', 'accessories_upload/2016/12/02/Aura_Choker_Style_11ksh_750.JPG', '750.00', 'aura-choker-style-11', 3),
(14, 'Aura Punk Earring Style 15', 'Aura Punk Earring Style 15', 'accessories_upload/2016/12/02/Aura_punk__Earing_style_15_ksh600.JPG', '600.00', 'aura-punk-earring-style-15', 5),
(15, 'Aura Punk Earring Style 9', 'Aura Punk Earring Style 9', 'accessories_upload/2016/12/02/Aura_punk__Earing_style_9_ksh600.JPG', '600.00', 'aura-punk-earring-style-9', 5),
(16, 'Aura Punk Earring Style 4', 'Aura Punk Earring Style 4', 'accessories_upload/2016/12/02/Aura_punk__Earing_style_4_ksh600.JPG', '600.00', 'aura-punk-earring-style-4', 5),
(17, 'Aura Punk Earing Style 8', 'Aura Punk Earing Style 8', 'accessories_upload/2016/12/02/Aura_punk__Earing_style_8_ksh600.JPG', '600.00', 'aura-punk-earing-style-8', 5),
(18, 'Hair Accessories Style 33', 'Hair Accessories Style 33', 'accessories_upload/2016/12/02/Hair_Accessories_style_33ksh800.JPG', '800.00', 'hair-accessories-style-33', 4),
(19, 'Hair Accessories Style 10', 'Hair Accessories Style 10', 'accessories_upload/2016/12/02/Hair_Accessories_style_10ksh550.JPG', '550.00', 'hair-accessories-style-10', 4),
(20, 'Hair Accessories Style 28', 'Hair Accessories style 28(ksh800)', 'accessories_upload/2016/12/02/Hair_Accessories_style_28ksh800.JPG', '800.00', 'hair-accessories-style-28', 4),
(21, 'Hair Accessories Style 23', 'Hair Accessories Style 23', 'accessories_upload/2016/12/02/Hair_Accessories_style_23ksh500.JPG', '500.00', 'hair-accessories-style-23', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cms_accessory_category`
--

CREATE TABLE `cms_accessory_category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_accessory_category`
--

INSERT INTO `cms_accessory_category` (`id`, `name`, `slug`) VALUES
(1, 'Ankle Chains', 'ankle-chains'),
(2, 'Body Accessory', 'body-accessory'),
(3, 'Chokers', 'chokers'),
(4, 'Hair Accessories', 'hair-accessories'),
(5, 'Earings', 'earings');

-- --------------------------------------------------------

--
-- Table structure for table `cms_facial_product`
--

CREATE TABLE `cms_facial_product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `slug` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_facial_product`
--

INSERT INTO `cms_facial_product` (`id`, `name`, `description`, `image`, `price`, `slug`) VALUES
(1, 'Chamomile Goat Milk Soap', 'Chamomile Goat Milk Soap', 'facialproducts_upload/2016/11/24/chamomile_gost_milk_soap_small_ksh_500.jpg', '500.00', 'chamomile-goat-milk-soap'),
(2, 'Green Tea and Jasmine Goat Milk Soap', 'Green Tea and Jasmine Goat Milk Soap', 'facialproducts_upload/2016/11/24/Green_tea_and_jasmine_goatmilk_soap_small_ksh_500.jpg', '400.00', 'green-tea-and-jasmine-goat-milk-soap'),
(4, 'Coffee Goat Milk Soap', 'Coffee Goat Milk Soap', 'facialproducts_upload/2016/11/24/cofee_goat_milk_soap_small_ksh_500.jpg', '500.00', 'coffee-goat-milk-soap'),
(5, 'Oatmeal and Honey Goat Milk Soap', 'Oatmeal and Honey Goat Milk Soap', 'facialproducts_upload/2016/11/24/Oatmeal_and_honey_gost_milk_soap_small_ksh_500.jpg', '200.00', 'oatmeal-and-honey-goat-milk-soap'),
(6, 'Original with Jojoba Goat Milk Soap', 'Original with Jojoba Goat Milk Soap', 'facialproducts_upload/2016/11/24/Original_with_jojoba_goat_milk_soap_small_ksh_500.jpg', '400.00', 'original-with-jojoba-goat-milk-soap');

-- --------------------------------------------------------

--
-- Table structure for table `cms_hair_product`
--

CREATE TABLE `cms_hair_product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `slug` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_hair_product`
--

INSERT INTO `cms_hair_product` (`id`, `name`, `description`, `image`, `price`, `slug`) VALUES
(1, 'Aura Thermal Treatment Cap', 'Aura Thermal Treatment Cap', 'hairproducts_upload/2016/12/02/aura_thermal_treatment_cap.jpg', '900.00', 'aura-thermal-treatment-cap'),
(2, 'Caffeine Velle Shampoo', 'Caffeine Velle Shampoo', 'hairproducts_upload/2016/12/02/caffeine_velle_shampoo.jpg', '900.00', 'caffeine-velle-shampoo'),
(3, 'Hot Oil', 'Hot Oil', 'hairproducts_upload/2016/12/02/hot_oil.jpg', '900.00', 'hot-oil');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2016-11-24 14:47:00.513340', '1', 'Chamomile Goat Milk Soap', 1, '[{"added": {}}]', 7, 1),
(2, '2016-11-24 14:47:28.788754', '2', 'Green Tea and Jasmine Goat Milk Soap', 1, '[{"added": {}}]', 7, 1),
(3, '2016-11-24 14:50:39.928281', '3', 'Test', 1, '[{"added": {}}]', 7, 1),
(4, '2016-11-24 15:30:14.885459', '3', 'Test', 3, '', 7, 1),
(5, '2016-11-24 15:31:38.841359', '4', 'Coffee Goat Milk Soap', 1, '[{"added": {}}]', 7, 1),
(6, '2016-11-24 15:32:19.909279', '5', 'Oatmeal and Honey Goat Milk Soap', 1, '[{"added": {}}]', 7, 1),
(7, '2016-11-24 15:32:48.195487', '6', 'Original with Jojoba Goat Milk Soap', 1, '[{"added": {}}]', 7, 1),
(8, '2016-12-02 19:28:44.092468', '1', 'Ankle Chains', 1, '[{"added": {}}]', 10, 1),
(9, '2016-12-02 19:29:17.485403', '2', 'Body Accessory', 1, '[{"added": {}}]', 10, 1),
(10, '2016-12-02 19:30:38.768260', '3', 'Chokers', 1, '[{"added": {}}]', 10, 1),
(11, '2016-12-02 19:31:31.042958', '4', 'Hair Accessories', 1, '[{"added": {}}]', 10, 1),
(12, '2016-12-02 19:31:49.888918', '5', 'Earings', 1, '[{"added": {}}]', 10, 1),
(13, '2016-12-02 19:36:07.597346', '1', 'Aura Vintage Ankle Chain Style 1', 1, '[{"added": {}}]', 9, 1),
(14, '2016-12-02 19:38:05.900154', '2', 'Aura Shoes Accessory Style 1 Gold', 1, '[{"added": {}}]', 9, 1),
(15, '2016-12-02 19:39:45.858193', '3', 'Aura Shoes Accessory Style 1 Silver', 1, '[{"added": {}}]', 9, 1),
(16, '2016-12-02 19:41:20.999712', '4', 'Aura Vintage Ankle Chain Style 2', 1, '[{"added": {}}]', 9, 1),
(17, '2016-12-02 19:42:45.011484', '5', 'Aura Vintage Ankle Chain Style 3', 1, '[{"added": {}}]', 9, 1),
(18, '2016-12-02 19:47:32.425382', '6', 'Aura Body Accessories Style 11', 1, '[{"added": {}}]', 9, 1),
(19, '2016-12-02 19:48:21.344144', '7', 'Aura Body Accessories Style 1', 1, '[{"added": {}}]', 9, 1),
(20, '2016-12-02 19:50:31.522654', '8', 'Aura Body Accessories Style 12', 1, '[{"added": {}}]', 9, 1),
(21, '2016-12-02 19:52:06.264195', '9', 'Aura Body Accessories Style 10', 1, '[{"added": {}}]', 9, 1),
(22, '2016-12-02 19:55:09.043905', '10', 'Aura Choker Style 3', 1, '[{"added": {}}]', 9, 1),
(23, '2016-12-02 19:55:51.737409', '11', 'Aura Choker Style 2', 1, '[{"added": {}}]', 9, 1),
(24, '2016-12-02 19:56:51.264704', '12', 'Aura Choker Style 12', 1, '[{"added": {}}]', 9, 1),
(25, '2016-12-02 19:57:54.006006', '13', 'Aura Choker Style 11', 1, '[{"added": {}}]', 9, 1),
(26, '2016-12-02 19:59:24.433760', '14', 'Aura Punk Earring Style 15', 1, '[{"added": {}}]', 9, 1),
(27, '2016-12-02 20:00:16.707716', '15', 'Aura Punk Earring Style 9', 1, '[{"added": {}}]', 9, 1),
(28, '2016-12-02 20:01:24.251581', '16', 'Aura Punk Earring Style 4', 1, '[{"added": {}}]', 9, 1),
(29, '2016-12-02 20:06:06.346828', '17', 'Aura Punk Earing Style 8', 1, '[{"added": {}}]', 9, 1),
(30, '2016-12-02 20:07:15.509425', '18', 'Hair Accessories Style 33', 1, '[{"added": {}}]', 9, 1),
(31, '2016-12-02 20:08:01.348173', '19', 'Hair Accessories Style 10', 1, '[{"added": {}}]', 9, 1),
(32, '2016-12-02 20:09:09.907338', '20', 'Hair Accessories Style 28', 1, '[{"added": {}}]', 9, 1),
(33, '2016-12-02 20:10:18.791320', '21', 'Hair Accessories Style 23', 1, '[{"added": {}}]', 9, 1),
(34, '2016-12-02 20:12:25.122282', '1', 'Aura Thermal Treatment Cap', 1, '[{"added": {}}]', 8, 1),
(35, '2016-12-02 20:13:24.890656', '2', 'Caffeine Velle Shampoo', 1, '[{"added": {}}]', 8, 1),
(36, '2016-12-02 20:13:57.897790', '3', 'Hot Oil', 1, '[{"added": {}}]', 8, 1),
(37, '2016-12-02 20:14:01.465780', '3', 'Hot Oil', 2, '[]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'user'),
(4, 'auth', 'group'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'cms', 'facial_product'),
(8, 'cms', 'hair_product'),
(9, 'cms', 'accessory'),
(10, 'cms', 'accessory_category');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-11-24 14:44:10.864834'),
(2, 'auth', '0001_initial', '2016-11-24 14:44:11.426435'),
(3, 'admin', '0001_initial', '2016-11-24 14:44:11.535636'),
(4, 'admin', '0002_logentry_remove_auto_add', '2016-11-24 14:44:11.551236'),
(5, 'contenttypes', '0002_remove_content_type_name', '2016-11-24 14:44:11.613636'),
(6, 'auth', '0002_alter_permission_name_max_length', '2016-11-24 14:44:11.677036'),
(7, 'auth', '0003_alter_user_email_max_length', '2016-11-24 14:44:11.692636'),
(8, 'auth', '0004_alter_user_username_opts', '2016-11-24 14:44:11.708236'),
(9, 'auth', '0005_alter_user_last_login_null', '2016-11-24 14:44:11.770636'),
(10, 'auth', '0006_require_contenttypes_0002', '2016-11-24 14:44:11.770636'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2016-11-24 14:44:11.786236'),
(12, 'auth', '0008_alter_user_username_max_length', '2016-11-24 14:44:11.801836'),
(13, 'cms', '0001_initial', '2016-11-24 14:44:11.879836'),
(14, 'cms', '0002_remove_facial_product_slug', '2016-11-24 14:44:11.895436'),
(15, 'cms', '0003_facial_product_slug', '2016-11-24 14:44:11.944236'),
(16, 'cms', '0004_auto_20161124_1739', '2016-11-24 14:44:11.944236'),
(17, 'sessions', '0001_initial', '2016-11-24 14:44:11.991037'),
(18, 'cms', '0005_auto_20161201_1835', '2016-12-01 15:35:17.193105');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('sjq27rczwg3vgt4307rde5jr7rupy01d', 'ZGI0ZTllNjkxOWZjYTJiNDFiZDY5MzhlYTVkYTcyZDYxMDBhYjY4Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE1YTA5OTZmOGVhNDQ1ZWZkNTcyM2VhMzVhOWYxNTY1YmFkN2IxMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-12-08 14:46:28.279062'),
('pireevpjcsydebbcapfq7hidqcwmrc12', 'OWRmNTJiYzdjZTA0NzFlYzRhYTA4ZDBhMGUxN2E4ZDBhYzk5ZGU3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNWEwOTk2ZjhlYTQ0NWVmZDU3MjNlYTM1YTlmMTU2NWJhZDdiMTIxIn0=', '2016-12-15 16:09:34.008024'),
('3n6ql9ja3ddz98zjky61luch5pv9bynw', 'NGZlOWI1MDI0NWEwZGU4NDljMzU5NTk1NDhiOTU2YTBmYTdlZGFlNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE1YTA5OTZmOGVhNDQ1ZWZkNTcyM2VhMzVhOWYxNTY1YmFkN2IxMjEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-12-16 08:55:12.596148'),
('3al2fri0oetpsqvnbrwm5scx0l6djnag', 'NGZlOWI1MDI0NWEwZGU4NDljMzU5NTk1NDhiOTU2YTBmYTdlZGFlNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE1YTA5OTZmOGVhNDQ1ZWZkNTcyM2VhMzVhOWYxNTY1YmFkN2IxMjEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-12-16 08:55:18.888916'),
('vhizafql9ckluhc84lg3xqtx40zbpj91', 'NGJmOWJmNzgwZWIwNjRlZDAyNDUzZWUyM2Q3YWQ3MWRjOTI5MDFmMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTVhMDk5NmY4ZWE0NDVlZmQ1NzIzZWEzNWE5ZjE1NjViYWQ3YjEyMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-12-16 19:26:11.804018'),
('1ubuzijazg3wbnbx8ae2n2k34dpe2dvz', 'ZGI0ZTllNjkxOWZjYTJiNDFiZDY5MzhlYTVkYTcyZDYxMDBhYjY4Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE1YTA5OTZmOGVhNDQ1ZWZkNTcyM2VhMzVhOWYxNTY1YmFkN2IxMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-12-17 14:09:28.911964');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissions_0e939a4f` (`group_id`),
  ADD KEY `auth_group_permissions_8373b171` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  ADD KEY `auth_permission_417f1b1c` (`content_type_id`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_e8701ad4` (`user_id`),
  ADD KEY `auth_user_groups_0e939a4f` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  ADD KEY `auth_user_user_permissions_8373b171` (`permission_id`);

--
-- Indexes for table `cms_accessory`
--
ALTER TABLE `cms_accessory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_accessory_2dbcba41` (`slug`),
  ADD KEY `cms_accessory_b583a629` (`category_id`);

--
-- Indexes for table `cms_accessory_category`
--
ALTER TABLE `cms_accessory_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `cms_facial_product`
--
ALTER TABLE `cms_facial_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `cms_hair_product`
--
ALTER TABLE `cms_hair_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_417f1b1c` (`content_type_id`),
  ADD KEY `django_admin_log_e8701ad4` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_accessory`
--
ALTER TABLE `cms_accessory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `cms_accessory_category`
--
ALTER TABLE `cms_accessory_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cms_facial_product`
--
ALTER TABLE `cms_facial_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cms_hair_product`
--
ALTER TABLE `cms_hair_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
