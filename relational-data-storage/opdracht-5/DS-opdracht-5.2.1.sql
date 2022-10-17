SELECT 
	L.name AS leverancier, 
	IFNULL(C.name,'tav de directie') AS aanhef, 
	IF(p_address<>'', p_address, CONCAT(straat, ' ', huisnr)) AS adres,
    IF(p_address<>'',p_postcode, postcode) AS postcode,
    IF(p_address<>'',S.name, V.name) AS stad,
    IF(p_address<>'',P.name, VP.name) AS provincie
FROM mhl_suppliers AS L
LEFT JOIN mhl_contacts AS C ON L.id=C.supplier_ID AND C.department=3
LEFT JOIN mhl_cities AS S ON S.id=L.city_ID
LEFT JOIN mhl_communes AS G ON G.id=S.commune_ID
LEFT JOIN mhl_districts AS P ON P.id=G.district_ID
LEFT JOIN mhl_cities AS V ON V.id=L.city_ID
LEFT JOIN mhl_communes AS VG ON VG.id=V.commune_ID
LEFT JOIN mhl_districts AS VP ON VP.id=VG.district_ID
WHERE postcode <> ''
ORDER BY 
	provincie,
    stad,
    leverancier




