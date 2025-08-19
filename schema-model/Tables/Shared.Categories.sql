CREATE TABLE [Shared].[Categories]
(
[CategoryID] [int] NOT NULL IDENTITY(1, 1),
[CategoryName] [nvarchar] (15) NOT NULL,
[Description] [ntext] NULL,
[Picture] [image] NULL,
[date] [date] NULL
)
GO
ALTER TABLE [Shared].[Categories] ADD CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryID])
GO
CREATE NONCLUSTERED INDEX [CategoryName] ON [Shared].[Categories] ([CategoryName])
GO
