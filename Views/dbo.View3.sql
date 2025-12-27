SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View3]
AS
SELECT [ID],
       [Name],
       [Value],
       [CreatedDate]
FROM   [Table3];
GO
ALTER AUTHORIZATION
    ON [dbo].[View3]
    TO SCHEMA OWNER;