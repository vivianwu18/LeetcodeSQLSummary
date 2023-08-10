SELECT from_id AS person1, to_id AS person2, COUNT(*) AS call_count, SUM(duration) AS total_duration
FROM (SELECT from_id, to_id, duration
FROM Calls
UNION ALL
SELECT to_id, from_id, duration
FROM Calls) AS tmp
WHERE from_id < to_id
GROUP BY from_id, to_id