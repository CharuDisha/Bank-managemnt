-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2023 at 04:38 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mybank`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branchId` int(11) NOT NULL,
  `branchNo` varchar(111) NOT NULL,
  `branchName` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branchId`, `branchNo`, `branchName`) VALUES
(1, '1', 'RR nagar'),
(2, '3', 'Malleshwaram'),
(3, '3', 'Rajajinagar'),
(4, '2', 'Kengeri'),
(5, '4', 'Jayanagar');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackId` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackId`, `message`, `date`, `userId`) VALUES
(1, 'Provide parking', '2023-01-17 06:45:20', 5),
(2, 'Good', '2023-01-20 13:36:08', 1),
(3, 'Thank you for your service', '2023-01-20 14:25:20', 3),
(4, 'Manager was engaging', '2023-01-20 21:53:20', 4),
(5, 'open more branches', '2023-01-20 22:10:32', 3);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(111) NOT NULL,
  `password` varchar(111) NOT NULL,
  `type` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `email`, `password`, `type`, `date`) VALUES
(1, 'reema@gmail.com', '12345', 'cashier', '2023-01-18 04:36:27'),
(2, 'trisha@gmail.com', 'secret', 'manager', '2023-01-18 05:36:27'),
(3, 'sohil@gmail.com', 'asdfg', 'cashier', '2023-01-19 07:13:12'),
(4, 'varun@gmail.com', 'qwerty', 'cashier', '2023-01-19 07:13:18'),
(5, 'sid@cashier.com', 'kiara', 'manager', '2023-01-19 07:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `notice` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `notice`, `date`, `userId`) VALUES
(1, 'Dear Customer! Our privacy policy has changed. Kindly get updated for the same at your nearest branch', '2023-01-14 13:11:46', 2),
(2, 'Your account balance is less than minimum.', '2023-01-16 06:29:23', 4),
(3, 'Link your aadhar card at the nearest branch.', '2023-01-20 13:35:35', 3),
(5, 'Link your UPI and pay bills at home.', '2023-01-20 22:06:42', 1),
(29, 'Your account balance is less than minimun!!!!', '2023-01-22 14:28:59', 2),
(31, 'A transaction over 5000 was made by you contact us if it was not done by you', '2023-01-29 20:09:35', 1),
(32, 'A transaction over 5000 was made by you contact us if it was not done by you', '2023-02-07 15:36:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `otheraccounts`
--

CREATE TABLE `otheraccounts` (
  `id` int(11) NOT NULL,
  `accountNo` varchar(111) NOT NULL,
  `bankName` varchar(111) NOT NULL,
  `holderName` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `balance` varchar(111) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `otheraccounts`
--

INSERT INTO `otheraccounts` (`id`, `accountNo`, `bankName`, `holderName`, `date`, `balance`) VALUES
(1, '11', 'SBI', 'Gaurav Patel', '2023-01-18 11:55:07', '6547'),
(2, '12', 'Axis', 'Shivang S', '2023-01-19 11:55:07', '45678'),
(3, '13', 'HDFC', 'Aliana Davis', '2023-01-20 11:55:07', '11239'),
(4, '15', 'Canara', 'Tusharika Kage', '2023-01-20 10:11:30', '459'),
(6, '48', 'SBI', 'Diana P', '2023-01-20 13:12:55', '67598');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transactionId` int(11) NOT NULL,
  `action` varchar(111) NOT NULL,
  `credit` varchar(111) NOT NULL,
  `debit` varchar(111) NOT NULL,
  `other` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transactionId`, `action`, `credit`, `debit`, `other`, `date`, `userId`) VALUES
(34, 'transfer', '', '1000', '12001122', '2023-01-20 14:32:44', 5),
(35, 'transfer', '', '1000', '12001122', '2023-01-20 14:34:14', 3),
(41, 'deposit', '100000', '', '35', '2023-01-21 07:36:24', 1),
(42, 'withdraw', '', '68500', '19', '2023-01-21 08:38:18', 4),
(51, 'transfer', '', '100', '35', '2023-01-27 10:25:42', 2),
(52, 'transfer', '', '6000', '35', '2023-01-29 20:09:36', 1),
(53, 'deposit', '3000', '', '35', '2023-01-29 20:26:07', 3);

-- --------------------------------------------------------

--
-- Table structure for table `useraccounts`
--

CREATE TABLE `useraccounts` (
  `userId` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `name` varchar(111) NOT NULL,
  `balance` varchar(111) NOT NULL,
  `cnic` varchar(111) NOT NULL,
  `number` varchar(111) NOT NULL,
  `city` varchar(111) NOT NULL,
  `address` varchar(111) NOT NULL,
  `source` varchar(111) NOT NULL,
  `accountNo` varchar(111) NOT NULL,
  `branch` varchar(111) NOT NULL,
  `accountType` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `useraccounts`
--

INSERT INTO `useraccounts` (`userId`, `email`, `password`, `name`, `balance`, `cnic`, `number`, `city`, `address`, `source`, `accountNo`, `branch`, `accountType`, `date`) VALUES
(1, 'aradhya@gmail.com', 'aaa', 'Aradhya', '1700', '611', '8769054231', 'Kerala', 'Munnar', 'Designer', '22', '2', 'Current', '2023-01-29 19:09:53'),
(2, 'bhavya@gmail.com', 'events', 'Bhavya G', '10000', '657', '9345126780', 'Mumbai', '6th cross,Farzapur', 'Staff', '27', '1', 'Saving', '2023-01-14 16:50:06'),
(3, 'kunal@gmail.com', 'kunal', 'Kunal Vasedhar', '23000', '678', '9856723410', 'Delhi', 'Mirzapur', 'Govt. job', '35', '5', 'saving', '2023-01-16 07:52:40'),
(4, 'ishaani@gmail.com', 'ishaani', 'Ishaani Bhatt', '58000', '695', '9812345607', 'Chennai', 'Madurai', 'Modelling', '38', '4', 'saving', '2023-01-18 07:54:18'),
(5, 'bhaavik@gmail.com', 'bhavi', 'Bhaavik Bhushan', '1000000', '631', '9876543218', 'Bangalore', 'JP nagar', 'start up', '44', '5', 'saving', '2023-01-20 13:38:24');

--
-- Triggers `useraccounts`
--
DELIMITER $$
CREATE TRIGGER `low_balance` AFTER UPDATE ON `useraccounts` FOR EACH ROW BEGIN
	IF new.balance<500 THEN 
		INSERT INTO notice(notice,userId) 
		VALUES('Your account balance is less than minimun!!!!',old.userId);
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig_transaction` AFTER UPDATE ON `useraccounts` FOR EACH ROW BEGIN
	IF new.balance<old.balance-5001 THEN 
		INSERT INTO notice(notice,userId) 
		VALUES('A transaction over 5000 was made by you contact us if it was not done by you',new.userId);
	END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchId`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`id`),
  ADD KEY `userId_2` (`userId`);

--
-- Indexes for table `otheraccounts`
--
ALTER TABLE `otheraccounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `useraccounts`
--
ALTER TABLE `useraccounts`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branchId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `otheraccounts`
--
ALTER TABLE `otheraccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `useraccounts`
--
ALTER TABLE `useraccounts`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `useraccounts` (`userId`) ON DELETE CASCADE;

--
-- Constraints for table `notice`
--
ALTER TABLE `notice`
  ADD CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `useraccounts` (`userId`) ON DELETE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `useraccounts` (`userId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
