-- Check for Nulls or Duplicate in primary key

SELECT
	CST_ID,
	COUNT(*)

FROM bronze.crm_cust_info
GROUP BY CST_ID
HAVING COUNT(*)>1 OR cst_id IS NULL;

--- Handle Primary key
SELECT
	*
FROM
	(SELECT 
		*,
		ROW_NUMBER()OVER(PARTITION BY CST_ID ORDER BY CST_CREATE_DATE DESC) AS FLAG
	FROM bronze.crm_cust_info) t
	where flag =1 ;