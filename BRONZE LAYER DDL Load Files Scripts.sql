Truncate Table bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM 'E:\Sales_DWH_SQL_Project\datasets\source_crm\cust_info.CSV'
WITH(
	FIRSTROW=2,
	FIELDTERMINATOR = ',',
	Tablock
);

Select * from bronze.crm_cust_info

Truncate Table bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM 'E:\Sales_DWH_SQL_Project\datasets\source_crm\cust_info.CSV'
WITH(
	FIRSTROW=2,
	FIELDTERMINATOR = ',',
	Tablock
);

Select * from bronze.crm_cust_info

--------------------------------------------------------
Truncate Table bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM 'E:\Sales_DWH_SQL_Project\datasets\source_crm\prd_info.CSV'
WITH(
	FIRSTROW=2,
	FIELDTERMINATOR = ',',
	Tablock
);

Select * from bronze.crm_prd_info

--------------------------------------------------------
Truncate Table bronze.crm_sales_details;

BULK INSERT bronze.crm_sales_details
FROM 'E:\Sales_DWH_SQL_Project\datasets\source_crm\sales_details.CSV'
WITH(
	FIRSTROW=2,
	FIELDTERMINATOR = ',',
	Tablock
);

Select * from bronze.crm_sales_details

--------------------------------------------------------
Truncate Table bronze.ERP_CUST_AZ12;

BULK INSERT bronze.ERP_CUST_AZ12
FROM 'E:\Sales_DWH_SQL_Project\datasets\source_erp\CUST_AZ12.csv'
WITH(
	FIRSTROW=2,
	FIELDTERMINATOR = ',',
	Tablock
);

Select * from bronze.ERP_CUST_AZ12

--------------------------------------------------------
Truncate Table bronze.ERP_LOC_A101;

BULK INSERT bronze.ERP_LOC_A101
FROM 'E:\Sales_DWH_SQL_Project\datasets\source_erp\LOC_A101.csv'
WITH(
	FIRSTROW=2,
	FIELDTERMINATOR = ',',
	Tablock
);

Select * from bronze.ERP_LOC_A101

--------------------------------------------------------
Truncate Table bronze.ERP_PX_CAT_G1V2;

BULK INSERT bronze.ERP_PX_CAT_G1V2
FROM 'E:\Sales_DWH_SQL_Project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH(
	FIRSTROW=2,
	FIELDTERMINATOR = ',',
	Tablock
);

Select * from bronze.ERP_PX_CAT_G1V2