-- models/marts/fct_payment.sql
select p.*, s.supplier_key
from {{ ref('stg_payments') }} p
left join {{ ref('dim_supplier') }} s on p.supplier_id = s.supplier_id