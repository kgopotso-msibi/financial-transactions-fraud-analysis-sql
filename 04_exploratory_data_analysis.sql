/*
Project: Financial Transactions Fraud Analysis
Author: Kgopotso Msibi
Date: 04 July 2026
Description: This script explores the financial transactions dataset to understand its overall characteristics before focusing on fraud.
*/
USE financial_transactions_db;

-- Which transaction type is the most common? 
SELECT transaction_type, 
COUNT(*) AS total_transactions
FROM transactions
GROUP BY transaction_type
ORDER BY total_transactions DESC;
-- Result: Payment is the most common transaction type, while transfer is the least common.

-- Which device type is used most?
SELECT device_type,
COUNT(*) AS total_transactions
FROM transactions
GROUP BY device_type
ORDER BY total_transactions DESC;
-- Result: Mobile is the most frequently used device, while POS is the least used.

-- Which location has the highest number of transactions?
SELECT transaction_location,
COUNT(*) AS total_transactions
FROM transactions
GROUP BY transaction_location
ORDER BY total_transactions DESC;
-- Result: California has the highest number of transactions (2938), while Illinois has the lowest (2795).

-- What is the total value of all transactions?
SELECT SUM(transaction_amount) AS total_transaction_value
FROM transactions;
-- Result: the total value of all transactions is 1996031.35

-- What is the average transaction amount?
SELECT ROUND(AVG(transaction_amount), 2) AS avg_transaction_amount
FROM transactions;
-- Result: average transaction amount is 99.80

-- What are the minimum and maximum transaction amounts?
SELECT MIN(transaction_amount) AS min_transaction_amount,
MAX(transaction_amount) AS max_transaction_amount
FROM transactions;
-- Result: the min transaction amount is 0.00, while the max transaction amount is 949.57

-- Why is the minimum transaction amount 0.00?
SELECT *
FROM transactions
WHERE transaction_amount = 0;
-- Result: two transactions had an amount of 0.00, these transactions are unusual and may require further investigation.

-- How are transaction amounts distributed?
SELECT CASE
WHEN transaction_amount < 100 THEN '0 - 99.99'
WHEN transaction_amount < 200 THEN '100 - 199.99'
WHEN transaction_amount < 300 THEN '200 - 299.99'
ELSE '300+'
END AS amount_range,
COUNT(*) AS total_transactions
FROM transactions
GROUP BY amount_range
ORDER BY total_transactions DESC;
-- Result: most transactions (12701) fall within the 0–99.99 range.

