USE EnterpriseAnalyticsDB;
GO

/* ============================================================
   ETL BATCH AUDIT
   ============================================================ */

IF OBJECT_ID(N'audit.ETLBatch', N'U') IS NULL
BEGIN
    CREATE TABLE audit.ETLBatch
    (
        BatchID             BIGINT IDENTITY(1,1) NOT NULL,

        PipelineName        VARCHAR(200) NOT NULL,
        SourceSystem        VARCHAR(100) NULL,

        StartTime           DATETIME2(3) NOT NULL,
        EndTime             DATETIME2(3) NULL,

        Status              VARCHAR(30) NOT NULL,

        RowsRead            BIGINT NOT NULL DEFAULT 0,
        RowsInserted        BIGINT NOT NULL DEFAULT 0,
        RowsUpdated         BIGINT NOT NULL DEFAULT 0,
        RowsRejected        BIGINT NOT NULL DEFAULT 0,

        ErrorMessage        NVARCHAR(MAX) NULL,

        CreatedAt           DATETIME2(3) NOT NULL
            DEFAULT SYSUTCDATETIME(),

        CONSTRAINT PK_ETLBatch
            PRIMARY KEY CLUSTERED (BatchID)
    );
END;
GO


/* ============================================================
   ETL ERROR LOG
   ============================================================ */

IF OBJECT_ID(N'audit.ETLErrorLog', N'U') IS NULL
BEGIN
    CREATE TABLE audit.ETLErrorLog
    (
        ErrorLogID          BIGINT IDENTITY(1,1) NOT NULL,

        BatchID             BIGINT NULL,

        PipelineName        VARCHAR(200) NOT NULL,
        StepName            VARCHAR(200) NULL,

        ErrorNumber         INT NULL,
        ErrorMessage        NVARCHAR(MAX) NOT NULL,

        ErrorDate           DATETIME2(3) NOT NULL
            DEFAULT SYSUTCDATETIME(),

        SourceRecordID      VARCHAR(200) NULL,

        CONSTRAINT PK_ETLErrorLog
            PRIMARY KEY CLUSTERED (ErrorLogID)
    );
END;
GO


/* ============================================================
   DATA QUALITY RESULTS
   ============================================================ */

IF OBJECT_ID(N'audit.DataQualityResult', N'U') IS NULL
BEGIN
    CREATE TABLE audit.DataQualityResult
    (
        DataQualityResultID BIGINT IDENTITY(1,1) NOT NULL,

        BatchID             BIGINT NULL,

        TableName           VARCHAR(200) NOT NULL,
        ColumnName          VARCHAR(200) NULL,
        RuleName            VARCHAR(200) NOT NULL,

        TotalRows           BIGINT NOT NULL DEFAULT 0,
        FailedRows          BIGINT NOT NULL DEFAULT 0,

        Status              VARCHAR(30) NOT NULL,

        ExecutedAt          DATETIME2(3) NOT NULL
            DEFAULT SYSUTCDATETIME(),

        CONSTRAINT PK_DataQualityResult
            PRIMARY KEY CLUSTERED (DataQualityResultID)
    );
END;
GO