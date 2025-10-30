-- Check for Nulls or Duplicate in primary key

SELECT
	CST_ID,
	COUNT(*)

FROM bronze.crm_cust_info
GROUP BY CST_ID
HAVING COUNT(*)>1 OR cst_id IS NULL;



--- Handle Primary key
--- Handle Spaces

SELECT
	cst_id,
	cst_key,
	TRIM(cst_firstname) AS cst_firstname,
	TRIM(cst_lastname) AS cst_lastname,
	cst_marital_status,
	cst_gndr,
	cst_create_date
FROM
	(SELECT 
		*,
		ROW_NUMBER()OVER(PARTITION BY CST_ID ORDER BY CST_CREATE_DATE DESC) AS FLAG
	FROM bronze.crm_cust_info) t
	where flag =1 ;