{{
    config(
        materialized='table'
    )
}}

WITH ga_customers (
    SELECT * FROM 
    {{ ref('int__customer_attribution') }}
    WHERE has_google_ads = 1
)

SELECT 
    orders.customer_id,
    product,
    COALESCE(SUM(price * quantity), 0) AS roi
FROM {{source('website_data', 'website_orders')}} AS orders
INNER JOIN ga_customers ON orders.customer_id = ga_customers.customer_id
GROUP BY orders.customer_id, product
