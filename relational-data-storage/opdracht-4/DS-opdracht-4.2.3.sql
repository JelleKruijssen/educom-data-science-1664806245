SELECT s.id, IFNULL(h.name, s.name), s.name FROM mhl_rubrieken AS s
LEFT JOIN mhl_rubrieken AS h
ON s.parent=h.id
