# Sales_DWH_SQL_Project

# 🚀 Project Requirements

## 1-Building the Data Warehouse (Data Engineering)

### 🧭 Objective
Develop a modern data warehouse using **SQL Server** to consolidate sales data, enabling **analytical reporting** and **informed decision-making**.

---

### 📋 Specifications

- **Data Sources:**  
  Import data from two source systems (**ERP** and **CRM**) provided as CSV files.

- **Data Quality:**  
  Cleanse and resolve data quality issues prior to analysis.

- **Integration:**  
  Combine both sources into a single, user-friendly **data model** designed for analytical queries.

- **Scope:**  
  Focus on the latest dataset only **historization of data is not required**.

- **Documentation:**  
  Provide clear documentation of the data model to support both **business stakeholders** and **analysts**.
#### Draw DWH Architecture

![Draw DWH Architecture](https://github.com/rehamessa/Sales_DWH_SQL_Project/blob/main/Images/Design_DWH_Architecture.png)
---
------------

#### Silver Layer || Build Integration Model

![ Build Integration Model](https://github.com/rehamessa/Sales_DWH_SQL_Project/blob/main/Images/Integrtion%20diagram%20model.jpg)
---

#### Gold Layer || Draw Logical Model
![ Build logical Model](https://github.com/rehamessa/Sales_DWH_SQL_Project/blob/main/Images/logical%20data%20model.drawio.png)

## 🔍 Phase 2: Exploratory Data Analysis (EDA)


### 🎯 Goal: “Understand the Data”
- Perform **basic SQL queries** to get familiar with datasets.  
- Conduct **data profiling** to detect anomalies or missing values.  
- Use **simple aggregations** and **subqueries** for initial summaries.

---

## 📊 Phase 3: Advanced Data Analytics


### 🎯 Goal: “Answer Business Questions”
- Write **complex SQL queries** for multi-source insights.  
- Use **window functions** for advanced aggregations.  
- Implement **CTEs** (Common Table Expressions) for readable logic.  
- Build **reports** to support decision-making.

  ## 📊 Phase 4: Data Visualization (Power BI)

### 🎯 Goal: Create Dashboards Using the Final SQL Views

After completing Exploratory Data Analysis and Advanced Analytics, the final step is to connect Power BI to the SQL Server data warehouse and build business dashboards.

### Steps:

- **Connect Power BI to SQL Server**
  - Use *Get Data → SQL Server*
  - Enter server and database name
  - Load only the **final SQL views** created in previous phases

- **Load the Analytical Views**
  - Import or DirectQuery the views (facts, dimensions, analytical outputs)
  - Validate relationships and model structure

- **Create Dashboards**
  - Build visuals using the cleaned, modeled views
  - Include KPIs, charts, filters, and summaries based on business needs
    ![Product_Analysis](https://github.com/rehamessa/Sales_DWH_SQL_Project/blob/main/Images/Product_View.png)
    ![Customer_Analysis](https://github.com/rehamessa/Sales_DWH_SQL_Project/blob/main/Images/Customer_View.png)

### 💡 Tools & Technologies
- Draw DIO
- SQL Server  
- SQL Server Integration Services (SSIS)  
- Power BI / Excel (for reporting)  
- CSV Data Files  

---

### 📁 Project Structure

----

* Data Engineering
----
1-[Create_database](https://github.com/rehamessa/Sales_DWH_SQL_Project/blob/main/create_DB.sql)
2-[Bronze Layer](https://github.com/rehamessa/Sales_DWH_SQL_Project/tree/main/Bronze%20Layer%20Scripts)
3-[Silver Layer](https://github.com/rehamessa/Sales_DWH_SQL_Project/tree/main/Silver%20Layer%20Scripts)
4-[Gold Layer](https://github.com/rehamessa/Sales_DWH_SQL_Project/tree/main/Gold%20Layer%20Scripts)

----
* 
[EDA](https://github.com/rehamessa/Sales_DWH_SQL_Project/tree/main/EDA)

-----
* [AQL Analysis](https://github.com/rehamessa/Sales_DWH_SQL_Project/tree/main/Advaned_Data_Analysi)
----
* [PBI Dashboard](https://github.com/rehamessa/Sales_DWH_SQL_Project/blob/main/PBI_EComerce_Dashboard.pbix)
-----
