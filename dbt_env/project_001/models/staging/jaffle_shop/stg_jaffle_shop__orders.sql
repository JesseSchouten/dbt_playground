SELECT
    id as order_id,
    user_id as customer_id,
    order_date,
    status

FROM {{ source('jaffle_shop_dataset', 'jaffle_shop_orders') }}