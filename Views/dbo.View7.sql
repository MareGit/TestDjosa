SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View7]
AS
SELECT [ID],
       [Name],
       [Value],
       [CreatedDate]
FROM   [Table7];
GO
ALTER AUTHORIZATION
    ON [dbo].[View7]
    TO SCHEMA OWNER;