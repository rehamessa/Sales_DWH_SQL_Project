SELECT
        sls_ord_num
      ,sls_prd_key
      ,sls_cust_id
      ,sls_order_dt
      ,sls_ship_dt
      ,sls_due_dt
      ,sls_sales
      ,sls_quantity
      ,sls_price
  FROM dwh_sales.bronze.crm_sales_details
  WHERE sls_prd_key NOT IN (SELECT prd_key  from Silver.crm_prd_info)-- checking ID Quality
   OR sls_cust_id NOT IN (SELECT cst_id from Silver.crm_cust_info)-- checking ID Quality
