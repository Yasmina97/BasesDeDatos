--Directores que empezaron como actores/actrices



SELECT *		--Directores y sus peliculas
FROM
  (
  SELECT p1.nombre, e1.IDproduccion

  FROM Empleado as e1 JOIN Persona as p1

  ON e1.IDpersona = p1.IDpersona

  WHERE e1.puesto = "Director"
  ) A




SELECT *		--1ª ocurrencia de director y año (de la primera)
FROM
  (
  SELECT A.nombre, p2.año
  FROM A JOIN Produccion as p2

  ON A.IDproduccion = p2.IDproduccion

  GROUP BY A.nombre
  ) C

SELECT *		--Actores y sus peliculas
FROM
  (

  SELECT p3.nombre, e2.IDproduccion
  FROM Empleado as e2 JOIN Persona as p3

  ON e2.IDpersona = p3.IDpersona

  WHERE e2.puesto = "Actor" OR e2.puesto = "Actress"
  ) B

SELECT *		--1ª ocurrencia de actor y año (de la primera)
FROM
  (

  SELECT B.nombre, p4.año
  FROM B JOIN Produccion as p4

  ON B.IDproduccion = p4.IDproduccion

  GROUP BY B.nombre


  ) D

SELECT C.nombre		--Personas cuyo primer año de direccion es 

FROM C JOIN D		--posterior a su primer año de actor

ON C.nombre = D.nombre

WHERE C.año > D.año