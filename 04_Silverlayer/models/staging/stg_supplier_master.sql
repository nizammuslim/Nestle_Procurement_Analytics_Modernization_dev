-- models/staging/stg_supplier_master.sql


select supplier_id, supplier_name, supplier_category, country, region, city,
       preferred_currency, payment_terms_days, tax_id, supplier_status, risk_tier,
       onboarded_date, primary_contact_email
from {{ source('raw', 'supplier_master') }}
where supplier_id is not null