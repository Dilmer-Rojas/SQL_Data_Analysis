CREATE DATABASE mini_proyecto;
USE mini_proyecto;

CREATE TABLE Clientes(
	ClienteID INT,
    Nombre VARCHAR(30),
    Edad INT(20),
    Pais VARCHAR(30),
    PRIMARY KEY (ClienteID)
);

CREATE TABLE Pedidos(
	PedidoID INT,
    ClienteID INT,
    Producto VARCHAR(30),
    Precio INT,
    Fecha DATE,
    PRIMARY KEY (PedidoID)
    -- FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

INSERT INTO Clientes(ClienteID, Nombre, Edad, Pais) VALUES
(1, "Ana", 28, "Mexico"),
(2, "Luis", 35, "Chile"),
(3, "Marta", 22, "Perú");


INSERT INTO Pedidos(PedidoID, ClienteID, Producto, Precio, Fecha) VALUES
(101, 1, "Laptop", 800, "2025-01-01"),
(102, 2, "Telefono", 500, "2025-01-02"),
(103, 1, "Tablet", 300, "2025-01-03"),
(104, 4, "Audífonos", 100, "2025-01-04");

SELECT *
FROM Clientes;

SELECT *
FROM Pedidos;

SELECT c.nombre,
	p.producto,
	p.precio
FROM Clientes AS c
INNER JOIN Pedidos AS p
	ON c.ClienteID = p.ClienteID;
    
SELECT c.nombre,
	SUM(p.precio) AS gasto_total
FROM Clientes AS c
INNER JOIN Pedidos AS p
	ON c.ClienteID = p.ClienteID
GROUP BY c.nombre; -- Hacemos el uso de GROUP BY para no aplicar la función agregada a toda la tabla.

SELECT c.nombre,
	SUM(p.precio) AS gasto_total
FROM Clientes AS c
LEFT JOIN Pedidos AS p
	ON c.ClienteID = p.ClienteID
GROUP BY c.nombre;