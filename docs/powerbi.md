# Power BI Dashboard – Customer Churn & Retention

## Overview
The Power BI dashboard is designed to translate churn analytics into clear business insights and actionable retention strategies. It connects directly to MySQL views created from the churn modelling output and is structured to support executive decision-making as well as operational follow-up.

The dashboard follows the principle:
**Analytics → Insight → Action**

---

## Data Source
- **Database:** MySQL
- **Schema:** telco_churn
- **Primary tables/views used:**
  - v_kpi_scored
  - v_risk_distribution
  - v_churn_by_contract_scored
  - v_churn_by_tenure_bucket
  - v_scored_buckets
  - v_high_risk_customers
  - v_action_counts
  - v_revenue_at_risk

All heavy calculations are handled in SQL views to keep the Power BI model lightweight and stable.

---

## Dashboard Pages

### 1. Executive Overview
**Purpose:** High-level summary for stakeholders.

**Key visuals:**
- KPI cards: Total Customers, Churn Rate %, Targeted %, Revenue at Risk
- Risk distribution by segment
- Churn rate by contract type

**Design choice:**
This page is intentionally not slicer-driven to provide a consistent, global snapshot of churn performance.

---

### 2. Churn Drivers
**Purpose:** Identify key factors contributing to churn.

**Key visuals:**
- Churn rate by tenure bucket
- Churn comparison across contract types
- Probability distribution bands

**Insight delivered:**
Customers with low tenure and month-to-month contracts show significantly higher churn risk.

---

### 3. Risk Segmentation
**Purpose:** Understand how churn risk varies across customer groups.

**Key visuals:**
- Risk segment distribution
- Contract type vs risk segment
- Monthly charges vs churn probability

**Slicers used:**
- Contract
- Internet Service
- Risk Segment

These slicers are built from the customer-level view (`v_scored_buckets`) to ensure proper filtering.

---

### 4. Retention Actions
**Purpose:** Enable operational decision-making.

**Key visuals:**
- Recommended retention actions by volume
- High-risk customer list with churn probability and suggested actions

**Table design principles:**
- One row per customer
- No aggregation (no SUM of probabilities or charges)
- Sorted by churn probability (descending)

**Conditional formatting:**
- Churn probability uses a color scale (green → red)
- Monthly charges use data bars for quick comparison

---

## Modelling & Slicers
- All slicers are based on `v_scored_buckets` (customer-level view).
- Aggregated SQL views are intentionally not linked to slicers to avoid ambiguous filtering.
- This approach mirrors real-world BI best practices.

---

## Business Value
The dashboard allows:
- Executives to quickly understand churn exposure
- Analysts to explore churn drivers
- Operations teams to act on prioritized customer lists

---

## Tools Used
- Power BI Desktop
- MySQL (as the analytical backend)
- Python (for modelling and feature engineering)

---

## Notes
Due to data privacy considerations, raw customer data is not included in the repository. The dashboard structure and SQL logic can be reused with similar datasets.
