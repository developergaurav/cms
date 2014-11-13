-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 12, 2014 at 04:50 PM
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
('54487b6c-d7b8-4a35-bfd5-04a9cdd1d5ac', 'zubayer@uysys.com', '$2a$10$CeR7YcT7NoTeAjuCEGUwk.pQQ.VTjnAK7xo26M3f5d9s61zZ03VWe', '{"first_name":"abdullah","last_name":"a","address_line_1":"a","address_line_2":"a","zip":"a","cell":"a"}', '2014-10-23 09:52:12'),
('54488b26-dc08-4c65-bfa2-04aacdd1d5ac', 'zubayer@w.com', '$2a$10$92sTfKl3azzgMG5FMSYoveD.kyW1HO/xmGwThX4O1KfguKnSsURYO', '{"first_name":"abdullah","last_name":"zubayer","address_line_1":"address ","address_line_2":"address","zip":"123454","cell":"+9900"}', '2014-10-23 10:59:18'),
('54489c8c-8208-46a7-b2b3-136ecdd1d5ac', 'test@test.com', '$2a$10$W3vg5IuJTY/pM8igCueQY.e2.qi7gylhogqq8QcCNd7Fyn1y6DjYm', '{"first_name":"test","last_name":"tes","address_line_1":"test","address_line_2":"stes","zip":"dsf","cell":"dsf"}', '2014-10-23 12:13:32'),
('5448aa5b-eb08-4713-9943-04aacdd1d5ac', 'zubayer@w3-app.com', '$2a$10$.0wDGg3woTHKnqlfRB6m.OWLHrwNgtHx4tz/BPXQDBLfxrOr5aidW', '{"first_name":"final test","last_name":"test","address_line_1":"foo","address_line_2":"foo","zip":"12345","cell":"123456"}', '2014-10-23 13:12:27');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
