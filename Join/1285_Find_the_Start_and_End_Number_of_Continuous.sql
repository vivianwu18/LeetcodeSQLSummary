WITH tmp AS (
    SELECT l1.log_id, COUNT(*) AS num
    FROM Logs AS l1
    JOIN Logs AS l2 ON l1.log_id >= l2.log_id
    GROUP BY l1.log_id)
SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id
FROM tmp
GROUP BY log_id - num
ORDER BY MIN(log_id)