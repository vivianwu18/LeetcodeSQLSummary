SELECT MIN(ROUND(SQRT(POWER(ABS(p1.x - p2.x), 2) + POWER(ABS(p1.y - p2.y), 2)), 2)) AS shortest
FROM Point2D AS p1
JOIN Point2D AS p2 ON p1.x != p2.x OR p1.y != p2.y