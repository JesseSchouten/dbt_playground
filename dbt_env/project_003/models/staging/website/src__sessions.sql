{{
    config(
        materialized = 'table'
    )
}}

SELECT 
    session_id,
    customer_id,
    timestamp,
    page,
    referral
FROM {{source('website_data', 'website_sessions')}}