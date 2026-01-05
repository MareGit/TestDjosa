SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View4]
AS
SELECT [ID],
       [Name],
       [Value],
       [CreatedDate]
FROM   [Table4];
GO
ALTER AUTHORIZATION
    ON [dbo].[View4]
    TO SCHEMA OWNER;