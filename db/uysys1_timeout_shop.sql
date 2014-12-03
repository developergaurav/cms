-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 03, 2014 at 08:49 AM
-- Server version: 5.5.32-31.0-log
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `uysys1_timeout_shop`
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
('547ea717-ffb4-447b-8fcb-7f25b89af793', '547ea717-bfc8-403c-871c-7f25b89af793', 'Size', ''),
('547eb006-bea8-4618-87e8-5304b89af793', '547eb006-4f04-4c55-957f-5304b89af793', 'Size', ''),
('547ec562-3d78-45c4-a871-3589b89af793', '547ec562-1ee4-4a82-a209-3589b89af793', 'SIZE', ''),
('547ec562-dc94-4c2a-8094-3589b89af793', '547ec562-1ee4-4a82-a209-3589b89af793', 'COLOR', '');

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
('547ea717-0844-4a7a-935c-7f25b89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793', 'L', 'no'),
('547ea717-20bc-45e0-9aa8-7f25b89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793', 'XXL', 'no'),
('547ea717-69ac-4088-bd62-7f25b89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793', 'M', 'no'),
('547ea717-96d8-468d-9693-7f25b89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793', 'XL', 'no'),
('547ea717-b3a4-47f2-baab-7f25b89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793', 'S', 'no'),
('547ea717-c788-4acf-a43e-7f25b89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793', 'XXL', 'no'),
('547ea717-e370-49a3-9fcf-7f25b89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793', 'XS', 'no'),
('547eb006-1844-42ac-8379-5304b89af793', '547eb006-bea8-4618-87e8-5304b89af793', '31-34', 'no'),
('547eb006-222c-4644-a805-5304b89af793', '547eb006-bea8-4618-87e8-5304b89af793', ' 30-34', 'no'),
('547eb006-2d40-4ddd-8650-5304b89af793', '547eb006-bea8-4618-87e8-5304b89af793', '29-34', 'no'),
('547eb006-2e34-43df-8001-5304b89af793', '547eb006-bea8-4618-87e8-5304b89af793', '25-32', 'no'),
('547eb006-378c-4b36-ac92-5304b89af793', '547eb006-bea8-4618-87e8-5304b89af793', '28-32', 'no'),
('547eb006-41d8-4276-916c-5304b89af793', '547eb006-bea8-4618-87e8-5304b89af793', '27-32', 'no'),
('547eb006-45e4-4977-94c9-5304b89af793', '547eb006-bea8-4618-87e8-5304b89af793', '26-32', 'no'),
('547eb006-9c78-4b86-8d87-5304b89af793', '547eb006-bea8-4618-87e8-5304b89af793', '24-32', 'no'),
('547ec562-147c-427b-87cd-3589b89af793', '547ec562-3d78-45c4-a871-3589b89af793', 'XL', 'no'),
('547ec562-2db0-47cc-bb3d-3589b89af793', '547ec562-dc94-4c2a-8094-3589b89af793', 'WHITE', 'yes'),
('547ec562-8eb4-4b4b-b08e-3589b89af793', '547ec562-dc94-4c2a-8094-3589b89af793', 'RED', 'no'),
('547ec562-bf6c-4469-8927-3589b89af793', '547ec562-3d78-45c4-a871-3589b89af793', 'XXL', 'no');

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
('547ea0fa-9bcc-45c1-a962-5a8fb89af793', 'Superdry ', 'Superdry ', 'Superdry ', '<p><a href="">Superdry                <br></a></p>', '', 0, 'active'),
('547ea200-5590-4349-bd5c-7aaeb89af793', 'LTB ', 'LTB ', 'LTB ', '<p><a href="">LTB                <br></a></p>', '', 0, 'active'),
('547ea209-9924-4325-8e63-7bccb89af793', 'Circle of trust ', 'Circle of trust ', 'Circle of trust ', '<p><a href="">Circle of trust                <br></a></p>', '', 0, 'active'),
('547ea212-7bb8-4837-bfd1-7c98b89af793', 'Converse ', 'Converse ', 'Converse ', '<p><a href="">Converse                <br></a></p>', '', 0, 'active'),
('547ea21b-2cbc-4013-b0c3-7d5ab89af793', 'Catwalk junkie ', 'Catwalk junkie ', 'Catwalk junkie ', '<p><a href="">Catwalk junkie                <br></a></p>', '', 0, 'active'),
('547ea223-5044-481c-b47f-7e41b89af793', 'gIpsy ', 'gIpsy ', 'gIpsy ', '<p><a href="">gIpsy                <br></a></p>', '', 0, 'active'),
('547ea235-2d38-4c43-846a-02abb89af793', 'Havaianas ', 'Havaianas ', 'Havaianas ', '<p><a href="">Havaianas                <br></a></p>', '', 0, 'active'),
('547ea23f-9834-46d8-9aa6-043fb89af793', 'Josh ', 'Josh ', 'Josh ', '<p><a href="">Josh                <br></a></p>', '', 0, 'active'),
('547ea247-87ac-4795-b3d8-0533b89af793', 'Kultivate ', 'Kultivate ', 'Kultivate ', '<p><a href="">Kultivate                <br></a></p>', '', 0, 'active'),
('547ea253-bce8-4883-a9a3-06aab89af793', 'Pearly king ', 'Pearly king ', 'Pearly king ', '<p><a href="">Pearly king                <br></a></p>', '', 0, 'active'),
('547ea25b-52bc-4ab2-92bd-077cb89af793', 'Reef ', 'Reef ', 'Reef ', '<p><a href="">Reef                <br></a></p>', '', 0, 'active'),
('547ea266-df3c-413f-8baf-0890b89af793', 'Scotch and soda ', 'Scotch and soda ', 'Scotch and soda ', '<p><a href="">Scotch and soda                <br></a></p>', '', 0, 'active'),
('547ea270-1250-4342-a021-0b07b89af793', 'airforce ', 'airforce ', 'airforce ', '<p><a href="">airforce <br></a></p>', '', 0, 'active'),
('547ea27b-fc38-4b6c-b01e-0c54b89af793', 'DC Shoes ', 'DC Shoes ', 'DC Shoes ', '<p><a href="">DC Shoes                <br></a></p>', '', 0, 'active'),
('547ea284-8828-44b1-bf80-0d76b89af793', 'No Excess ', 'No Excess ', 'No Excess ', '<p><a href="">No Excess                <br></a></p>', '', 0, 'active'),
('547ea28d-bb30-420f-94cf-0e54b89af793', 'Metin Pot ', 'Metin Pot ', 'Metin Pot ', '<p><a href="">Metin Pot                <br></a></p>', '', 0, 'active'),
('547ea295-77d0-45ca-84cd-0f37b89af793', 'PME Legend ', 'PME Legend ', 'PME Legend ', '<p><a href="">PME Legend                <br></a></p>', '', 0, 'active'),
('547ea29e-4500-4d25-9f0f-1078b89af793', 'Happy Socks ', 'Happy Socks ', 'Happy Socks ', '<p><a href="">Happy Socks                <br></a></p>', '', 0, 'active'),
('547ea2a7-80b0-4c37-8b55-1152b89af793', 'Gstar Shoes ', 'Gstar Shoes ', 'Gstar Shoes ', '<p><a href="">Gstar Shoes                <br></a></p>', '', 0, 'active'),
('547ea2b1-faec-41af-b585-139bb89af793', 'SPM Shoes ', 'SPM Shoes ', 'SPM Shoes ', '<p><a href="">SPM Shoes                <br></a></p>', '', 0, 'active'),
('547ea2b9-f7a8-41db-8058-147cb89af793', 'Pig And Hen ', 'Pig And Hen ', 'Pig And Hen ', '<p><a href="">Pig And Hen                <br></a></p>', '', 0, 'active'),
('547ea2c1-589c-440d-bdef-1547b89af793', 'Deus ex-Machina ', 'Deus ex-Machina ', 'Deus ex-Machina ', '<p><a href="">Deus ex-Machina                <br></a></p>', '', 0, 'active'),
('547ea2c9-f8c4-4f6b-bfe5-160bb89af793', 'Quicksilver ', 'Quicksilver ', 'Quicksilver ', '<p><a href="">Quicksilver                <br></a></p>', '', 0, 'active'),
('547ea2d3-a0cc-436e-a5d0-1748b89af793', 'New Balance ', 'New Balance ', 'New Balance ', '<p><a href="">New Balance                <br></a></p>', '', 0, 'active'),
('547ea2ef-8d78-49f4-811b-1c5bb89af793', 'Replay ', 'Replay ', 'Replay ', '<p><a href="">Replay                <br></a></p>', '', 0, 'active');

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
('547e96df-75e0-4132-a81f-4f28b89af793', '', 'Dames', 'Dames ', 'Dames ', '<p><a href="">Dames            <br></a></p>', '', 0, 'active'),
('547e96f1-7e4c-42e7-9348-51c4b89af793', '', 'Heren ', 'Heren ', 'Heren ', '<p><a href="">Heren            <br></a></p>', '', 0, 'active'),
('547e9705-7b40-4c41-9264-5454b89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'Jassen ', 'Jassen ', 'Jassen ', '<p><a href="">Jassen            <br></a></p>', '', 0, 'active'),
('547e9712-73f8-462e-8ef1-55b8b89af793', '', 'Jeans/Broeken ', 'Jeans/Broeken ', 'Jeans/Broeken ', '<p><a href="">Jeans/Broeken            <br></a></p>', '', 0, 'active'),
('547e9723-4630-46a7-9eaa-57bcb89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'Blouses/Tunieken ', 'Blouses/Tunieken ', 'Blouses/Tunieken ', '<p><a href="">Blouses/Tunieken            <br></a></p>', '', 0, 'active'),
('547e972f-b8ac-455c-9005-5a39b89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'Jumpsuits & Playsuits ', 'Jumpsuits & Playsuits ', 'Jumpsuits & Playsuits ', '<p><a href="">Jumpsuits & Playsuits            <br></a></p>', '', 0, 'active'),
('547e973b-1d44-4281-b4a2-5b65b89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'Dresses ', 'Dresses ', 'Dresses ', '<p><a href="">Dresses            <br></a></p>', '', 0, 'active'),
('547e9749-d3c8-413b-923f-5ce9b89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'T-shirts ', 'T-shirts ', 'T-shirts ', '<p><a href="">T-shirts            <br></a></p>', '', 0, 'active'),
('547e9757-c410-451b-845c-5e61b89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'Shirts & Top ', 'Shirts & Top ', 'Shirts & Top ', '<p><a href="">Shirts & Top            <br></a></p>', '', 0, 'active'),
('547e9762-c238-42dd-8648-5f45b89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'Sweaters ', 'Sweaters ', 'Sweaters ', '<p><a href="">Sweaters            <br></a></p>', '', 0, 'active'),
('547e976e-dd64-407f-8dda-615fb89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'leather jackets ', 'leather jackets ', 'leather jackets ', '<p><a href="">leather jackets            <br></a></p>', '', 0, 'active'),
('547e977a-154c-41b6-b7da-6332b89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'Sneakers/Schoenen ', 'Sneakers/Schoenen ', 'Sneakers/Schoenen ', '<p><a href="">Sneakers/Schoenen            <br></a></p>', '', 0, 'active'),
('547e9787-4fc8-4d19-ab53-6503b89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'Armbanden ', 'Armbanden ', 'Armbanden ', '<p><a href="">Armbanden            <br></a></p>', '', 0, 'active'),
('547e9795-7414-4fc5-bcbf-66cab89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'Mutsen/shawls ', 'Mutsen/shawls ', 'Mutsen/shawls ', '<p><a href="">Mutsen/shawls            <br></a></p>', '', 0, 'active'),
('547e97a1-64c4-4cd2-aab1-67fab89af793', '547e96df-75e0-4132-a81f-4f28b89af793', 'Shorts ', 'Shorts ', 'Shorts ', '<p><a href="">Shorts            <br></a></p>', '', 0, 'active'),
('547e97b1-3874-42e2-ae06-6b2eb89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'Jassen ', 'Jassen ', 'Jassen ', '<p><a href="">Jassen            <br></a></p>', '', 0, 'active'),
('547e97c3-f218-43be-b108-6da6b89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'Jeans', 'Jeans', 'Jeans', '<p><a href="">Jeans<br></a></p>', '', 0, 'active'),
('547e97d2-b81c-434f-9c66-6f7db89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'T-Shirts ', 'T-Shirts ', 'T-Shirts ', '<p><a href="">T-Shirts            <br></a></p>', '', 0, 'active'),
('547e97e0-123c-4b02-91bc-71c3b89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'Sneakers/Schoenen ', 'Sneakers/Schoenen ', 'Sneakers/Schoenen ', '<p><a href="">Sneakers/Schoenen            <br></a></p>', '', 0, 'active'),
('547e97ed-9aac-4702-b048-737fb89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'Shirts & Polos ', 'Shirts & Polos ', 'Shirts & Polos ', '<p><a href="">Shirts & Polos            <br></a></p>', '', 0, 'active'),
('547e97fd-1a34-49a6-987c-75c5b89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'Sweaters ', 'Sweaters ', 'Sweaters ', '<p><a href="">Sweaters            <br></a></p>', '', 0, 'active'),
('547e980f-2874-45cc-9c18-77f3b89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'leather jackets ', 'leather jackets ', 'leather jackets ', '<p><a href="">leather jackets            <br></a></p>', '', 0, 'active'),
('547e981d-8290-4519-b44a-7b56b89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'Watches ', 'Watches ', 'Watches ', '<p><a href="">Watches            <br></a></p>', '', 0, 'active'),
('547e982c-c990-4c29-981d-7d2fb89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'Armbanden ', 'Armbanden ', 'Armbanden ', '<p><a href="">Armbanden            <br></a></p>', '', 0, 'active'),
('547e9839-ba24-4362-a5b4-7f13b89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'Mutsen/Handschoenen ', 'Mutsen/Handschoenen ', 'Mutsen/Handschoenen ', '<p><a href="">Mutsen/Handschoenen            <br></a></p>', '', 0, 'active'),
('547e9845-8c1c-4f81-93e3-01bbb89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'Socks ', 'Socks ', 'Socks ', '<p><a href="">Socks            <br></a></p>', '', 0, 'active'),
('547e9853-f924-471c-9c28-03edb89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'Boxershorts ', 'Boxershorts ', 'Boxershorts ', '<p><a href="">Boxershorts            <br></a></p>', '', 0, 'active'),
('547e9860-3c04-4f75-83e2-06c5b89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793', 'Knitwear ', 'Knitwear ', 'Knitwear ', '<p><a href="">Knitwear            <br></a></p>', '', 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` char(36) NOT NULL,
  `product_code` varchar(30) NOT NULL,
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

INSERT INTO `products` (`id`, `product_code`, `type_id`, `title`, `slug`, `meta_keys`, `meta_description`, `description`, `options`, `price`, `order`, `status`, `created`, `modified`) VALUES
('547eab4f-e884-4c1c-acb7-75cdb89af793', 'PTR970-FGW', '547ea717-bfc8-403c-871c-7f25b89af793', 'PME Jeans Commander PTR980-GDI', '', 'PME Legend', 'PME Legend', '<h1 class="product2ndtit1">PME Jeans Commander PTR980-GDI</h1>', '', 99.95, 0, 'active', '2014-12-03', '2014-12-03'),
('547eac01-3f98-4e8d-9c4a-17c1b89af793', 'PTR980-GDI', '547ea717-bfc8-403c-871c-7f25b89af793', 'PME Jeans Commander PTR980-GDI', '', 'PME Jeans Commander PTR980-GDI', 'PME Jeans Commander PTR980-GDI', '<p></p><h1 class="product2ndtit1">PME Jeans Commander PTR980-GDI</h1><p><br></p>', '', 101.3, 0, 'active', '2014-12-03', '2014-12-03'),
('547eac35-dc38-448c-b6f8-2114b89af793', 'PTR980-GDI', '547ea717-bfc8-403c-871c-7f25b89af793', 'PME Jeans Commander ', '', 'PME Jeans Commander ', 'PME Jeans Commander ', '<p>PME Jeans Commander <br><br></p>', '', 209.55, 0, 'active', '2014-12-03', '2014-12-03'),
('547eac65-d6f0-4107-91e2-3453b89af793', 'PTR980-GDSS', '547ea717-bfc8-403c-871c-7f25b89af793', 'PME Jeans Commander  TEst1', '', 'PME Jeans Commander  TEst1', 'PME Jeans Commander  TEst1', '<p>PME Jeans Commander&nbsp; TEst1<br></p>', '', 300, 0, 'active', '2014-12-03', '2014-12-03'),
('547ead35-051c-4e3e-92c5-671db89af793', 'PTR980-BTD', '547ea717-bfc8-403c-871c-7f25b89af793', 'PME jeans Commander PTR980-BTD', '', 'PME jeans Commander PTR980-BTD', 'PME jeans Commander PTR980-BTD', '<p></p><h1 class="product2ndtit1">PME jeans Commander PTR980-BTD</h1><p><br></p>', '', 99.95, 0, 'active', '2014-12-03', '2014-12-03'),
('547ead88-83e0-4a8d-a0ec-09ceb89af793', 'DDJDJ-2333', '547ea717-bfc8-403c-871c-7f25b89af793', 'airforce parka jacket', '', 'airforce parka jacket', 'airforce parka jacket', '<p>airforce parka jacket</p>', '', 299.5, 0, 'active', '2014-12-03', '2014-12-03'),
('547eadbd-c134-4804-bac3-1a5eb89af793', 'Alaska fire red', '547ea717-bfc8-403c-871c-7f25b89af793', 'Alaska fire red', '', 'Alaska fire red', 'Alaska fire red', '<p>Alaska fire red</p>', '', 269.95, 0, 'active', '2014-12-03', '2014-12-03'),
('547eae0e-d8e8-4b65-b7b9-274db89af793', 'PTR170-DPI', '547ea717-bfc8-403c-871c-7f25b89af793', 'PME Jeans Skyhawk PTR170-DPI', '', 'PME Jeans Skyhawk PTR170-DPI', 'PME Jeans Skyhawk PTR170-DPI', '<p>PME Jeans Skyhawk PTR170-DPI<br></p>', '', 109.95, 0, 'active', '2014-12-03', '2014-12-03'),
('547eae4d-7c14-453e-b226-3a66b89af793', 'PTR980-BTD', '547ea717-bfc8-403c-871c-7f25b89af793', 'PME jeans Commander PTR980-BTD', '', 'PME jeans Commander PTR980-BTD', 'PME jeans Commander PTR980-BTD', '<p>PME jeans Commander PTR980-BTD<br></p>', '', 99.95, 0, 'active', '2014-12-03', '2014-12-03'),
('547eae84-820c-42c4-bfb7-427eb89af793', 'MA-1 Flight', '547ea717-bfc8-403c-871c-7f25b89af793', 'PME Legend Leather ', '', 'PME Legend Leather ', 'PME Legend Leather ', '<p>PME Legend Leather <br><br></p>', '', 499.95, 0, 'active', '2014-12-03', '2014-12-03'),
('547eaed6-61e8-4498-a32d-5b6eb89af793', 'PME Legend', '547ea717-bfc8-403c-871c-7f25b89af793', 'PME Legend Heritage canvas fishtail parka', '', 'PME Legend Heritage canvas fishtail parka', 'PME Legend Heritage canvas fishtail parka', '<p>PME Legend Heritage canvas fishtail parka<br></p>', '', 269.95, 0, 'active', '2014-12-03', '2014-12-03'),
('547eaf0d-ad98-442f-970a-7eddb89af793', 'PME Legend ', '547ea717-bfc8-403c-871c-7f25b89af793', 'Short hooded jacket', '', 'Short hooded jacket', 'Short hooded jacket', '<p>Short hooded jacket<br></p>', '', 179.95, 0, 'active', '2014-12-03', '2014-12-03'),
('547eb0f9-4e1c-4b9f-a5f9-167bb89af793', 'PME jeans Commander jeans swea', '547eb006-4f04-4c55-957f-5304b89af793', 'Commander jeans swea', '', 'Commander jeans swea', 'Commander jeans swea', '<p>Commander jeans swea<br></p>', '', 100.99, 0, 'active', '2014-12-03', '2014-12-03'),
('547eb130-025c-4186-93dd-1e80b89af793', 'PTR47986-587', '547eb006-4f04-4c55-957f-5304b89af793', 'PME jeans Commander PTR980-BTD', '', 'PME jeans Commander PTR980-BTD', 'PME jeans Commander PTR980-BTD', '<p>PME jeans Commander PTR980-BTD<br></p>', '', 277.59, 0, 'active', '2014-12-03', '2014-12-03');

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
('547eab57-31f0-4be2-a232-7796b89af793', '547eab4f-e884-4c1c-acb7-75cdb89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547eac01-3b04-498f-b332-17c1b89af793', '547eac01-3f98-4e8d-9c4a-17c1b89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547eac35-6b84-4320-b49b-2114b89af793', '547eac35-dc38-448c-b6f8-2114b89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547eac65-50a4-4ebc-9647-3453b89af793', '547eac65-d6f0-4107-91e2-3453b89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547ead35-6500-4866-9c39-671db89af793', '547ead35-051c-4e3e-92c5-671db89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547ead88-3be0-4d93-9d5f-09ceb89af793', '547ead88-83e0-4a8d-a0ec-09ceb89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547eadbd-7890-4aa7-b067-1a5eb89af793', '547eadbd-c134-4804-bac3-1a5eb89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547eae0e-9178-4692-b187-274db89af793', '547eae0e-d8e8-4b65-b7b9-274db89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547eae4d-9b44-4604-8c0e-3a66b89af793', '547eae4d-7c14-453e-b226-3a66b89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547eae84-16b0-48f0-9cee-427eb89af793', '547eae84-820c-42c4-bfb7-427eb89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547eaed6-0ef4-47e3-9a77-5b6eb89af793', '547eaed6-61e8-4498-a32d-5b6eb89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547eaf0d-3a28-49ab-915c-7eddb89af793', '547eaf0d-ad98-442f-970a-7eddb89af793', '547ea717-ffb4-447b-8fcb-7f25b89af793'),
('547eb0fa-8538-4e56-8777-167bb89af793', '547eb0f9-4e1c-4b9f-a5f9-167bb89af793', '547eb006-bea8-4618-87e8-5304b89af793'),
('547eb130-c860-4602-86f9-1e80b89af793', '547eb130-025c-4186-93dd-1e80b89af793', '547eb006-bea8-4618-87e8-5304b89af793');

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
('547eab57-57a0-41b8-9270-7796b89af793', '547eab57-31f0-4be2-a232-7796b89af793', '547ea717-e370-49a3-9fcf-7f25b89af793', 0),
('547eab57-8884-48db-90fc-7796b89af793', '547eab57-31f0-4be2-a232-7796b89af793', '547ea717-69ac-4088-bd62-7f25b89af793', 0),
('547eab57-ce4c-43d3-9526-7796b89af793', '547eab57-31f0-4be2-a232-7796b89af793', '547ea717-96d8-468d-9693-7f25b89af793', 0),
('547eab57-e894-46e5-8258-7796b89af793', '547eab57-31f0-4be2-a232-7796b89af793', '547ea717-b3a4-47f2-baab-7f25b89af793', 0),
('547eac01-245c-4f1a-9d64-17c1b89af793', '547eac01-3b04-498f-b332-17c1b89af793', '547ea717-c788-4acf-a43e-7f25b89af793', 0),
('547eac01-381c-478f-9652-17c1b89af793', '547eac01-3b04-498f-b332-17c1b89af793', '547ea717-b3a4-47f2-baab-7f25b89af793', 0),
('547eac01-3e00-483c-a4c6-17c1b89af793', '547eac01-3b04-498f-b332-17c1b89af793', '547ea717-20bc-45e0-9aa8-7f25b89af793', 0),
('547eac01-4524-494d-91af-17c1b89af793', '547eac01-3b04-498f-b332-17c1b89af793', '547ea717-96d8-468d-9693-7f25b89af793', 0),
('547eac01-8238-4d0e-926b-17c1b89af793', '547eac01-3b04-498f-b332-17c1b89af793', '547ea717-69ac-4088-bd62-7f25b89af793', 0),
('547eac01-c250-4b6e-8e96-17c1b89af793', '547eac01-3b04-498f-b332-17c1b89af793', '547ea717-0844-4a7a-935c-7f25b89af793', 0),
('547eac01-e3c4-4eef-a9d1-17c1b89af793', '547eac01-3b04-498f-b332-17c1b89af793', '547ea717-e370-49a3-9fcf-7f25b89af793', 0),
('547eac35-2fdc-4964-9450-2114b89af793', '547eac35-6b84-4320-b49b-2114b89af793', '547ea717-c788-4acf-a43e-7f25b89af793', 0),
('547eac35-6e80-4d5e-821b-2114b89af793', '547eac35-6b84-4320-b49b-2114b89af793', '547ea717-b3a4-47f2-baab-7f25b89af793', 0),
('547eac35-dfa4-4c7b-afad-2114b89af793', '547eac35-6b84-4320-b49b-2114b89af793', '547ea717-e370-49a3-9fcf-7f25b89af793', 0),
('547eac65-13ac-405f-bf5a-3453b89af793', '547eac65-50a4-4ebc-9647-3453b89af793', '547ea717-e370-49a3-9fcf-7f25b89af793', 0),
('547eac65-20d8-43d9-9f9e-3453b89af793', '547eac65-50a4-4ebc-9647-3453b89af793', '547ea717-20bc-45e0-9aa8-7f25b89af793', 0),
('547eac65-7fa0-4f22-8091-3453b89af793', '547eac65-50a4-4ebc-9647-3453b89af793', '547ea717-b3a4-47f2-baab-7f25b89af793', 0),
('547eac65-d80c-4b54-855b-3453b89af793', '547eac65-50a4-4ebc-9647-3453b89af793', '547ea717-69ac-4088-bd62-7f25b89af793', 0),
('547ead35-0994-4707-97bc-671db89af793', '547ead35-6500-4866-9c39-671db89af793', '547ea717-20bc-45e0-9aa8-7f25b89af793', 0),
('547ead35-1258-4ea2-a504-671db89af793', '547ead35-6500-4866-9c39-671db89af793', '547ea717-0844-4a7a-935c-7f25b89af793', 0),
('547ead35-7b78-4f3b-b9b9-671db89af793', '547ead35-6500-4866-9c39-671db89af793', '547ea717-c788-4acf-a43e-7f25b89af793', 0),
('547ead35-b80c-408e-9608-671db89af793', '547ead35-6500-4866-9c39-671db89af793', '547ea717-69ac-4088-bd62-7f25b89af793', 0),
('547ead35-c460-4424-87b4-671db89af793', '547ead35-6500-4866-9c39-671db89af793', '547ea717-e370-49a3-9fcf-7f25b89af793', 0),
('547ead35-c7c8-4200-885e-671db89af793', '547ead35-6500-4866-9c39-671db89af793', '547ea717-b3a4-47f2-baab-7f25b89af793', 0),
('547ead35-e664-4696-b8c3-671db89af793', '547ead35-6500-4866-9c39-671db89af793', '547ea717-96d8-468d-9693-7f25b89af793', 0),
('547ead88-82ec-481b-a485-09ceb89af793', '547ead88-3be0-4d93-9d5f-09ceb89af793', '547ea717-69ac-4088-bd62-7f25b89af793', 0),
('547ead88-9904-4543-8c5e-09ceb89af793', '547ead88-3be0-4d93-9d5f-09ceb89af793', '547ea717-e370-49a3-9fcf-7f25b89af793', 0),
('547ead88-cbb0-4c83-83b7-09ceb89af793', '547ead88-3be0-4d93-9d5f-09ceb89af793', '547ea717-96d8-468d-9693-7f25b89af793', 0),
('547ead88-eb30-4309-93c9-09ceb89af793', '547ead88-3be0-4d93-9d5f-09ceb89af793', '547ea717-c788-4acf-a43e-7f25b89af793', 0),
('547eadbd-04c4-4eeb-a810-1a5eb89af793', '547eadbd-7890-4aa7-b067-1a5eb89af793', '547ea717-c788-4acf-a43e-7f25b89af793', 0),
('547eadbd-6820-45a4-b443-1a5eb89af793', '547eadbd-7890-4aa7-b067-1a5eb89af793', '547ea717-b3a4-47f2-baab-7f25b89af793', 0),
('547eadbd-bb14-4ca8-b454-1a5eb89af793', '547eadbd-7890-4aa7-b067-1a5eb89af793', '547ea717-96d8-468d-9693-7f25b89af793', 0),
('547eae0e-1a68-4056-a59c-274db89af793', '547eae0e-9178-4692-b187-274db89af793', '547ea717-69ac-4088-bd62-7f25b89af793', 0),
('547eae0e-2e7c-4efb-a477-274db89af793', '547eae0e-9178-4692-b187-274db89af793', '547ea717-20bc-45e0-9aa8-7f25b89af793', 0),
('547eae0e-3640-4e72-b029-274db89af793', '547eae0e-9178-4692-b187-274db89af793', '547ea717-e370-49a3-9fcf-7f25b89af793', 0),
('547eae0e-421c-4fd6-a9d3-274db89af793', '547eae0e-9178-4692-b187-274db89af793', '547ea717-96d8-468d-9693-7f25b89af793', 0),
('547eae4d-25b8-403a-bf2a-3a66b89af793', '547eae4d-9b44-4604-8c0e-3a66b89af793', '547ea717-69ac-4088-bd62-7f25b89af793', 0),
('547eae4d-5c44-47d3-8633-3a66b89af793', '547eae4d-9b44-4604-8c0e-3a66b89af793', '547ea717-c788-4acf-a43e-7f25b89af793', 0),
('547eae4d-a37c-4b90-b353-3a66b89af793', '547eae4d-9b44-4604-8c0e-3a66b89af793', '547ea717-20bc-45e0-9aa8-7f25b89af793', 0),
('547eae4d-c25c-4a08-8420-3a66b89af793', '547eae4d-9b44-4604-8c0e-3a66b89af793', '547ea717-96d8-468d-9693-7f25b89af793', 0),
('547eae84-2810-4c7b-a148-427eb89af793', '547eae84-16b0-48f0-9cee-427eb89af793', '547ea717-c788-4acf-a43e-7f25b89af793', 0),
('547eae84-3348-4fd4-b51f-427eb89af793', '547eae84-16b0-48f0-9cee-427eb89af793', '547ea717-69ac-4088-bd62-7f25b89af793', 0),
('547eae84-3900-437b-8590-427eb89af793', '547eae84-16b0-48f0-9cee-427eb89af793', '547ea717-96d8-468d-9693-7f25b89af793', 0),
('547eae84-8814-4ea5-b609-427eb89af793', '547eae84-16b0-48f0-9cee-427eb89af793', '547ea717-0844-4a7a-935c-7f25b89af793', 0),
('547eaed6-1478-4769-88ad-5b6eb89af793', '547eaed6-0ef4-47e3-9a77-5b6eb89af793', '547ea717-96d8-468d-9693-7f25b89af793', 0),
('547eaed6-6dc8-46bf-a9a4-5b6eb89af793', '547eaed6-0ef4-47e3-9a77-5b6eb89af793', '547ea717-e370-49a3-9fcf-7f25b89af793', 0),
('547eaed6-b42c-49f2-86f2-5b6eb89af793', '547eaed6-0ef4-47e3-9a77-5b6eb89af793', '547ea717-69ac-4088-bd62-7f25b89af793', 0),
('547eaed6-b8d4-4b66-b9a5-5b6eb89af793', '547eaed6-0ef4-47e3-9a77-5b6eb89af793', '547ea717-0844-4a7a-935c-7f25b89af793', 0),
('547eaed6-c508-4175-b2ce-5b6eb89af793', '547eaed6-0ef4-47e3-9a77-5b6eb89af793', '547ea717-b3a4-47f2-baab-7f25b89af793', 0),
('547eaf0d-0bec-499f-84c2-7eddb89af793', '547eaf0d-3a28-49ab-915c-7eddb89af793', '547ea717-20bc-45e0-9aa8-7f25b89af793', 0),
('547eaf0d-53a8-42df-82e3-7eddb89af793', '547eaf0d-3a28-49ab-915c-7eddb89af793', '547ea717-96d8-468d-9693-7f25b89af793', 0),
('547eaf0d-7db4-46f9-bc75-7eddb89af793', '547eaf0d-3a28-49ab-915c-7eddb89af793', '547ea717-e370-49a3-9fcf-7f25b89af793', 0),
('547eaf0d-bbb4-4334-9f11-7eddb89af793', '547eaf0d-3a28-49ab-915c-7eddb89af793', '547ea717-69ac-4088-bd62-7f25b89af793', 0),
('547eaf0d-ea0c-4512-b503-7eddb89af793', '547eaf0d-3a28-49ab-915c-7eddb89af793', '547ea717-b3a4-47f2-baab-7f25b89af793', 0),
('547eb0fa-1c28-453d-9454-167bb89af793', '547eb0fa-8538-4e56-8777-167bb89af793', '547eb006-222c-4644-a805-5304b89af793', 0),
('547eb0fa-2cec-4dda-9246-167bb89af793', '547eb0fa-8538-4e56-8777-167bb89af793', '547eb006-41d8-4276-916c-5304b89af793', 0),
('547eb0fa-33ac-43ff-9dc6-167bb89af793', '547eb0fa-8538-4e56-8777-167bb89af793', '547eb006-9c78-4b86-8d87-5304b89af793', 0),
('547eb0fa-3c4c-43d4-9375-167bb89af793', '547eb0fa-8538-4e56-8777-167bb89af793', '547eb006-378c-4b36-ac92-5304b89af793', 0),
('547eb0fa-4500-44e1-a6e5-167bb89af793', '547eb0fa-8538-4e56-8777-167bb89af793', '547eb006-45e4-4977-94c9-5304b89af793', 0),
('547eb0fa-84b4-411b-9c91-167bb89af793', '547eb0fa-8538-4e56-8777-167bb89af793', '547eb006-2e34-43df-8001-5304b89af793', 0),
('547eb0fa-d250-4807-bfbf-167bb89af793', '547eb0fa-8538-4e56-8777-167bb89af793', '547eb006-1844-42ac-8379-5304b89af793', 0),
('547eb0fa-ef7c-48e6-b6bc-167bb89af793', '547eb0fa-8538-4e56-8777-167bb89af793', '547eb006-2d40-4ddd-8650-5304b89af793', 0),
('547eb130-13d8-4efb-9f35-1e80b89af793', '547eb130-c860-4602-86f9-1e80b89af793', '547eb006-2e34-43df-8001-5304b89af793', 0),
('547eb130-53b4-4e2a-9536-1e80b89af793', '547eb130-c860-4602-86f9-1e80b89af793', '547eb006-45e4-4977-94c9-5304b89af793', 0),
('547eb130-6154-44e1-a4e7-1e80b89af793', '547eb130-c860-4602-86f9-1e80b89af793', '547eb006-2d40-4ddd-8650-5304b89af793', 0),
('547eb130-8180-4e70-9948-1e80b89af793', '547eb130-c860-4602-86f9-1e80b89af793', '547eb006-222c-4644-a805-5304b89af793', 0),
('547eb130-8cb8-4d84-b953-1e80b89af793', '547eb130-c860-4602-86f9-1e80b89af793', '547eb006-1844-42ac-8379-5304b89af793', 0),
('547eb130-9384-4080-9ff2-1e80b89af793', '547eb130-c860-4602-86f9-1e80b89af793', '547eb006-41d8-4276-916c-5304b89af793', 0),
('547eb130-ddcc-40c5-9282-1e80b89af793', '547eb130-c860-4602-86f9-1e80b89af793', '547eb006-378c-4b36-ac92-5304b89af793', 0),
('547eb130-f56c-48fe-9cf7-1e80b89af793', '547eb130-c860-4602-86f9-1e80b89af793', '547eb006-9c78-4b86-8d87-5304b89af793', 0);

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
('547eab57-02f4-45eb-9207-7796b89af793', '547eab4f-e884-4c1c-acb7-75cdb89af793', '547ea0fa-9bcc-45c1-a962-5a8fb89af793'),
('547eab57-fbc8-45e6-8e1a-7796b89af793', '547eab4f-e884-4c1c-acb7-75cdb89af793', '547ea200-5590-4349-bd5c-7aaeb89af793'),
('547eac01-d9e8-4d5d-a876-17c1b89af793', '547eac01-3f98-4e8d-9c4a-17c1b89af793', '547ea200-5590-4349-bd5c-7aaeb89af793'),
('547eac01-ea4c-4e9b-94ae-17c1b89af793', '547eac01-3f98-4e8d-9c4a-17c1b89af793', '547ea209-9924-4325-8e63-7bccb89af793'),
('547eac35-9b50-466a-8cbe-2114b89af793', '547eac35-dc38-448c-b6f8-2114b89af793', '547ea212-7bb8-4837-bfd1-7c98b89af793'),
('547eac35-bfac-455b-bfe0-2114b89af793', '547eac35-dc38-448c-b6f8-2114b89af793', '547ea209-9924-4325-8e63-7bccb89af793'),
('547eac65-3d64-49c3-b6d8-3453b89af793', '547eac65-d6f0-4107-91e2-3453b89af793', '547ea200-5590-4349-bd5c-7aaeb89af793'),
('547eac65-9074-41d0-b2fb-3453b89af793', '547eac65-d6f0-4107-91e2-3453b89af793', '547ea212-7bb8-4837-bfd1-7c98b89af793'),
('547eac65-f6f0-4c92-8832-3453b89af793', '547eac65-d6f0-4107-91e2-3453b89af793', '547ea209-9924-4325-8e63-7bccb89af793'),
('547ead35-236c-4c3a-a9ea-671db89af793', '547ead35-051c-4e3e-92c5-671db89af793', '547ea0fa-9bcc-45c1-a962-5a8fb89af793'),
('547ead35-3d4c-4275-951c-671db89af793', '547ead35-051c-4e3e-92c5-671db89af793', '547ea209-9924-4325-8e63-7bccb89af793'),
('547ead35-7cb8-436d-8372-671db89af793', '547ead35-051c-4e3e-92c5-671db89af793', '547ea200-5590-4349-bd5c-7aaeb89af793'),
('547ead88-4114-44b1-be48-09ceb89af793', '547ead88-83e0-4a8d-a0ec-09ceb89af793', '547ea0fa-9bcc-45c1-a962-5a8fb89af793'),
('547ead88-4244-4ca8-86fb-09ceb89af793', '547ead88-83e0-4a8d-a0ec-09ceb89af793', '547ea209-9924-4325-8e63-7bccb89af793'),
('547ead88-e69c-4430-b5a2-09ceb89af793', '547ead88-83e0-4a8d-a0ec-09ceb89af793', '547ea200-5590-4349-bd5c-7aaeb89af793'),
('547eadbd-19c8-48bb-90a6-1a5eb89af793', '547eadbd-c134-4804-bac3-1a5eb89af793', '547ea209-9924-4325-8e63-7bccb89af793'),
('547eadbd-75b8-42df-951d-1a5eb89af793', '547eadbd-c134-4804-bac3-1a5eb89af793', '547ea200-5590-4349-bd5c-7aaeb89af793'),
('547eadbd-b0d8-486a-94bd-1a5eb89af793', '547eadbd-c134-4804-bac3-1a5eb89af793', '547ea0fa-9bcc-45c1-a962-5a8fb89af793'),
('547eadbd-b540-4730-9208-1a5eb89af793', '547eadbd-c134-4804-bac3-1a5eb89af793', '547ea212-7bb8-4837-bfd1-7c98b89af793'),
('547eae0e-1650-4e89-8355-274db89af793', '547eae0e-d8e8-4b65-b7b9-274db89af793', '547ea200-5590-4349-bd5c-7aaeb89af793'),
('547eae0e-4020-4ab2-b6d9-274db89af793', '547eae0e-d8e8-4b65-b7b9-274db89af793', '547ea0fa-9bcc-45c1-a962-5a8fb89af793'),
('547eae0e-450c-45ef-a917-274db89af793', '547eae0e-d8e8-4b65-b7b9-274db89af793', '547ea209-9924-4325-8e63-7bccb89af793'),
('547eae4d-1828-44d2-ac58-3a66b89af793', '547eae4d-7c14-453e-b226-3a66b89af793', '547ea200-5590-4349-bd5c-7aaeb89af793'),
('547eae4d-7d54-4ddb-b0df-3a66b89af793', '547eae4d-7c14-453e-b226-3a66b89af793', '547ea0fa-9bcc-45c1-a962-5a8fb89af793'),
('547eae4d-c660-4e9f-8f97-3a66b89af793', '547eae4d-7c14-453e-b226-3a66b89af793', '547ea209-9924-4325-8e63-7bccb89af793'),
('547eae84-ab78-4f3f-bc4c-427eb89af793', '547eae84-820c-42c4-bfb7-427eb89af793', '547ea200-5590-4349-bd5c-7aaeb89af793'),
('547eae84-da2c-4c69-bf41-427eb89af793', '547eae84-820c-42c4-bfb7-427eb89af793', '547ea209-9924-4325-8e63-7bccb89af793'),
('547eae84-e80c-4358-9f3e-427eb89af793', '547eae84-820c-42c4-bfb7-427eb89af793', '547ea0fa-9bcc-45c1-a962-5a8fb89af793'),
('547eae84-efe8-4471-b081-427eb89af793', '547eae84-820c-42c4-bfb7-427eb89af793', '547ea212-7bb8-4837-bfd1-7c98b89af793'),
('547eaed6-05a0-4af9-907d-5b6eb89af793', '547eaed6-61e8-4498-a32d-5b6eb89af793', '547ea223-5044-481c-b47f-7e41b89af793'),
('547eaed6-0b94-4e9f-8d0e-5b6eb89af793', '547eaed6-61e8-4498-a32d-5b6eb89af793', '547ea235-2d38-4c43-846a-02abb89af793'),
('547eaed6-612c-4015-ae9c-5b6eb89af793', '547eaed6-61e8-4498-a32d-5b6eb89af793', '547ea200-5590-4349-bd5c-7aaeb89af793'),
('547eaf0d-2300-438e-86a2-7eddb89af793', '547eaf0d-ad98-442f-970a-7eddb89af793', '547ea27b-fc38-4b6c-b01e-0c54b89af793'),
('547eaf0d-6b84-4f43-99cd-7eddb89af793', '547eaf0d-ad98-442f-970a-7eddb89af793', '547ea2d3-a0cc-436e-a5d0-1748b89af793'),
('547eaf0d-d4bc-49ce-b0db-7eddb89af793', '547eaf0d-ad98-442f-970a-7eddb89af793', '547ea2b9-f7a8-41db-8058-147cb89af793'),
('547eb0fa-7748-4cdf-b1b6-167bb89af793', '547eb0f9-4e1c-4b9f-a5f9-167bb89af793', '547ea0fa-9bcc-45c1-a962-5a8fb89af793'),
('547eb0fa-95c4-4ca0-9b32-167bb89af793', '547eb0f9-4e1c-4b9f-a5f9-167bb89af793', '547ea209-9924-4325-8e63-7bccb89af793'),
('547eb130-8b14-437c-8c36-1e80b89af793', '547eb130-025c-4186-93dd-1e80b89af793', '547ea209-9924-4325-8e63-7bccb89af793'),
('547eb130-9558-4e62-9cf6-1e80b89af793', '547eb130-025c-4186-93dd-1e80b89af793', '547ea223-5044-481c-b47f-7e41b89af793'),
('547eb130-c6b4-429e-a49c-1e80b89af793', '547eb130-025c-4186-93dd-1e80b89af793', '547ea21b-2cbc-4013-b0c3-7d5ab89af793');

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
('547eab57-d49c-4a6a-a493-7796b89af793', '547eab4f-e884-4c1c-acb7-75cdb89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547eac01-96e0-49e6-b08d-17c1b89af793', '547eac01-3f98-4e8d-9c4a-17c1b89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547eac35-b800-4df4-b712-2114b89af793', '547eac35-dc38-448c-b6f8-2114b89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547eac65-5c64-404b-9d90-3453b89af793', '547eac65-d6f0-4107-91e2-3453b89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547ead35-5268-44f2-8667-671db89af793', '547ead35-051c-4e3e-92c5-671db89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547ead88-584c-41dd-92c9-09ceb89af793', '547ead88-83e0-4a8d-a0ec-09ceb89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547eadbd-678c-4d0b-aea1-1a5eb89af793', '547eadbd-c134-4804-bac3-1a5eb89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547eae0e-3e04-4352-96ae-274db89af793', '547eae0e-d8e8-4b65-b7b9-274db89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547eae4d-dc08-4d28-b10a-3a66b89af793', '547eae4d-7c14-453e-b226-3a66b89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547eae84-774c-4030-b944-427eb89af793', '547eae84-820c-42c4-bfb7-427eb89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547eaed6-6be4-4f7a-8d69-5b6eb89af793', '547eaed6-61e8-4498-a32d-5b6eb89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547eaf0d-45e8-45d2-b6e6-7eddb89af793', '547eaf0d-ad98-442f-970a-7eddb89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547eb0fa-0920-4027-908d-167bb89af793', '547eb0f9-4e1c-4b9f-a5f9-167bb89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793'),
('547eb130-8a78-4102-a793-1e80b89af793', '547eb130-025c-4186-93dd-1e80b89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793');

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
('547eab57-30c8-445b-9dbd-7796b89af793', '547eab4f-e884-4c1c-acb7-75cdb89af793', 'jpg'),
('547eab57-d224-42c8-b09b-7796b89af793', '547eab4f-e884-4c1c-acb7-75cdb89af793', 'png'),
('547eab57-f5f0-4f1d-bc0f-7796b89af793', '547eab4f-e884-4c1c-acb7-75cdb89af793', 'jpg'),
('547eac01-5c80-47ec-a1de-17c1b89af793', '547eac01-3f98-4e8d-9c4a-17c1b89af793', 'jpg'),
('547eac01-a2c8-435b-9107-17c1b89af793', '547eac01-3f98-4e8d-9c4a-17c1b89af793', 'jpg'),
('547eac35-516c-4a8f-8313-2114b89af793', '547eac35-dc38-448c-b6f8-2114b89af793', 'jpg'),
('547eac35-a4e8-44c3-abd1-2114b89af793', '547eac35-dc38-448c-b6f8-2114b89af793', 'jpg'),
('547eac35-b20c-466b-b0c5-2114b89af793', '547eac35-dc38-448c-b6f8-2114b89af793', 'jpg'),
('547eac65-3178-4ef9-8d01-3453b89af793', '547eac65-d6f0-4107-91e2-3453b89af793', 'jpg'),
('547eac65-98bc-4848-922b-3453b89af793', '547eac65-d6f0-4107-91e2-3453b89af793', 'jpg'),
('547eac65-e05c-4f2b-b1a3-3453b89af793', '547eac65-d6f0-4107-91e2-3453b89af793', 'jpg'),
('547ead35-4e84-429d-9f4e-671db89af793', '547ead35-051c-4e3e-92c5-671db89af793', 'jpg'),
('547ead35-a410-443b-bc60-671db89af793', '547ead35-051c-4e3e-92c5-671db89af793', 'jpg'),
('547ead35-ccd4-4e2f-a18a-671db89af793', '547ead35-051c-4e3e-92c5-671db89af793', 'jpg'),
('547ead88-635c-43b2-b22e-09ceb89af793', '547ead88-83e0-4a8d-a0ec-09ceb89af793', 'jpg'),
('547ead88-d9d4-400b-994a-09ceb89af793', '547ead88-83e0-4a8d-a0ec-09ceb89af793', 'jpg'),
('547ead88-e290-401b-9c46-09ceb89af793', '547ead88-83e0-4a8d-a0ec-09ceb89af793', 'jpg'),
('547eadbd-3ac8-4e06-a7e8-1a5eb89af793', '547eadbd-c134-4804-bac3-1a5eb89af793', 'jpg'),
('547eadbd-d818-4c0e-83c0-1a5eb89af793', '547eadbd-c134-4804-bac3-1a5eb89af793', 'jpg'),
('547eae0e-6240-408b-ac36-274db89af793', '547eae0e-d8e8-4b65-b7b9-274db89af793', 'jpg'),
('547eae0e-62d8-4121-b99e-274db89af793', '547eae0e-d8e8-4b65-b7b9-274db89af793', 'jpg'),
('547eae0e-75bc-4f15-ac17-274db89af793', '547eae0e-d8e8-4b65-b7b9-274db89af793', 'jpg'),
('547eae4d-0e00-4409-85fe-3a66b89af793', '547eae4d-7c14-453e-b226-3a66b89af793', 'jpg'),
('547eae4d-5294-4b01-987e-3a66b89af793', '547eae4d-7c14-453e-b226-3a66b89af793', 'jpg'),
('547eae4d-f2bc-4b33-86d1-3a66b89af793', '547eae4d-7c14-453e-b226-3a66b89af793', 'jpg'),
('547eae84-5084-4ec5-846e-427eb89af793', '547eae84-820c-42c4-bfb7-427eb89af793', 'jpg'),
('547eae84-9178-4cd2-ba3c-427eb89af793', '547eae84-820c-42c4-bfb7-427eb89af793', 'jpg'),
('547eae84-a99c-4589-b1ad-427eb89af793', '547eae84-820c-42c4-bfb7-427eb89af793', 'jpg'),
('547eaed6-349c-4718-be18-5b6eb89af793', '547eaed6-61e8-4498-a32d-5b6eb89af793', 'jpg'),
('547eaed6-b0b4-4ade-abb6-5b6eb89af793', '547eaed6-61e8-4498-a32d-5b6eb89af793', 'jpg'),
('547eaed6-d784-44d1-af6c-5b6eb89af793', '547eaed6-61e8-4498-a32d-5b6eb89af793', 'jpg'),
('547eaf0d-2ea8-42c3-9a55-7eddb89af793', '547eaf0d-ad98-442f-970a-7eddb89af793', 'jpg'),
('547eaf0d-35a8-45ee-8303-7eddb89af793', '547eaf0d-ad98-442f-970a-7eddb89af793', 'jpg'),
('547eaf0d-9648-496b-9138-7eddb89af793', '547eaf0d-ad98-442f-970a-7eddb89af793', 'jpg'),
('547eb0fa-5390-4c2c-817b-167bb89af793', '547eb0f9-4e1c-4b9f-a5f9-167bb89af793', 'jpg'),
('547eb0fa-7c08-4258-a96e-167bb89af793', '547eb0f9-4e1c-4b9f-a5f9-167bb89af793', 'jpg'),
('547eb0fa-8d5c-4141-ab95-167bb89af793', '547eb0f9-4e1c-4b9f-a5f9-167bb89af793', 'jpg'),
('547eb130-5ab4-4bb7-a4b4-1e80b89af793', '547eb130-025c-4186-93dd-1e80b89af793', 'jpg'),
('547eb130-a8b8-43a9-a11b-1e80b89af793', '547eb130-025c-4186-93dd-1e80b89af793', 'jpg'),
('547eb130-eccc-49c0-a6f0-1e80b89af793', '547eb130-025c-4186-93dd-1e80b89af793', 'jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE IF NOT EXISTS `product_orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `client_detail` text NOT NULL,
  `order_detail` text NOT NULL,
  `payment_detail` text NOT NULL,
  `payment_status` tinytext,
  `status` tinytext NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `complete_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `client_detail`, `order_detail`, `payment_detail`, `payment_status`, `status`, `order_date`, `complete_date`) VALUES
(10, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24},{"attributes":{"Color":"White","Size":"large"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"96","quantity":"4","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 10:43:05', '0000-00-00 00:00:00'),
(11, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24},{"attributes":{"Color":"White","Size":"large"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"96","quantity":"4","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 10:45:03', '0000-00-00 00:00:00'),
(12, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24},{"attributes":{"Color":"White","Size":"large"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"96","quantity":"4","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 10:45:09', '0000-00-00 00:00:00'),
(13, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24},{"attributes":{"Color":"White","Size":"large"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"96","quantity":"4","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 10:45:14', '0000-00-00 00:00:00'),
(14, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24},{"attributes":{"Color":"White","Size":"large"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"96","quantity":"4","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 10:45:50', '0000-00-00 00:00:00'),
(15, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24},{"attributes":{"Color":"White","Size":"large"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"96","quantity":"4","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 10:46:28', '0000-00-00 00:00:00'),
(16, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 11:23:28', '0000-00-00 00:00:00'),
(17, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 11:23:40', '0000-00-00 00:00:00'),
(18, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 11:23:52', '0000-00-00 00:00:00'),
(19, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 11:26:46', '0000-00-00 00:00:00'),
(20, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 11:26:57', '0000-00-00 00:00:00'),
(21, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 11:28:16', '0000-00-00 00:00:00'),
(22, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Medium"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 11:47:13', '0000-00-00 00:00:00'),
(23, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Small"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24}]', '', NULL, 'ordered', '2014-11-23 14:08:43', '0000-00-00 00:00:00'),
(24, '"{\\"Client\\":{\\"id\\":\\"5448f286-8f8c-4b6d-b002-04a3cdd1d5ac\\",\\"username\\":\\"zubayer@w3-app.com\\",\\"details\\":\\"{\\\\\\"first_name\\\\\\":\\\\\\"abdullah \\\\\\",\\\\\\"last_name\\\\\\":\\\\\\"zubayer\\\\\\",\\\\\\"address_line_1\\\\\\":\\\\\\"address 1\\\\\\",\\\\\\"address_line_2\\\\\\":\\\\\\"address 2\\\\\\",\\\\\\"zip\\\\\\":\\\\\\"zipcode\\\\\\",\\\\\\"cell\\\\\\":\\\\\\"01731921635\\\\\\"}\\",\\"created\\":\\"2014-10-23 18:20:22\\"}}"', '[{"attributes":{"Color":"White","Size":"Small"},"cartThumbImage":"http:\\/\\/localhost\\/cms\\/img\\/site\\/products\\/547059a8-06dc-4715-a6ae-1f0dcdd1d5ac.jpeg","product_id":"546f4bca-ec10-4744-91f2-049fcdd1d5ac","product_title":"dsf","cost":"24","quantity":"1","unitPrice":24}]', '', NULL, 'ordered', '2014-11-28 03:50:21', '0000-00-00 00:00:00'),
(25, 'null', 'null', '', NULL, 'ordered', '2014-12-01 12:15:56', '0000-00-00 00:00:00'),
(26, 'null', 'null', '', NULL, 'ordered', '2014-12-01 12:17:46', '0000-00-00 00:00:00');

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
  `title` varchar(250) NOT NULL,
  `details` text NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `order` int(11) NOT NULL,
  `status` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `title`, `details`, `latitude`, `longitude`, `order`, `status`) VALUES
('547eb604-d7e8-46e8-bcd7-3e63b89af793', 'Store 1', 'Time Out\r\nGeversdeijnootweg 990-50\r\n2586 BZ\r\nScheveningen ', 52.1142, 4.28416, 0, 'active'),
('547eb649-3aa8-476c-afa2-5798b89af793', 'Store 2', 'Time Out\r\nLijnbaan 110-Links\r\n3012 ER\r\nRotterdam', 51.9195, 4.47772, 0, 'active'),
('547eb66d-7ce4-472b-97ea-6057b89af793', 'Store 3', 'Time Out\r\nKerkstraat 3\r\n''s-Hertogenbosch', 51.6887, 5.30454, 0, 'active');

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
('547ea717-bfc8-403c-871c-7f25b89af793', 'Dames', 'Dames', 'active'),
('547eb006-4f04-4c55-957f-5304b89af793', 'Heren ', 'Heren ', 'active'),
('547ec562-1ee4-4a82-a209-3589b89af793', 'Jassen', 'Jassen', 'active');

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
('547ea717-60a8-40bd-8f8c-7f25b89af793', '547ea717-bfc8-403c-871c-7f25b89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547ea721-7b28-401d-bb18-030fb89af793', '547ea717-bfc8-403c-871c-7f25b89af793', '547e96df-75e0-4132-a81f-4f28b89af793'),
('547eb006-356c-42d5-a5b2-5304b89af793', '547eb006-4f04-4c55-957f-5304b89af793', '547e96f1-7e4c-42e7-9348-51c4b89af793'),
('547ec562-e480-4cc8-bc62-3589b89af793', '547ec562-1ee4-4a82-a209-3589b89af793', '547e9705-7b40-4c41-9264-5454b89af793');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
