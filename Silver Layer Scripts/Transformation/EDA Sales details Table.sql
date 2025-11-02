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

---*************************************************
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
  WHERE sls_order_dt <=0 or len(sls_order_dt) !=8 -- checking date Quality

  -----*** Checking Invalid date 
  SELECT
    *
  FROM dwh_sales.bronze.crm_sales_details
  WHERE sls_order_dt > sls_ship_dt OR sls_order_dt>sls_due_dt

  --***checking data consistency
  ----** Sale =Quantity * Price
  SELECT
  sls_sales
      ,sls_quantity
      ,sls_price
  FROM dwh_sales.bronze.crm_sales_details
  WHERE   sls_sales != sls_quantity * sls_price 
  OR 
  sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
  OR 
   sls_sales <=0 OR sls_quantity <=0 OR sls_price <=0

