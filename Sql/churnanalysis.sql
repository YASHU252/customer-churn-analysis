


-- 1. Overall churn rate
SELECT 
    churn,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS churn_rate_pct
FROM customers
GROUP BY churn;


-- 2. Churn rate by contract type
SELECT
    contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    ) AS churn_rate_pct
FROM customers
GROUP BY contract
ORDER BY churn_rate_pct DESC;


-- 3. Churn rate by tenure group
SELECT
    CASE
        WHEN tenure < 12  THEN '0–11 months'
        WHEN tenure < 24  THEN '12–23 months'
        WHEN tenure < 36  THEN '24–35 months'
        WHEN tenure < 48  THEN '36–47 months'
        WHEN tenure < 60  THEN '48–59 months'
        ELSE                   '60–71 months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    ) AS churn_rate_pct
FROM customers
GROUP BY tenure_group
ORDER BY MIN(tenure);


-- 4. Churn rate by internet service type
SELECT
    internet_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    ) AS churn_rate_pct
FROM customers
GROUP BY internet_service
ORDER BY churn_rate_pct DESC;


-- 5. Average monthly charges by churn status
SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges
FROM customers
GROUP BY churn;


-- 6. Monthly revenue at risk by risk tier
--    Risk Score = contract_risk + tenure_risk + price_risk (0–3)
--    See risk_segmentation.sql for full scoring logic
SELECT
    CASE risk_score
        WHEN 0 THEN '0 — Low Risk'
        WHEN 1 THEN '1 — Low-Medium'
        WHEN 2 THEN '2 — High Risk'
        WHEN 3 THEN '3 — Critical Risk'
    END AS risk_tier,
    COUNT(*) AS churned_customers,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charge,
    ROUND(SUM(monthly_charges), 0) AS monthly_revenue_at_risk
FROM (
    SELECT
        monthly_charges,
        (
            CASE WHEN contract = 'Month-to-month' THEN 1 ELSE 0 END +
            CASE WHEN tenure < 12               THEN 1 ELSE 0 END +
            CASE WHEN monthly_charges > (
                SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY monthly_charges)
                FROM customers
            ) THEN 1 ELSE 0 END
        ) AS risk_score
    FROM customers
    WHERE churn = 'Yes'
) scored
GROUP BY risk_score
ORDER BY risk_score DESC;