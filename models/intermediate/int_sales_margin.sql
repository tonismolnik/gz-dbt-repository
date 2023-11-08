WITH sales_data AS (

select
    orders_id
    , products_id
    , revenue
    , quantity
FROM {{ ref('stg_raw__sales') }}
),

product_data AS (

select
    products_id
    , purchse_price AS purchase_price
FROM {{ ref('stg_raw__product') }}
)

SELECT
    s.orders_id
    , s.products_id
    , s.revenue
    , s.quantity
    , p.purchase_price

FROM sales_data s
JOIN product_data p ON s.products_id=p.products_id