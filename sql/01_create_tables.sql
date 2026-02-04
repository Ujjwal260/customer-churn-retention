-- =========================================
-- 01_create_tables.sql
-- Database + table setup for Telco churn project
-- =========================================

CREATE DATABASE IF NOT EXISTS telco_churn;
USE telco_churn;

-- Drop tables if recreating (optional)
DROP TABLE IF EXISTS telco_cleaned;
DROP TABLE IF EXISTS telco_scored;

-- Cleaned base table (full dataset)
CREATE TABLE telco_cleaned (
  customerID        VARCHAR(20) PRIMARY KEY,
  gender            VARCHAR(10),
  SeniorCitizen     TINYINT,
  Partner           VARCHAR(5),
  Dependents        VARCHAR(5),
  tenure            INT,
  PhoneService      VARCHAR(5),
  MultipleLines     VARCHAR(30),
  InternetService   VARCHAR(30),
  OnlineSecurity    VARCHAR(30),
  OnlineBackup      VARCHAR(30),
  DeviceProtection  VARCHAR(30),
  TechSupport       VARCHAR(30),
  StreamingTV       VARCHAR(30),
  StreamingMovies   VARCHAR(30),
  Contract          VARCHAR(30),
  PaperlessBilling  VARCHAR(5),
  PaymentMethod     VARCHAR(50),
  MonthlyCharges    DECIMAL(10,2),
  TotalCharges      DECIMAL(12,2),
  Churn             VARCHAR(10)
);

-- Scored dataset table (model outputs)
CREATE TABLE telco_scored (
  customerID            VARCHAR(20) PRIMARY KEY,
  gender                VARCHAR(10),
  SeniorCitizen         TINYINT,
  Partner               VARCHAR(5),
  Dependents            VARCHAR(5),
  tenure                INT,
  PhoneService          VARCHAR(5),
  MultipleLines         VARCHAR(30),
  InternetService       VARCHAR(30),
  OnlineSecurity        VARCHAR(30),
  OnlineBackup          VARCHAR(30),
  DeviceProtection      VARCHAR(30),
  TechSupport           VARCHAR(30),
  StreamingTV           VARCHAR(30),
  StreamingMovies       VARCHAR(30),
  Contract              VARCHAR(30),
  PaperlessBilling      VARCHAR(5),
  PaymentMethod         VARCHAR(50),
  MonthlyCharges        DECIMAL(10,2),
  TotalCharges          DECIMAL(12,2),
  Churn                 VARCHAR(10),

  churn_probability     DECIMAL(10,6),
  churn_flag            TINYINT,
  risk_segment          VARCHAR(30),
  recommended_action    VARCHAR(150)
);

-- Helpful indexes (optional but good practice)
CREATE INDEX idx_scored_contract ON telco_scored(Contract);
CREATE INDEX idx_scored_risk ON telco_scored(risk_segment);
CREATE INDEX idx_scored_flag ON telco_scored(churn_flag);
