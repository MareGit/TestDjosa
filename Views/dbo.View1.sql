SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View1]
AS
SELECT [ID],
       [Name],
       [Value],
       [CreatedDate]
FROM   [Table1];
GO
ALTER AUTHORIZATION
    ON [dbo].[View1]
    TO SCHEMA OWNER;