
# GROUP BY
-- Sirve para agrupar registros con los mismos valores en columnas especificadas y permite ejecutar funciones agregadas
SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender;
-- En este caso estamos agrupando la columna género o gender

-- Si agrupamos una columna diferente nos dará un error
SELECT *
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

# AGRUPAR FILAS POR OCUPACIÓN
SELECT occupation
FROM parks_and_recreation.employee_salary
GROUP BY occupation;

# AGRUPAR FILAS O REGISTROS POR OCUPACIÓN Y SALARIO
SELECT occupation,
salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation, salary;

# QUEREMOS FILTRAR LOS REGISTROS, AGRUPARLOS POR EL GÉNERO Y MOSTRAR EL PROMEDIO DE EDAD DE CADA GÉNERO
SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

# QUEREMOS FILTRAR LOS REGISTROS, AGRUPARLOS POR GÉNERO, MOSTRAR EL PROMEDIO DE EDAD DE CADA GÉNERO AVG(), CUAL ES LA EDAD MÁXIMA MAX(), LA EDAD MINIMA MIN()
# CUANTOS HOMBRES Y MUJERES HAY COUNT()
SELECT gender, 
AVG(age) AS promedio_edad,
MIN(age) AS edad_minima, 
MAX(age) AS edad_maxima, 
COUNT(age) AS cantidad
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- ORDER BY -- Sirve para ordenar las filas ya sea de forma ascendente o descendente

# ORDENAR first_name DE FORMA ASCENDENTE DE A-Z
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name ASC;

# ORDENAR first_name DE FORMA DESCENTENTE Z-A
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name DESC;

# FORMAS DE ORDENAR DATOS CUANTITATIVOS Y CUALITATIVOS -- PRIMERO SE COLOCA EL NOMBRE DE LOS CUANTITATIVOS LUEGO DE LOS CUALITATIVOS ES UNA BUENA PRÁCTICA
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age, gender;
