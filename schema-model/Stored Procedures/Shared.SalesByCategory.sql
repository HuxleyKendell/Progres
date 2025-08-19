SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [Shared].[SalesByCategory] @CategoryName NVARCHAR(15), @OrdYear NVARCHAR(4) = '1998'
AS
IF @OrdYear != '1996' AND @OrdYear != '1997' AND @OrdYear != '1998'
BEGIN
    SELECT @OrdYear = '1998';
END;
SELECT ProductName,
       TotalPurchase = ROUND(SUM(CONVERT(DECIMAL(14, 2),
                               OD.Quantity * (1 - OD.Discount) * OD.UnitPrice)), 0)
FROM [Shared].[Order Details] OD,
     [Shared].[Orders] O,
     [Shared].[Products] P,
     [Shared].[Categories] C
WHERE OD.OrderID = O.OrderID
  AND OD.ProductID = P.ProductID
  AND P.CategoryID = C.CategoryID
  AND C.CategoryName = @CategoryName
  AND SUBSTRING(CONVERT(NVARCHAR(22), O.OrderDate, 111), 1, 4) = @OrdYear
GROUP BY ProductName
ORDER BY ProductName;
GO
