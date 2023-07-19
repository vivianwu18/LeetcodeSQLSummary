WITH minyear AS (
    SELECT product_id, MIN(year) AS min_year
    FROM Sales 
    GROUP BY product_id)
    
SELECT DISTINCT Sales.product_id, minyear.min_year AS first_year, Sales.quantity, Sales.price
FROM Sales
JOIN minyear ON Sales.product_id = minyear.product_id AND Sales.year = minyear.min_year