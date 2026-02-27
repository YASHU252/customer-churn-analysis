-- Data Cleaning and Validation

-- Check total records
SELECT COUNT(*) AS total_records
FROM customers;

-- Check for NULL values in key columns
SELECT 
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS null_tenure,
    SUM(CASE WHEN monthly_charges IS NULL THEN 1 ELSE 0 END) AS null_monthly_charges,
    SUM(CASE WHEN churn IS NULL THEN 1 ELSE 0 END) AS null_churn
FROM customers;

-- Remove records with missing critical values
DELETE FROM customers
WHERE customer_id IS NULL
   OR churn IS NULL;

-- Validate churn values
SELECT DISTINCT churn
FROM customers;
