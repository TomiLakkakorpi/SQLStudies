--------------------------------------------------

/* SQL perusteet 8 - CONDITIONAL STATEMENTS */

--------------------------------------------------
/*
CREATE OR ALTER PROCEDURE spIfTesti
	@argumentti int
AS
BEGIN
	IF @argumentti > 1000
	BEGIN
		PRINT 'Yli tontun!';
	END
	ELSE
	BEGIN
		PRINT 'Alle tontun!';
	END
END
*/

/* Kutsuminen; (eri tiedostossa) */
-- spIfTesti 500

/* Toinen tapa kutsua */
/*
DECLARE @mymuuttuja INT
SET @mymuuttuja = 1400
EXEC spIfTesti @mymuuttuja 
*/

--------------------------------------------------

/*
CREATE OR ALTER PROCEDURE spIfTesti
	@argumentti INT
AS
BEGIN
	IF @argumentti > 1000
	BEGIN
		PRINT 'Yli tontun!';
	END
	ELSE
	BEGIN
		IF @argumentti = 1000
		BEGIN
			print 'Tonttu!';
		END
		ELSE
		BEGIN
			PRINT 'Alle tontun!';
		END
	END
END
*/

--------------------------------------------------

/*
DECLARE @iteraattori INT = 0

WHILE @iteraattori < 5
BEGIN
	PRINT @iteraattori
	SET @iteraattori = @iteraattori + 1
END
*/

--------------------------------------------------

/*
DECLARE @iteraattori INT = 6

WHILE @iteraattori >= 0
BEGIN
	PRINT @iteraattori
	IF @iteraattori = 3
	BEGIN
		BREAK			--Pysäyttää loopin
		--CONTINUE		--Jatkaa looppia ikuisesti koska looppi ei mene iteraattorin vähennykseen asti koskaan
	END
	SET @iteraattori = @iteraattori - 1
END
*/

--------------------------------------------------

/* Harjoitus */

/*
DECLARE @iteraattori INT = 6

WHILE @iteraattori > 0
BEGIN
	SET @iteraattori = @iteraattori - 1

	IF @iteraattori = 0
	BEGIN
		PRINT 'BOOM!'
		BREAK
	END

	PRINT @iteraattori
END
*/

--------------------------------------------------

-- TRY CATCH ja error
-- TRY CATCH idea on tehdä jotain, jolloin virhe EI saa kaataa konetta
-- esim rajapinnat, koska niiden takana oleville asioille emme voi mitään.