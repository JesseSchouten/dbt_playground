SELECT customer_id, SUM(amount) AS total_amount
FROM  {{ref("fct_orders")}}
GROUP BY customer_id
HAVING total_amount <= 0