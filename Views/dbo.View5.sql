SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View5]
AS
SELECT [ID],
       [Name],
       [Value],
       [CreatedDate]
FROM   [Table5];
GO
ALTER AUTHORIZATION
    ON [dbo].[View5]
    TO SCHEMA OWNER;