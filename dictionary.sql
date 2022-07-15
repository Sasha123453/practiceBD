-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 15, 2022 at 07:05 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dictionary`
--

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` tinyint(10) UNSIGNED NOT NULL,
  `language` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `language`) VALUES
(1, 'russian'),
(2, 'ossetian');

-- --------------------------------------------------------

--
-- Table structure for table `meaning`
--

CREATE TABLE `meaning` (
  `id` int(50) UNSIGNED NOT NULL,
  `definition` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meaning`
--

INSERT INTO `meaning` (`id`, `definition`) VALUES
(1, 'Группа живущих вместе родственников'),
(2, 'Учреждение, заведение, обслуживающее какие-н. общественные нужды'),
(3, 'Квартира, а также семья, люди, живущие вместе, их хозяйство'),
(4, 'Жилое (или для учреждения) здание, а также (собир.) люди, живущие в нём'),
(5, 'Чувство и состояние полного, высшего удовлетворения');

-- --------------------------------------------------------

--
-- Table structure for table `synonym`
--

CREATE TABLE `synonym` (
  `id` int(50) UNSIGNED NOT NULL,
  `word_id` int(50) UNSIGNED NOT NULL,
  `meaning_id` int(50) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `synonym`
--

INSERT INTO `synonym` (`id`, `word_id`, `meaning_id`) VALUES
(1, 1, 5),
(2, 2, 5),
(3, 3, 5),
(4, 4, 1),
(5, 5, 4),
(6, 6, 4),
(7, 7, 4),
(8, 9, 4),
(9, 10, 4),
(10, 8, 4),
(11, 5, 3),
(12, 6, 3),
(13, 7, 3),
(14, 8, 3),
(15, 5, 2),
(16, 6, 2),
(17, 7, 2),
(18, 8, 2),
(19, 10, 2),
(20, 9, 2),
(21, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `word`
--

CREATE TABLE `word` (
  `id` int(50) UNSIGNED NOT NULL,
  `word` varchar(50) NOT NULL,
  `language_id` tinyint(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `word`
--

INSERT INTO `word` (`id`, `word`, `language_id`) VALUES
(1, 'Счастье', 1),
(2, 'Бӕркад', 2),
(3, 'Амонд', 2),
(4, 'Бинонтӕ', 2),
(5, 'Дом', 1),
(6, 'Хӕдзар', 2),
(7, 'Жилище', 1),
(8, 'Цӕрӕнуат', 2),
(9, 'Здание', 1),
(10, 'Агъуыст', 2),
(11, 'Семья', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `meaning`
--
ALTER TABLE `meaning`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `synonym`
--
ALTER TABLE `synonym`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `meaning_id` (`meaning_id`),
  ADD KEY `word_id` (`word_id`);

--
-- Indexes for table `word`
--
ALTER TABLE `word`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `words_ibfk_1` (`language_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meaning`
--
ALTER TABLE `meaning`
  MODIFY `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `synonym`
--
ALTER TABLE `synonym`
  MODIFY `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `word`
--
ALTER TABLE `word`
  MODIFY `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `synonym`
--
ALTER TABLE `synonym`
  ADD CONSTRAINT `synonym_ibfk_2` FOREIGN KEY (`meaning_id`) REFERENCES `meaning` (`id`),
  ADD CONSTRAINT `synonym_ibfk_3` FOREIGN KEY (`word_id`) REFERENCES `word` (`id`);

--
-- Constraints for table `word`
--
ALTER TABLE `word`
  ADD CONSTRAINT `word_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
