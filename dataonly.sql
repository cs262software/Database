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

INSERT INTO `characteruser` (`UserID`, `CharacterID`) VALUES
(3, 1),
(5, 1),
(5, 7),
(5, 8);

INSERT INTO `costume` (`CostumeID`, `Name`, `Description`) VALUES
(1, 'Chicken Suit', 'This costume looks like that of a giant rubber chicken.'),
(2, 'Apple Suit', 'This is a giant red apple made out of cardboard and wore from the neck.');

INSERT INTO `costumecue` (`CostumeID`, `LineID`, `CharacterID`, `Note`) VALUES
(2, 15, 1, 'Mr. Apple should violently rip his costume off');

INSERT INTO `light` (`LightID`, `Name`, `Type`) VALUES
(1, 'Overhead White Light', NULL),
(2, 'Spotlight1', 'Spotlight');

INSERT INTO `lightingcue` (`LightID`, `LineID`, `UserID`, `Location`, `Status`) VALUES
(1, 8, 1, 'SR', 'On'),
(2, 24, NULL, 'DL', 'On'),
(2, 25, NULL, '', 'Off');

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

INSERT INTO `permissions` (`UserID`, `PlayID`, `Director`, `StageManager`, `AsstStageManager`, `Light`, `Sound`, `StageCrew`, `Actor`) VALUES
(1, 1, b'0', b'0', b'0', b'1', b'1', b'0', b'0'),
(2, 2, b'1', b'0', b'0', b'0', b'0', b'0', b'0'),
(3, 1, b'0', b'0', b'0', b'0', b'0', b'0', b'1'),
(4, 1, b'0', b'1', b'0', b'0', b'0', b'0', b'0'),
(4, 3, b'0', b'1', b'0', b'0', b'0', b'0', b'0'),
(5, 1, b'0', b'0', b'0', b'0', b'0', b'1', b'0'),
(5, 3, b'0', b'0', b'0', b'0', b'0', b'0', b'1'),
(5, 4, b'0', b'0', b'0', b'0', b'0', b'0', b'1');

INSERT INTO `play` (`PlayID`, `Name`) VALUES
(1, 'The Adventures of An Apple and A Banana'),
(2, 'Romeo and Juliet: A Space Battle'),
(3, 'Hamlet: Pork Chop'),
(4, 'Ma chanson est une chanson silencieuse');

INSERT INTO `prop` (`PropID`, `Name`, `Description`) VALUES
(1, 'Spaceship', 'Romeo and Juliet\'s spaceship that has wheels on it for easy movement.'),
(2, 'Apple Tree #1', NULL);

INSERT INTO `propmovement` (`PropID`, `LineID`, `UserID`, `MovementDescription`) VALUES
(1, 23, 5, 'The Spaceship gets wheeled off stage left.'),
(2, 1, NULL, 'Apple tree #1 is placed directly in the center of the stage.');

INSERT INTO `sound` (`SoundID`, `Name`, `Description`) VALUES
(1, 'Laser Gun', 'The sound of a laser gun shooting.'),
(2, 'Squish noise', 'The sound of Orange being squished.'),
(3, 'Spaceship engine starting', NULL);

INSERT INTO `soundcue` (`SoundID`, `LineID`, `UserID`, `Note`) VALUES
(1, 28, 1, 'This sound plays when Romeo kills the Xylo King.'),
(2, 12, NULL, 'This plays as Orange is dying.'),
(3, 21, 1, NULL);

INSERT INTO `user` (`UserID`, `UserName`, `Password`, `FirstName`, `LastName`) VALUES
(1, 'jd42', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', 'John', 'Doe'),
(2, 'qrb2', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', NULL, NULL),
(3, 'ziz99', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', NULL, 'Zyzema'),
(4, 'bb2', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', 'Bobby', NULL),
(5, 'qik3', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', 'Quaker', 'King'),
(6, 'rab243', '$2a$10$bNQw0iLXIvsDaCxDZ6z9eOQYR1AGVJqvxXbQsX2A1/dJjbFdPQ2Qy', NULL, NULL);