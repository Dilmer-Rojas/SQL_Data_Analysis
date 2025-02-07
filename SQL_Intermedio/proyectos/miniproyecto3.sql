CREATE DATABASE practica_string_functions;
USE practica_string_functions;

CREATE TABLE Clientes(
	id_cliente INT,
    nombre VARCHAR(30),
    telefono VARCHAR(30)
);

INSERT INTO Clientes(id_cliente, nombre, telefono) VALUES
(1, "Pedro", "987654321"),
(2, "Marcos", "978563711"),
(3, "Julia", "92335678"),
(4, "María", "999556");

-- LENGTH 
SELECT nombre, LENGTH(nombre) AS longitud
FROM Clientes;

-- Hacemos un ordenamiento en la columna longitud de manera ASCENDENTE
SELECT nombre, LENGTH(nombre) AS longitud
FROM Clientes
ORDER BY 2;

SELECT nombre, LENGTH(nombre) AS longitud
FROM Clientes
ORDER BY longitud;

-- Vamos a eliminar los números de teléfono no válidos, es decir que tengan menos de nueve o más de nueve caracteres
-- SET SQL_SAFE_UPDATES = 0; -> Desactivar modo seguro
DELETE FROM Clientes WHERE LENGTH(telefono) > 9 OR LENGTH(telefono) < 9;
-- SET SQL_SAFE_UPDATES = 1; -> Activar modo seguro

SELECT telefono
FROM Clientes;


