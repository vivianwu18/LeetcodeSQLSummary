WITH tmp AS (
    SELECT stock_name,
        CASE WHEN operation = 'Buy' THEN price * (-1)
        ELSE price * (1) END AS price
    FROM Stocks)

SELECT stock_name, SUM(price) AS capital_gain_loss
FROM tmp
GROUP BY stock_name
ORDER BY capital_gain_loss DESC