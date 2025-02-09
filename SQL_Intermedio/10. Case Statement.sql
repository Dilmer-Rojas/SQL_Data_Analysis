-- ############## --
-- CASE STATEMENT --
-- ############## --

SELECT first_name, last_name, age,
	CASE
		WHEN age < 30 THEN "Joven"
		WHEN age BETWEEN 30 AND 50 THEN "Viejo"
		ELSE "Otro"
	END AS category
FROM employee_demographics;

SELECT  
    CASE  
        WHEN gender = 'Male' THEN 'Hombres'  
        WHEN gender = 'Female' THEN 'Mujeres'  
    END AS Category,  
    COUNT(*) AS total  
FROM employee_demographics  
GROUP BY Category;

-- Aumento de sueldo
-- Si salario es menor a 50000 aumentar un 7 %
-- Si salario es mayor que 50000 aumentar un 5%
-- Si pertenece al departamento de finanzas entonces agregar un bonus del 10%

SELECT *
FROM employee_salary;

SELECT first_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.07)
	WHEN salary >= 50000 THEN salary + (salary * 0.05)
END AS new_salary,
CASE
	WHEN dept_id= 6 THEN salary * 0.10
END AS Bonus,
(
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.07)
	WHEN salary >= 50000 THEN salary + (salary * 0.05)
END +
CASE
	WHEN dept_id= 6 THEN salary * 0.10
END
) AS total
FROM employee_salary;