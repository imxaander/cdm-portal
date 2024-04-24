-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 24, 2024 at 04:13 AM
-- Server version: 11.3.2-MariaDB
-- PHP Version: 8.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cdm-portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `course_enlistment`
--

CREATE TABLE `course_enlistment` (
  `course_enlistment_id` varchar(10) NOT NULL,
  `title` varchar(25) NOT NULL,
  `type` varchar(3) NOT NULL,
  `lab_units` int(11) NOT NULL,
  `lec_units` int(11) NOT NULL,
  `course_code` varchar(25) NOT NULL,
  `version` varchar(5) NOT NULL,
  `program` varchar(10) NOT NULL,
  `year_level` varchar(5) NOT NULL,
  `semester` varchar(5) NOT NULL,
  `studio` varchar(25) NOT NULL,
  `section` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `time` varchar(10) NOT NULL,
  `room` varchar(25) NOT NULL,
  `pre_co_requisite` varchar(50) NOT NULL,
  `student_count` int(11) NOT NULL,
  `academic_year` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollment`
--

CREATE TABLE `course_enrollment` (
  `course_enrollment_id` varchar(25) NOT NULL,
  `student_id` varchar(25) NOT NULL,
  `employee_id` varchar(25) NOT NULL,
  `lec` int(11) NOT NULL,
  `lab` int(11) NOT NULL,
  `studio` varchar(25) NOT NULL,
  `section` varchar(10) NOT NULL,
  `day` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `room` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `version` varchar(10) NOT NULL,
  `academic_year` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` varchar(25) NOT NULL,
  `account_id` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` varchar(25) NOT NULL,
  `student_id` varchar(25) NOT NULL,
  `academic_year` varchar(25) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `program` varchar(25) NOT NULL,
  `scholarship` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` varchar(25) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `age` int(11) NOT NULL,
  `program` varchar(100) NOT NULL,
  `courses` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`courses`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `user_name`, `password`, `first_name`, `last_name`, `age`, `program`, `courses`) VALUES
('student69', 'test', '1', 'Xander', 'Ison', 12, 'Bachelor of Science in Computer Engineering', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course_enlistment`
--
ALTER TABLE `course_enlistment`
  ADD PRIMARY KEY (`course_enlistment_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
