SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create trigger
CREATE TRIGGER [dbo].[trg_UpdateSalaryLog]
ON [dbo].[Employees]
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Salary)
    BEGIN
        PRINT 'Salary updateed for an employee.';
    END
END;

GO
ALTER TABLE [dbo].[Employees] ENABLE TRIGGER [trg_UpdateSalaryLog]