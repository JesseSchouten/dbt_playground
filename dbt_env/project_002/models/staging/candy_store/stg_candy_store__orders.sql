{{ 
    config(
        materialized='incremental'
    )
}}
{% set set_default_currency = 'EUR' %}

SELECT
    order_id,
    type,
    customer_id,
    timestamp,
    DATE(timestamp) AS order_date,
    {{apply_default_rounding(amount)}} AS amount,
    CASE currency NOT NULL THEN currency 
        ELSE '{{set_default_currency}}' END 
FROM {{ source('candy_store_dataset', 'candy_store_orders') }}
{% if is_incremental() %}
  WHERE timestamp > (SELECT COALESCE(MAX(timestamp), '1900-01-01') FROM {{ this }})
{% endif %}
