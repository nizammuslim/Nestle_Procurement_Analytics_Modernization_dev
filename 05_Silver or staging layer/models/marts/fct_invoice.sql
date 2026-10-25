-- models/marts/fct_invoice.sql
select
    inv.invoice_id,
    inv.invoice_line_num,
    inv.po_id,
    inv.po_line_num,
    supplier.supplier_key,
    inv.invoice_date,
    inv.invoice_due_date,
    inv.invoiced_qty,
    inv.unit_price,
    inv.currency,
    inv.line_amount,
    inv.tax_amount,
    inv.total_amount,
    inv.match_status,
    inv.invoice_status,
    (inv.match_status = 'Matched') as is_clean_match
from {{ ref('stg_invoices') }} inv
left join {{ ref('dim_supplier') }} supplier
    on inv.supplier_id = supplier.supplier_id