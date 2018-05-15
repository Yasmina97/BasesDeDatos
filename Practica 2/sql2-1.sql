--Dada <CIUDAD>, dar pelis que esten relacionadas de alguna forma con esa ciudad

DECLARE @CAUSA varchar(60)

SELECT *	--Todas las producciones con una keyword = <CIUDAD>
FROM
  (
  SELECT t.idProduccion
  FROM Tiene as t
  WHERE t.palabra = <CIUDAD>
  ) A

SELECT *	--Todas las producciones con actores cuyo origen = <CIUDAD>
FROM
  (
  SELECT e.idProduccion
  FROM Persona as p1 JOIN Empleado as e
  ON p1.idPersona = e.idPersona
  WHERE p1.ciudad = <CIUDAD> AND ( e.puesto = "Actor" OR e.puesto = "Actress" )
  ) B

SELECT *	--Todas las producciones cuyo titulo contiene <CIUDAD>
FROM
  (
  SELECT idProduccion
  FROM Produccion
  WHERE nombre LIKE '%<CIUDAD>%'
  ) C

SELECT p2.nombre, p2.anyo, @CAUSA = "keyword"		--Nombre, anyo y causa de todos los resultados
FROM A JOIN Produccion as p2
ON A.idProduccion = p2.idProduccion
UNION
SELECT p3.nombre, p3.anyo, @CAUSA = "origenActor"
FROM B JOIN Produccion as p3
ON B.idProduccion = p3.idProduccion
UNION
SELECT p4.nombre, p4.anyo, @CAUSA = "titulo"
FROM C JOIN Produccion as p4
ON C.idProduccion = p4.idProduccion
