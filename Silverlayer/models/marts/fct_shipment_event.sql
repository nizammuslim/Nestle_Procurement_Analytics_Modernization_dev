-- models/marts/fct_shipment_event.sql
select * from {{ ref('stg_shipment_tracking_events') }}