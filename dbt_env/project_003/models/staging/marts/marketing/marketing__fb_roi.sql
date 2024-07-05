{{
    config(
        materialized='table'
    )
}}

WITH facebook_customers (
    SELECT * FROM 
    {{ ref('int__customer_attribution') }}
    WHERE has_facebook = 1
)

SELECT 
    orders.customer_id,
    product,
    COALESCE(SUM(price * quantity), 0) AS roi
FROM {{source('website_data', 'website_orders')}} AS orders
INNER JOIN facebook_customers ON orders.customer_id = facebook_customers.customer_id
GROUP BY orders.customer_id, product
