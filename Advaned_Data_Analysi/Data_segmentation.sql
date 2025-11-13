/* segment ach product into cost ranges
count how many fall into each segment */
WITH cost_segmenattion AS (
SELECT 
Product_key,
product_name,
COST,
CASE WHEN COST <100 then 'Below 100'
	WHEN cost between 100 and 500 then '100-500'
	WHEN cost BETWEEN 500 AND 1000 then '500-1000'
	ELSE 'above 1000'
END cost_range
FROM gold.dim_products)
SELECT 
cost_range,
count(product_key) AS total_products
 FROM cost_segmenattion
 GROUP BY cost_range
 ORDER BY count(product_key) DESC;


 /* Group customer into three segments based on their spending behvior:
	-VIP: customer with at least 12 months of the history and spending more than 5.000
	-Regulary : with at least 12 months of histor but spending 5000 or less.
	-New: customer with lifespan less than 12 months.
	And find the total custmer for each customer
	*/

WITH customer_spending AS(
		SELECT 
		C.customer_key,
		SUM(f.sales_amount) AS total_spending,
		Min(f.order_date) As first_date,
		MAX(f.order_date) AS last_date,
		DATEDIFF(MONTH,Min(f.order_date),MAX(f.order_date)) AS life_span

		FROM gold.fact_sales AS F 
		LEFT JOIN gold.dim_customer AS C
		ON F.customer_key=C.customer_key
		GROUP BY C.customer_key

)
SELECT Customer_segment,
		COUNT(customer_key) AS Total_customer

FROM(

SELECT customer_key,
CASE WHEN life_span >=12 AND total_spending>5000 THEN 'VIP'
	WHEN life_span >=12 AND total_spending<=5000 THEN 'Regulary'
	ELSE 'NEW'
END AS Customer_segment
FROM customer_spending)t
GROUP BY Customer_segment
ORDER BY Total_customer