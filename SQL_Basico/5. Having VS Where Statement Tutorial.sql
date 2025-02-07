SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- Intentemos filtrar la edad promedio usando WHERE
SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
WHERE AVG(age) > 40
GROUP BY gender;
-- ESTO NO FUNCIONA YA QUE EN EL BACKEND WHERE VA ANTES DE GROUP BY, por lo tanto no se pueden filtrar datos que todavía no se han agrupado

-- FORMA CORRECTA CON HAVING
SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

--#############--
-- IMPORTANTE --
--#############--
--- WHERE: SE UTILIZA PARA FILTRAR REGISTROS ANTES DE REALIZAR CUALQUIER AGRUPACIÓN O AGREGACIÓN 
-- OPERA SOBRE FILAS INDIVIDUALES Y APLICA CONDICIONES A LOS DATOS SIN PROCESAR
-- SELECT column1, column2
-- FROM table_name
-- WHERE condition;
--- HAVING: SE UTILIZA PARA FILTRAR REGISTROS DESPUES DE QUE LOS DATOS SE HAYAN AGRUPADO O AGREGADO
-- SELECT column1, aggregate_function(column2)
-- FROM table_name
-- GROUP BY column1
-- HAVING condition;