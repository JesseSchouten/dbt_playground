{{ 
    config(
        materialized='incremental'
    )
}}

SELECT
    order_id,
    type,
    customer_id,
    timestamp,
    DATE(timestamp) AS order_date,
    ROUND(amount,2) AS amount,
    currency
FROM {{ source('candy_store_dataset', 'candy_store_orders') }}
{% if is_incremental() %}
  WHERE timestamp > (SELECT COALESCE(MAX(timestamp), '1900-01-01') FROM {{ this }})
{% endif %}
