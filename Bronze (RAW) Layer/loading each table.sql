COPY INTO supplier_master
  FROM @S3_PROCUREMENT_STAGE/supplier/supplier_master/
  FILE_FORMAT = (FORMAT_NAME = 'CSV_STANDARD')
  ON_ERROR = 'ABORT_STATEMENT';

COPY INTO supplier_onboarding
  FROM @S3_PROCUREMENT_STAGE/supplier/supplier_onboarding/
  FILE_FORMAT = (FORMAT_NAME = 'CSV_STANDARD');

COPY INTO supplier_rating
  FROM @S3_PROCUREMENT_STAGE/supplier/supplier_rating/
  FILE_FORMAT = (FORMAT_NAME = 'CSV_STANDARD');

COPY INTO product_master
  FROM @S3_PROCUREMENT_STAGE/materials/product_master/
  FILE_FORMAT = (FORMAT_NAME = 'CSV_STANDARD');

COPY INTO plant_master
  FROM @S3_PROCUREMENT_STAGE/materials/plant_master/
  FILE_FORMAT = (FORMAT_NAME = 'CSV_STANDARD');

COPY INTO currency_exchange_rate
  FROM @S3_PROCUREMENT_STAGE/finance/currency_exchange_rate/
  FILE_FORMAT = (FORMAT_NAME = 'CSV_STANDARD');

COPY INTO purchase_orders
  FROM @S3_PROCUREMENT_STAGE/procurement/purchase_orders/
  FILE_FORMAT = (FORMAT_NAME = 'CSV_STANDARD');

COPY INTO invoices
  FROM @S3_PROCUREMENT_STAGE/accounts_payable/invoices/
  FILE_FORMAT = (FORMAT_NAME = 'CSV_STANDARD');

COPY INTO payments
  FROM @S3_PROCUREMENT_STAGE/accounts_payable/payments/
  FILE_FORMAT = (FORMAT_NAME = 'CSV_STANDARD');

COPY INTO shipment_tracking
  FROM @S3_PROCUREMENT_STAGE/logistics/shipment_tracking/
  FILE_FORMAT = (FORMAT_NAME = 'CSV_STANDARD');

-- JSON loads (note: raw_json column, JSON_STANDARD format)
COPY INTO shipment_tracking_events_raw (raw_json)
  FROM @S3_PROCUREMENT_STAGE/logistics/shipment_tracking_events/
  FILE_FORMAT = (FORMAT_NAME = 'JSON_STANDARD')
  MATCH_BY_COLUMN_NAME = NONE;

COPY INTO purchase_order_lines_nested_raw (raw_json)
  FROM @S3_PROCUREMENT_STAGE/procurement/purchase_order_lines_nested/
  FILE_FORMAT = (FORMAT_NAME = 'JSON_STANDARD')
  MATCH_BY_COLUMN_NAME = NONE;