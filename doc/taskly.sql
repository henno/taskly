-- phpMyAdmin SQL Dump
-- version 4.1-dev
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 13, 2013 at 07:04 PM
-- Server version: 5.5.25
-- PHP Version: 5.4.4

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

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
CREATE TABLE IF NOT EXISTS `event_type` (
  `event_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_type_name` varchar(255) NOT NULL,
  `event_type_color` char(6) NOT NULL,
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`event_type_id`, `event_type_name`, `event_type_color`) VALUES
(1, 'logis sisse', ''),
(2, 'logis välja', ''),
(3, 'lisas töö', ''),
(4, 'muutis tööd', ''),
(5, 'eemaldas töö', ''),
(6, 'lisas kommentaari', ''),
(7, 'muutis kommentaari', ''),
(8, 'kustutas kommentaari', ''),
(9, 'muutis staatust', '');

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
  KEY `event_type_id` (`event_type_id`),
  KEY `task_id` (`task_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`timestamp`, `task_id`, `user_id`, `event_type_id`) VALUES
('2013-08-08 18:19:46', 1, 1, 1);

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
  ADD CONSTRAINT `log_ibfk_5` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
  ADD CONSTRAINT `log_ibfk_3` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`event_type_id`),
  ADD CONSTRAINT `log_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

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
