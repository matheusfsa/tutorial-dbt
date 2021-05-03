with
    source as (
        select
            /*PK*/
            order_id

            /*FK*/
            , employee_id
            , customer_id
            , ship_via as shipper_id
            
            , ship_region            
            , shipped_date
            , ship_country
            , ship_name
            , order_date
            , ship_postal_code
            , ship_city
            , freight
            , cast(required_date as timestamp) as required_date /*Forçando conversão, nesse caso não é necessário, mas pode ser em outros casos */
            , ship_address

            /* Stitch columns */
            , _sdc_table_version
            , _sdc_batched_at
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_extracted_at as last_etl_run

        from {{ source('northwind_etl', 'orders') }}
    )


select * from source