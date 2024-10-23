-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2024 at 07:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_management_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_book`
--

CREATE TABLE `tbl_book` (
  `id` int(11) NOT NULL,
  `book_name` varchar(250) NOT NULL,
  `isbnno` varchar(250) NOT NULL,
  `author` varchar(250) NOT NULL,
  `publisher` varchar(250) NOT NULL,
  `quantity` varchar(250) NOT NULL,
  `place` varchar(250) NOT NULL,
  `category` varchar(250) NOT NULL,
  `availability` tinyint(4) NOT NULL COMMENT '1=available, 0=not available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_book`
--

INSERT INTO `tbl_book` (`id`, `book_name`, `isbnno`, `author`, `publisher`, `quantity`, `place`, `category`, `availability`, `created_at`) VALUES
(1, 'RIZAL: Life, Works, and Writings', '00-01-01', 'Gregorio Fernandez Zaide', 'All-Nations Publishing Company', '0', 'Mariano Marcos SHS Library', 'Literature', 1, '2024-10-23 04:13:08'),
(2, 'El Filibusterismo', '00-06-02', 'Jose Rizal', 'Jose Rizal', '1', 'Mariano Marcos JHS Library', 'Novel', 1, '2024-10-22 07:44:07'),
(3, 'Don Quixote', '00-06-01', 'Miguel de Cervantes', 'Francisco de Robles', '0', 'Mariano Marcos SHS Library', 'Novel', 1, '2024-10-23 04:34:22'),
(4, 'The Great Gatsby', '00-06-03', 'F. Scott Fitzgerald', 'Charles Scribner', '1', 'Mariano Marcos SHS Library', 'Novel', 1, '2024-10-21 04:14:54'),
(5, 'One Hundred Years of Solitude', '00-02-01', 'Gabriel Garcia Marquez', 'Harper & Row', '1', 'Mariano Marcos JHS Library', 'Fiction', 1, '2024-10-21 04:19:49'),
(6, 'Moby Dick', '00-02-02', 'Herman Melville', 'Xist Publishing', '1', 'Mariano Marcos SHS Library', 'Fiction', 1, '2024-10-21 04:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=active, 0=inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `category_name`, `status`, `created_at`) VALUES
(1, 'Literature', 1, '2024-09-01 16:08:36'),
(2, 'Fiction', 1, '2024-10-21 03:58:06'),
(3, 'Non-fiction', 1, '2024-10-21 03:58:58'),
(4, 'Fantasy', 1, '2024-10-21 03:59:19'),
(5, 'History', 1, '2024-10-21 04:00:20'),
(6, 'Novel', 1, '2024-10-21 04:02:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_issue`
--

CREATE TABLE `tbl_issue` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `year_level` varchar(255) NOT NULL COMMENT '1=grade7, 2=grade8, 3=grade9, 4=grade10,\r\n5=grade11, 6=grade12',
  `issue_date` varchar(250) NOT NULL,
  `due_date` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL DEFAULT '0' COMMENT '3=request sent, 1=accept, 2=reject',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_issue`
--

INSERT INTO `tbl_issue` (`id`, `book_id`, `user_id`, `user_name`, `year_level`, `issue_date`, `due_date`, `status`, `created_at`) VALUES
(14, 3, 2, 'Sn', '', '2024-10-23', '2024-10-24', '1', '2024-10-23 04:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=active, 0=inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_location`
--

INSERT INTO `tbl_location` (`id`, `name`, `status`, `created_at`) VALUES
(1, 'Mariano Marcos SHS Library', 1, '2024-09-01 16:09:22'),
(2, 'Mariano Marcos JHS Library', 1, '2024-09-01 16:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_return`
--

CREATE TABLE `tbl_return` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `return_date` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_return`
--

INSERT INTO `tbl_return` (`id`, `book_id`, `user_id`, `user_name`, `return_date`, `created_at`) VALUES
(1, 1, 3, 'Sn', '2024-09-09', '2024-09-09 01:55:52'),
(2, 1, 3, 'Sn', '2024-09-16', '2024-09-16 04:08:52'),
(3, 1, 2, 'Sn', '2024-09-22', '2024-09-22 10:46:45'),
(4, 1, 2, 'Sn', '2024-09-23', '2024-09-23 03:35:13'),
(5, 1, 2, 'Sn', '2024-09-23', '2024-09-23 03:39:18'),
(6, 1, 3, 'Sn', '2024-10-21', '2024-10-21 04:16:49'),
(7, 2, 3, 'Sn', '2024-10-22', '2024-10-22 07:44:07'),
(8, 3, 3, 'Sn', '2024-10-22', '2024-10-22 07:44:09'),
(9, 1, 3, 'Sn', '2024-10-22', '2024-10-22 07:44:11'),
(10, 1, 3, 'Sn', '2024-10-22', '2024-10-22 07:45:25'),
(11, 1, 2, 'Sn', '2024-10-23', '2024-10-23 04:13:08');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `emailid` varchar(250) NOT NULL,
  `year_level` varchar(255) NOT NULL COMMENT '1=grade7, 2=grade8, 3=grade9, 4=grade10, 5=grade11, 6=grade10',
  `password` varchar(250) NOT NULL,
  `role` tinyint(4) NOT NULL COMMENT '1=admin, 2=user',
  `status` tinyint(4) NOT NULL COMMENT '1=active, 0=inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `user_name`, `emailid`, `year_level`, `password`, `role`, `status`, `created_at`) VALUES
(1, 'Admin', 'admin@library.com', '', '6b8d5de3b53751bac499eb1bef762a2a', 1, 1, '2023-05-27 13:29:44'),
(2, 'justine', 'justine@gmail.com', '', '202cb962ac59075b964b07152d234b70', 1, 1, '2024-09-01 16:07:27'),
(3, 'Sn', 'sn@gmail.com', '1', '202cb962ac59075b964b07152d234b70', 2, 1, '2024-10-23 04:04:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_book`
--
ALTER TABLE `tbl_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_issue`
--
ALTER TABLE `tbl_issue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_return`
--
ALTER TABLE `tbl_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_book`
--
ALTER TABLE `tbl_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_issue`
--
ALTER TABLE `tbl_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_return`
--
ALTER TABLE `tbl_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
