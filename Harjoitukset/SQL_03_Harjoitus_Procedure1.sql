--------------------------------------------------

/* SQL Harjoituksia 3 - Procedure */

--------------------------------------------------

/*
CREATE OR ALTER PROCEDURE spGetCustomerBasedOnCity
	@city NVARCHAR(40)
AS

BEGIN
	SELECT * FROM dbo.Customers AS c
	WHERE c.City = @city
END
*/

--------------------------------------------------

/* Kutsu: (Toisessa tiedostossa) */

/*
EXEC spGetCustomerBasedOnCity
	@city = 'Berlin'
*/