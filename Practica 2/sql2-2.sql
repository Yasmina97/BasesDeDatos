--Muestra las 3 personas con mas cargos en una peli/serie

SELECT *		--Todas las personas con todas las producciones en las que han estado
FROM			--y la cuenta de empleos que han tenido en cada par
  (
  SELECT p.idPersona, p.nombrePersona, e.idProduccion, SUM(e.puesto) as total
  FROM Empleado as e JOIN Persona as p
  ON e.idPersona = p.idPersona
  GROUP BY p.idPersona, p.nombrePersona, e.idProduccion
  ) A


SELECT *		--Coge la primera ocurrencia de tres personas de la lista
FROM			--ordenada por numero de empleos en una misma produccion
  (
  SELECT DISTINCT p.idPersona, A.nombrePersona, A.idProduccion, A.total
  FROM A
  ORDER BY A.total DESC
  WHERE rownum <= 3
  ) B

SELECT B.nombrePersona, p2.nombre, B.total		--Coge solo el nombre real, nombre de la peli y 
FROM B JOIN Produccion as p2			--numero de cargos del resultado final
ON B.idProduccion = p2.idProduccion
