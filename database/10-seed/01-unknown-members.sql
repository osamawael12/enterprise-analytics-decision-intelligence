USE EnterpriseAnalyticsDB;
GO

/* ============================================================
   UNKNOWN MEMBER
   Key = -1
   ============================================================ */

SET IDENTITY_INSERT dw.DimCountry ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimCountry WHERE CountryKey = -1)
BEGIN
    INSERT INTO dw.DimCountry
    (
        CountryKey,
        CountryID,
        CountryCode,
        CountryName,
        IsActive
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        'UNK',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimCountry OFF;
GO


SET IDENTITY_INSERT dw.DimRegion ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimRegion WHERE RegionKey = -1)
BEGIN
    INSERT INTO dw.DimRegion
    (
        RegionKey,
        RegionID,
        CountryKey,
        RegionCode,
        RegionName,
        IsActive
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        -1,
        'UNK',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimRegion OFF;
GO


SET IDENTITY_INSERT dw.DimCity ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimCity WHERE CityKey = -1)
BEGIN
    INSERT INTO dw.DimCity
    (
        CityKey,
        CityID,
        RegionKey,
        CityCode,
        CityName,
        IsActive
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        -1,
        'UNK',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimCity OFF;
GO


SET IDENTITY_INSERT dw.DimStore ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimStore WHERE StoreKey = -1)
BEGIN
    INSERT INTO dw.DimStore
    (
        StoreKey,
        StoreID,
        CityKey,
        StoreName,
        StoreType,
        StoreStatus,
        IsActive
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        -1,
        N'Unknown',
        N'Unknown',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimStore OFF;
GO


SET IDENTITY_INSERT dw.DimWarehouse ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimWarehouse WHERE WarehouseKey = -1)
BEGIN
    INSERT INTO dw.DimWarehouse
    (
        WarehouseKey,
        WarehouseID,
        CityKey,
        WarehouseName,
        WarehouseType,
        WarehouseStatus,
        IsActive
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        -1,
        N'Unknown',
        N'Unknown',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimWarehouse OFF;
GO


SET IDENTITY_INSERT dw.DimCategory ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimCategory WHERE CategoryKey = -1)
BEGIN
    INSERT INTO dw.DimCategory
    (
        CategoryKey,
        CategoryID,
        CategoryName,
        CategoryGroup,
        IsActive
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        N'Unknown',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimCategory OFF;
GO


SET IDENTITY_INSERT dw.DimProduct ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimProduct WHERE ProductKey = -1)
BEGIN
    INSERT INTO dw.DimProduct
    (
        ProductKey,
        ProductID,
        CategoryKey,
        ProductName,
        ProductStatus,
        IsCurrent
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        -1,
        N'Unknown',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimProduct OFF;
GO


SET IDENTITY_INSERT dw.DimCustomer ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimCustomer WHERE CustomerKey = -1)
BEGIN
    INSERT INTO dw.DimCustomer
    (
        CustomerKey,
        CustomerID,
        CustomerName,
        CustomerStatus,
        IsCurrent
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        N'Unknown',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimCustomer OFF;
GO


SET IDENTITY_INSERT dw.DimSupplier ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimSupplier WHERE SupplierKey = -1)
BEGIN
    INSERT INTO dw.DimSupplier
    (
        SupplierKey,
        SupplierID,
        SupplierName,
        SupplierStatus,
        IsCurrent
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        N'Unknown',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimSupplier OFF;
GO


SET IDENTITY_INSERT dw.DimDepartment ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimDepartment WHERE DepartmentKey = -1)
BEGIN
    INSERT INTO dw.DimDepartment
    (
        DepartmentKey,
        DepartmentID,
        DepartmentName,
        IsActive
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimDepartment OFF;
GO


SET IDENTITY_INSERT dw.DimJob ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimJob WHERE JobKey = -1)
BEGIN
    INSERT INTO dw.DimJob
    (
        JobKey,
        JobID,
        JobTitle,
        JobLevel,
        IsActive
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        N'Unknown',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimJob OFF;
GO


SET IDENTITY_INSERT dw.DimEmployee ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimEmployee WHERE EmployeeKey = -1)
BEGIN
    INSERT INTO dw.DimEmployee
    (
        EmployeeKey,
        EmployeeID,
        DepartmentKey,
        JobKey,
        EmployeeName,
        EmploymentStatus,
        IsCurrent
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        -1,
        -1,
        N'Unknown',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimEmployee OFF;
GO


SET IDENTITY_INSERT dw.DimChannel ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimChannel WHERE ChannelKey = -1)
BEGIN
    INSERT INTO dw.DimChannel
    (
        ChannelKey,
        ChannelID,
        ChannelName,
        ChannelType,
        IsActive
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        N'Unknown',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimChannel OFF;
GO


SET IDENTITY_INSERT dw.DimPromotion ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimPromotion WHERE PromotionKey = -1)
BEGIN
    INSERT INTO dw.DimPromotion
    (
        PromotionKey,
        PromotionID,
        PromotionName,
        PromotionType,
        IsActive
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        N'Unknown',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimPromotion OFF;
GO


SET IDENTITY_INSERT dw.DimAccount ON;

IF NOT EXISTS (SELECT 1 FROM dw.DimAccount WHERE AccountKey = -1)
BEGIN
    INSERT INTO dw.DimAccount
    (
        AccountKey,
        AccountCode,
        AccountName,
        AccountType,
        AccountCategory,
        IsActive
    )
    VALUES
    (
        -1,
        'UNKNOWN',
        N'Unknown',
        N'Unknown',
        N'Unknown',
        1
    );
END;

SET IDENTITY_INSERT dw.DimAccount OFF;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM dw.DimDate
    WHERE DateKey = -1
)
BEGIN
    INSERT INTO dw.DimDate
    (
        DateKey,
        FullDate,
        DayNumber,
        DayName,
        WeekNumber,
        MonthNumber,
        MonthName,
        QuarterNumber,
        QuarterName,
        YearNumber,
        IsWeekend
    )
    VALUES
    (
        -1,
        '1900-01-01',
        0,
        'Unknown',
        0,
        0,
        'Unknown',
        0,
        'Unknown',
        0,
        0
    );
END;
GO