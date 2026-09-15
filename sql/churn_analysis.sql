-- Customer Churn & Retention Analytics
-- SQL Analysis

-- 1. Total Customers
SELECT COUNT(DISTINCT customerID) AS total_customers
FROM customer_churn;


-- 2. Churned Customers
SELECT COUNT(*) AS churned_customers
FROM customer_churn
WHERE Churn = 'Yes';


-- 3. Retained Customers
SELECT COUNT(*) AS retained_customers
FROM customer_churn
WHERE Churn = 'No';


-- 4. Churn Rate
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn;


-- 5. Churn by Contract Type
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;


-- 6. Churn by Internet Service
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;


-- 7. Churn by Payment Method
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


-- 8. Churn by Gender
SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY gender
ORDER BY churn_rate DESC;


-- 9. Average Monthly Charges by Churn
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS average_monthly_charges
FROM customer_churn
GROUP BY Churn;


-- 10. Average Tenure by Churn
SELECT
    Churn,
    ROUND(AVG(tenure), 2) AS average_tenure_months
FROM customer_churn
GROUP BY Churn;


-- 11. Revenue Associated with Churned Customers
SELECT
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_at_risk
FROM customer_churn
WHERE Churn = 'Yes';


-- 12. High Monthly Charge Customers
SELECT
    customerID,
    Contract,
    tenure,
    MonthlyCharges,
    Churn
FROM customer_churn
WHERE MonthlyCharges >= 70
ORDER BY MonthlyCharges DESC;


-- 13. Month-to-Month Customers with Churn
SELECT
    COUNT(*) AS month_to_month_churned_customers
FROM customer_churn
WHERE Contract = 'Month-to-month'
AND Churn = 'Yes';


-- 14. Senior Citizen Churn
SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY SeniorCitizen
ORDER BY churn_rate DESC;


-- 15. Customers with High Churn Risk
SELECT
    customerID,
    Contract,
    tenure,
    MonthlyCharges,
    InternetService,
    PaymentMethod,
    Churn
FROM customer_churn
WHERE Contract = 'Month-to-month'
AND tenure <= 12
AND MonthlyCharges >= 70
ORDER BY MonthlyCharges DESC;
