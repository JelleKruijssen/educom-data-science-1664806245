SELECT c1.name, c1.id, c2.id,g1.id, g2.id, g1.name, g2.name FROM mhl_cities AS c1
INNER JOIN mhl_cities AS c2 ON c1.id<>c2.id
INNER JOIN mhl_communes AS g1 ON c1.commune_ID=g1.id
INNER JOIN mhl_communes AS g2 ON c2.commune_ID=g2.id
WHERE c1.name=c2.name AND (c1.id<>c2.id AND c1.id<c2.id) 
ORDER BY c1.name
