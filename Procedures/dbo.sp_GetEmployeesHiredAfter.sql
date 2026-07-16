SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create stored procedure
CREATE PROCEDURE [sp_GetEmployeesHiredAfter]
@HireDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    SELECT [EmployeeID],
           [FirstName],
           [LastName],
           [HireDate],
           [Salary]
    FROM   [Employees]
    WHERE  [HireDate] > @HireDate;
END
GO
ALTER AUTHORIZATION
    ON [dbo].[sp_GetEmployeesHiredAfter]
    TO SCHEMA OWNER;