/*
Project: Financial Transactions Fraud Analysis
Author: Kgopotso Msibi
Date: 07 July 2026
Description: This script investigates fraud patterns and identifies factors associated with fraudulent transactions.
*/
USE financial_transactions_db;

-- What is the overall fraud rate?
SELECT COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraudulent_transactions,
ROUND((SUM(is_fraud) * 100.0) / COUNT(*), 2) AS fraud_rate_percentage
FROM transactions;
-- Result: Total transactions 20000
-- Fraudulent transactions 304
-- Fraud rate 1.52%

-- How are fraudulent transaction amounts distributed?
SELECT CASE
WHEN transaction_amount < 100 THEN '0 - 99.99'
WHEN transaction_amount < 200 THEN '100 - 199.99'
WHEN transaction_amount < 300 then '200 - 299.99'
ELSE '300+'
END AS amount_range,
COUNT(*) AS fraudulent_transactions
FROM transactions
WHERE is_fraud = 1
GROUP BY amount_range
ORDER BY fraudulent_transactions DESC;
-- Result: Most fraudulent transactions fall within the 0–99.99 range.

-- Which transaction amount range has the highest fraud rate?
SELECT CASE
WHEN transaction_amount < 100 THEN '0 - 99.99'
WHEN transaction_amount < 200 THEN '100 - 199.99'
WHEN transaction_amount < 300 THEN '200 - 299.99'
ELSE '300+'
END AS amount_range,
COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraudulent_transactions,
ROUND((SUM(is_fraud) * 100.0) / COUNT(*), 2) AS fraud_rate_percentage
FROM transactions
GROUP BY amount_range
ORDER BY fraud_rate_percentage DESC;
-- Result: The 300+ amount range recorded the highest fraud rate (2.21%).

-- Which transaction type has the highest fraud rate?
SELECT transaction_type,
COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraudulent_transactions,
ROUND((SUM(is_fraud) * 100.0) / COUNT(*), 2) AS fraud_rate_percentage
FROM transactions
GROUP BY transaction_type
ORDER BY fraud_rate_percentage DESC;
-- Result: Fraud rates were similar across all transaction types.

-- Which device type has the highest fraud rate?
SELECT device_type,
COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraudulent_transactions,
ROUND((SUM(is_fraud) * 100.0) / COUNT(*), 2) AS fraud_rate_percentage
FROM transactions
GROUP BY device_type
ORDER BY fraud_rate_percentage DESC;
-- Result: POS devices recorded the highest fraud rate (2.84%).

-- Which transaction location has the highest fraud rate?
SELECT transaction_location,
COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraudulent_transactions,
ROUND((SUM(is_fraud) * 100.0) / COUNT(*), 2) AS fraud_rate_percentage
FROM transactions
GROUP BY transaction_location
ORDER BY fraud_rate_percentage DESC;
-- Result: Florida recorded the highest fraud rate (1.86%).

-- Do customers with more previous transactions have a higher fraud rate?
SELECT CASE
WHEN previous_transactions_count <= 15 THEN '0 - 15'
WHEN previous_transactions_count <= 30 THEN '16 - 30'
ELSE '31+'
END AS transaction_history,
COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraudulent_transactions,
ROUND((SUM(is_fraud) * 100.0) / COUNT(*), 2) AS fraud_rate_percentage
FROM transactions
GROUP BY transaction_history
ORDER BY fraud_rate_percentage DESC;
-- Result: Customers with 0–15 previous transactions recorded the highest fraud rate (1.75%).
-- Fraud rates decreased as transaction history increased.