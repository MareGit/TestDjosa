SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View2]
AS
SELECT [ID],
       [Name],
       [Value],
       [CreatedDate]
FROM   [Table2];
GO
ALTER AUTHORIZATION
    ON [dbo].[View2]
    TO SCHEMA OWNER;