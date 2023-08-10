WITH RECURSIVE tmp AS (
  SELECT 1 AS id
  UNION
  SELECT id + 1 AS id
  FROM tmp
  WHERE id < (SELECT MAX(customer_id) FROM Customers)
)

SELECT id AS ids
FROM tmp
WHERE id NOT IN(SELECT DISTINCT customer_id FROM Customers)
ORDER BY id ASC