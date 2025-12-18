SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetProductListPrice]
(@ProductID INT, @OrderDate DATETIME)
-- Make sure we get all the prices!
RETURNS MONEY
AS
BEGIN
    DECLARE @ListPrice AS MONEY;
    SELECT @ListPrice = [plph].[ListPrice]
    FROM   [Production].[Product] AS [p]
           INNER JOIN
           [Production].[ProductListPriceHistory] AS [plph]
           ON [p].[ProductID] = [plph].[ProductID]
              AND [p].[ProductID] = @ProductID
              AND @OrderDate BETWEEN [plph].[StartDate] AND COALESCE ([plph].[EndDate], CONVERT (DATETIME, '99991231', 112));
    RETURN @ListPrice;
END
GO
ALTER AUTHORIZATION
    ON [dbo].[ufnGetProductListPrice]
    TO SCHEMA OWNER;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the scalar function ufnGetProductListPrice. Enter a valid ProductID from the Production.Product table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ufnGetProductListPrice', @level2type=N'PARAMETER',@level2name=N'@ProductID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the scalar function ufnGetProductListPrice. Enter a valid order date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ufnGetProductListPrice', @level2type=N'PARAMETER',@level2name=N'@OrderDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Scalar function returning the list price for a given product on a particular order date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ufnGetProductListPrice'