WITH tmp1 AS (
  SELECT customer_id, product_id, COUNT(order_id) OVER (PARTITION BY customer_id, product_id) AS count
  FROM Orders 
), tmp2 AS (
  SELECT DISTINCT customer_id, product_id, MAX(count) OVER (PARTITION BY customer_id) AS count
  FROM tmp1
)

SELECT DISTINCT tmp1.customer_id, tmp1.product_id, p.product_name
FROM tmp1
JOIN Products AS p ON tmp1.product_id = p.product_id
JOIN tmp2 ON tmp1.customer_id = tmp2.customer_id AND tmp1.product_id = tmp2.product_id AND tmp1.count = tmp2.count
ORDER BY customer_id