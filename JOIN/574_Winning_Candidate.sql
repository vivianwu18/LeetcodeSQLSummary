SELECT TOP 1 name
FROM Vote AS v
JOIN Candidate AS c ON v.candidateId = c.id
GROUP BY name
ORDER BY COUNT(v.id) DESC