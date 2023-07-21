WITH tmp1 AS (
    SELECT LEFT(trans_date, 7) AS month, country, state, amount
    FROM Transactions
), tmp2 AS (
    SELECT LEFT(trans_date, 7) AS month, country, state, amount
    FROM Transactions
    WHERE state = 'approved'    
), total AS (
    SELECT DISTINCT month, country, COUNT(state) OVER (PARTITION BY country, month) AS trans_count, SUM(amount) OVER (PARTITION BY country, month) AS trans_total_amount
    FROM tmp1
), approval AS (
    SELECT DISTINCT month, country, COUNT(state) OVER (PARTITION BY country, month) AS approved_count, SUM(amount) OVER (PARTITION BY country, month) AS approved_total_amount
    FROM tmp2)
SELECT total.month, total.country, trans_count, ISNULL(approved_count, 0) AS approved_count, trans_total_amount, ISNULL(approved_total_amount, 0) AS approved_total_amount
FROM total
LEFT JOIN approval ON total.month = approval.month AND total.country = approval.country