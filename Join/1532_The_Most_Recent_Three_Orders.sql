WITH tmp AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS num
    FROM Orders
)

SELECT c.name AS customer_name, c.customer_id, tmp.order_id, tmp.order_date
FROM tmp
JOIN Customers AS c ON tmp.customer_id = c.customer_id
WHERE num <= 3
ORDER BY c.name ASC, c.customer_id ASC, tmp.order_date DESC