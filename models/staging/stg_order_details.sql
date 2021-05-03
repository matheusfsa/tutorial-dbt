with
    source as (
        select
            /*FK*/
            product_id
            , order_id

            , discount
            , unit_price
            , quantity

            /* Stitch columns */
            , _sdc_table_version
            , _sdc_batched_at
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_extracted_at as last_etl_run

        from {{ source('northwind_etl', 'order_details') }}
    )


select * from source