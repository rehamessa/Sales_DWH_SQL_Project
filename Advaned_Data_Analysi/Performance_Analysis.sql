/* Analze the yearly performance of the  products by comparing their sales to both 
the average sales perdormance of the products and the previos year's sales */

WITH YEARLY_PERFORMANCE_ANALYZE AS (
    SELECT
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS Current_sales
    FROM gold.dim_products p
    LEFT JOIN gold.fact_sales f
        ON p.product_key = f.product_key
    WHERE YEAR(f.order_date) IS NOT NULL
    GROUP BY p.product_name, YEAR(f.order_date)
)
SELECT 
    order_year,
    Current_sales,
    AVG(current_sales)over(partition by order_year) AS avg_sales,
    Current_sales - AVG(current_sales)over(partition by order_year) AS diff_avg,
    CASE WHEN Current_sales - AVG(current_sales)over(partition by order_year)<0 THEN 'above_avg'
        WHEN Current_sales - AVG(current_sales)over(partition by order_year)<0 THEN 'below_avg'
        ELSE'avg'
    END AVG_change,
    LAG(current_sales)OVER(PARTITION BY product_name ORDER BY order_year) AS perv_sales,
    Current_sales -LAG(current_sales)OVER(PARTITION BY product_name ORDER BY order_year) AS Diff_prev,
    CASE WHEN Current_sales - LAG(current_sales)OVER(PARTITION BY product_name ORDER BY order_year)<0 THEN 'Increase'
        WHEN Current_sales - LAG(current_sales)OVER(PARTITION BY product_name ORDER BY order_year)<0 THEN 'decrease'
        ELSE'no change'
    END py_change
FROM YEARLY_PERFORMANCE_ANALYZE;
