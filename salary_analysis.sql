SELECT * FROM salaries;

-- CREATE TEMP TABLE FOR REPEATED USE
CREATE TEMPORARY TABLE totalSpendingTable AS
	SELECT yearID,
		   teamID, 
		   LgID, 
		   SUM(salary) AS total_spending
	FROM salaries
	GROUP BY teamID, LgID, yearID;

-- TOP 20% OF TEAMS BY AVERAGE ANNUAL SPENDING

SELECT teamID, LgID, average_annual_spending
 FROM (
				SELECT teamID,
					   LgID,
					   AVG(total_spending) AS average_annual_spending,
					   NTILE(5) OVER(ORDER BY AVG(total_spending) DESC) AS spending_percentile
				FROM totalSpendingTable
				GROUP BY teamID, LgID
) AS average_spending_table
WHERE spending_percentile = 1
;

-- YEAR-BY-YEAR CUMULATIVE SPENDING FOR EACH TEAM
SELECT yearID,
	   teamID,
       LgID,
       total_spending,
       SUM(total_spending) OVER(PARTITION BY teamID ORDER BY yearID) AS cumulative_sum
FROM totalSpendingTable;
       
-- FIRST YEAR THAT EACH TEAM'S CUMULATIVE SPENDING SURPASSED 1 BILLION
WITH cumulativeSumTable AS (
SELECT yearID,
	   teamID,
       LgID,
       total_spending,
       SUM(total_spending) OVER(PARTITION BY teamID ORDER BY yearID) AS cumulative_sum
FROM totalSpendingTable
)

SELECT yearID, teamID, LgID, cumulative_sum FROM (
		SELECT yearID,
			   teamID,
			   LgID,
			   cumulative_sum,
			   ROW_NUMBER() OVER(PARTITION BY teamID ORDER BY yearID ASC) AS row_num
		FROM cumulativeSumTable
		WHERE cumulative_sum > 1000000000
) AS rowNumTable
WHERE row_num = 1
;

