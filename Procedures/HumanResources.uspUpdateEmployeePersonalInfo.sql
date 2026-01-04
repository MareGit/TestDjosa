SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [HumanResources].[uspUpdateEmployeePersonalInfo]
@BusinessEntityID INT, @NationalIDNumber NVARCHAR (15), @BirthDate DATETIME, @MaritalStatus NCHAR (1), @Gender NCHAR (1)
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE [HumanResources].[Employee]
        SET    [NationalIDNumber] = @NationalIDNumber,
               [BirthDate]        = @BirthDate,
               [MaritalStatus]    = @MaritalStatus,
               [Gender]           = @Gender
        WHERE  [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspLogError] ;
    END CATCH
END
GO
ALTER AUTHORIZATION
    ON [HumanResources].[uspUpdateEmployeePersonalInfo]
    TO SCHEMA OWNER;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Updates the Employee table with the values specified in the input parameters for the given EmployeeID.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeePersonalInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspUpdateEmployeePersonalInfo. Enter a valid BusinessEntityID from the HumanResources.Employee table.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeePersonalInfo', @level2type=N'PARAMETER',@level2name=N'@BusinessEntityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a national ID for the employee.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeePersonalInfo', @level2type=N'PARAMETER',@level2name=N'@NationalIDNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a birth date for the employee.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeePersonalInfo', @level2type=N'PARAMETER',@level2name=N'@BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a marital status for the employee.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeePersonalInfo', @level2type=N'PARAMETER',@level2name=N'@MaritalStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a gender for the employee.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeePersonalInfo', @level2type=N'PARAMETER',@level2name=N'@Gender'