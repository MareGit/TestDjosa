SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Sales].[vwCustomerOrders]
AS
SELECT [c].[CustomerID],
       [c].[FullName],
       [o].[OrderID],
       [o].[Amount]
FROM   [Sales].[Customers] AS [c]
       LEFT OUTER JOIN
       [Sales].[Orders] AS [o]
       ON [c].[CustomerID] = [o].[CustomerID];
GO
ALTER AUTHORIZATION
    ON [Sales].[vwCustomerOrders]
    TO SCHEMA OWNER;