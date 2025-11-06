SELECT sd.sls_ord_num AS order_Number
      ,pr.product_key
      ,cu.customer_key
      ,sd.sls_order_dt AS order_date
      ,sd.sls_ship_dt
      ,sd.sls_due_dt
      ,sd.sls_sales
      ,sd.sls_quantity
      ,sd.sls_price 

  FROM Silver.crm_sales_details AS sd
  LEFT JOIN gold.dim_products AS pr
  ON sd.sls_prd_key=pr.product_number
  LEFT JOIN gold.dim_customer AS cu
  ON sd.sls_cust_id=cu.customer_id
