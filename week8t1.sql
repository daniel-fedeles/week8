DROP DATABASE [LibraryDB]
CREATE DATABASE [LibraryDB]
DROP TABLE [dbo].[Author]

use [LibraryDB]

CREATE TABLE [dbo].[Author](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FirstName] [nvarchar](MAX),
	[LastName] [nvarchar](MAX),
	[BirthDate] [date]
)

INSERT INTO [dbo].[Author]
           ([FirstName],[LastName],[BirthDate])
     VALUES
           ('unu','altu','1965-05-21'),
           ('doi','author','1970-05-21'),
		   ('trei','ceva','1975-05-21');

delete from [dbo].[Author] where year([BirthDate]) = 1975;


CREATE TABLE [dbo].[Book](
	[Title][nvarchar](150) not null primary key,
	[PublisherName][nvarchar](MAX),
	[Year][int],
	[Price][decimal](18, 0),
	[AuthorId][int]not null,
	CONSTRAINT AuthorIdKey
	FOREIGN KEY ([AuthorId]) REFERENCES [Author]([AuthorId])
);

INSERT INTO [dbo].[Book]
           ([Title],[PublisherName],[Year],[Price],[AuthorId])
     VALUES
           ('o carte buna 1', 'o editura1', 2002, 10, 4),
		   ('o carte buna 2', 'o editura2', 2002, 200, 5),
		   ('o carte buna 3', 'o editura3', 2002, 120, 4)
DELETE FROM [dbo].[Book]
      WHERE [Price]<150;

delete from [dbo].[Book];