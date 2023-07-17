WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)
SELECT CAST(COUNT(DISTINCT Activity.player_id) * 1.0 / COUNT(DISTINCT first_login.player_id) AS DECIMAL(3, 2)) AS fraction
FROM first_login 
LEFT JOIN Activity ON first_login.player_id = Activity.player_id 
AND first_login.first_date = DATEADD(day, -1, Activity.event_Date)