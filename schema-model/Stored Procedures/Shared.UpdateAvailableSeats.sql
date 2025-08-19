SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [Shared].[UpdateAvailableSeats] @FlightID INT, @SeatChange INT
AS
BEGIN
    UPDATE [Shared].[Flight]
      SET AvailableSeats = AvailableSeats + @SeatChange
    WHERE FlightID = @FlightID;
END;
GO
