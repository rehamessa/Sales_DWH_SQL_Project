--MODIFY TABLE
IF OBJECT_ID('Silver.crm_prd_info','U') IS NOT NULL
    DROP TABLE Silver.crm_prd_info;
CREATE TABLE Silver.crm_prd_info(
    prd_id INT,
    cat_id nvarchar(50),
    prd_key nvarchar(50),
    prd_nm nvarchar(50),
    prd_cost INT,
    prd_line nvarchar(50),
    prd_start_dt DATE,
    prd_end_dt DATE,
    DWH_CREATE_DATE DATETIME2 DEFAULT GETDATE()
    );

----Load Table in to silver layer

INSERT INTO Silver.crm_prd_info(
    prd_id,
    cat_id,
   prd_key,
   prd_nm,
   prd_cost,
   prd_line,
   prd_start_dt,
   prd_end_dt)




--- Extacrt the IDS from Key
--- Handle NULLS in prd_cost
--Handle Abbreviation for Consistency
-- Handle ilogiv End_Date

SELECT 
    prd_id
    ,REPLACE(SUBSTRING(prd_key,1,5),'-','_') AS cat_id --Extract Category ID
    ,SUBSTRING(prd_key,7,len(prd_key)) AS prd_key --Extract Product ID
    ,prd_nm
    ,ISNULL(prd_cost,0) AS prd_cost 
    ,Case when UPPER(TRIM(prd_line))='M' THEN 'Mountain'
           when UPPER(TRIM(prd_line))='S' THEN 'Other Sales'
           when UPPER(TRIM(prd_line))='R' THEN 'Road'
           when UPPER(TRIM(prd_line))='T' THEN 'Touring'
    ELSE 'N/A'
    END AS prd_line --Map Produact Line Code to Discriptive Values
    ,CAST(prd_start_dt AS DATE) AS prd_start_dt
    ,CAST(LEAD(prd_start_dt) OVER(PARTITION BY prd_Key ORDER BY prd_start_dt) -1 AS DATE) AS prd_end_dt-- Calculate End date as one day before the next Start date
FROM dwh_sales.bronze.crm_prd_info

