SELECT dept_name, COUNT(student_id) AS student_number
FROM Department AS d
LEFT JOIN Student AS s ON s.dept_id = d.dept_id
GROUP BY dept_name
ORDER BY COUNT(student_id) DESC, dept_name