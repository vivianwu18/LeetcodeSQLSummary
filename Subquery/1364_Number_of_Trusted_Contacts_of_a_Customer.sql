WITH tmp1 AS (
  SELECT c1.customer_id, c1.customer_name AS customer_name, c2.contact_name, c3.customer_name AS customer_name2
  FROM Customers AS c1
  LEFT JOIN Contacts AS c2 ON c1.customer_id = c2.user_id
  LEFT JOIN Customers AS c3 ON c2.contact_name = c3.customer_name),
tmp2 AS (
  SELECT DISTINCT customer_id, customer_name, 
  COUNT(contact_name) OVER (PARTITION BY customer_name) AS contacts_cnt,
  COUNT(customer_name2) OVER (PARTITION BY customer_name) AS trusted_contacts_cnt
  FROM tmp1
)

SELECT invoice_id, customer_name, price, contacts_cnt, trusted_contacts_cnt
FROM Invoices
JOIN tmp2 ON Invoices.user_id = tmp2.customer_id
ORDER BY invoice_id ASC