USE EnterpriseAnalyticsDB;
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
        IsWeekend,
        FiscalYear,
        FiscalPeriod
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
        0,
        NULL,
        NULL
    );
END;
GO

