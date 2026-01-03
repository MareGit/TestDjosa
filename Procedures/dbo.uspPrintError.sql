SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- uspPrintError prints error information about the error that caused 
-- execution to jump to the CATCH block of a TRY...CATCH construct. 
-- Should be executed from within the scope of a CATCH block otherwise 
-- it will return without printing any error information.
-- Print error information. 
CREATE PROCEDURE [dbo].[uspPrintError]
AS
BEGIN
    SET NOCOUNT ON;
    PRINT 'Error ' + CONVERT (VARCHAR (50), ERROR_NUMBER()) + ', Severity ' + CONVERT (VARCHAR (5), ERROR_SEVERITY()) + ', State ' + CONVERT (VARCHAR (5), ERROR_STATE()) + ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + ', Line ' + CONVERT (VARCHAR (5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
END
GO
ALTER AUTHORIZATION
    ON [dbo].[uspPrintError]
    TO SCHEMA OWNER;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prints error information about the error that caused execution to jump to the CATCH block of a TRY...CATCH construct. Should be executed from within the scope of a CATCH block otherwise it will return without printing any error information.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'uspPrintError'