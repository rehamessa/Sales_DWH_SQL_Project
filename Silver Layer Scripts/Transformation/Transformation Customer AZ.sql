INSERT INTO Silver.ERP_CUST_AZ12(CID,BDATE,GEN)

--Handle BDATE Out Of Range Dates
-- Handle Consistency
SELECT 
       CASE WHEN CID LIKE 'NAS%' THEN SUBSTRING(CID,4,LEN(CID))
       ELSE CID
       END AS CID

      ,CASE WHEN BDATE>GETDATE() THEN NULL 
      ELSE BDATE
      END AS BDATE

      ,CASE WHEN UPPER(TRIM(GEN)) IN('F','FEMALE') THEN 'Female'
            WHEN UPPER(TRIM(GEN)) IN('M','MALE') THEN 'Male'
        ELSE 'N/A'
        END AS GEN
  FROM dwh_sales.bronze.ERP_CUST_AZ12 