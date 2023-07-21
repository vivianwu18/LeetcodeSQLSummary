SELECT u.user_id AS buyer_id, join_date, 
CASE WHEN COUNT(order_id) IS NOT NULL THEN COUNT(order_id) ELSE 0 END AS orders_in_2019
FROM Users AS u
LEFT JOIN Orders AS o ON u.user_id = o.buyer_id AND YEAR(order_date) = 2019
GROUP BY u.user_id, join_date