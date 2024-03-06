SELECT rogzitette, SZALLAS_NEV, cim
FROM szallashely
WHERE HELY LIKE '%Balaton%' AND MONTH(ROGZ_IDO) = '3'
ORDER BY CSILLAGOK_SZAMA DESC

SELECT f.szoba_FK, count(*)
FROM szoba sz JOIN foglalas f ON sz.szoba_ID = f.szoba_FK
WHERE f.felnott_szam > gyermek_szam
GROUP BY f.szoba_FK
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) ASC

SELECT CASE WHEN YEAR(v.szul_dat) >= '1985' THEN 'fiatal' 
	            WHEN YEAR(v.szul_dat) < '1970' THEN 'idős' 
				ELSE 'középkorú'
			END AS 'Kategória', COUNT(*) AS 'Foglalás száma'
FROM vendeg v JOIN foglalas f ON v.usernev = f.ugyfel_fk
WHERE f.felnott_szam + f.gyermek_szam >= 2
GROUP BY CASE WHEN YEAR(v.szul_dat) >= '1985' THEN 'fiatal' 
	            WHEN YEAR(v.szul_dat) < '1970' THEN 'idős' 
				ELSE 'középkorú'
			END
