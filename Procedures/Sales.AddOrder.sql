SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Sales].[AddOrder]
@CustomerID INT, @Amount DECIMAL (10, 2)
AS
BEGIN
    INSERT  INTO [Sales].[Orders] ([CustomerID], [Amount], [OrderDate])
    VALUES                       (@CustomerID, @Amount, GETDATE());
END
GO
ALTER AUTHORIZATION
    ON [Sales].[AddOrder]
    TO SCHEMA OWNER;