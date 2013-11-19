USE master
GO

if db_id('DoesItSuck') is null
	CREATE DATABASE DoesItSuck

GO

USE DoesItSuck
GO

IF NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Review')
BEGIN
	CREATE TABLE dbo.Review(
		Review_ID int IDENTITY(1,1) NOT NULL,
		Title varchar(100) NOT NULL,
		Body varchar(7000) NOT NULL,
		Link varchar(100) NULL,
		Category varchar(20) NULL,
		Rating tinyint NOT NULL,
		Date_Created datetime NOT NULL,
	 CONSTRAINT PK_Review PRIMARY KEY CLUSTERED 
	(
		Review_ID ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
	) 
	ALTER TABLE dbo.Review ADD  CONSTRAINT DF_Review_Date_Created  DEFAULT (getdate()) FOR Date_Created
END

GO

