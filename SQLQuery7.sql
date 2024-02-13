-- Declare variables
DECLARE @Counter INT = 0;
DECLARE @NumberOfRooms INT = 100; -- Number of rooms to generate
DECLARE @NumberOfGuests INT = 500; -- Number of guests to generate
DECLARE @MaxBookingDateDiff INT = 30; -- Maximum number of days between check-in and check-out

-- Insert data into Odalar (Rooms) table
WHILE @Counter < @NumberOfRooms
BEGIN
    INSERT INTO Odalar (OdaID, OdaNumarasi, OdaTuru, Ucret)
    VALUES (@Counter + 1, 'Oda ' + CAST(@Counter + 1 AS VARCHAR), 'Oda Türü ' + CAST((@Counter % 5) + 1 AS VARCHAR), ROUND(RAND() * 200 + 100, 2));
    SET @Counter = @Counter + 1;
END;

-- Reset counter for Misafirler (Guests) table
SET @Counter = 0;

-- Insert data into Misafirler (Guests) table
WHILE @Counter < @NumberOfGuests
BEGIN
    INSERT INTO Misafirler (MisafirID, Ad, Soyad, Eposta, Telefon)
    VALUES (@Counter + 1, 'Misafir Ad? ' + CAST(@Counter + 1 AS VARCHAR), 'Misafir Soyad? ' + CAST(@Counter + 1 AS VARCHAR), 'email' + CAST(@Counter + 1 AS VARCHAR) + '@gmail.com', '555-' + CAST(@Counter + 1 AS VARCHAR));
    SET @Counter = @Counter + 1;
END;

-- Insert data into Rezervasyonlar (Bookings) table
SET @Counter = 0;
DECLARE @CheckInDate DATE;
DECLARE @CheckOutDate DATE;

WHILE @Counter < @NumberOfGuests
BEGIN
    SET @CheckInDate = DATEADD(DAY, -CAST(ROUND(RAND() * @MaxBookingDateDiff, 0) AS INT), GETDATE());
    SET @CheckOutDate = DATEADD(DAY, -CAST(ROUND(RAND() * @MaxBookingDateDiff, 0) AS INT), @CheckInDate);

    INSERT INTO Rezervasyonlar (RezervasyonID, MisafirID, OdaID, GirisTarihi, CikisTarihi)
    VALUES (@Counter + 1, ROUND(RAND() * @NumberOfGuests, 0) + 1, ROUND(RAND() * @NumberOfRooms, 0) + 1, @CheckInDate, @CheckOutDate);

    SET @Counter = @Counter + 1;
END;
