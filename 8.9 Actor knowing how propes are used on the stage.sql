/*
8.9 DB (1) As an Actor I want to know how the properties are going to be used on the stage.

Write scripts to CRUD filepath in the database.
anything inside [] should be replaced with variables


Table 'Play' DDL:
		CREATE TABLE IF NOT EXISTS `TheatreAppSuite`.`Play` (
		  `PlayID` INT NOT NULL AUTO_INCREMENT,
		  `Name` VARCHAR(100) NULL,
		  `FilePath` VARCHAR(100) NULL,
		  PRIMARY KEY (`PlayID`))
		ENGINE = InnoDB;
*/

--READ script
---Read everything
SELECT
PM.DESTINATIONLOCATION, L.LINENUM, P.NAME FROM PROPMOVEMENT PM
	INNER JOIN PROP P ON P.PROPID = [INSERT PROP ID]
	INNER JOIN LINE L ON L.LINEID = PM.LINEID
	INNER JOIN USER U ON U.USERID = [INSERT USER ID]
	;
