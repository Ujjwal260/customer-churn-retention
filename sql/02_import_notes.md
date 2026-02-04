# 02_import_notes.md
## Importing CSVs into MySQL Workbench (telco_churn)

This project loads two CSV files into MySQL:

1. `telco_cleaned_with_id.csv`  -> table `telco_cleaned`
2. `churn_scored_customers.csv` -> table `telco_scored`

### Recommended import method (Workbench Wizard)
1. Open MySQL Workbench and connect to your instance
2. Run: `USE telco_churn;`
3. In the left panel, right-click schema `telco_churn`
4. Choose **Table Data Import Wizard**
5. Select your CSV
6. Choose **Use existing table** and pick the correct table
7. Confirm delimiter = comma, header row present
8. Finish

### If Workbench Wizard fails
Workbench may throw errors like:
- `Unknown column 'None' in 'field list'`
- `Error Code: 2068 ... restrictions on access`

In that case, use **secure_file_priv** import.

#### Step A: Find secure import folder
Run:
```sql
SHOW VARIABLES LIKE 'secure_file_priv';# 02_import_notes.md
## Importing CSVs into MySQL Workbench (telco_churn)

This project loads two CSV files into MySQL:

1. `telco_cleaned_with_id.csv`  -> table `telco_cleaned`
2. `churn_scored_customers.csv` -> table `telco_scored`

### Recommended import method (Workbench Wizard)
1. Open MySQL Workbench and connect to your instance
2. Run: `USE telco_churn;`
3. In the left panel, right-click schema `telco_churn`
4. Choose **Table Data Import Wizard**
5. Select your CSV
6. Choose **Use existing table** and pick the correct table
7. Confirm delimiter = comma, header row present
8. Finish

### If Workbench Wizard fails
Workbench may throw errors like:
- `Unknown column 'None' in 'field list'`
- `Error Code: 2068 ... restrictions on access`

In that case, use **secure_file_priv** import.

#### Step A: Find secure import folder
Run:
```sql
SHOW VARIABLES LIKE 'secure_file_priv';


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/churn_scored_customers.csv'
INTO TABLE telco_scored
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT COUNT(*) FROM telco_cleaned;
SELECT COUNT(*) FROM telco_scored;

SELECT * FROM telco_scored LIMIT 5;
