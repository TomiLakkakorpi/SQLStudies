--------------------------------------------------

/* SQL perusteet 4 - TRANSACTION */

--------------------------------------------------

SELECT * FROM dbo.Shippers;

BEGIN TRANSACTION

DELETE FROM Shippers WHERE ShipperID > 3

SELECT * FROM dbo.Shippers;

/* Palauttaa väliaikaisesti poistetut tiedot */
--ROLLBACK

/* Päättää transactionin ja tekee muutokset pysyviksi */
--COMMIT TRANSACTION

SELECT * FROM dbo.Shippers;