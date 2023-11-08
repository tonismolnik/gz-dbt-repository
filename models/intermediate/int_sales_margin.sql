WITH sales_data AS (

    select
        orders_id
        , products_id
        , revenue
        , quantity
    FROM {{ref('int_sales_margin')}}
),

product_data AS (
    SELECT
        products_id
        , purchse_price
    FROM {{ref('stg_raw__product')}}
)

SELECT
    s.orders_id
    , s.products_id
    , s.revenue
    , s.quantity
    , CAST(p.purchse_price AS FLOAT64) AS purchase_price
    , ROUND (CAST(purchse_price AS FLOAT64)*quantity, 2) AS purchase_cost
    , ROUND(revenue-ROUND(CAST(purchse_price AS FLOAT64)*quantity, 2), 2) AS margin

FROM {{ ref('stg_raw__sales') }} s
LEFT JOIN {{ref ('stg_raw__product')}} p
    USING (products_id)