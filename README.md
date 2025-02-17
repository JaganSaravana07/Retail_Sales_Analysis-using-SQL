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
```SQl
--Data Cleaning & Exploration
SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

select COUNT(*) as Total_Sales FROM retail_sales 

SELECT COUNT(DISTINCT customer_id) as Unique_Customer FROM retail_sales 

SELECT DISTINCT category FROM retail_sales
```
### 3. Data Analysis & Findings
**The following SQL queries were developed to answer specific business questions:**
**1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:**
```SQL
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';
```
**2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**
```SQL
SELECT * FROM retail_sales
WHERE category = 'Clothing' AND quantity >= 4 AND TO_CHAR(sale_date, 'yyyy-mm') = '2022-11'
```
**3. Write a SQL query to calculate the total sales (total_sale) for each category.**
```SQL
SELECT category, SUM(total_sale) as Total_Sales FROM retail_sales
GROUP BY category;
```
**4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**
```SQL
SELECT ROUND(AVG(age),2) FROM retail_sales
WHERE category = 'Beauty';
```
**5. Write a SQL query to find all transactions where the total_sale is greater than 1000.**
```SQL
SELECT * FROM retail_sales
WHERE total_sale >= 1000;
```
**6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**
```SQL
SELECT COUNT(*) as Tot_Trans, gender,  category 
FROM retail_sales
group by gender, category
order by 3;
```
**7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**
```SQL
SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1
```
**8. Write a SQL query to find the top 5 customers based on the highest total sales**
```SQL
SELECT customer_id, SUM(total_sale) as total_sales FROM retail_sales
GROUP BY customer_id
ORDER BY 2 DESC
LIMIT 5;
```
**9. Write a SQL query to find the number of unique customers who purchased items from each category.**
```SQl
SELECT COUNT(DISTINCT customer_id) as unique_cust, category 
FROM retail_sales
group by 2;
```
**10. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**
```SQL
WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift
```
### Findings
- **Customer Demographics**: The dataset covers customers from various age groups, with sales spread across different categories like Clothing and Beauty.
- **High-Value Transactions**: Multiple transactions exceeded a total sale amount of 1000, indicating premium purchases.
- **Sales Trends**: Monthly sales analysis reveals fluctuations, helping identify peak seasons.
- **Customer Insights**: The analysis highlights top-spending customers and the most popular product categories.

### Reports
- **Sales Summary**: A comprehensive report detailing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into monthly sales trends and shifts.
- **Customer Insights**: Reports featuring top customers and unique customer counts by category.

### Conclusion
This project provides a thorough introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The insights gained help businesses understand sales patterns, customer behavior, and product performance, supporting data-driven decision-making.











