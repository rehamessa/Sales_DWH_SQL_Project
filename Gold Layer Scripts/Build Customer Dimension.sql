---Build Dimension Customer
-- Data Ingegration for Gender
SELECT CI.cst_id
      ,CI.cst_key
      ,CI.cst_firstname
      ,CI.cst_lastname
      ,CI.cst_marital_status
      ,CASE WHEN CI.cst_gndr !='N/A' Then CI.cst_gndr ---CRM IS THE MASTER
        ELSE COALESCE(CA.GEN,'N/A')
        END AS NEW_GEN
      ,CI.cst_create_date
      ,CA.BDATE
      
      ,LA.CNTRY
      
     
  FROM Silver.crm_cust_info AS CI
  LEFT JOIN 
  Silver.ERP_CUST_AZ12 AS CA
  ON CI.cst_key=CA.CID
  LEFT JOIN
  SILVER.ERP_LOC_A101 AS LA
  ON CI.cst_key=LA.CID
  