CREATE TABLE [Shared].[Territories]
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
ALTER TABLE [Shared].[Territories] ADD CONSTRAINT [PK_Territories] PRIMARY KEY NONCLUSTERED ([TerritoryID])
GO
ALTER TABLE [Shared].[Territories] ADD CONSTRAINT [FK_Territories_Region] FOREIGN KEY ([RegionID]) REFERENCES [Shared].[Region] ([RegionID])
GO
ALTER TABLE [Shared].[Territories] NOCHECK CONSTRAINT [FK_Territories_Region]
GO
