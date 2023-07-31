WITH summary AS(
  SELECT activity, COUNT(*) AS count
  FROM Friends
  GROUP BY activity)

SELECT activity
FROM summary
WHERE count != (SELECT MAX(count) FROM summary) AND count != (SELECT MIN(count) FROM summary)