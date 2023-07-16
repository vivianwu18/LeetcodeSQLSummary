WITH tmp AS (
    SELECT departmentID, MAX(salary) OVER (PARTITION BY departmentID) AS max_salary
    FROM Employee)
SELECT DISTINCT d.name AS Department, e.name AS Employee, salary
FROM Employee AS e
JOIN Department AS d ON e.departmentID = d.id
JOIN tmp ON e.salary = tmp.max_salary AND d.id = tmp.departmentId