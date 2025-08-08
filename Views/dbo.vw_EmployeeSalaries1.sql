SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create view
CREATE VIEW vw_EmployeeSalaries1 AS
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees1;
