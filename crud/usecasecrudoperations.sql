--6.1DB - As an actor, I want to be able to open a list of scripts and choose one to be loaded into the application to be worked on.

--Select the Script of a particular play:
SELECT Text FROM Line WHERE PlayID = (@param PlayID);

--Select a List of Scripts:
SELECT FilePath FROM Play;


--8.5DB As a stage staff I want to know where I need to put the properties.
--8.6DB As a stage staff I want to know when I need to put the properties.
--8.7DB As a stage staff I want to know when I need to take the properties out of the stage.

SELECT PM.DestinationLocation, L.LineNum, P.Name FROM PropMovement PM
	INNER JOIN Prop P ON P.PropID = PM.PropID
	INNER JOIN Line L ON PM.LineID = L.LineID
	INNER JOIN User ON PM.UserID = (@param UserID);
		

	