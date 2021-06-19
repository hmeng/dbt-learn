with payments as (

    select * from {{ ref('stg_payments')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

fct_orders as (
    select 
        orders.customer_id,
        orders.order_id,
        payments.amount
    from 
        payments, 
        orders
    where payments.order_id = orders.order_id
    and payments.status = 'success'
)

select * from fct_orders