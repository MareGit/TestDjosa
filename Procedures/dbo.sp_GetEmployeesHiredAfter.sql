SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create stored procedure
CREATE PROCEDURE [dbo].[sp_GetEmployeesHiredAfter]
    @HireDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    SELECT EmployeeID, FirstName, LastNameg, HireDate5
    FROM Employees
 
END;
