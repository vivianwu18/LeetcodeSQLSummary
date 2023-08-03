SELECT DISTINCT l1.id, a.name
FROM Logins AS l1
JOIN Logins AS l2 ON l1.id = l2.id AND (DATEDIFF(l1.login_date, l2.login_date) BETWEEN 1 AND 4)
JOIN Accounts AS a ON l1.id = a.id 
GROUP BY l1.id, l1.login_date
HAVING COUNT(DISTINCT l2.login_date) >= 4