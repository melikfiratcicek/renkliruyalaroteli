DECLARE @Counter INT = 0; -- Declare and initialize @Counter variable

WHILE @Counter < 100000
BEGIN
    INSERT INTO Misafirler (MisafirID, Ad, Soyad, Eposta, Telefon)
    VALUES (@Counter + 1, CONCAT('Ahmet', CAST(@Counter + 1 AS VARCHAR)), CONCAT('Kaya', CAST(@Counter + 1 AS VARCHAR)), CONCAT('email', CAST(@Counter + 1 AS VARCHAR), '@gmail.com'), CONCAT('555-', CAST(@Counter + 1 AS VARCHAR)));
    SET @Counter = @Counter + 1;
END;
