CREATE TABLE [Shared].[OrderAuditLog]
(
[AuditID] [int] NOT NULL IDENTITY(1, 1),
[OrderID] [int] NULL,
[ChangeDate] [datetime] NULL CONSTRAINT [DF__OrderAudi__Chang__4222D4EF] DEFAULT (getdate()),
[ChangeDescription] [nvarchar] (500) NULL
)
GO
ALTER TABLE [Shared].[OrderAuditLog] ADD CONSTRAINT [PK__OrderAud__A17F23B8298306B2] PRIMARY KEY CLUSTERED ([AuditID])
GO
ALTER TABLE [Shared].[OrderAuditLog] ADD CONSTRAINT [FK__OrderAudi__Order__4316F928] FOREIGN KEY ([OrderID]) REFERENCES [Shared].[Orders] ([OrderID])
GO
ALTER TABLE [Shared].[OrderAuditLog] NOCHECK CONSTRAINT [FK__OrderAudi__Order__4316F928]
GO
