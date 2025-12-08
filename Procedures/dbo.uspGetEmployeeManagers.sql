SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetEmployeeManagers]
@BusinessEntityID INT
AS
BEGIN
    SET NOCOUNT ON;
    -- Use recursive query to list out all Employees required for a particular Manager
    -- CTE name and columns
    WITH     [EMP_cte] ([BusinessEntityID], [OrganizationNode], [FirstName], [LastName], [JobTitle], [RecursionLevel])
    AS       (SELECT [e].[BusinessEntityID],
                     [e].[OrganizationNode],
                     [p].[FirstName],
                     [p].[LastName],
                     [e].[JobTitle],
                     0
              -- Get the initial Employee
              -- Join recursive member to anchor
              FROM   [HumanResources].[Employee] AS [e]
                     INNER JOIN
                     [Person].[Person] AS [p]
                     ON [p].[BusinessEntityID] = [e].[BusinessEntityID]
              WHERE  [e].[BusinessEntityID] = @BusinessEntityID
              UNION ALL
              -- Join back to Employee to return the manager name 
              SELECT [e].[BusinessEntityID],
                     [e].[OrganizationNode],
                     [p].[FirstName],
                     [p].[LastName],
                     [e].[JobTitle],
                     [RecursionLevel] + 1
              -- Outer select from the CTE
              FROM   [HumanResources].[Employee] AS [e]
                     INNER JOIN
                     [EMP_cte]
                     ON [e].[OrganizationNode] = [EMP_cte].[OrganizationNode].GetAncestor(1)
                     INNER JOIN
                     [Person].[Person] AS [p]
                     ON [p].[BusinessEntityID] = [e].[BusinessEntityID])
    SELECT   [EMP_cte].[RecursionLevel],
             [EMP_cte].[BusinessEntityID],
             [EMP_cte].[FirstName],
             [EMP_cte].[LastName],
             [EMP_cte].[OrganizationNode].ToString() AS [OrganizationNode],
             [p].[FirstName] AS 'ManagerFirstName',
             [p].[LastName] AS 'ManagerLastName'
    FROM     [EMP_cte]
             INNER JOIN
             [HumanResources].[Employee] AS [e]
             ON [EMP_cte].[OrganizationNode].GetAncestor(1) = [e].[OrganizationNode]
             INNER JOIN
             [Person].[Person] AS [p]
             ON [p].[BusinessEntityID] = [e].[BusinessEntityID]
    ORDER BY [RecursionLevel], [EMP_cte].[OrganizationNode].ToString()
    OPTION (MAXRECURSION 25);
END
GO
ALTER AUTHORIZATION
    ON [dbo].[uspGetEmployeeManagers]
    TO SCHEMA OWNER;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stored procedure using a recursive query to return the direct and indirect managers of the specified employee.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'uspGetEmployeeManagers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspGetEmployeeManagers. Enter a valid BusinessEntityID from the HumanResources.Employee table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'uspGetEmployeeManagers', @level2type=N'PARAMETER',@level2name=N'@BusinessEntityID'