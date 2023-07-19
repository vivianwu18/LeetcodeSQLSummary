SELECT b.book_id, b.name
FROM Books AS b
LEFT JOIN Orders AS o ON b.book_id = o.book_id AND o.dispatch_date BETWEEN DATEADD(year, -1, '2019-06-23') AND '2019-06-23'
WHERE b.available_from < DATEADD(day, -30, '2019-06-23') 
GROUP BY b.book_id, b.name
HAVING SUM(o.quantity) < 10 OR SUM(o.quantity) IS NULL