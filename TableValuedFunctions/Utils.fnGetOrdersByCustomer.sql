SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Utils].[fnGetOrdersByCustomer]
(@CustomerID INT)
RETURNS TABLE 
AS
RETURN 
    (SELECT *
     FROM   [Sales].[Orders]
     WHERE  [CustomerID] = @CustomerID)
GO
ALTER AUTHORIZATION
    ON [Utils].[fnGetOrdersByCustomer]
    TO SCHEMA OWNER;