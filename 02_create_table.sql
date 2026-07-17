CREATE TABLE transactions (
    transaction_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    transaction_amount DECIMAL(10,2),
    transaction_type VARCHAR(50),
    transaction_time DATETIME,
    transaction_location VARCHAR(100),
    device_type VARCHAR(50),
    previous_transactions_count INT,
    is_fraud BOOLEAN );