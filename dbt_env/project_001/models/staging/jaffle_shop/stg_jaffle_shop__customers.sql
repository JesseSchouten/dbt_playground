SELECT
    id AS customer_id,
    first_name,
    last_name

FROM {{ source('jaffle_shop_dataset', 'jaffle_shop_customers') }}
