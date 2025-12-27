SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View6]
AS
SELECT [ID],
       [Name],
       [Value],
       [CreatedDate]
FROM   [Table6];
GO
ALTER AUTHORIZATION
    ON [dbo].[View6]
    TO SCHEMA OWNER;