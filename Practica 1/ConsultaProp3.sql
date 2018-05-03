--Equipos que han conseguido mas de tres goles de media por partido en cada temporada

CREATE VIEW medlocal AS SELECT AnyoJornada, EquipoLocal AS equipo, AVG(GolesLocal) AS media FROM
Partido GROUP BY AnyoJornada, EquipoLocal;

CREATE VIEW medvisit AS SELECT AnyoJornada, EquipoVisitante AS equipo, AVG(GolesVisitante) AS media FROM
Partido GROUP BY AnyoJornada, EquipoVisitante;

CREATE VIEW medtotal AS SELECT medlocal.AnyoJornada AS anyo, medlocal.equipo AS equipo, (medlocal.media+medvisit.media)/2 AS media
FROM medlocal, medvisit WHERE 
medlocal.equipo=medvisit.equipo AND medlocal.AnyoJornada=medvisit.AnyoJornada;

SELECT anyo, equipo, media FROM medtotal WHERE media >= 3 ORDER BY anyo;

DROP VIEW medlocal;
DROP VIEW medvisit;
DROP VIEW medtotal;