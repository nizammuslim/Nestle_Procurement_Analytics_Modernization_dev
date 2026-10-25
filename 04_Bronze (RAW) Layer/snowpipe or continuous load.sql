CREATE OR REPLACE PIPE NESTLE_PROCUREMENT_DB.RAW.PIPE_SHIPMENT_TRACKING
  AUTO_INGEST = TRUE
  AS
  COPY INTO shipment_tracking
  FROM @S3_PROCUREMENT_STAGE/logistics/shipment_tracking/
  FILE_FORMAT = (FORMAT_NAME = 'CSV_STANDARD');

-- After creating the pipe, copy its notification_channel (SHOW PIPES) into an
-- S3 Event Notification on the bucket so new files auto-trigger the pipe.
SHOW PIPES LIKE 'PIPE_SHIPMENT_TRACKING';