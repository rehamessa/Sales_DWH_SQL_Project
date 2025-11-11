--which 5 products genarate the highest revenue?

SELECT 
	TOP 5
	p.product_name,
	sum(f.sales_amount) As total_revenue
FROM gold.fact_sales f
LEFT JOIN 
gold.dim_products p
ON f.product_key =p.product_key
GROUP BY p.product_name
ORDER BY sum(f.sales_amount) DESC

---Another way
SELECT * 
FROM(
	SELECT 
	
		p.product_name,
		sum(f.sales_amount) As total_revenue,
		ROW_NUMBER()OVER(ORDER BY sum(f.sales_amount) DESC) AS RANKPR
	FROM gold.fact_sales f
	LEFT JOIN 
	gold.dim_products p
	ON f.product_key =p.product_key
	GROUP BY p.product_name) t
WHERE RANKPr<=5



--What is the lowest 5 products genarate the highest revenue?
SELECT 
	TOP 5
	p.product_name,
	sum(f.sales_amount) As total_revenue
FROM gold.fact_sales f
LEFT JOIN 
gold.dim_products p
ON f.product_key =p.product_key
GROUP BY p.product_name
ORDER BY sum(f.sales_amount) ASC

--find the top 10 customer genarte the revenue
SELECT TOP 10
	c.customer_id,
	c.first_name,
	c.last_name,
	sum(f.sales_amount) As total_revenue
FROM gold.fact_sales f
LEFT JOIN 
gold.dim_customer c
ON f.customer_key =c.customer_key
GROUP BY c.customer_id,
	c.first_name,
	c.last_name
ORDER BY sum(f.sales_amount) DESC;