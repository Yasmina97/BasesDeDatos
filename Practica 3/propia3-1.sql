--Empresa creadora del modelo de avion mas usado

SELECT Count(empresa), empresa	--parejas de avion modelo
FROM AVION JOIN MODELO		--se miran las empresas y se cuentan
ON AVION.modelo = MODELO.id
WHERE rownum = 1
GROUP BY empresa
ORDER BY Count(empresa) DESC