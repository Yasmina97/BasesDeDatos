--Aeropuerto con aviones mas modernos

SELECT DISTINCT aeroOrigen, avion	--aeropuertos con sus aviones
FROM VUELO AS A

SELECT *	--cambiar los aviones por su modelo
FROM
  (
  SELECT aeroOrigen, modelo
  FROM A JOIN AVION as av
  ON A.avion = av.matricula
  ) B

SELECT *	--cambiar los modelos por su a�o
FROM
  (
  SELECT aeroOrigen, anyo
  FROM B JOIN MODELO as m
  ON B.modelo = m.id
  ) C

SELECT aeroOrigen, AVG(anyo)	--agrupar los aviones de cada aeropuerto para hacer 
FROM C				--la media y coger el primero (media de a�o mayor)
WHERE rownum = 1
GROUP BY aeroOrigen
ORDER BY AVG(anyo) DESC