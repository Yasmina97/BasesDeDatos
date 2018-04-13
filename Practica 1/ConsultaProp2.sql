--Equipos que han obtenido el mismo numero de goles como locales y visitantes por temporada

CREATE VIEW loc AS SELECT AnyoJornada, EquipoLocal AS equipo, COUNT(GolesLocal) AS total FROM
Partido GROUP BY AnyoJornada, EquipoLocal;

CREATE VIEW vis AS SELECT AnyoJornada, EquipoVisitante AS equipo, COUNT(GolesVisitante) AS total FROM
Partido GROUP BY AnyoJornada, EquipoVisitante;

SELECT loc.AnyoJornada, loc.equipo FROM loc, vis WHERE loc.equipo=vis.equipo AND loc.AnyoJornada=vis.AnyoJornada AND loc.total = vis.total;

DROP VIEW loc;
DROP VIEW vis;


