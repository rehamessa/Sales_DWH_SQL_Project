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

SELECT
*
FROM gold.fact_sales