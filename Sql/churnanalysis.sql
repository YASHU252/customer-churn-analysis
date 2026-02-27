-- Overall churn rate
SELECT 
    churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY churn;

-- Churn rate by tenure group
SELECT
    CASE
        WHEN tenure < 12 THEN '0-1 year'
        WHEN tenure BETWEEN 12 AND 24 THEN '1-2 years'
        ELSE '2+ years'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY tenure_group;

-- Average monthly charges by churn
SELECT
    churn,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges
FROM customers
GROUP BY churn;
