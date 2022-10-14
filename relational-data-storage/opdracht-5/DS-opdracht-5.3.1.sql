CREATE OR REPLACE VIEW Directie AS
SELECT 
	s.id AS ID,
    ct.name AS contact,
    ct.contacttype AS functie,
    dm.name AS department
FROM mhl_contacts AS ct
INNER JOIN mhl_suppliers AS s
ON ct.supplier_ID=s.id
RIGHT JOIN mhl_departments AS dm
ON ct.department=dm.id;

SELECT * FROM Directie


	


