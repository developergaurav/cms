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
  `attribute_label_id` char(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `type_id`, `title`, `attribute_label_id`) VALUES
('54295f80-4f4c-4e2e-a46f-0486cdd1d5ac', '542817d1-5490-4af4-a8cc-04d1cdd1d5ac', 'Color', '542c0a68-5968-4acc-9da7-0acacdd1d5ac'),
('54295f80-a5d4-4219-9aec-0486cdd1d5ac', '542817d1-5490-4af4-a8cc-04d1cdd1d5ac', 'Size', '542c0a52-3c8c-4eb4-8ceb-0f91cdd1d5ac'),
('54295f97-5ae4-42e6-8d7d-0488cdd1d5ac', '54285033-ed24-4815-a4f5-1a13cdd1d5ac', 'Size', '542c0a52-3c8c-4eb4-8ceb-0f91cdd1d5ac'),
('5462f789-46d4-4e23-97b3-04b2c0a8bf11', '5462f789-8bb8-431a-8173-04b2c0a8bf11', 'Weight', '542c0a52-3c8c-4eb4-8ceb-0f91cdd1d5ac'),
('5462f871-38b8-4309-9e00-04aec0a8bf11', '5462f789-8bb8-431a-8173-04b2c0a8bf11', 'Size', '542c0a52-3c8c-4eb4-8ceb-0f91cdd1d5ac');

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
('54295f80-1ee4-4d4a-b20d-0486cdd1d5ac', '54295f80-a5d4-4219-9aec-0486cdd1d5ac', 'Medium', 'no'),
('54295f80-8070-4f36-8f1c-0486cdd1d5ac', '54295f80-a5d4-4219-9aec-0486cdd1d5ac', 'Small', 'no'),
('54295f80-b6b4-44d8-a412-0486cdd1d5ac', '54295f80-a5d4-4219-9aec-0486cdd1d5ac', 'large', 'no'),
('54295f81-9ca4-488a-b26d-0486cdd1d5ac', '54295f80-4f4c-4e2e-a46f-0486cdd1d5ac', 'White', 'yes'),
('54295f81-e780-4c59-aa78-0486cdd1d5ac', '54295f80-4f4c-4e2e-a46f-0486cdd1d5ac', 'Off White', 'yes'),
('54295f97-323c-4459-be8e-0488cdd1d5ac', '54295f97-5ae4-42e6-8d7d-0488cdd1d5ac', '27', 'yes'),
('54295f97-a1d8-4f85-bed7-0488cdd1d5ac', '54295f97-5ae4-42e6-8d7d-0488cdd1d5ac', '30', 'yes'),
('5462f789-3fa8-4815-96ef-04b2c0a8bf11', '5462f789-46d4-4e23-97b3-04b2c0a8bf11', '20 kg', 'yes'),
('5462f789-cf28-4551-adbb-04b2c0a8bf11', '5462f789-46d4-4e23-97b3-04b2c0a8bf11', '10 pound', 'yes'),
('5462f871-8868-4305-bd82-04aec0a8bf11', '5462f871-38b8-4309-9e00-04aec0a8bf11', '10 Inc', 'yes'),
('5462f871-cd8c-44d2-8a9b-04aec0a8bf11', '5462f871-38b8-4309-9e00-04aec0a8bf11', '20 inc', 'yes');

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
  `images` text NOT NULL,
  `order` int(11) NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `meta_keys`, `meta_description`, `description`, `images`, `order`, `status`) VALUES
('54281859-d96c-4db0-8e89-0bc1cdd1d5ac', 'Brand 1', 'Brand 1', 'Brand 1', '<p>&nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd dfdf&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nb', '', 1, 'active'),
('54281863-0cac-42b9-85e6-0f52cdd1d5ac', 'Brand 2', 'brand2', 'brand2', '<p>lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd lorem ipsum de lo dfd dfdf&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nb</p>', '', 2, 'active'),
('5428186e-5c14-41fe-8166-04cfcdd1d5ac', 'Brand 3', 'Brand 3', 'Brand 3', '<p>lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd lorem ipsum de lo dfd dfdf&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nb<br></p>', '', 3, 'active');

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
  `images` text NOT NULL,
  `order` int(11) NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `title`, `meta_keys`, `meta_description`, `description`, `images`, `order`, `status`) VALUES
('5428223a-9b98-430d-8d3b-04cfcdd1d5ac', '', 'shop category', 'ds', 'fdsfds', '<p>dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgf', '', 1, 'active'),
('542822c5-e488-4a14-a666-0bbfcdd1d5ac', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac', 'shop category 2', 'dsfds', 'fd', '<p>dsfds<br></p>', '', 2, 'active'),
('5462f342-2c24-44ef-a508-04b0c0a8bf11', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac', 'Mens', 'eapparel', 'eapparel', '<p>ffs fsd sdf <br></p>', '', 3, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` char(36) NOT NULL,
  `type_id` char(36) NOT NULL,
  `title` varchar(200) NOT NULL,
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

INSERT INTO `products` (`id`, `type_id`, `title`, `slug`, `meta_keys`, `meta_description`, `description`, `options`, `price`, `order`, `status`, `created`, `modified`) VALUES
('543f77f7-f3bc-437c-9b7e-04bccdd1d5ac', '54285033-ed24-4815-a4f5-1a13cdd1d5ac', 'Product  4', '', 'dsf', 'aa', '<p>Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product detail', '', 10, 1, 'active', '2014-10-16', '2014-10-16'),
('543f7823-259c-4e29-a250-1fb1cdd1d5ac', '542817d1-5490-4af4-a8cc-04d1cdd1d5ac', 'Product 5', '', 'dsf', 'adsf', '<p>Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product details&nbsp;Lorem ipsum de product detail', '', 25, 2, 'active', '2014-10-16', '2014-10-16'),
('5462f8d3-47f8-4613-8bd5-04b2c0a8bf11', '5462f789-8bb8-431a-8173-04b2c0a8bf11', 'Mens T shirt', '', 'sfsd', 'fsdf', '<p>ffdsfsdfsdf<br></p>', '', 100, 3, 'active', '2014-11-12', '2014-11-12');

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
('543f77f7-dc44-4bc7-88ae-04bccdd1d5ac', '543f77f7-f3bc-437c-9b7e-04bccdd1d5ac', '54295f97-5ae4-42e6-8d7d-0488cdd1d5ac'),
('543f7823-3364-42aa-8e64-1fb1cdd1d5ac', '543f7823-259c-4e29-a250-1fb1cdd1d5ac', '54295f80-a5d4-4219-9aec-0486cdd1d5ac'),
('543f7823-820c-40dc-95b5-1fb1cdd1d5ac', '543f7823-259c-4e29-a250-1fb1cdd1d5ac', '54295f80-4f4c-4e2e-a46f-0486cdd1d5ac'),
('5462f8d3-dfc8-4e85-9873-04b2c0a8bf11', '5462f8d3-47f8-4613-8bd5-04b2c0a8bf11', '5462f789-46d4-4e23-97b3-04b2c0a8bf11'),
('5462f8d3-ef44-4ebc-914b-04b2c0a8bf11', '5462f8d3-47f8-4613-8bd5-04b2c0a8bf11', '5462f871-38b8-4309-9e00-04aec0a8bf11');

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
('543f77f7-48dc-4a69-9ffd-04bccdd1d5ac', '543f77f7-dc44-4bc7-88ae-04bccdd1d5ac', '54295f97-323c-4459-be8e-0488cdd1d5ac', 10),
('543f7823-4b14-4923-9c58-1fb1cdd1d5ac', '543f7823-3364-42aa-8e64-1fb1cdd1d5ac', '54295f80-b6b4-44d8-a412-0486cdd1d5ac', 0),
('543f7823-9b4c-4885-b57d-1fb1cdd1d5ac', '543f7823-3364-42aa-8e64-1fb1cdd1d5ac', '54295f80-1ee4-4d4a-b20d-0486cdd1d5ac', 0),
('543f7823-cd0c-4d6c-8e0b-1fb1cdd1d5ac', '543f7823-820c-40dc-95b5-1fb1cdd1d5ac', '54295f81-9ca4-488a-b26d-0486cdd1d5ac', 10),
('543f7823-ec8c-457e-95a1-1fb1cdd1d5ac', '543f7823-3364-42aa-8e64-1fb1cdd1d5ac', '54295f80-8070-4f36-8f1c-0486cdd1d5ac', 0),
('5462f8d3-39e0-44e3-8756-04b2c0a8bf11', '5462f8d3-ef44-4ebc-914b-04b2c0a8bf11', '5462f871-8868-4305-bd82-04aec0a8bf11', 5),
('5462f8d3-43c8-4c64-9d2f-04b2c0a8bf11', '5462f8d3-dfc8-4e85-9873-04b2c0a8bf11', '5462f789-3fa8-4815-96ef-04b2c0a8bf11', 120),
('5462f8d3-80f8-46b8-b532-04b2c0a8bf11', '5462f8d3-ef44-4ebc-914b-04b2c0a8bf11', '5462f871-cd8c-44d2-8a9b-04aec0a8bf11', 10),
('5462f8d3-99b8-496a-82a7-04b2c0a8bf11', '5462f8d3-dfc8-4e85-9873-04b2c0a8bf11', '5462f789-cf28-4551-adbb-04b2c0a8bf11', 140);

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
('543f77f7-5e18-4ff0-b8d2-04bccdd1d5ac', '543f77f7-f3bc-437c-9b7e-04bccdd1d5ac', '5428186e-5c14-41fe-8166-04cfcdd1d5ac'),
('543f7823-2bb8-4a73-afde-1fb1cdd1d5ac', '543f7823-259c-4e29-a250-1fb1cdd1d5ac', '54281863-0cac-42b9-85e6-0f52cdd1d5ac'),
('5462f8d3-74c0-49cb-a3e4-04b2c0a8bf11', '5462f8d3-47f8-4613-8bd5-04b2c0a8bf11', '54281859-d96c-4db0-8e89-0bc1cdd1d5ac');

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
('543f77f7-7d18-4c00-a375-04bccdd1d5ac', '543f77f7-f3bc-437c-9b7e-04bccdd1d5ac', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac'),
('543f7823-ca74-4bb6-a168-1fb1cdd1d5ac', '543f7823-259c-4e29-a250-1fb1cdd1d5ac', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac'),
('5462f8d3-0e68-499e-8018-04b2c0a8bf11', '5462f8d3-47f8-4613-8bd5-04b2c0a8bf11', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac');

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
('543f77f7-cdac-41d3-9a84-04bccdd1d5ac', '543f77f7-f3bc-437c-9b7e-04bccdd1d5ac', 'jpeg'),
('543f7823-ca6c-4655-9751-1fb1cdd1d5ac', '543f7823-259c-4e29-a250-1fb1cdd1d5ac', 'jpeg'),
('5462f8d3-94c0-4fbf-a4d8-04b2c0a8bf11', '5462f8d3-47f8-4613-8bd5-04b2c0a8bf11', 'jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE IF NOT EXISTS `product_orders` (
  `id` char(36) NOT NULL,
  `client_detail` text NOT NULL,
  `order_detail` text NOT NULL,
  `payment_detail` text NOT NULL,
  `status` tinytext NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `complete_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `client_detail`, `order_detail`, `payment_detail`, `status`, `order_date`, `complete_date`) VALUES
('544cc676-a55c-4dda-98fc-1f7dcdd1d5ac', '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"123456\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/54449143-42b8-463d-8610-7af0cdd1d5ac.jpeg","product_id":"543f6182-fc94-470e-af50-0b3ccdd1d5ac","product_title":"Product 2","cost":"22","quantity":"1"}]', '[{"name":"paymentmethod","value":"paypal"},{"name":"cardNo","value":""},{"name":"cvv2","value":""}]', 'completed', '2014-10-26 10:01:26', '2014-10-27 06:21:23'),
('544cc6e4-e988-4082-83d2-1fb9cdd1d5ac', '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"123456\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/54449143-42b8-463d-8610-7af0cdd1d5ac.jpeg","product_id":"543f6182-fc94-470e-af50-0b3ccdd1d5ac","product_title":"Product 2","cost":"22","quantity":"1"}]', '[{"name":"paymentmethod","value":"paypal"},{"name":"cardNo","value":""},{"name":"cvv2","value":""}]', 'cancelled', '2014-10-26 10:03:16', '2014-10-27 06:21:26'),
('544cc7a7-7248-4efa-be07-1fc9cdd1d5ac', '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"123456\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/54449143-42b8-463d-8610-7af0cdd1d5ac.jpeg","product_id":"543f6182-fc94-470e-af50-0b3ccdd1d5ac","product_title":"Product 2","cost":"22","quantity":"1"}]', '[{"name":"paymentmethod","value":"paypal"},{"name":"cardNo","value":""},{"name":"cvv2","value":""}]', 'ordered', '2014-10-26 10:06:31', '0000-00-00 00:00:00'),
('544cc7ac-fc14-4c47-b7bf-0f6ccdd1d5ac', '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"123456\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/54449143-42b8-463d-8610-7af0cdd1d5ac.jpeg","product_id":"543f6182-fc94-470e-af50-0b3ccdd1d5ac","product_title":"Product 2","cost":"22","quantity":"1"}]', '[{"name":"paymentmethod","value":"paypal"},{"name":"cardNo","value":""},{"name":"cvv2","value":""}]', 'processing', '2014-10-26 10:06:36', '0000-00-00 00:00:00'),
('544ccd8d-141c-4160-9d86-1fb7cdd1d5ac', '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"123456\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/54449143-42b8-463d-8610-7af0cdd1d5ac.jpeg","product_id":"543f6182-fc94-470e-af50-0b3ccdd1d5ac","product_title":"Product 2","cost":"22","quantity":"1"}]', '[{"name":"paymentmethod","value":"paypal"},{"name":"cardNo","value":""},{"name":"cvv2","value":""}]', 'ordered', '2014-10-26 10:31:41', '0000-00-00 00:00:00'),
('544cce3b-6184-4d27-8830-0f6ccdd1d5ac', '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"123456\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/54449143-42b8-463d-8610-7af0cdd1d5ac.jpeg","product_id":"543f6182-fc94-470e-af50-0b3ccdd1d5ac","product_title":"Product 2","cost":"22","quantity":"1"}]', '[{"name":"paymentmethod","value":"paypal"},{"name":"cardNo","value":""},{"name":"cvv2","value":""}]', 'ordered', '2014-10-26 10:34:35', '0000-00-00 00:00:00'),
('544df49b-3ff8-44a0-abe6-049ecdd1d5ac', '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"123456\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"Size":"Small","Color":"White"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/543f7a9c-1bbc-4b34-88d0-0b3acdd1d5ac.jpeg","product_id":"542e66bc-5d94-419b-81f5-315fcdd1d5ac","product_title":"Product 1","cost":"665","quantity":"5"},{"attributes":{"Color":"Off White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/54449143-42b8-463d-8610-7af0cdd1d5ac.jpeg","product_id":"543f6182-fc94-470e-af50-0b3ccdd1d5ac","product_title":"Product 2","cost":"850","quantity":"50"}]', '[{"name":"paymentmethod","value":"paypal"},{"name":"cardNo","value":""},{"name":"cvv2","value":""}]', 'ordered', '2014-10-27 07:30:35', '0000-00-00 00:00:00'),
('545c8d2f-53bc-4512-8ddc-13a6cdd1d5ac', '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"123456\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[{"attributes":{"Size":"27"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/543f785a-4724-4ff0-8490-0b3acdd1d5ac.jpeg","product_id":"543f778f-01ec-4c2a-bb1b-04bbcdd1d5ac","product_title":"Product 3","cost":"10","quantity":"1"}]', '[{"name":"paymentmethod","value":"paypal"},{"name":"cardNo","value":""},{"name":"cvv2","value":""}]', 'ordered', '2014-11-07 09:13:19', '0000-00-00 00:00:00'),
('545c8d31-b798-4cba-ba0e-13a6cdd1d5ac', '"{\\"Client\\":{\\"id\\":\\"5448aa5b-eb08-4713-9943-04aacdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"final test\\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"test\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"foo\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"12345\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"123456\\\\\\"}\\",\\"created\\":\\"2014-10-23 13:12:27\\"}}"', '[]', '[{"name":"paymentmethod","value":"paypal"},{"name":"cardNo","value":""},{"name":"cvv2","value":""}]', 'ordered', '2014-11-07 09:13:21', '0000-00-00 00:00:00');

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
-- Table structure for table `stores`
--

CREATE TABLE IF NOT EXISTS `stores` (
  `id` char(36) NOT NULL,
  `details` text NOT NULL,
  `order` int(11) NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('542817d1-5490-4af4-a8cc-04d1cdd1d5ac', 'Shirt', ' lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lor', 'active'),
('54285033-ed24-4815-a4f5-1a13cdd1d5ac', 'Belt', ' lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lor', 'active'),
('5462f789-8bb8-431a-8173-04b2c0a8bf11', 'Electronics', ' lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lorem ipsum de lorem  lor', 'active');

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
('546dcd0a-1e0c-4ce0-a4a9-78fbcdd1d5ac', '542817d1-5490-4af4-a8cc-04d1cdd1d5ac', '5462f342-2c24-44ef-a508-04b0c0a8bf11'),
('546dcd0a-6348-4cdf-b24e-78fbcdd1d5ac', '542817d1-5490-4af4-a8cc-04d1cdd1d5ac', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac'),
('546dcd0a-77a4-41b0-b0b8-78fbcdd1d5ac', '542817d1-5490-4af4-a8cc-04d1cdd1d5ac', '542822c5-e488-4a14-a666-0bbfcdd1d5ac'),
('546dcd11-5f18-4c7f-8d39-78f9cdd1d5ac', '54285033-ed24-4815-a4f5-1a13cdd1d5ac', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac'),
('546dcd11-f004-489a-ac80-78f9cdd1d5ac', '54285033-ed24-4815-a4f5-1a13cdd1d5ac', '542822c5-e488-4a14-a666-0bbfcdd1d5ac'),
('546dcd20-e5d4-440b-92d0-7d9bcdd1d5ac', '5462f789-8bb8-431a-8173-04b2c0a8bf11', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac'),
('546dcf20-84a0-49ae-9767-240ecdd1d5ac', '54285033-ed24-4815-a4f5-1a13cdd1d5ac', '542822c5-e488-4a14-a666-0bbfcdd1d5ac'),
('546dcf20-e3b0-4de6-8cdc-240ecdd1d5ac', '54285033-ed24-4815-a4f5-1a13cdd1d5ac', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac'),
('546dcf26-4448-4e1e-b5d8-2618cdd1d5ac', '54285033-ed24-4815-a4f5-1a13cdd1d5ac', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac'),
('546dcf26-c274-4e21-9c20-2618cdd1d5ac', '54285033-ed24-4815-a4f5-1a13cdd1d5ac', '542822c5-e488-4a14-a666-0bbfcdd1d5ac'),
('546dcf31-3a14-4e8c-beaa-262ecdd1d5ac', '5462f789-8bb8-431a-8173-04b2c0a8bf11', '542822c5-e488-4a14-a666-0bbfcdd1d5ac'),
('546dcf31-c930-4a86-aba0-262ecdd1d5ac', '5462f789-8bb8-431a-8173-04b2c0a8bf11', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac'),
('546dcf3b-1ef4-454a-aecc-7da4cdd1d5ac', '5462f789-8bb8-431a-8173-04b2c0a8bf11', '542822c5-e488-4a14-a666-0bbfcdd1d5ac'),
('546dcf3b-bd4c-4d33-8f54-7da4cdd1d5ac', '5462f789-8bb8-431a-8173-04b2c0a8bf11', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
