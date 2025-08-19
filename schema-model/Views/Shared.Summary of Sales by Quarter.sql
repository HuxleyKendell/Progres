SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Shared].[Summary of Sales by Quarter]
AS
SELECT [Shared].[Orders].ShippedDate,
       [Shared].[Orders].OrderID,
       [Shared].[Order Subtotals].Subtotal
FROM [Shared].[Orders]
     INNER JOIN [Shared].[Order Subtotals]
       ON [Shared].[Orders].OrderID = [Shared].[Order Subtotals].OrderID
WHERE [Shared].[Orders].ShippedDate IS NOT NULL;
--ORDER BY [Shared].[Orders].ShippedDate
GO
