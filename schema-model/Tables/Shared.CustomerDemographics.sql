CREATE TABLE [Shared].[CustomerDemographics]
(
[CustomerTypeID] [nchar] (10) NOT NULL,
[CustomerDesc] [ntext] NULL
)
GO
ALTER TABLE [Shared].[CustomerDemographics] ADD CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY NONCLUSTERED ([CustomerTypeID])
GO
