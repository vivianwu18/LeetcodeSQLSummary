WITH tmp AS (
  SELECT DISTINCT p.product_name, p.product_id, MAX(o.order_date) OVER (PARTITION BY p.product_id) AS latest_date
  FROM Orders AS o
  JOIN Products AS p ON o.product_id = p.product_id)

SELECT p.product_name, p.product_id, o.order_id, o.order_date
FROM Orders AS o
JOIN Products AS p ON o.product_id = p.product_id
JOIN tmp ON o.order_date = tmp.latest_date AND o.product_id = tmp.product_id
ORDER BY product_name ASC, p.product_id ASC, order_id ASC