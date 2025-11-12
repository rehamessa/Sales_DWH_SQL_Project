--Calculate the total sales for each month 
--the runing total sales over time
SELECT 
ORDER_DATE,
SUM(sales_amount)OVER(ORDER BY ORDER_DATE) AS runing_total_sales,
AVG(avg_price)OVER(ORDER BY ORDER_DATE) AS runing_AVG_PRICE
FROM(
	SELECT
	Datetrunc(YEAR,order_date)AS order_date,
	SUM(sales_amount) AS sales_amount,
	AVG(Price) AS avg_price
	FROM
	gold.fact_sales
	WHERE Datetrunc(YEAR,order_date) IS NOT NULL
	GROUP BY Datetrunc(YEAR,order_date)
)t
