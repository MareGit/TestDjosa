SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View8]
AS
SELECT [ID],
       [Name],
       [Value],
       [CreatedDate]
FROM   [Table8];
GO
ALTER AUTHORIZATION
    ON [dbo].[View8]
    TO SCHEMA OWNER;