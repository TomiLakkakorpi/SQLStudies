--------------------------------------------------

/* SQL perusteet 9 - CURSOR */

--------------------------------------------------

-- HUOM! Cursor käyttää todella paljon muistia, ei käytetä ellei aivan pakko

-- CURSORilla käydään läpi kerättyä resultsettiä
-- Periaatteessa idea on saada iso RESULT SET, jota voidaan
-- perata tai muuten "säätää"
-- Tämä varaa muistia, joten se on suuri muistisyöppö

-- Tässä luodaan pari apumuuttujaa
DECLARE 
	@productname nvarchar(40),
	@unitprice money;

-- Aluksi esitellään CURSOR
-- joka yhdistetään SQL lauseeseen (käytännössä SELECT)
DECLARE cursor_products CURSOR
FOR SELECT
	p.ProductName,
	p.UnitPrice
FROM dbo.Products AS p
ORDER BY p.ProductName;	

-- Seuraavaksi CURSOR avataan
-- Tällöin muistia varataan kursorin käsitteluun
-- Muistivaraus loppuu vasta kun cursor suljetaan!
OPEN cursor_products;

-- Tässä vaiheesssa osoitetaan CURSORin (result set) 
-- ensimmäiseen recordiin (käytännössä ensimmäinen rivi).
-- FETCH NEXT lukee tämän recordin, tulos voidaan tallentaa
-- johonkin muuttujaan
FETCH NEXT FROM cursor_products INTO
	@productname,
	@unitprice;

-- CURSORia luetaan tästä eteenpäin kunnes uusia recordeja ei
-- enää ole result setissä (tarkastus @@FETCH_STATUS).
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @productname + ' --- ' + CONVERT(nvarchar, @unitprice);
	FETCH NEXT FROM cursor_products INTO
		@productname,
		@unitprice;
END;

-- CURSOR suljetaan, jotta se ei enää pidä yllä yhteyttä
CLOSE cursor_products;

-- CURSORin käyttämä muistialue vapautetaan
DEALLOCATE cursor_products;

*/