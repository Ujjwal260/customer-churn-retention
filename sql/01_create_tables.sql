CREATE DATABASE IF NOT EXISTS telco_churn;
USE telco_churn;

DROP TABLE IF EXISTS telco_cleaned;
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
  Churn             VARCHAR(5)
);

DROP TABLE IF EXISTS telco_scored;
CREATE TABLE telco_scored (
  customerID            VARCHAR(20),
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
  Churn                 VARCHAR(5),

  churn_probability     DECIMAL(8,6),
  churn_flag            TINYINT,
  risk_segment          VARCHAR(20),
  recommended_action    VARCHAR(120),

  PRIMARY KEY (customerID)
);

