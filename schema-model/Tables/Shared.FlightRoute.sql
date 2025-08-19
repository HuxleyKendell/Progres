CREATE TABLE [Shared].[FlightRoute]
(
[RouteID] [int] NOT NULL IDENTITY(1, 1),
[DepartureCity] [nvarchar] (50) NOT NULL,
[ArrivalCity] [nvarchar] (50) NOT NULL,
[Distance] [int] NOT NULL
)
GO
ALTER TABLE [Shared].[FlightRoute] ADD CONSTRAINT [PK__FlightRo__80979AADC83FDFDB] PRIMARY KEY CLUSTERED ([RouteID])
GO
