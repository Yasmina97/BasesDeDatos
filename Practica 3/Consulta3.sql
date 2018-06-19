--Porcentaje de vuelos de cada compañía que despegan y aterrizan en el mismo estado

CREATE VIEW mismoEstado AS SELECT COUNT(ae.estado) FROM Aeropuerto AS ae JOIN Vuelo AS v WHERE
(ae.aeroOrigen, ae.estado)==(ae.aeroDestino, ae.estado)  --mira los vuelo sque tengan el mismo estado en los aeropuertos origen y destino

CREATE VIEW total AS SELECT COUNT(ae.estado) FROM Aeropuerto AS ae --mira los vuelos totales

SELECT mismoEstado*100/total FROM Aeropuerto, Vuelo