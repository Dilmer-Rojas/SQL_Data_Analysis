-- UNIONS

CREATE DATABASE proyecto_tiendas;
USE proyecto_tiendas;

CREATE TABLE ventas_sucursal1(
	VentaID INT,
    Cliente VARCHAR(30),
    Producto VARCHAR(30),
    Monto INT
);

CREATE TABLE ventas_sucursal2(
	VentaID INT,
    Cliente VARCHAR(30),
    Producto VARCHAR(30),
    Monto INT
);

INSERT INTO ventas_sucursal1(VentaID, Cliente, Producto, Monto) VALUES
(101, "Ana", "Laptop", 800),
(102, "Luis", "Telefono", 500);

INSERT INTO ventas_sucursal2(VentaID, Cliente, Producto, Monto) VALUES
(201, "Marta", "Tablet", 300),
(202, "Pedro", "Audifonos", 100);

SELECT VentaID, Cliente, Producto, Monto
FROM ventas_sucursal1
UNION
SELECT VentaID, Cliente, Producto, Monto
FROM ventas_sucursal2;

-- Podemos agregar un campo o columna nueva llamada sucursal y asignarle una sucursal según corresponda
SELECT VentaID, Cliente, Producto, Monto, 'Sucursal 1' AS sucursal
FROM ventas_sucursal1
UNION
SELECT VentaID, Cliente, Producto, Monto, 'Sucursal 2' AS sucursal
FROM ventas_sucursal2;