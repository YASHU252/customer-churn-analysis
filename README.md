# Customer Churn Analysis
### Business Analyst & Product Analyst Portfolio Project

**Domain:** Telecom | CRM Analytics &nbsp;|&nbsp; **Role:** Business Analyst / Product Analyst &nbsp;|&nbsp; **Year:** 2025

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

The methodology mirrors the analytical workflow used by Product Analysts and Business Analysts in telecom and subscription industries: moving from raw data to a product decision.

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

## Product Impact

| Finding | Product Decision Enabled |
|---------|--------------------------|
| Score-3 customers (10.9% of base) have a 70.5% churn rate | Retention campaign targeting: contact score-3 customers proactively within 30 days of signup — before the churn decision is made |
| Month-to-month customers churn 15× more than 2-year customers | Feature recommendation: introduce a 6-month contract option with a modest discount as a stepping stone — reduces commitment friction while increasing lock-in |
| 0–11 month tenure = 48.3% churn rate | Product ops change: trigger an onboarding check-in workflow at Day 7, Day 30, and Day 90 for all new customers |
| Fiber optic users + high monthly charges = concentrated churn risk | Pricing review: audit fiber plan value perception; consider tiered pricing or a usage-based add-on to close the perceived value gap |
| $139,131 monthly revenue at risk from churned customers | Budget justification: even a 10% reduction in churn (187 customers) recovers ~$13,900/month — sets the ROI threshold for any retention investment |

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

| File | Queries |
|---|---|
| `datacleaning.sql` | Total record count · NULL checks across 4 critical fields · DELETE for missing customer_id or churn · DISTINCT churn value validation |
| `churnanalysis.sql` | Overall churn rate with % · Churn rate by contract type · Churn rate by tenure group (6 buckets) · Churn rate by internet service type · Avg monthly charges by churn status · Monthly revenue at risk by risk tier |
| `risk_segmentation.sql` | Data-driven percentile-based threshold assignment (75th and 40th percentile) · Segment distribution with % of total · Actual churn rate validation per segment |

> Note: `risk_segmentation.sql` uses data-driven percentile thresholds (p75 for high-risk, p40 for medium-risk) rather than hard-coded values, ensuring the segmentation logic remains valid across dataset variations.

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
## Product Impact

### What this analysis enables

The risk scoring model produces an actionable customer tier — not just an insight to report,
but a trigger for product and CRM workflows. Three specific product decisions it supports:

**1. Automated retention programme enrolment**
At onboarding (day 1), every new customer receives a Risk Score. Customers scoring 2–3
are automatically enrolled in a 90-day early retention programme: proactive support
outreach at day 30, a contract upgrade offer at day 60, and a loyalty discount prompt at
day 90. This converts the risk score from a reporting output into a real-time CRM trigger.

**2. In-product contract upgrade flow**
The 42.7% month-to-month churn rate vs 2.8% for 2-year contracts points to a high-value
product intervention: a contextual "upgrade your plan" flow triggered at months 3–6 for
month-to-month customers, offering a first-year annual plan discount. The expected impact
is measurable: if 10% of month-to-month customers convert to annual, the churn rate for
that cohort should drop from ~43% toward 11%.

**3. Fibre optic product brief**
Fibre customers pay more AND churn more — a perceived value gap. This finding should
feed a product brief for the fibre product team: what is the fibre customer expected vs
received experience, and what feature or service gap is driving the willingness to churn
despite higher spend?

### How success would be measured

| Metric | Definition | Baseline | Target |
|---|---|---|---|
| Retention rate at 90 days | % of Score 2–3 customers still active at day 90 | Establish from data | +10pp vs control |
| Contract upgrade conversion | % of month-to-month customers converting to annual via the upgrade flow | 0% (no flow exists) | ≥ 10% |
| Monthly revenue retained | $ monthly charges from customers who would have churned | $0 (no intervention) | Reduce $139k at-risk by 20% in 6 months |
| Score 3 churn rate | Actual churn rate of critical-risk customers after intervention | 70.5% | Target < 50% |

> **Measurement approach:** Run the retention programme as an A/B test — enrol 50% of
> Score 2–3 customers in the programme and hold 50% as control. Compare 90-day retention
> rates between the two groups. This isolates the programme's effect from broader trends.

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

*This portfolio project demonstrates Product Analyst and Business Analyst competencies: exploratory data analysis, SQL querying, rule-based modelling, Power BI dashboarding, and data-driven product and business recommendations — applicable to PA, BA, and DA roles across telecom, fintech, and subscription industries.*
