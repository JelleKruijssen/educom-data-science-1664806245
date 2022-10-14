SELECT 
	s.name AS bedrijf,
    pt.name AS prop,
    CASE 
		WHEN pt.is_filter = 'N' THEN 'NOT YET'
        ELSE 'Y'
	END AS value
FROM mhl_propertytypes AS pt
INNER JOIN mhl_yn_properties AS yp
ON pt.id=yp.propertytype_ID
RIGHT JOIN mhl_suppliers AS s
ON yp.supplier_ID=s.id




