/*
Project: Financial Transactions Fraud Analysis
Author: Kgopotso Msibi
Date: 03 July 2026
Description:
This script performs data quality checks on the financial transactions dataset before analysis.
*/
USE financial_transactions_db;

-- Total number of transactions
SELECT COUNT(*) AS total_transactions
FROM transactions;
-- Result: 20000 transactions

-- Are there any missing values in the dataset?
SELECT
SUM(transaction_id IS NULL) AS missing_transaction_id,
SUM(customer_id IS NULL) AS missing_customer_id,
SUM(transaction_amount IS NULL) AS missing_transaction_amount,
SUM(transaction_type IS NULL) AS missing_transaction_type,
SUM(transaction_time IS NULL) AS missing_transaction_time,
SUM(transaction_location IS NULL) AS missing_transaction_location,
SUM(device_type IS NULL) AS missing_device_type,
SUM(previous_transactions_count IS NULL) AS missing_previous_transactions_count,
SUM(is_fraud IS NULL) AS missing_is_fraud
FROM transactions;
-- Result: No missing values were found.

-- Are there any duplicate transaction ids?
SELECT transaction_id,
COUNT(*) AS occurrences
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;
-- Result: No duplicate transaction ids were found.

-- Are the fraud labels valid?
SELECT is_fraud,
COUNT(*) AS total_transactions
FROM transactions
GROUP BY is_fraud;
-- Result: Legitimate transactions: 19696, fraudulent transactions: 304