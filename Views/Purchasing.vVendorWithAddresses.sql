SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Purchasing].[vVendorWithAddresses]
AS
SELECT [v].[BusinessEntityID],
       [v].[Name],
       [at].[Name] AS [AddressType],
       [a].[AddressLine1],
       [a].[AddressLine2],
       [a].[City],
       [sp].[Name] AS [StateProvinceName],
       [a].[PostalCode],
       [cr].[Name] AS [CountryRegionName]
FROM   [Purchasing].[Vendor] AS [v]
       INNER JOIN
       [Person].[BusinessEntityAddress] AS [bea]
       ON [bea].[BusinessEntityID] = [v].[BusinessEntityID]
       INNER JOIN
       [Person].[Address] AS [a]
       ON [a].[AddressID] = [bea].[AddressID]
       INNER JOIN
       [Person].[StateProvince] AS [sp]
       ON [sp].[StateProvinceID] = [a].[StateProvinceID]
       INNER JOIN
       [Person].[CountryRegion] AS [cr]
       ON [cr].[CountryRegionCode] = [sp].[CountryRegionCode]
       INNER JOIN
       [Person].[AddressType] AS [at]
       ON [at].[AddressTypeID] = [bea].[AddressTypeID];
GO
ALTER AUTHORIZATION
    ON [Purchasing].[vVendorWithAddresses]
    TO SCHEMA OWNER;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor (company) names and addresses .' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'VIEW',@level1name=N'vVendorWithAddresses'