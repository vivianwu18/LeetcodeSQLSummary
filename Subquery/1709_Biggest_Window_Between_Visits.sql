SELECT user_id, MAX(DATEDIFF(lag_visit_date, visit_date)) AS biggest_window
FROM (SELECT user_id, visit_date, 
CASE WHEN LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date) IS NOT NULL THEN LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date) ELSE '2021-1-1' END AS lag_visit_date
FROM UserVisits AS u) AS tmp
GROUP BY user_id