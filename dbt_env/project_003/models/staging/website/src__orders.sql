{{
    config(
        materialized = 'table'
    )
}}

SELECT 
    order_id,
    customer_id,
    timestamp,
    quantity,
    product,
    currency,
    price
FROM {{source('website_data', 'website_orders')}}