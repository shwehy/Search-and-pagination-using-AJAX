-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2021 at 03:10 AM
-- Server version: 5.7.30-log
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_lab4`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `course_descreption` varchar(100) NOT NULL,
  `department_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `course_descreption`, `department_id`, `professor_id`) VALUES
(1, 'CC451', 'a computer major course ', 1, 1),
(2, 'CC671', 'a computer course in Faculty of Engineering ', 1, 3),
(3, 'CC751', 'A computer course given in faculty of Science  ', 1, 1),
(4, 'EME222', 'Electro course ', 2, 2),
(5, 'EME568', 'electricity course for juniors  ', 2, 3),
(6, 'EME458', 'mechanical major course ', 2, 2),
(7, 'DD569', 'Drawing 1 course ', 3, 4),
(8, 'DD879', 'drawing 2 course ', 3, 4),
(9, 'DD341', 'steeling course ', 3, 4),
(10, 'CC875', 'communication major course ', 4, 5),
(11, 'CC969', 'embedded system course for seniors ', 4, 1),
(12, 'CC888', 'antenna and receivers   ', 4, 5),
(13, 'CC565', 'computer advanced course ', 1, 4),
(14, 'CC265', 'logic circuits ', 1, 1),
(15, 'DD897', 'steeling II', 3, 4),
(16, 'EE859', 'electrial course for juniors', 2, 3),
(17, 'EME785', 'elctromechanics course', 2, 3),
(18, 'EME658', 'mechanical course for term 8 ', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `d_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `d_name`) VALUES
(1, 'Computer'),
(2, 'electricity '),
(3, 'Drawing'),
(4, 'Communication');

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `professor_id` int(11) NOT NULL,
  `p_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`professor_id`, `p_name`) VALUES
(1, 'Aly Mahmoud'),
(2, 'Mohamed amr'),
(3, 'Ahmed Helmy'),
(4, 'Mahmoud Elsayed'),
(5, 'Yosseif Shawky');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `fk_dep` (`department_id`),
  ADD KEY `fk_prof` (`professor_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`professor_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_dep` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `fk_prof` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
