DECLARE @Counter INT = 0;
DECLARE @CustomerId INT;
DECLARE @RoomId INT;
DECLARE @BookingId INT;

WHILE @Counter < 100000
BEGIN
    -- Mü?teri ekle
    INSERT INTO Misafirler (MisafirID, Ad, Soyad, Eposta)
    VALUES 
        (@Counter + 1, 
         'Ahmet' + CAST(@Counter + 1 AS VARCHAR), 
         'Kaya' + CAST(@Counter + 1 AS VARCHAR), 
         'email' + CAST(@Counter + 1 AS VARCHAR) + '@gmail.com');

    -- Kategori Ekle
    INSERT INTO OdaTurleri (OdaTuruID, OdaTuruAdi)
    VALUES 
        (@Counter + 1, 
         'Oda Türü' + CAST(@Counter + 1 AS VARCHAR));

    -- Oda Ekle
    INSERT INTO Odalar (OdaID, OdaNumarasi, OdaTuruID, Ucret)
    VALUES 
        (@Counter + 1, 
         'Oda ' + CAST(@Counter + 1 AS VARCHAR), 
         @Counter % 10 + 1, 
         ROUND(RAND() * 200 + 100, 2));

    -- Rezervasyon Ekle
    INSERT INTO Rezervasyonlar (RezervasyonID, MisafirID, OdaID, GirisTarihi, CikisTarihi)
    VALUES 
        (@Counter + 1, 
         @Counter % 100 + 1, 
         @Counter % 1000 + 1, 
         DATEADD(DAY, RAND() * 365, '2024-01-01'), 
         DATEADD(DAY, RAND() * 10, GETDATE()));

    -- Rezervasyon Detay? Ekle
    SET @BookingId = @Counter % 100 + 1;
    SET @RoomId = @Counter % 1000 + 1;

    INSERT INTO RezervasyonDetaylari (RezervasyonDetayID, RezervasyonID, OdaID, KisiSayisi, ToplamUcret)
    VALUES 
        (@Counter + 1, 
         @BookingId, 
         @RoomId, 
         ROUND(RAND() * 4 + 1, 0), 
         ROUND(RAND() * 200 + 50, 2));

    SET @Counter = @Counter + 1;
END;
