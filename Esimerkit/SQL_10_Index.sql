--------------------------------------------------

/* SQL perusteet 10 - INDEX */

--------------------------------------------------

/*
CREATE TABLE dbo.IndexTest (
	TestID int NOT NULL,
	TestName varchar(50)
);

INSERT INTO dbo.IndexTest (TestID, TestName)
VALUES
	(111,'Tupu'),
	(112,'Hupu'),
	(113,'Lupu'),
	(114,'Aku'),
	(115,'Iines');
*/

--SELECT it.TestID, it.TestName FROM dbo.IndexTest as it;

--------------------------------------------------

ALTER TABLE dbo.IndexTest
ADD PRIMARY KEY(TestID);

/*
CREATE CLUSTERED INDEX ixTestName 
ON dbo.IndexTest (TestName);
*/

SELECT TestID, TestName FROM dbo.IndexTest WHERE TestID = 113

--------------------------------------------------