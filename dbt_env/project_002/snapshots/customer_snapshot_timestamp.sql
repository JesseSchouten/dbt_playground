{% snapshot customer_snapshot_timestamp %}

{{
  config(
    strategy = 'timestamp',
    target_schema = 'dbt_jesse_dev',
    updated_at = 'last_purchase_timestamp',
    unique_key = 'customer_id'
  )
}}

SELECT * FROM {{source('crm_dataset', 'crm_customers')}}

{% endsnapshot%}