WITH tmp1 AS (
    SELECT paid_by AS id, amount * -1 AS amount
    FROM Transactions AS t1
    UNION ALL
    SELECT paid_to AS id, amount AS amount
    FROM Transactions AS t2)
, tmp2 AS (
    SELECT u.user_id, CASE WHEN SUM(amount) IS NOT NULL THEN SUM(amount) ELSE 0 END AS amount
    FROM tmp1
    RIGHT JOIN Users AS u ON tmp1.id = u.user_id
    GROUP BY u.user_id
)

SELECT u.user_id, u.user_name, (tmp2.amount + u.credit) AS credit,
    CASE WHEN (tmp2.amount + u.credit) > 0 THEN 'No' ELSE 'Yes' END AS credit_limit_breached
FROM tmp2
RIGHT JOIN Users AS u ON tmp2.user_id = u.user_id