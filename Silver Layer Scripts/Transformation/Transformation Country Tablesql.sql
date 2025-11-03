--Handle Consistency

SELECT Replace(CID,'-','') AS CID

      ,CASE WHEN TRIM(CNTRY) ='DE' THEN 'Germany'
            WHEN TRIM(CNTRY) in ('US','USA') THEN 'United States'
            WHEN TRIM(CNTRY) ='' or CNTRY IS NULL  THEN 'N/A'
        ELSE CNTRY
        END AS CNTRY

  FROM [dwh_sales].[bronze].[ERP_LOC_A101]
