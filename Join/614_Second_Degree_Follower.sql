WITH tmp1 AS (
    SELECT followee, COUNT(follower) AS follower_num
    FROM Follow
    GROUP BY followee)
, tmp2 AS(
    SELECT follower, COUNT(followee) AS followee_num
    FROM Follow
    GROUP BY follower)
SELECT tmp1.followee AS follower, follower_num AS num
FROM tmp1
JOIN tmp2 ON tmp1.followee = tmp2.follower
WHERE follower_num >= 1 AND followee_num >= 1
ORDER BY tmp1.followee