IF(db_id(N'Checkpoint2') IS NULL)
	BEGIN
		CREATE DATABASE [Checkpoint2]
	END
GO

USE [Checkpoint2]
GO

SET DATEFORMAT dmy
GO

CREATE TABLE Campus (
	Campus_id INT PRIMARY KEY IDENTITY (1, 1),
	[name] VARCHAR(50) NOT NULL,
)


CREATE TABLE Agenda (
	Agenda_id INT PRIMARY KEY IDENTITY (1, 1),
	[name] VARCHAR(50) NOT NULL
)

CREATE TABLE [Event] (
	Event_id INT PRIMARY KEY IDENTITY (1, 1),
	[name] VARCHAR(50) NOT NULL, 
	StartTime DATETIME NOT NULL,
	EndTime DATETIME NOT NULL, 
	FK_agenda_id INT FOREIGN KEY REFERENCES Agenda(Agenda_id)
)

CREATE TABLE Cursus (
	Cursus_id INT PRIMARY KEY IDENTITY (1, 1),
	[name] VARCHAR(50) NOT NULL,
	FK_campus_id INT FOREIGN KEY REFERENCES Campus(Campus_id)
)


CREATE TABLE Expedition (
	Expedition_id INT PRIMARY KEY IDENTITY (1, 1),
	[name] VARCHAR(50),
	FK_cursus_id INT FOREIGN KEY REFERENCES Cursus(Cursus_id)
)

CREATE TABLE Quest (
	Quest_id INT PRIMARY KEY IDENTITY (1, 1),
	[title] VARCHAR(50) NOT NULL,
	[text] TEXT NOT NULL,
	FK_expedition_id INT FOREIGN KEY REFERENCES Expedition(Expedition_id)
)


CREATE TABLE Person (
	Person_id INT PRIMARY KEY IDENTITY (1, 1),
	[name] VARCHAR(50) NOT NULL,
	[type] VARCHAR(50) NOT NULL,
	FK_cursus_id INT FOREIGN KEY REFERENCES Cursus(Cursus_id),
	FK_agenda_id INT FOREIGN KEY REFERENCES Agenda(Agenda_id),
	FK_campus_id INT FOREIGN KEY REFERENCES Campus(Campus_id) 
)
GO


INSERT INTO Campus ([name]) VALUES ('Strasbourg'), ('Bordeaux'), ('Paris')

INSERT INTO Agenda ([name]) VALUES ('Agenda1'), ('Agenda2'), ('Agenda3')

INSERT INTO [Event] ([name], StartTime, EndTime, FK_agenda_id) VALUES ('Dojo', '10-03-2020 09:00:00', '10-03-2020 12:00:00', 1), ('Dojo', '13-03-2020 09:00:00', '13-03-2020 12:00:00', 2), ('Dojo', '17-03-2020 09:00:00', '17-03-2020 12:00:00', 3),
																	  ('LiveCoding', '10-03-2020 14:00:00', '10-03-2020 16:00:00', 1), ('LiveCoding', '13-03-2020 14:00:00', '13-03-2020 16:00:00', 2), ('LiveCoding', '17-03-2020 14:00:00', '17-03-2020 16:00:00', 3),
																	  ('Project', '11-03-2020 09:00:00', '11-03-2020 12:00:00', 1), ('Project', '14-03-2020 09:00:00', '14-03-2020 12:00:00', 2), ('Project', '18-03-2020 09:00:00', '18-03-2020 12:00:00', 3)

INSERT INTO Cursus ([name], FK_campus_id) VALUES ('PHP', 1), ('C#', 1), ('PYTHON', 2), ('JAVA', 3)

INSERT INTO Expedition ([name], FK_cursus_id) VALUES ('PHP Expedition1', 1), ('C# Expedition1', 2), ('PYTHON Expedition1', 3), ('JAVA Expedition1', 4),
													 ('PHP Expedition2', 1), ('C# Expedition2', 2), ('PYTHON Expedition2', 3), ('JAVA Expedition2', 4)

INSERT INTO Quest ([title], [text], FK_expedition_id) VALUES ('Quete1PHP', 'blablabla', 1), ('Quete2PHP', 'blablabla', 1), ('Quete3PHP', 'blablabla', 1), ('Quete1C#', 'blablabla', 2), ('Quete2C#', 'blablabla', 2), ('Quete3C#', 'blablabla', 2),
															 ('Quete1PYTHON', 'blablabla', 3), ('Quete2PYTHON', 'blablabla', 3), ('Quete3PYTHON', 'blablabla', 3), ('Quete1JAVA', 'blablabla', 4), ('Quete2JAVA', 'blablabla', 4), ('Quete3JAVA', 'blablabla', 4),
															 ('Quete4PHP', 'blablabla', 5), ('Quete5PHP', 'blablabla', 5), ('Quete6PHP', 'blablabla', 5), ('Quete4C#', 'blablabla', 6), ('Quete5C#', 'blablabla', 6), ('Quete6C#', 'blablabla', 6),
															 ('Quete4PYTHON', 'blablabla', 7), ('Quete5PYTHON', 'blablabla', 7), ('Quete6PYTHON', 'blablabla', 7), ('Quete4JAVA', 'blablabla', 8), ('Quete5JAVA', 'blablabla', 8), ('Quete6JAVA', 'blablabla', 8)


INSERT INTO Person ([name], [type], FK_cursus_id, FK_agenda_id, FK_campus_id) VALUES ('ProvieurStrasbourg', 'LeadTeacher', 1, 1, 1), ('ProviseurBordeaux', 'LeadTeacher', 1, 2, 2), ('ProviseurParis', 'LeadTeacher', 1, 3, 3)

INSERT INTO Person ([name], [type], FK_cursus_id, FK_agenda_id, FK_campus_id) VALUES ('ProfPHPStras', 'Teacher', 1, 1, 1), ('ProfC#Stras', 'Teacher', 2, 2, 1), ('ProfPHPBor', 'Teacher', 3, 3, 2), ('ProfC#Par', 'Teacher', 4, 1, 3)


DECLARE @name VARCHAR(50), @Count INT, @type VARCHAR(50), @FK_cursus_id INT, @FK_agenda_id INT, @FK_campus_id INT
SET @name = 'Person'
SET @Count = 8
SET @type = 'Student'

WHILE (@Count < 101)
	BEGIN
		SET @name = 'Person' + CONVERT(VARCHAR, @Count)
		SET @FK_cursus_id = FLOOR(RAND()*(4-1+1))+1
		SET @FK_agenda_id = FLOOR(RAND()*(3-1+1))+1
		SET @FK_campus_id = FLOOR(RAND()*(3-1+1))+1
		INSERT INTO Person ([name], [type], FK_cursus_id, FK_agenda_id, FK_campus_id) VALUES (@name, @type, @FK_cursus_id, @FK_agenda_id, @FK_campus_id) 
		SET @Count = @Count + 1
	END
GO


/*SELECT * From Person AS p
INNER JOIN Cursus AS c ON c.Cursus_id = p.FK_cursus_id
INNER JOIN Expedition AS e ON e.FK_cursus_id = c.Cursus_id
INNER JOIN Quest AS q ON q.Quest_id = e.FK_cursus_id
GO

SELECT e.Expedition_id, e.[name], COUNT(q.Quest_id) AS QuestNumber, q.title From Person AS p
INNER JOIN Cursus AS c ON c.Cursus_id = p.FK_cursus_id
INNER JOIN Expedition AS e ON e.FK_cursus_id = c.Cursus_id
INNER JOIN Quest AS q ON q.Quest_id = e.FK_cursus_id
GROUP BY e.[name], e.Expedition_id, q.Quest_id, q.title
GO*/



-- affiche les étudiants de tous les cursus

SELECT c.[Cursus_id], c.[name], p.[name] AS StudentsName From Person AS p
INNER JOIN Cursus AS c ON c.Cursus_id = p.FK_cursus_id
WHERE [type] = 'Student'
GROUP BY c.Cursus_id, c.[name], p.[name]
GO

--procédure stockée qui affiche tous les étudiants d'un cursus 
CREATE PROC sp_GetAllStudentsFromCursus
	@Cursus_name VARCHAR(20)
AS
	BEGIN
		SELECT p.[name] AS StudentsName FROM Person AS p
		INNER JOIN Cursus AS c ON c.Cursus_id = p.FK_cursus_id
		WHERE [type] = 'Student' AND @Cursus_name = c.[name] 
	END

--test de procédure pour cursus JAVA
DECLARE @StudentsFromCursus INT
EXECUTE @StudentsFromCursus = sp_GetAllStudentsFromCursus 'JAVA'
PRINT @StudentsFromCursus
GO