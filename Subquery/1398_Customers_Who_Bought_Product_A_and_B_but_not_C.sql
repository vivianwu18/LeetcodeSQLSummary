WITH tmp1 AS (
  SELECT DISTINCT customer_id
  FROM Orders
  WHERE product_name = 'A'),
tmp2 AS (
  SELECT DISTINCT customer_id
  FROM Orders
  WHERE product_name = 'B'),
tmp3 AS (
  SELECT DISTINCT customer_id
  FROM Orders
  WHERE product_name = 'C'  
)

SELECT DISTINCT tmp1.customer_id, customer_name
FROM tmp1
JOIN tmp2 ON tmp1.customer_id = tmp2.customer_id
JOIN Customers ON tmp1.customer_id = Customers.customer_id
WHERE tmp1.customer_id NOT IN (
  SELECT *
  FROM tmp3
)