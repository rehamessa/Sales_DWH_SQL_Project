--Which categories contribute the most overall sales
WITH category_sales AS(
SELECT 
category,
SUM(sales_amount) AS total_sales
FROM gold.Fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key=p.Product_key
GROUP BY category
)

	SELECT category,
	total_sales,
	SUM(total_sales)over() AS All_Sales,
CONCAT(ROUND((Cast(total_sales AS FLOAT)/SUM(total_sales)over())*100,2) ,'%')AS percentage_fromAll
	FROM category_sales
	ORDER BY total_sales DESC;