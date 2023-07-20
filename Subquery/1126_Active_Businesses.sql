WITH average AS (
    SELECT event_type, AVG(occurences) AS avg_occur
    FROM Events
    GROUP BY event_type)
SELECT business_id
FROM Events
JOIN average ON Events.event_type = average.event_type AND Events.occurences > average.avg_occur
GROUP BY business_id
HAVING COUNT(Events.event_type) > 1