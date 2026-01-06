-- FedEx Logistics KPI SQL
-- Author: Madan Dahiphale
-- Purpose: Define delivery performance metrics for Power BI dashboard


SELECT
    ROUND(
        100.0 * SUM(CASE WHEN is_delayed = 0 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS on_time_delivery_pct,

    ROUND(
        100.0 * SUM(is_delayed)
        / COUNT(*),
        2
    ) AS delayed_shipment_pct,

    ROUND(
        AVG(lead_time_days),
        2
    ) AS avg_lead_time_days,

    ROUND(
        AVG(CASE WHEN is_delayed = 1 THEN delay_days END),
        2
    ) AS avg_delay_days

FROM fedex_shipments_kpi;



