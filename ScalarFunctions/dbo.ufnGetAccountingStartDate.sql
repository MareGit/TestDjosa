SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetAccountingStartDate]
( )
RETURNS DATETIME
AS
BEGIN
    RETURN CONVERT (DATETIME, '20030701', 112);
END
GO
ALTER AUTHORIZATION
    ON [dbo].[ufnGetAccountingStartDate]
    TO SCHEMA OWNER;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Scalar function used in the uSalesOrderHeader trigger to set the ending account date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ufnGetAccountingStartDate'