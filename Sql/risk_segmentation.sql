-- Rule-based churn risk segmentation

SELECT
    customer_id,
    tenure,
    monthly_charges,
    CASE
        WHEN tenure < 12 AND monthly_charges > 80 THEN 'High Risk'
        WHEN tenure BETWEEN 12 AND 24 AND monthly_charges > 60 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS churn_risk
FROM customers;

-- Distribution of risk segments
SELECT
    churn_risk,
    COUNT(*) AS customer_count
FROM (
    SELECT
        CASE
            WHEN tenure < 12 AND monthly_charges > 80 THEN 'High Risk'
            WHEN tenure BETWEEN 12 AND 24 AND monthly_charges > 60 THEN 'Medium Risk'
            ELSE 'Low Risk'
        END AS churn_risk
    FROM customers
) t
GROUP BY churn_risk;
