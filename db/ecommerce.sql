-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 12, 2014 at 08:40 AM
-- Server version: 5.5.38-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.4

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
('54295f97-5ae4-42e6-8d7d-0488cdd1d5ac', '54285033-ed24-4815-a4f5-1a13cdd1d5ac', 'Size', '542c0a52-3c8c-4eb4-8ceb-0f91cdd1d5ac');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_labels`
--

CREATE TABLE IF NOT EXISTS `attribute_labels` (
  `id` char(36) NOT NULL,
  `label` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute_labels`
--

INSERT INTO `attribute_labels` (`id`, `label`) VALUES
('542c0a68-5968-4acc-9da7-0acacdd1d5ac', 'color'),
('542c0a52-3c8c-4eb4-8ceb-0f91cdd1d5ac', 'size');

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
('54295f97-a1d8-4f85-bed7-0488cdd1d5ac', '54295f97-5ae4-42e6-8d7d-0488cdd1d5ac', '30', 'yes');

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
('54281859-d96c-4db0-8e89-0bc1cdd1d5ac', 'Brand 1', 'Brand 1', 'dsfd', '<p>&nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd &nbsp;lorem ipsum de lo dfd dfdf&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nbsp;lorem ipsum de lo dfd&nb', '', 0, 'active'),
('54281863-0cac-42b9-85e6-0f52cdd1d5ac', 'Brand 2', 'dsf', 'dfsdfdsf', '<p>dsf<br></p>', '', 0, 'active'),
('5428186e-5c14-41fe-8166-04cfcdd1d5ac', 'Brand 3', 'dsf', 'dsf', '<p>dsf<br></p>', '', 0, 'active'),
('54281875-5578-4600-a757-0bbfcdd1d5ac', 'dsf', 'dfs', 'dsf', '<p>dfdsf<br></p>', '', 0, 'active'),
('543917b0-a3b0-4823-9515-1996cdd1d5ac', 'test', 'dsf', 'dsf', '<p>dsfdsf<br></p>', '', 0, 'active'),
('54397c69-b4f4-49a6-9149-36a6cdd1d5ac', 'dsf', 'dsf', 'dsf', '<p>dsf<br></p>', '', 0, 'active'),
('54397c70-f710-4e9b-8364-36a6cdd1d5ac', 'dsf', 'dsds', 'dsf', '<p>dsf<br></p>', '', 0, 'active'),
('54397c76-85f0-4afe-ac76-36a6cdd1d5ac', 'dsf', 'dsf', 'dsfd', '<p>dsf<br></p>', '', 0, 'active'),
('54397c7e-ef0c-405e-b154-3d92cdd1d5ac', 'dsf', 'df', 'dsfdf', '<p>dsf<br></p>', '', 0, 'active'),
('54397c84-d640-4b05-a50b-3d92cdd1d5ac', 'dsfds', 'dsfdsf', 'dsf', '<p>dsfdsf<br></p>', '', 0, 'active'),
('54397c8c-2e94-45c2-9828-3f0acdd1d5ac', 'dsf', 'ddsf', 'dsf', '<p>dsfdsf<br></p>', '', 0, 'active'),
('54397c97-6a70-4108-a5d4-3f62cdd1d5ac', 'dsf', 'dsf', 'dsf', '<p>dsfdsf<br></p>', '', 0, 'active');

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
('5428223a-9b98-430d-8d3b-04cfcdd1d5ac', '', 'category 1', 'ds', 'fdsfds', '<p>dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgfgf dsfdsf dfgfdg&nbsp; dgffdgf', '', 1, 'active'),
('542822c5-e488-4a14-a666-0bbfcdd1d5ac', '', 'category 2', 'dsfds', 'fd', '<p>dsfds<br></p>', '', 2, 'active');

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
  `images` text NOT NULL,
  `options` text NOT NULL,
  `categories` text NOT NULL,
  `brands` text NOT NULL,
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

INSERT INTO `products` (`id`, `type_id`, `title`, `slug`, `meta_keys`, `meta_description`, `description`, `images`, `options`, `categories`, `brands`, `price`, `order`, `status`, `created`, `modified`) VALUES
('542e66bc-5d94-419b-81f5-315fcdd1d5ac', '542817d1-5490-4af4-a8cc-04d1cdd1d5ac', 'er', '', 'er', 'wewr', '<p></p><p>gfghgfdvgfjy ghfvgdfgh <br></p><p></p><p>gfghgfdvgfjy ghfvgdfgh <br></p><p></p><p>gfghgfdvgfjy ghfvgdfgh <br></p><p></p><p>gfghgfdvgfjy ghfvgdfgh <br></p><p></p><p>gfghgfdvgfjy ghfvgdfgh <br></p><p></p><p>gfghgfdvgfjy ghfvgdfgh <br></p><p><br></p>', '', '', '', '', 123, 0, 'active', '2014-10-05', '2014-10-05');

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
('54317ca6-20e4-4e13-8026-04accdd1d5ac', '542e66bc-5d94-419b-81f5-315fcdd1d5ac', '54295f80-a5d4-4219-9aec-0486cdd1d5ac'),
('54317ca6-7890-45a3-aced-04accdd1d5ac', '542e66bc-5d94-419b-81f5-315fcdd1d5ac', '54295f80-4f4c-4e2e-a46f-0486cdd1d5ac');

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
('54317ca6-3900-4e00-a996-04accdd1d5ac', '54317ca6-7890-45a3-aced-04accdd1d5ac', '54295f81-9ca4-488a-b26d-0486cdd1d5ac', 10),
('54317ca6-54d0-403c-9118-04accdd1d5ac', '54317ca6-20e4-4e13-8026-04accdd1d5ac', '54295f80-8070-4f36-8f1c-0486cdd1d5ac', 0),
('54317ca6-82c4-43c3-b787-04accdd1d5ac', '54317ca6-20e4-4e13-8026-04accdd1d5ac', '54295f80-b6b4-44d8-a412-0486cdd1d5ac', 0),
('54317ca6-c5fc-435e-bf64-04accdd1d5ac', '54317ca6-20e4-4e13-8026-04accdd1d5ac', '54295f80-1ee4-4d4a-b20d-0486cdd1d5ac', 0);

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
('54317ca6-a880-48a9-aa4a-04accdd1d5ac', '542e66bc-5d94-419b-81f5-315fcdd1d5ac', '54281875-5578-4600-a757-0bbfcdd1d5ac');

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
('54317ca6-0494-4d4a-9e0f-04accdd1d5ac', '542e66bc-5d94-419b-81f5-315fcdd1d5ac', '542822c5-e488-4a14-a666-0bbfcdd1d5ac'),
('54317ca6-33bc-44d2-bf32-04accdd1d5ac', '542e66bc-5d94-419b-81f5-315fcdd1d5ac', '5428223a-9b98-430d-8d3b-04cfcdd1d5ac');

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
('54317ca6-a1e4-448c-9b24-04accdd1d5ac', '542e66bc-5d94-419b-81f5-315fcdd1d5ac', 'jpeg'),
('54317ca6-a750-402a-b3ee-04accdd1d5ac', '542e66bc-5d94-419b-81f5-315fcdd1d5ac', 'jpeg'),
('54317ca6-b530-4f1f-92d6-04accdd1d5ac', '542e66bc-5d94-419b-81f5-315fcdd1d5ac', 'jpeg');

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
('54285033-ed24-4815-a4f5-1a13cdd1d5ac', 'Belt', 'size', 'active');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
