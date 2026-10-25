USE SCHEMA NESTLE_PROCUREMENT_DB.RAW;

CREATE OR REPLACE TABLE supplier_master (
  supplier_id             STRING,
  supplier_name           STRING,
  supplier_category       STRING,
  country                 STRING,
  region                  STRING,
  city                    STRING,
  preferred_currency      STRING,
  payment_terms_days      NUMBER,
  tax_id                  STRING,
  supplier_status         STRING,
  risk_tier               STRING,
  onboarded_date          DATE,
  primary_contact_email   STRING,
  _loaded_at              TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE supplier_onboarding (
  onboarding_id                   STRING,
  supplier_id                     STRING,
  supplier_name                   STRING,
  onboarding_stage                STRING,
  compliance_check_fssc22000      STRING,
  compliance_check_iso9001        STRING,
  compliance_check_sedex          STRING,
  sustainability_score            NUMBER,
  bank_verification_status        STRING,
  onboarding_start_date           DATE,
  onboarding_completion_date      DATE,
  approved_by                     STRING,
  _loaded_at                      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE supplier_rating (
  rating_id                STRING,
  supplier_id               STRING,
  supplier_name             STRING,
  rating_period             STRING,
  on_time_delivery_pct      FLOAT,
  quality_rejection_pct     FLOAT,
  responsiveness_score      NUMBER,
  overall_rating            STRING,
  comments                  STRING,
  _loaded_at                 TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE product_master (
  material_id       STRING,
  material_name     STRING,
  material_category STRING,
  uom               STRING,
  standard_cost     FLOAT,
  currency          STRING,
  shelf_life_days   STRING,   -- kept STRING because raw source uses 'N/A' for non-perishables
  is_hazardous      STRING,
  _loaded_at        TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE plant_master (
  plant_id     STRING,
  plant_name   STRING,
  plant_type   STRING,
  country      STRING,
  region       STRING,
  city         STRING,
  _loaded_at   TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE currency_exchange_rate (
  exchange_rate_id  STRING,
  currency_code     STRING,
  rate_month        DATE,
  rate_to_usd       FLOAT,
  _loaded_at        TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE purchase_orders (
  po_id                     STRING,
  po_line_num               NUMBER,
  po_date                   DATE,
  supplier_id               STRING,
  plant_id                  STRING,
  material_id               STRING,
  order_qty                 NUMBER,
  uom                       STRING,
  unit_price                FLOAT,
  currency                  STRING,
  line_amount               FLOAT,
  requested_delivery_date   DATE,
  po_status                 STRING,
  buyer_name                STRING,
  payment_terms_days        NUMBER,
  _loaded_at                TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE invoices (
  invoice_id         STRING,
  invoice_line_num   NUMBER,
  po_id              STRING,
  po_line_num        NUMBER,
  supplier_id        STRING,
  invoice_date       DATE,
  invoice_due_date   DATE,
  invoiced_qty       NUMBER,
  unit_price         FLOAT,
  currency           STRING,
  line_amount        FLOAT,
  tax_amount         FLOAT,
  total_amount       FLOAT,
  match_status       STRING,
  invoice_status     STRING,
  _loaded_at         TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE payments (
  payment_id                       STRING,
  invoice_id                       STRING,
  supplier_id                      STRING,
  payment_date                     DATE,
  payment_amount                   FLOAT,
  currency                         STRING,
  payment_method                   STRING,
  payment_status                   STRING,
  days_to_pay                      NUMBER,
  early_payment_discount_applied   STRING,
  _loaded_at                        TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE shipment_tracking (
  shipment_id             STRING,
  po_id                   STRING,
  supplier_id             STRING,
  plant_id                STRING,
  carrier_name            STRING,
  mode_of_transport       STRING,
  origin_country          STRING,
  destination_plant       STRING,
  ship_date               DATE,
  estimated_arrival_date  DATE,
  actual_arrival_date     DATE,
  shipment_status         STRING,
  otif_flag               STRING,
  temperature_controlled  STRING,
  _loaded_at              TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);


-- JSON (VARIANT) tables

CREATE OR REPLACE TABLE shipment_tracking_events_raw (
  raw_json    VARIANT,
  _loaded_at  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE purchase_order_lines_nested_raw (
  raw_json    VARIANT,
  _loaded_at  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);