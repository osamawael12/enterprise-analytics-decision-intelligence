USE EnterpriseAnalyticsDB;
GO

/*
    Database Schemas
*/

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'stg'
)
BEGIN
    EXEC(N'CREATE SCHEMA stg');
END;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'dw'
)
BEGIN
    EXEC(N'CREATE SCHEMA dw');
END;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'mart'
)
BEGIN
    EXEC(N'CREATE SCHEMA mart');
END;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'ref'
)
BEGIN
    EXEC(N'CREATE SCHEMA ref');
END;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'audit'
)
BEGIN
    EXEC(N'CREATE SCHEMA audit');
END;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'security'
)
BEGIN
    EXEC(N'CREATE SCHEMA security');
END;
GO