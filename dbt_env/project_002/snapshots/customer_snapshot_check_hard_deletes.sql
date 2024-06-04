{% snapshot customer_snapshot_check_hard_deletes %}
{{
  config(
    strategy='check',
    unique_key='customer_id',
    check_cols=['status'],
    target_schema='dbt_jesse_dev',
    invalidate_hard_deletes=True,
  )
}}
SELECT * FROM {{source('crm_dataset', 'crm_customers')}}
{%endsnapshot%}