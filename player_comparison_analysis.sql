SELECT * FROM players;

-- PLAYERS WHO HAVE THE SAME BIRTHDAY
SELECT CAST(CONCAT(birthYear, '-', birthMonth, '-', birthDay) AS DATE) AS birth_date,
	   GROUP_CONCAT(playerID) AS players
FROM players
GROUP BY birth_date
HAVING COUNT(playerID) >= 2;

-- PERCENT OF PLAYERS BAT RIGHT, LEFT AND BOTH FOR EACH TEAM
WITH pivotTable AS (
SELECT teamID,
       SUM(CASE WHEN bats = 'R' THEN 1 ELSE 0 END) AS right_bats,
       SUM(CASE WHEN bats = 'L' THEN 1 ELSE 0 END) AS left_bats,
       SUM(CASE WHEN bats = 'B' THEN 1 ELSE 0 END) AS both_bats
FROM players p
INNER JOIN salaries s
ON p.playerID = s.playerID
GROUP BY teamID
)
SELECT teamID,
	   right_bats / (right_bats + left_bats + both_bats) * 100 AS right_percent,
       left_bats / (right_bats + left_bats + both_bats) * 100 AS left_percent,
       both_bats / (right_bats + left_bats + both_bats) * 100 AS both_percent
FROM pivotTable
;

-- AVERAGE HEIGHT AND WEIGHT AT DEBUT GAME CHANGED OVER THE YEARS
WITH avgTable AS (
	SELECT ROUND(EXTRACT(YEAR FROM debut), -1) AS decade,
		   AVG(height) AS avg_height,
		   AVG(weight) AS avg_weight
	FROM players
	GROUP BY decade
	HAVING decade IS NOT NULL
	ORDER BY decade
)

SELECT decade,
	   avg_height,
       avg_weight,
       avg_height - LAG(avg_height) OVER(ORDER BY decade ASC) AS height_diff,
       avg_weight - LAG(avg_weight) OVER(ORDER BY decade ASC) AS weight_diff
FROM avgTable
;
