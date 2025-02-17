# Retail Sales Analysis Using SQL
## Project Overview
This project showcases essential SQL skills and techniques commonly used by data analysts to explore, clean, and analyze retail sales data. It involves setting up a retail sales database, conducting exploratory data analysis (EDA), and using SQL queries to answer key business questions. Ideal for beginners in data analysis, this project helps build a strong foundation in SQL.

## Objectives
1. **Set up a Retail Sales Database**: Create and populate a retail sales database using the provided sales data.
2. **Data Cleaning**: Detect and remove records containing missing or null values.
3. **Exploratory Data Analysis (EDA)**: Conduct basic EDA to gain a clear understanding of the dataset.
4. **Business Analysis**: Leverage SQL queries to answer key business questions and extract meaningful insights from the sales data.

## Project Structure
### 1. Database Setup
- **Database Creation**: The project starts by creating a database named `SQL_Project`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.
```SQL
CREATE DATABASE SQL_Project;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```
### 2. Data Exploration & Cleaning
- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.
