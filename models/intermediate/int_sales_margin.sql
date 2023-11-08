SELECT
    s.date_date
    , s.orders_id
    , s.products_id
    , s.revenue
    , s.quantity
    , p.purchase_price
    , ROUND (p.purchase_price *s.quantity, 2) AS purchase_cost
    , ROUND(revenue-purchase_price*quantity, 2) AS margin

FROM {{ ref('stg_raw__sales') }} s
LEFT JOIN {{ref ('stg_raw__product')}} p
    USING (products_id)