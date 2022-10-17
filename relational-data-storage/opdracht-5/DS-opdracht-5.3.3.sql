SELECT
	s.name,
    IFNULL(d.contact, 'tav de directie') AS contact,
    v.adres,
    v.postcode,
    v.stad
FROM mhl_suppliers AS s
JOIN VERZENDLIJST AS v ON v.id=s.id
LEFT JOIN DIRECTIE AS d ON d.ID=s.id