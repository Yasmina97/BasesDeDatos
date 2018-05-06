--Dada <CIUDAD>, dar pelis que esten relacionadas de alguna forma con esa ciudad

SELECT *	--Todas las producciones con una keyword = CIUDAD
FROM
  (
  SELECT t.IDproduccion
  FROM Tiene as t
  WHERE t.palabra = <CIUDAD>
  ) A

SELECT *	--Todas las producciones con actores cuyo origen = CIUDAD
FROM
  (
  SELECT e.IDproduccion
  FROM Persona as p1 JOIN Empleado as e
  ON p1.IDpersona = e.IDpersona
  WHERE p1.ciudad = <CIUDAD> AND ( e.puesto = "Actor" OR e.puesto = "Actress" )
  ) B

SELECT p2.nombre, p2.año, @CAUSA = "keyword"		--Nombre, año y causa de todos los resultados
FROM A JOIN Produccion as p2
ON A.IDproduccion = p2.IDproduccion
UNION
SELECT p3.nombre, p3.año, @CAUSA = "origenActor"
FROM B JOIN Produccion as p3
ON B.IDproduccion = p3.IDproduccion
