USE EnterpriseAnalyticsDB;
GO

/* ============================================================
   ENTERPRISE ANALYTICS & DECISION INTELLIGENCE PLATFORM
   FACT TABLES
   ============================================================ */


/* ============================================================
   01. FACT SALES
   Grain: One row per sales order line
   ============================================================ */

IF OBJECT_ID(N'dw.FactSales', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactSales
    (
        SalesKey            BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,
        CustomerKey         INT NOT NULL,
        ProductKey          INT NOT NULL,
        StoreKey            INT NOT NULL,
        ChannelKey          INT NOT NULL,
        PromotionKey        INT NOT NULL,

        OrderNumber         VARCHAR(50) NOT NULL,
        OrderLineNumber     INT NOT NULL,

        Quantity            DECIMAL(18,4) NOT NULL,
        UnitPrice           DECIMAL(19,4) NOT NULL,
        DiscountAmount      DECIMAL(19,4) NOT NULL DEFAULT 0,
        GrossSales          DECIMAL(19,4) NOT NULL,
        NetSales            DECIMAL(19,4) NOT NULL,
        CostAmount          DECIMAL(19,4) NOT NULL,
        GrossProfit         DECIMAL(19,4) NOT NULL,
        MarginPercentage    DECIMAL(9,4) NULL,

        LoadDate            DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID             BIGINT NULL,

        CONSTRAINT PK_FactSales
            PRIMARY KEY CLUSTERED (SalesKey)
    );
END;
GO


/* ============================================================
   02. FACT RETURNS
   Grain: One row per returned sales order line
   ============================================================ */

IF OBJECT_ID(N'dw.FactReturns', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactReturns
    (
        ReturnKey           BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,
        CustomerKey         INT NOT NULL,
        ProductKey          INT NOT NULL,
        StoreKey            INT NOT NULL,
        ChannelKey          INT NOT NULL,

        ReturnNumber        VARCHAR(50) NOT NULL,
        OrderNumber         VARCHAR(50) NULL,
        OrderLineNumber     INT NULL,

        ReturnedQuantity     DECIMAL(18,4) NOT NULL,
        ReturnAmount         DECIMAL(19,4) NOT NULL,
        ReturnCost           DECIMAL(19,4) NOT NULL,

        LoadDate             DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID              BIGINT NULL,

        CONSTRAINT PK_FactReturns
            PRIMARY KEY CLUSTERED (ReturnKey)
    );
END;
GO


/* ============================================================
   03. FACT PURCHASES
   Grain: One row per purchase order line
   ============================================================ */

IF OBJECT_ID(N'dw.FactPurchases', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactPurchases
    (
        PurchaseKey         BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,
        SupplierKey         INT NOT NULL,
        ProductKey          INT NOT NULL,
        WarehouseKey        INT NOT NULL,

        PurchaseOrderNumber VARCHAR(50) NOT NULL,
        PurchaseLineNumber  INT NOT NULL,

        OrderedQuantity     DECIMAL(18,4) NOT NULL,
        ReceivedQuantity    DECIMAL(18,4) NOT NULL DEFAULT 0,

        UnitCost            DECIMAL(19,4) NOT NULL,
        PurchaseAmount      DECIMAL(19,4) NOT NULL,

        LoadDate            DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID             BIGINT NULL,

        CONSTRAINT PK_FactPurchases
            PRIMARY KEY CLUSTERED (PurchaseKey)
    );
END;
GO


/* ============================================================
   04. FACT INVENTORY
   Grain: One row per product, warehouse and snapshot date
   ============================================================ */

IF OBJECT_ID(N'dw.FactInventory', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactInventory
    (
        InventoryKey       BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,
        ProductKey          INT NOT NULL,
        WarehouseKey        INT NOT NULL,

        OnHandQuantity      DECIMAL(18,4) NOT NULL,
        AvailableQuantity   DECIMAL(18,4) NOT NULL,
        ReservedQuantity    DECIMAL(18,4) NOT NULL,
        InventoryValue      DECIMAL(19,4) NOT NULL,

        LoadDate            DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID             BIGINT NULL,

        CONSTRAINT PK_FactInventory
            PRIMARY KEY CLUSTERED (InventoryKey)
    );
END;
GO


/* ============================================================
   05. FACT STOCK MOVEMENT
   Grain: One row per inventory movement transaction
   ============================================================ */

IF OBJECT_ID(N'dw.FactStockMovement', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactStockMovement
    (
        StockMovementKey    BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,
        ProductKey          INT NOT NULL,
        WarehouseKey        INT NOT NULL,

        MovementNumber      VARCHAR(50) NOT NULL,
        MovementType        VARCHAR(30) NOT NULL,

        MovementQuantity    DECIMAL(18,4) NOT NULL,
        MovementValue       DECIMAL(19,4) NOT NULL,

        LoadDate            DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID             BIGINT NULL,

        CONSTRAINT PK_FactStockMovement
            PRIMARY KEY CLUSTERED (StockMovementKey)
    );
END;
GO


/* ============================================================
   06. FACT ATTENDANCE
   Grain: One row per employee per attendance date
   ============================================================ */

IF OBJECT_ID(N'dw.FactAttendance', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactAttendance
    (
        AttendanceKey       BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,
        EmployeeKey         INT NOT NULL,
        DepartmentKey       INT NOT NULL,

        WorkedHours         DECIMAL(10,2) NOT NULL DEFAULT 0,
        OvertimeHours       DECIMAL(10,2) NOT NULL DEFAULT 0,

        IsAbsent            BIT NOT NULL DEFAULT 0,
        IsLate              BIT NOT NULL DEFAULT 0,

        LoadDate            DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID             BIGINT NULL,

        CONSTRAINT PK_FactAttendance
            PRIMARY KEY CLUSTERED (AttendanceKey)
    );
END;
GO


/* ============================================================
   07. FACT PAYROLL
   Grain: One row per employee per payroll period
   ============================================================ */

IF OBJECT_ID(N'dw.FactPayroll', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactPayroll
    (
        PayrollKey          BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,
        EmployeeKey         INT NOT NULL,
        DepartmentKey       INT NOT NULL,

        PayrollPeriod       DATE NOT NULL,

        BaseSalary          DECIMAL(19,4) NOT NULL,
        Allowances          DECIMAL(19,4) NOT NULL DEFAULT 0,
        Deductions          DECIMAL(19,4) NOT NULL DEFAULT 0,
        NetSalary           DECIMAL(19,4) NOT NULL,

        LoadDate            DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID             BIGINT NULL,

        CONSTRAINT PK_FactPayroll
            PRIMARY KEY CLUSTERED (PayrollKey)
    );
END;
GO


/* ============================================================
   08. FACT FINANCE
   Grain: One row per financial transaction
   ============================================================ */

IF OBJECT_ID(N'dw.FactFinance', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactFinance
    (
        FinanceKey          BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,
        AccountKey          INT NOT NULL,
        DepartmentKey       INT NOT NULL,

        TransactionNumber    VARCHAR(50) NOT NULL,
        TransactionType      VARCHAR(30) NULL,

        DebitAmount          DECIMAL(19,4) NOT NULL DEFAULT 0,
        CreditAmount         DECIMAL(19,4) NOT NULL DEFAULT 0,
        Amount               DECIMAL(19,4) NOT NULL,

        Description          NVARCHAR(500) NULL,

        LoadDate             DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID              BIGINT NULL,

        CONSTRAINT PK_FactFinance
            PRIMARY KEY CLUSTERED (FinanceKey)
    );
END;
GO


/* ============================================================
   09. FACT BUDGET
   Grain: One row per account, department and budget period
   ============================================================ */

IF OBJECT_ID(N'dw.FactBudget', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactBudget
    (
        BudgetKey           BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,
        AccountKey          INT NOT NULL,
        DepartmentKey       INT NOT NULL,

        BudgetPeriod        DATE NOT NULL,

        BudgetAmount        DECIMAL(19,4) NOT NULL,

        LoadDate            DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID             BIGINT NULL,

        CONSTRAINT PK_FactBudget
            PRIMARY KEY CLUSTERED (BudgetKey)
    );
END;
GO


/* ============================================================
   10. FACT MARKETING
   Grain: One row per campaign activity/date/target entity
   ============================================================ */

IF OBJECT_ID(N'dw.FactMarketing', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactMarketing
    (
        MarketingKey        BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,
        CustomerKey         INT NULL,
        PromotionKey        INT NOT NULL,

        CampaignActivityID  VARCHAR(50) NOT NULL,

        MarketingSpend      DECIMAL(19,4) NOT NULL DEFAULT 0,
        Impressions         BIGINT NOT NULL DEFAULT 0,
        Responses           BIGINT NOT NULL DEFAULT 0,
        Conversions         BIGINT NOT NULL DEFAULT 0,

        LoadDate            DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID             BIGINT NULL,

        CONSTRAINT PK_FactMarketing
            PRIMARY KEY CLUSTERED (MarketingKey)
    );
END;
GO


/* ============================================================
   11. FACT TARGETS
   Grain: One row per target entity and target period
   ============================================================ */

IF OBJECT_ID(N'dw.FactTargets', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactTargets
    (
        TargetKey           BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,

        TargetType          VARCHAR(50) NOT NULL,
        TargetEntityID      VARCHAR(50) NOT NULL,

        TargetPeriod        DATE NOT NULL,

        TargetAmount        DECIMAL(19,4) NULL,
        TargetQuantity      DECIMAL(18,4) NULL,

        LoadDate            DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID             BIGINT NULL,

        CONSTRAINT PK_FactTargets
            PRIMARY KEY CLUSTERED (TargetKey)
    );
END;
GO


/* ============================================================
   12. FACT SUPPLIER PAYMENT
   Grain: One row per supplier payment transaction
   ============================================================ */

IF OBJECT_ID(N'dw.FactSupplierPayment', N'U') IS NULL
BEGIN
    CREATE TABLE dw.FactSupplierPayment
    (
        SupplierPaymentKey  BIGINT IDENTITY(1,1) NOT NULL,

        DateKey             INT NOT NULL,
        SupplierKey         INT NOT NULL,
        AccountKey          INT NOT NULL,

        PaymentNumber       VARCHAR(50) NOT NULL,

        PaymentAmount       DECIMAL(19,4) NOT NULL,

        PaymentMethod       VARCHAR(30) NULL,
        PaymentStatus       VARCHAR(30) NULL,

        LoadDate            DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
        BatchID             BIGINT NULL,

        CONSTRAINT PK_FactSupplierPayment
            PRIMARY KEY CLUSTERED (SupplierPaymentKey)
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
  AND t.name LIKE N'Fact%'
ORDER BY t.name;
GO