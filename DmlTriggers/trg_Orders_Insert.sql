SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [trg_Orders_Insert]
    ON [Sales].[Orders]
    AFTER INSERT
    AS BEGIN
           PRINT 'Order inserted!';
       END
GO
ALTER TABLE [Sales].[Orders] ENABLE TRIGGER [trg_Orders_Insert];