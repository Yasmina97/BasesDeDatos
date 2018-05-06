--Muestra las 3 personas con mas cargos en una peli/serie

SELECT *		--Todas las personas con todas las producciones en las que han estado
FROM			--y la cuenta de empleos que han tenido en cada par
  (
  SELECT p.nombre, e.IDproduccion, SUM(e.puesto) as total
  FROM Empleado as e JOIN Persona as p
  ON e.IDpersona = p.IDpersona
  GROUP BY p.nombre, e.IDproduccion
  ) A


SELECT DISTINCT A.nombre, A.IDproduccion, A.total	--Coge la primera ocurrencia de tres personas de la lista
FROM A							--ordenada por numero de empleos en una misma produccion
ORDER BY A.total DESC
WHERE rownum <= 3