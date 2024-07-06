{{
    config(
        materialized = 'ephemeral'
    )
}}


WITH filtered_sessions AS (
    SELECT 
        session_id,
        customer_id,
        timestamp,
        page,
        referral
    FROM 
        {{ source('website_data', 'website_sessions') }}
    WHERE 
        customer_id IS NOT NULL
),

referral_check AS (
    SELECT 
        customer_id,
        MAX(CASE WHEN referral = 'facebook' THEN 1 ELSE 0 END) AS has_facebook,
        MAX(CASE WHEN referral = 'google ads' THEN 1 ELSE 0 END) AS has_google_ads,
        MAX(CASE WHEN referral = 'none' THEN 1 ELSE 0 END) AS has_none
    FROM 
        filtered_sessions
    GROUP BY 
        customer_id
)

SELECT 
    customer_id,
    has_facebook,
    has_google_ads,
    has_none
FROM 
    referral_check

