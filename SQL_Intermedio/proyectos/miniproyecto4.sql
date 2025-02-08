CREATE DATABASE tienda_online;
USE tienda_online;

CREATE TABLE clientes (
 cliente_id INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(50),
 email VARCHAR(100),
 telefono VARCHAR(15)
);

CREATE TABLE productos (
 producto_id INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(100),
 categoria VARCHAR(50),
 precio DECIMAL(10,2)
);

CREATE TABLE opiniones (
 opinion_id INT PRIMARY KEY AUTO_INCREMENT,
 cliente_id INT,
 producto_id INT,
 review_text TEXT,
 fecha DATE,
 FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
 FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

INSERT INTO clientes (nombre, email, telefono) VALUES
('Ana López', 'ana.lopez@gmail.com', '987654321'),
('Carlos Díaz', 'carlos_diaz@hotmail.com', '915234567'),
('María Pérez', 'maria_perez@yahoo.com', '123456789'), -- Error en longitud
('Luis Gómez', 'luis_gomez@gmail.com', '912345678');
INSERT INTO productos (nombre, categoria, precio) VALUES
('Laptop ASUS', 'Electrónica', 1200.00),
('Celular Samsung', 'Electrónica', 800.00),
('Audífonos Sony', 'Accesorios', 150.00),
('Smartwatch Apple', 'Wearables', 600.00);
INSERT INTO opiniones (cliente_id, producto_id, review_text, fecha) VALUES
(1, 1, 'Excelente producto, pero el envío fue lento.', '2025-01-15'),
(2, 2, 'MALISIMA calidad, no lo recomiendo!!', '2025-01-16'),
(3, 3, 'Buena relación calidad/precio, aunque esperaba más.', '2025-01-17'),
(4, 4, 'Es caro, pero vale la pena cada centavo.', '2025-01-18');


-- TAREA 1: Ver reseñas de comentarios o review_text
SELECT c.nombre, UPPER(o.review_text) AS review_normalice
FROM clientes AS c
INNER JOIN opiniones AS o
	ON c.cliente_id = o.cliente_id;
    

