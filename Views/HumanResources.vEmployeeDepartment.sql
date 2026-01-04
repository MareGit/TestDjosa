SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [HumanResources].[vEmployeeDepartment]
AS
SELECT [e].[BusinessEntityID],
       [p].[Title],
       [p].[FirstName],
       [p].[MiddleName],
       [p].[LastName],
       [p].[Suffix],
       [e].[JobTitle],
       [d].[Name] AS [Department],
       [d].[GroupName],
       [edh].[StartDate]
FROM   [HumanResources].[Employee] AS [e]
       INNER JOIN
       [Person].[Person] AS [p]
       ON [p].[BusinessEntityID] = [e].[BusinessEntityID]
       INNER JOIN
       [HumanResources].[EmployeeDepartmentHistory] AS [edh]
       ON [e].[BusinessEntityID] = [edh].[BusinessEntityID]
       INNER JOIN
       [HumanResources].[Department] AS [d]
       ON [edh].[DepartmentID] = [d].[DepartmentID]
WHERE  [edh].[EndDate] IS NULL;
GO
ALTER AUTHORIZATION
    ON [HumanResources].[vEmployeeDepartment]
    TO SCHEMA OWNER;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Returns employee name, title, and current department.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'VIEW',@level1name=N'vEmployeeDepartment'