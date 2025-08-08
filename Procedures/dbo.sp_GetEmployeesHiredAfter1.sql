SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create stored procedure
CREATE PROCEDURE sp_GetEmployeesHiredAfter1
    @HireDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    SELECT EmployeeID, FirstName, LastName, HireDate, Salary
    FROM Employees1
    WHERE HireDate > @HireDate;
END;
