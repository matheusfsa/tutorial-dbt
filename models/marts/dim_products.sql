with
    selected as (
        select
            /* PK*/
            product_id

            /*FK*/
            , category_id
            , supplier_id
            
            , units_in_stock
            , unit_price
            , product_name
            , quantity_per_unit
            , units_on_order
            , reorder_level
            , is_discontinued

        from {{ ref('stg_products') }}
    )
    , transformed as (
        select
            row_number() over (order by product_id) 
            as product_sk
            , *
        from selected
    )


select * from transformed