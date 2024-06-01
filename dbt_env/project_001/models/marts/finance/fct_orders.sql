WITH orders AS (
    SELECT
        order_id,
        customer_id,
        order_date
    FROM {{ ref('stg_jaffle_shop__orders') }}
),

payments AS (
    SELECT
        order_id,
        sum(CASE WHEN status = 'success' THEN amount END) AS amount
    FROM {{ ref('stg_stripe__payments') }}
    GROUP BY 1
)

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    coalesce(p.amount, 0) AS amount
FROM orders AS o
LEFT JOIN payments AS p
    ON o.order_id = p.order_id;
