CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT AVG(salary)
        FROM (
            SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
            FROM Employee
        ) AS tmp
        WHERE rank = @N
    );
END