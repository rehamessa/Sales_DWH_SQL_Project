--Load data into silver layer
INSERT INTO Silver.ERP_PX_CAT_G1V2(ID,CAT,SUBCAT,MAINTENANCE)
SELECT ID
      ,CAT
      ,SUBCAT
      ,MAINTENANCE
  FROM [dwh_sales].[bronze].[ERP_PX_CAT_G1V2]
