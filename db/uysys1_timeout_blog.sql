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
-- Database: `uysys1_timeout_blog`
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
('5431830a-7f8c-4285-8f30-0a63cdd1d5ac', '', 'Angular Js', '', 'Blog Category 1', 'Blog Category 1', '<p>lorem ipsum de blog category. lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.v</p><p><br></p><p>lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.</p><p><br></p><p>lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.lorem ipsum de blog category.<br></p>', 'active'),
('54379416-cb24-48fa-8b4a-01e2cdd1d5ac', '', 'Node Js', '', 'Blog Category 2', 'Blog Category 2', '<p>lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2.&nbsp;</p><p><br></p><p>lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2.&nbsp;</p><p><br></p><p>lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2.&nbsp;</p><p><br></p><p>lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. lorem ipsub de blog category 2. <br></p>', 'active');

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
('546dff8e-f188-472f-b7f8-1128cdd1d5ac', '["5431830a-7f8c-4285-8f30-0a63cdd1d5ac"]', '542391f1-037c-41a3-a270-0cadcdd1d5ac', 'Angular Js', '', 'Angular Js', 'Angular Js', '<p></p><p>HTML is great for declaring static documents, but it falters when we try to use it for            declaring dynamic views in web-applications. AngularJS lets you extend HTML vocabulary            for your application. The resulting environment is extraordinarily expressive, readable,            and quick to develop.</p><p>Other frameworks deal with HTMLâ€™s shortcomings by either abstracting away HTML, CSS,            and/or JavaScript or by providing an imperative way for manipulating the DOM. Neither of            these address the root problem that HTML was not designed for dynamic views.</p>AngularJS is a toolset for building the framework most suited to your application            development. It is fully extensible and works well with other libraries. Every feature            can be modified or replaced to suit your unique development workflow and feature needs.            Read on to find out how.          <p><br></p>', 'active', '2014-11-20', '2014-11-20'),
('546dffe0-4e94-4123-ad23-0ca9cdd1d5ac', '["54379416-cb24-48fa-8b4a-01e2cdd1d5ac"]', '542391f1-037c-41a3-a270-0cadcdd1d5ac', 'Node Js ', '', 'Node Js ', 'Node Js ', '<p></p><p>            Before we talk about all the technical stuff, let''s take a            moment and talk about you and your relationship with            JavaScript. This chapter is here to allow you to estimate            if reading this document any further makes sense for you.        </p><p>            If you are like me, you started with HTML "development"            long ago, by writing HTML documents. You came along this            funny thing called JavaScript, but you only used it in a            very basic way, adding interactivity to your web pages            every now and then.        </p><p>            What you really wanted was "the real thing", you wanted to            know how to build complex web sites - you learned a            programming language like PHP, Ruby, Java, and started            writing "backend" code.        </p><p>            Nevertheless, you kept an eye on JavaScript, you saw that            with the introduction of jQuery, Prototype and the likes,            things got more advanced in JavaScript land, and that this            language really was about more than <em>window.open()</em>.        </p><p>            However, this was all still frontend stuff, and although it            was nice to have jQuery at your disposal whenever you felt            like spicing up a web page, at the end of the day you were,            at best, a JavaScript <em>user</em>, but not a JavaScript            <em>developer</em>.        </p><p>            And then came Node.js. JavaScript on the server, how cool            is that?        </p><p>            You decided that it''s about time to check out the old, new            JavaScript. But wait, writing Node.js applications is the            one thing; understanding why they need to be written the            way they are written means - understanding JavaScript.            And this time for real.        </p><p>            Here is the problem: Because JavaScript really lives two,            maybe even three lives (the funny little DHTML helper from            the mid-90''s, the more serious frontend stuff like jQuery            and the likes, and now server-side), it''s not that easy to            find information that helps you to learn JavaScript the            "right" way, in order to write Node.js applications in a            fashion that makes you feel you are not just using            JavaScript, you are actually developing it.        </p><p>            Because that''s the catch: you already are an experienced            developer, you don''t want to learn a new technique by just            hacking around and mis-using it; you want to be sure that            you are approaching it from the right angle.        </p><p>            There is, of course, excellent documentation out there.            But documentation alone sometimes isn''t enough. What is            needed is guidance.        </p><p>            My goal is to provide a guide for you.        </p><h4>A word of warning</h4><p>            There are some really excellent JavaScript people out            there. I''m not one of them.        </p><p>            I''m really just the guy I talked about in the previous            paragraph. I know a thing or two about developing backend            web applications, but I''m still new to "real" JavaScript            and still new to Node.js. I learned some of the more            advanced aspects of JavaScript just recently.            I''m not experienced.        </p><p>            Which is why this is no "from novice to expert" book. It''s            more like "from novice to advanced novice".        </p><p>            If I don''t fail, then this will be the kind of            document I wish I had when starting with Node.js.        </p><h4>Server-side JavaScript</h4><p>            The first incarnations of JavaScript lived in browsers.            But this is just the context. It defines what you can            do with the language, but it doesn''t say much about what            the language itself can do. JavaScript is a "complete"            language: you can use it in many contexts and achieve            everything with it you can achieve with any other            "complete" language.        </p><p>            Node.js really is just another context: it allows you to run            JavaScript code in the backend, outside a browser.        </p><p>            In order to execute the JavaScript you intend to run in the            backend, it needs to be interpreted and, well, executed.            This is what Node.js does, by making use of Google''s V8 VM, the            same runtime environment for JavaScript that Google            Chrome uses.        </p><p>            Plus, Node.js ships with a lot of useful modules, so you don''t            have to write everything from scratch, like for example            something that outputs a string on the console.        </p><p>            Thus, Node.js is really two things: a runtime environment and a            library.        </p><p>            In order to make use of these, you need to install Node.js.            Instead of repeating the process here, I kindly ask you to            visit            <a href="https://github.com/joyent/node/wiki/Installation" title="Building and Installing Node.js">the                official                installation instructions</a>. Please come back once you            are up and running.        </p><p><br></p>', 'active', '2014-11-20', '2014-11-20');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
