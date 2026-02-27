# Customer Churn Analysis
### Business Analyst & Data Analyst Portfolio Project

**Domain:** Telecom | CRM Analytics &nbsp;|&nbsp; **Role:** Business Analyst / Data Analyst &nbsp;|&nbsp; **Year:** 2025

**G Yasaswini** &nbsp;|&nbsp; yashaswini2519@gmail.com &nbsp;|&nbsp; [linkedin.com/in/g-yasaswini](https://www.linkedin.com/in/g-yasaswini/)

---

## Tools & Technologies

| Category | Tool / Technology |
|---|---|
| Data Analysis & EDA | Python — Pandas, NumPy, Matplotlib, Seaborn |
| Database & SQL | MySQL Workbench — data cleaning, querying, segmentation |
| Business Intelligence | Power BI — interactive dashboard with drill-through & slicers |
| Notebook Environment | Jupyter Notebook |
| Version Control | Git & GitHub |

---

## Project Overview

This project analyses customer churn patterns for a telecom subscription business using Exploratory Data Analysis (EDA), SQL-based querying, and a rule-based risk scoring framework. The objective is to identify high-risk customers and deliver actionable, revenue-focused retention recommendations — without relying on machine learning.

The methodology mirrors the analytical workflow used by Business Analysts and Data Analysts in telecom and subscription industries: moving from raw data to business decision.

---

## Business Problem Statement

Customer churn directly impacts revenue, customer lifetime value (LTV), and long-term business growth. This analysis was scoped around four core business questions:

- **Why are customers leaving?** — Root cause analysis of key churn drivers
- **Which customers are most at risk?** — Segmentation and scoring model
- **Who should we prioritise for retention?** — Ranked outreach target lists
- **What is the financial impact?** — Quantified monthly revenue at risk

---

## Key Performance Indicators

| Metric | Value | Context |
|---|---|---|
| Total Customers | 7,043 | Full dataset analysed |
| Customers Churned | 1,869 | 26.5% overall churn rate |
| Monthly Revenue at Risk | $139,131 | Based on avg charge of $74.44 per churned customer |
| Avg Tenure — Churned | 18 months | vs. 38 months for retained customers |

---

## Key Findings

### Churn by Contract Type

| Contract Type | Churn Rate | Insight |
|---|---|---|
| Month-to-month | 42.7% | 15x more likely to churn than 2-year contract customers |
| One year | 11.3% | Moderate risk |
| Two year | 2.8% | Lowest churn — strongest retention signal |

### Churn by Customer Tenure

| Tenure | Churn Rate |
|---|---|
| 0 – 11 months | 48.3% |
| 12 – 23 months | 29.5% |
| 24 – 35 months | 22.0% |
| 36 – 47 months | 19.5% |
| 48 – 59 months | 15.0% |
| 60 – 71 months | 8.3% |

> The first 12 months represent the highest-risk window. Nearly 1 in 2 new customers churn. Retention efforts should be front-loaded at onboarding.

### Monthly Charges vs. Churn

| Segment | Average Monthly Charge |
|---|---|
| Churned Customers | $74.44 |
| Retained Customers | $61.27 |

> Higher-paying customers are significantly more likely to churn, suggesting a perceived value gap in premium and fiber optic plans.

---

## Rule-Based Churn Risk Scoring Model

A transparent, interpretable 3-factor scoring model designed to be understood and actioned by non-technical business stakeholders — no machine learning required.

| Risk Factor | Condition | Score |
|---|---|---|
| Contract Risk | Month-to-month contract | +1 |
| Tenure Risk | Tenure under 12 months | +1 |
| Price Risk | Monthly charges above dataset median | +1 |

**Total Score Range: 0 (Low Risk) → 3 (Critical Risk)**

### Risk Score Validation

| Risk Score | Customers | Actual Churn Rate | Interpretation |
|---|---|---|---|
| 0 — Low Risk | 1,546 | 3.2% | Stable, long-tenure customers |
| 1 — Low-Medium | 2,305 | 12.7% | Monitor — flag for billing changes |
| 2 — High Risk | 2,422 | 40.7% | Priority retention outreach |
| 3 — Critical Risk | 770 | 70.5% | Immediate intervention required |

> Score 3 customers are **22x more likely to churn** than Score 0. This segment (10.9% of customers) drives the majority of monthly revenue loss.

---

## SQL Analysis

All data validation, cleaning, and analysis was performed in MySQL Workbench across three structured query files:

- Overall churn rate computation and segment distribution
- Churn rate by contract type, tenure group, and internet service type
- Average monthly charges comparison by churn status
- NULL validation and data integrity checks across all critical fields
- Rule-based customer segmentation using CASE logic
- Revenue at risk quantification by risk tier

---

## Power BI Dashboard

An interactive business dashboard built with six components, enabling non-technical stakeholders to self-serve insights:

| Component | Description |
|---|---|
| KPI Cards | Total customers, churn rate, churned count at a glance |
| Risk Distribution | Donut chart — High / Medium / Low risk segment breakdown |
| Churn by Internet Service | Bar chart — fiber optic users show the highest churn rate |
| Churn by Contract Type | Bar chart — month-to-month contract dominates churn volume |
| High-Risk Customer Table | Drill-through table with CustomerID, contract, tenure, charges |
| Interactive Slicers | Filter by contract type, internet service, and gender |

---

## Business Recommendations

| Recommendation | Target Segment | Expected Outcome |
|---|---|---|
| Offer contract upgrade incentives (e.g. discounted annual plan) | Month-to-month customers, first 6 months | Reduce the 42.7% month-to-month churn rate |
| Launch early-tenure retention outreach programme | Customers with tenure < 12 months, Risk Score 2–3 | Address the highest-risk churn window |
| Pricing review for fiber optic plans | Fiber optic + high monthly charges segment | Close the perceived value gap driving churn |
| Proactive support and loyalty benefits | Senior citizens (41.7% churn rate) | Improve retention in an underserved segment |
| Deploy risk score as onboarding early warning | All new customers from day one | Enable proactive, data-driven intervention |

---

## Project Workflow

| Phase | Activity | Tool |
|---|---|---|
| 1 | Data Cleaning & Validation — 11 missing values resolved via business logic | Python + SQL |
| 2 | Exploratory Data Analysis — distributions, correlations, segment breakdowns | Python (Pandas, Seaborn) |
| 3 | Root Cause Analysis — key churn drivers identified across all dimensions | Python + SQL |
| 4 | Rule-Based Risk Scoring Model — 3-factor model, no ML dependency | Python + SQL (CASE) |
| 5 | Power BI Dashboard — 6 interactive components with slicers and drill-through | Power BI |
| 6 | Business Insights & Recommendations — stakeholder-ready output | Report / README |

---

## Repository Structure

```
customer-churn-analysis/
│
├── README.md
├── data/
│   └── churn.csv                        # Raw dataset (7,043 records, 33 features)
├── notebooks/
│   └── churn_analysis.ipynb             # EDA, data cleaning, and risk scoring model
├── sql/
│   ├── datacleaning.sql
│   ├── churnanalysis.sql
│   └── risk_segmentation.sql
├── dashboard/
│   └── Customer_Churn_Dashboard.pbix    # Power BI file
└── outputs/
    └── charts, scoring outputs, segment tables
```

---

*This portfolio project demonstrates Business Analyst and Data Analyst competencies including exploratory data analysis, SQL querying, rule-based modelling, Power BI dashboarding, and data-driven business recommendations — applicable to BA and DA roles across telecom, fintech, and subscription industries.*
