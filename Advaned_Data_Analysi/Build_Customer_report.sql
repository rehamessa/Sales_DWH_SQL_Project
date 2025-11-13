------------------------------------
CREATE VIEW gold.customer_report AS 

	/*
	Customer Report

	Purpos:

	This report consol

	jates key customer metrics

	Highlights:
	1. Gathers essential fields such as names, ages, and transaction details.
	2. Segments customers into categories (VIP, Regular, New) and age groups.
	3. Aggregates customer-level metrics:
	- total orders
	- total sales
	- total quantity purchased
	- total products
	- lifespan (in months)
	4. Calculates valuable KPIs:
	- recency (months since last order)
	- average order value
	- average monthly spend
	*/


	---------------------------------------------------------
	---base query
	---------------------------------------------------------
	WITH base_query AS(
		SELECT 
		f.order_Number,
		f.product_key,
		f.order_date,
		f.sales_amount,
		f.quantity,
		c.customer_key,
		c.customer_number,
		CONCAT(c.first_name,' ',c.last_name) AS full_name,
		DATEDIFF(YEAR,C.birthdate,GETDATE()) AS AGE
		FROM gold.fact_sales f
		LEFT JOIN gold.dim_customer c
		ON f.customer_key =c.customer_key
		WHERE order_date IS NOT NULL
	)
	-------------------------------
	/*3. Aggregates customer-level metrics:
	- total orders
	- total sales
	- total quantity purchased
	- total products
	- lifespan (in months)
	*/
	-----------------------------------------*******************
	, customer_Aggeregation AS(
		SELECT customer_key ,
				customer_number,
				full_name,
				AGE,
				COUNT(DISTINCT order_number) AS total_orders,
				SUM(sales_amount) AS total_sales,
				SUM(quantity) AS total_quantity_purchased,
				COUNT(DISTINCT product_key) AS total_products,
				MAX(order_date) AS last_order_date,
				DATEDIFF(MONTH,Min(order_date),MAX(order_date)) AS life_span
		FROM base_query
		GROUP BY customer_key ,
				customer_number,
				full_name,
				AGE
		)
	/*2. Segments customers into categories (VIP, Regular, New) and age groups
	4. Calculates valuable KPIs:
	- recency (months since last order)
	- average order value
	- average monthly spend
	.*/
	SELECT customer_key ,
				customer_number,
				full_name,
				AGE,
				CASE WHEN AGE<20 THEN 'under 20'
				WHEN Age between 20 AND 39THEN '20-39'
				WHEN Age between 40 AND 59THEN '40-59'
				ELSE '60 OR above'
				END AS Age_sements,
				 total_orders,
				 total_sales,
				 total_quantity_purchased,
				 total_products,
				 last_order_date,
				 DATEDIFF(month,last_order_date,getdate()) AS recency,
				 life_span,
				 CASE WHEN life_span >=12 AND total_sales>5000 THEN 'VIP'
				 WHEN life_span >=12 AND total_sales<=5000 THEN 'Regulary'
				 ELSE 'NEW'
				 END AS Customer_segment,

				 CASE WHEN total_sales =0 then 0
				 ELSE total_sales/total_orders
				 END AS average_order_value,

				 CASE WHEN life_span=0 THEN life_span
				 ELSE total_sales/life_span 
				 END AS average_monthly_spend
	FROM customer_Aggeregation
