--Empresa creadora del modelo de avion mas usado

SELECT Count(empresa), empresa	--parejas de avion modelo
FROM Avion JOIN Modelo		--se miran las empresas y se cuentan
ON Avion.modelo = Modelo.id
WHERE rownum = 1
GROUP BY empresa
ORDER BY Count(empresa) DESC