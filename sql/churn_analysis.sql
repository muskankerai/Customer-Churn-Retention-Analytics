USE customer_churn;

SELECT COUNT(*) AS total_rows
FROM customer_churn;
SELECT *
FROM customer_churn
LIMIT 10;
SELECT COUNT(DISTINCT customerID) AS total_customers
FROM customer_churn;
SELECT COUNT(DISTINCT customerID) AS total_customers
FROM customer_churn;
SELECT COUNT(DISTINCT customerID) AS retained_customers
FROM customer_churn
WHERE Churn = 'No';
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn;
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS retention_rate_percent
FROM customer_churn;
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate_percent DESC;
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
GROUP BY InternetService
ORDER BY churn_rate_percent DESC;
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate_percent DESC;
SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
GROUP BY gender
ORDER BY churn_rate_percent DESC;
SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
GROUP BY SeniorCitizen
ORDER BY churn_rate_percent DESC;
SELECT
    TenureGroup,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customer_churn
GROUP BY TenureGroup
ORDER BY TenureGroup;
SELECT
    Churn,
    ROUND(AVG(tenure), 2) AS average_tenure
FROM customer_churn
GROUP BY Churn;
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS average_monthly_charges
FROM customer_churn
GROUP BY Churn;
SELECT
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_at_risk
FROM customer_churn
WHERE Churn = 'Yes';
SELECT
    Churn,
    MIN(MonthlyCharges) AS min_monthly_charge,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge,
    MAX(MonthlyCharges) AS max_monthly_charge
FROM customer_churn
GROUP BY Churn;
SELECT
    customerID,
    Contract,
    InternetService,
    MonthlyCharges,
    tenure,
    Churn
FROM customer_churn
WHERE MonthlyCharges >= 80
ORDER BY MonthlyCharges DESC;
SELECT
    COUNT(*) AS month_to_month_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
WHERE Contract = 'Month-to-month';
SELECT
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
GROUP BY TechSupport
ORDER BY churn_rate_percent DESC;
SELECT
    OnlineSecurity,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
GROUP BY OnlineSecurity
ORDER BY churn_rate_percent DESC;
SELECT
    PaperlessBilling,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
GROUP BY PaperlessBilling
ORDER BY churn_rate_percent DESC;
SELECT
    Dependents,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
GROUP BY Dependents
ORDER BY churn_rate_percent DESC;
SELECT
    Partner,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
GROUP BY Partner
ORDER BY churn_rate_percent DESC;
SELECT DISTINCT RiskSegment
FROM customer_churn;
SELECT
    customerID,
    Contract,
    tenure,
    MonthlyCharges,
    InternetService,
    PaymentMethod,
    Churn,
    RiskSegment
FROM customer_churn
WHERE RiskSegment = 'High Risk'
ORDER BY MonthlyCharges DESC;
SELECT
    Contract,
    COUNT(*) AS customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(tenure), 2) AS avg_tenure
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate_percent DESC;