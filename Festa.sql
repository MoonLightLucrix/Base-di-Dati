CREATE DATABASE Festa;

-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 30, 2018 at 10:54 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Festa`
--

-- --------------------------------------------------------

--
-- Table structure for table `CategoriaEvento`
--

CREATE TABLE `CategoriaEvento` (
  `ID` int(11) NOT NULL,
  `Descrizione` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CategoriaEvento`
--

INSERT INTO `CategoriaEvento` (`ID`, `Descrizione`) VALUES
(1, 'Festa Laurea'),
(2, 'Matrimonio'),
(3, 'Battesimo'),
(4, 'Kresima'),
(5, 'Bar Mitzvah'),
(6, 'Compleanno');

-- --------------------------------------------------------

--
-- Table structure for table `Catering`
--

CREATE TABLE `Catering` (
  `IDCompagnia` int(11) NOT NULL,
  `Nome` char(20) DEFAULT NULL,
  `Descrizione` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Catering`
--

INSERT INTO `Catering` (`IDCompagnia`, `Nome`, `Descrizione`) VALUES
(1, 'Orazio SanCono S.T.R', 'Festini');

-- --------------------------------------------------------

--
-- Table structure for table `Evento`
--

CREATE TABLE `Evento` (
  `ID` int(11) NOT NULL,
  `Titolo` char(20) DEFAULT NULL,
  `EData` date DEFAULT NULL,
  `Categoria` int(11) DEFAULT NULL,
  `Costo_Partecipazione` float(10,2) DEFAULT NULL,
  `IDCatering` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Evento`
--

INSERT INTO `Evento` (`ID`, `Titolo`, `EData`, `Categoria`, `Costo_Partecipazione`, `IDCatering`) VALUES
(1, 'Cose belle', '2013-12-17', 1, 12.50, 1),
(2, 'Bello', '2013-12-21', 5, 120.99, 1),
(3, 'Ki', '2013-12-16', 3, 150.99, 1),
(4, 'Bellissimo', '2013-12-20', 4, 123.99, 1),
(5, 'Beddu', '2013-12-15', 2, 34.99, 1),
(6, 'Caro', '2013-12-14', 1, 20.99, 1),
(7, 'Fondamento', '2017-11-03', 6, 190.99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Organizzatore`
--

CREATE TABLE `Organizzatore` (
  `ID` int(11) DEFAULT NULL,
  `IDEvento` int(11) DEFAULT NULL,
  `Indice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Organizzatore`
--

INSERT INTO `Organizzatore` (`ID`, `IDEvento`, `Indice`) VALUES
(1, 1, 1),
(7, 2, 2),
(9, 3, 3),
(6, 5, 4),
(10, 4, 5),
(6, 6, 6),
(12, 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `Partecipante`
--

CREATE TABLE `Partecipante` (
  `IDEvento` int(11) DEFAULT NULL,
  `IDPersona` int(11) DEFAULT NULL,
  `Indice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Partecipante`
--

INSERT INTO `Partecipante` (`IDEvento`, `IDPersona`, `Indice`) VALUES
(1, 2, 1),
(1, 3, 2),
(2, 6, 3),
(2, 8, 4),
(2, 1, 5),
(2, 9, 6),
(2, 5, 7),
(3, 10, 8),
(3, 3, 9),
(4, 2, 10),
(4, 9, 11),
(4, 4, 12),
(5, 1, 13),
(5, 5, 14),
(5, 2, 15),
(5, 7, 16),
(6, 2, 17),
(6, 3, 18),
(6, 7, 19),
(1, 5, 20),
(6, 5, 21),
(2, 3, 22),
(4, 3, 23),
(5, 3, 24),
(1, 11, 25),
(7, 3, 26),
(7, 11, 27),
(6, 12, 28);

-- --------------------------------------------------------

--
-- Table structure for table `Persona`
--

CREATE TABLE `Persona` (
  `ID` int(11) NOT NULL,
  `Nome` char(20) DEFAULT NULL,
  `Cognome` char(20) DEFAULT NULL,
  `Provincia_Residenza` char(30) DEFAULT NULL,
  `StatoCivile` char(20) DEFAULT NULL,
  `Anni` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Persona`
--

INSERT INTO `Persona` (`ID`, `Nome`, `Cognome`, `Provincia_Residenza`, `StatoCivile`, `Anni`) VALUES
(1, 'Gianni', 'Celeste', 'Catania', 'Sposato', 34),
(2, 'Anastasia', 'Bianchi', 'Motta-Santa\'Anastasia', 'Nubile', 45),
(3, 'Federica', 'Celeste', 'Catania', 'Vedova', 32),
(4, 'Francesco', 'Rossi', 'Milano', 'Celibe', 15),
(5, 'Antonio', 'Bianchi', 'Torino', 'Sposato', 12),
(6, 'Federica', 'Dragà', 'Siracusa', 'Sposata', 15),
(7, 'Marcello', 'Maugeri', 'Giarre', 'Nubile', 18),
(8, 'Seby', 'Finocchiaro', 'Bronx', 'Vedovo', 9),
(9, 'Iano', 'Coscimilova', 'AFera', 'Incivile', 3),
(10, 'Iaffiu', 'Scalisi', 'Paisi', 'Ignorante', 12),
(11, 'Cristo', 'Raciti', 'U Lettu', 'No', 99),
(12, 'Franco', 'Barbanera', 'Catania', 'Sposato', 33),
(13, 'Domenico', 'Cantone', 'New York', 'Sposato', 35),
(14, 'fsdgs', 'dsvsvs', 'sgsdsg', 'Sposato', 27),
(15, 'Giovanni', 'Bello', 'Catania', 'Sposato', 86),
(16, 'fafa', 'sgsgs', 'asgsg', 'Vedovo', 40);

--
-- Triggers `Persona`
--
DELIMITER $$
CREATE TRIGGER `Limita` BEFORE INSERT ON `Persona` FOR EACH ROW BEGIN
    	SELECT COUNT(*) INTO @X FROM Persona;
        IF @X >= 15 THEN
        	SET NEW.StatoCivile='Vedovo';
        END IF;
    END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CategoriaEvento`
--
ALTER TABLE `CategoriaEvento`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Catering`
--
ALTER TABLE `Catering`
  ADD PRIMARY KEY (`IDCompagnia`);

--
-- Indexes for table `Evento`
--
ALTER TABLE `Evento`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDCatering` (`IDCatering`),
  ADD KEY `Categoria` (`Categoria`);

--
-- Indexes for table `Organizzatore`
--
ALTER TABLE `Organizzatore`
  ADD PRIMARY KEY (`Indice`),
  ADD KEY `ID` (`ID`),
  ADD KEY `IDEvento` (`IDEvento`);

--
-- Indexes for table `Partecipante`
--
ALTER TABLE `Partecipante`
  ADD PRIMARY KEY (`Indice`),
  ADD KEY `IDEvento` (`IDEvento`),
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
-- AUTO_INCREMENT for table `CategoriaEvento`
--
ALTER TABLE `CategoriaEvento`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Organizzatore`
--
ALTER TABLE `Organizzatore`
  MODIFY `Indice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Partecipante`
--
ALTER TABLE `Partecipante`
  MODIFY `Indice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Evento`
--
ALTER TABLE `Evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`IDCatering`) REFERENCES `Catering` (`IDCompagnia`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`Categoria`) REFERENCES `CategoriaEvento` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Organizzatore`
--
ALTER TABLE `Organizzatore`
  ADD CONSTRAINT `organizzatore_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Persona` (`ID`),
  ADD CONSTRAINT `organizzatore_ibfk_2` FOREIGN KEY (`IDEvento`) REFERENCES `Evento` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Partecipante`
--
ALTER TABLE `Partecipante`
  ADD CONSTRAINT `partecipante_ibfk_1` FOREIGN KEY (`IDEvento`) REFERENCES `Evento` (`ID`),
  ADD CONSTRAINT `partecipante_ibfk_2` FOREIGN KEY (`IDPersona`) REFERENCES `Persona` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;
