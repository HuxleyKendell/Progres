SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [Shared].[RecordFeedback] @CustomerID INT, @Rating INT, @Comments NVARCHAR(500)
AS
BEGIN
    INSERT INTO [Shared].[CustomersFeedback](CustomerID, Rating, Comments)
    VALUES(@CustomerID, @Rating, @Comments);
    PRINT 'Customer feedback recorded successfully.';
END;
GO
