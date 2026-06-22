-- SCHOOLS AND SCHOOL DETAILS TABLES
SELECT * FROM schools;
SELECT * FROM school_details;

-- NUMBER OF SCHOOLS PRODUCING MLB PLAYERS BY DECADE
SELECT ROUND(yearID, -1) AS decade,
	   COUNT(DISTINCT schoolID) AS num_schools
FROM schools
GROUP BY decade
ORDER BY decade ASC;

-- TOP 5 SCHOOLS BY NUMBER OF MLB PLAYERS PRODUCED
SELECT s.schoolID,
	   sd.name_full,
       sd.city,
       sd.state,
       sd.country,
       COUNT(DISTINCT s.playerID) AS num_players
FROM schools s
INNER JOIN school_details sd
ON s.schoolID = sd.schoolID
GROUP BY schoolID
ORDER BY num_players DESC
LIMIT 5;

-- TOP 3 SCHOOLS BY NUMBER OF MLB PLAYERS PRODUCED BY DECADE
WITH rankingTable AS (
	SELECT ROUND(yearID, -1) AS decade,
		   schoolID,
		   COUNT(DISTINCT playerID) AS num_players,
		   ROW_NUMBER() OVER(PARTITION BY ROUND(yearID, -1)
							 ORDER BY COUNT(DISTINCT playerID) DESC) AS ranking

	FROM schools
	GROUP BY schoolID, decade
)
SELECT rt.decade,
	   rt.schoolID,
	   sd.name_full,
       num_players,
       ranking
FROM rankingTable rt
INNER JOIN school_details sd
ON rt.schoolID = sd.schoolID
WHERE ranking BETWEEN 1 AND 3
ORDER BY decade ASC, ranking ASC
;





