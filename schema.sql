SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `theatreappsuite` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `theatreappsuite`;

CREATE TABLE `blocking` (
  `BlockingID` int(11) NOT NULL,
  `OriginX` float NOT NULL,
  `OriginY` float NOT NULL,
  `OriginZ` float NOT NULL,
  `DestX` float NOT NULL,
  `DestY` float NOT NULL,
  `DestZ` float NOT NULL,
  `MovementType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Orientation` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `characterinfo` (
  `CharacterID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `characterline` (
  `CharacterID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `BlockingID` int(11) DEFAULT NULL,
  `Speaking` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `characteruser` (
  `UserID` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `costume` (
  `CostumeID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `costumecue` (
  `CostumeID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `CharacterID` int(11) DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `light` (
  `LightID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lightingcue` (
  `LightID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Location` varchar(10) NOT NULL,
  `Status` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `line` (
  `LineID` int(11) NOT NULL,
  `PlayID` int(11) NOT NULL,
  `ActNum` int(11) NOT NULL,
  `SceneNum` int(11) NOT NULL,
  `LineNum` int(11) NOT NULL,
  `Text` varchar(500) NOT NULL,
  `DirectorNote` varchar(500) DEFAULT NULL,
  `FrenchID` int(11) DEFAULT NULL COMMENT 'This determines whether or not a given line is part of a french scene. NULL means that it is not, otherwise it is the "subscene"'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `permissions` (
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

CREATE TABLE `play` (
  `PlayID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `prop` (
  `PropID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `propmovement` (
  `PropID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `MovementDescription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sound` (
  `SoundID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `soundcue` (
  `SoundID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(10) NOT NULL,
  `Password` varchar(60) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `blocking`
  ADD PRIMARY KEY (`BlockingID`);

ALTER TABLE `characterinfo`
  ADD PRIMARY KEY (`CharacterID`);

ALTER TABLE `characterline`
  ADD PRIMARY KEY (`CharacterID`,`LineID`),
  ADD KEY `CharacterID_idx` (`CharacterID`),
  ADD KEY `LineID_idx` (`LineID`),
  ADD KEY `BlockingID` (`BlockingID`);

ALTER TABLE `characteruser`
  ADD PRIMARY KEY (`UserID`,`CharacterID`),
  ADD KEY `UserID_idx` (`UserID`),
  ADD KEY `CharacterID_idx` (`CharacterID`);

ALTER TABLE `costume`
  ADD PRIMARY KEY (`CostumeID`);

ALTER TABLE `costumecue`
  ADD PRIMARY KEY (`CostumeID`,`LineID`),
  ADD KEY `CostumeID_idx` (`CostumeID`),
  ADD KEY `LineID_idx` (`LineID`),
  ADD KEY `CharacterID_idx` (`CharacterID`);

ALTER TABLE `light`
  ADD PRIMARY KEY (`LightID`);

ALTER TABLE `lightingcue`
  ADD PRIMARY KEY (`LightID`,`LineID`),
  ADD KEY `LightID_idx` (`LightID`),
  ADD KEY `LineID_idx` (`LineID`),
  ADD KEY `UserID_idx` (`UserID`);

ALTER TABLE `line`
  ADD PRIMARY KEY (`LineID`),
  ADD KEY `PlayID_idx` (`PlayID`);

ALTER TABLE `permissions`
  ADD PRIMARY KEY (`UserID`,`PlayID`),
  ADD KEY `UserID_idx` (`UserID`),
  ADD KEY `PlayID_idx` (`PlayID`);

ALTER TABLE `play`
  ADD PRIMARY KEY (`PlayID`);

ALTER TABLE `prop`
  ADD PRIMARY KEY (`PropID`);

ALTER TABLE `propmovement`
  ADD KEY `PropID_idx` (`PropID`),
  ADD KEY `LineID_idx` (`LineID`),
  ADD KEY `UserID_idx` (`UserID`);

ALTER TABLE `sound`
  ADD PRIMARY KEY (`SoundID`);

ALTER TABLE `soundcue`
  ADD PRIMARY KEY (`SoundID`,`LineID`),
  ADD KEY `SoundID_idx` (`SoundID`),
  ADD KEY `LineID_idx` (`LineID`),
  ADD KEY `UserID_idx` (`UserID`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserName` (`UserName`);


ALTER TABLE `blocking`
  MODIFY `BlockingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
ALTER TABLE `characterinfo`
  MODIFY `CharacterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
ALTER TABLE `costume`
  MODIFY `CostumeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `light`
  MODIFY `LightID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `line`
  MODIFY `LineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
ALTER TABLE `play`
  MODIFY `PlayID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `prop`
  MODIFY `PropID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `sound`
  MODIFY `SoundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `characterline`
  ADD CONSTRAINT `BlockingCharacterID` FOREIGN KEY (`CharacterID`) REFERENCES `characterinfo` (`CharacterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `BlockingLineID` FOREIGN KEY (`LineID`) REFERENCES `line` (`LineID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `characteruser`
  ADD CONSTRAINT `CUCharacterID` FOREIGN KEY (`CharacterID`) REFERENCES `characterinfo` (`CharacterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CUUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `costumecue`
  ADD CONSTRAINT `CostumeCueCharacterID` FOREIGN KEY (`CharacterID`) REFERENCES `characterinfo` (`CharacterID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `CostumeCueCostumeID` FOREIGN KEY (`CostumeID`) REFERENCES `costume` (`CostumeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CostumeCueLineID` FOREIGN KEY (`LineID`) REFERENCES `line` (`LineID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `lightingcue`
  ADD CONSTRAINT `LightingCueLightID` FOREIGN KEY (`LightID`) REFERENCES `light` (`LightID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `LightingCueLineID` FOREIGN KEY (`LineID`) REFERENCES `line` (`LineID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `LightingCueUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `line`
  ADD CONSTRAINT `LinePlayID` FOREIGN KEY (`PlayID`) REFERENCES `play` (`PlayID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `permissions`
  ADD CONSTRAINT `PermissionsPlayID` FOREIGN KEY (`PlayID`) REFERENCES `play` (`PlayID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PermissionsUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `propmovement`
  ADD CONSTRAINT `PropMovememntUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `PropMovementLineID` FOREIGN KEY (`LineID`) REFERENCES `line` (`LineID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PropMovementPropID` FOREIGN KEY (`PropID`) REFERENCES `prop` (`PropID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `soundcue`
  ADD CONSTRAINT `SoundCueLineID` FOREIGN KEY (`LineID`) REFERENCES `line` (`LineID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SoundCueSoundID` FOREIGN KEY (`SoundID`) REFERENCES `sound` (`SoundID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SoundCueUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
