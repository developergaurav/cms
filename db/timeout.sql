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
-- Database: `timeout`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` char(36) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `details` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `username`, `password`, `details`, `created`) VALUES
('5448aa5b-eb08-4713-9943-04aacdd1d5ac', 'zubayer@w3-app.com', '$2a$10$1TIx3ec1PCcES20uZ9.20uWkjVBJFFuiJtj7SxNAK/B4/J9Mqexoa', '{"first_name":"final test","last_name":"test","address_line_1":"foo","address_line_2":"foo","zip":"12345","cell":"1234569"}', '2014-10-23 13:12:27');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE IF NOT EXISTS `galleries` (
  `id` char(36) NOT NULL,
  `title` char(200) NOT NULL,
  `caption` varchar(250) NOT NULL,
  `details` text NOT NULL,
  `url` varchar(300) NOT NULL,
  `image_extension` tinytext NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `title`, `caption`, `details`, `url`, `image_extension`, `order`) VALUES
('54780b1f-8074-4e9d-b2a4-1514cdd1d5ac', 'dsf', 'dsf', '<p>dsf<br></p>', '', 'jpeg', 0),
('54780b94-70c4-4f4f-9243-1514cdd1d5ac', 'dsf', 'df', '<p>ds<br></p>', '', 'jpeg', 0),
('5480683e-9b74-45bf-bec6-0244cdd1d5ac', 'goo', 'dsfsd', 'fds', '', 'jpeg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `homeBlocks`
--

CREATE TABLE IF NOT EXISTS `homeBlocks` (
  `id` char(36) NOT NULL,
  `title` varchar(200) NOT NULL,
  `url` text NOT NULL,
  `image_extension` tinytext NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `homeBlocks`
--

INSERT INTO `homeBlocks` (`id`, `title`, `url`, `image_extension`, `status`) VALUES
('54793f88-6058-4b4c-8e2d-121acdd1d5ac', 'WEBSHOP', 'http://localhost:9000/#/shop', 'jpeg', 'active'),
('54794195-5a78-4206-92ad-1265cdd1d5ac', 'dsfdsf', 'http://localhost:9000/#/shop/brands', 'jpeg', 'active'),
('547da9e7-ee90-4b23-b99c-3282cdd1d5ac', 'dsf', 'dsf', 'jpeg', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `lookbooks`
--

CREATE TABLE IF NOT EXISTS `lookbooks` (
  `id` char(36) NOT NULL,
  `title` char(200) NOT NULL,
  `caption` varchar(250) NOT NULL,
  `details` text NOT NULL,
  `url` varchar(300) NOT NULL,
  `image_extension` tinytext NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lookbooks`
--

INSERT INTO `lookbooks` (`id`, `title`, `caption`, `details`, `url`, `image_extension`, `order`) VALUES
('54780b1f-8074-4e9d-b2a4-1514cdd1d5ac', 'dsf', 'dsf', '<p>dsf<br></p>', '', 'jpeg', 0),
('54780b94-70c4-4f4f-9243-1514cdd1d5ac', 'dsf', 'df', '<p>ds<br></p>', '', 'jpeg', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
