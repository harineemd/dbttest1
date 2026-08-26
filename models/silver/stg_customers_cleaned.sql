-- Silver Layer Cleansed Model
with bronze_customers as (
    select * from {{ ref('stg_raw_customers') }}
),
transformed as (
    select
        {{ dbt_utils.generate_surrogate_key(['customer_id', 'email']) }} as customer_sk,
        customer_id,
        concat(first_name, ' ', last_name) as full_name,
        email,
        updated_at
    from bronze_customers
    where customer_id is not null
)
select * from transformed;