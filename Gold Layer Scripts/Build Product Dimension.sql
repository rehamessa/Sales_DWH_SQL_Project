-- git only the current product
SELECT pn.prd_id
      ,pn.cat_id
      ,pn.prd_key
      ,pn.prd_nm
      ,pn.prd_cost
      ,pn.prd_line
      ,pn.prd_start_dt
      ,pn.prd_end_dt
      ,pc.CAT
      ,pc.MAINTENANCE
      ,pc.SUBCAT
      
  FROM Silver.crm_prd_info AS pn
  LEFT JOIN
  SILVER.ERP_PX_CAT_G1V2 AS PC
  ON pn.cat_id=PC.ID
  WHERE prd_end_dt IS NULL -- FILTER OUT HISTORICAL DATA

