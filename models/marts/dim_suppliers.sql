with
    suppliers as (
        select *
        from {{ ref('stg_suppliers') }}
    )
    , divisions as (
        select *
        from {{ ref('seed_supplier_divisions') }}
    )
    , transformed as (
        select
            row_number() over (order by supplier_id) 
            as supplier_sk
            ,supplier_id
            , suppliers.country
            , city
            , fax
            , postal_code
            , homepage
            , address
            , region
            , divisions.division
            , contact_name
            , phone
            , company_name
            , contact_title
        from suppliers
        left join divisions on suppliers.country = divisions.country
    )


select * from transformed