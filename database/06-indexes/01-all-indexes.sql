USE EnterpriseAnalyticsDB;
GO

/* ============================================================
   DIMENSION INDEXES
   ============================================================ */

CREATE INDEX IX_DimRegion_CountryKey
ON dw.DimRegion (CountryKey);
GO

CREATE INDEX IX_DimCity_RegionKey
ON dw.DimCity (RegionKey);
GO

CREATE INDEX IX_DimStore_CityKey
ON dw.DimStore (CityKey);
GO

CREATE INDEX IX_DimWarehouse_CityKey
ON dw.DimWarehouse (CityKey);
GO

CREATE INDEX IX_DimProduct_CategoryKey
ON dw.DimProduct (CategoryKey);
GO

CREATE INDEX IX_DimEmployee_DepartmentKey
ON dw.DimEmployee (DepartmentKey);
GO

CREATE INDEX IX_DimEmployee_JobKey
ON dw.DimEmployee (JobKey);
GO

CREATE INDEX IX_DimCustomer_IsCurrent
ON dw.DimCustomer (IsCurrent, CustomerID);
GO

CREATE INDEX IX_DimProduct_IsCurrent
ON dw.DimProduct (IsCurrent, ProductID);
GO

CREATE INDEX IX_DimEmployee_IsCurrent
ON dw.DimEmployee (IsCurrent, EmployeeID);
GO

CREATE INDEX IX_DimSupplier_IsCurrent
ON dw.DimSupplier (IsCurrent, SupplierID);
GO


/* ============================================================
   FACT SALES
   ============================================================ */

CREATE INDEX IX_FactSales_DateKey
ON dw.FactSales (DateKey);
GO

CREATE INDEX IX_FactSales_ProductKey
ON dw.FactSales (ProductKey);
GO

CREATE INDEX IX_FactSales_CustomerKey
ON dw.FactSales (CustomerKey);
GO

CREATE INDEX IX_FactSales_StoreKey
ON dw.FactSales (StoreKey);
GO

CREATE INDEX IX_FactSales_ChannelKey
ON dw.FactSales (ChannelKey);
GO

CREATE INDEX IX_FactSales_OrderNumber
ON dw.FactSales (OrderNumber);
GO


/* ============================================================
   FACT RETURNS
   ============================================================ */

CREATE INDEX IX_FactReturns_DateKey
ON dw.FactReturns (DateKey);
GO

CREATE INDEX IX_FactReturns_ProductKey
ON dw.FactReturns (ProductKey);
GO

CREATE INDEX IX_FactReturns_CustomerKey
ON dw.FactReturns (CustomerKey);
GO


/* ============================================================
   FACT PURCHASES
   ============================================================ */

CREATE INDEX IX_FactPurchases_DateKey
ON dw.FactPurchases (DateKey);
GO

CREATE INDEX IX_FactPurchases_ProductKey
ON dw.FactPurchases (ProductKey);
GO

CREATE INDEX IX_FactPurchases_SupplierKey
ON dw.FactPurchases (SupplierKey);
GO

CREATE INDEX IX_FactPurchases_WarehouseKey
ON dw.FactPurchases (WarehouseKey);
GO


/* ============================================================
   FACT INVENTORY
   ============================================================ */

CREATE INDEX IX_FactInventory_Date_Product_Warehouse
ON dw.FactInventory
(
    DateKey,
    ProductKey,
    WarehouseKey
);
GO


/* ============================================================
   FACT STOCK MOVEMENT
   ============================================================ */

CREATE INDEX IX_FactStockMovement_DateKey
ON dw.FactStockMovement (DateKey);
GO

CREATE INDEX IX_FactStockMovement_Product_Warehouse
ON dw.FactStockMovement
(
    ProductKey,
    WarehouseKey
);
GO


/* ============================================================
   FACT ATTENDANCE
   ============================================================ */

CREATE INDEX IX_FactAttendance_Date_Employee
ON dw.FactAttendance
(
    DateKey,
    EmployeeKey
);
GO

CREATE INDEX IX_FactAttendance_DepartmentKey
ON dw.FactAttendance (DepartmentKey);
GO


/* ============================================================
   FACT PAYROLL
   ============================================================ */

CREATE INDEX IX_FactPayroll_Date_Employee
ON dw.FactPayroll
(
    DateKey,
    EmployeeKey
);
GO

CREATE INDEX IX_FactPayroll_DepartmentKey
ON dw.FactPayroll (DepartmentKey);
GO


/* ============================================================
   FACT FINANCE
   ============================================================ */

CREATE INDEX IX_FactFinance_Date_Account
ON dw.FactFinance
(
    DateKey,
    AccountKey
);
GO

CREATE INDEX IX_FactFinance_DepartmentKey
ON dw.FactFinance (DepartmentKey);
GO


/* ============================================================
   FACT BUDGET
   ============================================================ */

CREATE INDEX IX_FactBudget_Date_Account_Department
ON dw.FactBudget
(
    DateKey,
    AccountKey,
    DepartmentKey
);
GO


/* ============================================================
   FACT MARKETING
   ============================================================ */

CREATE INDEX IX_FactMarketing_Date_Promotion
ON dw.FactMarketing
(
    DateKey,
    PromotionKey
);
GO

CREATE INDEX IX_FactMarketing_CustomerKey
ON dw.FactMarketing (CustomerKey);
GO


/* ============================================================
   FACT TARGETS
   ============================================================ */

CREATE INDEX IX_FactTargets_Date_Type_Entity
ON dw.FactTargets
(
    DateKey,
    TargetType,
    TargetEntityID
);
GO


/* ============================================================
   FACT SUPPLIER PAYMENT
   ============================================================ */

CREATE INDEX IX_FactSupplierPayment_Date_Supplier
ON dw.FactSupplierPayment
(
    DateKey,
    SupplierKey
);
GO

CREATE INDEX IX_FactSupplierPayment_AccountKey
ON dw.FactSupplierPayment (AccountKey);
GO