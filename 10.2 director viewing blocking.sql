/*

10.2. DB (5)  As a director I need to be able to see blocking instructions for a specific scene
select scenes
select blocking instructions
permission level: director
only read script

*/

-- if statement https://stackoverflow.com/questions/5951157/if-in-select-statement-choose-output-value-based-on-column-values

-- This use case only reads. I'm ignoring:
	--Create, update, delete
	--read=select

/*pre-condition: check permissions to see if it's the director.*/
--READ script
Select
 `CharacterID`,
  `LineID`,
  `Origin`,
  `Destination`,
  `MovementType`,
  `CharacterID_idx` (`CharacterID` ASC),
  `LineID_idx` (`LineID` ASC),
  BlockingCharacterID,
  `BlockingLineID`
  from TheatreAppSuite.Blocking b
  LEFT JOIN THEATREAPPSUITE.LINE l ON
  b.LineID = l.Line ID
  WHERE l.SceneNum = [Scene Number that the director chooses]
	order by l.LineID
  ;