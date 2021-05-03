with
    source as (
        select
            /*PK*/
            shipper_id   

            , phone
            , company_name   
            /* Stitch columns */
            , _sdc_table_version
            , _sdc_batched_at
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_extracted_at as last_etl_run

        from {{ source('northwind_etl', 'shippers') }}
    )


select * from source