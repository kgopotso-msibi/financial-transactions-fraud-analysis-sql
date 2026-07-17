/*
Project: Financial Transactions Fraud Analysis
Author: Kgopotso Msibi
Date: 06 July 2026
Description: This script analyzes customer transaction behavior to identify activity patterns that may support fraud detection.
*/
USE financial_transactions_db;

-- Which customers made the highest number of transactions?
SELECT customer_id,
COUNT(*) AS total_transactions
FROM transactions
GROUP BY customer_id
ORDER BY total_transactions DESC
LIMIT 10;
-- Result: The most active customer completed 10 transactions.
-- Transaction activity is distributed across many customers.

-- On average, how many previous transactions does a customer have?
SELECT ROUND(AVG(previous_transactions_count), 2) AS avg_previous_transactions
FROM transactions;
-- Result: Average previous transactions per customer: 24.59

-- What is the average number of transactions per customer?
SELECT
ROUND(AVG(total_transactions), 2) AS avg_transactions_per_customer
FROM (SELECT customer_id,
COUNT(*) AS total_transactions
FROM transactions
GROUP BY customer_id) AS customer_transactions;
-- Result: Average transactions per customer: 2.50