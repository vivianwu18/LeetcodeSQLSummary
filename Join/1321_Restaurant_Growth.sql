WITH total AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on)
SELECT t1.visited_on, SUM(t2.amount) AS amount, CAST(AVG(t2.amount * 1.0) AS decimal(5, 2)) AS average_amount
FROM total AS t1
JOIN total AS t2 ON t1.visited_on >= t2.visited_on AND t1.visited_on <= DATEADD(day, 6, t2.visited_on)
GROUP BY t1.visited_on
HAVING COUNT(t2.visited_on) = 7