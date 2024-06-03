SELECT order_id
FROM {{ ref('stg_candy_store__orders') }}
GROUP BY order_id
HAVING COUNT(*) > 1