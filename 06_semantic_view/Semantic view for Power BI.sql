

CREATE OR REPLACE VIEW NESTLE_PROCUREMENT_DB.MART.VW_SUPPLIER_SCORECARD AS
SELECT
    d.supplier_name,
    d.supplier_category,
    d.region,
    r.rating_period,
    r.on_time_delivery_pct,
    r.quality_rejection_pct,
    r.overall_rating
FROM NESTLE_PROCUREMENT_DB.MART.FCT_SUPPLIER_RATING r
JOIN NESTLE_PROCUREMENT_DB.MART.DIM_SUPPLIER d
    ON r.supplier_key = d.supplier_key;