WITH users AS (
    SELECT user_id, MIN(activity_date) AS date
    FROM Traffic
    WHERE activity = 'login'
    GROUP BY user_id)
SELECT date AS login_date, COUNT(user_id) AS user_count
FROM users
WHERE date BETWEEN DATEADD(day, -90, '2019-06-30') AND '2019-06-30'
GROUP BY date;