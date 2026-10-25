-- models/staging/stg_purchase_order_approvals.sql
-- second flatten, over approval_history, kept as its own staging model
with source as (
    select raw_json from {{ source('raw', 'purchase_order_lines_nested_raw') }}
)

select
    source.raw_json:po_id::string          as po_id,
    step.value:step::number                as approval_step,
    step.value:approver_role::string       as approver_role,
    step.value:approver_name::string       as approver_name,
    step.value:action::string              as approval_action,
    step.value:action_date::date           as approval_action_date
from source,
     lateral flatten(input => source.raw_json:approval_history) as step