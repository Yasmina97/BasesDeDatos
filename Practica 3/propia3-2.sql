--Estados con mas y menos llegadas

SELECT *	--numero de vuelos que llegan a cada estado
FROM
  (
  SELECT Count(estado), estado
  FROM VUELO JOIN AEROPUERTO
  ON VUELO.aeroDestino = AEROPUERTO.iata
  GROUP BY estado
  ) A

SELECT Count(estado), estado	--coger el que mas y menos
FROM A
WHERE rownum = 1
ORDER BY Count(estado) DESC
UNION
SELECT Count(estado), estado
FROM A
WHERE rownum = 1
ORDER BY Count(estado) ASC