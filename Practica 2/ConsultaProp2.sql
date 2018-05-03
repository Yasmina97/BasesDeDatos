--Compositores con más de 50 bandas sonoras
--Seleccionamos los compositores
CREATE VIEW compositor AS SELECT idPersona, idProduccion FROM Empleado WHERE rol = 'composer';
--Calculamos cuantas cada uno
CREATE VIEW cuenta AS SELECT idPersona, COUNT(*) AS tot FROM compositor GROUP BY idPersona;
--queremos nombre
CREATE VIEW nombre AS SELECT Persona.nombrePersona, cuenta.idPersona, cuenta.tot FROM cuenta, Persona WHERE Persona.idPersona = cuenta.idPersona;

SELECT nombrePersona, tot FROM nombre WHERE tot > 50 ORDER BY tot;

DROP VIEW compositor;
DROP VIEW cuenta;
DROP VIEW nombre;