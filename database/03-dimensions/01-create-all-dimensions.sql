USE EnterpriseAnalyticsDB;
GO

/* ============================================================
   ENTERPRISE ANALYTICS & DECISION INTELLIGENCE PLATFORM
   DIMENSION TABLES
   ============================================================ */


/* ============================================================
   01. DIM DATE
   ============================================================ */

IF OBJECT_ID(N'dw.DimDate', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimDate
    (
        DateKey         INT            NOT NULL,
        FullDate        DATE           NOT NULL,

        DayNumber       TINYINT        NOT NULL,
        DayName         VARCHAR(20)    NOT NULL,
        WeekNumber      TINYINT        NOT NULL,

        MonthNumber     TINYINT        NOT NULL,
        MonthName       VARCHAR(20)    NOT NULL,

        QuarterNumber   TINYINT        NOT NULL,
        QuarterName     VARCHAR(10)    NOT NULL,

        YearNumber      SMALLINT       NOT NULL,

        IsWeekend       BIT            NOT NULL,

        FiscalYear      SMALLINT       NULL,
        FiscalPeriod    TINYINT        NULL,

        CONSTRAINT PK_DimDate
            PRIMARY KEY CLUSTERED (DateKey),

        CONSTRAINT UQ_DimDate_FullDate
            UNIQUE (FullDate)
    );
END;
GO


/* ============================================================
   02. DIM COUNTRY
   ============================================================ */

IF OBJECT_ID(N'dw.DimCountry', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimCountry
    (
        CountryKey      INT IDENTITY(1,1) NOT NULL,
        CountryID       VARCHAR(20)       NOT NULL,
        CountryCode     VARCHAR(10)       NULL,
        CountryName     NVARCHAR(100)     NOT NULL,

        IsActive        BIT               NOT NULL DEFAULT 1,

        CreatedDate     DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate    DATETIME2(0)      NULL,

        CONSTRAINT PK_DimCountry
            PRIMARY KEY CLUSTERED (CountryKey),

        CONSTRAINT UQ_DimCountry_CountryID
            UNIQUE (CountryID)
    );
END;
GO


/* ============================================================
   03. DIM REGION
   ============================================================ */

IF OBJECT_ID(N'dw.DimRegion', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimRegion
    (
        RegionKey       INT IDENTITY(1,1) NOT NULL,
        RegionID        VARCHAR(20)       NOT NULL,
        CountryKey      INT               NOT NULL,

        RegionCode      VARCHAR(20)       NULL,
        RegionName      NVARCHAR(100)     NOT NULL,

        IsActive        BIT               NOT NULL DEFAULT 1,

        CreatedDate     DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate    DATETIME2(0)      NULL,

        CONSTRAINT PK_DimRegion
            PRIMARY KEY CLUSTERED (RegionKey),

        CONSTRAINT UQ_DimRegion_RegionID
            UNIQUE (RegionID)
    );
END;
GO


/* ============================================================
   04. DIM CITY
   ============================================================ */

IF OBJECT_ID(N'dw.DimCity', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimCity
    (
        CityKey         INT IDENTITY(1,1) NOT NULL,
        CityID          VARCHAR(20)       NOT NULL,
        RegionKey       INT               NOT NULL,

        CityCode        VARCHAR(20)       NULL,
        CityName        NVARCHAR(100)     NOT NULL,

        IsActive        BIT               NOT NULL DEFAULT 1,

        CreatedDate     DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate    DATETIME2(0)      NULL,

        CONSTRAINT PK_DimCity
            PRIMARY KEY CLUSTERED (CityKey),

        CONSTRAINT UQ_DimCity_CityID
            UNIQUE (CityID)
    );
END;
GO


/* ============================================================
   05. DIM STORE
   ============================================================ */

IF OBJECT_ID(N'dw.DimStore', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimStore
    (
        StoreKey        INT IDENTITY(1,1) NOT NULL,
        StoreID         VARCHAR(30)       NOT NULL,
        CityKey         INT               NOT NULL,

        StoreName       NVARCHAR(150)     NOT NULL,
        StoreType       NVARCHAR(50)      NULL,

        OpeningDate     DATE              NULL,
        StoreStatus     NVARCHAR(30)      NULL,

        IsActive        BIT               NOT NULL DEFAULT 1,

        CreatedDate     DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate    DATETIME2(0)      NULL,

        CONSTRAINT PK_DimStore
            PRIMARY KEY CLUSTERED (StoreKey),

        CONSTRAINT UQ_DimStore_StoreID
            UNIQUE (StoreID)
    );
END;
GO


/* ============================================================
   06. DIM WAREHOUSE
   ============================================================ */

IF OBJECT_ID(N'dw.DimWarehouse', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimWarehouse
    (
        WarehouseKey    INT IDENTITY(1,1) NOT NULL,
        WarehouseID     VARCHAR(30)       NOT NULL,
        CityKey         INT               NOT NULL,

        WarehouseName   NVARCHAR(150)     NOT NULL,
        WarehouseType   NVARCHAR(50)      NULL,
        WarehouseStatus NVARCHAR(30)      NULL,

        IsActive        BIT               NOT NULL DEFAULT 1,

        CreatedDate     DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate    DATETIME2(0)      NULL,

        CONSTRAINT PK_DimWarehouse
            PRIMARY KEY CLUSTERED (WarehouseKey),

        CONSTRAINT UQ_DimWarehouse_WarehouseID
            UNIQUE (WarehouseID)
    );
END;
GO


/* ============================================================
   07. DIM CATEGORY
   ============================================================ */

IF OBJECT_ID(N'dw.DimCategory', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimCategory
    (
        CategoryKey     INT IDENTITY(1,1) NOT NULL,
        CategoryID      VARCHAR(30)       NOT NULL,

        CategoryName    NVARCHAR(100)     NOT NULL,
        CategoryGroup   NVARCHAR(100)     NULL,

        IsActive        BIT               NOT NULL DEFAULT 1,

        CreatedDate     DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate    DATETIME2(0)      NULL,

        CONSTRAINT PK_DimCategory
            PRIMARY KEY CLUSTERED (CategoryKey),

        CONSTRAINT UQ_DimCategory_CategoryID
            UNIQUE (CategoryID)
    );
END;
GO


/* ============================================================
   08. DIM PRODUCT
   ============================================================ */

IF OBJECT_ID(N'dw.DimProduct', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimProduct
    (
        ProductKey       INT IDENTITY(1,1) NOT NULL,
        ProductID        VARCHAR(30)       NOT NULL,
        CategoryKey      INT               NOT NULL,

        ProductName      NVARCHAR(200)     NOT NULL,
        SubCategory      NVARCHAR(100)     NULL,
        Brand            NVARCHAR(100)     NULL,
        ProductType      NVARCHAR(100)     NULL,
        UnitOfMeasure    NVARCHAR(30)      NULL,
        ProductStatus    NVARCHAR(30)      NULL,

        EffectiveDate    DATE              NULL,
        ExpirationDate   DATE              NULL,
        IsCurrent        BIT               NOT NULL DEFAULT 1,

        CreatedDate      DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate     DATETIME2(0)      NULL,

        CONSTRAINT PK_DimProduct
            PRIMARY KEY CLUSTERED (ProductKey),

        CONSTRAINT UQ_DimProduct_ProductID
            UNIQUE (ProductID)
    );
END;
GO


/* ============================================================
   09. DIM CUSTOMER
   ============================================================ */

IF OBJECT_ID(N'dw.DimCustomer', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimCustomer
    (
        CustomerKey       INT IDENTITY(1,1) NOT NULL,
        CustomerID        VARCHAR(30)       NOT NULL,

        CustomerName      NVARCHAR(200)     NOT NULL,
        CustomerType      NVARCHAR(50)      NULL,
        CustomerSegment   NVARCHAR(100)     NULL,
        CustomerStatus    NVARCHAR(30)      NULL,

        RegistrationDate  DATE              NULL,

        EffectiveDate     DATE              NULL,
        ExpirationDate    DATE              NULL,
        IsCurrent         BIT               NOT NULL DEFAULT 1,

        CreatedDate       DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate      DATETIME2(0)      NULL,

        CONSTRAINT PK_DimCustomer
            PRIMARY KEY CLUSTERED (CustomerKey),

        CONSTRAINT UQ_DimCustomer_CustomerID
            UNIQUE (CustomerID)
    );
END;
GO


/* ============================================================
   10. DIM SUPPLIER
   ============================================================ */

IF OBJECT_ID(N'dw.DimSupplier', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimSupplier
    (
        SupplierKey      INT IDENTITY(1,1) NOT NULL,
        SupplierID       VARCHAR(30)       NOT NULL,

        SupplierName     NVARCHAR(200)     NOT NULL,
        SupplierType     NVARCHAR(50)      NULL,
        SupplierStatus   NVARCHAR(30)      NULL,

        EffectiveDate    DATE              NULL,
        ExpirationDate   DATE              NULL,
        IsCurrent        BIT               NOT NULL DEFAULT 1,

        CreatedDate      DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate     DATETIME2(0)      NULL,

        CONSTRAINT PK_DimSupplier
            PRIMARY KEY CLUSTERED (SupplierKey),

        CONSTRAINT UQ_DimSupplier_SupplierID
            UNIQUE (SupplierID)
    );
END;
GO


/* ============================================================
   11. DIM DEPARTMENT
   ============================================================ */

IF OBJECT_ID(N'dw.DimDepartment', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimDepartment
    (
        DepartmentKey    INT IDENTITY(1,1) NOT NULL,
        DepartmentID    VARCHAR(30)       NOT NULL,

        DepartmentName  NVARCHAR(150)     NOT NULL,
        DepartmentGroup NVARCHAR(100)     NULL,

        IsActive        BIT               NOT NULL DEFAULT 1,

        CreatedDate     DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate    DATETIME2(0)      NULL,

        CONSTRAINT PK_DimDepartment
            PRIMARY KEY CLUSTERED (DepartmentKey),

        CONSTRAINT UQ_DimDepartment_DepartmentID
            UNIQUE (DepartmentID)
    );
END;
GO


/* ============================================================
   12. DIM JOB
   ============================================================ */

IF OBJECT_ID(N'dw.DimJob', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimJob
    (
        JobKey          INT IDENTITY(1,1) NOT NULL,
        JobID           VARCHAR(30)       NOT NULL,

        JobTitle        NVARCHAR(150)     NOT NULL,
        JobLevel        NVARCHAR(50)      NULL,

        IsActive        BIT               NOT NULL DEFAULT 1,

        CreatedDate     DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate    DATETIME2(0)      NULL,

        CONSTRAINT PK_DimJob
            PRIMARY KEY CLUSTERED (JobKey),

        CONSTRAINT UQ_DimJob_JobID
            UNIQUE (JobID)
    );
END;
GO


/* ============================================================
   13. DIM EMPLOYEE
   ============================================================ */

IF OBJECT_ID(N'dw.DimEmployee', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimEmployee
    (
        EmployeeKey       INT IDENTITY(1,1) NOT NULL,
        EmployeeID        VARCHAR(30)       NOT NULL,

        DepartmentKey     INT               NOT NULL,
        JobKey            INT               NOT NULL,

        EmployeeName      NVARCHAR(200)     NOT NULL,
        HireDate          DATE              NULL,
        EmploymentStatus  NVARCHAR(30)      NULL,

        EffectiveDate     DATE              NULL,
        ExpirationDate    DATE              NULL,
        IsCurrent         BIT               NOT NULL DEFAULT 1,

        CreatedDate       DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate      DATETIME2(0)      NULL,

        CONSTRAINT PK_DimEmployee
            PRIMARY KEY CLUSTERED (EmployeeKey),

        CONSTRAINT UQ_DimEmployee_EmployeeID
            UNIQUE (EmployeeID)
    );
END;
GO


/* ============================================================
   14. DIM CHANNEL
   ============================================================ */

IF OBJECT_ID(N'dw.DimChannel', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimChannel
    (
        ChannelKey      INT IDENTITY(1,1) NOT NULL,
        ChannelID       VARCHAR(30)       NOT NULL,

        ChannelName     NVARCHAR(100)     NOT NULL,
        ChannelType     NVARCHAR(50)      NULL,

        IsActive        BIT               NOT NULL DEFAULT 1,

        CreatedDate     DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate    DATETIME2(0)      NULL,

        CONSTRAINT PK_DimChannel
            PRIMARY KEY CLUSTERED (ChannelKey),

        CONSTRAINT UQ_DimChannel_ChannelID
            UNIQUE (ChannelID)
    );
END;
GO


/* ============================================================
   15. DIM PROMOTION
   ============================================================ */

IF OBJECT_ID(N'dw.DimPromotion', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimPromotion
    (
        PromotionKey       INT IDENTITY(1,1) NOT NULL,
        PromotionID        VARCHAR(30)       NOT NULL,

        PromotionName      NVARCHAR(150)     NOT NULL,
        PromotionType      NVARCHAR(50)      NULL,

        DiscountPercentage DECIMAL(5,2)      NULL,

        StartDate           DATE              NULL,
        EndDate             DATE              NULL,

        IsActive            BIT               NOT NULL DEFAULT 1,

        CreatedDate         DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate        DATETIME2(0)      NULL,

        CONSTRAINT PK_DimPromotion
            PRIMARY KEY CLUSTERED (PromotionKey),

        CONSTRAINT UQ_DimPromotion_PromotionID
            UNIQUE (PromotionID)
    );
END;
GO


/* ============================================================
   16. DIM ACCOUNT
   ============================================================ */

IF OBJECT_ID(N'dw.DimAccount', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimAccount
    (
        AccountKey       INT IDENTITY(1,1) NOT NULL,
        AccountCode      VARCHAR(30)       NOT NULL,

        AccountName      NVARCHAR(150)     NOT NULL,
        AccountType      NVARCHAR(50)      NULL,
        AccountCategory  NVARCHAR(100)     NULL,

        IsActive         BIT               NOT NULL DEFAULT 1,

        CreatedDate      DATETIME2(0)      NOT NULL DEFAULT SYSUTCDATETIME(),
        ModifiedDate     DATETIME2(0)      NULL,

        CONSTRAINT PK_DimAccount
            PRIMARY KEY CLUSTERED (AccountKey),

        CONSTRAINT UQ_DimAccount_AccountCode
            UNIQUE (AccountCode)
    );
END;
GO


/* ============================================================
   VALIDATION
   ============================================================ */

SELECT
    s.name AS SchemaName,
    t.name AS TableName
FROM sys.tables AS t
INNER JOIN sys.schemas AS s
    ON t.schema_id = s.schema_id
WHERE s.name = N'dw'
ORDER BY t.name;
GO