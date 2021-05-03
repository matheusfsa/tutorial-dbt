with
    selected as (
        select
            /*PK*/
            employee_id
            
            , country
            , city
            , postal_code
            , hire_date
            , extension
            , address
            , birth_date
            , region
            , photo_path
            , last_name
            , first_name
            , title
            , title_of_courtesy
            , notes
            , home_phone
            , reports_to

        from {{ ref('stg_employees') }}
    )
    , transformed as (
        select
            row_number() over (order by employee_id) as employee_sk
            , *
        from selected
    )


select * from transformed