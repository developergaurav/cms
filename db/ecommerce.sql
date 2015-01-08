-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 06, 2015 at 07:01 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE IF NOT EXISTS `attributes` (
  `id` char(36) NOT NULL,
  `type_id` char(36) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `type_id`, `title`) VALUES
('54801033-be08-4a63-87eb-639acdd1d5ac', '54801033-f5a4-4916-b0a5-639acdd1d5ac', 'attr 1'),
('54803bf0-afe8-4d33-8472-7264cdd1d5ac', '54803bf0-0ef8-4658-8400-7264cdd1d5ac', 'attr 1');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE IF NOT EXISTS `attribute_values` (
  `id` char(36) NOT NULL,
  `attribute_id` char(36) NOT NULL,
  `value` varchar(250) NOT NULL,
  `has_price` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `has_price`) VALUES
('54801033-4c9c-4133-a445-639acdd1d5ac', '54801033-be08-4a63-87eb-639acdd1d5ac', 'attr1 val 1', 'no'),
('54803bf0-07cc-4394-9e96-7264cdd1d5ac', '54803bf0-afe8-4d33-8472-7264cdd1d5ac', 'attr val 1', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
  `id` char(36) NOT NULL,
  `title` varchar(200) NOT NULL,
  `meta_keys` varchar(60) NOT NULL,
  `meta_description` varchar(150) NOT NULL,
  `description` varchar(450) NOT NULL,
  `image_extension` text NOT NULL,
  `order` int(11) NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `meta_keys`, `meta_description`, `description`, `image_extension`, `order`, `status`) VALUES
('5476f9ee-7154-4ddd-85ac-1d86cdd1d5ac', 'dsf', 'dsf', 'dsfdsf', '<p>dsfdsf<br></p>', 'jpeg', 0, 'active'),
('5476fa11-9e2c-47bd-80de-0d54cdd1d5ac', 'dsf', 'dsf', 'dsfd', '<p>dsfdsf<br></p>', 'jpeg', 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `title` varchar(200) NOT NULL,
  `meta_keys` varchar(60) NOT NULL,
  `meta_description` varchar(150) NOT NULL,
  `description` varchar(450) NOT NULL,
  `image_extension` text NOT NULL,
  `order` int(11) NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `title`, `meta_keys`, `meta_description`, `description`, `image_extension`, `order`, `status`) VALUES
('547da4f6-b03c-4b31-b64c-2d7fcdd1d5ac', '', 'cate 1', 'dsf', 'dsfdsf', '<p>dsfd<br></p>', 'jpeg', 1, 'active'),
('547dc53a-1344-4fdd-836e-3ae8cdd1d5ac', '547da4f6-b03c-4b31-b64c-2d7fcdd1d5ac', 'cate 12', 'dsf', 'dsf', '<p>dsf<br></p>', '', 3, 'active'),
('54857ce7-78f4-46dd-888a-3574cdd1d5ac', '54857d01-a08c-4032-868f-0dbdcdd1d5ac', 'cat 21', 'fdsf', 'dsf', '<p>dsf<br></p>', '', 5, 'active'),
('54857d01-a08c-4032-868f-0dbdcdd1d5ac', '', 'parent 2', 'dsf', 'dsf', '<p>df<br></p>', '', 2, 'active'),
('5485882a-c064-4d27-b247-508fcdd1d5ac', '54857d01-a08c-4032-868f-0dbdcdd1d5ac', 'dsf', 'dfd', 'fdsf', '<p>df<br></p>', '', 8, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` char(36) NOT NULL,
  `type_id` char(36) NOT NULL,
  `title` varchar(200) NOT NULL,
  `product_code` varchar(30) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `meta_keys` varchar(60) NOT NULL,
  `meta_description` varchar(160) NOT NULL,
  `description` varchar(500) NOT NULL,
  `options` text NOT NULL,
  `price` float NOT NULL,
  `order` int(11) NOT NULL,
  `status` tinytext NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `type_id`, `title`, `product_code`, `slug`, `meta_keys`, `meta_description`, `description`, `options`, `price`, `order`, `status`, `created`, `modified`) VALUES
('5472f028-09cc-4fc1-8e94-0d07cdd1d5ac', '54801033-f5a4-4916-b0a5-639acdd1d5ac', 'Shirt 2', 'dsfdsfdsfds', '', 'Shirt 2', 'Shirt 2', '<p>Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. v</p><p>Lorem ipsum de product. Lorem ipsum de product. Lorem ipsum de product. Lorem ips', '{"discount":[{"type":"percentage"},{"amount":"30"},{"finalDiscount":"59.70"}]}', 199, 0, 'active', '2014-12-29', '2014-12-29'),
('54a0ebdd-8b84-47f5-bc32-0cefcdd1d5ac', '54801033-f5a4-4916-b0a5-639acdd1d5ac', 'dsfd', 'sdfs', '', 'dsfds', 'dsf', '<p>dsf<br></p>', '{"discount":[{"type":"? string:? string:? undefined:undefined ? ? ?"},{"amount":""},{"finalDiscount":"0"}]}', 49.99, 0, 'active', '2014-12-29', '2014-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE IF NOT EXISTS `product_attributes` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `attribute_id` char(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `attribute_id`) VALUES
('54a0e805-772c-4c9a-94cc-1886cdd1d5ac', '5472f028-09cc-4fc1-8e94-0d07cdd1d5ac', '54801033-be08-4a63-87eb-639acdd1d5ac'),
('54a12a3b-2064-4ba9-a66b-0cf2cdd1d5ac', '54a0ebdd-8b84-47f5-bc32-0cefcdd1d5ac', '54801033-be08-4a63-87eb-639acdd1d5ac');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE IF NOT EXISTS `product_attribute_values` (
  `id` char(36) NOT NULL,
  `product_attribute_id` char(36) NOT NULL,
  `attribute_value_id` char(36) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `product_attribute_id`, `attribute_value_id`, `price`) VALUES
('54a0e805-cc54-4f03-bfe5-1886cdd1d5ac', '54a0e805-772c-4c9a-94cc-1886cdd1d5ac', '54801033-4c9c-4133-a445-639acdd1d5ac', 0),
('54a12a3b-6e84-4402-8d46-0cf2cdd1d5ac', '54a12a3b-2064-4ba9-a66b-0cf2cdd1d5ac', '54801033-4c9c-4133-a445-639acdd1d5ac', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_brands`
--

CREATE TABLE IF NOT EXISTS `product_brands` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `brand_id` char(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_brands`
--

INSERT INTO `product_brands` (`id`, `product_id`, `brand_id`) VALUES
('54a0e805-1070-40b8-9aef-1886cdd1d5ac', '5472f028-09cc-4fc1-8e94-0d07cdd1d5ac', '5476fa11-9e2c-47bd-80de-0d54cdd1d5ac'),
('54a0e805-b058-431e-9492-1886cdd1d5ac', '5472f028-09cc-4fc1-8e94-0d07cdd1d5ac', '5476f9ee-7154-4ddd-85ac-1d86cdd1d5ac'),
('54a12a3b-84ec-4064-99d4-0cf2cdd1d5ac', '54a0ebdd-8b84-47f5-bc32-0cefcdd1d5ac', '5476fa11-9e2c-47bd-80de-0d54cdd1d5ac');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `category_id` char(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`) VALUES
('54a0e805-386c-4af8-a01b-1886cdd1d5ac', '5472f028-09cc-4fc1-8e94-0d07cdd1d5ac', '547da4f6-b03c-4b31-b64c-2d7fcdd1d5ac'),
('54a12a3b-0ef4-4ee1-87c5-0cf2cdd1d5ac', '54a0ebdd-8b84-47f5-bc32-0cefcdd1d5ac', '547da4f6-b03c-4b31-b64c-2d7fcdd1d5ac');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE IF NOT EXISTS `product_images` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `extension` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `extension`) VALUES
('54a0e805-bb74-4c21-81a2-1886cdd1d5ac', '5472f028-09cc-4fc1-8e94-0d07cdd1d5ac', 'jpeg'),
('54a12a3b-1328-4e46-b17b-0cf2cdd1d5ac', '54a0ebdd-8b84-47f5-bc32-0cefcdd1d5ac', 'jpeg'),
('54a12a3b-c2ac-45a8-8885-0cf2cdd1d5ac', '54a0ebdd-8b84-47f5-bc32-0cefcdd1d5ac', 'jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE IF NOT EXISTS `product_orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `client_detail` text NOT NULL,
  `order_detail` text NOT NULL,
  `shipping_detail` longtext NOT NULL,
  `payment_detail` text NOT NULL,
  `payment_status` tinytext NOT NULL,
  `status` tinytext NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `complete_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5067 ;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `client_detail`, `order_detail`, `shipping_detail`, `payment_detail`, `payment_status`, `status`, `order_date`, `complete_date`) VALUES
(5063, '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"1234569\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"attr 1":"attr1 val 1"},"cartThumbImage":"http:\\/\\/localhost\\/uycms_service\\/img\\/site\\/products\\/5481aac3-f7a4-4ca0-8f92-1d13cdd1d5ac.jpeg","product_id":"5472f028-09cc-4fc1-8e94-0d07cdd1d5ac","product_title":"Shirt 2","cost":"199","quantity":"1","unitPrice":"199"}]', '{"ship_address_1":"foo","ship_address_2":"foo","zip":"12345"}', '{"Status":"OK","StatusCode":"Payment Completed simulation via Test Mode","Merchant":"25227","OrderID":"5063","PaymentID":"13355650","Reference":"Timeout","TransactionID":"13355650","Checksum":"62a67524d38f0190c79bcb6ddb64b39b7fc4a6fb","PaymentMethod":"CREDITCARD","order_id":"5063"}', 'OK', 'ordered', '2014-12-05 14:13:39', '0000-00-00 00:00:00'),
(5064, '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"1234569\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"attr 1":"attr1 val 1"},"cartThumbImage":"http:\\/\\/localhost\\/uycms_service\\/img\\/site\\/products\\/5481aac3-f7a4-4ca0-8f92-1d13cdd1d5ac.jpeg","product_id":"5472f028-09cc-4fc1-8e94-0d07cdd1d5ac","product_title":"Shirt 2","cost":"199","quantity":"1","unitPrice":"199"}]', '{"ship_address_1":"foo","ship_address_2":"foo","zip":"12345"}', '{"Status":"OK","StatusCode":"Payment Completed simulation via Test Mode","Merchant":"25227","OrderID":"5064","PaymentID":"13356993","Reference":"Timeout","TransactionID":"13356993","Checksum":"9c3d9fe05aae27f3d77188aabc9b39feb0b70591","PaymentMethod":"GIFTCARD","order_id":"5064"}', 'OK', 'ordered', '2014-12-05 15:41:15', '0000-00-00 00:00:00'),
(5065, '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"1234569\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"attr 1":"attr1 val 1"},"cartThumbImage":"http:\\/\\/localhost\\/uycms_service\\/img\\/site\\/products\\/5481aac3-f7a4-4ca0-8f92-1d13cdd1d5ac.jpeg","product_id":"5472f028-09cc-4fc1-8e94-0d07cdd1d5ac","product_title":"Shirt 2","cost":"398","quantity":"2","unitPrice":"199"}]', '{"ship_address_1":"foo","ship_address_2":"foo","zip":"12345"}', '{"Status":"OK","StatusCode":"Payment Completed simulation via Test Mode","Merchant":"25227","OrderID":"5065","PaymentID":"13357125","Reference":"Timeout","TransactionID":"13357125","Checksum":"7546474c598e0f1434743a83fff969c2dfb7f990","PaymentMethod":"CREDITCARD","order_id":"5065"}', 'OK', 'ordered', '2014-12-05 15:51:22', '0000-00-00 00:00:00'),
(5066, '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"1234569\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"attr 1":"attr1 val 1"},"cartThumbImage":"http:\\/\\/localhost\\/uycms_service\\/img\\/site\\/products\\/5481aac3-f7a4-4ca0-8f92-1d13cdd1d5ac.jpeg","product_id":"5472f028-09cc-4fc1-8e94-0d07cdd1d5ac","product_title":"Shirt 2","cost":"199","quantity":"1","unitPrice":"199"}]', '{"ship_address_1":"foo","ship_address_2":"foo","zip":"12345"}', '{"Status":"OK","StatusCode":"Payment Completed simulation via Test Mode","Merchant":"25227","OrderID":"5066","PaymentID":"13357143","Reference":"Timeout","TransactionID":"13357143","Checksum":"65f19e2578cbcb1d2f670729442dc57b36b7d932","PaymentMethod":"DDEBIT","order_id":"5066"}', 'OK', 'ordered', '2014-12-05 15:53:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_order_notes`
--

CREATE TABLE IF NOT EXISTS `product_order_notes` (
  `id` char(36) NOT NULL,
  `product_order_id` char(36) NOT NULL,
  `note` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `related_products`
--

CREATE TABLE IF NOT EXISTS `related_products` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `related_product` char(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `related_products`
--

INSERT INTO `related_products` (`id`, `product_id`, `related_product`) VALUES
('54a12a3b-d1e0-4667-9485-0cf2cdd1d5ac', '54a0ebdd-8b84-47f5-bc32-0cefcdd1d5ac', '5472f028-09cc-4fc1-8e94-0d07cdd1d5ac');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE IF NOT EXISTS `shipping_methods` (
  `id` char(36) NOT NULL,
  `title` varchar(50) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `title`, `price`) VALUES
('54a38050-570c-4237-a9dd-39f6cdd1d5ac', 'In Denmark', 10),
('54a3805c-8a40-44d9-91dd-39eacdd1d5ac', 'Outer Denmark', 20);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE IF NOT EXISTS `stores` (
  `id` char(36) NOT NULL,
  `title` varchar(200) NOT NULL,
  `details` text NOT NULL,
  `latitude` float NOT NULL,
  `longitude` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `title`, `details`, `latitude`, `longitude`, `order`, `status`) VALUES
('54770aa4-cab0-4711-9d6b-04b5cdd1d5ac', 'store 1', 'dsfdsfdsfdsf dsfdsf dsfdsf', 40, -74, 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE IF NOT EXISTS `types` (
  `id` char(36) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` varchar(400) NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `title`, `description`, `status`) VALUES
('54801033-f5a4-4916-b0a5-639acdd1d5ac', 'type1', 'df', 'active'),
('54803bf0-0ef8-4658-8400-7264cdd1d5ac', 'type2', 'dfd', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `type_categories`
--

CREATE TABLE IF NOT EXISTS `type_categories` (
  `id` char(36) NOT NULL,
  `type_id` char(36) NOT NULL,
  `category_id` char(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_categories`
--

INSERT INTO `type_categories` (`id`, `type_id`, `category_id`) VALUES
('5481aa7f-ea7c-484f-881a-47efcdd1d5ac', '54801033-f5a4-4916-b0a5-639acdd1d5ac', '547da4f6-b03c-4b31-b64c-2d7fcdd1d5ac'),
('5481aab0-944c-4dbf-b077-42bbcdd1d5ac', '54803bf0-0ef8-4658-8400-7264cdd1d5ac', '547dc53a-1344-4fdd-836e-3ae8cdd1d5ac');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
