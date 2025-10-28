

CREATE OR ALTER PROCEDURE bronze.load_bronze As

BEGIN
	DECLARE @start_time DATETIME,@end_time DATETIME,@START_BATCH DATETIME,@END_BATCH DATETIME;
	BEGIN TRY
	SET @START_BATCH=GETDATE()
		Print '------------------------------------------------';	
		Print 'Loading Bronze Layer';
		PRINT'=================================================================';
		Print '------------------------------------------------';	
		Print 'Loading CRM Table';
		PRINT'=================================================================';
	
		SET @start_time=GETDATE();
		Print'>>Truncate Table:bronze.crm_cust_info';
		Truncate Table bronze.crm_cust_info;
		Print'>> Insert data into Table:bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'E:\Sales_DWH_SQL_Project\datasets\source_crm\cust_info.CSV'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			Tablock
		);
		SET @end_time=GETDATE()
		PRINT'>>Load Duration:'+Cast(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR)+'SEC'
		PRINT'*********************************************************************'	
		
		SET @start_time=GETDATE();
		Print'>>Truncate Table:bronze.crm_cust_info';
		Truncate Table bronze.crm_cust_info;
		Print'>>Insert data into Table:bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'E:\Sales_DWH_SQL_Project\datasets\source_crm\cust_info.CSV'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			Tablock
		);
		SET @end_time=GETDATE()
		PRINT'>>Load Duration:'+Cast(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR)+'SEC'
		PRINT'*********************************************************************'	
	
	

		--------------------------------------------------------
	    SET @start_time=GETDATE();
		Print'>>Truncate Table:bronze.crm_prd_info';
		Truncate Table bronze.crm_prd_info;
		Print'>>Insert data into Table:bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'E:\Sales_DWH_SQL_Project\datasets\source_crm\prd_info.CSV'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			Tablock
		);

		SET @end_time=GETDATE()
		PRINT'>>Load Duration:'+Cast(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR)+'SEC'
		PRINT'*********************************************************************'	
	

		--------------------------------------------------------
		SET @start_time=GETDATE();
		Print'>>Truncate Table:bronze.crm_sales_details';
		Truncate Table bronze.crm_sales_details;
		Print'>>Insert data into Table:bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'E:\Sales_DWH_SQL_Project\datasets\source_crm\sales_details.CSV'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			Tablock
		);
		SET @end_time=GETDATE()
		PRINT'>>Load Duration:'+Cast(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR)+'SEC'
		PRINT'*********************************************************************'	
	
	

		Print'------------------------------------------------';	
		Print'Loading ERP Tables';
		PRINT'=================================================================';
	
		--------------------------------------------------------
		SET @start_time=GETDATE();
		Print'>>Truncate Table:bronze.ERP_CUST_AZ12';
		Truncate Table bronze.ERP_CUST_AZ12;
		Print'>>insert data into Table:bronze.ERP_CUST_AZ12';
		BULK INSERT bronze.ERP_CUST_AZ12
		FROM 'E:\Sales_DWH_SQL_Project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			Tablock
		);

			SET @end_time=GETDATE()
		PRINT'>>Load Duration:'+Cast(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR)+'SEC'
		PRINT'*********************************************************************'	
	

		--------------------------------------------------------
		SET @start_time=GETDATE();
		Print'>>Truncate Table:bronze.ERP_LOC_A101';
		Truncate Table bronze.ERP_LOC_A101;
		Print'>>inserting data into Table:bronze.ERP_LOC_A101';
		BULK INSERT bronze.ERP_LOC_A101
		FROM 'E:\Sales_DWH_SQL_Project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			Tablock
		);

		SET @end_time=GETDATE()
		PRINT'>>Load Duration:'+Cast(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR)+'SEC'
		PRINT'*********************************************************************'	
	

		--------------------------------------------------------
		SET @start_time=GETDATE();
		Print'>>Truncate Table:bronze.ERP_PX_CAT_G1V2';
		Truncate Table bronze.ERP_PX_CAT_G1V2;
		Print'>>inserting data into Table:bronze.ERP_PX_CAT_G1V2';
		BULK INSERT bronze.ERP_PX_CAT_G1V2
		FROM 'E:\Sales_DWH_SQL_Project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			Tablock
		);
		SET @end_time=GETDATE()
		PRINT'>>Load Duration:'+Cast(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR)+'SEC'
		PRINT'*********************************************************************';
		PRINT'=================================';
		SET @END_BATCH=GETDATE()
		PRINT'>>Load batch Duration:'+Cast(DATEDIFF(SECOND,@start_batch,@end_batch) AS VARCHAR)+'SEC'
		PRINT'*********************************************************************'	
	
	
	END TRY
	BEGIN CATCH
	PRINT'================================='
	PRINT'Error Occuring during loading Bronze layer';
	PRINT'ERROR MSSG:'+ERROR_MESSAGE();
	PRINT 'ERROR MSSG:'+CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT 'ERROR MSSG:'+CAST(ERROR_STATE() AS NVARCHAR);
	
	END CATCH;
END;

EXEC bronze.load_bronze;