USE EnterpriseAnalyticsDB;
GO

/* ============================================================
   DIMENSION HIERARCHY
   ============================================================ */

ALTER TABLE dw.DimRegion
ADD CONSTRAINT FK_DimRegion_Country
FOREIGN KEY (CountryKey)
REFERENCES dw.DimCountry(CountryKey);
GO

ALTER TABLE dw.DimCity
ADD CONSTRAINT FK_DimCity_Region
FOREIGN KEY (RegionKey)
REFERENCES dw.DimRegion(RegionKey);
GO

ALTER TABLE dw.DimStore
ADD CONSTRAINT FK_DimStore_City
FOREIGN KEY (CityKey)
REFERENCES dw.DimCity(CityKey);
GO

ALTER TABLE dw.DimWarehouse
ADD CONSTRAINT FK_DimWarehouse_City
FOREIGN KEY (CityKey)
REFERENCES dw.DimCity(CityKey);
GO

ALTER TABLE dw.DimProduct
ADD CONSTRAINT FK_DimProduct_Category
FOREIGN KEY (CategoryKey)
REFERENCES dw.DimCategory(CategoryKey);
GO

ALTER TABLE dw.DimEmployee
ADD CONSTRAINT FK_DimEmployee_Department
FOREIGN KEY (DepartmentKey)
REFERENCES dw.DimDepartment(DepartmentKey);
GO

ALTER TABLE dw.DimEmployee
ADD CONSTRAINT FK_DimEmployee_Job
FOREIGN KEY (JobKey)
REFERENCES dw.DimJob(JobKey);
GO


/* ============================================================
   FACT SALES
   ============================================================ */

ALTER TABLE dw.FactSales
ADD CONSTRAINT FK_FactSales_Date
FOREIGN KEY (DateKey)
REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.FactSales
ADD CONSTRAINT FK_FactSales_Customer
FOREIGN KEY (CustomerKey)
REFERENCES dw.DimCustomer(CustomerKey);

ALTER TABLE dw.FactSales
ADD CONSTRAINT FK_FactSales_Product
FOREIGN KEY (ProductKey)
REFERENCES dw.DimProduct(ProductKey);

ALTER TABLE dw.FactSales
ADD CONSTRAINT FK_FactSales_Store
FOREIGN KEY (StoreKey)
REFERENCES dw.DimStore(StoreKey);

ALTER TABLE dw.FactSales
ADD CONSTRAINT FK_FactSales_Channel
FOREIGN KEY (ChannelKey)
REFERENCES dw.DimChannel(ChannelKey);

ALTER TABLE dw.FactSales
ADD CONSTRAINT FK_FactSales_Promotion
FOREIGN KEY (PromotionKey)
REFERENCES dw.DimPromotion(PromotionKey);
GO


/* ============================================================
   FACT RETURNS
   ============================================================ */

ALTER TABLE dw.FactReturns
ADD CONSTRAINT FK_FactReturns_Date
FOREIGN KEY (DateKey)
REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.FactReturns
ADD CONSTRAINT FK_FactReturns_Customer
FOREIGN KEY (CustomerKey)
REFERENCES dw.DimCustomer(CustomerKey);

ALTER TABLE dw.FactReturns
ADD CONSTRAINT FK_FactReturns_Product
FOREIGN KEY (ProductKey)
REFERENCES dw.DimProduct(ProductKey);

ALTER TABLE dw.FactReturns
ADD CONSTRAINT FK_FactReturns_Store
FOREIGN KEY (StoreKey)
REFERENCES dw.DimStore(StoreKey);

ALTER TABLE dw.FactReturns
ADD CONSTRAINT FK_FactReturns_Channel
FOREIGN KEY (ChannelKey)
REFERENCES dw.DimChannel(ChannelKey);
GO


/* ============================================================
   FACT PURCHASES
   ============================================================ */

ALTER TABLE dw.FactPurchases
ADD CONSTRAINT FK_FactPurchases_Date
FOREIGN KEY (DateKey)
REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.FactPurchases
ADD CONSTRAINT FK_FactPurchases_Supplier
FOREIGN KEY (SupplierKey)
REFERENCES dw.DimSupplier(SupplierKey);

ALTER TABLE dw.FactPurchases
ADD CONSTRAINT FK_FactPurchases_Product
FOREIGN KEY (ProductKey)
REFERENCES dw.DimProduct(ProductKey);

ALTER TABLE dw.FactPurchases
ADD CONSTRAINT FK_FactPurchases_Warehouse
FOREIGN KEY (WarehouseKey)
REFERENCES dw.DimWarehouse(WarehouseKey);
GO


/* ============================================================
   FACT INVENTORY
   ============================================================ */

ALTER TABLE dw.FactInventory
ADD CONSTRAINT FK_FactInventory_Date
FOREIGN KEY (DateKey)
REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.FactInventory
ADD CONSTRAINT FK_FactInventory_Product
FOREIGN KEY (ProductKey)
REFERENCES dw.DimProduct(ProductKey);

ALTER TABLE dw.FactInventory
ADD CONSTRAINT FK_FactInventory_Warehouse
FOREIGN KEY (WarehouseKey)
REFERENCES dw.DimWarehouse(WarehouseKey);
GO


/* ============================================================
   FACT STOCK MOVEMENT
   ============================================================ */

ALTER TABLE dw.FactStockMovement
ADD CONSTRAINT FK_FactStockMovement_Date
FOREIGN KEY (DateKey)
REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.FactStockMovement
ADD CONSTRAINT FK_FactStockMovement_Product
FOREIGN KEY (ProductKey)
REFERENCES dw.DimProduct(ProductKey);

ALTER TABLE dw.FactStockMovement
ADD CONSTRAINT FK_FactStockMovement_Warehouse
FOREIGN KEY (WarehouseKey)
REFERENCES dw.DimWarehouse(WarehouseKey);
GO


/* ============================================================
   FACT ATTENDANCE
   ============================================================ */

ALTER TABLE dw.FactAttendance
ADD CONSTRAINT FK_FactAttendance_Date
FOREIGN KEY (DateKey)
REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.FactAttendance
ADD CONSTRAINT FK_FactAttendance_Employee
FOREIGN KEY (EmployeeKey)
REFERENCES dw.DimEmployee(EmployeeKey);

ALTER TABLE dw.FactAttendance
ADD CONSTRAINT FK_FactAttendance_Department
FOREIGN KEY (DepartmentKey)
REFERENCES dw.DimDepartment(DepartmentKey);
GO


/* ============================================================
   FACT PAYROLL
   ============================================================ */

ALTER TABLE dw.FactPayroll
ADD CONSTRAINT FK_FactPayroll_Date
FOREIGN KEY (DateKey)
REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.FactPayroll
ADD CONSTRAINT FK_FactPayroll_Employee
FOREIGN KEY (EmployeeKey)
REFERENCES dw.DimEmployee(EmployeeKey);

ALTER TABLE dw.FactPayroll
ADD CONSTRAINT FK_FactPayroll_Department
FOREIGN KEY (DepartmentKey)
REFERENCES dw.DimDepartment(DepartmentKey);
GO


/* ============================================================
   FACT FINANCE
   ============================================================ */

ALTER TABLE dw.FactFinance
ADD CONSTRAINT FK_FactFinance_Date
FOREIGN KEY (DateKey)
REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.FactFinance
ADD CONSTRAINT FK_FactFinance_Account
FOREIGN KEY (AccountKey)
REFERENCES dw.DimAccount(AccountKey);

ALTER TABLE dw.FactFinance
ADD CONSTRAINT FK_FactFinance_Department
FOREIGN KEY (DepartmentKey)
REFERENCES dw.DimDepartment(DepartmentKey);
GO


/* ============================================================
   FACT BUDGET
   ============================================================ */

ALTER TABLE dw.FactBudget
ADD CONSTRAINT FK_FactBudget_Date
FOREIGN KEY (DateKey)
REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.FactBudget
ADD CONSTRAINT FK_FactBudget_Account
FOREIGN KEY (AccountKey)
REFERENCES dw.DimAccount(AccountKey);

ALTER TABLE dw.FactBudget
ADD CONSTRAINT FK_FactBudget_Department
FOREIGN KEY (DepartmentKey)
REFERENCES dw.DimDepartment(DepartmentKey);
GO


/* ============================================================
   FACT MARKETING
   ============================================================ */

ALTER TABLE dw.FactMarketing
ADD CONSTRAINT FK_FactMarketing_Date
FOREIGN KEY (DateKey)
REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.FactMarketing
ADD CONSTRAINT FK_FactMarketing_Customer
FOREIGN KEY (CustomerKey)
REFERENCES dw.DimCustomer(CustomerKey);

ALTER TABLE dw.FactMarketing
ADD CONSTRAINT FK_FactMarketing_Promotion
FOREIGN KEY (PromotionKey)
REFERENCES dw.DimPromotion(PromotionKey);
GO


/* ============================================================
   FACT SUPPLIER PAYMENT
   ============================================================ */

ALTER TABLE dw.FactSupplierPayment
ADD CONSTRAINT FK_FactSupplierPayment_Date
FOREIGN KEY (DateKey)
REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.FactSupplierPayment
ADD CONSTRAINT FK_FactSupplierPayment_Supplier
FOREIGN KEY (SupplierKey)
REFERENCES dw.DimSupplier(SupplierKey);

ALTER TABLE dw.FactSupplierPayment
ADD CONSTRAINT FK_FactSupplierPayment_Account
FOREIGN KEY (AccountKey)
REFERENCES dw.DimAccount(AccountKey);
GO


/* ============================================================
   VALIDATION
   ============================================================ */

SELECT
    fk.name AS ForeignKeyName,
    OBJECT_SCHEMA_NAME(fk.parent_object_id) AS SchemaName,
    OBJECT_NAME(fk.parent_object_id) AS TableName
FROM sys.foreign_keys fk
WHERE OBJECT_SCHEMA_NAME(fk.parent_object_id) = N'dw'
ORDER BY TableName, ForeignKeyName;
GO