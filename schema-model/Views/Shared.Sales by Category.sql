SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Shared].[Sales by Category]
AS
SELECT [Shared].[Categories].CategoryID,
       [Shared].[Categories].CategoryName,
       [Shared].[Products].ProductName,
       SUM([Shared].[Order Details Extended].ExtendedPrice) AS ProductSales
FROM [Shared].[Categories]
     INNER JOIN ([Shared].[Products]
                 INNER JOIN ([Shared].[Orders]
                             INNER JOIN [Shared].[Order Details Extended]
                               ON [Shared].[Orders].OrderID = [Shared].[Order Details Extended].OrderID)
                   ON [Shared].[Products].ProductID = [Shared].[Order Details Extended].ProductID)
       ON [Shared].[Categories].CategoryID = [Shared].[Products].CategoryID
WHERE [Shared].[Orders].OrderDate BETWEEN '19970101' AND '19971231'
GROUP BY [Shared].[Categories].CategoryID,
         [Shared].[Categories].CategoryName,
         [Shared].[Products].ProductName;
--ORDER BY [Shared].[Products].ProductName
GO
