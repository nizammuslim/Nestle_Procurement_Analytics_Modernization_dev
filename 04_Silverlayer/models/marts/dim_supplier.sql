-- models/marts/dim_supplier.sql
with supplier as (
    select * from {{ ref('stg_supplier_master') }}
),
onboarding as (
    select * from {{ ref('stg_supplier_onboarding') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['supplier.supplier_id']) }} as supplier_key,
    supplier.supplier_id,
    supplier.supplier_name,
    supplier.supplier_category,
    supplier.country,
    supplier.region,
    supplier.city,
    supplier.preferred_currency,
    supplier.payment_terms_days,
    supplier.supplier_status,
    supplier.risk_tier,
    supplier.onboarded_date,
    onboarding.onboarding_stage,
    onboarding.sustainability_score,
    onboarding.bank_verification_status
from supplier
left join onboarding on supplier.supplier_id = onboarding.supplier_id