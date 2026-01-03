SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetAccountingEndDate]
( )
RETURNS DATETIME
AS
BEGIN
    RETURN DATEADD([millisecond], -2, CONVERT (DATETIME, '20040701', 112));
END
GO
ALTER AUTHORIZATION
    ON [dbo].[ufnGetAccountingEndDate]
    TO SCHEMA OWNER;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Scalar function used in the uSalesOrderHeader trigger to set the starting account date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ufnGetAccountingEndDate'