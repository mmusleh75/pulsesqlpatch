IF (SELECT COUNT(1) FROM sys.objects WHERE name = 'newFunction' AND type = 'FN') > 0 
BEGIN
	DROP FUNCTION dbo.newFunction;
END
GO

CREATE FUNCTION dbo.newFunction () RETURNS int as
BEGIN

	RETURN 0;

END;
GO
