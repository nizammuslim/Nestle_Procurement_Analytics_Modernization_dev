-- models/staging/stg_purchase_order_lines_nested.sql


with source as (
    select raw_json from {{ source('raw', 'purchase_order_lines_nested_raw') }}
),

line_items_flat as (
    select
        source.raw_json:po_id::string            as po_id,
        source.raw_json:po_date::date             as po_date,
        source.raw_json:supplier_id::string       as supplier_id,
        source.raw_json:plant_id::string          as plant_id,
        source.raw_json:currency::string          as currency,
        line_item.value:po_line_num::number       as po_line_num,
        line_item.value:material_id::string       as material_id,
        line_item.value:material_name::string     as material_name,
        line_item.value:order_qty::number          as order_qty,
        line_item.value:uom::string                as uom,
        line_item.value:unit_price::float          as unit_price,
        line_item.value:line_amount::float         as line_amount
    from source,
         lateral flatten(input => source.raw_json:line_items) as line_item
)

select * from line_items_flat