/****** Object:  Table [dbo].[Employees]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
	[Salary] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


-- Create trigger
CREATE TRIGGER trg_UpdateSalaryLog
ON Employees
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Salary)
    BEGIN
        PRINT 'Salary updated for an employee.';
    END
END;

GO

ALTER TABLE [dbo].[Employees] ENABLE TRIGGER [trg_UpdateSalaryLog]
