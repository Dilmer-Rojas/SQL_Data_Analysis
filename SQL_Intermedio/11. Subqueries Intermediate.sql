-- ########## --
-- SUBQUERIES --
-- ########## --

SELECT * -- Seleccionamos todos los datos  
FROM employee_demographics -- De la tabla employee_demographics  
WHERE employee_id IN ( -- Filtramos solo los empleados cuyo ID esté en  
    SELECT employee_id -- Seleccionamos el ID del empleado  
    FROM employee_salary -- De la tabla employee_salary  
    WHERE dept_id = 1 -- Donde el departamento sea Parks and Recreation  
); 
/*
1. Seleccionamos todos los empleados de employee_demographics.
2. Filtramos aquellos cuyo employee_id esté en la subconsulta.
3. La subconsulta selecciona employee_id de employee_salary donde dept_id = 1 (Parks and Recreation).
*/

SELECT AVG(max_age)
FROM
(SELECT gender,
AVG(age) AS avg_age,
MAX(age) AS max_age,
MIN(age) AS min_age,
COUNT(age)
FROM employee_demographics
GROUP BY gender
) AS Agg_table;

SELECT AVG(max_age)  
FROM
(SELECT gender,  
    AVG(age) AS avg_age, -- Promedio de edad por género  
    MAX(age) AS max_age, -- Edad máxima por género  
    MIN(age) AS min_age, -- Edad mínima por género  
    COUNT(age) -- Número de empleados por género  
FROM employee_demographics  
GROUP BY gender-- Agrupa por género
) AS Agg_table -- 🔹 Toma la edad máxima (max_age) de cada género y calcula su promedio.

