-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 31, 2020 at 02:21 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Disney+`
--

-- --------------------------------------------------------

--
-- Table structure for table `Device`
--

CREATE TABLE `Device` (
  `ID` int(11) NOT NULL,
  `IDPersona` int(11) DEFAULT NULL,
  `Descrizione` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Device`
--

INSERT INTO `Device` (`ID`, `IDPersona`, `Descrizione`) VALUES
(28, 1, 'PC'),
(29, 1, 'PS4'),
(30, 1, 'Cellulare'),
(31, 1, 'Cellulare'),
(32, 3, 'MacBook Pro (Retina, 13-inch, Early 2015) OS: MacOS Catalina'),
(33, 4, 'PS4'),
(34, 4, 'PC Fisso Browser: Firefox'),
(35, 5, 'SMART TV'),
(38, 4, 'Xiaomi mi 9t pro'),
(39, 5, 'PS4');

-- --------------------------------------------------------

--
-- Stand-in structure for view `elenco dispositivi`
-- (See below for the actual view)
--
CREATE TABLE `elenco dispositivi` (
`ID` int(11)
,`Nome` char(20)
,`Dispositivo` char(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `Persona`
--

CREATE TABLE `Persona` (
  `ID` int(11) NOT NULL,
  `Nome` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Persona`
--

INSERT INTO `Persona` (`ID`, `Nome`) VALUES
(1, 'Cristo & Kate'),
(3, 'Matteo'),
(4, 'Seby'),
(5, 'Turi');

-- --------------------------------------------------------

--
-- Structure for view `elenco dispositivi`
--
DROP TABLE IF EXISTS `elenco dispositivi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `elenco dispositivi`  AS  select `persona`.`ID` AS `ID`,`persona`.`Nome` AS `Nome`,`device`.`Descrizione` AS `Dispositivo` from (`persona` join `device`) where (`persona`.`ID` = `device`.`IDPersona`) order by `persona`.`ID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Device`
--
ALTER TABLE `Device`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDPersona` (`IDPersona`);

--
-- Indexes for table `Persona`
--
ALTER TABLE `Persona`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Device`
--
ALTER TABLE `Device`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `Persona`
--
ALTER TABLE `Persona`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Device`
--
ALTER TABLE `Device`
  ADD CONSTRAINT `device_ibfk_1` FOREIGN KEY (`IDPersona`) REFERENCES `persona` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;
