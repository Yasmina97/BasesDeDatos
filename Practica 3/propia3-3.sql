--Media de retrasos por modelo de avion

SELECT AVG(retraso) as media, avion	--coger todos los aviones con retrasos y hacer media
FROM Incidencia JOIN Vuelo
ON Incidencia.vueloAfectado = Vuelo.id
WHERE Incidencia.tipo = "retraso"
GROUP BY avion

SELECT AVG(media), modelo	--cambiar los aviones por su modelo y hacer media de todos
FROM A JOIN Avion
ON A.avion = Avion.matricula
GROUP BY modelo