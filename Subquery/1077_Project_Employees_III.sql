SELECT DISTINCT p1.project_id, p1.employee_id
FROM Project AS p1
JOIN Employee AS e1 ON p1.employee_id = e1.employee_id
JOIN
(SELECT p.project_id, p.employee_id, MAX(e.experience_years) OVER (PARTITION BY p.project_id) AS max_year
FROM Project AS p
JOIN Employee AS e ON p.employee_id = e.employee_id) AS tmp1
ON p1.project_id = tmp1.project_id AND e1.experience_years = tmp1.max_year