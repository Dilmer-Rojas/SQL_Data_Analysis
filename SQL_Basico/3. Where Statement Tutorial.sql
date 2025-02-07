-- WHERE clause

-- FILTRAR LOS REGISTROS DONDE first_name SEA IGUAL A 'Leslie'
SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie';

-- FILTRAR LOS REGISTROS DONDE salary SEA MAYOR A 50K 
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary > 50000;

-- FILTRAR LOS REGISTROS DONDE salary SEA MENOR A 50K
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary < 50000;

-- FILTRAR LOS REGISTROS DONDE salary SEA MAYOR O IGUAL A 50K
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

-- FILTRAR LOS REGISTROS DONDE salary SEA MENOR O IGUAL A 50K
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000;

-- CAMBIAMOS DE TABLA employee_salary A employee_demographics

-- FILTRAR LOS REGISTROS DONDE gender(género) SEA IGUAL A 'Female'(Femenino) 
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = 'Female';

-- FILTRAR LOS REGISTROS DONDE gender(género) NO SEA IGUAL A 'Female'(Femenino) -- NOS MUESTRA TODOS LOS REGISTROS DONDE EL género es MASCULINO-MALE
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender != 'Female';

-- FILTRAR LOS REGISTROS DONDE birth_date ES MAYOR a '1986-07-27'
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1986-07-27';

-- OPERADORES LÓGICOS
-- AND, OR, NOT --

-- AND: FILTRAR LOS REGISTROS DONDE birth_date ES MAYOR a '1986-07-27' AND(Y) gender(Género) es Male(Masculino)
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1986-07-27'
AND gender = 'Male';

-- OR: AND: FILTRAR LOS REGISTROS DONDE birth_date ES MAYOR a '1986-07-27' OR(O) gender(Género) es Male(Masculino)
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1986-07-27'
OR gender = 'Male';

-- LIKE STATEMENT
-- COMODINES: % y _

-- %: Queremos filtrar los registros donde el first_name empiece por T y luego continue por cualquier cosa
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'T%';

-- _: Queremos filtrar los registros donde el first_name empiece por A y luego continue con un número determinado de caracteres
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a__'; -- POR EJEMPLO EN ESTE CASO NOS MOSTRARÁ Ann PORQUE TIENE A PARTE DE LA A DOS CARACTERES MÁS DOS '_'

-- FILTRAR LOS REGISTROS DONDE birth_date EMPIECE POR 1986
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1986%';

-- FILTRAR LOS REGISTROS DONDE first_name CONTENGA UNA 'a'
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%a%';