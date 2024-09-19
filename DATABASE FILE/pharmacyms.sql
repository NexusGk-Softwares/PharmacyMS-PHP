-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2021 at 04:29 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pharmacyms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`admin_id` tinyint(5) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `date`) VALUES
(1, 'admin', 'admin', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE IF NOT EXISTS `cashier` (
`cashier_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashier`
--

INSERT INTO `cashier` (`cashier_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(6, 'Will', 'Williams', 'C001', 'AvenueSt', '8520006970', 'willams@gmail.com', 'cashier', 'password', '2018-04-14 11:56:30');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(5) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `served_by` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Unpaid',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `customer_name`, `served_by`, `status`, `date`) VALUES
(10, 'MacClellan', 'osoro', 'Pending', '2018-01-10 11:19:42'),
(11, 'Amanda', 'osoro', 'Pending', '2018-01-10 11:28:59'),
(12, 'Merle L Wilkins', 'osoro', 'Pending', '2018-01-10 12:19:02'),
(13, 'Andre', 'osoro', 'Pending', '2018-01-10 12:25:19'),
(14, 'William', 'osoro', 'Pending', '2018-01-10 12:29:38'),
(15, 'Osoro', 'osoro', 'Pending', '2018-01-10 12:39:51'),
(16, 'Sam Osoro', 'osoro', 'Pending', '2018-01-10 12:49:45'),
(17, 'Andrew H Alonso', 'osoro', 'Pending', '2018-01-10 12:51:48'),
(18, 'Marlin A Messina', 'osoro', 'Pending', '2018-01-12 19:20:44'),
(19, 'Deborah', 'osoro', 'Pending', '2018-02-12 20:34:51');

--
-- Triggers `invoice`
--
DELIMITER //
CREATE TRIGGER `tarehe` AFTER INSERT ON `invoice`
 FOR EACH ROW BEGIN
     SET @date=NOW();
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE IF NOT EXISTS `invoice_details` (
`id` tinyint(5) NOT NULL,
  `invoice` int(5) NOT NULL,
  `drug` tinyint(5) NOT NULL,
  `cost` int(5) DEFAULT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `invoice`, `drug`, `cost`, `quantity`) VALUES
(2, 10, 5, 5, 12),
(3, 11, 5, 5, 12),
(5, 11, 6, 120, 12),
(6, 12, 5, 5, 15),
(7, 12, 6, 120, 17),
(9, 12, 7, 250, 15),
(10, 12, 8, 15, 15),
(11, 12, 9, 1, 20),
(13, 13, 5, 5, 5),
(14, 13, 6, 120, 10),
(15, 13, 7, 250, 20),
(16, 13, 8, 15, 16),
(17, 13, 9, 1, 10),
(19, 14, 5, 5, 5),
(20, 15, 5, 5, 12),
(21, 16, 5, 5, 30),
(22, 16, 6, 120, 10),
(23, 17, 5, 5, 10),
(24, 17, 8, 15, 60),
(25, 18, 5, 5, 12),
(26, 18, 6, 120, 15),
(27, 19, 5, 5, 12),
(28, 19, 6, 120, 15),
(29, 19, 8, 15, 20),
(30, 19, 9, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
`manager_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(1, 'Stephen', 'Strange', 'sam/pharm', 'BleckerSt', '8542226996', 'strange@gmail.com', 'manager', 'password', '2018-01-10 14:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `paymenttypes`
--

CREATE TABLE IF NOT EXISTS `paymenttypes` (
`id` tinyint(5) NOT NULL,
  `Name` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymenttypes`
--

INSERT INTO `paymenttypes` (`id`, `Name`) VALUES
(1, 'Cash'),
(2, 'Card Payment'),
(3, 'Mobile Transfer'),
(4, 'Cheque');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE IF NOT EXISTS `pharmacist` (
`pharmacist_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`pharmacist_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(24, 'Johnson', 'Hemsworth', 'PMS24', 'Michikan', '7896541230', 'hemsjo@gmail.co', 'pharmacist', 'password', '2018-04-14 12:35:25'),
(25, 'Narco', 'Rodriguez', 'PMS52', 'Michikan', '9754448500', 'narcor@gmail.c', 'narco', 'pass', '2018-04-14 12:39:40'),
(26, 'Tom', 'Miller', 'PMS29', 'Durham', '1257888880', 'millertom@gmail.com', 'tom', 't0m@#$%', '2018-04-14 12:40:33'),
(27, 'Terri', 'Silva', 'PMS00', 'Ladora', '7894561320', 'ladorateri@gmail.', 'terri', 'teri', '2018-04-14 12:45:07'),
(28, 'Jeff', 'Montano', 'PMS28', 'Fullerton', '1378554540', 'jeffff@gmail.com', 'jeffm', 'pass@w', '2018-04-14 12:45:56'),
(29, 'Andy', 'Thompson', 'PMS69', 'Newark', '5210000069', 'andypandy@gmail.com', 'andy', 'thompsonpw', '2018-04-14 12:46:52'),
(30, 'Sophie', 'Turner', 'PMS16', 'Ladora', '6969696969', 'sophie@gmail.com', 'sophie', 'password', '2018-04-14 12:48:41'),
(31, 'Annie', 'Franklin', 'PMS84', 'Oregoon', '2478881000', 'annief@gmail.com', 'annie', 'pass', '2018-04-14 12:49:52'),
(32, 'Rosa', 'Miers', 'PMS96', 'Michikan', '6545552220', 'rosa96@gmail.com', 'rosa', 'r0s@', '2018-04-14 12:51:44'),
(33, 'Hannah', 'M', 'PMS02', 'Kentucky', '7894561250', 'hannaho@gmail.com', 'hannah', 'p@$$w0rd', '2018-04-14 12:53:05'),
(34, 'John', 'Stuart', 'PMS39', 'Chariton', '4582220010', 'john@gmail.com', 'john', 'password', '2018-04-14 17:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE IF NOT EXISTS `prescription` (
`id` tinyint(5) NOT NULL,
  `prescription_id` int(5) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `invoice_id` tinyint(5) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `prescription_id`, `customer_id`, `customer_name`, `age`, `sex`, `postal_address`, `invoice_id`, `phone`, `date`) VALUES
(4, 1002, 254678, 'Andre', 0, 'male', '45 eldy', 13, '0987643524', '2018-02-10 12:25:19'),
(9, 1003, 6765, 'Andrew H Alonso', 45, 'Male', '664466447744 Njy', 18, '887998457', '2018-02-12 19:20:44'),
(10, 1004, 1678, 'Deborah', 45, 'Male', '123 Brooklyn', 19, '088721313', '2018-02-12 20:34:50');

--
-- Triggers `prescription`
--
DELIMITER //
CREATE TRIGGER `taree` AFTER INSERT ON `prescription`
 FOR EACH ROW BEGIN
SET@date=NOW();
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_details`
--

CREATE TABLE IF NOT EXISTS `prescription_details` (
`id` tinyint(5) NOT NULL,
  `pres_id` int(5) NOT NULL,
  `drug_name` tinyint(5) NOT NULL,
  `strength` varchar(15) NOT NULL,
  `dose` varchar(15) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription_details`
--

INSERT INTO `prescription_details` (`id`, `pres_id`, `drug_name`, `strength`, `dose`, `quantity`) VALUES
(2, 999, 5, '10 gms', '1x2', 12),
(3, 1000, 5, '10 gms', '1x2', 12),
(5, 1000, 6, '150 gms', '1x4', 12),
(6, 1001, 5, '20 gms', '2x3', 15),
(7, 1001, 6, '30 gms', '2x4', 17),
(9, 1001, 7, '50 gms', '1x3', 15),
(10, 1001, 8, '40 gms', '1x3', 15),
(11, 1001, 9, '15 gms', '2x3', 20),
(13, 1002, 5, '50 gms', '2X3', 5),
(14, 1002, 6, '150 gms', '2X3', 10),
(15, 1002, 7, '20 gms', '2X3', 20),
(16, 1002, 8, '15 gms', '2X3', 16),
(17, 1002, 9, '10 gms', '2X3', 10),
(19, 1003, 5, '50 gms', '1x2', 5),
(20, 1004, 5, '12', '1x2', 12),
(21, 1005, 5, '20 gms', '2x3', 30),
(22, 1005, 6, '40 gms', '1x3', 10),
(23, 1006, 5, '12 gms', '1x3', 10),
(24, 1006, 8, '15 gms', '1x3', 60),
(25, 1003, 5, '20 gms', '1x3', 12),
(26, 1003, 6, '30 gms', '1x2', 15),
(27, 1004, 5, '20 gms', '1x3', 12),
(28, 1004, 6, '150 gms', '1x4', 15),
(29, 1004, 8, '120 gms', '1x3', 20),
(30, 1004, 9, '10 gms', '2x3', 20);

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE IF NOT EXISTS `receipts` (
  `reciptNo` int(10) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `total` int(10) NOT NULL,
  `payType` varchar(10) NOT NULL,
  `serialno` varchar(10) DEFAULT NULL,
  `served_by` varchar(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`reciptNo`, `customer_id`, `total`, `payType`, `serialno`, `served_by`, `date`) VALUES
(0, '', 1500, '', '', 'sam', '0000-00-00 00:00:00'),
(999, '', 1350, '', '', 'sam', '0000-00-00 00:00:00');

--
-- Triggers `receipts`
--
DELIMITER //
CREATE TRIGGER `siku` AFTER INSERT ON `receipts`
 FOR EACH ROW BEGIN
     SET @date=NOW();
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
`stock_id` tinyint(5) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `company` varchar(20) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `status` enum('Available','Inavailable') NOT NULL,
  `date_supplied` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `drug_name`, `category`, `description`, `company`, `supplier`, `quantity`, `cost`, `status`, `date_supplied`) VALUES
(5, 'Piriton', 'tablet', 'Painkiller', 'SB', 'SB', 1000, 5, 'Available', '2018-03-30'),
(6, 'Dual Cotexin', 'tablet', 'Malaria', 'GX', 'Clinix', 150, 120, 'Available', '2018-03-30'),
(7, 'Naproxen', 'Tablet', 'Reproductive', 'Family Health', 'Stopes', 250, 250, 'Available', '2018-03-30'),
(8, 'Flagi', 'talet', 'Digestive', 'GX', 'Clinix', 657, 15, 'Available', '2018-03-30'),
(9, 'Actal', 'Tablet', 'Stomach Reliev', 'GX', 'Clinix', 1000, 1, 'Available', '2018-03-06');

-- --------------------------------------------------------

--
-- Table structure for table `stock_ca`
--

CREATE TABLE IF NOT EXISTS `stock_ca` (
`stock_id` int(5) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `company` varchar(20) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `quantity` int(10) NOT NULL,
  `cost` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_supplied` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_ca`
--

INSERT INTO `stock_ca` (`stock_id`, `drug_name`, `category`, `description`, `company`, `supplier`, `city`, `quantity`, `cost`, `status`, `date_supplied`) VALUES
(100, 'Printin', 'tablet', 'PainKiller', 'BB', 'Brixbio', 'Fresno', 122, 100, 'Avaliable', '2018-02-13'),
(101, 'Printin', 'tablet', 'PainKiller', 'BB', 'Brixbio', 'Fresno', 122, 120, 'Avaliable', '2018-02-13'),
(102, 'Flagi', 'tablet', 'PainKiller', 'GB', 'GetBio', 'Fresno', 100, 50, 'Avaliable', '2018-02-25'),
(103, 'Actal', 'tablet', 'PainKiller', 'SP', 'Stopes', 'Fresno', 50, 70, 'Avaliable', '2018-02-28'),
(104, 'Actal', 'tablet', 'Digestive', 'GB', 'GetBio', 'Fresno', 50, 80, 'Avaliable', '2018-02-26'),
(105, 'Printin', 'tablet', 'PainKiller', 'BB', 'Brixbio', 'Fresno', 122, 150, 'Avaliable', '2018-02-13'),
(106, 'Printin', 'tablet', 'PainKiller', 'BB', 'Brixbio', 'Fresno', 122, 150, 'Avaliable', '2018-02-13'),
(107, 'Printin', 'tablet', 'PainKiller', 'BB', 'Brixbio', 'Fresno', 122, 150, 'Avaliable', '2018-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `stock_dr`
--

CREATE TABLE IF NOT EXISTS `stock_dr` (
`stock_id` int(5) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `company` varchar(20) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `quantity` int(10) NOT NULL,
  `cost` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_supplied` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_dr`
--

INSERT INTO `stock_dr` (`stock_id`, `drug_name`, `category`, `description`, `company`, `supplier`, `city`, `quantity`, `cost`, `status`, `date_supplied`) VALUES
(201, 'Piriton', 'tablet', 'Painkiller', 'BB', 'Brixbio', 'Copenhagen', 500, 60, 'Avaliable', '2018-02-15'),
(202, 'Flagi', 'tablet', 'Digestive', 'BB', 'Brixbio', 'Copenhagen', 122, 70, 'Avaliable', '2018-02-13'),
(203, 'Penicilin', 'tablet', 'Painkiller', 'BB', 'Brixbio', 'Copenhagen', 500, 80, 'Avaliable', '2018-02-25'),
(204, 'Flagi', 'tablet', 'Stomach Relive', 'BB', 'Brixbio', 'Copenhagen', 60, 120, 'Avaliable', '2018-02-17'),
(205, 'Flagi', 'tablet', 'Painkiller', 'BB', 'Brixbio', 'Copenhagen', 102, 80, 'Avaliable', '2018-02-13'),
(206, 'Piriton', 'tablet', 'Painkiller', 'BB', 'Brixbio', 'Copenhagen', 150, 90, 'Avaliable', '2018-01-18'),
(207, 'Flagi', 'tablet', 'Digestive', 'BB', 'Brixbio', 'Copenhagen', 50, 120, 'Avaliable', '2018-02-14'),
(208, 'Prition', 'tablet', 'Painkiller', 'GB', 'GetBio', 'Copenhagen', 40, 60, 'Avaliable', '2018-02-25'),
(209, 'Flagi', 'tablet', 'Digestive', 'BB', 'Brixbio', 'Copenhagen', 122, 70, 'Avaliable', '2018-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `stock_np`
--

CREATE TABLE IF NOT EXISTS `stock_np` (
`stock_id` int(5) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `company` varchar(20) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `quantity` int(10) NOT NULL,
  `cost` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_supplied` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_np`
--

INSERT INTO `stock_np` (`stock_id`, `drug_name`, `category`, `description`, `company`, `supplier`, `city`, `quantity`, `cost`, `status`, `date_supplied`) VALUES
(301, 'Piriton', 'tablet', 'Painkiller', 'BB', 'Brixbio', 'Seef', 500, 80, 'Avaliable', '2018-02-15'),
(302, 'Flagi', 'tablet', 'Digestive', 'CL', 'Clinix', 'Seef', 122, 90, 'Avaliable', '2018-02-13'),
(303, 'Penicilin', 'tablet', 'Painkiller', 'CL', 'Clinix', 'Seef', 500, 70, 'Avaliable', '2018-02-25'),
(304, 'Actal', 'tablet', 'Stomach Relive', 'BB', 'Brixbio', 'Seef', 60, 120, 'Avaliable', '2018-02-17'),
(305, 'Flagi', 'tablet', 'Digestive', 'CL', 'Clinix', 'Seef', 122, 60, 'Avaliable', '2018-02-13'),
(306, 'Penicilin', 'tablet', 'Painkiller', 'BB', 'Brixbio', 'Seef', 100, 120, 'Avaliable', '2018-01-18'),
(307, 'Flagi', 'tablet', 'Digestive', 'BB', 'Brixbio', 'Seef', 50, 500, 'Avaliable', '2018-02-14'),
(308, 'Prition', 'tablet', 'Painkiller', 'CL', 'Clinix', 'Seef', 40, 60, 'Avaliable', '2018-02-25'),
(309, 'Flagi', 'tablet', 'Digestive', 'BB', 'Brixbio', 'Seef', 122, 90, 'Avaliable', '2018-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `tempprescri`
--

CREATE TABLE IF NOT EXISTS `tempprescri` (
`id` tinyint(5) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `postal_address` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `drug_name` varchar(30) NOT NULL,
  `strength` varchar(30) NOT NULL,
  `dose` varchar(30) NOT NULL,
  `quantity` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
 ADD PRIMARY KEY (`cashier_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
 ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
 ADD PRIMARY KEY (`id`), ADD KEY `stocks` (`drug`), ADD KEY `invoices` (`invoice`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
 ADD PRIMARY KEY (`manager_id`);

--
-- Indexes for table `paymenttypes`
--
ALTER TABLE `paymenttypes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacist`
--
ALTER TABLE `pharmacist`
 ADD PRIMARY KEY (`pharmacist_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
 ADD PRIMARY KEY (`id`,`prescription_id`);

--
-- Indexes for table `prescription_details`
--
ALTER TABLE `prescription_details`
 ADD PRIMARY KEY (`id`), ADD KEY `dsfd` (`drug_name`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
 ADD PRIMARY KEY (`reciptNo`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
 ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `stock_ca`
--
ALTER TABLE `stock_ca`
 ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `stock_dr`
--
ALTER TABLE `stock_dr`
 ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `stock_np`
--
ALTER TABLE `stock_np`
 ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `tempprescri`
--
ALTER TABLE `tempprescri`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `admin_id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cashier`
--
ALTER TABLE `cashier`
MODIFY `cashier_id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
MODIFY `manager_id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `paymenttypes`
--
ALTER TABLE `paymenttypes`
MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pharmacist`
--
ALTER TABLE `pharmacist`
MODIFY `pharmacist_id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `prescription_details`
--
ALTER TABLE `prescription_details`
MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
MODIFY `stock_id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `stock_ca`
--
ALTER TABLE `stock_ca`
MODIFY `stock_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `stock_dr`
--
ALTER TABLE `stock_dr`
MODIFY `stock_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=210;
--
-- AUTO_INCREMENT for table `stock_np`
--
ALTER TABLE `stock_np`
MODIFY `stock_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=310;
--
-- AUTO_INCREMENT for table `tempprescri`
--
ALTER TABLE `tempprescri`
MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
ADD CONSTRAINT `invoices` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `stocks` FOREIGN KEY (`drug`) REFERENCES `stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescription_details`
--
ALTER TABLE `prescription_details`
ADD CONSTRAINT `dsfd` FOREIGN KEY (`drug_name`) REFERENCES `stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
