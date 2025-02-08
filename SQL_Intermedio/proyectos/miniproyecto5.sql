
CREATE DATABASE eval_empleados;
USE eval_empleados;

CREATE TABLE Empleados(
	EmpleadoID INT,
    Nombre VARCHAR(30),
    Departamento VARCHAR(30),
    Calificacion INT
);

INSERT INTO Empleados(EmpleadoID, Nombre, Departamento, Calificacion) VALUES
(1, "Ana", "Ventas", 85),
(2, "Luis", "IT", 78),
(3, "Marta", "Finanzas", 55),
(4, "Pedro", "Recursos Humanos", 92),
(5, "Sofía", "IT", 60);


SELECT nombre, departamento, calificacion,
	CASE
		WHEN calificacion > 80 THEN "Excelente"
		WHEN calificacion BETWEEN 60 AND 80 THEN "Bueno"
		ELSE "Regular"
	END AS Desempeño
FROM Empleados;

SELECT nombre, departamento,
	CASE
		WHEN departamento = "IT" THEN "Tecnología"
        ELSE "Otros"
	END AS clase_departamento
FROM Empleados;

ALTER TABLE Empleados
	ADD edad INT;

SET SQL_SAFE_UPDATES = 0;
UPDATE Empleados
SET edad = CASE
	WHEN EmpleadoID= 1 THEN 25
    WHEN EmpleadoID=2 THEN 55
    WHEN EmpleadoID=3 THEN 33
    WHEN EmpleadoID=4 THEN 44
    WHEN EmpleadoID=5 THEN 50
END
WHERE EmpleadoID IN (1,2,3,4,5);
SET SQL_SAFE_UPDATES = 1;

SELECT *
FROM Empleados;

SELECT nombre, departamento, edad,
	CASE
		WHEN edad > 30 THEN "Adulto"
        WHEN edad BETWEEN 20 AND 30 THEN "Joven"
        ELSE "Otro"
	END AS Categoria
FROM Empleados;