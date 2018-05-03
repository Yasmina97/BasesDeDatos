--Actores que han aparecido en más de 7 series
--Tabla de series
CREATE VIEW serie AS SELECT idProduccion FROM Produccion WHERE tipo = 'tv series';
--tabla de actores
CREATE VIEW actor AS SELECT idPersona, idProduccion FROM Empleado WHERE rol = 'actor' OR rol = 'actress';
--join
CREATE VIEW join1 AS SELECT actor.idPersona, serie.idProduccion FROM serie, actor WHERE serie.idProduccion = actor.idProduccion;
--contamos el numero de series por actor
CREATE VIEW cuenta AS SELECT idPersona, count(*) AS tot FROM join1 GROUP BY idPersona;
--Nos quedamos con los casos >1
CREATE VIEW m1 AS SELECT idPersona, tot FROM cuenta WHERE tot > 7;
--obtenemos nombre de la idPersona
SELECT m1.idPersona, Persona.nombrePersona, m1.tot FROM m1, Persona WHERE m1.idPersona = Persona.idPersona ORDER BY tot;

DROP VIEW serie; 
DROP VIEW actor; 
DROP VIEW join1; 
DROP VIEW cuenta; 
DROP VIEW m1;