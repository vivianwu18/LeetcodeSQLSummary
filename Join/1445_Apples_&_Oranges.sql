SELECT s1.sale_date, (s1.sold_num - s2.sold_num) AS diff
FROM Sales AS s1
JOIN Sales AS s2 ON s1.fruit != s2.fruit AND s1.sale_date = s2.sale_date
WHERE s1.fruit = 'apples'