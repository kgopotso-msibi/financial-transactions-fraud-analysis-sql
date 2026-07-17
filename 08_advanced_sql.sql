/*
Project: Financial Transactions Fraud Analysis
Author: Kgopotso Msibi
Date: 15 July 2026
Description: This script demonstrates advanced SQL techniques, including Common Table Expressions (CTEs), window functions, and analytical queries to investigate fraudulent transactions.
*/

USE financial_transactions_db;

-- Which are the top 10 highest-value fraudulent transactions?
WITH ranked_fraud AS (
SELECT transaction_id,
customer_id,
transaction_amount,
transaction_type,
transaction_location,
device_type,
transaction_time,
RANK() OVER (ORDER BY transaction_amount DESC) AS fraud_rank
FROM transactions
WHERE is_fraud = 1)
SELECT *
FROM ranked_fraud
WHERE fraud_rank <= 10
ORDER BY fraud_rank;
-- Result: The highest fraudulent transaction amount was 664.10.
-- Displays the top 10 highest-value fraudulent transactions.

-- Which customers recorded the highest total value of fraudulent transactions?
WITH customer_fraud_totals AS (
SELECT customer_id,
SUM(transaction_amount) AS total_fraud_amount
FROM transactions
WHERE is_fraud = 1
GROUP BY customer_id)
SELECT customer_id,
total_fraud_amount,
RANK() OVER (ORDER BY total_fraud_amount DESC) AS fraud_rank
FROM customer_fraud_totals
ORDER BY fraud_rank
LIMIT 10;
-- Result: Customer C3058 recorded the highest total fraudulent amount (664.10).

-- What is the largest transaction made by each customer?
WITH ranked_transactions AS (
SELECT transaction_id,
customer_id,
transaction_amount,
transaction_type,
transaction_location,
device_type,
transaction_time,
ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_amount DESC) AS transaction_rank
FROM transactions)
SELECT transaction_id,
customer_id,
transaction_amount,
transaction_type,
transaction_location,
device_type,
transaction_time
FROM ranked_transactions
WHERE transaction_rank = 1
ORDER BY transaction_amount DESC;
-- Result: Displays the highest-value transaction recorded for each customer

-- How does each transaction compare to the customer's previous transaction?
SELECT customer_id,
transaction_time,
transaction_amount,
LAG(transaction_amount) OVER (PARTITION BY customer_id ORDER BY transaction_time) AS previous_transaction_amount
FROM transactions
ORDER BY customer_id, transaction_time;
-- Result: Displays each transaction alongside the customer's previous transaction amount.

-- Which customers have more than one fraudulent transaction?
SELECT customer_id,
COUNT(*) AS fraudulent_transactions
FROM transactions
WHERE is_fraud = 1
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY fraudulent_transactions DESC;
-- Result: Only two customers recorded more than one fraudulent transaction.

-- Which customers experienced an increase in transaction amount compared to their previous transaction?
WITH customer_transactions AS (
SELECT transaction_id,
customer_id,
transaction_time,
transaction_amount,
LAG(transaction_amount) OVER (PARTITION BY customer_id ORDER BY transaction_time) AS previous_transaction_amount
FROM transactions)
SELECT transaction_id,
customer_id,
transaction_time,
previous_transaction_amount,
transaction_amount,
(transaction_amount - previous_transaction_amount) AS increase_amount
FROM customer_transactions
WHERE previous_transaction_amount IS NOT NULL
AND transaction_amount > previous_transaction_amount
ORDER BY increase_amount DESC;
-- Result: Displays transactions where the current transaction amount is greater than the customer's previous transaction.