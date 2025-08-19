SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Shared].[CustomerOrdersView]
AS
SELECT c.CustomerID, c.CompanyName, c.ContactName, c.Address, c.City, c.Region, c.Phone
FROM [Shared].[Customers] c
     JOIN [Shared].[Orders] o ON c.CustomerID = o.CustomerID;
GO
