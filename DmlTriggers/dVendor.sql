SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Purchasing].[dVendor]
    ON [Purchasing].[Vendor]
    INSTEAD OF DELETE
    NOT FOR REPLICATION
    AS BEGIN
           DECLARE @Count AS INT;
           SET @Count = @@ROWCOUNT;
           IF @Count = 0
               RETURN;
           SET NOCOUNT ON;
           BEGIN TRY
               DECLARE @DeleteCount AS INT;
               SELECT @DeleteCount = COUNT(*)
               FROM   [deleted];
               IF @DeleteCount > 0
                   BEGIN
                       -- Message
                       -- Severity.
                       RAISERROR (N'Vendors cannot be deleted. They can only be marked as not active.', 10, 1);
                       -- State.
                       -- Rollback any active or uncommittable transactions
                       -- Rollback any active or uncommittable transactions before
                       -- inserting information in the ErrorLog
                       IF @@TRANCOUNT > 0
                           BEGIN
                               ROLLBACK;
                           END
                   END
           END TRY
           BEGIN CATCH
               EXECUTE [dbo].[uspPrintError] ;
               IF @@TRANCOUNT > 0
                   BEGIN
                       ROLLBACK;
                   END
               EXECUTE [dbo].[uspLogError] ;
           END CATCH
       END
GO
ALTER TABLE [Purchasing].[Vendor] ENABLE TRIGGER [dVendor];
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'INSTEAD OF DELETE trigger which keeps Vendors from being deleted.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'TRIGGER',@level2name=N'dVendor'