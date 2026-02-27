# Customer Churn Analysis — Business Analyst Portfolio Project

**Domain:** Telecom | CRM Analytics  
**Role Simulated:** Business Analyst / Data Analyst  
**Date:** 2025  
**Tools Used:** Python | SQL (MySQL Workbench) | Power BI | Jupyter Notebook | Git  

---

## Project Overview

This project analyses customer churn patterns for a telecom subscription business using Exploratory Data Analysis, SQL-based querying, and a rule-based risk scoring framework. The goal is to identify high-risk customers and deliver actionable retention recommendations — without relying on complex machine learning models.

The approach mirrors real-world churn analysis used by business analysts in telecom and subscription-based industries, demonstrating how raw data can be converted into business decisions.

---

## Problem Statement

Customer churn directly impacts revenue and long-term business growth. The business needed to:

- Understand **why** customers are leaving
- Identify **which** customers are most at risk
- Prioritise **who** to target for retention campaigns
- Quantify the **revenue impact** of churn

---

## Dataset Overview

| Attribute | Detail |
| --- | --- |
| Total Records | 7,043 customers |
| Total Features | 33 columns |
| Target Variable | Churn Value (0 = Retained, 1 = Churned) |
| Source Domain | Telecom subscription business |

Key features analysed: Customer demographics, contract type, tenure, monthly charges, internet service type, billing method, and payment details.

---

## Project Workflow

```
1. Data Cleaning and Validation (Python + SQL)
2. Exploratory Data Analysis (EDA)
3. Root Cause Analysis of churn drivers
4. Rule-Based Churn Risk Scoring Model
5. Power BI Interactive Dashboard
6. Business Insights and Retention Recommendations
```

---

## Key Findings

### Overall Churn Distribution

| Status | Count | Percentage |
| --- | --- | --- |
| Churned | 1,869 | 26.5% |
| Retained | 5,174 | 73.5% |
| Total | 7,043 | 100% |

### Churn by Contract Type

| Contract Type | Churn Rate |
| --- | --- |
| Month-to-month | 42.7% |
| One year | 11.3% |
| Two year | 2.8% |

Month-to-month customers are 15x more likely to churn than two-year contract customers.

### Churn by Tenure

| Tenure Bucket | Churn Rate |
| --- | --- |
| 0-11 months | 48.3% |
| 12-23 months | 29.5% |
| 24-35 months | 22.0% |
| 36-47 months | 19.5% |
| 48-59 months | 15.0% |
| 60-71 months | 8.3% |

Average tenure of churned customers: 18 months vs 38 months for retained customers.

### Monthly Charges vs Churn

| Segment | Avg Monthly Charges |
| --- | --- |
| Churned customers | $74.44 |
| Retained customers | $61.27 |

Higher monthly charges are strongly associated with increased churn likelihood.

### Revenue at Risk

| Metric | Value |
| --- | --- |
| Monthly revenue at risk | $139,131 |
| Customers churned | 1,869 |
| Avg monthly charge (churned) | $74.44 |

---

## Data Cleaning and Validation

Performed using both Python (Pandas) and SQL:

- Converted Total Charges from object to numeric format
- Identified and resolved **11 missing values** using business logic (new customers with zero tenure assigned zero total charges)
- Validated NULL counts across all critical fields: CustomerID, Tenure, Monthly Charges, Churn
- Verified distinct churn label values for data integrity

---

## Rule-Based Churn Risk Scoring Model

A transparent, interpretable 3-factor scoring model built without machine learning:

| Risk Factor | Condition | Score |
| --- | --- | --- |
| Contract Risk | Month-to-month contract | +1 |
| Tenure Risk | Tenure under 12 months | +1 |
| Price Risk | Monthly charges above median | +1 |

**Total Score Range: 0 to 3**

### Risk Score vs Actual Churn Rate

| Risk Score | Customers | Actual Churn Rate |
| --- | --- | --- |
| 0 | 1,546 | 3.2% |
| 1 | 2,305 | 12.7% |
| 2 | 2,422 | 40.7% |
| 3 | 770 | 70.5% |

Customers with a score of 3 are 22x more likely to churn than customers with a score of 0.

High-risk segment (score 3) represents **10.9% of all customers** but drives a disproportionate share of total churn.

---

## SQL Analysis

SQL was used to validate, clean, and analyse the dataset in MySQL Workbench:

- Overall churn rate computation
- Churn rate by contract type and tenure group
- Average monthly charges by churn status
- NULL validation across critical fields
- Rule-based customer segmentation using CASE logic
- Risk segment distribution analysis

---

## Power BI Dashboard

Interactive dashboard built with 6 components:

| Component | Detail |
| --- | --- |
| KPI Cards | Total Customers: 7,043 / Churn Rate: 26.5% / Churned: 1,869 |
| Risk Category Distribution | Donut chart of High / Medium / Low risk segments |
| Churn by Internet Service | Bar chart showing fiber optic highest churn |
| Churn Contribution by Contract | Bar chart by contract type |
| High-Risk Customer Table | Drill-through table with CustomerID, contract, tenure, charges |
| Interactive Slicers | Contract type, Internet service, Gender |

---

## Business Insights

- Month-to-month customers contribute the largest share of total churn
- Fiber optic internet users show significantly higher churn than DSL users
- Early-tenure customers with high monthly charges are the most vulnerable segment
- High-risk customers (score 3) form a small segment but drive majority of revenue loss

---

## Business Recommendations

| Recommendation | Target Segment |
| --- | --- |
| Offer contract upgrade incentives | Month-to-month customers in first 6 months |
| Early retention outreach program | Customers with tenure under 12 months |
| Pricing review for fiber optic plans | Fiber optic + high monthly charges segment |
| Proactive support improvement | Senior citizens (41.7% churn rate) |
| Use risk score as early warning indicator | All new customers at onboarding |

---

## Tools and Technologies

| Category | Tool |
| --- | --- |
| Data Analysis | Python (Pandas, NumPy, Matplotlib, Seaborn) |
| Database | SQL (MySQL Workbench) |
| Notebook | Jupyter Notebook |
| Visualisation | Power BI |
| Version Control | Git and GitHub |

---

## Repository Structure

```
customer-churn-analysis/
|
|-- README.md
|-- data/
|   |-- churn.csv
|
|-- notebooks/
|   |-- churn_analysis.ipynb
|
|-- sql/
|   |-- datacleaning.sql
|   |-- churnanalysis.sql
|   |-- risk_segmentation.sql
|
|-- dashboard/
|   |-- Customer_Churn_Dashboard.pbix
|
|-- screenshots/
    |-- Dashboard_Overview.png
    |-- High_risk_customers.png
    |-- Slicers_interaction.png
```

---

## About

**G Yasaswini** | Aspiring Business Analyst | BFSI and Analytics Domain  
yashaswini2519@gmail.com  
[LinkedIn](https://www.linkedin.com/in/g-yasaswini/)  
[Digital Loan Transformation Project](https://github.com/YASHU252/Digital-Loan-Transformation)

This is a portfolio project demonstrating Business Analyst skills including exploratory data analysis, SQL querying, rule-based modelling, and data-driven business recommendations.
