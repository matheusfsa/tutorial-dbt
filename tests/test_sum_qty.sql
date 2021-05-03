with 
    validation as (
        select sum(quantity) as sum_val
        from {{ ref ('fact_order_details') }}
        where order_date between '1998-03-01' and '1998-03-31'
    )

select * from validation where sum_val != 4065