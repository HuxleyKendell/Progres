CREATE TABLE [Shared].[Customers]
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
ALTER TABLE [Shared].[Customers] ADD CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerID])
GO
CREATE NONCLUSTERED INDEX [City] ON [Shared].[Customers] ([City])
GO
CREATE NONCLUSTERED INDEX [CompanyName] ON [Shared].[Customers] ([CompanyName])
GO
CREATE NONCLUSTERED INDEX [PostalCode] ON [Shared].[Customers] ([PostalCode])
GO
CREATE NONCLUSTERED INDEX [Region] ON [Shared].[Customers] ([Region])
GO
