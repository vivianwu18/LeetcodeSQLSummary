WITH tmp1 AS(
    SELECT company_id,
    CASE WHEN MAX(salary) < 1000 THEN 0
    WHEN MAX(salary) < 10000 THEN 0.24
    ELSE 0.49 END AS tax_rate
    FROM Salaries
    GROUP BY company_id)

SELECT s.company_id, s.employee_id, s.employee_name, ROUND(s.salary * (1 - tmp1.tax_rate), 0) AS salary
FROM Salaries AS s
JOIN tmp1 ON s.company_id = tmp1.company_id