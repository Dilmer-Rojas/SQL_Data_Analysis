-- LIMIT & AS

-- LIMIT
-- Limit se usa para especificar cuantas filas deseamos mostrar
SELECT *
FROM parks_and_recreation.employee_demographics
LIMIT 3;
-- CON ESTO ESTAREMOS MOSTRANDO SOLO LAS CUATRO PRIMERAS FILAS DE LA TABLA 

-- SI CAMBIAMOS EL ORDEN O USAMOS UN GROUP BY CAMBIARÁ LA SALIDA

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name
LIMIT 3;

-- PARÁMETRO ADICIONAL PARA LIMIT
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name
LIMIT 3, 2; -- comenzar en la posición 3 y tomar dos filas y mostrarlas - pero no se usa mucho

-- ALIAS: Se usa para renombrar o cambiar de nombre a una determinada columna (mayormente)
-- TAMBIEN SE USA EN UNIONES - Se verá más adelante
SELECT gender, 
AVG(age) AS promedio_edad, 
MIN(age) AS edad_minima, 
MAX(age) AS edad_maxima, 
COUNT(employee_id) AS cantidad_empleados
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- OTRA FORMA PERO CON EL MISMO RESULTADO
SELECT gender,
AVG(age) promedio_edad,
MIN(age) edad_minima,
MAX(age) edad_maxima,
COUNT(employee_id) cantidad_empleados
FROM parks_and_recreation.employee_demographics
GROUP BY gender;