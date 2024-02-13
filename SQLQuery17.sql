CREATE TRIGGER OdaUygunluguGuncelle
ON Rezervasyonlar
AFTER INSERT
AS
BEGIN
    UPDATE Odalar
    SET Uygunluk = 0
    WHERE OdaID IN (SELECT OdaID FROM inserted);
END;
GO