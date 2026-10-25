-- models/staging/stg_shipment_tracking_events.sql
with source as (
    select raw_json from {{ source('raw', 'shipment_tracking_events_raw') }}
)

select
    source.raw_json:shipment_id::string             as shipment_id,
    source.raw_json:po_id::string                   as po_id,
    source.raw_json:carrier_name::string            as carrier_name,
    source.raw_json:mode_of_transport::string       as mode_of_transport,
    source.raw_json:temperature_controlled::boolean as temperature_controlled,
    event.value:event_seq::number                   as event_seq,
    event.value:event_timestamp::timestamp_ntz       as event_timestamp,
    event.value:location::string                     as location,
    event.value:event_status::string                 as event_status,
    event.value:temperature_c::float                  as temperature_c
from source,
     lateral flatten(input => source.raw_json:tracking_events) as event