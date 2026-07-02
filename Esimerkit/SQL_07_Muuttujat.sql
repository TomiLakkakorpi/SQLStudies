--------------------------------------------------

/* SQL perusteet 7 - VARIABLES */

--------------------------------------------------

/*
--DECLARE @mymuuttuja INT
DECLARE @mymuuttuja INT = 20
SET @mymuuttuja = 10
EXEC spGetProducts @maxprice = @mymuuttuja
*/

--------------------------------------------------

/*
DECLARE @myCity VARCHAR(40)
SET @myCity = 'Paris'
EXEC spGetCustomerBasedOnCity @myCity
*/

--------------------------------------------------

/*
DECLARE @mymuuttuja INT
SET @mymuuttuja = 
(
	SELECT COUNT(City) FROM Customers
)

SELECT @mymuuttuja AS 'City Count'
PRINT @mymuuttuja
*/ 

--------------------------------------------------