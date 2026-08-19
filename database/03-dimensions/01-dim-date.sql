USE EnterpriseAnalyticsDB;
GO

IF OBJECT_ID(N'dw.DimDate', N'U') IS NULL
BEGIN
    CREATE TABLE dw.DimDate
    (
        DateKey         INT             NOT NULL,
        FullDate        DATE            NOT NULL,

        DayNumber       TINYINT        NOT NULL,
        DayName         VARCHAR(20)     NOT NULL,

        WeekNumber      TINYINT        NOT NULL,

        MonthNumber     TINYINT        NOT NULL,
        MonthName       VARCHAR(20)     NOT NULL,

        QuarterNumber   TINYINT        NOT NULL,
        QuarterName     VARCHAR(10)     NOT NULL,

        YearNumber      SMALLINT        NOT NULL,

        IsWeekend       BIT             NOT NULL,

        FiscalYear      SMALLINT        NULL,
        FiscalPeriod    TINYINT         NULL,

        CONSTRAINT PK_DimDate
            PRIMARY KEY CLUSTERED (DateKey),

        CONSTRAINT UQ_DimDate_FullDate
            UNIQUE (FullDate)
    );
END;
GO