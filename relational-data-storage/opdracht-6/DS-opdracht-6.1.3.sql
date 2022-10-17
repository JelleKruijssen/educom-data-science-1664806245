CREATE OR REPLACE VIEW Rubrieken  AS 
	SELECT
		IFNUll(sr.id, hr.id) AS id,
        IF(ISNULL(hr.name), sr.name, CONCAT(hr.name, ' - ', sr.name) ) AS rubriek,
        IFNULL(hr.name, sr.name) AS hoofdrubriek,
        IF(ISNULL(hr.name), ' ', sr.name) AS subrubriek
	FROM 
		mhl_rubrieken hr
    RIGHT OUTER JOIN 
		mhl_rubrieken sr ON sr.parent = hr.id
    ORDER BY 
		rubriek;
	
SELECT 
	rubrieken.rubriek,
    (SELECT COUNT(mhl_suppliers_ID)
    FROM mhl_suppliers_mhl_rubriek_view
    WHERE mhl_rubriek_view_ID=rubrieken.id
    ) AS numsup
FROM rubrieken
ORDER BY rubriek
	