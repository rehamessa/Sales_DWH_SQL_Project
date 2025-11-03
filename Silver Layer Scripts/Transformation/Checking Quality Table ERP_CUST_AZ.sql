-- Identify BDATE Out Of Range Dates
SELECT 
      BDATE
  FROM dwh_sales.bronze.ERP_CUST_AZ12
  WHERE BDATE>GETDATE()