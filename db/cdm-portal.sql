  -- phpMyAdmin SQL Dump
  -- version 5.1.1
  -- https://www.phpmyadmin.net/
  --
  -- Host: 127.0.0.1
  -- Generation Time: Apr 26, 2024 at 03:29 PM
  -- Server version: 10.4.21-MariaDB
  -- PHP Version: 8.0.11

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
    `course_enlistment_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `title` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `type` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
    `lab_units` int(11) NOT NULL,
    `lec_units` int(11) NOT NULL,
    `course_code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `version` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
    `program` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `year_level` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
    `semester` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
    `studio` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `section` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `day` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `time` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `room` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `pre_co_requisite` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `student_count` int(11) NOT NULL,
    `academic_year` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

  -- --------------------------------------------------------

  --
  -- Table structure for table `course_enrollment`
  --

  CREATE TABLE `course_enrollment` (
    `course_enrollment_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `student_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `employee_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `lec` int(11) NOT NULL,
    `lab` int(11) NOT NULL,
    `studio` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `section` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `day` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `time` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `room` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `academic_year` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

  -- --------------------------------------------------------

  --
  -- Table structure for table `employees`
  --

  CREATE TABLE `employees` (
    `employee_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `account_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `first_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `last_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

  -- --------------------------------------------------------

  --
  -- Table structure for table `enrollments`
  --

  CREATE TABLE `enrollments` (
    `enrollment_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `student_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `academic_year` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `semester` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `program` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `scholarship` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `date` int(11) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

  -- --------------------------------------------------------

  --
  -- Table structure for table `grades`
  --

  CREATE TABLE `grades` (
    `grade_id` varchar(15) NOT NULL,
    `student_id` varchar(11) NOT NULL,
    `course_title` varchar(50) NOT NULL,
    `course_code` varchar(255) NOT NULL,
    `midterm` int(11) NOT NULL,
    `final` int(11) NOT NULL,
    `units` int(11) NOT NULL,
    `academic_year` varchar(25) NOT NULL,
    `semester` varchar(10) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

  --
  -- Dumping data for table `grades`
  --

  INSERT INTO `grades` (`grade_id`, `student_id`, `course_title`, `course_code`, `midterm`, `final`, `units`, `academic_year`, `semester`) VALUES
  ('grade_122', '20231020401', 'College and Advanced Algebra', 'MATH2077', 100, 100, 5, '2023', '1st'),
  ('grade_123', '20231020401', 'Differential and Integral Calculus 1', 'MATH2074', 98, 87, 4, '2023', '2nd');

  -- --------------------------------------------------------

  --
  -- Table structure for table `students`
  --

  CREATE TABLE `students` (
    `student_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `user_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `first_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `last_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
    `age` int(11) NOT NULL,
    `program` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `courses` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`courses`))
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

  --
  -- Dumping data for table `students`
  --

  INSERT INTO `students` (`student_id`, `user_name`, `password`, `first_name`, `last_name`, `age`, `program`, `courses`) VALUES
  ('20231020401', 'test', '1', 'Xander', 'Ison', 12, 'Bachelor of Science in Computer Engineering', '1');

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
  -- Indexes for table `grades`
  --
  ALTER TABLE `grades`
    ADD PRIMARY KEY (`grade_id`);

  --
  -- Indexes for table `students`
  --
  ALTER TABLE `students`
    ADD PRIMARY KEY (`student_id`);
  COMMIT;

  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
