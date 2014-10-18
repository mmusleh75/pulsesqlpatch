IF (SELECT COUNT(1) FROM sys.objects WHERE name = 'newProcedure' AND type = 'P') > 0 
BEGIN
	DROP PROCEDURE dbo.newProcedure;
END
GO

CREATE PROCEDURE dbo.newProcedure  as
BEGIN

 print 'do your magic here'

END;
GO
