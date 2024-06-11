{{ 
    config(
        materialized='incremental'
    )
}}
{% set set_default_currency = 'EUR' %}

SELECT
    order_id,
    type AS type,
    customer_id,
    timestamp,
    DATE(timestamp) AS order_date,
    {{apply_default_rounding('amount')}} AS amount,
    CASE WHEN currency != NULL THEN currency 
        ELSE '{{set_default_currency}}' END AS currency
FROM {{ source('candy_store_dataset', 'candy_store_orders') }}
{% if is_incremental() %}
  WHERE timestamp > (SELECT COALESCE(MAX(timestamp), '1900-01-01') FROM {{ this }})
  {% set is_first_where_statement = false %}
  {% else %}
  {% set is_first_where_statement = true %}
{% endif %}
{{ select_dev_data_range('timestamp', nr_days=1000, is_first_where_statement=is_first_where_statement) }}
