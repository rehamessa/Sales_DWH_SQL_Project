CREATE VIEW gold.PProduct_report AS

/*
Product Report

Purpose


report consolidates key product metrics and behaviors
Highlights:
1. Gathers essential fields such as product name, category, subcategory, and cost
2. Segments products by revenue to identify High-Performers, Mid-Range, or Low-Performers.
3. Aggregates product-level metrics
- total orders
- total sales
- total quantity sold
- total customers (unique)
- lifespan (in months)
4. Calculates valuable KPIs:

- recency (months sin@plast sale)
- average order


*/

----------------------------------------
---BASE QUERY :retreive core column from fact_sales and dim_products
---



WITH base_query AS(
SELECT f.order_Number,
	f.order_date,
	f.customer_key,
	f.sales_amount,
	f.quantity,
	p.Product_key,
	p.product_name,
	p.category,
	p.subcategory,
	p.cost 
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON F.product_key=P.Product_key
WHERE f.order_date IS NOT NULL
)


/*3. Aggregates product-level metrics
- total orders
- total sales
- total quantity sold
- total customers (unique)
- lifespan (in months)*/

,product_aggergation AS(
	SELECT 
		Product_key,
		product_name,
		category,
		subcategory,
		COST,
		COUNT(DISTINCT order_Number ) AS total_orders,
		SUM(sales_amount) AS total_sales,
		SUM(Quantity) AS total_quantity_sold,
		COUNT(DISTINCT customer_key) AS total_customers,
		DATEDIFF(MONTH,MIN(ORDER_DATE),MAX(ORDER_DATE)) AS lifespan,
		MAX(order_date) AS last_sales_date,
		ROUND(AVG(CAST(sales_amount AS FLOAT)/NULLIF(Quantity,0)),2) AS avg_selling_price
	FROM base_query
	GROUP BY Product_key,
		product_name,
		category,
		subcategory,
		COST )

/*2. Segments products by revenue to identify High-Performers, Mid-Range, or Low-Performers.
- recency (months sin@plast sale)
- average order*/
SELECT 
Product_key,
		product_name,
		category,
		subcategory,
		COST,
		last_sales_date,
		DATEDIFF(MONTH,last_sales_date,GETDATE()) AS recency,
		total_orders,
		total_sales,
		CASE WHEN total_sales>5000 THEN 'High-Performers'
		WHEN total_sales>=1000 THEN 'Mid-Range'
		ELSE 'Low-Performers'
		END AS product_segment,
		total_quantity_sold,
		total_customers,
		lifespan,
		avg_selling_price,
		CASE WHEN total_sales = 0 then 0
		ELSE total_sales/total_orders 
		END AS Average_order_revenue,
		CASE WHEN lifespan=0 THEN total_sales
		ELSE total_sales/lifespan
		END AS Average_monthly_revenue
FROM product_aggergation