-- Gold Layer Business Dimensional Model
with scd2_snapshot as (
    select * from {{ ref('snp_customers_scd2') }}
)
select
    customer_sk,
    customer_id,dfr
    full_name,
    email,
    dbt_valid_from as valid_from,
    dbt_valid_to as valid_to,
    case when dbt_valid_to is null then true else false end as is_current
from scd2_snapshot;