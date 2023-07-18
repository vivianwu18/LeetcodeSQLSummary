SELECT TOP 1 requester_id AS id, COUNT(*) AS num
FROM (
    SELECT requester_id, accepter_id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id, requester_id
    FROM RequestAccepted) AS tmp
GROUP BY requester_id 
ORDER BY COUNT(*) DESC