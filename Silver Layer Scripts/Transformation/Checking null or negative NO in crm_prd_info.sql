--Check for Nulls or Negative Numbers
SELECT
	prd_cost
FROM bronze.crm_prd_info
WHERE prd_cost <0 OR prd_cost IS NULL;