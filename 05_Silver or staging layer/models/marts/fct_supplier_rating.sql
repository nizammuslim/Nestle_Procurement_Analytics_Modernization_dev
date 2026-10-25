-- models/marts/fct_supplier_rating.sql
select r.*, s.supplier_key
from {{ ref('stg_supplier_rating') }} r
left join {{ ref('dim_supplier') }} s on r.supplier_id = s.supplier_id