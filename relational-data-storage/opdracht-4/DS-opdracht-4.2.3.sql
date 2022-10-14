SELECT 
	rc.id, 
	IFNULL(rp.name,rc.name) AS hoofdrubriek,
    IF(ISNULL(rp.name), '',rc.name) AS subrubriek
FROM mhl_rubrieken AS rp
RIGHT OUTER JOIN mhl_rubrieken AS rc
ON rc.parent=rp.id
ORDER BY 
	hoofdrubriek,
	subrubriek