SELECT 
    ID AS id, 
    ORDERID AS order_id, 
    PAYMENTMETHOD AS payment_method, 
    STATUS AS status, 
    AMOUNT / 100 as amount, 
    CREATED AS created,
    CURRENT_TIMESTAMP() AS processed_at
FROM
    {{ source("stripe", "stripe_payments")}}
