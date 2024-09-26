-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2024 at 01:45 PM
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
-- Database: `pas_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `adorder`
--

CREATE TABLE `adorder` (
  `adOrderID` int(4) NOT NULL,
  `title` text NOT NULL,
  `dateOfOrder` date NOT NULL,
  `placement` text NOT NULL,
  `format` text NOT NULL,
  `adStartDate` date NOT NULL,
  `adEndDate` date NOT NULL,
  `estimatedBudget` decimal(10,2) NOT NULL,
  `specialNotes` text DEFAULT NULL,
  `advertiserID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adorder`
--

INSERT INTO `adorder` (`adOrderID`, `title`, `dateOfOrder`, `placement`, `format`, `adStartDate`, `adEndDate`, `estimatedBudget`, `specialNotes`, `advertiserID`) VALUES
(5501, 'Trouble in Paradigm', '2022-09-01', 'Automatic', 'Video', '2023-01-01', '2023-02-28', 20000.00, 'Advertiser is very needy', 2104),
(5502, 'Domino Effect', '2020-04-30', 'Custom', 'Picture', '2020-05-01', '2020-08-31', 15000.00, 'Medicinal related', 2103),
(5503, 'Black or white?', '2024-03-05', 'Custom', 'Text', '2024-07-02', '2024-11-21', 12000.00, 'Colour can only be in black & white', 2105),
(5504, 'We clean unseen!', '2021-01-01', 'Automatic', 'Video', '2021-04-07', '2022-02-01', 30000.00, 'Reduce volume before final release', 2101),
(5505, 'Old Yeller', '2020-10-18', 'Automatic', 'Picture', '2020-12-01', '2020-12-25', 7000.00, 'Ordered too late, increased price due to late order', 2102);

-- --------------------------------------------------------

--
-- Table structure for table `adplatform`
--

CREATE TABLE `adplatform` (
  `platformID` int(4) NOT NULL,
  `platformName` varchar(40) NOT NULL,
  `description` text DEFAULT NULL,
  `websiteURL` text NOT NULL,
  `recommendedResolution` text NOT NULL,
  `costPerClick` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adplatform`
--

INSERT INTO `adplatform` (`platformID`, `platformName`, `description`, `websiteURL`, `recommendedResolution`, `costPerClick`) VALUES
(7801, 'Facebook', 'Social media website with market share aimed towards older generation with long-lifespan group pages.', 'www.facebook.com', '1080x720', 0.10),
(7802, 'Instagram', 'Trendy social media platform with high amounts of younger generation customer base.', 'www.instagram.com', '1080x556', 0.15),
(7803, 'MogTheDog', 'New, niche animal-oriented social platform designed around pets having virtual play-dates.', 'www.mogthedog.com', '1660x768', 0.20),
(7804, 'Twitter', 'Social media platform designed to accommodate short texts, or \"tweets\", to promote discussion.', 'www.twitter.com', '1200x675', 0.30),
(7805, 'Youtube', 'Video-hosting site with large market share of social media influencers and high average daily viewers.', 'www.youtube.com', '1920x1080', 0.25);

-- --------------------------------------------------------

--
-- Table structure for table `adpublishing`
--

CREATE TABLE `adpublishing` (
  `staffID` int(4) NOT NULL,
  `platformID` int(4) NOT NULL,
  `adOrderID` int(4) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `clicksReceived` int(11) NOT NULL,
  `processingDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adpublishing`
--

INSERT INTO `adpublishing` (`staffID`, `platformID`, `adOrderID`, `startDate`, `endDate`, `clicksReceived`, `processingDate`) VALUES
(1001, 7801, 5503, '2024-07-02', '2024-11-21', 345432, '2024-03-06'),
(1001, 7804, 5501, '2023-01-01', '2023-02-28', 9087654, '2022-09-02'),
(1005, 7802, 5505, '2020-12-01', '2020-12-25', 1234567, '2020-11-11'),
(1005, 7803, 5502, '2020-05-01', '2020-08-31', 54321, '2020-04-30'),
(1005, 7805, 5504, '2021-04-07', '2022-02-01', 456700, '2021-01-04');

-- --------------------------------------------------------

--
-- Table structure for table `advertiser`
--

CREATE TABLE `advertiser` (
  `referenceID` int(4) NOT NULL,
  `businessName` text NOT NULL,
  `businessAddress` text NOT NULL,
  `businessEmail` text NOT NULL,
  `websiteURL` text NOT NULL,
  `contactPhoneNo` varchar(11) NOT NULL,
  `contactFirstName` text NOT NULL,
  `contactLastName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertiser`
--

INSERT INTO `advertiser` (`referenceID`, `businessName`, `businessAddress`, `businessEmail`, `websiteURL`, `contactPhoneNo`, `contactFirstName`, `contactLastName`) VALUES
(2101, 'MeanGreenClean', '44 Washington St', 'MGC@outlook.com', 'www.MGC.com.au', '0123456799', 'Ken', 'Nacht'),
(2102, 'Rumble In The Jungle', '23 Short Cct', 'tarzanwannabe@yahoo.com', 'www.junglerumblers.com.nz', '0123345678', 'George', 'O\'Dajungle'),
(2103, 'Gaul Soodman Atty', '56 Flinders Dr', 'didyouknowyouhaverights@soodman.com', 'www.justice4you.com.us', '1122334455', 'Gaul', 'Soodman'),
(2104, 'Autobot Dismantlers', '101 Cybertron St', 'wewreckcars@hailmegatron.com', 'www.toomanyparts.com.uk', '0344556677', 'Mega', 'Tron'),
(2105, 'Kinematica', '675 Anima Rd', 'deltathegamma@cooked.com', 'www.moviesinmotion.com.py', '0988776655', 'Roland', 'D\'nalor');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceNo` int(4) NOT NULL,
  `issueDate` date NOT NULL,
  `totalAmountPayable` decimal(10,2) NOT NULL,
  `dueDate` date NOT NULL,
  `additionalNotes` text DEFAULT NULL,
  `advertiserID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoiceNo`, `issueDate`, `totalAmountPayable`, `dueDate`, `additionalNotes`, `advertiserID`) VALUES
(4001, '2022-02-02', 14000.00, '2022-05-02', 'Be nice to client', 2101),
(4002, '2020-12-26', 324323.00, '2021-03-26', 'Don\'t respond to phone calls', 2102),
(4003, '2020-09-01', 12332.00, '2020-12-01', 'Client known for being late', 2103),
(4004, '2023-03-01', 3443.00, '2023-06-01', 'Modified rate as agreed by email', 2104),
(4005, '2024-11-22', 44544.00, '2025-02-22', 'Chase up with lawyer if no payment', 2105);

-- --------------------------------------------------------

--
-- Table structure for table `mentorship`
--

CREATE TABLE `mentorship` (
  `menteeID` int(4) NOT NULL,
  `mentorID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mentorship`
--

INSERT INTO `mentorship` (`menteeID`, `mentorID`) VALUES
(1002, 1001),
(1003, 1001),
(1004, 1001),
(1005, 1001),
(1002, 1005);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentReferenceID` int(4) NOT NULL,
  `paymentDate` date NOT NULL,
  `paymentMethod` text NOT NULL,
  `paymentAmount` decimal(10,2) NOT NULL,
  `payerName` text NOT NULL,
  `invoiceNo` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentReferenceID`, `paymentDate`, `paymentMethod`, `paymentAmount`, `payerName`, `invoiceNo`) VALUES
(6601, '2023-03-28', 'Credit card', 10000.00, 'Megatron', 4004),
(6602, '2020-12-31', 'Cash', 5000.00, 'George O\'dajungle', 4002),
(6603, '2022-03-01', 'Cheque', 343.00, 'Eddie Valiant', 4001),
(6604, '2020-09-30', 'Bank Transfer', 10000.00, 'Isaac Terrence', 4003),
(6605, '2024-12-21', 'Bank Transfer', 66767.00, 'Corrina Haumier', 4005);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `advertiserID` int(4) NOT NULL,
  `preferredPlatform` text NOT NULL,
  `adOrderDate` date NOT NULL,
  `adOrderDuration` int(5) NOT NULL COMMENT '(in days)',
  `adOrderCost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`advertiserID`, `preferredPlatform`, `adOrderDate`, `adOrderDuration`, `adOrderCost`) VALUES
(2101, 'Youtube', '2021-01-01', 300, 30000.00),
(2102, 'Instagram', '2020-10-18', 24, 7000.00),
(2103, 'MogTheDog', '2020-04-30', 122, 15000.00),
(2104, 'Twitter', '2022-09-01', 58, 20000.00),
(2105, 'Facebook', '2024-03-05', 142, 12000.00);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewID` int(4) NOT NULL,
  `advertiserID` int(4) NOT NULL,
  `adOrderID` int(4) NOT NULL,
  `reviewDate` date NOT NULL,
  `rating` int(1) NOT NULL,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`reviewID`, `advertiserID`, `adOrderID`, `reviewDate`, `rating`, `comments`) VALUES
(9901, 2104, 5501, '2023-03-01', 5, 'Very happy with overall result'),
(9902, 2102, 5505, '2020-12-26', 3, 'Couldn\'t hear it properly when played'),
(9903, 2103, 5502, '2020-09-01', 4, 'Could have been played at better times but overall very happy'),
(9904, 2105, 5503, '2024-11-23', 5, 'Very well done'),
(9905, 2101, 5504, '2022-02-02', 2, 'Not happy');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` int(4) NOT NULL,
  `firstName` text NOT NULL,
  `lastName` text NOT NULL,
  `address` text NOT NULL,
  `contactPhoneNo` varchar(11) NOT NULL,
  `emailAddress` text NOT NULL,
  `hireDate` date NOT NULL,
  `position` text NOT NULL,
  `employmentType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `firstName`, `lastName`, `address`, `contactPhoneNo`, `emailAddress`, `hireDate`, `position`, `employmentType`) VALUES
(1001, 'John', 'Bexley', '123 Grouse Street', '457575757', 'johnny5@pas.com', '2004-09-14', 'Manager', 'Full-time'),
(1002, 'Polly', 'Wannaquakka', '54 Bleasdale Rd', '987654321', 'crazyparrotlady@pas.com', '2024-07-04', 'Finance Officer', 'Casual'),
(1003, 'Carl', 'Stoneson', '4 Hoxxes Ave', '1234567890', 'interplanetarygoat@pas.com', '2030-12-25', 'Landscaper', 'Part-time'),
(1004, 'Janet', 'McCrowski', '12 Drury Lane', '1357924680', 'legallady@pas.com', '2019-04-02', 'Copyright Lawyer', 'Full-time'),
(1005, 'Karen', 'Sharp', '90 Potts Rd', '864297531', 'summonthekaren@pas.com', '2023-11-09', 'Media Editor', 'Casual');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adorder`
--
ALTER TABLE `adorder`
  ADD PRIMARY KEY (`adOrderID`),
  ADD KEY `advertiserID` (`advertiserID`);

--
-- Indexes for table `adplatform`
--
ALTER TABLE `adplatform`
  ADD PRIMARY KEY (`platformID`),
  ADD UNIQUE KEY `platformName` (`platformName`);

--
-- Indexes for table `adpublishing`
--
ALTER TABLE `adpublishing`
  ADD PRIMARY KEY (`staffID`,`platformID`,`adOrderID`),
  ADD KEY `adOrderID` (`adOrderID`),
  ADD KEY `platformID` (`platformID`),
  ADD KEY `staffID` (`staffID`);

--
-- Indexes for table `advertiser`
--
ALTER TABLE `advertiser`
  ADD PRIMARY KEY (`referenceID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceNo`),
  ADD KEY `advertiserID` (`advertiserID`);

--
-- Indexes for table `mentorship`
--
ALTER TABLE `mentorship`
  ADD PRIMARY KEY (`mentorID`,`menteeID`),
  ADD KEY `mentorID` (`mentorID`),
  ADD KEY `menteeID` (`menteeID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentReferenceID`),
  ADD KEY `invoiceNo` (`invoiceNo`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`advertiserID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewID`),
  ADD KEY `advertiserID` (`advertiserID`),
  ADD KEY `adOrderID` (`adOrderID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adorder`
--
ALTER TABLE `adorder`
  MODIFY `adOrderID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5506;

--
-- AUTO_INCREMENT for table `advertiser`
--
ALTER TABLE `advertiser`
  MODIFY `referenceID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2106;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceNo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4006;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentReferenceID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6606;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `advertiserID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2106;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9906;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staffID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adorder`
--
ALTER TABLE `adorder`
  ADD CONSTRAINT `advertiserID` FOREIGN KEY (`advertiserID`) REFERENCES `advertiser` (`referenceID`);

--
-- Constraints for table `adpublishing`
--
ALTER TABLE `adpublishing`
  ADD CONSTRAINT `adOrderID` FOREIGN KEY (`adOrderID`) REFERENCES `adorder` (`adOrderID`),
  ADD CONSTRAINT `adpublishing_ibfk_1` FOREIGN KEY (`platformID`) REFERENCES `adplatform` (`platformID`),
  ADD CONSTRAINT `staffID` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`advertiserID`) REFERENCES `advertiser` (`referenceID`);

--
-- Constraints for table `mentorship`
--
ALTER TABLE `mentorship`
  ADD CONSTRAINT `menteeID` FOREIGN KEY (`menteeID`) REFERENCES `staff` (`staffID`),
  ADD CONSTRAINT `mentorID` FOREIGN KEY (`mentorID`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`invoiceNo`) REFERENCES `invoice` (`invoiceNo`);

--
-- Constraints for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD CONSTRAINT `portfolio_ibfk_1` FOREIGN KEY (`advertiserID`) REFERENCES `advertiser` (`referenceID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`advertiserID`) REFERENCES `advertiser` (`referenceID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`adOrderID`) REFERENCES `adorder` (`adOrderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
