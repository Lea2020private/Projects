-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2021 at 06:20 PM
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
-- Database: `acgcet_permission_process`
--

-- --------------------------------------------------------

--
-- Table structure for table `incharge_details`
--

CREATE TABLE `incharge_details` (
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `department` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `mobile_number` varchar(50) NOT NULL,
  `security_qn` varchar(50) NOT NULL,
  `security_ans` varchar(100) NOT NULL,
  `acc_status` int(11) NOT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `login_key` varchar(255) DEFAULT NULL,
  `forgot_password_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incharge_details`
--

INSERT INTO `incharge_details` (`user_id`, `name`, `username`, `password`, `department`, `email`, `position`, `mobile_number`, `security_qn`, `security_ans`, `acc_status`, `id_card`, `signature`, `login_key`, `forgot_password_key`) VALUES
(3, 'Thamizhselvan t', 'Thamizh', 'Thamizh@k45', 'civil', 'tamilvirat770@gmail.com', 'gallery_hall', '9092765548', '2', 'vijay', 1, NULL, NULL, 'roc&J&Sj$CR4amhoGaT4T5cvR4!Wz^@1d*MzJ2HBD#CJoRDveXT!AveT%1LG*b1X', 'MJU3E^HoFrsZu&fgz&p4K!HYJdo&jyyG0n&1mvFRPAmuYAehqCEZU7&A61nfBUbJ'),
(5, 'Thamizhselvan t', 'Thamizhselvan T', 'Tamil@k45', 'civil', 'tassmil@gmail.com', 'gallery_hall', '9092764548', '2', 'vijay', 2, NULL, NULL, NULL, NULL),
(7, 'Thamizhselvan t', 'TT', 'Tamil@k45', 'ece', 'tmeil@gmail.com', 'generator', '9092765547', '2', 'aa', 1, NULL, NULL, 'ggln0k0xZWs!#U!b4xiWl8oYjVXhjmbDl)JWnr)rR2zlIOvLxm*v(mhehI&oQCXy', NULL),
(10, 'Th', 'eswar', 'Thamizh@k45', 'mech', 'tassmesskil@gmail.com', 'gallery_hall', '7656591001', '2', 'aaaa', 0, NULL, NULL, NULL, NULL),
(11, 'Thamizhselvan t', '6379705214', 'Thamizh@k45', 'cse', 'tamil@gmail.com', 'generator', '9092765529', '2', 'vijay', 1, NULL, NULL, 'qo0XXjaFIA4snsXC1DTI7ZpJkf0kOPPg%1%SYLHcq0&ki9FzDA5A1uI&&GrPeJv$', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_request_details`
--

CREATE TABLE `permission_request_details` (
  `permission_letter_no` int(20) NOT NULL,
  `permission_for` varchar(100) NOT NULL,
  `purpose` varchar(100) NOT NULL,
  `date_time_from` varchar(100) NOT NULL,
  `date_time_to` varchar(100) NOT NULL,
  `description_about_purpose` varchar(500) NOT NULL,
  `requested_student_id` varchar(30) NOT NULL,
  `requested_time` varchar(100) DEFAULT NULL,
  `approver_id` varchar(30) DEFAULT NULL,
  `approved_time` varchar(100) DEFAULT NULL,
  `permission_letter_status` varchar(10) NOT NULL DEFAULT '0',
  `reject_reason` varchar(200) DEFAULT NULL,
  `permission_letter_priority` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission_request_details`
--

INSERT INTO `permission_request_details` (`permission_letter_no`, `permission_for`, `purpose`, `date_time_from`, `date_time_to`, `description_about_purpose`, `requested_student_id`, `requested_time`, `approver_id`, `approved_time`, `permission_letter_status`, `reject_reason`, `permission_letter_priority`) VALUES
(1, 'gallery_hall', 'yrc', '2021-05-22T13:57', '2021-05-30T13:57', '  iiiiii', '4', '2021/05/24 13:57:57', '3', '2021/05/24 13:59:50', '1', NULL, '1'),
(2, 'generator', 'yrc', '2021-05-24T20:01', '2021-05-24T14:07', '  aaaaaa', '4', '2021/05/24 14:01:09', '7', '2021/05/24 14:02:09', '2', 'aaaa', '1'),
(3, 'generator', 'yrc', '2021-05-24T14:07', '2021-05-24T14:05', '  am aaa', '4', '2021/05/24 14:02:36', '7', '2021/05/24 14:02:56', '1', NULL, '1'),
(4, 'drawing_hall', 'yrc', '2021-05-24T14:04', '2021-05-24T14:04', '  thamizha', '4', '2021/05/24 14:03:50', NULL, NULL, '0', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `register_number` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `year` int(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `club` varchar(100) DEFAULT NULL,
  `mobile_number` varchar(50) NOT NULL,
  `security_qn` varchar(50) NOT NULL,
  `security_ans` varchar(100) NOT NULL,
  `acc_status` int(11) NOT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `login_key` varchar(255) DEFAULT NULL,
  `forgot_password_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`user_id`, `name`, `username`, `password`, `register_number`, `department`, `year`, `email`, `role`, `club`, `mobile_number`, `security_qn`, `security_ans`, `acc_status`, `id_card`, `signature`, `login_key`, `forgot_password_key`) VALUES
(4, 'THAMIZHSELVAN T', 'Thamizhselvan T', 'Thamizh@k45', '1815048', 'cse', 4, 'tamilvirat770@gmail.com', 'yrc', 'freshers', '9092765529', '3', 'virat', 1, NULL, NULL, 'j^8t!0)%TP2^vfru#IToqCRLUx*OBt3Myc(VvlUEoDeavct*nMY*QnHHmdkQnv22', 'ZIT^f@eXzALgjJ1nqlS1alUXxzCc6d7D&SkC&mk^L!y3de1yOHVzzdRdAVWHrg7S'),
(6, 'THAMIZHSELVAN T', 'Thamizh', 'Thamizh@k45', '1815021', 'cse', 4, 'tamil@gmail.com', 'club', 'freshers', '6379705214', '2', 'vijay', 1, NULL, NULL, 'kFy2U#stPYo96EsbtuOI$TJCBxgMfyl2*xaoQZ9K9O@OtI((i1RXFt#Ye^fRu2iy', NULL),
(11, 'Thamizhselvan t', '6379705214', 'Thamizh@k45', '1815049', 'cse', 4, 'tamilvirat7@gmail.com', 'sympo', '', '9092760018', '2', 'vijay', 1, NULL, NULL, 'SIerotNWEOkhfGxL3I0RQc*1O#O5vinSf8j(8i)c#f7fjkzYlU)$pghWi^90Zq!I', NULL),
(12, 'THAMIZHSELVAN T', 'Thami', 'Tamil@k45', '111=cd1d111', 'ece', 3, 'tmeil@gmail.com', 'sympo', '', '9092765546', '2', '2', 0, NULL, NULL, NULL, NULL),
(13, 'Th', 'Thamizhselvan TTt', 'Thamizh@k45', '111111cd1d111', 'eee', 3, 'tassmmikil@gmail.com', 'department', '', '9092765540', '1', 'fff', 0, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `incharge_details`
--
ALTER TABLE `incharge_details`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile_number` (`mobile_number`);

--
-- Indexes for table `permission_request_details`
--
ALTER TABLE `permission_request_details`
  ADD PRIMARY KEY (`permission_letter_no`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uname` (`username`),
  ADD UNIQUE KEY `regno` (`register_number`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobno` (`mobile_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incharge_details`
--
ALTER TABLE `incharge_details`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permission_request_details`
--
ALTER TABLE `permission_request_details`
  MODIFY `permission_letter_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_details`
--
ALTER TABLE `student_details`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
