-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2023 at 02:52 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daya_rekadigital_be_challenge`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_table`
--

CREATE TABLE `customer_table` (
  `customer_id` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_table`
--

INSERT INTO `customer_table` (`customer_id`, `name`) VALUES
('CST0001', 'Edward Callaghan'),
('CST0002', 'Harry Pots');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_table`
--

CREATE TABLE `transaction_table` (
  `transaction_id` varchar(20) NOT NULL,
  `customer_id` varchar(20) NOT NULL,
  `menu` varchar(100) NOT NULL,
  `price` int(20) NOT NULL,
  `qty` int(20) NOT NULL,
  `payment` varchar(100) NOT NULL,
  `total` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_table`
--

INSERT INTO `transaction_table` (`transaction_id`, `customer_id`, `menu`, `price`, `qty`, `payment`, `total`, `created_at`) VALUES
('TR0001', 'CST0001', 'Big Cheese Burger', 20000, 5, 'Cash', 100000, '2023-04-27 17:48:50'),
('TR0002', 'CST0001', 'Big Beef Burger', 25000, 4, 'Cash', 100000, '2023-04-27 18:59:19'),
('TR0003', 'CST0001', 'Coca-Cola Regular', 12000, 5, 'Cash', 60000, '2023-04-27 19:10:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_table`
--
ALTER TABLE `customer_table`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `transaction_table`
--
ALTER TABLE `transaction_table`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaction_table`
--
ALTER TABLE `transaction_table`
  ADD CONSTRAINT `transaction_table_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_table` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
