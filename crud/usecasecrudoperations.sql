--6.1DB - As an actor, I want to be able to open a list of scripts and choose one to be loaded into the application to be worked on.

--Select the Script of a particular play:
SELECT Text FROM Line WHERE PlayID = (@param PlayID);

--Select a List of Scripts:
SELECT FilePath FROM Play;


--8.1 DB (5) As a director I want to search for a certain act and scene in the play...
SELECT MAX(ActNum) as 'NumActs' FROM Line WHERE PlayID = (@param PlayID);
--Returns the number of acts in a play so that different act numbers can be easily displayed in a dropdown.

SELECT MAX(SceneNum) as 'NumScenes' FROM Line WHERE PlayID = (@param PlayID) AND ActNum = (@param ActNum);
--Returns the number of scenes in a specific act in a play so that scene numbers can be easily displayed in a dropdown.

--...so that I can input property directions that will be directly related to that scene.
INSERT INTO PropMovement (PropID, LineID, UserID, DestinationLocation) VALUES ((@param PropID), (@param LineID), (@param UserID (optional)), (@param DestinationLocation));



--8.5DB As a stage staff I want to know where I need to put the properties.
--Use 1.0DB script to check user permissions first
SELECT PM.DestinationLocation, L.LineNum, P.Name FROM PropMovement PM
	INNER JOIN Prop P ON P.PropID = PM.PropID
	INNER JOIN Line L ON L.LineID = (@param LineID)
	INNER JOIN User U ON U.UserID = (@param UserID);
		
--8.6DB As a stage staff I want to know when I need to put the properties.
--Use 1.0DB script to check user permissions first
SELECT PM.DestinationLocation, L.LineNum, P.Name FROM PropMovement PM
	INNER JOIN Prop P ON P.PropID = (@param PropID)
	INNER JOIN Line L ON L.LineID = PM.LineID
	INNER JOIN User U ON U.UserID = (@param UserID);
	
--8.7DB As a stage staff I want to know when I need to take the properties out of the stage.	
--Same as 8.6DB, except 'Destination Location' will be 'Offstage Left' or something of the sort.
	
--3.5DB (10) As a sound technician, I want to press a button that shows me when I am supposed to play which recorded sounds.
--Use 1.0DB script to check user permissions first
SELECT SC.LineID, S.Name, SC.Note FROM SoundCue SC 
	INNER JOIN Sound S ON S.SoundID = SC.SoundID
    INNER JOIN Line L ON L.LineID = SC.LineID
    INNER JOIN User U ON U.UserID = (@param UserID);


--3.6DB (10) As a director, I want to be able to change the settings to view what each of the other individual sees.
--Use 1.0DB script to check user permissions first
UPDATE Permissions SET (@param PermissionType) = (@param 1 or 0)
	WHERE UserID = (@param UserID);
	
--Add a column to blocking for Orientation
--blocking Origin and Destination should be coordinates.
	--Should prop location be coordinates as well?









