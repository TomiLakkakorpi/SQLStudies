--------------------------------------------------

/* SQL perusteet 2 - INSERT, UPDATE, DELETE */

--------------------------------------------------

SELECT * FROM dbo.Shippers;

INSERT INTO Shippers (CompanyName, Phone)
VALUES('Makenauto', '');

--------------------------------------------------

SELECT * FROM dbo.Shippers;
/* Oikeasti tietoa ei poistettaisi vaan se asetetaan "poistetuksi" ylimääräisellä arvolla, esim:*/
--WHERE deleted = 0;

SELECT * FROM Shippers WHERE Phone IS NULL or Phone = ''

UPDATE Shippers 
SET Phone = 222 
WHERE ShipperID = 7

--------------------------------------------------

DELETE FROM Shippers WHERE ShipperID = 7