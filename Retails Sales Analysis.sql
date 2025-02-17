CREATE TABLE retail_sales(
	transactions_id	INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,	
	customer_id	INT,
	gender VARCHAR(20),
	age	INT,
	category VARCHAR(20),	
	quantity INT,
	price_per_unit FLOAT,
	cogs FLOAT,
	total_sale FLOAT
)

SELECT * FROM retail_sales