Nestle Procurement Analytics Modernization

Weekend Data Engineering & Cloud Computing Training Batch
A fictional-client training project simulating a real consulting engagement: modernizing Nestle's procurement analytics using AWS S3 → Snowflake → dbt → Airflow -> end view.

All data in this repo is synthetic/dummy, generated for training purposes only. See the disclaimer at the top of the Playbook.

Start Here
01_Project_Playbook/ — Read this first. The consolidated BRD + solution design: client background, pain points, project scope, architecture, data model (facts/dims), tech stack, and the milestone plan for the batch.

02_Reference_Guide/ — Primer on every tool (S3, Snowflake, dbt, Airflow ) and exactly how they connect to each other.

03_Code_Reference/ — Consolidated, ready-to-adapt code: Snowflake DDL/COPY INTO, dbt staging + mart models (including JSON flattening), the Airflow DAG only.

04_Data/ — Sample source data.
csv/ — 10 files: supplier_master, supplier_onboarding, supplier_rating, product_master, plant_master, currency_exchange_rate, purchase_orders, invoices, payments, shipment_tracking
json/ — 2 semi-structured files for the FLATTEN lesson: purchase_order_lines_nested.json, shipment_tracking_events.json
Suggested Path for Candidates

01_Project_Playbook → 02_Reference_Guide → build Bronze/Silver/Gold in Snowflake with dbt using 03_Code_Reference → orchestrate with Airflow .    
