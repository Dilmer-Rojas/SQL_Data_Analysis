-- INNER JOIN

SELECT *
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id;
    
-- Ahora con ALIAS
-- En algunos casos encontramos algo como: SELECT c.name -> c HACE REFERENCIA A LA TABLA clientes y name es el campo a seleccionar

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- LEFT OUTER JOIN: Nos devuelve todas las filas de la tabla izquierda  o primera tabla y las filas que coinciden en la 
-- tabla derecha o segunda tabla y si no hay coincidencias las columnas de la segunda tabla devolverán NULL.
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


-- RIGHT OUTER JOIN: Nos devuelve todas las filas de la tabla derecha o segunda tabla y las filas coincidentes en la primera tabla
-- o tabla izquierda y si no hay coincidencias las columnas de la primer tabla serán NULL.
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- JOIN MULTIPLE TABLES: Aquí vamos a hacer JOINs de tres tablas
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id
;


