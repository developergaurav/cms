-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 03, 2014 at 08:52 AM
-- Server version: 5.5.32-31.0-log
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `uysys1_timeout_timeout`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` char(36) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(64) NOT NULL,
  `details` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `username`, `password`, `details`, `created`) VALUES
('5448f286-8f8c-4b6d-b002-04a3cdd1d5ac', 'zubayer@w3-app.com', '$2a$10$uEADv7rN7aDKVUk4H33UOugRvdrAFssA2QfAh2C3NSg3mu.iDtZxO', '{"first_name":"abdullah ","last_name":"zubayer","address_line_1":"address 1","address_line_2":"address 2","zip":"zipcode","cell":"01731921635"}', '2014-10-23 18:20:22'),
('5479fb5f-7d84-469e-9a8d-0f1bcdd1d5ac', 'zubayer@uysys.com', '$2a$10$kZb0EbwGbL/V1A8oAelkLenVmOTPk/lzM60PxuvYy25XpPuLA8cQC', '{"first_name":"test","last_name":"foo","address_line_1":"fds","address_line_2":"fds","zip":"a","cell":"dsf"}', '2014-11-29 16:59:11'),
('547ae228-4ce4-4429-8aea-4fbeb89af793', 'zubayer@w3-app1.com', '$2a$10$ztYk7kAjbE/WMISymmx5V.s9MllZNTn7XYtMTwDqFKylAvA8z1tnS', '{"first_name":"dsf","last_name":"dsf","address_line_1":"dfs","address_line_2":"dsf","zip":"dsf","cell":"dsf"}', '2014-11-30 09:23:52');

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
('547eb196-6a3c-433c-a7d2-3eb4b89af793', 'WEBSHOP', 'http://localhost:7000/#/shop', 'png', 'active'),
('547eb246-5fdc-4527-957b-7d6eb89af793', 'MEN', 'http://localhost:7000/#/shop', 'jpg', 'active'),
('547eb273-2a8c-4158-8f48-075db89af793', 'ACCESSOIRES', 'http://localhost:7000/#/shop', 'jpg', 'active'),
('547eb285-0ae8-43d0-9bef-0c37b89af793', 'DEALS', 'http://localhost:7000/#/deals', 'png', 'active'),
('547eb296-98e4-4b69-bf84-114bb89af793', 'WOMEN', 'http://localhost:7000/#/shop', 'jpg', 'active'),
('547eb2a9-72cc-484a-8cb8-1657b89af793', 'LOOKBOOK', 'http://localhost:7000/#/lookbook', 'png', 'active');

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
('547eb6af-148c-40d6-989d-7eb3b89af793', 'Banner1', 'Banner1', '<p>Banner1<br></p>', '', 'jpg', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
