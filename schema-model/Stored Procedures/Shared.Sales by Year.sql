SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [Shared].[Sales by Year] @Beginning_Date DATETIME, @Ending_Date DATETIME
AS
SELECT [Shared].[Orders].ShippedDate,
       [Shared].[Orders].OrderID,
       [Shared].[Order Subtotals].Subtotal,
       DATENAME(yy, ShippedDate) AS Year
FROM [Shared].[Orders]
     INNER JOIN [Shared].[Order Subtotals]
       ON [Shared].[Orders].OrderID = [Shared].[Order Subtotals].OrderID
WHERE [Shared].[Orders].ShippedDate BETWEEN @Beginning_Date AND @Ending_Date;
GO
