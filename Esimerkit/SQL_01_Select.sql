--------------------------------------------------

/* SQL perusteet 1 - SELECT*/

--------------------------------------------------

SELECT * FROM Customers

SELECT Country FROM Customers

SELECT City, Country FROM Customers

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Address, Country, City FROM Customers

SELECT DISTINCT City FROM Customers

--------------------------------------------------

/* Oikea tapa, ei Distinct perään montaa haettavaa tietoa */
SELECT DISTINCT City FROM customers WHERE Country = 'France'

SELECT * FROM Customers WHERE Country = 'France' OR Country = 'Germany'

--------------------------------------------------

/* Kaksi tapaa tehdä sama asia */
SELECT DISTINCT * FROM customers WHERE Country = 'France' AND NOT City = 'Paris'
SELECT DISTINCT * FROM customers WHERE Country = 'France' AND City != 'Paris'

--------------------------------------------------

/* Komennot voi jakaa useammalle riville */
SELECT * 
FROM 
	Customers 
ORDER BY 
	Country, City DESC, Address

--------------------------------------------------

SELECT * 
FROM Products 
-- WHERE SupplierID < 5
ORDER BY CategoryID, SupplierID, Unitprice; 

--------------------------------------------------

/* Group by harvemmin käytetään, yleensä nämä hoidetaan backendissä ettei tietokanta kuormitu turhaan*/
SELECT SupplierID, CategoryID, 
	MIN(Unitprice) AS Lowend,
	AVG(UnitPrice) AS Average,
	MAX(Unitprice) AS highend
FROM Products 
--Where ehto asettaa halutut hakuehdot
--Se asetetaan ennen GROUP BY sarakeyhdistelmää
WHERE SupplierID < 5
-- WHERE ReorderLevel > 0
--GROUP BY sisältää ne sarakkeet, joista halutaan
-- koottua 'aggregate' tietoa
GROUP BY SupplierID, CategoryID
--HAVING sisältää näyttöehdot aggregaateille
--HAVING AVG(UnitPrice) > 30

--------------------------------------------------

SELECT SupplierID, 
	MIN(Unitprice) AS Lowend,
	AVG(UnitPrice) AS Average,
	MAX(Unitprice) AS highend
FROM dbo.Products
GROUP BY SupplierID

--------------------------------------------------

/* Kun halutaan laskea jonkun tiedon määrä */
SELECT COUNT(Country) FROM Customers;

--------------------------------------------------

/* Tämän kaltaisiin hakuihin aina vähintään kolme merkkiä, näin haettavien tietojen määrä on vähempi */
SELECT * FROM dbo.Customers WHERE Country LIKE 'Ita%'

--------------------------------------------------

/* Useita vaihtoehtoja */
SELECT * FROM dbo.Customers WHERE Country IN ('Finland', 'USA', 'Bangladesh');

--------------------------------------------------

/* Between on tarkoitettu tämänkaltaisiin hakuihin*/
/* EI KÄYTETÄ TEKSTIN HAKUUN */
SELECT * FROM Products WHERE UnitPrice BETWEEN 10 AND 15

--------------------------------------------------

SELECT ContactTitle + '\n' + ContactName + '\n' + Address + ',' + Postalcode + ' ' + City + '\n' + Country AS LabelAddress FROM dbo.Customers;