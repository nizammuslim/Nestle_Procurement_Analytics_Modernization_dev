-- models/staging/stg_invoices.sql
select invoice_id, invoice_line_num, po_id, po_line_num, supplier_id, invoice_date,
       invoice_due_date, invoiced_qty, unit_price, currency, line_amount, tax_amount,
       total_amount, match_status, invoice_status
from {{ source('raw', 'invoices') }}
where invoice_id is not null
