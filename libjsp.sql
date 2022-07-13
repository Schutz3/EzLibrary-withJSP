-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 13, 2022 at 12:24 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lib`
--

-- --------------------------------------------------------

--
-- Table structure for table `lib`
--

CREATE TABLE `lib` (
  `id` int(15) NOT NULL,
  `img` varchar(250) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `penulis` varchar(50) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lib`
--

INSERT INTO `lib` (`id`, `img`, `judul`, `penulis`, `genre`, `link`) VALUES
(23, '1CPvdtivn63bJ5BOmSOngFFiMqII6UwCU', 'Algorithm & DS C01', 'ipul', 'Others', '1GgzISEDwLQKtqZ-eW1-9-f6dGiu6P4vq'),
(28, '111g9ruR3cyQ8ipUlVlARn9VeI9jJkNFs', 'Algorithm & DS C02', 'Unknown', 'Science', '1GaQHgEGrtN9XMxkV0RgD4tCZTTBLNh_s'),
(29, '14weGd2_3Cm2W_Im2jlaNWkxAjrRJaoIN', 'Software Engineer A Practitioner Approach', 'Roger S. PRESSMAN', 'Technology', '103us_ucVXtLJzEZt8x9vD-BGKd0cqWta');

-- --------------------------------------------------------

--
-- Table structure for table `librarians`
--

CREATE TABLE `librarians` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `librarians`
--

INSERT INTO `librarians` (`id`, `name`, `username`, `password`) VALUES
(2, 'Farhan Dwi O', 'farhan', 'farhan'),
(3, 'Reza Hans L', 'reza', 'reza'),
(4, 'Ezra Ayu R', 'ezra', 'ezra');

-- --------------------------------------------------------

--
-- Table structure for table `reqbook`
--

CREATE TABLE `reqbook` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `bookreq` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reqbook`
--

INSERT INTO `reqbook` (`id`, `name`, `email`, `bookreq`) VALUES
(31, 'Farhan Dwi', '02.farhan.dwi@gmail.com', 'Software Engineer A Practitioner Approach'),
(32, 'Fariz', 'farizmuhammad@mail.ugm.ac.id', 'Software Engineer A Practitioner Approach');

-- --------------------------------------------------------

--
-- Table structure for table `reqtd`
--

CREATE TABLE `reqtd` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `booktdreq` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reqtd`
--

INSERT INTO `reqtd` (`id`, `name`, `email`, `booktdreq`) VALUES
(100, 'Farhan Dwi', '02.farhan.dwi@gmail.com', '23 || Algorithm & DS C01'),
(101, 'Fariz', 'farizmuhammad@mail.ugm.ac.id', '28 || Algorithm & DS C02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lib`
--
ALTER TABLE `lib`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librarians`
--
ALTER TABLE `librarians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reqbook`
--
ALTER TABLE `reqbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reqtd`
--
ALTER TABLE `reqtd`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lib`
--
ALTER TABLE `lib`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `librarians`
--
ALTER TABLE `librarians`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reqbook`
--
ALTER TABLE `reqbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `reqtd`
--
ALTER TABLE `reqtd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
