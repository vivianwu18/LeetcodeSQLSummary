WITH summary AS (
    SELECT a.action_date, COUNT(DISTINCT r.post_id) * 100.0 / COUNT(DISTINCT a.post_id) AS daily_percent
    FROM Actions AS a
    LEFT JOIN Removals AS r ON a.post_id = r.post_id
    WHERE action = 'report' AND extra = 'spam'
    GROUP BY a.action_date)
SELECT CAST(AVG(daily_percent) AS DECIMAL(5, 2)) AS average_daily_percent
FROM summary;