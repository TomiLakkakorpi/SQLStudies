--------------------------------------------------

/* SQL perusteet 3 - JOIN */

--------------------------------------------------

SELECT * FROM Customers 
SELECT * FROM Orders

--------------------------------------------------

SELECT 
	O.OrderID, O.OrderDate, O.ShipCity, 
	C.ContactTitle + ' ' + C.ContactName AS Customer
FROM Orders AS O
LEFT JOIN Customers AS C ON O.CustomerID = C.CustomerID
ORDER BY O.OrderDate

--------------------------------------------------

SELECT 
	O.OrderID, O.OrderDate, O.ShipCity, 
	C.ContactTitle + ' ' + C.ContactName AS Customer, 
	E.Title + ' ' + E.TitleOfCourtesy + ' ' + E.FirstName + ' ' + E.LastName AS Employee
FROM Orders AS O
LEFT JOIN Customers AS C ON O.CustomerID = C.CustomerID
LEFT JOIN Employees AS E ON O.EmployeeID = E.EmployeeID
ORDER BY O.OrderDate