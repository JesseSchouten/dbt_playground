{{
  config(
    materialized= "view"
  )
}}

SELECT 
  customer_id,
  first_name,
  last_name,
  status AS customer_status,
  last_purchase_timestamp AS last_purchase_timestamp
FROM {{ source('crm_dataset', 'crm_customers') }}
