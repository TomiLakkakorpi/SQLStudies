--------------------------------------------------

/* SQL Harjoituksia 1 - SELECT, DELETE, UPDATE, JOIN */

--------------------------------------------------

USE Northwind
GO

--"Hae kaikki tiedot Shippers taulusta!"
SELECT * FROM Shippers

--"Missä eri kaupungeissä on suppliereitä?"
SELECT City FROM Suppliers

--"Montako ShipperIDtä löytyy Orders taulusta?"
SELECT DISTINCT ShipVia FROM Orders

--"Etsi tuotteet, joiden hinta on 20 ja 50 euron välissä!"
SELECT * FROM Products WHERE UnitPrice BETWEEN 20 AND 50

--"Etsi asiakkaat, jotka ovat USAssa tai Saksassa"
SELECT * FROM Customers WHERE Country IN ('USA', 'Germany')

--"Etsi kaikki asiakkaat, jotka eivät ole saksalaisia"
SELECT * FROM Customers WHERE Country != 'Germany'

--"Etsi kaikki asiakkaat, jotka ovat USAsta tai Saksasta mutta eivät Berliinistä"
SELECT * FROM Customers WHERE Country IN ('USA', 'Germany') AND City != 'Berlin'

--"Näytä tilaukset tilauspäivämäärän mukaan järjestyksessä"
SELECT * FROM Orders ORDER BY OrderDate ASC

--"Näytä tuotteet hinnan mukaan korkein hinta ensin"
SELECT * FROM Products ORDER BY UnitPrice DESC

--"Näytä Kategoria 2:n tuotteet hinnan mukaan"
SELECT * FROM Products WHERE CategoryID = 2 ORDER BY UnitPrice ASC
 
--"Lisää asiakas Customers tauluun" (KESKEN)
SELECT * FROM Customers
INSERT INTO Customers (CustomerID, CompanyName)
VALUES('ESYR', 'EsimerkkiYritys', 'Matti Meikäläinen');

--"Hae lisäämäsi asiakkaat"
SELECT * FROM Customers WHERE CustomerID = 'ESYR'

--"Muuta luomaasi Customers taulua niin että luomallasi asiakkaalla on kaikki tiedot"
UPDATE Customers 
SET Address = 'Kokelaskuja 3', City = 'Oulu', Region = 'OU', PostalCode = '90000', Country = 'Finland', Phone = '12345678', Fax = '87654321'
WHERE CustomerID = 'ESYR'

--"Poista luomasi asiakkaat Customers taulusta"
DELETE FROM Customers WHERE CustomerID = 'ESYR'

--"Ilmoita jokin sarake Orders taulusta ja hae siihen lisätietoa OrderDetails taulusta" Käytä LEFT JOIN rakennetta
SELECT * FROM OrderDetails 
SELECT * FROM Orders

SELECT
	O.OrderID, O.OrderDate, O.Freight, 
	OD.UnitPrice
FROM Orders AS O
LEFT JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
ORDER BY O.OrderDate

--Jatkoa edelliseen. Hae Customertaulusta kaupunki ja maa lisätietoina. Hae vielä shipperin nimi ja työntekijän nimi
SELECT * FROM Customers
SELECT * FROM Employees
SELECT * FROM Shippers
SELECT * FROM Orders
SELECT * FROM OrderDetails 

SELECT
	O.OrderID, O.OrderDate, O.Freight,
	OD.UnitPrice,
	C.City, C.Country,
	S.CompanyName AS Shipper,
	E.FirstName + ' ' + E.LastName AS Employee
FROM Orders AS O
LEFT JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
LEFT JOIN Customers AS C ON C.CustomerID = O.CustomerID
LEFT JOIN Shippers AS S ON S.ShipperID = O.ShipVia
LEFT JOIN Employees AS E ON E.EmployeeID = O.EmployeeID
ORDER BY O.OrderDate