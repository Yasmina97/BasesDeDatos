--Directores que han dirigido tres o más peliculas el mismo año con año y ordenados de más a menos (y numero de pelis)
--Seleccionamos solo las peliculas
CREATE VIEW peli AS SELECT idProduccion, nombre, anyo FROM Produccion WHERE tipo = 'movie';
--Seleccionamos los Directores
CREATE VIEW director AS SELECT idPersona, idProduccion FROM Empleado WHERE rol = 'director';
--Hacemos un join multiple para quedarnos con el nombre del director, el nombre de la peli y el año
CREATE VIEW join1 AS SELECT Persona.nombrePersona, peli.nombre, peli.anyo FROM peli, director, Persona WHERE peli.idProduccion = director.idProduccion 
AND director.idPersona = Persona.idPersona;
--contamos cuantas pelis ha dirigido cada uno por año 
CREATE VIEW cuenta AS SELECT nombrePersona, anyo, COUNT(*) AS tot FROM join1 GROUP BY nombrePersona, anyo;
--nos quedamos con los que sean >3
CREATE VIEW tres AS SELECT nombrePersona, anyo, tot FROM cuenta WHERE tot >= 3;

SELECT tres.nombrePersona, join1.nombre, tres.anyo, tres.tot FROM join1, tres WHERE join1.nombrePersona = tres.nombrePersona AND join1.anyo = tres.anyo ORDER BY tot DESC;

DROP VIEW peli;
DROP VIEW director;
DROP VIEW join1;
DROP VIEW cuenta;
DROP VIEW tres;