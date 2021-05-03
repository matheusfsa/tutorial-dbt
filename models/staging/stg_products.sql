with
    source as (
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
            , 
              case
                when discontinued = 1 then True
                else False
              end as is_discontinued
            
            /* Stitch columns */
            , _sdc_table_version
            , _sdc_batched_at
            , _sdc_received_at
            , _sdc_sequence 
            , _sdc_extracted_at as last_etl_run

        from {{ source('northwind_etl', 'products') }}
    )


select * from source