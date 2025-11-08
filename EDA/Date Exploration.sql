--find the date of the first and last date order
--How Many years of sales available
select min(order_date) as firstdate,
		min(order_date) as lastdate,
		DATEDIFF(MONTH,MIN(order_date),MAX(order_date)) As ragesmonths

FROM gold.fact_sales

--Find the Youngest and the oldest customer
SELECT
MIN(birthdate) As Ooldest_one,
DATEDIFF(YEAR,MIN(birthdate),GETDATE()) AS pldest_age,
MAX(birthdate) As Youngest_one,
DATEDIFF(YEAR,Max(birthdate),GETDATE()) AS Youngest_age

FROM gold.dim_customer