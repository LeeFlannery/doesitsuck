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

-- IPOP
--delete from Review
DECLARE @date datetime
SET @date = GETDATE()

INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) 
VALUES('Iron Man 3','When Tony Stark''s world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution.','http://marvel.com/ironman3','Movies',3,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) VALUES('Hitman: Absolution','Make people more dead. For money. With nuns.','http://hitman.com','Games',4,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) VALUES('Man of Steel','A young itinerant worker is forced to confront his secret extraterrestrial heritage when Earth is invaded by members of his race.','http://manofsteel.warnerbros.com/','Movies',2,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) VALUES('Steve Jobs QOTD','You can''t just ask customers what they want and then try to give it to them. By the time you get it built, they''ll want something new.','http://www.brainyquote.com/quotes/authors/s/steve_jobs.html','Tech',1,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) VALUES('Stephen Colbert Gets Lucky','Plus Brian Cranston, dancing the night away.','http://tinyurl.com/kp7rsch','Videos',5,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) VALUES('iOS7','Get ready to get weird.','http://www.apple.com/ios/','Tech',4,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) VALUES('CLEAN ALL THE THINGS','Hyperbole and a Half','http://tinyurl.com/322ncwz','LULZ',5,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) VALUES('Tattoo Fail','Maybe one...','http://www.lamebook.com/maybe-one/maybe-one/','LULZ',1,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) VALUES('Kick-Ass 2','Kids saying terrible things and beating the crap out of bad guys.','http://www.universalstudiosentertainment.com/kick-ass-2/','Movies',5,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) VALUES('POKEMON','Seriously. Catch them all.','http://www.pokemon.com/us/pokedex/','Games',4,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) VALUES('A$AP Rocky - Long Live A$AP','A good debut with impressive flow and solid production.','http://amzn.to/1b7CQxX','Music',4,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
INSERT INTO Review(Title,Body,Link,Category,Rating,Date_Created) VALUES('Borderlands 2','Much cell-shaded gore with lots of loot piñata and humor. LONG LIVE TINY TINA.','http://www.borderlands2.com','Games',5,DATEADD(hh,RAND(3),DATEADD(dd,RAND(1),@date)))
