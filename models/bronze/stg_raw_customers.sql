-- Bronze Layer Staging Model
with source as (
    select * from {{ source('raw_landing', 'raw_customers') }}
),
renamed as (
    select
        trim(cust_id) as customer_id,
        upper(trim(first_name)) as first_name,
        upper(trim(last_name)) as last_name,
        lower(email_addr) as email,
        sys_updated_ts as updated_at
    from source
)
select * from renamed;