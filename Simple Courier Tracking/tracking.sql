-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2021 at 08:10 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tracking`
--

-- --------------------------------------------------------

--
-- Table structure for table `trackdetails`
--

CREATE TABLE `trackdetails` (
  `tno` varchar(100) NOT NULL,
  `time1` varchar(100) NOT NULL,
  `time2` varchar(100) NOT NULL,
  `time3` varchar(100) NOT NULL,
  `time4` varchar(100) NOT NULL,
  `status` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trackdetails`
--

INSERT INTO `trackdetails` (`tno`, `time1`, `time2`, `time3`, `time4`, `status`) VALUES
('1', '2021/01/23 06:00:53pm', '2021/01/23 06:06:24pm', '2021/01/23 06:07:03pm', '2021/01/23 06:07:43pm', 4),
('111', '2021/01/23 10:35:41pm', '2021/01/24 09:47:26pm', '2021/01/24 09:48:24pm', '', 3),
('1111', '2021/01/24 04:04:45pm', '2021/01/24 04:05:22pm', '2021/01/24 04:06:03pm', '2021/01/24 04:06:29pm', 4),
('123', '2021/01/23 01:57:07pm', '2021/01/23 01:57:48pm', '2021/01/23 02:01:07pm', '2021/01/23 06:21:06pm', 4),
('12345', '2021/01/23 10:40:33pm', '2021/01/23 10:41:21pm', '2021/01/24 09:38:27pm', '', 3),
('123456', '2021/01/24 08:16:44pm', '2021/01/24 08:19:16pm', '2021/01/24 10:33:37pm', '', 3),
('1234567', '2021/03/08 09:23:28pm', '2021/03/08 09:25:31pm', '2021/03/08 09:26:02pm', '', 3),
('TR12344321', '2021/01/22 07:53:49pm', '2021/01/22 07:54:46pm', '', '2021/01/22 10:35:24pm', 4);

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `username` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`username`, `designation`, `password`) VALUES
('user2', '2', '12345678'),
('user4', '4', '11111111111111'),
('user2', '1', '12345678'),
('username', '4', '12345678'),
('user1', '1', '1211111121'),
('user', '1', '33333333'),
('Thamiz', '3', '22222222'),
('Thamizh', '2', '12345678'),
('user123', '3', '11111111'),
('Thamizhselvan', '3', 'Thamizh@k45'),
('Tamil', '1', 'Thamizh@k45'),
('manoj', '3', '12345678'),
('anbu', '2', '12345678'),
('SIVA', '2', '12345678'),
('T', '1', '11111111'),
('1', '1', '12345678'),
('2', '2', '12345678'),
('3', '2', '12345678'),
('4', '4', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `trackdetails`
--
ALTER TABLE `trackdetails`
  ADD PRIMARY KEY (`tno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
