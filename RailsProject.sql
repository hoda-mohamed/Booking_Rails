-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 22, 2014 at 11:03 AM
-- Server version: 5.5.37
-- PHP Version: 5.3.10-1ubuntu3.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `RailsProject`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `comment` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `hotel_id`, `room_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 9, 1, 12, 'wwwwwwwwwwwwwwwwwoooooooooowwwwwwwww', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 10, 1, 12, 'ffffffffffffff', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 9, 1, 12, 'hello', '2014-05-21 17:12:02', '2014-05-21 17:12:02'),
(5, 9, 1, 12, ' aaaaa', '2014-05-21 17:37:20', '2014-05-21 17:37:20'),
(6, 9, 1, 12, ' vb', '2014-05-21 17:37:56', '2014-05-21 17:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `country`, `city`, `region`, `name`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'cairo', 'egypt', 'nile plaza', 'four seasons', '1089CornicheElNil', '1236', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'cairo', 'alex', 'montaza', 'sheraton', 'CornicheElNil ', '102455', '2014-05-21 03:42:36', '2014-05-21 03:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `reserves`
--

CREATE TABLE IF NOT EXISTS `reserves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reserves`
--

INSERT INTO `reserves` (`id`, `user_id`, `hotel_id`, `room_id`, `check_in`, `check_out`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 12, '2014-11-11', '2014-11-12', '2014-05-21 00:00:00', '2014-05-21 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) DEFAULT NULL,
  `room_number` int(11) DEFAULT NULL,
  `room_price` int(11) DEFAULT NULL,
  `room_discount` int(11) DEFAULT NULL,
  `room_service` varchar(255) DEFAULT NULL,
  `room_image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_rooms_on_hotel_id_and_room_number` (`hotel_id`,`room_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `hotel_id`, `room_number`, `room_price`, `room_discount`, `room_service`, `room_image`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 120, 10, 'dfgh', '/assets/room3.jpg', '2014-05-21 00:00:00', '2014-05-21 00:00:00'),
(2, 1, 15, 120, 5, 'h', '/assets/bg_img.jpg', '2014-05-21 00:00:00', '2014-05-21 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20140520094928'),
('20140520095101'),
('20140520095407'),
('20140520181957'),
('20140520182249');

-- --------------------------------------------------------

--
-- Table structure for table `signups`
--

CREATE TABLE IF NOT EXISTS `signups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_signups_on_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `signups`
--

INSERT INTO `signups` (`id`, `name`, `email`, `password`, `phone`, `created_at`, `updated_at`) VALUES
(9, 'hoda', 'hoda1@yahoo.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', '2014-05-21 10:12:37', '2014-05-21 10:12:37'),
(10, 'hoda', 'hoda@yahoo.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', '2014-05-21 10:13:32', '2014-05-21 10:13:32');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `signups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
