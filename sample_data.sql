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

INSERT INTO `blocking` (`BlockingID`, `OriginX`, `OriginY`, `OriginZ`, `DestX`, `DestY`, `DestZ`, `MovementType`, `Orientation`) VALUES
(1, 10, 20, 0, 15.6, 6.7, 0, 'Cross', 'Full Front'),
(2, 0, -10, 0, 40.5, -20.7, 0, 'Cross', 'Left Profi'),
(3, 50, 10, 0, 0, 6.8, 0, 'Cross', 'Right Profile'),
(4, 52, 10, 0, 2, 8.8, 0, 'Cross', 'Left Profile'),
(7, 10, 17.8, 0, 0, 0, 0, NULL, 'Full Front'),
(8, 43.5, 21.2, 0, -17, -25.6, 0, 'Cross', NULL),
(9, -25, -4.5, 0, 10, 28, 0, 'Cross', 'Right Profile'),
(10, -27, -2.5, 0, 8, 26, 0, 'Cross', 'Right Profile'),
(11, 47, 20, -6.8, -34, 0, 0, 'Counter', 'Sharing 1/4 Left');

CREATE TABLE `characterinfo` (
  `CharacterID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `characterinfo` (`CharacterID`, `Name`, `Description`) VALUES
(1, 'Mr. Apple', 'A shiny, Golden Delicious apple. Short tempered.'),
(2, 'Mrs. Apple', 'A shiny, Granny Smith apple. A little bit overbearing.'),
(3, 'Ms. Banana', 'The antagonist of the play. Always follows the latest fashion trends.'),
(4, 'Romeo', 'An experienced astronaut. He has won several galactic battles.'),
(5, 'Juliet', 'Romeo\'s disciple. Bright and full of energy, eager to learn.'),
(6, 'Xylo King', NULL),
(7, 'Generic Character A', NULL),
(8, 'Generic Character B', NULL),
(9, 'Orange', 'The main villain. He is cruel and full of citrus.');

CREATE TABLE `characterline` (
  `CharacterID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `BlockingID` int(11) DEFAULT NULL,
  `Speaking` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `characterline` (`CharacterID`, `LineID`, `BlockingID`, `Speaking`) VALUES
(1, 5, NULL, 1),
(1, 11, NULL, 1),
(2, 14, NULL, 1),
(3, 6, 1, 1),
(3, 11, NULL, 1),
(4, 21, 3, 1),
(4, 27, 9, 1),
(4, 28, NULL, 1),
(4, 30, NULL, 1),
(4, 33, NULL, 1),
(5, 21, 4, 0),
(5, 22, NULL, 1),
(5, 27, 10, 0),
(5, 32, 11, 1),
(6, 24, 7, 1),
(6, 26, 8, 1),
(6, 29, NULL, 1),
(9, 8, NULL, 1),
(9, 9, 2, 1),
(9, 12, NULL, 1);

CREATE TABLE `characteruser` (
  `UserID` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `characteruser` (`UserID`, `CharacterID`) VALUES
(3, 1),
(5, 1),
(5, 7),
(5, 8);

CREATE TABLE `costume` (
  `CostumeID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `costume` (`CostumeID`, `Name`, `Description`) VALUES
(1, 'Chicken Suit', 'This costume looks like that of a giant rubber chicken.'),
(2, 'Apple Suit', 'This is a giant red apple made out of cardboard and wore from the neck.');

CREATE TABLE `costumecue` (
  `CostumeID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `CharacterID` int(11) DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `costumecue` (`CostumeID`, `LineID`, `CharacterID`, `Note`) VALUES
(2, 15, 1, 'Mr. Apple should violently rip his costume off');

CREATE TABLE `light` (
  `LightID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `light` (`LightID`, `Name`, `Type`) VALUES
(1, 'Overhead White Light', NULL),
(2, 'Spotlight1', 'Spotlight');

CREATE TABLE `lightingcue` (
  `LightID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Location` varchar(10) NOT NULL,
  `Status` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `lightingcue` (`LightID`, `LineID`, `UserID`, `Location`, `Status`) VALUES
(1, 8, 1, 'SR', 'On'),
(2, 24, NULL, 'DL', 'On'),
(2, 25, NULL, '', 'Off');

CREATE TABLE `line` (
  `LineID` int(11) NOT NULL,
  `PlayID` int(11) NOT NULL,
  `ActNum` int(11) NOT NULL,
  `SceneNum` int(11) NOT NULL,
  `LineNum` int(11) NOT NULL,
  `Text` text NOT NULL,
  `DirectorNote` varchar(500) DEFAULT NULL,
  `FrenchID` int(11) DEFAULT NULL COMMENT 'This determines whether or not a given line is part of a french scene. NULL means that it is not, otherwise it is the "subscene"'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `line` (`LineID`, `PlayID`, `ActNum`, `SceneNum`, `LineNum`, `Text`, `DirectorNote`, `FrenchID`) VALUES
(1, 1, 0, 0, 1, 'THE ADVENTURES OF APPLE AND BANANA', NULL, NULL),
(2, 1, 0, 0, 2, 'By John Doe', NULL, NULL),
(3, 1, 0, 0, 3, 'Representing:', NULL, NULL),
(4, 1, 0, 0, 4, 'Mr. Apple, Mrs. Apple, Ms. Banana, and Orange.', NULL, NULL),
(5, 1, 1, 1, 5, 'I am an Apple', NULL, NULL),
(6, 1, 1, 1, 6, 'I am a Banana', 'Say this loudly and proudly!!', NULL),
(7, 1, 1, 2, 7, '[BANANA and APPLE exit. Enter ORANGE.]', NULL, NULL),
(8, 1, 1, 2, 8, 'I am an orange, and I am the greatest fruit of all!', NULL, NULL),
(9, 1, 1, 2, 9, 'Apple and Banana will bow to my awesomeness!', 'Say this with furious anger', NULL),
(10, 1, 2, 1, 10, '[APPLE, MRS. APPLE, and BANANA enter.]', NULL, NULL),
(11, 1, 2, 1, 11, 'You are no match for us, Orange!', NULL, NULL),
(12, 1, 2, 1, 12, 'Noooooooo!', NULL, NULL),
(13, 1, 2, 1, 13, '[ORANGE dies. APPLE AND BANANA spit on its rotting rinds.]', NULL, NULL),
(14, 1, 2, 1, 14, 'Wow, what an amazing husband!', NULL, NULL),
(15, 1, 2, 1, 15, 'THE END', NULL, NULL),
(16, 2, 0, 0, 1, 'ROMEO AND JULIET: A SPACE BATTLE', NULL, NULL),
(17, 2, 0, 0, 2, 'By Zorkon Shakespeare', NULL, NULL),
(18, 2, 0, 0, 3, 'Representing:', NULL, NULL),
(19, 2, 0, 0, 4, 'Romeo, Juliet, and Xylo King', NULL, NULL),
(20, 2, 1, 1, 5, '[ROMEO and JULIET enter their spaceship.]', NULL, NULL),
(21, 2, 1, 1, 6, 'Juliet, set coordinates for the Verona System!', 'Say this firmly, but not angrily', NULL),
(22, 2, 1, 1, 7, 'Got it!', NULL, NULL),
(23, 2, 1, 1, 8, '[JULIET Presses a button and they blast off.]', NULL, NULL),
(24, 2, 1, 2, 9, 'I am the evil Xylo King!', NULL, 1),
(25, 2, 1, 2, 10, '[Enter ROMEO and JULIET.]', NULL, 1),
(26, 2, 1, 2, 11, 'Well, look who it is! Romeo, and his sidekick, Juliet!', NULL, 2),
(27, 2, 1, 2, 12, 'We\'re here to destroy you!', NULL, 2),
(28, 2, 2, 1, 13, 'Im shooting you!', NULL, NULL),
(29, 2, 2, 1, 14, 'Aaagh! You shot me, Romeo!', NULL, NULL),
(30, 2, 2, 1, 15, 'Die monster, you don\'t belong in this world!', NULL, NULL),
(31, 2, 2, 1, 16, '[XYLO KING dies.]', NULL, NULL),
(32, 2, 2, 2, 17, 'You did it, Romeo!', NULL, NULL),
(33, 2, 2, 2, 18, 'Yep, and I\'m promoting you to admiral. Good job, Juliet.', NULL, NULL),
(34, 2, 2, 2, 19, 'THE END', NULL, NULL);

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

INSERT INTO `permissions` (`UserID`, `PlayID`, `Director`, `StageManager`, `AsstStageManager`, `Light`, `Sound`, `StageCrew`, `Actor`) VALUES
(1, 1, b'0', b'0', b'0', b'1', b'1', b'0', b'0'),
(2, 2, b'1', b'0', b'0', b'0', b'0', b'0', b'0'),
(3, 1, b'0', b'0', b'0', b'0', b'0', b'0', b'1'),
(4, 1, b'0', b'1', b'0', b'0', b'0', b'0', b'0'),
(4, 3, b'0', b'1', b'0', b'0', b'0', b'0', b'0'),
(5, 1, b'0', b'0', b'0', b'0', b'0', b'1', b'0'),
(5, 3, b'0', b'0', b'0', b'0', b'0', b'0', b'1'),
(5, 4, b'0', b'0', b'0', b'0', b'0', b'0', b'1');

CREATE TABLE `play` (
  `PlayID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `play` (`PlayID`, `Name`) VALUES
(1, 'The Adventures of An Apple and A Banana'),
(2, 'Romeo and Juliet: A Space Battle'),
(3, 'Hamlet: Pork Chop'),
(4, 'Ma chanson est une chanson silencieuse');

CREATE TABLE `prop` (
  `PropID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `prop` (`PropID`, `Name`, `Description`) VALUES
(1, 'Spaceship', 'Romeo and Juliet\'s spaceship that has wheels on it for easy movement.'),
(2, 'Apple Tree #1', NULL);

CREATE TABLE `propmovement` (
  `PropID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `MovementDescription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `propmovement` (`PropID`, `LineID`, `UserID`, `MovementDescription`) VALUES
(1, 23, 5, 'The Spaceship gets wheeled off stage left.'),
(2, 1, NULL, 'Apple tree #1 is placed directly in the center of the stage.');

CREATE TABLE `sound` (
  `SoundID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sound` (`SoundID`, `Name`, `Description`) VALUES
(1, 'Laser Gun', 'The sound of a laser gun shooting.'),
(2, 'Squish noise', 'The sound of Orange being squished.'),
(3, 'Spaceship engine starting', NULL);

CREATE TABLE `soundcue` (
  `SoundID` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `soundcue` (`SoundID`, `LineID`, `UserID`, `Note`) VALUES
(1, 28, 1, 'This sound plays when Romeo kills the Xylo King.'),
(2, 12, NULL, 'This plays as Orange is dying.'),
(3, 21, 1, NULL);

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(10) NOT NULL,
  `Password` varchar(60) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user` (`UserID`, `UserName`, `Password`, `FirstName`, `LastName`) VALUES
(1, 'jd42', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', 'John', 'Doe'),
(2, 'qrb2', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', NULL, NULL),
(3, 'ziz99', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', NULL, 'Zyzema'),
(4, 'bb2', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', 'Bobby', NULL),
(5, 'qik3', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', 'Quaker', 'King'),
(6, 'rab243', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', NULL, NULL);


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
