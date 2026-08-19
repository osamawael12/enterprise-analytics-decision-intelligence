/*
    Enterprise Analytics & Decision Intelligence Platform
    Database: EnterpriseAnalyticsDB

    Purpose:
    Central analytical data warehouse for enterprise reporting,
    analytics, machine learning, AI, and decision intelligence.
*/

USE master;
GO

IF DB_ID(N'EnterpriseAnalyticsDB') IS NULL
BEGIN
    CREATE DATABASE EnterpriseAnalyticsDB;
END;
GO

ALTER DATABASE EnterpriseAnalyticsDB
SET RECOVERY FULL;
GO

USE EnterpriseAnalyticsDB;
GO