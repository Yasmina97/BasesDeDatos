--Porcentaje de vuelos de cada compañía que despegan y aterrizan en el mismo estado.

SELECT *
FROM
  (
  SELECT v1.id, v1.companyia, ae1.estado    --vuelos y origen
  FROM VUELO as v1 JOIN AEROPUERTO as ae1
  ON v1.aeroOrigen = ae1.iata
  ) A

SELECT *
FROM
  (
  SELECT v2.id, v2.companyia, ae2.estado    --vuelos y destino
  FROM VUELO as v2 JOIN AEROPUERTO as ae2
  ON v2.aeroDestino = ae2.iata
  ) B

SELECT *
FROM
  (
  SELECT A.companyia    --apariciones (vuelos) de compañias con mismo estado origen y destino
  FROM A JOIN B
  ON A.id = B.id
  WHERE A.estado = B.estado
  ) C

SELECT *
FROM
  (
  SELECT companyia, COUNT(companyia) as vu1  --Compañias y numero de vuelos en mismo estado
  FROM C
  GROUP BY companyia
  ) D

SELECT *
FROM
  (
  SELECT companyia, COUNT(companyia) as vu2  --Compañias y total de vuelos
  FROM VUELO
  GROUP BY companyia
  ) E

SELECT *
FROM
  (
  SELECT D.companyia, D.vu1, E.vu2  --Juntar compañia con ambas respectivas cantidades de vuelos
  FROM D JOIN E
  ON D.companyia = E.companyia
  ) F

SELECT companyia, vu1*100.0/vu2     --Compañias y respectivo porcentaje de vuelos en mismo estado
FROM F
