
CREATE VIEW DoluOdalar AS
SELECT 
    o.OdaNumarasi,
    o.OdaTuru,
    m.Ad + ' ' + m.Soyad AS MisafirAdi,
    r.GirisTarihi,
    r.CikisTarihi
FROM 
    Odalar o
JOIN 
    Rezervasyonlar r ON o.OdaID = r.OdaID
JOIN 
    Misafirler m ON r.MisafirID = m.MisafirID;
GO