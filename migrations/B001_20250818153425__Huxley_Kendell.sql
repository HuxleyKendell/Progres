SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Creating schemas'
GO
IF SCHEMA_ID(N'${schema}') IS NULL
EXEC sp_executesql N'CREATE SCHEMA [${schema}]
AUTHORIZATION [dbo]'
GO
PRINT N'Creating [${schema}].[CustomersFeedback]'
GO
CREATE TABLE [${schema}].[CustomersFeedback]
(
[FeedbackID] [int] NOT NULL IDENTITY(1, 1),
[CustomerID] [nchar] (5) NULL,
[FeedbackDate] [datetime] NULL CONSTRAINT [DF__Customers__Feedb__29572725] DEFAULT (getdate()),
[Rating] [int] NULL,
[Comments] [nvarchar] (500) NULL
)
GO
PRINT N'Creating primary key [PK__Customer__6A4BEDF61A949274] on [${schema}].[CustomersFeedback]'
GO
ALTER TABLE [${schema}].[CustomersFeedback] ADD CONSTRAINT [PK__Customer__6A4BEDF61A949274] PRIMARY KEY CLUSTERED ([FeedbackID])
GO
PRINT N'Creating [${schema}].[LoyaltyProgram]'
GO
CREATE TABLE [${schema}].[LoyaltyProgram]
(
[ProgramID] [int] NOT NULL IDENTITY(1, 1),
[ProgramName] [nvarchar] (50) NOT NULL,
[PointsMultiplier] [decimal] (3, 2) NULL CONSTRAINT [DF__LoyaltyPr__Point__239E4DCF] DEFAULT ((1.0))
)
GO
PRINT N'Creating primary key [PK__LoyaltyP__7525603848DEBC46] on [${schema}].[LoyaltyProgram]'
GO
ALTER TABLE [${schema}].[LoyaltyProgram] ADD CONSTRAINT [PK__LoyaltyP__7525603848DEBC46] PRIMARY KEY CLUSTERED ([ProgramID])
GO
PRINT N'Creating [${schema}].[MaintenanceLog]'
GO
CREATE TABLE [${schema}].[MaintenanceLog]
(
[LogID] [int] NOT NULL IDENTITY(1, 1),
[FlightID] [int] NULL,
[MaintenanceDate] [datetime] NULL CONSTRAINT [DF__Maintenan__Maint__31EC6D26] DEFAULT (getdate()),
[Description] [nvarchar] (500) NULL,
[MaintenanceStatus] [nvarchar] (20) NULL CONSTRAINT [DF__Maintenan__Maint__32E0915F] DEFAULT ('Pending')
)
GO
PRINT N'Creating primary key [PK__Maintena__5E5499A8A7E7CD24] on [${schema}].[MaintenanceLog]'
GO
ALTER TABLE [${schema}].[MaintenanceLog] ADD CONSTRAINT [PK__Maintena__5E5499A8A7E7CD24] PRIMARY KEY CLUSTERED ([LogID])
GO
PRINT N'Creating [${schema}].[Order Details]'
GO
CREATE TABLE [${schema}].[Order Details]
(
[OrderID] [int] NOT NULL,
[ProductID] [int] NOT NULL,
[UnitPrice] [money] NOT NULL CONSTRAINT [DF_Order_Details_UnitPrice] DEFAULT ((0)),
[Quantity] [smallint] NOT NULL CONSTRAINT [DF_Order_Details_Quantity] DEFAULT ((1)),
[Discount] [real] NOT NULL CONSTRAINT [DF_Order_Details_Discount] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_Order_Details] on [${schema}].[Order Details]'
GO
ALTER TABLE [${schema}].[Order Details] ADD CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED ([OrderID], [ProductID])
GO
PRINT N'Creating index [OrderID] on [${schema}].[Order Details]'
GO
CREATE NONCLUSTERED INDEX [OrderID] ON [${schema}].[Order Details] ([OrderID])
GO
PRINT N'Creating index [OrdersOrder_Details] on [${schema}].[Order Details]'
GO
CREATE NONCLUSTERED INDEX [OrdersOrder_Details] ON [${schema}].[Order Details] ([OrderID])
GO
PRINT N'Creating index [ProductID] on [${schema}].[Order Details]'
GO
CREATE NONCLUSTERED INDEX [ProductID] ON [${schema}].[Order Details] ([ProductID])
GO
PRINT N'Creating index [ProductsOrder_Details] on [${schema}].[Order Details]'
GO
CREATE NONCLUSTERED INDEX [ProductsOrder_Details] ON [${schema}].[Order Details] ([ProductID])
GO
PRINT N'Creating [${schema}].[OrderAuditLog]'
GO
CREATE TABLE [${schema}].[OrderAuditLog]
(
[AuditID] [int] NOT NULL IDENTITY(1, 1),
[OrderID] [int] NULL,
[ChangeDate] [datetime] NULL CONSTRAINT [DF__OrderAudi__Chang__4222D4EF] DEFAULT (getdate()),
[ChangeDescription] [nvarchar] (500) NULL
)
GO
PRINT N'Creating primary key [PK__OrderAud__A17F23B8298306B2] on [${schema}].[OrderAuditLog]'
GO
ALTER TABLE [${schema}].[OrderAuditLog] ADD CONSTRAINT [PK__OrderAud__A17F23B8298306B2] PRIMARY KEY CLUSTERED ([AuditID])
GO
PRINT N'Creating [${schema}].[Orders]'
GO
CREATE TABLE [${schema}].[Orders]
(
[OrderID] [int] NOT NULL IDENTITY(1, 1),
[CustomerID] [nchar] (5) NULL,
[EmployeeID] [int] NULL,
[OrderDate] [datetime] NULL,
[RequiredDate] [datetime] NULL,
[ShippedDate] [datetime] NULL,
[ShipVia] [int] NULL,
[Freight] [money] NULL CONSTRAINT [DF_Orders_Freight] DEFAULT ((0)),
[ShipName] [nvarchar] (40) NULL,
[ShipAddress] [nvarchar] (60) NULL,
[ShipCity] [nvarchar] (15) NULL,
[ShipRegion] [nvarchar] (15) NULL,
[ShipPostalCode] [nvarchar] (10) NULL,
[ShipCountry] [nvarchar] (15) NULL,
[ShipCountryCode] [int] NULL
)
GO
PRINT N'Creating primary key [PK_Orders] on [${schema}].[Orders]'
GO
ALTER TABLE [${schema}].[Orders] ADD CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderID])
GO
PRINT N'Creating index [CustomerID] on [${schema}].[Orders]'
GO
CREATE NONCLUSTERED INDEX [CustomerID] ON [${schema}].[Orders] ([CustomerID])
GO
PRINT N'Creating index [CustomersOrders] on [${schema}].[Orders]'
GO
CREATE NONCLUSTERED INDEX [CustomersOrders] ON [${schema}].[Orders] ([CustomerID])
GO
PRINT N'Creating index [EmployeeID] on [${schema}].[Orders]'
GO
CREATE NONCLUSTERED INDEX [EmployeeID] ON [${schema}].[Orders] ([EmployeeID])
GO
PRINT N'Creating index [EmployeesOrders] on [${schema}].[Orders]'
GO
CREATE NONCLUSTERED INDEX [EmployeesOrders] ON [${schema}].[Orders] ([EmployeeID])
GO
PRINT N'Creating index [OrderDate] on [${schema}].[Orders]'
GO
CREATE NONCLUSTERED INDEX [OrderDate] ON [${schema}].[Orders] ([OrderDate])
GO
PRINT N'Creating index [ShippedDate] on [${schema}].[Orders]'
GO
CREATE NONCLUSTERED INDEX [ShippedDate] ON [${schema}].[Orders] ([ShippedDate])
GO
PRINT N'Creating index [ShipPostalCode] on [${schema}].[Orders]'
GO
CREATE NONCLUSTERED INDEX [ShipPostalCode] ON [${schema}].[Orders] ([ShipPostalCode])
GO
PRINT N'Creating index [ShippersOrders] on [${schema}].[Orders]'
GO
CREATE NONCLUSTERED INDEX [ShippersOrders] ON [${schema}].[Orders] ([ShipVia])
GO
PRINT N'Creating [${schema}].[Products]'
GO
CREATE TABLE [${schema}].[Products]
(
[ProductID] [int] NOT NULL IDENTITY(1, 1),
[ProductName] [nvarchar] (40) NOT NULL,
[SupplierID] [int] NULL,
[CategoryID] [int] NULL,
[QuantityPerUnit] [nvarchar] (20) NULL,
[UnitPrice] [money] NULL CONSTRAINT [DF_Products_UnitPrice] DEFAULT ((0)),
[UnitsInStock] [smallint] NULL CONSTRAINT [DF_Products_UnitsInStock] DEFAULT ((0)),
[UnitsOnOrder] [smallint] NULL CONSTRAINT [DF_Products_UnitsOnOrder] DEFAULT ((0)),
[ReorderLevel] [smallint] NULL CONSTRAINT [DF_Products_ReorderLevel] DEFAULT ((0)),
[Discontinued] [bit] NOT NULL CONSTRAINT [DF_Products_Discontinued] DEFAULT ((0)),
[Colour] [nvarchar] (50) NULL,
[Colour2] [nvarchar] (50) NULL,
[Colour3] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_Products] on [${schema}].[Products]'
GO
ALTER TABLE [${schema}].[Products] ADD CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductID])
GO
PRINT N'Creating index [CategoriesProducts] on [${schema}].[Products]'
GO
CREATE NONCLUSTERED INDEX [CategoriesProducts] ON [${schema}].[Products] ([CategoryID])
GO
PRINT N'Creating index [CategoryID] on [${schema}].[Products]'
GO
CREATE NONCLUSTERED INDEX [CategoryID] ON [${schema}].[Products] ([CategoryID])
GO
PRINT N'Creating index [ProductName] on [${schema}].[Products]'
GO
CREATE NONCLUSTERED INDEX [ProductName] ON [${schema}].[Products] ([ProductName])
GO
PRINT N'Creating index [SupplierID] on [${schema}].[Products]'
GO
CREATE NONCLUSTERED INDEX [SupplierID] ON [${schema}].[Products] ([SupplierID])
GO
PRINT N'Creating index [SuppliersProducts] on [${schema}].[Products]'
GO
CREATE NONCLUSTERED INDEX [SuppliersProducts] ON [${schema}].[Products] ([SupplierID])
GO
PRINT N'Creating [${schema}].[Customers]'
GO
CREATE TABLE [${schema}].[Customers]
(
[CustomerID] [nchar] (5) NOT NULL,
[CompanyName] [nvarchar] (40) NOT NULL,
[ContactName] [nvarchar] (30) NULL,
[ContactTitle] [nvarchar] (30) NULL,
[Address] [nvarchar] (60) NULL,
[City] [nvarchar] (15) NULL,
[Region] [nvarchar] (15) NULL,
[PostalCode] [nvarchar] (10) NULL,
[Country] [nvarchar] (15) NULL,
[Phone] [nvarchar] (24) NULL,
[Fax] [nvarchar] (24) NULL,
[Twitter] [nchar] (10) NULL
)
GO
PRINT N'Creating primary key [PK_Customers] on [${schema}].[Customers]'
GO
ALTER TABLE [${schema}].[Customers] ADD CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerID])
GO
PRINT N'Creating index [City] on [${schema}].[Customers]'
GO
CREATE NONCLUSTERED INDEX [City] ON [${schema}].[Customers] ([City])
GO
PRINT N'Creating index [CompanyName] on [${schema}].[Customers]'
GO
CREATE NONCLUSTERED INDEX [CompanyName] ON [${schema}].[Customers] ([CompanyName])
GO
PRINT N'Creating index [PostalCode] on [${schema}].[Customers]'
GO
CREATE NONCLUSTERED INDEX [PostalCode] ON [${schema}].[Customers] ([PostalCode])
GO
PRINT N'Creating index [Region] on [${schema}].[Customers]'
GO
CREATE NONCLUSTERED INDEX [Region] ON [${schema}].[Customers] ([Region])
GO
PRINT N'Creating [${schema}].[Employees]'
GO
CREATE TABLE [${schema}].[Employees]
(
[EmployeeID] [int] NOT NULL IDENTITY(1, 1),
[LastName] [nvarchar] (20) NOT NULL,
[FirstName] [nvarchar] (10) NOT NULL,
[Title] [nvarchar] (30) NULL,
[TitleOfCourtesy] [nvarchar] (25) NULL,
[BirthDate] [datetime] NULL,
[HireDate] [datetime] NULL,
[Address] [nvarchar] (60) NULL,
[City] [nvarchar] (15) NULL,
[Region] [nvarchar] (15) NULL,
[PostalCode] [nvarchar] (10) NULL,
[Country] [nvarchar] (15) NULL,
[HomePhone] [nvarchar] (24) NULL,
[Extension] [nvarchar] (4) NULL,
[Photo] [image] NULL,
[Notes] [ntext] NULL,
[ReportsTo] [int] NULL,
[PhotoPath] [nvarchar] (255) NULL
)
GO
PRINT N'Creating primary key [PK_Employees] on [${schema}].[Employees]'
GO
ALTER TABLE [${schema}].[Employees] ADD CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([EmployeeID])
GO
PRINT N'Creating index [LastName] on [${schema}].[Employees]'
GO
CREATE NONCLUSTERED INDEX [LastName] ON [${schema}].[Employees] ([LastName])
GO
PRINT N'Creating index [PostalCode] on [${schema}].[Employees]'
GO
CREATE NONCLUSTERED INDEX [PostalCode] ON [${schema}].[Employees] ([PostalCode])
GO
PRINT N'Creating [${schema}].[EmployeeTerritories]'
GO
CREATE TABLE [${schema}].[EmployeeTerritories]
(
[EmployeeID] [int] NOT NULL,
[TerritoryID] [nvarchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_EmployeeTerritories] on [${schema}].[EmployeeTerritories]'
GO
ALTER TABLE [${schema}].[EmployeeTerritories] ADD CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED ([EmployeeID], [TerritoryID])
GO
PRINT N'Creating [${schema}].[Territories]'
GO
CREATE TABLE [${schema}].[Territories]
(
[TerritoryID] [nvarchar] (20) NOT NULL,
[TerritoryDescription] [nchar] (50) NOT NULL,
[RegionID] [int] NOT NULL,
[RegionName] [nchar] (10) NULL,
[RegionCode] [nchar] (10) NULL,
[RegionOwner] [nchar] (10) NULL,
[Nationality] [nvarchar] (20) NULL,
[NationalityCode] [nvarchar] (20) NULL
)
GO
PRINT N'Creating primary key [PK_Territories] on [${schema}].[Territories]'
GO
ALTER TABLE [${schema}].[Territories] ADD CONSTRAINT [PK_Territories] PRIMARY KEY NONCLUSTERED ([TerritoryID])
GO
PRINT N'Creating [${schema}].[Flight]'
GO
CREATE TABLE [${schema}].[Flight]
(
[FlightID] [int] NOT NULL IDENTITY(1, 1),
[Airline] [nvarchar] (50) NOT NULL,
[DepartureCity] [nvarchar] (50) NOT NULL,
[ArrivalCity] [nvarchar] (50) NOT NULL,
[DepartureTime] [datetime] NOT NULL,
[ArrivalTime] [datetime] NOT NULL,
[Price] [decimal] (10, 2) NOT NULL,
[AvailableSeats] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK__Flight__8A9E148E9A8ED149] on [${schema}].[Flight]'
GO
ALTER TABLE [${schema}].[Flight] ADD CONSTRAINT [PK__Flight__8A9E148E9A8ED149] PRIMARY KEY CLUSTERED ([FlightID])
GO
PRINT N'Creating [${schema}].[Shippers]'
GO
CREATE TABLE [${schema}].[Shippers]
(
[ShipperID] [int] NOT NULL IDENTITY(1, 1),
[CompanyName] [nvarchar] (40) NOT NULL,
[Phone] [nvarchar] (24) NULL,
[id] [int] NULL,
[ShipId] [int] NULL
)
GO
PRINT N'Creating primary key [PK_Shippers] on [${schema}].[Shippers]'
GO
ALTER TABLE [${schema}].[Shippers] ADD CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED ([ShipperID])
GO
PRINT N'Creating [${schema}].[Categories]'
GO
CREATE TABLE [${schema}].[Categories]
(
[CategoryID] [int] NOT NULL IDENTITY(1, 1),
[CategoryName] [nvarchar] (15) NOT NULL,
[Description] [ntext] NULL,
[Picture] [image] NULL,
[date] [date] NULL
)
GO
PRINT N'Creating primary key [PK_Categories] on [${schema}].[Categories]'
GO
ALTER TABLE [${schema}].[Categories] ADD CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryID])
GO
PRINT N'Creating index [CategoryName] on [${schema}].[Categories]'
GO
CREATE NONCLUSTERED INDEX [CategoryName] ON [${schema}].[Categories] ([CategoryName])
GO
PRINT N'Creating [${schema}].[Suppliers]'
GO
CREATE TABLE [${schema}].[Suppliers]
(
[SupplierID] [int] NOT NULL IDENTITY(1, 1),
[CompanyName] [nvarchar] (40) NOT NULL,
[ContactName] [nvarchar] (30) NULL,
[ContactTitle] [nvarchar] (30) NULL,
[Address] [nvarchar] (60) NULL,
[City] [nvarchar] (15) NULL,
[Region] [nvarchar] (15) NULL,
[PostalCode] [nvarchar] (10) NULL,
[Country] [nvarchar] (15) NULL,
[Phone] [nvarchar] (24) NULL,
[Fax] [nvarchar] (24) NULL,
[HomePage] [ntext] NULL
)
GO
PRINT N'Creating primary key [PK_Suppliers] on [${schema}].[Suppliers]'
GO
ALTER TABLE [${schema}].[Suppliers] ADD CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([SupplierID])
GO
PRINT N'Creating index [CompanyName] on [${schema}].[Suppliers]'
GO
CREATE NONCLUSTERED INDEX [CompanyName] ON [${schema}].[Suppliers] ([CompanyName])
GO
PRINT N'Creating index [PostalCode] on [${schema}].[Suppliers]'
GO
CREATE NONCLUSTERED INDEX [PostalCode] ON [${schema}].[Suppliers] ([PostalCode])
GO
PRINT N'Creating [${schema}].[Region]'
GO
CREATE TABLE [${schema}].[Region]
(
[RegionID] [int] NOT NULL,
[RegionDescription] [nchar] (50) NOT NULL,
[RegionName] [nvarchar] (20) NULL
)
GO
PRINT N'Creating primary key [PK_Region] on [${schema}].[Region]'
GO
ALTER TABLE [${schema}].[Region] ADD CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED ([RegionID])
GO
PRINT N'Creating [${schema}].[AddMaintenanceLog]'
GO
CREATE PROCEDURE [${schema}].[AddMaintenanceLog] @FlightID INT, @Description NVARCHAR(500)
AS
BEGIN
    INSERT INTO [${schema}].[MaintenanceLog](FlightID, Description, MaintenanceStatus)
    VALUES(@FlightID, @Description, 'Pending');
    PRINT 'Maintenance log entry created.';
END;
GO
PRINT N'Creating [${schema}].[RecordFeedback]'
GO
CREATE PROCEDURE [${schema}].[RecordFeedback] @CustomerID INT, @Rating INT, @Comments NVARCHAR(500)
AS
BEGIN
    INSERT INTO [${schema}].[CustomersFeedback](CustomerID, Rating, Comments)
    VALUES(@CustomerID, @Rating, @Comments);
    PRINT 'Customer feedback recorded successfully.';
END;
GO
PRINT N'Creating [${schema}].[Order Subtotals]'
GO
CREATE VIEW [${schema}].[Order Subtotals]
AS
SELECT [${schema}].[Order Details].OrderID,
       SUM(CONVERT(MONEY, ([${schema}].[Order Details].UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS Subtotal
FROM [${schema}].[Order Details]
GROUP BY [${schema}].[Order Details].OrderID;
GO
PRINT N'Creating [${schema}].[Sales by Year]'
GO
CREATE PROCEDURE [${schema}].[Sales by Year] @Beginning_Date DATETIME, @Ending_Date DATETIME
AS
SELECT [${schema}].[Orders].ShippedDate,
       [${schema}].[Orders].OrderID,
       [${schema}].[Order Subtotals].Subtotal,
       DATENAME(yy, ShippedDate) AS Year
FROM [${schema}].[Orders]
     INNER JOIN [${schema}].[Order Subtotals]
       ON [${schema}].[Orders].OrderID = [${schema}].[Order Subtotals].OrderID
WHERE [${schema}].[Orders].ShippedDate BETWEEN @Beginning_Date AND @Ending_Date;
GO
PRINT N'Creating [${schema}].[SalesByCategory]'
GO
CREATE PROCEDURE [${schema}].[SalesByCategory] @CategoryName NVARCHAR(15), @OrdYear NVARCHAR(4) = '1998'
AS
IF @OrdYear != '1996' AND @OrdYear != '1997' AND @OrdYear != '1998'
BEGIN
    SELECT @OrdYear = '1998';
END;
SELECT ProductName,
       TotalPurchase = ROUND(SUM(CONVERT(DECIMAL(14, 2),
                               OD.Quantity * (1 - OD.Discount) * OD.UnitPrice)), 0)
FROM [${schema}].[Order Details] OD,
     [${schema}].[Orders] O,
     [${schema}].[Products] P,
     [${schema}].[Categories] C
WHERE OD.OrderID = O.OrderID
  AND OD.ProductID = P.ProductID
  AND P.CategoryID = C.CategoryID
  AND C.CategoryName = @CategoryName
  AND SUBSTRING(CONVERT(NVARCHAR(22), O.OrderDate, 111), 1, 4) = @OrdYear
GROUP BY ProductName
ORDER BY ProductName;
GO
PRINT N'Creating [${schema}].[TableTest]'
GO
CREATE TABLE [${schema}].[TableTest]
(
[FirstName] [nvarchar] (24) NULL
)
GO
PRINT N'Creating [${schema}].[spTest]'
GO
CREATE PROCEDURE [${schema}].[spTest]
    @parameter_name AS INT
AS
BEGIN
    SELECT * FROM [${schema}].[TableTest];
END
GO
PRINT N'Creating [${schema}].[UpdateAvailableSeats]'
GO
CREATE PROCEDURE [${schema}].[UpdateAvailableSeats] @FlightID INT, @SeatChange INT
AS
BEGIN
    UPDATE [${schema}].[Flight]
      SET AvailableSeats = AvailableSeats + @SeatChange
    WHERE FlightID = @FlightID;
END;
GO
PRINT N'Creating [${schema}].[CustomerOrdersView]'
GO
CREATE VIEW [${schema}].[CustomerOrdersView]
AS
SELECT c.CustomerID, c.CompanyName, c.ContactName, c.Address, c.City, c.Region, c.Phone
FROM [${schema}].[Customers] c
     JOIN [${schema}].[Orders] o ON c.CustomerID = o.CustomerID;
GO
PRINT N'Creating [${schema}].[CustomersFeedbackSummary]'
GO
CREATE VIEW [${schema}].[CustomersFeedbackSummary]
AS
SELECT c.CustomerID, c.CompanyName, c.ContactName, AVG(f.Rating) AS AverageRating, COUNT(f.FeedbackID) AS FeedbackCount
FROM [${schema}].[Customers] c
     LEFT JOIN [${schema}].[CustomersFeedback] f ON c.CustomerID = f.CustomerID
GROUP BY c.CustomerID, c.CompanyName, c.ContactName;
GO
PRINT N'Creating [${schema}].[FlightMaintenanceStatus]'
GO
CREATE VIEW [${schema}].[FlightMaintenanceStatus]
AS
SELECT f.FlightID, f.Airline, f.DepartureCity, f.ArrivalCity,
       COUNT(m.LogID) AS MaintenanceCount,
       SUM(CASE WHEN m.MaintenanceStatus = 'Completed' THEN 1 ELSE 0 END) AS CompletedMaintenance
FROM [${schema}].[Flight] f
     LEFT JOIN [${schema}].[MaintenanceLog] m ON f.FlightID = m.FlightID
GROUP BY f.FlightID, f.Airline, f.DepartureCity, f.ArrivalCity;
GO
PRINT N'Creating [${schema}].[Order Details Extended]'
GO
CREATE VIEW [${schema}].[Order Details Extended]
AS
SELECT od.OrderID, od.ProductID, p.ProductName, od.UnitPrice, od.Quantity, od.Discount,
       (CONVERT(MONEY, (od.UnitPrice * od.Quantity * (1 - od.Discount) / 100)) * 100) AS ExtendedPrice
FROM [${schema}].[Products] p
     INNER JOIN [${schema}].[Order Details] od ON p.ProductID = od.ProductID;
--ORDER BY od.OrderID
GO
PRINT N'Creating [${schema}].[Sales by Category]'
GO
CREATE VIEW [${schema}].[Sales by Category]
AS
SELECT [${schema}].[Categories].CategoryID,
       [${schema}].[Categories].CategoryName,
       [${schema}].[Products].ProductName,
       SUM([${schema}].[Order Details Extended].ExtendedPrice) AS ProductSales
FROM [${schema}].[Categories]
     INNER JOIN ([${schema}].[Products]
                 INNER JOIN ([${schema}].[Orders]
                             INNER JOIN [${schema}].[Order Details Extended]
                               ON [${schema}].[Orders].OrderID = [${schema}].[Order Details Extended].OrderID)
                   ON [${schema}].[Products].ProductID = [${schema}].[Order Details Extended].ProductID)
       ON [${schema}].[Categories].CategoryID = [${schema}].[Products].CategoryID
WHERE [${schema}].[Orders].OrderDate BETWEEN '19970101' AND '19971231'
GROUP BY [${schema}].[Categories].CategoryID,
         [${schema}].[Categories].CategoryName,
         [${schema}].[Products].ProductName;
--ORDER BY [${schema}].[Products].ProductName
GO
PRINT N'Creating [${schema}].[Sales Totals by Amount]'
GO
CREATE VIEW [${schema}].[Sales Totals by Amount]
AS
SELECT [${schema}].[Order Subtotals].Subtotal AS SaleAmount,
       [${schema}].[Orders].OrderID,
       [${schema}].[Customers].CompanyName,
       [${schema}].[Orders].ShippedDate
FROM [${schema}].[Customers]
     INNER JOIN ([${schema}].[Orders]
                 INNER JOIN [${schema}].[Order Subtotals]
                   ON [${schema}].[Orders].OrderID = [${schema}].[Order Subtotals].OrderID)
       ON [${schema}].[Customers].CustomerID = [${schema}].[Orders].CustomerID
WHERE ([${schema}].[Order Subtotals].Subtotal > 2500)
  AND ([${schema}].[Orders].ShippedDate BETWEEN '19970101' AND '19971231');
GO
PRINT N'Creating [${schema}].[Summary of Sales by Quarter]'
GO
CREATE VIEW [${schema}].[Summary of Sales by Quarter]
AS
SELECT [${schema}].[Orders].ShippedDate,
       [${schema}].[Orders].OrderID,
       [${schema}].[Order Subtotals].Subtotal
FROM [${schema}].[Orders]
     INNER JOIN [${schema}].[Order Subtotals]
       ON [${schema}].[Orders].OrderID = [${schema}].[Order Subtotals].OrderID
WHERE [${schema}].[Orders].ShippedDate IS NOT NULL;
--ORDER BY [${schema}].[Orders].ShippedDate
GO
PRINT N'Creating [${schema}].[AlexTest]'
GO
CREATE TABLE [${schema}].[AlexTest]
(
[Test] [int] NULL
)
GO
PRINT N'Creating [${schema}].[CustomerDemographics]'
GO
CREATE TABLE [${schema}].[CustomerDemographics]
(
[CustomerTypeID] [nchar] (10) NOT NULL,
[CustomerDesc] [ntext] NULL
)
GO
PRINT N'Creating primary key [PK_CustomerDemographics] on [${schema}].[CustomerDemographics]'
GO
ALTER TABLE [${schema}].[CustomerDemographics] ADD CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY NONCLUSTERED ([CustomerTypeID])
GO
PRINT N'Creating [${schema}].[DiscountCode]'
GO
CREATE TABLE [${schema}].[DiscountCode]
(
[DiscountID] [int] NOT NULL IDENTITY(1, 1),
[Code] [nvarchar] (20) NOT NULL,
[DiscountPercentage] [decimal] (4, 2) NULL,
[ExpiryDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK__Discount__E43F6DF6CA2BF14E] on [${schema}].[DiscountCode]'
GO
ALTER TABLE [${schema}].[DiscountCode] ADD CONSTRAINT [PK__Discount__E43F6DF6CA2BF14E] PRIMARY KEY CLUSTERED ([DiscountID])
GO
PRINT N'Adding constraints to [${schema}].[DiscountCode]'
GO
ALTER TABLE [${schema}].[DiscountCode] ADD CONSTRAINT [UQ__Discount__A25C5AA70A86FB88] UNIQUE NONCLUSTERED ([Code])
GO
PRINT N'Creating [${schema}].[FlightRoute]'
GO
CREATE TABLE [${schema}].[FlightRoute]
(
[RouteID] [int] NOT NULL IDENTITY(1, 1),
[DepartureCity] [nvarchar] (50) NOT NULL,
[ArrivalCity] [nvarchar] (50) NOT NULL,
[Distance] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK__FlightRo__80979AADC83FDFDB] on [${schema}].[FlightRoute]'
GO
ALTER TABLE [${schema}].[FlightRoute] ADD CONSTRAINT [PK__FlightRo__80979AADC83FDFDB] PRIMARY KEY CLUSTERED ([RouteID])
GO
PRINT N'Creating [${schema}].[PlugNPlayTable]'
GO
CREATE TABLE [${schema}].[PlugNPlayTable]
(
[Test] [int] NULL
)
GO
PRINT N'Creating [${schema}].[SocialMedia]'
GO
CREATE TABLE [${schema}].[SocialMedia]
(
[FirstName] [nvarchar] (24) NULL
)
GO
PRINT N'Creating [${schema}].[huxTable50]'
GO
CREATE TABLE [${schema}].[huxTable50]
(
[FirstName] [nvarchar] (24) NULL
)
GO
PRINT N'Creating [${schema}].[huxtest]'
GO
CREATE TABLE [${schema}].[huxtest]
(
[test] [int] NULL
)
GO
PRINT N'Creating [${schema}].[quickTest]'
GO
CREATE TABLE [${schema}].[quickTest]
(
[Test] [int] NULL
)
GO
PRINT N'Adding constraints to [${schema}].[CustomersFeedback]'
GO
ALTER TABLE [${schema}].[CustomersFeedback] ADD CONSTRAINT [CK__Customers__Ratin__2A4B4B5E] CHECK (([Rating]>=(1) AND [Rating]<=(5)))
GO
PRINT N'Adding constraints to [${schema}].[DiscountCode]'
GO
ALTER TABLE [${schema}].[DiscountCode] ADD CONSTRAINT [CK__DiscountC__Disco__36B12243] CHECK (([DiscountPercentage]>=(0) AND [DiscountPercentage]<=(100)))
GO
PRINT N'Adding constraints to [${schema}].[Employees]'
GO
ALTER TABLE [${schema}].[Employees] ADD CONSTRAINT [CK_Birthdate] CHECK (([BirthDate]<getdate()))
GO
PRINT N'Adding constraints to [${schema}].[Order Details]'
GO
ALTER TABLE [${schema}].[Order Details] ADD CONSTRAINT [CK_UnitPrice] CHECK (([UnitPrice]>=(0)))
GO
ALTER TABLE [${schema}].[Order Details] ADD CONSTRAINT [CK_Quantity] CHECK (([Quantity]>(0)))
GO
ALTER TABLE [${schema}].[Order Details] ADD CONSTRAINT [CK_Discount] CHECK (([Discount]>=(0) AND [Discount]<=(1)))
GO
PRINT N'Adding constraints to [${schema}].[Products]'
GO
ALTER TABLE [${schema}].[Products] ADD CONSTRAINT [CK_Products_UnitPrice] CHECK (([UnitPrice]>=(0)))
GO
ALTER TABLE [${schema}].[Products] ADD CONSTRAINT [CK_UnitsInStock] CHECK (([UnitsInStock]>=(0)))
GO
ALTER TABLE [${schema}].[Products] ADD CONSTRAINT [CK_UnitsOnOrder] CHECK (([UnitsOnOrder]>=(0)))
GO
ALTER TABLE [${schema}].[Products] ADD CONSTRAINT [CK_ReorderLevel] CHECK (([ReorderLevel]>=(0)))
GO
PRINT N'Adding foreign keys to [${schema}].[Products]'
GO
ALTER TABLE [${schema}].[Products] ADD CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [${schema}].[Categories] ([CategoryID])
GO
ALTER TABLE [${schema}].[Products] ADD CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [${schema}].[Suppliers] ([SupplierID])
GO
PRINT N'Adding foreign keys to [${schema}].[CustomersFeedback]'
GO
ALTER TABLE [${schema}].[CustomersFeedback] ADD CONSTRAINT [FK__Customers__Custo__286302EC] FOREIGN KEY ([CustomerID]) REFERENCES [${schema}].[Customers] ([CustomerID])
GO
PRINT N'Adding foreign keys to [${schema}].[Orders]'
GO
ALTER TABLE [${schema}].[Orders] ADD CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [${schema}].[Customers] ([CustomerID])
GO
ALTER TABLE [${schema}].[Orders] ADD CONSTRAINT [FK_Orders_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [${schema}].[Employees] ([EmployeeID])
GO
ALTER TABLE [${schema}].[Orders] ADD CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY ([ShipVia]) REFERENCES [${schema}].[Shippers] ([ShipperID])
GO
PRINT N'Adding foreign keys to [${schema}].[EmployeeTerritories]'
GO
ALTER TABLE [${schema}].[EmployeeTerritories] ADD CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [${schema}].[Employees] ([EmployeeID])
GO
ALTER TABLE [${schema}].[EmployeeTerritories] ADD CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY ([TerritoryID]) REFERENCES [${schema}].[Territories] ([TerritoryID])
GO
PRINT N'Adding foreign keys to [${schema}].[Employees]'
GO
ALTER TABLE [${schema}].[Employees] ADD CONSTRAINT [FK_Employees_Employees] FOREIGN KEY ([ReportsTo]) REFERENCES [${schema}].[Employees] ([EmployeeID])
GO
PRINT N'Adding foreign keys to [${schema}].[Order Details]'
GO
ALTER TABLE [${schema}].[Order Details] ADD CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY ([OrderID]) REFERENCES [${schema}].[Orders] ([OrderID])
GO
ALTER TABLE [${schema}].[Order Details] ADD CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY ([ProductID]) REFERENCES [${schema}].[Products] ([ProductID])
GO
PRINT N'Adding foreign keys to [${schema}].[OrderAuditLog]'
GO
ALTER TABLE [${schema}].[OrderAuditLog] ADD CONSTRAINT [FK__OrderAudi__Order__4316F928] FOREIGN KEY ([OrderID]) REFERENCES [${schema}].[Orders] ([OrderID])
GO
PRINT N'Adding foreign keys to [${schema}].[Territories]'
GO
ALTER TABLE [${schema}].[Territories] ADD CONSTRAINT [FK_Territories_Region] FOREIGN KEY ([RegionID]) REFERENCES [${schema}].[Region] ([RegionID])
GO
PRINT N'Adding foreign keys to [${schema}].[MaintenanceLog]'
GO
ALTER TABLE [${schema}].[MaintenanceLog] ADD CONSTRAINT [FK__Maintenan__Fligh__30F848ED] FOREIGN KEY ([FlightID]) REFERENCES [${schema}].[Flight] ([FlightID])
GO
PRINT N'Disabling constraints on [${schema}].[Products]'
GO
ALTER TABLE [${schema}].[Products] NOCHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [${schema}].[Products] NOCHECK CONSTRAINT [FK_Products_Suppliers]
GO
PRINT N'Disabling constraints on [${schema}].[CustomersFeedback]'
GO
ALTER TABLE [${schema}].[CustomersFeedback] NOCHECK CONSTRAINT [FK__Customers__Custo__286302EC]
GO
PRINT N'Disabling constraints on [${schema}].[Orders]'
GO
ALTER TABLE [${schema}].[Orders] NOCHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [${schema}].[Orders] NOCHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [${schema}].[Orders] NOCHECK CONSTRAINT [FK_Orders_Shippers]
GO
PRINT N'Disabling constraints on [${schema}].[EmployeeTerritories]'
GO
ALTER TABLE [${schema}].[EmployeeTerritories] NOCHECK CONSTRAINT [FK_EmployeeTerritories_Employees]
GO
ALTER TABLE [${schema}].[EmployeeTerritories] NOCHECK CONSTRAINT [FK_EmployeeTerritories_Territories]
GO
PRINT N'Disabling constraints on [${schema}].[Employees]'
GO
ALTER TABLE [${schema}].[Employees] NOCHECK CONSTRAINT [FK_Employees_Employees]
GO
PRINT N'Disabling constraints on [${schema}].[Order Details]'
GO
ALTER TABLE [${schema}].[Order Details] NOCHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [${schema}].[Order Details] NOCHECK CONSTRAINT [FK_Order_Details_Products]
GO
PRINT N'Disabling constraints on [${schema}].[OrderAuditLog]'
GO
ALTER TABLE [${schema}].[OrderAuditLog] NOCHECK CONSTRAINT [FK__OrderAudi__Order__4316F928]
GO
PRINT N'Disabling constraints on [${schema}].[Territories]'
GO
ALTER TABLE [${schema}].[Territories] NOCHECK CONSTRAINT [FK_Territories_Region]
GO

