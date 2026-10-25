-- models/staging/stg_purchase_orders.sql
with source as (
    select * from {{ source('raw', 'purchase_orders') }}
)

select
    po_id,
    po_line_num,
    po_date,
    supplier_id,
    plant_id,
    material_id,
    order_qty,
    uom,
    unit_price,
    currency,
    line_amount,
    requested_delivery_date,
    po_status,
    buyer_name,
    payment_terms_days
from source
where po_id is not null