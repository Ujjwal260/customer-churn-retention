
---

# ✅ `sql/03_views_kpi_and_segments.sql`  (PASTE ALL)

```sql
-- =========================================
-- 03_views_kpi_and_segments.sql
-- Views used by Power BI and reporting
-- Includes robust churn handling and action blank-fix
-- =========================================

USE telco_churn;

-- 1) KPI summary (scored dataset)
CREATE OR REPLACE VIEW v_kpi_scored AS
SELECT
  COUNT(*) AS total_customers_scored,
  ROUND(
    100 * AVG(CASE WHEN LOWER(TRIM(Churn)) IN ('yes','1','true') THEN 1 ELSE 0 END)
  , 2) AS churn_rate_pct,
  ROUND(100 * AVG(CASE WHEN churn_flag = 1 THEN 1 ELSE 0 END), 2) AS targeted_pct,
  SUM(CASE WHEN churn_flag = 1 THEN 1 ELSE 0 END) AS targeted_customers
FROM telco_scored;

-- 2) Risk distribution
CREATE OR REPLACE VIEW v_risk_distribution AS
SELECT
  risk_segment,
  COUNT(*) AS customers,
  ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM telco_scored), 2) AS pct_customers
FROM telco_scored
GROUP BY risk_segment
ORDER BY customers DESC;

-- 3) Churn rate by contract (fixed churn logic)
CREATE OR REPLACE VIEW v_churn_by_contract_scored AS
SELECT
  Contract,
  COUNT(*) AS customers,
  ROUND(
    100 * AVG(CASE WHEN LOWER(TRIM(Churn)) IN ('yes','1','true') THEN 1 ELSE 0 END)
  , 2) AS churn_rate_pct
FROM telco_scored
GROUP BY Contract
ORDER BY churn_rate_pct DESC;

-- 4) Revenue at risk (High Risk)
CREATE OR REPLACE VIEW v_revenue_at_risk AS
SELECT
  ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_at_risk,
  ROUND(SUM(MonthlyCharges) * 12, 2) AS annual_revenue_at_risk
FROM telco_scored
WHERE risk_segment = 'High Risk';

-- 5) Action counts (only targeted customers)
CREATE OR REPLACE VIEW v_action_counts AS
SELECT
  recommended_action,
  COUNT(*) AS customers
FROM telco_scored
WHERE churn_flag = 1
GROUP BY recommended_action
ORDER BY customers DESC;

-- 6) Operational list for retention actions (targeted customers)
CREATE OR REPLACE VIEW v_high_risk_customers AS
SELECT
  customerID,
  churn_probability,
  risk_segment,
  churn_flag,
  tenure,
  Contract,
  InternetService,
  PaymentMethod,
  MonthlyCharges,
  recommended_action
FROM telco_scored
WHERE churn_flag = 1
ORDER BY churn_probability DESC;

-- 7) Customer-level bucketed view (for slicers + analysis)
-- Fixes blank slicer issue by replacing empty recommended_action with 'Other'
CREATE OR REPLACE VIEW v_scored_buckets AS
SELECT
  customerID,
  Churn,
  tenure,
  MonthlyCharges,
  TotalCharges,
  Contract,
  InternetService,
  PaymentMethod,
  churn_probability,
  churn_flag,
  risk_segment,
  COALESCE(NULLIF(TRIM(recommended_action), ''), 'Other') AS recommended_action,
  CASE
    WHEN tenure <= 6 THEN '0-6 months'
    WHEN tenure <= 12 THEN '7-12 months'
    WHEN tenure <= 24 THEN '13-24 months'
    WHEN tenure <= 48 THEN '25-48 months'
    ELSE '49+ months'
  END AS tenure_bucket,
  CASE
    WHEN churn_probability < 0.20 THEN '0.00-0.19'
    WHEN churn_probability < 0.40 THEN '0.20-0.39'
    WHEN churn_probability < 0.60 THEN '0.40-0.59'
    WHEN churn_probability < 0.80 THEN '0.60-0.79'
    ELSE '0.80-1.00'
  END AS proba_band
FROM telco_scored;

-- 8) Churn rate by tenure bucket
CREATE OR REPLACE VIEW v_churn_by_tenure_bucket AS
SELECT
  tenure_bucket,
  COUNT(*) AS customers,
  ROUND(
    100 * AVG(CASE WHEN LOWER(TRIM(Churn)) IN ('yes','1','true') THEN 1 ELSE 0 END)
  , 2) AS churn_rate_pct
FROM v_scored_buckets
GROUP BY tenure_bucket
ORDER BY
  CASE tenure_bucket
    WHEN '0-6 months' THEN 1
    WHEN '7-12 months' THEN 2
    WHEN '13-24 months' THEN 3
    WHEN '25-48 months' THEN 4
    ELSE 5
  END;

-- 9) Avg churn probability by segment and contract (useful visual)
CREATE OR REPLACE VIEW v_avg_proba_by_segment_contract AS
SELECT
  risk_segment,
  Contract,
  COUNT(*) AS customers,
  ROUND(AVG(churn_probability), 4) AS avg_churn_probability
FROM v_scored_buckets
GROUP BY risk_segment, Contract
ORDER BY risk_segment, avg_churn_probability DESC;

-- 10) Targeted customers by action and contract (ops planning)
CREATE OR REPLACE VIEW v_targeted_by_action_contract AS
SELECT
  recommended_action,
  Contract,
  COUNT(*) AS customers,
  ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_in_group
FROM v_scored_buckets
WHERE churn_flag = 1
GROUP BY recommended_action, Contract
ORDER BY customers DESC;

-- 11) Revenue by segment (risk impact)
CREATE OR REPLACE VIEW v_revenue_by_segment AS
SELECT
  risk_segment,
  COUNT(*) AS customers,
  ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue,
  ROUND(SUM(MonthlyCharges) * 12, 2) AS annual_revenue
FROM v_scored_buckets
GROUP BY risk_segment
ORDER BY annual_revenue DESC;
