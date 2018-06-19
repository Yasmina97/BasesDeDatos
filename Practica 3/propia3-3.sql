--Media de retrasos por modelo de avion

SELECT AVG(retraso) as media, avion	--coger todos los aviones con retrasos y hacer media
FROM INCIDENCIA JOIN VUELO
ON INCIDENCIA.vueloAfectado = VUELO.id
WHERE INCIDENCIA.tipo = "retraso"
GROUP BY avion

SELECT AVG(media), modelo	--cambiar los aviones por su modelo y hacer media de todos
FROM A JOIN AVION
ON A.avion = AVION.matricula
GROUP BY modelo