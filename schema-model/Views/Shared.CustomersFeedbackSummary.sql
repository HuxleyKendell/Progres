SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Shared].[CustomersFeedbackSummary]
AS
SELECT c.CustomerID, c.CompanyName, c.ContactName, AVG(f.Rating) AS AverageRating, COUNT(f.FeedbackID) AS FeedbackCount
FROM [Shared].[Customers] c
     LEFT JOIN [Shared].[CustomersFeedback] f ON c.CustomerID = f.CustomerID
GROUP BY c.CustomerID, c.CompanyName, c.ContactName;
GO
