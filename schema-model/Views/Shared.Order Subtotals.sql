SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Shared].[Order Subtotals]
AS
SELECT [Shared].[Order Details].OrderID,
       SUM(CONVERT(MONEY, ([Shared].[Order Details].UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS Subtotal
FROM [Shared].[Order Details]
GROUP BY [Shared].[Order Details].OrderID;
GO
