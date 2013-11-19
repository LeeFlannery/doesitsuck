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


IF NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Tag')
BEGIN
CREATE TABLE dbo.Tag(
	Tag_ID int IDENTITY(1,1) NOT NULL,
	Tag_Name varchar(50) NOT NULL,
	Date_Created datetime NOT NULL,
 CONSTRAINT PK_Tag PRIMARY KEY CLUSTERED 
(
	Tag_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)


ALTER TABLE dbo.Tag ADD  CONSTRAINT DF_Tag_Date_Created  DEFAULT (getdate()) FOR Date_Created
END

IF NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Review_Tag_Rel')
BEGIN

CREATE TABLE dbo.Review_Tag_Rel(
	Review_Tag_Rel_ID int IDENTITY(1,1) NOT NULL,
	Review_ID int NOT NULL,
	Tag_ID int NOT NULL,
 CONSTRAINT PK_Review_Tag_Rel PRIMARY KEY CLUSTERED 
(
	Review_Tag_Rel_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

ALTER TABLE dbo.Review_Tag_Rel  WITH CHECK ADD  CONSTRAINT FK_Review_Tag_Rel_Review FOREIGN KEY(Review_ID)
REFERENCES dbo.Review (Review_ID)

ALTER TABLE dbo.Review_Tag_Rel CHECK CONSTRAINT FK_Review_Tag_Rel_Review

ALTER TABLE dbo.Review_Tag_Rel  WITH CHECK ADD  CONSTRAINT FK_Review_Tag_Rel_Review_Tag_Rel FOREIGN KEY(Review_Tag_Rel_ID)
REFERENCES dbo.Review_Tag_Rel (Review_Tag_Rel_ID)

ALTER TABLE dbo.Review_Tag_Rel CHECK CONSTRAINT FK_Review_Tag_Rel_Review_Tag_Rel

ALTER TABLE dbo.Review_Tag_Rel  WITH CHECK ADD  CONSTRAINT FK_Review_Tag_Rel_Tag FOREIGN KEY(Tag_ID)
REFERENCES dbo.Tag (Tag_ID)

ALTER TABLE dbo.Review_Tag_Rel CHECK CONSTRAINT FK_Review_Tag_Rel_Tag

END
GO
