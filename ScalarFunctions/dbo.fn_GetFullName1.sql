SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create scalar function
CREATE FUNCTION fn_GetFullName1(@EmployeeID INT)
RETURNS NVARCHAR(120)
AS
BEGIN
    DECLARE @FullName NVARCHAR(120);
    SELECT @FullName = FirstName + ' ' + LastName
    FROM Employees1
    WHERE EmployeeID = @EmployeeID;
    RETURN @FullName;
END;
