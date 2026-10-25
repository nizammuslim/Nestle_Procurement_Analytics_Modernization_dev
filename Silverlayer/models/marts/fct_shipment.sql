-- models/marts/fct_shipment.sql
select
    s.shipment_id,
    s.po_id,
    supplier.supplier_key,
    s.plant_id,
    s.carrier_name,
    s.mode_of_transport,
    s.origin_country,
    s.ship_date,
    s.estimated_arrival_date,
    s.actual_arrival_date,
    s.shipment_status,
    s.otif_flag,
    s.temperature_controlled,
    datediff('day', s.estimated_arrival_date, s.actual_arrival_date) as arrival_variance_days
from {{ ref('stg_shipment_tracking') }} s
left join {{ ref('dim_supplier') }} supplier
    on s.supplier_id = supplier.supplier_id