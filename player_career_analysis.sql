-- PLAYERS TABLE
SELECT * FROM players;
SELECT * FROM salaries;

-- CALCULATE PLAYER AGE AT THEIR FIRST AND LAST GAME,  CAREER LENGTH OF EACH PLAYER
CREATE VIEW careerLengthTable AS
	SELECT playerID,
		   nameGiven,
		   CAST(CONCAT(birthYear, '-', birthMonth, '-', birthDay) AS DATE) AS birthDate,
           TIMESTAMPDIFF(YEAR, CAST(CONCAT(birthYear, '-', birthMonth, '-', birthDay) AS DATE), debut) AS debut_age,
           TIMESTAMPDIFF(YEAR, CAST(CONCAT(birthYear, '-', birthMonth, '-', birthDay) AS DATE), finalGame) AS finalGame_age,
           TIMESTAMPDIFF(YEAR, debut, finalGame) AS career_length
	FROM players
	ORDER BY career_length DESC
;
SELECT * FROM careerLengthTable;

-- PLAYER STARTING YEAR TEAM AND ENDING YEAR TEAM
CREATE VIEW teamTable AS
	WITH totalTable AS (
		SELECT yearID, p.playerID, s.teamID, debut, finalGame
		FROM players p
		INNER JOIN salaries s
		ON p.playerID = s.playerID
	),
	debutTeamTable AS (
		SELECT playerID,
			   teamID AS debut_team
		FROM totalTable
		WHERE EXTRACT(YEAR FROM debut) = yearID
	),
	endingTeamTable AS (
		SELECT playerID,
			   teamID AS ending_team
		FROM totalTable
		WHERE EXTRACT(YEAR FROM finalGame) = yearID
	)

	SELECT dtt.playerID, debut_team, ending_team
	FROM debutTeamTable dtt
	INNER JOIN endingTeamTable ett
	ON dtt.playerID = ett.playerID
	;

SELECT * FROM teamTable;

-- NUMBER OF PLAYERS STARTED AND ENDED ON THE SAME TEAM AND PLAYED FOR OVER A DECADE
SELECT SUM(player_num) AS numberOfPlayer FROM (
		SELECT COUNT(*) AS player_num
		FROM careerLengthTable clt
		INNER JOIN teamTable tt
		ON clt.playerID = tt.playerID
		WHERE clt.career_length > 10
		AND debut_team = ending_team
		GROUP BY debut_team, ending_team
) AS temp
;


