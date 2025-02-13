-- ################# --
-- Window Functions --
-- ################# --

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender; -- Nos muestra el salario promedio para cada género

-- Ahora con funciones de ventana o WINDOW FUNCTIONS
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id; -- Estamos calculando el salario promedio para cada género y particionandolo para cada persona
    
SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id; -- Estamos agregando una columna rolling_total que contene el primer salario + rolling_total

SELECT dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id; -- Aquí estamos agregando un número de fila a cada fila pero particionandola por género.
    
SELECT dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id; -- Lo que estamos haciendo es agregando un número de fila y tambien el rango de cada uno de los salarios
										  --  Como hay dos 50000 el 5 se repite en la columna rank_num.
										  -- A la otra fila ya no va a ser 6 sino su número posicional en este caso 7 ya que el 6 está ocupado por 5
                                          -- Que es el duplicado.
		