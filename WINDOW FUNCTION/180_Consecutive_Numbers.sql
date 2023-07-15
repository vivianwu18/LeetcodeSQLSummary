SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num, LAG(num) OVER (ORDER BY id) AS lag1, LAG(num, 2) OVER (ORDER BY id) AS lag2
    FROM Logs
) AS tmp
WHERE num = lag1 AND lag1 = lag2