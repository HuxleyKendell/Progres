CREATE TABLE [Shared].[EmployeeTerritories]
(
[EmployeeID] [int] NOT NULL,
[TerritoryID] [nvarchar] (20) NOT NULL
)
GO
ALTER TABLE [Shared].[EmployeeTerritories] ADD CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED ([EmployeeID], [TerritoryID])
GO
ALTER TABLE [Shared].[EmployeeTerritories] ADD CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [Shared].[Employees] ([EmployeeID])
GO
ALTER TABLE [Shared].[EmployeeTerritories] ADD CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY ([TerritoryID]) REFERENCES [Shared].[Territories] ([TerritoryID])
GO
ALTER TABLE [Shared].[EmployeeTerritories] NOCHECK CONSTRAINT [FK_EmployeeTerritories_Employees]
GO
ALTER TABLE [Shared].[EmployeeTerritories] NOCHECK CONSTRAINT [FK_EmployeeTerritories_Territories]
GO
