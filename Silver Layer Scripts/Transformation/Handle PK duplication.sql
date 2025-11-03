-- Check for Nulls or Duplicate in primary key

SELECT
	CST_ID,
	COUNT(*)

FROM bronze.crm_cust_info
GROUP BY CST_ID
HAVING COUNT(*)>1 OR cst_id IS NULL;


SELECT * 
FROM Silver.crm_cust_info