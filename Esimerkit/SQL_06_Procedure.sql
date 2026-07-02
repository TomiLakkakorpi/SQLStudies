--------------------------------------------------

/* SQL perusteet 6 - PROCEDURES */

--------------------------------------------------

/* Proceduret voi ajatella tietokantafunktiona/methodina */
/*
CREATE OR ALTER PROCEDURE spHelloWorld
AS
BEGIN
	PRINT 'Hello World!'
END
*/

-- Procedure kutsu (toisessa tiedostossa!)
--EXECUTE spHelloWorld

--------------------------------------------------

/*
CREATE OR ALTER PROCEDURE spGetEmployees
AS
BEGIN
	PRINT 'spGetEmployees käynnistetty'
	SELECT * FROM dbo.Employees
	PRINT 'spGetEmployees lopetetaan'
END
*/

-- Procedure kutsu (toisessa tiedostossa!)
--EXECUTE spGetEmployees

--------------------------------------------------

-- Procedureille voidaan antaa "syöte"
-- Huom, MONEY on datatyyppi
/*
CREATE OR ALTER PROCEDURE spGetProducts
	@minprice MONEY,
	@maxprice MONEY
AS
BEGIN
	SELECT *
	FROM dbo.Products AS p
	WHERE p.UnitPrice >= @minprice AND p.UnitPrice <= @maxprice
	-- WHERE p.UnitPrice BETWEEN @minprice AND @maxprice
	ORDER BY p.UnitPrice
END
*/

-- Procedure kutsu (toisessa tiedostossa!)
--EXECUTE spGetProducts

--------------------------------------------------

/*
CREATE OR ALTER PROCEDURE spGetProducts 
	@minprice MONEY,
	@maxprice MONEY,
	@productname NVARCHAR(40)

	--Arvoille voidaan antaa myös "default" arvo
	--Proceduret toimivat ilman syötettyjä arvoja, mutta niiden käytössä on omat riskinsä.
	--@minprice MONEY = 0,

	--Näin ei saisi tehdä: Oletettaisiin että tuotteiden max hinta on 1000
	-- @maxprice MONEY = 1000,

	--Tekstille voi asettaa myös default arvon
	--@productname NVARCHAR(40) = ''

	--Arvon voi asettaa myös NULL:iksi. Huom, jos arvoa ei anneta, haku menee läpi mutta se ei palauta mitään!
	--@maxprice MONEY = NULL

AS
BEGIN
	SELECT * FROM dbo.Products AS p
	WHERE p.UnitPrice >= @minprice AND p.UnitPrice <= @maxprice AND p.ProductName LIKE @productname + '%'
	ORDER BY p.UnitPrice;
END
*/

-- Procedure kutsu (toisessa tiedostossa!)
--EXECUTE spGetProducts

--------------------------------------------------

/*
CREATE OR ALTER PROCEDURE spGetProductsDiscontinued

AS
BEGIN
	-- apumuuttuja onko tuote discontinued
	-- arvo 1 -> discontinued
	-- arvo 0 -> discontinued
	DECLARE @apumuuttuja BIT = 1

	SELECT * 
	FROM dbo.Products AS p
	WHERE p.Discontinued = @apumuuttuja
	ORDER BY p.UnitPrice;
END
*/

-- Procedure kutsu (toisessa tiedostossa!)
--EXECUTE spGetProductsDiscontinued



--------------------------------------------------

/* Procedure Kutsut */

--------------------------------------------------

--EXECUTE spHelloWorld

-- Funktiota voidaan kutsua monta kertaa
--EXEC spHelloWorld
--EXEC spHelloWorld

--EXEC spGetEmployees


-- Funktio kutsutaan ja sille annetaan arvo 50
-- EXEC spGetProducts @minprice = 50

/*
EXEC spGetProducts 
	@minprice = 40, 
	@maxprice = 50
*/

/*
EXEC spGetProducts 
	@minprice = 0, 
	@maxprice = 100,
	@productname = 'A'
*/

/*
EXEC spGetProducts 
	@maxprice = 100
*/

-- Procedure harjoituksen kutsu
/*
EXEC spGetCustomerBasedOnCity
	@city = 'Mannheim'
*/