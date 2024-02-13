-- Tablolar? olu?tur
CREATE TABLE Odalar (
    OdaID INT PRIMARY KEY,
    OdaNumarasi VARCHAR(10),
    OdaTuru VARCHAR(50),
    Ucret DECIMAL(10, 2),
    Uygunluk BIT DEFAULT 1 -- 1 bo?, 0 dolu
);

CREATE TABLE Misafirler (
    MisafirID INT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50),
    Eposta VARCHAR(100),
    Telefon VARCHAR(20)
);

CREATE TABLE Rezervasyonlar (
    RezervasyonID INT PRIMARY KEY,
    MisafirID INT,
    OdaID INT,
    GirisTarihi DATE,
    CikisTarihi DATE,
    FOREIGN KEY (MisafirID) REFERENCES Misafirler(MisafirID),
    FOREIGN KEY (OdaID) REFERENCES Odalar(OdaID)
);

-- Tablolar? olu?turuyorum, veri ekliyorum
DECLARE @Counter INT = 0;
DECLARE @OdaSayisi INT = 100; -- Olu?turulacak oda say?s?
DECLARE @MisafirSayisi INT = 500; -- Olu?turulacak misafir say?s?
DECLARE @MaxRezervasyonFarki INT = 30; -- Giri? ve ç?k?? aras?ndaki maksimum gün say?s?

-- Odalar tablosuna veri ekliyorum
WHILE @Counter < @OdaSayisi
BEGIN
    INSERT INTO Odalar (OdaID, OdaNumarasi, OdaTuru, Ucret)
    VALUES (@Counter + 1, 'Oda ' + CAST(@Counter + 1 AS VARCHAR), 'Oda Türü ' + CAST((@Counter % 5) + 1 AS VARCHAR), ROUND(RAND() * 200 + 100, 2));
    SET @Counter = @Counter + 1;
END;

-- Misafirler tablosuna veri ekliyorum
SET @Counter = 0;

WHILE @Counter < @MisafirSayisi
BEGIN
    INSERT INTO Misafirler (MisafirID, Ad, Soyad, Eposta, Telefon)
    VALUES (@Counter + 1, 'Misafir Ad? ' + CAST(@Counter + 1 AS VARCHAR), 'Misafir Soyad? ' + CAST(@Counter + 1 AS VARCHAR), 'email' + CAST(@Counter + 1 AS VARCHAR) + '@gmail.com', '555-' + CAST(@Counter + 1 AS VARCHAR));
    SET @Counter = @Counter + 1;
END;

-- Rezervasyonlar tablosuna veri ekliyorum
SET @Counter = 0;
DECLARE @GirisTarihi DATE;
DECLARE @CikisTarihi DATE;

WHILE @Counter < @MisafirSayisi
BEGIN
    SET @GirisTarihi = DATEADD(DAY, -CAST(ROUND(RAND() * @MaxRezervasyonFarki, 0) AS INT), GETDATE());
    SET @CikisTarihi = DATEADD(DAY, -CAST(ROUND(RAND() * @MaxRezervasyonFarki, 0) AS INT), @GirisTarihi);

    INSERT INTO Rezervasyonlar (RezervasyonID, MisafirID, OdaID, GirisTarihi, CikisTarihi)
    VALUES (@Counter + 1, ROUND(RAND() * @MisafirSayisi, 0) + 1, ROUND(RAND() * @OdaSayisi, 0) + 1, @GirisTarihi, @CikisTarihi);

    SET @Counter = @Counter + 1;
END;
