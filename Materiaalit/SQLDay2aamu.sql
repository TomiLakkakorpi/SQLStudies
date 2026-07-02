

--use Northwind;


/*
--
-- VIEW
--

HUOM! VIEW ei välttämättä mene automaattisesti
IntelliSensen muistiin, joten cache on päivitettävä käsin.
SHIFT + CTRL + R

--
Miksi view?

Security
Näkee ainoastaan VIEWn eikä sen alla olevaa taulua.

Simplicity
Yksinkertaistaa hakuja, jos tietokannan taulurakenne
on monimutkainen.

Consistency
Sama toimintatapa helpottaa skriptien ylläpitoa.


CREATE OR ALTER VIEW <viewname>
AS
<koodi tähän>

*/

--SELECT * FROM dbo.Orders;
/*
SELECT 
	o.OrderID, o.OrderDate,	o.RequiredDate,	o.ShippedDate,
	e.TitleOfCourtesy + ' ' + e.FirstName + ' ' + e.LastName AS AccountManager
FROM dbo.Orders AS o
INNER JOIN dbo.Employees AS e
ON o.EmployeeID = e.EmployeeID
*/

/*
CREATE OR ALTER VIEW vw_OrdersAndContacts
AS
-- View hakee päivämäärät ja firman yhteyshenkilön nimen
SELECT 
	o.OrderID, o.OrderDate,	o.RequiredDate,	o.ShippedDate,
	e.TitleOfCourtesy + ' ' + e.FirstName + ' ' + e.LastName AS AccountManager
FROM dbo.Orders AS o
INNER JOIN dbo.Employees AS e
ON o.EmployeeID = e.EmployeeID;
*/

-- VIEWta käytetään kuten taulua haettaessa tietoa
-- SELECT * FROM dbo.vw_OrdersAndContacts;
-- SELECT DISTINCT AccountManager FROM dbo.vw_OrdersAndContacts;
-- SELECT * FROM dbo.koenimi;

-- DROP VIEW tuhoaa viewn...
-- DROP VIEW dbo.koenimi;

/*
1) Tee view, joka näyttää Products taulun.
Hae Lisäksi Suppliers ja Categories tauluista lisätietoa. 
Käytä LEFT JOIN rakennetta
Näytä vain tuotteet jotka ovat yhä käytössä!
*/

/*
CREATE OR ALTER VIEW vw_ProductsAllInfo
AS
SELECT p.ProductID, p.ProductName, p.QuantityPerUnit,
p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel,
s.CompanyName, s.ContactName, s.ContactTitle, s.Country,
s.Fax, s.HomePage, s.Phone, s.PostalCode, s.Region,
c.CategoryName, c.Description, c.Picture
FROM dbo.Products AS p
LEFT JOIN dbo.Suppliers AS s ON s.SupplierID = p.SupplierID
LEFT JOIN dbo.Categories AS c ON c.CategoryID = p.CategoryID
WHERE p.Discontinued = 0
*/

--SELECT * FROM dbo.vw_ProductsAllInfo;

/*
Mikä on oikea SQL syntaksi?
SQL kielessä isoilla ja pienillä kirjaimilla ei 
ollut eroa alunperin. Kaikki kirjoitettiin isoilla
kirjaimilla.

80-luvun kuluessa ja 90-luvulla muotiin tuli
kirjoittaa taulut isolla alkukirjaimella.

Nykyään kaikki valmistajat tukevat kaikkia
isojen ja pienten kirjaimien yhdistelmiä.

*/
--Seuraavat haut ovat siksi laillisia
--select * from DBO.CUSTOMERS;

-- Tosi old school SQL koodarit toimii seuraavasti:
-- jokainen SQL komento on aina PÖLKKYKIRJAIMILLA
-- Kaikki muut on kirjoitettu pienillä kirjaimilla.
-- Käytännössä firmalla on oma kirjoitustyylinsä.
-- Tarkista coding guidelines ja seuraa niitä.


