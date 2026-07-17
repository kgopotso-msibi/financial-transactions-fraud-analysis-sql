**Financial Transactions Fraud Analysis using SQL**

**Project Overview**

This project analyzes a financial transactions dataset using SQL to identify patterns associated with fraudulent transactions. The analysis explores customer behavior, transaction characteristics, and time-based trends to generate insights that could help financial institutions improve fraud detection and reduce financial losses.

**Business Problem**

Financial institutions process thousands of transactions every day, making it challenging to identify fraudulent activity quickly and accurately.

The objective of this project is to analyze transaction data and identify patterns associated with fraudulent transactions. The insights generated can help financial institutions strengthen fraud detection strategies, improve risk monitoring, and support data-driven decision-making.

**Dataset**

This project uses a synthetic financial transactions dataset from Kaggle containing **20,000 transactions**.

Key fields

- Transaction ID
- Customer ID
- Transaction Amount
- Transaction Type
- Transaction Time
- Transaction Location
- Device Type
- Previous Transaction Count
- Fraud Indicator (`0 = Legitimate`, `1 = Fraud`)

**Project Objectives**

This project aims to:

- Calculate the overall fraud rate.
- Explore transaction characteristics and customer behavior.
- Identify fraud patterns based on transaction amount, location, device type, and transaction history.
- Analyze time-based fraud trends.
- Demonstrate advanced SQL techniques, including Common Table Expressions (CTEs) and window functions.

**Tools Used**

- MySQL
- MySQL Workbench
- Git
- GitHub

**Project Structure**

| File | Description |
|------|-------------|
| `01_create_database.sql` | Creates the project database. |
| `02_create_table.sql` | Creates the transactions table. |
| `03_data_quality_checks.sql` | Validates data quality before analysis. |
| `04_exploratory_data_analysis.sql` | Explores the overall characteristics of the dataset. |
| `05_customer_behavior_analysis.sql` | Analyzes customer activity and transaction history. |
| `06_time_based_fraud_analysis.sql` | Investigates fraud patterns by hour, weekday, and time period. |
| `07_fraud_analysis.sql` | Identifies fraud patterns across transaction amount, device type, location, and customer history. |
| `08_advanced_sql.sql` | Demonstrates advanced SQL techniques using CTEs, window functions, and analytical queries. |

**Key Business Questions**

This project answers the following business questions:

- What is the overall fraud rate?
- Which transaction amount ranges have the highest fraud rates?
- Which transaction types, device types, and locations are associated with higher fraud rates?
- At what time of day and on which day of the week do fraudulent transactions occur most often?
- How does customer transaction history relate to fraud?
- Which customers recorded the highest fraudulent transaction values?
- Which customers have more than one fraudulent transaction?

**Key Findings**

- The overall fraud rate was **1.52%** (304 fraudulent transactions out of 20,000).
- Transactions valued at **300+** recorded the highest fraud rate (**2.21%**).
- **POS devices** had the highest fraud rate (**2.84%**) among all device types.
- **Florida** recorded the highest fraud rate (**1.86%**) among all transaction locations.
- Fraud rates were highest during the **late evening hours**, peaking at **23:00 (2.31%)**.
- **Saturday** recorded the highest fraud rate (**1.95%**) among all weekdays.
- Customers with **0–15 previous transactions** had the highest fraud rate (**1.75%**).
- Only **two customers** recorded more than one fraudulent transaction.

**SQL Skills Demonstrated**

Throughout this project, I applied the following SQL concepts:

- Data quality validation
- Data aggregation (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)
- Conditional logic using `CASE`
- Filtering with `WHERE` and `HAVING`
- Sorting and grouping (`ORDER BY`, `GROUP BY`)
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions (`RANK()`, `ROW_NUMBER()`, `LAG()`)
- Business-focused data analysis

**Business Recommendations**

Based on the analysis, financial institutions could consider:

- Prioritizing additional verification for high-value transactions.
- Increasing monitoring of transactions made through POS devices.
- Applying enhanced fraud detection during higher-risk hours, particularly in the late evening.
- Incorporating customer transaction history into fraud risk assessment models.
- Continuously monitoring fraud trends as new transaction data becomes available.

**About Me**

Hi, I'm **Kgopotso Msibi**, an aspiring Data Analyst with a passion for using data to solve business problems.

This project demonstrates my ability to use SQL to clean, explore, analyze, and interpret data while generating actionable business insights. I am continuously building my skills in SQL, Excel, Power BI, and data analytics through hands-on projects and continuous learning.

Feel free to connect with me on LinkedIn www.linkedin.com/in/kgopotso-msibi-655b60180
