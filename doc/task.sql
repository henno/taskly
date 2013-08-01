-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 01, 2013 at 06:11 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_summary` text NOT NULL,
  `task_reported_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `due_date` datetime NOT NULL,
  `finished` datetime NOT NULL,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `task_summary`, `task_reported_time`, `due_date`, `finished`, `deleted`) VALUES
(1, 'Raske tööö', '2013-08-01 17:36:13', '2013-08-07 07:00:00', '2013-08-17 00:00:00', 0),
(2, 'väga raske töö', '2013-08-01 21:00:00', '2013-08-09 00:00:00', '2013-08-15 07:16:10', 0);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
