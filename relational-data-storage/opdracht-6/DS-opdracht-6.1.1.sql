CREATE VIEW months (id, name) AS 
	SELECT 1, 'Januari'
    UNION SELECT 2, 'Februari'
    UNION SELECT 3, 'Maart'
    UNION SELECT 4, 'April'
    UNION SELECT 5, 'Mei'
    UNION SELECT 6, 'Juni'
    UNION SELECT 7, 'Juli'
    UNION SELECT 8, 'Augustus'
    UNION SELECT 9, 'September'
    UNION SELECT 10, 'Oktober'
    UNION SELECT 11, 'November'
    UNION SELECT 12, 'December';
    
SELECT 
	year AS jaar,
    months.name AS maand,
    totsup AS 'aantal leveranciers',
    tothit AS 'totaal aantal hits'
FROM (
	SELECT 
		year, 
		month, 
        COUNT(supplier_ID) AS totsup, 
        SUM(hitcount) AS tothit
	FROM mhl_hitcount
    GROUP BY year, month
    ORDER BY year, month
) AS totals
JOIN months ON month=months.id
ORDER BY year DESC, months.name ASC
    
    
    