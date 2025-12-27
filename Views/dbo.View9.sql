SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [View9]
AS
SELECT [ID],
       [Name],
       [Value],
       [CreatedDate]
FROM   [Table9];
GO
ALTER AUTHORIZATION
    ON [dbo].[View9]
    TO SCHEMA OWNER;