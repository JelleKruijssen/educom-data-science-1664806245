SELECT mhl_cities.name, commune_ID FROM mhl_cities 
LEFT JOIN mhl_communes ON mhl_cities.commune_ID=mhl_communes.id
WHERE mhl_cities.commune_ID IS NOT NULL
AND mhl_communes.id IS NULL