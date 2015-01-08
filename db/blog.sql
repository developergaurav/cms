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
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `title` varchar(300) NOT NULL,
  `slug` varchar(350) NOT NULL,
  `meta_keys` varchar(60) NOT NULL,
  `meta_description` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `title`, `slug`, `meta_keys`, `meta_description`, `description`, `status`) VALUES
('5431830a-7f8c-4285-8f30-0a63cdd1d5ac', '', 'Blog Category 1', '', 'Blog Category 1', 'Blog Category 1', '<p>lorem ipsum de blog category. lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.v</p><p><br></p><p>lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.</p><p><br></p><p>lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.<br></p>', 'active'),
('54379416-cb24-48fa-8b4a-01e2cdd1d5ac', '', 'Blog Category 2', '', 'Blog Category 2', 'Blog Category 2', '<p>lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2.&nbsp;</p><p><br></p><p>lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2.&nbsp;</p><p><br></p><p>lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2.&nbsp;</p><p><br></p><p>lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. <br></p>', 'active'),
('54379ea4-3684-48c1-b531-04aacdd1d5ac', '54379416-cb24-48fa-8b4a-01e2cdd1d5ac', 'Blog Category 3', '', 'Blog Category 3', 'Blog Category 3', '<p>Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3.&nbsp;</p><p><br></p><p>Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. v</p><p>Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3.&nbsp;</p><p>Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. <br></p><p>Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. Lorem ipsum de blog category 3. <br></p>', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` char(36) NOT NULL,
  `user` char(36) NOT NULL,
  `post_id` char(36) NOT NULL,
  `comment` text NOT NULL,
  `status` tinytext NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` char(36) NOT NULL,
  `categories` text NOT NULL,
  `user` char(36) NOT NULL,
  `title` varchar(350) NOT NULL,
  `slug` varchar(400) NOT NULL,
  `meta_keys` varchar(60) NOT NULL,
  `meta_description` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `status` tinytext NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `categories`, `user`, `title`, `slug`, `meta_keys`, `meta_description`, `description`, `status`, `created`, `modified`) VALUES
('5437929a-bb28-462e-8ac2-04aacdd1d5ac', '["54379416-cb24-48fa-8b4a-01e2cdd1d5ac","54379ea4-3684-48c1-b531-04aacdd1d5ac"]', '542391f1-037c-41a3-a270-0cadcdd1d5ac', 'How to develop an CMS', '', 'dsfds', 'dsfdsdfds', '<p>dsfdsf<br></p>', 'active', '2014-10-10', '2014-10-10'),
('54379430-f980-4e1f-9f60-01e1cdd1d5ac', '["54379416-cb24-48fa-8b4a-01e2cdd1d5ac"]', '542391f1-037c-41a3-a270-0cadcdd1d5ac', 'dsf', '', 'dfsdsdsf', 'fdsf', '<p>dsfs<br></p>', 'active', '2014-10-10', '2014-10-10');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
