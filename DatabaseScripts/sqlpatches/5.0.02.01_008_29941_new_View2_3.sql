
IF (SELECT COUNT(1) FROM sys.objects WHERE name = 'newView' AND type = 'V') > 0 
BEGIN
	DROP VIEW dbo.newView;
END
GO

CREATE VIEW [dbo].[newView]
AS
SELECT     id
FROM        dbo.newTable

GO
