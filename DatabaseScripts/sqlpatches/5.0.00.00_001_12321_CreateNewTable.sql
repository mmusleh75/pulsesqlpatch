-- DROP worker PROCEDURE
IF (SELECT COUNT(1) FROM sys.objects WHERE name = 'sp_dep_create_newtable' AND type = 'P') > 0
BEGIN
	DROP PROCEDURE dbo.sp_dep_create_newtable;
END
GO

-- CREATE worker PROCEDURE
CREATE PROCEDURE dbo.sp_dep_create_newtable  as
BEGIN

	IF (SELECT COUNT(1) FROM sys.objects WHERE name = 'newTable' AND TYPE = 'U') > 0 
		DROP TABLE dbo.newTable;

	CREATE TABLE dbo.newTable(id int);
	
	IF (SELECT COUNT(1) FROM dbo.newTable where id = 500) <= 0
	BEGIN
		INSERT INTO dbo.newTable VALUES (500);
	END	

END;
GO

EXEC dbo.sp_dep_create_newtable;
GO
-- cleanup worker PROCEDURE
IF (SELECT COUNT(1) FROM sys.objects WHERE name = 'sp_dep_create_newtable' and type = 'P') > 0 
BEGIN
	DROP PROCEDURE dbo.sp_dep_create_newtable;
END
GO

