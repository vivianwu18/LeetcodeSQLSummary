WITH avg_rating AS(
  SELECT movie_id, AVG(rating) AS rating
  FROM MovieRating
  WHERE created_at BETWEEN '2020-02-01' AND '2020-02-28'
  GROUP BY movie_id),
user_count AS(
  SELECT user_id, COUNT(*) AS count
  FROM MovieRating
  GROUP BY user_id
  )

SELECT results 
FROM (
  SELECT name AS results
  FROM user_count
  JOIN Users ON user_count.user_id = Users.user_id
  WHERE count = (SELECT MAX(count) FROM user_count)
  ORDER BY name
  LIMIT 1) AS result1
UNION ALL
SELECT results
FROM(
  SELECT title AS results
  FROM avg_rating
  JOIN Movies ON avg_rating.movie_id = Movies.movie_id
  WHERE rating = (SELECT MAX(rating) FROM avg_rating)
  ORDER BY title
  LIMIT 1) AS result2