SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create scalar function
CREATE FUNCTION [fn_GetFullName]
(@EmployeeID INT)
RETURNS NVARCHAR (120)
AS
BEGIN
    DECLARE @FullName AS NVARCHAR (120);
    SELECT @FullName = [FirstName] + ' ' + [LastName]
    FROM   [Employees]
    WHERE  [EmployeeID] = @EmployeeID;
    RETURN @FullName;
END
GO
ALTER AUTHORIZATION
    ON [dbo].[fn_GetFullName]
    TO SCHEMA OWNER;