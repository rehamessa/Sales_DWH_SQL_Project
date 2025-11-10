--find the total sales
SELECT SUM(sales_amount)AS Total_Sales FROM gold.fact_sales

--Find how many items are sold
SELECT SUM(quantity) AS total_quantity
FROM gold.fact_sales;

--find the average price
SELECT AVG(price) AS  Average_Price
FROM gold.fact_sales;

--Total number of order
SELECT COUNT(order_number) AS total_order
FROM gold.fact_sales;
SELECT  COUNT( distinct order_number) AS total_order
FROM gold.fact_sales;

-- Total number of Product
SELECT COUNT(product_id) AS total_product
from gold.dim_products

-- find the total number of customer

SELECT COUNT(customer_id) AS total_customer
from gold.dim_customer;

---find the total numer of customer that placed orders

SELECT COUNT(customer_key) AS total_customer
from gold.fact_sales;

--Generate a report that shows all keys metrics of the business
SELECT 'total_customer' AS measure_name ,COUNT(customer_key) AS measure_Value
from gold.fact_sales

UNION ALL
SELECT ' total_product' AS measure_name , COUNT(product_id) AS measure_Value
from gold.dim_products

UNION ALL
SELECT 'total_order' AS measure_name ,  COUNT(order_number) AS  measure_Value
FROM gold.fact_sales

UNION ALL

SELECT 'Average_Price' AS measure_name , AVG(price) AS   measure_Value
FROM gold.fact_sales
UNION ALL

SELECT 'total_quantity' AS measure_name , SUM(quantity) AS measure_Value
FROM gold.fact_sales;
