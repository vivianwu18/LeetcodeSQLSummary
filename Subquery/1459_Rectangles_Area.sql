WITH tmp AS (
  SELECT p1.id AS p1, p2.id AS p2, p1.x_value AS p1_x, p1.y_value AS p1_y, p2.x_value AS p2_x, p2.y_value AS p2_y
  FROM Points AS p1
  CROSS JOIN Points AS p2
  WHERE p1.id != p2.id AND p1.id < p2.id)

SELECT p1, p2, ABS(p1_x - p2_x) * ABS(p1_y - p2_y) AS area
FROM tmp
WHERE ABS(p1_x - p2_x) * ABS(p1_y - p2_y) > 0
ORDER BY ABS(p1_x - p2_x) * ABS(p1_y - p2_y) DESC, p1 ASC, p2 ASC