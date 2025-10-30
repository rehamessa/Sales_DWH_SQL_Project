-- Check unwanted Spaces
SELECT 
	cst_lastname
FROM bronze.crm_cust_info
Where cst_lastname != TRIM(cst_lastname);

SELECT 
	cst_firstname
FROM bronze.crm_cust_info
Where cst_firstname != TRIM(cst_firstname);

-- *********

SELECT 
	cst_gndr
FROM bronze.crm_cust_info
Where cst_gndr != TRIM(cst_gndr);