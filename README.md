# Customer Churn & Retention Strategy (Telecom)

## Business Problem

Customer churn represents a significant revenue risk for telecom businesses, as acquiring new customers is substantially more expensive than retaining existing ones.  
This project identifies customers most likely to churn, explains the key drivers behind churn behaviour, and proposes cost-effective, data-driven retention strategies.

---

## Objectives

The primary objectives of this project are to:

- Identify key drivers of customer churn
- Predict customer churn probability using an interpretable model
- Segment customers based on churn risk
- Recommend targeted retention actions
- Estimate the potential business and revenue impact of retention strategies

---

## Dataset

The analysis is based on the **IBM Telco Customer Churn dataset**, which contains customer-level information including:

- Demographics
- Contract and account details
- Service subscriptions
- Billing and payment behaviour
- Churn outcome (Yes / No)

---

## Tools & Skills

- **Python** (pandas, NumPy, scikit-learn, matplotlib)
- **SQL** (data understanding and KPI logic)
- **Power BI** (dashboarding and visualisation)
- **Business Analytics & Stakeholder Communication**
- **Jupyter Notebook**

---

## Project Structure

# Customer Churn & Retention Strategy (Telecom)

## Business Problem

Customer churn represents a significant revenue risk for telecom businesses, as acquiring new customers is substantially more expensive than retaining existing ones.  
This project identifies customers most likely to churn, explains the key drivers behind churn behaviour, and proposes cost-effective, data-driven retention strategies.

---

## Objectives

The primary objectives of this project are to:

- Identify key drivers of customer churn
- Predict customer churn probability using an interpretable model
- Segment customers based on churn risk
- Recommend targeted retention actions
- Estimate the potential business and revenue impact of retention strategies

---

## Dataset

The analysis is based on the **IBM Telco Customer Churn dataset**, which contains customer-level information including:

- Demographics
- Contract and account details
- Service subscriptions
- Billing and payment behaviour
- Churn outcome (Yes / No)

---

## Tools & Skills

- **Python** (pandas, NumPy, scikit-learn, matplotlib)
- **SQL** (data understanding and KPI logic)
- **Power BI** (dashboarding and visualisation)
- **Business Analytics & Stakeholder Communication**
- **Jupyter Notebook**

---

## Project Structure

data/ → raw and cleaned datasets
docs/ → business problem, KPIs, insights, strategy
notebooks/ → analysis and modelling notebooks
dashboards/ → Power BI dashboard outputs
models/ → trained churn models and outputs

---

Key notebooks:
- `01_data_cleaning.ipynb`
- `02_eda_analysis.ipynb`
- `03_churn_model_logistic.ipynb`

---

## Methodology Overview

The project follows an end-to-end business analytics workflow:

1. Data cleaning and preprocessing  
2. Exploratory data analysis (EDA) to identify churn drivers  
3. Logistic regression modelling for churn prediction  
4. Business-driven probability threshold selection  
5. Customer risk segmentation  
6. Translation of insights into retention actions  
7. Revenue impact estimation  

Each step is documented in a dedicated notebook to ensure clarity, reproducibility, and traceability.

---

## Modelling Approach

An interpretable **logistic regression** model was used to estimate customer churn probability.  
The model was selected to ensure transparency and explainability for business stakeholders.

Rather than using a default probability threshold of 0.5, a **business-driven threshold of 0.65** was selected based on the precision–recall trade-off.  
This ensures that retention efforts focus on the highest-risk customers while remaining operationally and financially feasible.

As a result, only **10.93% of customers** were flagged for targeted retention actions.

---

## Key Analytical Insights

The analysis identified several consistent churn drivers:

- Customers with **short tenure** are significantly more likely to churn
- **High monthly charges** increase churn probability
- **Month-to-month contracts** exhibit substantially higher churn rates
- **Fiber optic customers** show elevated churn behaviour compared to other services

These findings were consistent across both exploratory analysis and model outputs, reinforcing confidence in the results.

---

## Retention Strategy Summary

Analytical insights were translated into actionable retention strategies:

- Early-life onboarding and welcome offers for new customers
- Targeted discounts or bill protection for high-value customers
- Incentives to migrate customers from month-to-month to long-term contracts
- Service quality checks and loyalty bundles for fiber optic customers

Retention actions are applied selectively to high-risk customers to optimise cost efficiency and return on investment.

---

## Revenue Impact

Revenue at risk was estimated by aggregating the monthly charges of high-risk customers.  
A conservative retention success scenario was simulated to estimate potential revenue recovery.

This approach demonstrates how predictive analytics can directly support financially informed business decision-making.

---

## Key Outcomes

- Identified high-risk churn segments
- Built an explainable churn prediction model
- Implemented customer risk segmentation
- Designed ROI-focused retention strategies
- Quantified potential revenue impact of churn reduction

---

## Limitations

- The analysis is based on a static historical dataset
- No real-time behavioural or usage data is available
- Class imbalance may affect recall for churned customers
- Retention impact estimates are based on simulated assumptions

---

## Future Enhancements

- Use of advanced models (Random Forest, XGBoost)
- Real-time churn prediction and alerting
- A/B testing of retention strategies
- Integration with CRM and campaign management systems

---

## How to Navigate This Project

1. Begin with the notebooks folder to follow the analytical workflow:
   - `01_data_cleaning.ipynb`
   - `02_eda_analysis.ipynb`
   - `03_churn_model_logistic.ipynb`
2. Review Power BI dashboards in the `dashboards/` folder
3. Refer to cleaned datasets and model outputs in `data/` and `models/`

---

## Conclusion

This project demonstrates how predictive analytics can be operationalised into actionable business strategies.  
By combining interpretable modelling, customer segmentation, and revenue analysis, telecom organisations can proactively reduce churn and improve customer retention outcomes.
