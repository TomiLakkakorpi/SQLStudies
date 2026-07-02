--------------------------------------------------

/* SQL Harjoituksia 2 - VIEW */

--------------------------------------------------

/* Tehtävänanto */
-- 1) Tee view, joka näyttää Products taulun.
-- Hae Lisäksi Suppliers ja Categories tauluista lisätietoa. 
-- Käytä LEFT JOIN rakennetta
-- Näytä vain tuotteet jotka ovat yhä käytössä!

CREATE OR ALTER VIEW dbo.ProductsSuppliersAndCategoriesTable
AS
	SELECT 
		p.ProductID, P.ProductName,
		s.SupplierID, s.CompanyName,
		c.CategoryID, c.CategoryName
	FROM dbo.Products AS p
	LEFT JOIN dbo.Suppliers AS s
	ON p.SupplierID = s.SupplierID
	LEFT JOIN dbo.Categories as c
	ON p.CategoryID = c.CategoryID
	WHERE p.Discontinued = '0'

-- View:n käyttö, (eri tiedostossa!)
-- SELECT * FROM dbo.ProductsSuppliersAndCategoriesTable