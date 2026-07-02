--------------------------------------------------

/* SQL perusteet 5 - VIEW */

--------------------------------------------------

--SELECT * FROM dbo.Orders;

-- View hakee päivämäärät ja firman yhteyshenkilön nimen
-- Oikeassa käyttötapauksessa CREATE ja ALTER erikseen
CREATE OR ALTER VIEW dbo.OrdersAndContactsTable
AS 
	SELECT 
		o.OrderID, o.OrderDate,	o.RequiredDate,	o.ShippedDate,
		e.TitleOfCourtesy + ' ' + e.FirstName + ' ' + e.LastName AS AccountManager
	FROM dbo.Orders AS o
	LEFT JOIN dbo.Employees AS e
	ON o.EmployeeID = e.EmployeeID

/* View:n käyttö (eri tiedostossa!) */
--SELECT * FROM dbo.OrdersAndContactsTable
