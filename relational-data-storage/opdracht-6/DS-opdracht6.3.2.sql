SELECT
	name,
    REPLACE(
		REPLACE (
			REPLACE(
				REPLACE(
					REPLACE(
						REPLACE(
							REPLACE(name, '&acirc;','â'),
                        '&iuml;','ï'),
                    '&egrave;','è'),
                '&euml;','ë'),
            '&eacute;','é'),
		'&ouml;', 'ö'),
	'&Uuml;', 'Ü') AS nicename
FROM mhl_suppliers
WHERE name LIKE '%&%;%' LIMIT 25