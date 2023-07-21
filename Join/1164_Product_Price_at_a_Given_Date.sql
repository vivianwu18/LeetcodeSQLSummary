WITH newest AS (
    SELECT product_id, num, new_price
    FROM 
    (SELECT product_id, ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS num, new_price
    FROM Products
    WHERE change_date <= '2019-08-16') AS tmp
    WHERE num = 1
)
SELECT DISTINCT Products.product_id, ISNULL(newest.new_price, 10) AS price
FROM Products
LEFT JOIN newest ON Products.product_id = newest.product_id