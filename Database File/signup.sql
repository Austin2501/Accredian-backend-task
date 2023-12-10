-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2023 at 04:53 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `signup`
--

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `Id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`Id`, `name`, `email`, `password`) VALUES
(1, 'vineet', 'ab@gm.in', 'abcd12'),
(2, 'sarthak', 'sar@ac.in', 'hello'),
(3, 'shreya', 'shrey@ac.in', 'ac123'),
(4, 'vineet', 'vineet@gmail.com', 'why12'),
(5, 'hello', 'hello@ac.in', 'hello'),
(6, 'why', 'why@ac.in', 'why12'),
(16, 'Bibbu', 'Bibbu@ac.in', 'Bibbu'),
(19, 'vineet', 'hello@ac.in', 'why12'),
(20, 'pass', 'vineet@gmail.com', 'pass'),
(21, 'ahg', 'agh@gm.in', 'pass'),
(22, 'eree', 'ere@gmail.com', 'pass'),
(23, 'ffff', 'ffff@fd.in', '123'),
(24, 'fdw', 'sdd@fd.in', 'hello'),
(25, 'pass', 'hello@ac.in', 'hello');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
