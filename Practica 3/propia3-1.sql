--Empresas creadoras del top 3 de modelos de avion mas usados

SELECT Count(empresa), empresa	--parejas de avion modelo
FROM Avion JOIN Modelo		--se miran las empresas y se cuentan
ON Avion.modelo = Modelo.id
WHERE rownum <= 3
GROUP BY empresa
ORDER BY Count(empresa) DESC
