-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 15, 2013 at 03:50 PM
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
  `task_id` int(10) unsigned NULL,
  `user_id` int(10) unsigned NULL,
  `event_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) NULL,
  `old_value`  TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_value`  TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  KEY `event_type_id` (`event_type_id`),
  KEY `task_id` (`task_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`timestamp`, `task_id`, `user_id`, `event_type_id`, `field`, `old_value`, `new_value`) VALUES
('2013-08-13 17:56:11', 1, 1, 4, 'Kirjeldus', 'Vana kirjeldus', 'Uus kirjeldus');

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
