{% snapshot customer_snapshot_check %}

  {{
    config(
      target_schema = "dbt_jesse_dev",
      unique_key = "customer_id",
      strategy = "check",
      check_cols = ['status'] 
    )
  }}

  SELECT * FROM {{source('crm_dataset', 'crm_customers')}}
{% endsnapshot %}