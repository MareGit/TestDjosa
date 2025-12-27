SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proc_Insert_Table14]
@Name NVARCHAR (50), @Value DECIMAL (10, 2)
AS
BEGIN
    INSERT  INTO [Table14] ([Name], [Value])
    VALUES                (@Name, @Value);
END
GO
ALTER AUTHORIZATION
    ON [dbo].[Proc_Insert_Table14]
    TO SCHEMA OWNER;