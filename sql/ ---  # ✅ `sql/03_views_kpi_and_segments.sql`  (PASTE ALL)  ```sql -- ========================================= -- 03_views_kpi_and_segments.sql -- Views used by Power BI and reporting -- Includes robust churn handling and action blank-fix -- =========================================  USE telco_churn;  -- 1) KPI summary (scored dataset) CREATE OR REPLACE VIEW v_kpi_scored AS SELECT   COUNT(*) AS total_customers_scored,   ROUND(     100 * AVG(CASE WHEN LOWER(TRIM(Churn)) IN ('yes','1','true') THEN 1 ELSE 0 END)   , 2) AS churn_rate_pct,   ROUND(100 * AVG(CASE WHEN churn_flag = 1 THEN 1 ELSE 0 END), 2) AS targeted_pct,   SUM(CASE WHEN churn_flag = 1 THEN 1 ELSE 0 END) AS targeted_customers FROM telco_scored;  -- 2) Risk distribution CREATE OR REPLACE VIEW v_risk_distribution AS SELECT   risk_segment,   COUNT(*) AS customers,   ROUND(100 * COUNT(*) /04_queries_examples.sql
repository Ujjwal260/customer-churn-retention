-- =========================================
-- 04_queries_examples.sql
-- Example queries to validate and use the views
-- =========================================

USE telco_churn;

-- 1) KPI snapshot
SELECT * FROM v_kpi_scored;

-- 2) Churn by contract
SELECT * FROM v_churn_by_contract_scored;

-- 3) Churn by tenure bucket
SELECT * FROM v_churn_by_tenure_bucket;

-- 4) Risk distribution
SELECT * FROM v_risk_distribution;

-- 5) Revenue at risk
SELECT * FROM v_revenue_at_risk;

-- 6) Recommended actions distribution (targeted customers)
SELECT * FROM v_action_counts;

-- 7) Operational contact list (top 50)
SELECT
  customerID,
  churn_probability,
  risk_segment,
  tenure,
  Contract,
  InternetService,
  PaymentMethod,
  MonthlyCharges,
  recommended_action
FROM v_scored_buckets
WHERE churn_flag = 1
ORDER BY churn_probability DESC
LIMIT 50;

-- 8) Compare churn rate for month-to-month vs longer contracts
SELECT
  Contract,
  ROUND(100 * AVG(CASE WHEN LOWER(TRIM(Churn)) IN ('yes','1','true') THEN 1 ELSE 0 END), 2) AS churn_rate_pct
FROM telco_scored
GROUP BY Contract
ORDER BY churn_rate_pct DESC;
