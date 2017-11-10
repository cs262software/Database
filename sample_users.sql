-- This creates several sample users and permissions for them.
INSERT INTO `theatreappsuite`.`user` (`UserName`, `Password`) VALUES ('abc2', 'notanactualpassword');
INSERT INTO `theatreappsuite`.`user` (`UserName`, `Password`) VALUES ('adq2', 'notanactualpasswordeither');
INSERT INTO `theatreappsuite`.`user` (`UserName`, `Password`) VALUES ('abc3', 'fakepassword');
INSERT INTO `theatreappsuite`.`user` (`UserName`, `Password`, `FirstName`, `LastName`) VALUES ('qrb2', 'myfakepassword', 'Queen', 'Bacon');
INSERT INTO `theatreappsuite`.`permissions` (`UserID`, `PlayID`) VALUES ('abc2', '1');
INSERT INTO `theatreappsuite`.`permissions` (`UserID`, `PlayID`) VALUES ('abc2', '2');
INSERT INTO `theatreappsuite`.`permissions` (`UserID`, `PlayID`) VALUES ('adq2', '1');
INSERT INTO `theatreappsuite`.`permissions` (`UserID`, `PlayID`) VALUES ('abc3', '1');
INSERT INTO `theatreappsuite`.`permissions` (`UserID`, `PlayID`) VALUES ('qrb2', '3');
INSERT INTO `theatreappsuite`.`permissions` (`UserID`, `PlayID`) VALUES ('adq2', '3');
UPDATE `theatreappsuite`.`permissions` SET `Director`="1" WHERE `UserID` = "qrb2" AND `PlayID` = "3";
UPDATE `theatreappsuite`.`permissions` SET `Light`="1" WHERE `UserID` = "abc2" AND `PlayID` = "2";
