WITH orders AS (
    SELECT 
        order_id,
        customer_id,
        order_date
    FROM {{ ref('stg_jaffle_shop__orders') }}
)
, payments AS (
    select
        order_id,
        sum (case when status = 'success' then amount end) as amount
    from {{ ref('stg_stripe__payments') }}
    group by 1
)

SELECT
    o.order_id
    , o.customer_id
    , o.order_date  
    , coalesce(p.amount, 0) as amount
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id;