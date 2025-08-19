SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [Shared].[AddMaintenanceLog] @FlightID INT, @Description NVARCHAR(500)
AS
BEGIN
    INSERT INTO [Shared].[MaintenanceLog](FlightID, Description, MaintenanceStatus)
    VALUES(@FlightID, @Description, 'Pending');
    PRINT 'Maintenance log entry created.';
END;
GO
