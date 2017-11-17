-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 17, 2017 at 10:16 PM
-- Server version: 10.1.20-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- -----------------------------------------------------
-- Schema theatreappsuite
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `theatreappsuite` DEFAULT CHARACTER SET utf8 ;
USE `theatreappsuite` ;

-- --------------------------------------------------------

--
-- Table structure for table `blocking`
--

CREATE TABLE IF NOT EXISTS `blocking` (
  `CharacterID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `OriginX` float DEFAULT NULL,
  `OriginY` float DEFAULT NULL,
  `DestX` float DEFAULT NULL,
  `DestY` float DEFAULT NULL,
  `MovementType` varchar(20) DEFAULT NULL,
  `Orientation` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `characteruser`
--

CREATE TABLE IF NOT EXISTS `characteruser` (
  `UserID` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `charinfo`
--

CREATE TABLE IF NOT EXISTS `charinfo` (
  `CharacterID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `costume`
--

CREATE TABLE IF NOT EXISTS `costume` (
  `CostumeID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `costumecue`
--

CREATE TABLE IF NOT EXISTS `costumecue` (
  `CostumeID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `CharacterID` int(11) DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `light`
--

CREATE TABLE IF NOT EXISTS `light` (
  `LightID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lightingcue`
--

CREATE TABLE IF NOT EXISTS `lightingcue` (
  `LightID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Location` varchar(10) NOT NULL,
  `Status` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `line`
--

CREATE TABLE IF NOT EXISTS `line` (
  `LineID` int(11) NOT NULL,
  `PlayID` int(11) NOT NULL,
  `ActNum` int(11) NOT NULL,
  `SceneNum` int(11) NOT NULL,
  `LineNum` int(11) NOT NULL,
  `Text` varchar(500) NOT NULL,
  `DirectorNote` varchar(500) DEFAULT NULL,
  `FrenchID` int(11) DEFAULT NULL COMMENT 'This determines whether or not a given line is part of a french scene. NULL means that it is not, otherwise it is the "subscene"'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `UserID` int(11) NOT NULL,
  `PlayID` int(11) NOT NULL,
  `Director` bit(1) NOT NULL DEFAULT b'0',
  `StageManager` bit(1) NOT NULL DEFAULT b'0',
  `AsstStageManager` bit(1) NOT NULL DEFAULT b'0',
  `Light` bit(1) NOT NULL DEFAULT b'0',
  `Sound` bit(1) NOT NULL DEFAULT b'0',
  `StageCrew` bit(1) NOT NULL DEFAULT b'0',
  `Actor` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `play`
--

CREATE TABLE IF NOT EXISTS `play` (
  `PlayID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prop`
--

CREATE TABLE IF NOT EXISTS `prop` (
  `PropID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `propmovement`
--

CREATE TABLE IF NOT EXISTS `propmovement` (
  `PropID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `MovementDescription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sound`
--

CREATE TABLE IF NOT EXISTS `sound` (
  `SoundID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `soundcue`
--

CREATE TABLE IF NOT EXISTS `soundcue` (
  `SoundID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(10) NOT NULL,
  `Password` varchar(60) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for table `blocking`
--
ALTER TABLE `blocking`
  ADD KEY `CharacterID_idx` (`CharacterID`),
  ADD KEY `LineID_idx` (`LineID`);

--
-- Indexes for table `characteruser`
--
ALTER TABLE `characteruser`
  ADD KEY `UserID_idx` (`UserID`),
  ADD KEY `CharacterID_idx` (`CharacterID`);

--
-- Indexes for table `charinfo`
--
ALTER TABLE `charinfo`
  ADD PRIMARY KEY (`CharacterID`);

--
-- Indexes for table `costume`
--
ALTER TABLE `costume`
  ADD PRIMARY KEY (`CostumeID`);

--
-- Indexes for table `costumecue`
--
ALTER TABLE `costumecue`
  ADD KEY `CostumeID_idx` (`CostumeID`),
  ADD KEY `LineID_idx` (`LineID`),
  ADD KEY `CharacterID_idx` (`CharacterID`);

--
-- Indexes for table `light`
--
ALTER TABLE `light`
  ADD PRIMARY KEY (`LightID`);

--
-- Indexes for table `lightingcue`
--
ALTER TABLE `lightingcue`
  ADD KEY `LightID_idx` (`LightID`),
  ADD KEY `LineID_idx` (`LineID`),
  ADD KEY `UserID_idx` (`UserID`);

--
-- Indexes for table `line`
--
ALTER TABLE `line`
  ADD PRIMARY KEY (`LineID`),
  ADD KEY `PlayID_idx` (`PlayID`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD KEY `UserID_idx` (`UserID`),
  ADD KEY `PlayID_idx` (`PlayID`);

--
-- Indexes for table `play`
--
ALTER TABLE `play`
  ADD PRIMARY KEY (`PlayID`);

--
-- Indexes for table `prop`
--
ALTER TABLE `prop`
  ADD PRIMARY KEY (`PropID`);

--
-- Indexes for table `propmovement`
--
ALTER TABLE `propmovement`
  ADD KEY `PropID_idx` (`PropID`),
  ADD KEY `LineID_idx` (`LineID`),
  ADD KEY `UserID_idx` (`UserID`);

--
-- Indexes for table `sound`
--
ALTER TABLE `sound`
  ADD PRIMARY KEY (`SoundID`);

--
-- Indexes for table `soundcue`
--
ALTER TABLE `soundcue`
  ADD KEY `SoundID_idx` (`SoundID`),
  ADD KEY `LineID_idx` (`LineID`),
  ADD KEY `UserID_idx` (`UserID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `charinfo`
--
ALTER TABLE `charinfo`
  MODIFY `CharacterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `costume`
--
ALTER TABLE `costume`
  MODIFY `CostumeID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `light`
--
ALTER TABLE `light`
  MODIFY `LightID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `line`
--
ALTER TABLE `line`
  MODIFY `LineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `play`
--
ALTER TABLE `play`
  MODIFY `PlayID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `prop`
--
ALTER TABLE `prop`
  MODIFY `PropID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sound`
--
ALTER TABLE `sound`
  MODIFY `SoundID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `blocking`
--
ALTER TABLE `blocking`
  ADD CONSTRAINT `BlockingCharacterID` FOREIGN KEY (`CharacterID`) REFERENCES `charinfo` (`CharacterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `BlockingLineID` FOREIGN KEY (`LineID`) REFERENCES `line` (`LineID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `characteruser`
--
ALTER TABLE `characteruser`
  ADD CONSTRAINT `CUCharacterID` FOREIGN KEY (`CharacterID`) REFERENCES `charinfo` (`CharacterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CUUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `costumecue`
--
ALTER TABLE `costumecue`
  ADD CONSTRAINT `CostumeCueCharacterID` FOREIGN KEY (`CharacterID`) REFERENCES `charinfo` (`CharacterID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `CostumeCueCostumeID` FOREIGN KEY (`CostumeID`) REFERENCES `costume` (`CostumeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CostumeCueLineID` FOREIGN KEY (`LineID`) REFERENCES `line` (`LineID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lightingcue`
--
ALTER TABLE `lightingcue`
  ADD CONSTRAINT `LightingCueLightID` FOREIGN KEY (`LightID`) REFERENCES `light` (`LightID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `LightingCueLineID` FOREIGN KEY (`LineID`) REFERENCES `line` (`LineID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `LightingCueUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `line`
--
ALTER TABLE `line`
  ADD CONSTRAINT `LinePlayID` FOREIGN KEY (`PlayID`) REFERENCES `play` (`PlayID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `PermissionsPlayID` FOREIGN KEY (`PlayID`) REFERENCES `play` (`PlayID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PermissionsUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `propmovement`
--
ALTER TABLE `propmovement`
  ADD CONSTRAINT `PropMovememntUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `PropMovementLineID` FOREIGN KEY (`LineID`) REFERENCES `line` (`LineID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PropMovementPropID` FOREIGN KEY (`PropID`) REFERENCES `prop` (`PropID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `soundcue`
--
ALTER TABLE `soundcue`
  ADD CONSTRAINT `SoundCueLineID` FOREIGN KEY (`LineID`) REFERENCES `line` (`LineID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SoundCueSoundID` FOREIGN KEY (`SoundID`) REFERENCES `sound` (`SoundID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SoundCueUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
