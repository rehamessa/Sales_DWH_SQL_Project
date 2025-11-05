--CREATE VIEW
CREATE VIEW gold.dim_products AS
-- git only the current product
--Create surrget Key
SELECT
       ROW_NUMBER()OVER(ORDER BY pn.prd_start_dt ,pn.prd_id ) AS Product_key
       ,pn.prd_id AS product_id
      ,pn.cat_id AS Catgory_id
      ,pn.prd_key AS product_number
      ,pn.prd_nm  AS product_name
      ,pn.prd_cost AS cost
      ,pn.prd_line AS product_line
      ,pn.prd_start_dt AS start_date
      ,pc.CAT AS category
      ,pc.MAINTENANCE
      ,pc.SUBCAT AS subcategory
      
  FROM Silver.crm_prd_info AS pn
  LEFT JOIN
  SILVER.ERP_PX_CAT_G1V2 AS PC
  ON pn.cat_id=PC.ID
  WHERE prd_end_dt IS NULL -- FILTER OUT HISTORICAL DATA

