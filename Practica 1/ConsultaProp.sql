--Equipo que marca mas goles en cada temporada

CREATE VIEW loc AS SELECT AnyoJornada, EquipoLocal AS equipo, COUNT(GolesLocal) AS total FROM
Partido GROUP BY AnyoJornada, EquipoLocal;

CREATE VIEW vis AS SELECT AnyoJornada, EquipoVisitante AS equipo, COUNT(GolesVisitante) AS total FROM
Partido GROUP BY AnyoJornada, EquipoVisitante;

CREATE VIEW tot AS SELECT loc.AnyoJornada AS anyo, loc.equipo AS equipo, loc.total+vis.total AS total FROM loc, vis WHERE 
loc.equipo=vis.equipo AND loc.AnyoJornada=vis.AnyoJornada;

CREATE VIEW maxim AS SELECT anyo , MAX(total) AS total FROM tot GROUP BY anyo;

SELECT maxim.anyo, maxim.total, tot.equipo FROM tot, maxim WHERE maxim.anyo = tot.anyo AND maxim.total = tot.total ORDER BY anyo;

DROP VIEW loc;
DROP VIEW vis;
DROP VIEW tot;
DROP VIEW maxim;
