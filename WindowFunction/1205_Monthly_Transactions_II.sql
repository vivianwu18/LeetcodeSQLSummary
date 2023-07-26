WITH approved AS (
    SELECT LEFT(trans_date, 7) AS month, country, COUNT(amount) AS approved_count, SUM(amount) AS approved_amount
    FROM Transactions
    WHERE state = 'approved'
    GROUP BY LEFT(trans_date, 7), country
), chargeback AS (
    SELECT LEFT(c.trans_date, 7) AS month, country, COUNT(amount) AS chargeback_count, SUM(amount) AS chargeback_amount
    FROM Chargebacks AS c
    JOIN Transactions AS t ON c.trans_id = t.id
    GROUP BY LEFT(c.trans_date, 7), country
)
SELECT COALESCE(approved.month, chargeback.month) AS month, COALESCE(approved.country, chargeback.country) AS country,
ISNULL(approved_count, 0) AS approved_count, ISNULL(approved_amount, 0) AS approved_amount, 
ISNULL(chargeback_count, 0) AS chargeback_count, ISNULL(chargeback_amount, 0) AS chargeback_amount
FROM approved
FULL OUTER JOIN chargeback ON approved.month = chargeback.month AND approved.country = chargeback.country;
