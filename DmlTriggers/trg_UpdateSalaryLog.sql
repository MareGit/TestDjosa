SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create trigger
CREATE TRIGGER [trg_UpdateSalaryLog]
    ON [Employees]
    AFTER UPDATE
    AS BEGIN
           IF UPDATE ([Salary])
               BEGIN
                   PRINT 'Salary updated for an employee.';
               END
       END
GO
ALTER TABLE [dbo].[Employees] ENABLE TRIGGER [trg_UpdateSalaryLog];