SELECT DISTINCT l.page_id AS recommended_page
FROM Friendship AS f
JOIN Likes AS l ON f.user2_id = l.user_id
WHERE f.user1_id = 1 AND page_id NOT IN (
    SELECT page_id
    FROM Likes
    WHERE user_id = 1
)
UNION ALL
SELECT DISTINCT l.page_id AS recommended_page
FROM Friendship AS f
JOIN Likes AS l ON f.user1_id = l.user_id
WHERE f.user2_id = 1 AND page_id NOT IN (
    SELECT page_id
    FROM Likes
    WHERE user_id = 1
)