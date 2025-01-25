SELECT *
FROM parks_and_recreation.employee_demographics; /* ESTA ES UNA BUENA PRÁCTICA YA QUE ESTAMOS SELECCIONANDO LA DB TAMBIEN*/

SELECT first_name, 
last_name, 
birth_date,
age,
age + 10
FROM parks_and_recreation.employee_demographics;
# PEMDAS: Quiere decir que SQL si respeta la jeranquía de signos


SELECT gender
FROM parks_and_recreation.employee_demographics;


SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;