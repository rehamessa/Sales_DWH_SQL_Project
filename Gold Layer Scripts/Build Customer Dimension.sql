CREATE VIEW gold.dim_customer AS
    ---Build Dimension Customer
    -- Data Ingegration for Gender
    --Applied A friendly Naming Rule
    --Create Surget Key
    SELECT  ROW_NUMBER()OVER(ORDER BY CST_ID) AS customer_key 
        ,CI.cst_id AS customer_id
        ,CI.cst_key AS customer_number
        ,CI.cst_firstname AS first_name
        ,CI.cst_lastname AS last_name
        ,CI.cst_marital_status AS marital_status
        ,CASE WHEN CI.cst_gndr !='N/A' Then CI.cst_gndr ---CRM IS THE MASTER
        ELSE COALESCE(CA.GEN,'N/A')
        END AS gender
        ,CI.cst_create_date AS create_date
        ,CA.BDATE AS birthdate
      
        ,LA.CNTRY AS country
      
     
    FROM Silver.crm_cust_info AS CI
    LEFT JOIN 
    Silver.ERP_CUST_AZ12 AS CA
    ON CI.cst_key=CA.CID
    LEFT JOIN
    SILVER.ERP_LOC_A101 AS LA
    ON CI.cst_key=LA.CID
