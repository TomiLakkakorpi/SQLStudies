--------------------------------------------------

/* SQL Harjoituksia 4 - PROCEDURE */

--------------------------------------------------

/*
CREATE OR ALTER PROCEDURE spGetCustomerCountries
AS
BEGIN
	SELECT Country FROM dbo.Customers
END
*/

--------------------------------------------------

/*
CREATE OR ALTER PROCEDURE spHowManyCustomerCountries
AS

BEGIN
	SELECT COUNT(Country) FROM Customers
END
*/

--------------------------------------------------

/*
CREATE OR ALTER PROCEDURE spMaximumPrice
	@maxPrice INT
AS 

BEGIN
	SELECT ProductName, Unitprice 
	FROM Products
	WHERE UnitPrice <= @maxPrice
	ORDER BY UnitPrice
END
*/

--------------------------------------------------

/*
EXEC spGetCustomerCountries
EXEC spHowManyCustomerCountries
EXEC spMaximumPrice 10
*/

--------------------------------------------------

--Day 2 Stored Procedure -iltapäivän harjoitus

/* 
Tehtävänanto
2) luo stored procedure, joka toteuttaa seuraat toiminnat:
a) Se palauttaa Products taulusta varastossa olevien
tuotteiden kokonaisarvon
b) Se tulostaa proceduren sisällä tuotteiden nimet 
ja hinnat
Extra) Pidä myös huolta, että koodi ottaa huomioon
onko tuote discontinued kyllä/ei ja tulostaa ensin
käytössä olevat ja sitten ei käytössä olevat tuotteet.
*/



--a) kohta
/*
CREATE OR ALTER PROCEDURE spTotalValue
AS

BEGIN
	SELECT SUM(UnitPrice) FROM PRODUCTS
	WHERE Discontinued = 0
END
*/

--EXEC spTotalValue



-- b) kohta

CREATE OR ALTER PROCEDURE spTotalValue
AS

BEGIN
	SELECT ProductName, UnitsInStock, UnitPrice, (UnitsInStock * UnitPrice) AS 'Value', Discontinued FROM Products
	ORDER BY Discontinued
	--WHERE Discontinued = 0

	SELECT SUM(UnitsInStock *  UnitPrice) AS 'Total Value' FROM Products 
	WHERE Discontinued = 0
END

--------------------------------------------------

EXEC spTotalValue