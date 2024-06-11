{{ 
    config(
        materialized='view'
    )
}}

SELECT 
    customers.customer_id,
    SUM(CASE WHEN orders.amount IS NULL THEN 0 ELSE orders.amount END) AS total_amount
FROM {{ ref('stg_candy_store__orders') }} AS orders
INNER JOIN {{ ref('stg_crm__customers') }} AS customers 
    ON orders.customer_id = customers.customer_id
WHERE customers.customer_status = 'active'
GROUP BY customers.customer_id;
