WITH CTE AS (
    SELECT employee_id, CAST(0 AS int) AS distance
    FROM Employees
    WHERE employee_id != 1 AND manager_id = 1
    UNION ALL 
    SELECT e.employee_id, CAST(CTE.distance + 1 AS int) AS distance
    FROM Employees AS e
    JOIN CTE ON e.manager_id = CTE.employee_id
    -- WHERE distance <= 3
)
SELECT DISTINCT employee_id
FROM CTE
ORDER BY employee_id