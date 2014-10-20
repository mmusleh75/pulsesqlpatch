-- creating Step_Version_Info table and chaning Description to 255 char
if (select count(1) from information_schema.tables where table_name = 'Step_Version_Info' and TABLE_TYPE = 'BASE TABLE') = 0
begin
	CREATE TABLE [dbo].[Step_Version_Info](
		[Step] [varchar](50) NULL,
		[Version] [varchar](50) NULL,
		[HOT_FIX] [varchar](50) NULL,
		[Description] [varchar](255) NULL,
		[date] [datetime] NOT NULL,
		[exec_time_sec] float,
	 CONSTRAINT [PK_Step_Version_Info] PRIMARY KEY CLUSTERED 
	(
		[date] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
else
begin
	if (select count(1) from INFORMATION_SCHEMA.COLUMNS 
	where TABLE_NAME = 'Step_Version_Info'
	and COLUMN_NAME = 'Description'
	and CHARACTER_MAXIMUM_LENGTH < 255) > 0
	begin
		alter table dbo.Step_Version_Info alter column Description varchar(255)
	end

	if (select count(1) from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Step_Version_Info' and COLUMN_NAME = 'exec_time_sec') = 0
		alter table Step_Version_Info add exec_time_sec float

end
go


if (select count(1) from information_schema.tables where table_name = 'VERSION_INFO' and TABLE_TYPE = 'BASE TABLE') = 0
begin
	CREATE TABLE [dbo].[VERSION_INFO](
		[VERSION] [varchar](50) NULL,
		[MAJOR] [int] NULL,
		[MINOR] [int] NULL,
		[PATCH_LEVEL] [int] NULL,
		[HotFix] int null,
		[DATE] [varchar](8) NOT NULL
	) 
end
ELSE
BEGIN
	if (select count(1) from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'VERSION_INFO' and COLUMN_NAME = 'HotFix') = 0
		alter table VERSION_INFO add HotFix int

	IF (SELECT COUNT(1) FROM SYS.indexes WHERE NAME = 'PK_VERSION_INFO_DATE') > 0
		ALTER TABLE dbo.[VERSION_INFO] DROP CONSTRAINT [PK_VERSION_INFO_DATE]
END
go



