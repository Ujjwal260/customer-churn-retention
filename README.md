# Customer Churn & Retention Strategy (Telecom)

## 📌 Business Problem
Customer churn represents a significant revenue risk for telecom businesses, as acquiring new customers is substantially more expensive than retaining existing ones.

This project identifies customers most likely to churn, explains the key drivers behind churn behaviour, and proposes cost-effective, data-driven retention strategies that can be operationalised by the business.

The project demonstrates how predictive analytics can be translated into clear business decisions using Python, SQL, and Power BI.

---

## 🎯 Objectives
The primary objectives of this project are to:

- Identify key drivers of customer churn  
- Predict customer churn probability using an interpretable model  
- Segment customers based on churn risk  
- Recommend targeted retention actions  
- Estimate the potential business and revenue impact of retention strategies  

---

## 📊 Dataset
The analysis is based on the **IBM Telco Customer Churn dataset**, which contains customer-level information including:

- Demographics  
- Contract and account details  
- Service subscriptions  
- Billing and payment behaviour  
- Churn outcome (Yes / No)  

**Dataset source:**  
https://www.kaggle.com/blastchar/telco-customer-churn  

> Raw data is not included in this repository.

---

## 🧰 Tools & Skills
- **Python:** pandas, NumPy, scikit-learn, matplotlib  
- **SQL (MySQL):** data modelling, KPI logic, analytical views  
- **Power BI:** dashboarding, slicers, conditional formatting  
- **Business Analytics & Stakeholder Communication**  
- **Jupyter Notebook**  

---

## 📂 Project Structure
customer-churn-retention/
│
├── notebooks/ # Data cleaning, EDA, modelling
├── sql/ # Table creation, views, queries
├── powerbi/ # PBIX file and dashboard screenshots
├── docs/ # KPI dictionary, SQL & Power BI explanations
├── README.md
└── .gitignore

--


### Key Notebooks
- **01_data_cleaning.ipynb** – Data cleaning and preprocessing  
- **02_eda_analysis.ipynb** – Exploratory analysis of churn drivers  
- **03_churn_model_logistic.ipynb** – Churn modelling, threshold selection, risk segmentation  

---

## 🔄 Methodology Overview
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

## 🤖 Modelling Approach
An interpretable **logistic regression model** was used to estimate customer churn probability to ensure transparency and explainability for business stakeholders.

Rather than using a default probability threshold of 0.5, a **business-driven threshold of 0.65** was selected based on the precision–recall trade-off.

This ensures that retention efforts focus on the highest-risk customers while remaining operationally and financially feasible.

**Result:**  
Only **10.93% of customers** were flagged for targeted retention actions.

---

## 🧠 Key Analytical Insights
The analysis identified several consistent churn drivers:

- Customers with **short tenure** are significantly more likely to churn  
- **High monthly charges** increase churn probability  
- **Month-to-month contracts** exhibit substantially higher churn rates  
- **Fiber optic customers** show elevated churn behaviour compared to other services  

These insights were consistent across both EDA and model outputs.

---

## 🛠 SQL Analytics (MySQL)
SQL is used to operationalise model outputs and generate business-ready analytics.

Key features:
- Storage of churn model outputs (`churn_probability`, `risk_segment`, `recommended_action`)
- Robust churn calculations using defensive SQL logic
- Reusable views for KPIs, segmentation, and revenue impact
- Customer-level views to support Power BI slicers and operational tables

All SQL scripts are available in the `/sql` folder.

---

## 📈 Power BI Dashboard
The Power BI report connects directly to MySQL views and contains four structured pages:

1. **Executive Overview** – headline KPIs and churn summary  
2. **Churn Drivers** – tenure, contract, and service-level analysis  
3. **Risk Segmentation** – churn risk distribution and comparisons  
4. **Retention Actions** – prioritised customer list with recommended actions  

Design principles:
- Clear separation between executive and operational views  
- Slicers applied only where analytically appropriate  
- Customer-level tables designed for real retention workflows  

A detailed explanation is provided in `powerbi.md`.

---

## 💡 Retention Strategy Summary
Analytical insights were translated into actionable retention strategies:

- **Early-life onboarding** for new customers  
- **Targeted discounts / bill protection** for high-value customers  
- **Contract upgrade incentives** for month-to-month customers  
- **Service quality checks and loyalty bundles** for fiber optic users  

Retention actions are applied selectively to high-risk customers to optimise cost efficiency and ROI.

---

## 💰 Revenue Impact
Revenue at risk was estimated by aggregating the monthly charges of high-risk customers.  
A conservative retention success scenario was simulated to estimate potential revenue recovery.

This demonstrates how predictive analytics can directly support financially informed business decision-making.

---

## ✅ Key Outcomes
- Identified high-risk churn segments  
- Built an explainable churn prediction model  
- Implemented customer risk segmentation  
- Designed ROI-focused retention strategies  
- Quantified potential revenue impact of churn reduction  

---

## ⚠️ Limitations
- Analysis is based on a static historical dataset  
- No real-time behavioural or usage data available  
- Class imbalance may affect recall for churned customers  
- Revenue impact estimates are based on simulated assumptions  

---

## 🚀 Future Enhancements
- Advanced models (Random Forest, XGBoost)  
- Real-time churn prediction and alerting  
- A/B testing of retention strategies  
- Integration with CRM and campaign management systems  

---

## ▶️ How to Navigate This Project
1. Start with the `notebooks/` folder to follow the analytical workflow  
2. Review SQL logic and views in the `sql/` folder  
3. Explore dashboards and screenshots in the `powerbi/` folder  
4. Refer to documentation in `docs/` for KPIs and explanations  

---

## 🧠 Conclusion
This project demonstrates how predictive analytics can be operationalised into actionable business strategies.

By combining interpretable modelling, customer segmentation, SQL analytics, and Power BI dashboards, telecom organisations can proactively reduce churn and improve customer retention outcomes.

---

## 👤 Author
**Ujjwal**  
MSc Business Analytics  
United Kingdom
