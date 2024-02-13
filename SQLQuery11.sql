CREATE PROCEDURE ToplamFaturaHesapla
    @RezervasyonID INT
AS
BEGIN
    DECLARE @ToplamFatura DECIMAL(10, 2);
    DECLARE @GeceSayisi INT;
    DECLARE @Ucret DECIMAL(10, 2);

    SELECT @GeceSayisi = DATEDIFF(DAY, GirisTarihi, CikisTarihi),
           @Ucret = Ucret
    FROM Rezervasyonlar
    INNER JOIN Odalar ON Rezervasyonlar.OdaID = Odalar.OdaID
    WHERE RezervasyonID = @RezervasyonID;

    SET @ToplamFatura = @GeceSayisi * @Ucret;

    SELECT @ToplamFatura AS ToplamFatura;
END;
GO