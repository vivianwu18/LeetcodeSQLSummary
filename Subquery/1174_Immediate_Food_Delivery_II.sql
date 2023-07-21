WITH firstdate AS (
    SELECT delivery_id, customer_id, MIN(order_date) OVER (PARTITION BY customer_id) AS first_date
    FROM Delivery
),  immediate AS (
    SELECT firstdate.delivery_id, firstdate.customer_id
    FROM firstdate
    JOIN Delivery ON firstdate.delivery_id = Delivery.delivery_id AND firstdate.customer_id = Delivery.customer_id AND firstdate.first_date = Delivery.customer_pref_delivery_date)
SELECT CAST((COUNT(immediate.delivery_id) * 100.0 / COUNT(DISTINCT firstdate.customer_id)) AS DECIMAL(5, 2)) AS immediate_percentage
FROM firstdate
LEFT JOIN immediate ON firstdate.delivery_id = immediate.delivery_id;