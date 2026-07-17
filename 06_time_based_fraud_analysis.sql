/*
Project: Financial Transactions Fraud Analysis
Author: Kgopotso Msibi
Date: 07 July 2026
Description: This script analyzes transaction timing to identify temporal patterns associated with fraudulent transactions.
*/
USE financial_transactions_db;

-- At what hour of the day do the most fraudulent transactions occur?
SELECT HOUR(transaction_time) AS transaction_hour,
COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraudulent_transactions,
ROUND((SUM(is_fraud) * 100) / COUNT(*), 2) AS fraud_rate_percentage
FROM transactions
GROUP BY HOUR(transaction_time)
ORDER BY fraud_rate_percentage DESC;
-- Result: The highest fraud rate occurred at 23:00 (2.31%), followed by 21:00 (2.06%).
-- Fraud rates were generally higher during the late evening and early morning hours.

-- On which day of the week do fraudulent transactions occur most often?
SELECT DAYNAME(transaction_time) AS transaction_weekday,
COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraudulent_transactions,
ROUND((SUM(is_fraud) * 100) / COUNT(*), 2) AS fraud_rate_percentage
FROM transactions
GROUP BY DAYNAME(transaction_time)
ORDER BY fraud_rate_percentage DESC;
-- Result: Saturday recorded the highest fraud rate (1.95%), while Monday recorded the lowest (0.98%).

-- Are fraudulent transactions more common during business hours or overnight?
SELECT CASE
WHEN HOUR(transaction_time) BETWEEN 8 AND 16 THEN 'Business Hours'
ELSE 'Overnight'
END AS time_period,
COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraudulent_transactions,
ROUND((SUM(is_fraud) * 100) / COUNT(*), 2) AS fraud_rate_percentage
FROM transactions
GROUP BY time_period
ORDER BY fraud_rate_percentage DESC;
-- Result: Business hours: 1.55%, Overnight: 1.50%

-- Which month has the highest fraud rate?
SELECT MONTHNAME(transaction_time) AS transaction_month,
COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraudulent_transactions,
ROUND((SUM(is_fraud) * 100) / COUNT(*), 2) AS fraud_rate_percentage
FROM transactions
GROUP BY transaction_month
ORDER BY fraud_rate_percentage DESC;
-- Result: The dataset contains transactions from only one month, so monthly fraud trends cannot be evaluated.