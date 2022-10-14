SELECT 
	s.name, 
	IFNULL(cp.name,'tav de directie') AS aanhef, 
	IF(ISNULL(s.straat + huisnr), '', p_postcode) AS adres, 
    postcode, 
    c.name 
FROM mhl_suppliers AS s
INNER JOIN mhl_cities AS c
ON s.city_ID=c.id
INNER JOIN mhl_communes AS g
ON c.commune_ID=g.id
INNER JOIN mhl_districts	AS p
ON g.district_ID=p.id
INNER JOIN mhl_contacts AS cp
ON s.id=cp.supplier_ID




