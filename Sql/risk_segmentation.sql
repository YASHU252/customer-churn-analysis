-- ============================================================
-- Customer Churn Analysis — Risk Segmentation
-- ============================================================
--
-- Segment customers into High / Medium / Low churn risk
-- based on three observable behavioural signals.
--
-- THRESHOLD METHODOLOGY
-- ---------------------
-- Rather than hardcoding charge values, thresholds are derived
-- from the dataset's own distribution so the model stays
-- calibrated if the data changes and is defensible in reviews.
--
--   High Risk:   Month-to-month contract
--                AND tenure < 12 months          (highest churn window: 48.3%)
--                AND monthly charges > p75        (top-quartile price exposure)
--
--   Medium Risk: Tenure between 12 and 24 months  (still elevated at 29.5%)
--                AND monthly charges > p50         (above-median spend)
--
--   Low Risk:    All remaining customers
--
-- Signal validation (from churnanalysis.sql):
--   Month-to-month churn rate : 42.7%  (vs 2.8% for 2-year contracts)
--   Tenure 0–11 months        : 48.3%  (vs 8.3% for 60–71 months)
--   Above-median charges      : churned avg $74.44 vs retained avg $61.27
--
-- NOTE ON PERCENTILES (MySQL compatibility)
-- -----------------------------------------
-- MySQL does not support PERCENTILE_CONT / PERCENTILE_DISC.
-- Percentiles are calculated using ROW_NUMBER() + COUNT() OVER (),
-- which is fully supported in MySQL 8.0+.
-- ROW_NUMBER() ranks every row by monthly_charges ascending;
-- the row at position ROUND(total * 0.75) is the p75 value,
-- and the row at position ROUND(total * 0.50) is the p50 value.
-- ============================================================


-- ============================================================
-- Reusable percentile CTE (paste this block into all 3 queries)
-- ============================================================
--
-- charge_thresholds CTE — MySQL 8.0+ compatible
--
-- WITH charge_thresholds AS (
--     SELECT
--         MAX(CASE WHEN rn = ROUND(total_rows * 0.75) THEN monthly_charges END) AS p75_charge,
--         MAX(CASE WHEN rn = ROUND(total_rows * 0.50) THEN monthly_charges END) AS p50_charge
--     FROM (
--         SELECT
--             monthly_charges,
--             ROW_NUMBER() OVER (ORDER BY monthly_charges) AS rn,
--             COUNT(*)     OVER ()                         AS total_rows
--         FROM customers
--     ) ranked
-- )


-- ============================================================
-- Query 1 — Assign risk category to each customer
-- ============================================================
WITH charge_thresholds AS (
    SELECT
        MAX(CASE WHEN rn = ROUND(total_rows * 0.75) THEN monthly_charges END) AS p75_charge,
        MAX(CASE WHEN rn = ROUND(total_rows * 0.50) THEN monthly_charges END) AS p50_charge
    FROM (
        SELECT
            monthly_charges,
            ROW_NUMBER() OVER (ORDER BY monthly_charges) AS rn,
            COUNT(*)     OVER ()                         AS total_rows
        FROM customers
    ) ranked
)

SELECT
    c.customer_id,
    c.contract,
    c.tenure,
    c.monthly_charges,
    ROUND(th.p75_charge, 2) AS high_risk_charge_threshold,
    ROUND(th.p50_charge, 2) AS medium_risk_charge_threshold,
    CASE
        WHEN c.contract = 'Month-to-month'
             AND c.tenure < 12
             AND c.monthly_charges > th.p75_charge
            THEN 'High Risk'
        WHEN c.tenure BETWEEN 12 AND 24
             AND c.monthly_charges > th.p50_charge
            THEN 'Medium Risk'
        ELSE
            'Low Risk'
    END AS churn_risk
FROM customers c
CROSS JOIN charge_thresholds th;


-- ============================================================
-- Query 2 — Distribution of risk segments
-- ============================================================
WITH charge_thresholds AS (
    SELECT
        MAX(CASE WHEN rn = ROUND(total_rows * 0.75) THEN monthly_charges END) AS p75_charge,
        MAX(CASE WHEN rn = ROUND(total_rows * 0.50) THEN monthly_charges END) AS p50_charge
    FROM (
        SELECT
            monthly_charges,
            ROW_NUMBER() OVER (ORDER BY monthly_charges) AS rn,
            COUNT(*)     OVER ()                         AS total_rows
        FROM customers
    ) ranked
),
segmented AS (
    SELECT
        CASE
            WHEN c.contract = 'Month-to-month'
                 AND c.tenure < 12
                 AND c.monthly_charges > th.p75_charge
                THEN 'High Risk'
            WHEN c.tenure BETWEEN 12 AND 24
                 AND c.monthly_charges > th.p50_charge
                THEN 'Medium Risk'
            ELSE
                'Low Risk'
        END AS churn_risk
    FROM customers c
    CROSS JOIN charge_thresholds th
)
SELECT
    churn_risk,
    COUNT(*)                                                              AS customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 1)        AS pct_of_total
FROM segmented
GROUP BY churn_risk
ORDER BY
    CASE churn_risk
        WHEN 'High Risk'   THEN 1
        WHEN 'Medium Risk' THEN 2
        ELSE                    3
    END;


-- ============================================================
-- Query 3 — Actual churn rate by risk segment (validation)
-- Cross-reference with the 3-factor Python model in the
-- notebook: both models should rank segments High > Med > Low.
-- If they disagree materially, investigate threshold alignment.
-- ============================================================
WITH charge_thresholds AS (
    SELECT
        MAX(CASE WHEN rn = ROUND(total_rows * 0.75) THEN monthly_charges END) AS p75_charge,
        MAX(CASE WHEN rn = ROUND(total_rows * 0.50) THEN monthly_charges END) AS p50_charge
    FROM (
        SELECT
            monthly_charges,
            ROW_NUMBER() OVER (ORDER BY monthly_charges) AS rn,
            COUNT(*)     OVER ()                         AS total_rows
        FROM customers
    ) ranked
),
segmented AS (
    SELECT
        c.churn,
        CASE
            WHEN c.contract = 'Month-to-month'
                 AND c.tenure < 12
                 AND c.monthly_charges > th.p75_charge
                THEN 'High Risk'
            WHEN c.tenure BETWEEN 12 AND 24
                 AND c.monthly_charges > th.p50_charge
                THEN 'Medium Risk'
            ELSE
                'Low Risk'
        END AS churn_risk
    FROM customers c
    CROSS JOIN charge_thresholds th
)
SELECT
    churn_risk,
    COUNT(*)                                                                         AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)                                  AS churned,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    )                                                                                AS actual_churn_rate_pct
FROM segmented
GROUP BY churn_risk
ORDER BY actual_churn_rate_pct DESC;
