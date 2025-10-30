
--- Handle Primary key
--- Handle Spaces
-- Data Standrization & Consistency


SELECT
	cst_id,
	cst_key,
	TRIM(cst_firstname) AS cst_firstname,
	TRIM(cst_lastname) AS cst_lastname,
	CASE WHEN UPPER(TRIM(cst_marital_status))='S' THEN 'Single'
	WHEN UPPER(TRIM(cst_marital_status))='M' THEN 'Married'
	ELSE 'N/A'
	END 
	cst_marital_status,
	CASE WHEN UPPER(TRIM(cst_gndr))='F' THEN 'Female'
	WHEN UPPER(TRIM(cst_gndr))='M' THEN 'Male'
	ELSE 'N/A'
	END cst_gndr,
	cst_create_date
FROM
	(SELECT 
		*,
		ROW_NUMBER()OVER(PARTITION BY CST_ID ORDER BY CST_CREATE_DATE DESC) AS FLAG
	FROM bronze.crm_cust_info) t
	where flag =1 ;