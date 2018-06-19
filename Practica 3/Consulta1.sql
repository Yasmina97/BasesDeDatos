-- Compañias que han operado al menos 1000 vuelos cada día.

SELECT v.companyia
FROM vuelo as v
GROUP BY v.fecha, v.companyia
HAVING count(*) >= 1000

-- Compañías aéreas con su media de retrasos de salida y de llegada,
-- ordenados por retraso de salida, siempre que hayan operado al menos
-- 1000 vuelos cada día.

SELECT v.companyia, avg(i.retraso) as media
FROM vuelo as v join incidencia as i on v.id=i.vueloAfectado
WHERE v.companyia IN (
	SELECT v.companyia
	FROM vuelo as v
	GROUP BY v.fecha, v.companyia
	HAVING count(*) >= 1000
)
GROUP BY v.companyia
ODER BY media
