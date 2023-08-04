WITH tmp AS(
  SELECT LEFT(p1.phone_number, 3) AS number, c1.duration
  FROM Calls AS c1
  JOIN Person AS p1 ON c1.caller_id = p1.id
  UNION ALL
  SELECT LEFT(p2.phone_number, 3) AS number, c2.duration
  FROM Calls AS c2
  JOIN Person AS p2 ON c2.callee_id = p2.id)

SELECT c.name AS country
FROM tmp
JOIN Country AS c ON tmp.number = c.country_code
GROUP BY c.country_code
HAVING AVG(tmp.duration) > (
  SELECT AVG(duration)
  FROM Calls
)