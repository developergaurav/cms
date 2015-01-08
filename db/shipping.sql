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
-- Database: `shipping`
--

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE IF NOT EXISTS `channels` (
  `id` char(36) NOT NULL,
  `country_id` char(36) NOT NULL,
  `city_id` char(36) NOT NULL,
  `zip` varchar(8) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `country_id`, `city_id`, `zip`, `price`) VALUES
('54a40228-c254-4a48-9aad-5297cdd1d5ac', '54a39e28-ac04-45f4-8ff4-3f38cdd1d5ac', '54a39e73-a468-4a9b-8f0b-3e95cdd1d5ac', '123', 52),
('54a411d6-23b0-4bf8-8d69-1028cdd1d5ac', '54a39e28-ac04-45f4-8ff4-3f38cdd1d5ac', '54a411ca-d7f0-413b-8308-103acdd1d5ac', NULL, NULL),
('54a414bb-5470-4eb2-a1e6-0ebecdd1d5ac', '', '', NULL, 123),
('54a41519-682c-44aa-96d7-10aacdd1d5ac', '54a39e28-ac04-45f4-8ff4-3f38cdd1d5ac', '54a41517-d8e8-45ea-adf1-10aacdd1d5ac', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` char(36) NOT NULL,
  `country_id` char(36) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `title`) VALUES
('54a39e73-a468-4a9b-8f0b-3e95cdd1d5ac', '54a39e28-ac04-45f4-8ff4-3f38cdd1d5ac', 'Dhaka'),
('54a411ca-d7f0-413b-8308-103acdd1d5ac', '54a39e28-ac04-45f4-8ff4-3f38cdd1d5ac', 'ssss'),
('54a41517-d8e8-45ea-adf1-10aacdd1d5ac', '54a39e28-ac04-45f4-8ff4-3f38cdd1d5ac', 'dsfdf');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` char(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`) VALUES
('54a39e28-ac04-45f4-8ff4-3f38cdd1d5ac', 'Bangladesh', 'bd'),
('54a39e58-bd80-4dd5-9a40-3e95cdd1d5ac', 'India', 'in'),
('54a39e60-5174-4d1f-8f72-3e91cdd1d5ac', 'Pakistan', 'pk');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
