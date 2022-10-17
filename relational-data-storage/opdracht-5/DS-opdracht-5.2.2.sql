SELECT
	mhl_cities.name AS Stad,
    COUNT(IF(mhl_membertypes.name = 'Gold', 1, NULL)) AS Gold,
    COUNT(IF(mhl_membertypes.name = 'Silver', 1, NULL)) AS Silver,
    COUNT(IF(mhl_membertypes.name = 'Bronze', 1, NULL)) AS Bronze,
    COUNT(IF(mhl_membertypes.name NOT IN ('Gold','Silver','Bronze'), 1, NULL)) AS 'Other'
FROM mhl_suppliers
JOIN mhl_membertypes ON mhl_suppliers.membertype=mhl_membertypes.id
JOIN mhl_cities ON city_ID=mhl_cities.id
GROUP BY city_ID
ORDER BY GOLD DESC, Silver DESC, Bronze DESC, Other DESC
    