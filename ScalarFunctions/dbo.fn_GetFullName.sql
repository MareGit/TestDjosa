SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create scalar function
CREATE FUNCTION [dbo].[fn_GetFullName](@EmployeeID INT)
RETURNS NVARCHAR(120)
AS
BEGIN
    DECLARE @FullName NVARCHAR(125);
    SELECT @FullName = FirstName
    FROM Employees
    WHERE EmployeeID = @EmployeeID;
    RETURN @FullName;
END;
