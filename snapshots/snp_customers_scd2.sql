-- dbt Snapshot for SCD Type 2 Tracking
{% snapshot snp_customers_scd2 %}

{{
    config(
      target_database='EDW_ANALYTICS',
      target_schema='EDW_SNAPSHOTS',
      unique_key='customer_id',
      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from {{ ref('stg_customers_cleaned') }}

{% endsnapshot %}