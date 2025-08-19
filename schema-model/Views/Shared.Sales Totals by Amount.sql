SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Shared].[Sales Totals by Amount]
AS
SELECT [Shared].[Order Subtotals].Subtotal AS SaleAmount,
       [Shared].[Orders].OrderID,
       [Shared].[Customers].CompanyName,
       [Shared].[Orders].ShippedDate
FROM [Shared].[Customers]
     INNER JOIN ([Shared].[Orders]
                 INNER JOIN [Shared].[Order Subtotals]
                   ON [Shared].[Orders].OrderID = [Shared].[Order Subtotals].OrderID)
       ON [Shared].[Customers].CustomerID = [Shared].[Orders].CustomerID
WHERE ([Shared].[Order Subtotals].Subtotal > 2500)
  AND ([Shared].[Orders].ShippedDate BETWEEN '19970101' AND '19971231');
GO
