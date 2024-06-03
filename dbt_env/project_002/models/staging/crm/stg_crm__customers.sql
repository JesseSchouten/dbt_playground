{{
  config(
    materialized= "view"
  )
}}

SELECT 
  customer_id,
  first_name,
  last_name,
  last_purchase_timestamp
FROM {{ source('crm_dataset', 'crm_customers') }}