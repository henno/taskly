-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 22, 2013 at 05:58 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `taskly`
--
CREATE DATABASE IF NOT EXISTS `taskly` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `taskly`;

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
CREATE TABLE IF NOT EXISTS `event_type` (
  `event_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_type_name` varchar(255) NOT NULL,
  `event_type_color` char(6) NOT NULL,
  `event_type_filename` varchar(255) NOT NULL,
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`event_type_id`, `event_type_name`, `event_type_color`, `event_type_filename`) VALUES
(1, 'logis sisse', '', 'login'),
(2, 'logis välja', '', 'logout'),
(3, 'lisas töö', '', 'task_add'),
(4, 'muutis tööd', '', 'task_edit'),
(5, 'eemaldas töö', '', 'task_remove'),
(6, 'lisas kommentaari', '', 'comment_add'),
(7, 'muutis kommentaari', '', 'comment_edit'),
(8, 'kustutas kommentaari', '', 'comment_remove'),
(9, 'muutis staatust', '', 'status_edit');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `task_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `event_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) NOT NULL,
  `old_value` text NOT NULL,
  `new_value` text NOT NULL,
  KEY `event_type_id` (`event_type_id`),
  KEY `task_id` (`task_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`timestamp`, `task_id`, `user_id`, `event_type_id`, `field`, `old_value`, `new_value`) VALUES
('2013-08-15 19:10:38', 1, 1, 4, 'Lorem', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad architecto debitis dicta dolorem doloremque earum eos eveniet ex excepturi fugiat fugit inventore ipsa libero magnam minima molestias mollitia officia pariatur, possimus quas qui quia quidem ratione reiciendis repellendus, reprehenderit repudiandae sequi soluta temporibus tenetur voluptates voluptatibus voluptatum. Aliquid animi beatae corporis, dolor, dolorum harum id itaque iusto laboriosam maxime molestias nesciunt nihil nisi nobis optio praesentium repellendus reprehenderit rerum saepe sapiente temporibus ut velit, voluptas. Assumenda consequatur, consequuntur earum fugiat illum ipsam quam voluptate! Ad aspernatur, consequatur cum, dolore eius id iusto laboriosam reiciendis repellat sunt unde voluptatum. Animi assumenda cumque dignissimos est et ex hic illum ipsa, magni natus nihil nisi nulla odio officiis pariatur quaerat quia quibusdam rerum, sint voluptates? Aperiam assumenda, autem corporis culpa debitis delectus doloribus exercitationem, minus modi provident rem sunt tempore totam vel voluptatem! Aut autem delectus ducimus earum illum in nesciunt numquam quaerat quis repellendus! Dolore ex exercitationem id illum natus officia sapiente similique temporibus voluptatem. Ad at blanditiis delectus distinctio eius error itaque nemo obcaecati quae ratione, saepe sapiente similique sint? Consequuntur et id illo molestias nulla quo recusandae repellat. Architecto, asperiores doloremque, ea eaque enim magnam modi omnis praesentium quis, ratione tempore ut. Aliquam amet blanditiis cumque id quibusdam quisquam ullam? A adipisci amet, aspernatur aut blanditiis commodi deleniti dignissimos distinctio doloremque eaque eligendi eveniet exercitationem harum hic ipsa ipsam itaque magnam, molestias mollitia pariatur reprehenderit rerum saepe sapiente, similique sint tenetur voluptatem? A accusantium delectus doloribus non optio? Dolor dolore earum error nesciunt nihil. Illo ipsum modi nihil nisi quis repellat similique veritatis! Aliquid eaque harum praesentium voluptate voluptatibus? Animi atque aut culpa deleniti ducimus laudantium, libero nulla, officia optio praesentium qui saepe sint sunt. Assumenda blanditiis debitis earum eligendi enim eos eum ex fugiat harum, labore praesentium soluta!', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad architecto debitis dicta dolorem doloremque earum eos eveniet ex excepturi fugiat fugit inventore ipsa libero magnam minima molestias mollitia officia pariatur, possimus quas qui quia quidem ratione reiciendis repellendus, reprehenderit repudiandae sequi soluta temporibus tenetur voluptates voluptatibus voluptatum. Aliquid animi beatae corporis, dolor, dolorum harum id itaque iusto laboriosam maxime molestias nesciunt nihil nisi nobis optio praesentium repellendus reprehenderit rerum saepe sapiente temporibus ut velit, voluptas. Assumenda consequatur, consequuntur earum fugiat illum ipsam quam voluptate! Ad aspernatur, consequatur cum, dolore eius id iusto laboriosam reiciendis repellat sunt unde voluptatum. Animi assumenda cumque dignissimos est et ex hic illum ipsa, magni natus nihil nisi nulla odio officiis pariatur Muutus delectus doloribus exercitationem, minus modi provident rem sunt tempore totam vel voluptatem! Aut autem delectus ducimus earum illum in nesciunt numquam quaerat quis repellendus! Dolore ex exercitationem id illum natus officia sapiente similique temporibus voluptatem. Ad at blanditiis delectus distinctio eius error itaque nemo obcaecati quae ratione, saepe sapiente similique sint? Consequuntur et id illo molestias nulla quo recusandae repellat. Architecto, asperiores doloremque, ea eaque enim magnam modi omnis praesentium quis, ratione tempore ut. Aliquam amet blanditiis cumque id quibusdam quisquam ullam? A adipisci amet, aspernatur aut blanditiis commodi deleniti dignissimos distinctio doloremque eaque eligendi eveniet exercitationem harum hic ipsa ipsam itaque magnam, molestias mollitia pariatur reprehenderit rerum saepe sapiente, similique sint tenetur voluptatem? A accusantium delectus doloribus non optio? Dolor dolore earum error nesciunt nihil. Illo ipsum modi nihil nisi quis repellat similique veritatis! Aliquid eaque harum praesentium voluptate voluptatibus? Animi atque aut culpa deleniti ducimus laudantium, libero nulla, officia optio praesentium qui saepe sint sunt. Assumenda blanditiis debitis earum eligendi enim eos eum ex fugiat harum, labore praesentium soluta!'),
('2013-08-15 19:12:47', 1, 1, 4, 'HTML', '<strong>Tere</strong>', '<i>Tere</i>'),
('2013-08-22 17:16:21', 1, 1, 3, 'Uus töö', '', 'Täitsa uus töö lisatud'),
('2013-08-22 17:53:39', 1, 1, 8, 'kommentaar', '', 'kustutati kommentaar sellel värgil siin'),
('2013-08-22 17:55:00', 1, 1, 1, '', '', ''),
('2013-08-22 17:55:20', 1, 1, 2, '', '', ''),
('2013-08-22 17:55:58', 1, 1, 5, '', 'bvnbvn', ''),
('2013-08-22 17:56:28', 1, 1, 6, '', '', ''),
('2013-08-22 17:56:35', 1, 1, 7, '', '', ''),
('2013-08-22 17:56:41', 1, 1, 9, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `status_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) NOT NULL,
  `status_color` char(6) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`, `status_color`) VALUES
(1, 'Tegemata', ''),
(2, 'Valmis', ''),
(3, 'Töös', ''),
(4, 'Vajab tagasisidet', ''),
(5, 'Arhiveeritud', '666');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_summary` text NOT NULL,
  `task_reported_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_assignee_id` int(10) unsigned NOT NULL,
  `user_reporter_id` int(10) unsigned NOT NULL,
  `task_due` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`task_id`),
  KEY `user_reporter_id` (`user_reporter_id`),
  KEY `user_assignee_id` (`user_assignee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `task_summary`, `task_reported_time`, `user_assignee_id`, `user_reporter_id`, `task_due`, `deleted`) VALUES
(1, 'Demotask', '2013-08-13 16:02:00', 1, 1, '2013-08-14 21:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `deleted`) VALUES
(1, 'demo', 'demo', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_3` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`event_type_id`),
  ADD CONSTRAINT `log_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `log_ibfk_5` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`user_assignee_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`user_reporter_id`) REFERENCES `user` (`user_id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
