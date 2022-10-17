SELECT 
	a.gemeente,
    b.leverancier,
    b.total_hitcount,
    a.average_hitcount
FROM (
	SELECT g.id, l.name AS leverancier, SUM(hitcount) AS total_hitcount
    FROM mhl_suppliers AS l
    INNER JOIN mhl_cities s ON l.city_ID=s.id
    INNER JOIN mhl_communes g ON s.commune_ID=g.id
    INNER JOIN mhl_districts d ON g.district_ID=d.id
    INNER JOIN mhl_hitcount h ON h.supplier_ID=l.id
    WHERE d.country_ID = (
		SELECT id
        FROM mhl_countries
        WHERE name='Nederland')
        GROUP BY g.id, l.name
	)AS b
INNER JOIN (
	SELECT g.id, AVG(hitcount) AS average_hitcount, g.name AS gemeente
    FROM mhl_hitcount h
    INNER JOIN mhl_suppliers l ON h.supplier_ID=l.id
    INNER JOIN mhl_cities s ON l.city_ID=s.id
    INNER JOIN mhl_communes g ON s.commune_ID=g.id
    INNER JOIN mhl_districts d ON g.district_ID=d.id
    WHERE d.country_ID = (
		SELECT id
        FROM mhl_countries
        WHERE name ='Nederland' 
	)
    GROUP BY g.id
    ) AS a ON a.id=b.id
GROUP BY a.id, b.leverancier
HAVING b.total_hitcount > a.average_hitcount
ORDER BY a.gemeente, (b.total_hitcount-a.average_hitcount) DESC
		