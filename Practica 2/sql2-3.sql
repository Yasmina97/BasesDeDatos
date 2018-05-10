--Directores que empezaron como actores/actrices

SELECT *		--Directores y sus peliculas
FROM
  (
  SELECT p1.idPersona, e1.idProduccion
  FROM Empleado as e1 JOIN Persona as p1
  ON e1.idPersona = p1.idPersona
  WHERE e1.puesto = "Director"
  ) A


SELECT *		--1a ocurrencia de director y anyo (de la primera)
FROM
  (
  SELECT A.idPersona, p2.anyo
  FROM A JOIN Produccion as p2
  ON A.idProduccion = p2.idProduccion
  GROUP BY A.idPersona
  ) C

SELECT *		--Actores y sus peliculas
FROM
  (
  SELECT p3.idPersona, e2.idProduccion
  FROM Empleado as e2 JOIN Persona as p3
  ON e2.idPersona = p3.idPersona
  WHERE e2.puesto = "Actor" OR e2.puesto = "Actress"
  ) B

SELECT *		--1a ocurrencia de actor y anyo (de la primera)
FROM
  (
  SELECT B.idPersona, p4.anyo
  FROM B JOIN Produccion as p4
  ON B.idProduccion = p4.idProduccion
  GROUP BY B.idPersona
  ) D


SELECT *		--Personas cuyo primer anyo de direccion es
FROM			--posterior a su primer anyo de actor
  (
  SELECT C.idPersona
  FROM C JOIN D
  ON C.idPersona = D.idPersona 
  WHERE C.anyo > D.anyo
  ) E


SELECT p5.nombrePersona		--Nombres reales de las personas resultantes
FROM E JOIN Persona as p5
ON p5.idPersona = E.idPersona
