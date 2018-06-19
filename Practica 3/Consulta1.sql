-- Compa�ias que han operado al menos 1000 vuelos cada d�a.

SELECT v.compa�ia
FROM vuelo as v
GROUP BY v.fecha, v.compa�ia
HAVING count(*) >= 1000

-- Compa��as a�reas con su media de retrasos de salida y de llegada,
-- ordenados por retraso de salida, siempre que hayan operado al menos
-- 1000 vuelos cada d�a.

SELECT v.compa�ia, avg(i.retraso) as media
FROM vuelo as v join incidencia as i on v.id=i.vueloAfectado
WHERE v.compa�ia IN (
	SELECT v.compa�ia
	FROM vuelo as v
	GROUP BY v.fecha, v.compa�ia
	HAVING count(*) >= 1000
)
GROUP BY v.compa�ia
ODER BY media