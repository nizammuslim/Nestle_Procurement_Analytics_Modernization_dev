-- models/marts/fct_purchase_order.sql
select
    po.po_id,
    po.po_line_num,
    po.po_date,
    supplier.supplier_key,
    po.plant_id,
    po.material_id,
    po.order_qty,
    po.uom,
    po.unit_price,
    po.currency,
    po.line_amount,
    po.requested_delivery_date,
    po.po_status,
    po.buyer_name
from {{ ref('stg_purchase_orders') }} po
left join {{ ref('dim_supplier') }} supplier
    on po.supplier_id = supplier.supplier_id