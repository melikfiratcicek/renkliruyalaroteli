
CREATE TABLE Odalar (
    OdaID INT PRIMARY KEY,
    OdaNumarasi VARCHAR(10),
    OdaTuru VARCHAR(50),
    Ucret DECIMAL(10, 2),
    Uygunluk BIT DEFAULT 1 -- 1 if available, 0 if occupied
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