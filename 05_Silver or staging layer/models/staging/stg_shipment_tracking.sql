-- models/staging/stg_shipment_tracking.sql
select shipment_id, po_id, supplier_id, plant_id, carrier_name, mode_of_transport,
       origin_country, destination_plant, ship_date, estimated_arrival_date,
       actual_arrival_date, shipment_status, (otif_flag = 'Y') as otif_flag,
       (temperature_controlled = 'Y') as temperature_controlled
from {{ source('raw', 'shipment_tracking') }}
where shipment_id is not null