-- models/staging/stg_payments.sql
select payment_id, invoice_id, supplier_id, payment_date, payment_amount, currency,
       payment_method, payment_status, days_to_pay,
       (early_payment_discount_applied = 'Y') as early_payment_discount_applied
from {{ source('raw', 'payments') }}
where payment_id is not null