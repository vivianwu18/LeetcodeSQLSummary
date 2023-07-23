WITH tmp1 AS (
    SELECT turn, person_id, person_name, SUM(weight) OVER (ORDER BY turn) AS Total_Weight
    FROM Queue)
SELECT person_name
FROM tmp1
WHERE Total_Weight <= 1000 AND turn = (
    SELECT MAX(turn) 
    FROM tmp1
    WHERE Total_Weight <= 1000)