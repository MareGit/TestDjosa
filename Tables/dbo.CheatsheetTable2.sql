SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheatsheetTable2] (
    [ID]        INT             NULL,
    [FirstName] NVARCHAR (50)   COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [LastName]  NVARCHAR (50)   COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [Email]     NVARCHAR (100)  COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [Age]       INT             NULL,
    [Salary]    INT             NULL,
    [OrderDate] DATE            NULL,
    [Doc]       VARBINARY (MAX) NULL,
    [HiddenCol] INT             NULL,
    [RowVer]    TIMESTAMP       NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
ALTER AUTHORIZATION
    ON [dbo].[CheatsheetTable2]
    TO SCHEMA OWNER;