DECLARE @RoomCounter INT = 1;

WHILE @RoomCounter <= 100000
BEGIN
    INSERT INTO Odalar (OdaNumarasi, OdaTuru, Ucret)
    VALUES 
        (CONCAT('Room', @RoomCounter), -- Room number
         CASE 
            WHEN @RoomCounter % 3 = 0 THEN 'Standart'
            WHEN @RoomCounter % 3 = 1 THEN 'Deluxe'
            ELSE 'Suit'
         END, -- Random room type
         ROUND(RAND() * 200 + 100, 2)); -- Random rate between 100 and 300
    
    SET @RoomCounter = @RoomCounter + 1;
END;