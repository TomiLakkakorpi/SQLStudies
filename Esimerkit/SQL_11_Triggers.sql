--------------------------------------------------

/* SQL perusteet 11 - TRIGGERS */

--------------------------------------------------

--Trigger on "script" joka suoritetaan kun joku ehto täyttyy

-- TRIGGER on stored procedure (muissa kielissä event handler)
-- 1) reagoi INSERT, DELETE tai UPDATE komentoihin taulussa
-- 2) reagoi tietokannan rakenteen muutoksiin CREATE, ALTER ja DROP
-- 3) reagoi käyttäjien toimintaan (LOGON)

/*
CREATE OR ALTER TRIGGER <triggername>
ON <taulunnimi>
AFTER {}
AS
BEGIN
	<koodi tähän>	
END
*/

--------------------------------------------------

/*
-- STEP 1) luodaan auditointitaulu
CREATE TABLE dbo.ShippersAudit (
	-- taululla on aina oltava identity ja primary key
	AuditID int identity primary key,
	-- seuraavat kolme saraketta ovat samat kuin Shippers taulun sarakkeet
	ShipperID int NOT NULL,
	CompanyName nvarchar(40) NOT NULL,
	Phone nvarchar(24) NULL,
	-- talletetaan mikä toiminto tehtii shippers tauluun
	Change_time DATETIME NOT NULL,
	Operation char(3) NOT NULL,
	CHECK(operation = 'INS' OR operation = 'DEL')
);
*/

--------------------------------------------------

--UPDATE kohta puuttuu

/*
-- 2) Luodaan trigger, joka kiinnitetään Shippers tauluun
CREATE OR ALTER TRIGGER dbo.trgAuditShippers
ON dbo.Shippers
-- Trigger reagoi INSERT ja DELETE komentoihin
-- Tämä triggeri toimii talletuksen jälkeen
-- Etukäteen toimiva triggeri vaatii BEFORE sanan
AFTER INSERT,UPDATE, DELETE
AS
BEGIN
-- tämä komento suppressaa joukon ilmoituksia
-- Nyt alertteja tulee 1 per triggerin käyttö
	SET NOCOUNT ON;
	-- Talletetaan Shippers taulun kopio audit tauluun
	INSERT INTO dbo.ShippersAudit (
		-- nämä tiedot ovat Shippers taulusta
		ShipperID,
		CompanyName,
		Phone,
		-- aikaleima
		Change_time,
		-- operaation tyyppi
		Operation
	)
	SELECT
		-- lisätyn Shippersin ID inserted taulusta
		i.ShipperID,
		-- Shippersin tietoja
		i.CompanyName,
		i.Phone,
		-- Aikaleiman haku tietokantapalvelimelta
		GETDATE(),
		-- Teimme "INS" eli insert operaation
		'INS'
	FROM 
		-- tämä on väliaikainen taulu, joka muodostuu
		-- tehtäessä insert komentoa johonkin tauluun
		-- Tätä seurataan koska trigger on kiinnitteery Shippers tauluun
		inserted as i
	UNION ALL
	SELECT
		-- lisätyn Shippersin ID deleted taulusta
		d.ShipperID,
		-- Shippersin tietoja
		d.CompanyName,
		d.Phone,
		-- Aikaleiman haku tietokantapalvelimelta
		GETDATE(),
		-- Teimme "DEL" eli delete operaation
		'DEL'
	FROM 
		deleted as d;
END
*/

/*
INSERT INTO dbo.Shippers(Companyname, Phone)
VALUES('Testifirma', '123456');

UPDATE Shippers
SET Shippers.Phone = '777777'
WHERE ShipperID = 8

DELETE FROM dbo.Shippers
WHERE ShipperID = 8;

SELECT * from ShippersAudit
*/

--------------------------------------------------

-- 1) Luodaan taulu RegionApprovals
-- Tässä on epävirallisia regioneita, joita ei ole hyväksytty
-- Uusi region lisätään tänne

/*
CREATE TABLE dbo.RegionApprovals (
	RegionID int IDENTITY PRIMARY KEY,
	RegionDescription nchar(50) NOT NULL
);
*/

/*
CREATE OR ALTER VIEW dbo.RegionList
AS
SELECT
	r.RegionDescription,
	'virallinen' AS region_status
FROM
	dbo.Region AS r
UNION
SELECT
	ra.RegionDescription,
	'epävirallinen' AS region_status
FROM
	dbo.RegionApprovals AS ra;
*/

/*
SELECT * FROM region

SELECT * FROM RegionApprovals

SELECT * FROM regionList
*/

/*
CREATE OR ALTER TRIGGER dbo.trgRegionList
ON dbo.RegionList
-- trigger laukeaa kun viewta yritetään tallettaa
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON;
	-- tallettaa Regionapprovals tauluun
	INSERT INTO dbo.RegionApprovals (RegionDescription)
	SELECT
		i.RegionDescription
	FROM
		inserted AS i
	WHERE
		-- RegionDescription EI saa olla jo Region taulussa
		i.RegionDescription NOT IN (
			SELECT 
				RegionDescription
			FROM
				dbo.Region
		) 
		AND
		-- RegionDescription EI saa olla jo RegionApprovals taulussa
		i.RegionDescription NOT IN (
			SELECT 
				RegionDescription
			FROM
				dbo.RegionApprovals
		) 
END
*/

/*
INSERT INTO dbo.RegionList (RegionDescription)
VALUES ('Oulu');

INSERT INTO dbo.RegionList (RegionDescription)
VALUES ('Pori');

INSERT INTO dbo.RegionList (RegionDescription)
VALUES ('Pori');
*/

--------------------------------------------------

-- DDL trigger 
-- Tällainen trigger on joko tietokannan tai tietokantapalvelimen tasoinen
-- DATABASE tarkoittaa että se on tietokannan tasoinen
-- ALL SERVER tarkoittaa että se on tietokantapalvelimelle

-- Helppo tapaus on indeksien tarkistus
-- Tarvitaan taulu, johon indeksien muutoseventit talletetaan
-- trigger tietokannan tasolle, joka täyttää taulun

/* 1) Luodaan taulu, johon index eventit logitetaan */
/*
CREATE TABLE dbo.IndexLog (
	LogID int IDENTITY PRIMARY KEY,
	IndexEvent XML NOT NULL,
	EventTime DATETIME NOT NULL,
	Creator SYSNAME NOT NULL
);
*/

/* 2) Luodaan triggeri tietokannalle */
/*
CREATE OR ALTER TRIGGER trgIndexAlert
-- tripperi koskee vain tätä tietokantaa, joten DATABASE
ON DATABASE
FOR
	CREATE_INDEX, ALTER_INDEX, DROP_INDEX
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.IndexLog (
		IndexEvent,
		EventTime,
		Creator
	)
	VALUES (
		EVENTDATA(),
		GETDATE(),
		USER
	);
END
*/

/*
CREATE NONCLUSTERED INDEX nidxFirstName
ON dbo.Employees (FirstName);

CREATE NONCLUSTERED INDEX nidxLastName
ON dbo.Employees (LastName);

DROP INDEX dbo.Employees.nidxFirstName;

DROP INDEX dbo.Employees.nidxLastName;

SELECT * FROM IndexLog
*/

--------------------------------------------------

/* Harjoitustehtävä */

-- 1) Iltapäivän tehtävä
-- Tee triggeri Region tauluun, joka reagoi kun tauluun lisätään jotain.
-- Talleta tieto RegionAudit tauluun

--SELECT * FROM Region

/*
CREATE TABLE dbo.RegionAudit (
	AuditID int IDENTITY PRIMARY KEY,
	RegionID int NOT NULL,
	RegionDescription nvarchar(40) NOT NULL,
	EventTime DATETIME NOT NULL,
);
*/

/*
CREATE OR ALTER TRIGGER dbo.trgRegionAudit
ON dbo.Region
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.RegionAudit (
		RegionID,
		RegionDescription,
		EventTime
	)
	SELECT
		i.RegionID,
		i.RegionDescription,
		GETDATE()
	FROM 
		inserted as i
END
*/

INSERT INTO dbo.Region (RegionID, RegionDescription)
VALUES ('5','Region A');

INSERT INTO dbo.Region (RegionID, RegionDescription)
VALUES ('6','Region B');

INSERT INTO dbo.Region (RegionID, RegionDescription)
VALUES ('7','Region C');

SELECT * FROM Region
SELECT * FROM RegionAudit