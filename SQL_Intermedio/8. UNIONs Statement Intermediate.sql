-- UNIONs
-- Sirven para unir filas a diferencia de los JOINS que unían columnas
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;

-- Si queremos mantener duplicados usamos UNION ALL
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;