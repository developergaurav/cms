-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 20, 2014 at 06:31 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` char(36) NOT NULL,
  `extension` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `extension`) VALUES
('54226801-ca44-4317-8474-046312142117', 'jpeg'),
('54226aa8-ca40-452b-aa16-55d112142117', 'jpeg'),
('54226abc-6a04-4109-bed8-0d9a12142117', 'jpeg'),
('54226aee-5580-4d11-9ad7-5be612142117', 'jpeg'),
('54227e2b-4c68-40e4-92eb-6d4512142117', 'jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `location` tinytext NOT NULL,
  `type` tinytext NOT NULL,
  `link_data` text NOT NULL,
  `is_deleteable` tinytext NOT NULL,
  `order` int(11) NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `title`, `slug`, `location`, `type`, `link_data`, `is_deleteable`, `order`, `status`) VALUES
('5437f5a6-62fc-4127-8611-115ecdd1d5ac', '', 'HOME', '', 'header', 'functional', 'sites/home', 'yes,no', 1, 'active'),
('5437f9b3-8104-430f-b02f-10eecdd1d5ac', '', 'BLOG', '', 'header', 'functional', 'blog', 'yes,no', 2, 'active'),
('543e264e-f560-45c6-bf95-04b1cdd1d5ac', '', 'BRANDS', '', 'header', 'functional', 'ecommerce/brands', 'yes,no', 3, 'active'),
('543e2664-7d94-45be-83df-04b2cdd1d5ac', '', 'DEALS', '', 'header', 'functional', 'ecommerce/deals', 'yes,no', 0, 'active'),
('543e2678-94e4-420d-8128-04afcdd1d5ac', '', 'LOOKBOOK', '', 'header', 'functional', 'ecommerce/lookbook', 'yes,no', 0, 'active'),
('543e2699-fad4-49ff-be22-04b0cdd1d5ac', '', 'CONTACT', '', 'header', 'functional', 'sites/contacts', 'yes,no', 0, 'active'),
('543e26ac-6e8c-42a3-9cdc-2012cdd1d5ac', '', 'STORES', '', 'header', 'functional', 'sites/stores', 'yes,no', 0, 'active'),
('543e303f-4b58-4675-9c7f-04b0cdd1d5ac', '', 'Terms & Conditions', '', 'footer', 'content', '5421aecf-6b44-4fe6-b156-047312142117', 'yes,yes', 0, 'active'),
('543e30e4-9588-49f0-b38c-12cccdd1d5ac', '', 'About Us', '', 'footer', 'content', '5421b67d-62a8-4e0a-87f9-0b3c12142117', 'yes,yes', 0, 'active'),
('543f493e-b0d0-4f75-a47f-04bbcdd1d5ac', '', 'WEBSHOP', '', 'header', 'functional', 'shop', 'yes,no', 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` char(36) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `accesslist` mediumtext NOT NULL,
  `is_deletable` tinytext NOT NULL,
  `status` tinytext NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `description`, `accesslist`, `is_deletable`, `status`, `created`) VALUES
('54217bff-7358-4187-8e9c-0ae112142117', 'Web Manager', 'Access to web and menus', '{"web_pages":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"menus":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete","admin_sort_menu":"admin_sort_menu"},"users":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"roles":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"system_settings":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"site_settings":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"brands":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"categories":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"attributes":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"types":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"stores":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"product_attributes":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"products":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"attribute_values":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"attribute_labels":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"product_orders":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"posts":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"comments":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"}}', 'no', 'active', '2014-09-23'),
('5423b276-712c-4958-b2c4-1034cdd1d5ac', 'System Admin', 'access everything with codding power', '{"web_pages":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"menus":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"users":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"roles":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"system_settings":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"},"site_settings":{"admin_index":"admin_index","admin_add":"admin_add","admin_edit":"admin_edit","admin_delete":"admin_delete"}}', 'no_no', 'active', '2014-09-25');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE IF NOT EXISTS `site_settings` (
  `id` char(36) NOT NULL,
  `site_title` varchar(100) NOT NULL,
  `site_slogan` varchar(200) NOT NULL,
  `meta_key` varchar(60) NOT NULL,
  `meta_description` varchar(150) NOT NULL,
  `site_author` varchar(100) NOT NULL,
  `site_author_email` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_address` varchar(200) NOT NULL,
  `company_loaction` varchar(100) NOT NULL,
  `phones` varchar(200) NOT NULL,
  `emails` varchar(200) NOT NULL,
  `faxes` varchar(200) NOT NULL,
  `google_analytics_data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `site_title`, `site_slogan`, `meta_key`, `meta_description`, `site_author`, `site_author_email`, `company_name`, `company_address`, `company_loaction`, `phones`, `emails`, `faxes`, `google_analytics_data`) VALUES
('54219a9b-f910-4d8c-9515-0ae112142117', 'foo', 'dsf', 'dsf', 'sdf', 'dsf', 'a@adf.com', 'dsf', 'dsf', 'dsf,dsfd', 'dsf', 'df@adsf.com', 'dsf', '{"Key":"test","Gmail":"zubayer177@gmail.com","Password":"Zubayer@29#"}');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` char(36) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `developer_email` varchar(100) NOT NULL,
  `system_author_name` varchar(100) NOT NULL,
  `developer_company` varchar(100) NOT NULL,
  `pagination_no` int(11) NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `domain`, `developer_email`, `system_author_name`, `developer_company`, `pagination_no`, `status`) VALUES
('54219b4c-8ed8-492e-a456-047412142117', 'xx.com', 'adsf@dsf.com', 'asdf', 'dskfd', 10, 'development');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(64) NOT NULL,
  `personal_details` text NOT NULL,
  `role_id` char(36) NOT NULL,
  `status` tinytext NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `personal_details`, `role_id`, `status`, `created`) VALUES
('542391f1-037c-41a3-a270-0cadcdd1d5ac', 'admin@timeout.com', '$2a$10$ClB3oSPY4q7guK1pIjp0nub7s4eXnzB4eyZJAzonLAQdHJ83vlEuq', '{"first_name":"abdullah","last_name":"zubayer","date_of_birth":"1988-12-14","blood_group":"A+","gender":"male","maritial_status":"single","current_address":{"address_line_1":"Mirpur","address_line_2":"Dhaka"},"cell":"+8801731921635","fax":"none","skype":"zubayer29"}', '54217bff-7358-4187-8e9c-0ae112142117', 'active', '2014-09-25 03:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `web_pages`
--

CREATE TABLE IF NOT EXISTS `web_pages` (
  `id` char(36) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `meta_keys` varchar(60) NOT NULL,
  `meta_description` varchar(150) NOT NULL,
  `description` mediumtext NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_pages`
--

INSERT INTO `web_pages` (`id`, `title`, `slug`, `meta_keys`, `meta_description`, `description`, `status`) VALUES
('5421aecf-6b44-4fe6-b156-047312142117', 'Contact Us', 'Contact_Us', 'contact us', 'contact us contact us ', '<p>Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us.&nbsp;</p><p><br></p><p>Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us.&nbsp;</p><p><br></p><p>Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. v</p><p>Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us.&nbsp;</p><p>Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. Lorem ipsum de contact us. <br></p>', 'active'),
('5421b67d-62a8-4e0a-87f9-0b3c12142117', 'About Us', 'About_Us_2', 'about us', 'about us', '<p>Lorem ipsum de about us. Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.</p><p><br></p><p><br></p><p>Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.</p><p><br></p><p>Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.</p><p><br></p><p>Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.Lorem ipsum de about us.<br></p>', 'active');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
