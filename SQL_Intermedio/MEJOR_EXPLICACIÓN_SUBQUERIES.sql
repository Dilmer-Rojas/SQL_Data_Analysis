USE mini_proyecto;


-- Vamos a mostrar los empleados donde su salario sea mayor al promedio
-- 1ra Consulta
SELECT AVG(salario) AS salario_promedio FROM Empleados;
-- 2da Consulta
SELECT Nombre, Salario
FROM Empleados
WHERE Salario > salario_promedio; -- Esto va a dar un error

-- Con una Subquery
SELECT Nombre, Salario
FROM Empleados
WHERE Salario > (SELECT AVG(Salario) AS salario_promedio FROM Empleados);
-- En la subconsulta calculamos el salario promedio de la tabla empleados
-- Luego en la consulta principal seleccionamos el nombre y salario de la tabla empleados donde el salario es > al salario promedio

-- ################################################################ --
-- SUBQUERIES EN SELECT, FROM Y WHERE
-- ################################################################ --

-- EN SELECT: Usamos en select para filtrar o calcular valores
-- EJEMPLO: Queremos comparar el precio de cada pedido con su precio promedio
SELECT Producto, Precio,
	(SELECT AVG(Precio) FROM Pedidos) AS Precio_Promedio -- Calcula El Precio_Promedio de todos los precio
    -- Es decir precio_promedio = (800 + 500 + 300 + 100) / 4
							--  = 1700 / 4
                            --  = 425
FROM Pedidos; -- Como está en el SELECT, lo muestra por cada fila de cada producto

-- ################################################################ --

-- EN FROM: Se usa en from como una tabla temporal
-- Ejemplo: Filtrar todos los clientes con un gasto promedio mayor a 500
SELECT *
FROM (SELECT ClienteID, AVG(Precio) AS gasto_promedio 
	FROM Pedidos GROUP BY ClienteID) AS subconsulta -- La subconsulta calcula el promedio para cada fila es decir:
    -- Para ClienteID = 1 -> Como hizo dos pedidos entonces = (800 + 300) / 2 => 1100 / 2 = 550, 800 y 300 son los precios de los productos
    -- Para ClienteID = 2 -> Como hizo un pedido entonces = 500 EL PROMEDIO ES 500
    -- Para ClienteID = 3 -> No hay pedido
    -- Para ClienteID = 4 -> Como hizo un pedido entonces = 100 EL PROMEDIO ES 100
    -- ClienteID -> 1 = gasto_promedio = 550
    -- ClienteID -> 2 = gasto promedio = 500
    -- ClienteID -> 3 = NULL O CERO
    -- ClienteID -> 4 = gasto_promedio = 100
WHERE gasto_promedio > 500; -- Ahora muestra el ClienteID donde su gasto_promedio > 500 -> Por eso muestra el CLienteID 1 = 550

-- ################################################################ --

-- EN WHERE: Para filtrar resultados
-- ✅ IN → Para comparar un valor con una lista de valores -> Es como decir 'ESTÁ EN'
-- ✅ NOT IN → Para excluir valores de la lista. -> 'NO ESTÁ EN'
-- ✅ Útil cuando la subquery devuelve varias filas.
-- Ejemplo: Encontrar los clientes que han hecho pedidos
SELECT ClienteID, Nombre
FROM Clientes
WHERE ClienteID IN (SELECT ClienteID FROM Pedidos);
-- 1ro -> La subconsulta nos muestra todos los ClienteID -> 1, 2, 1, 4
-- 2do -> La consulta principal selecciona ClienteID y el Nombre, de la tabla Clientes
-- WHERE ClienteID IN Subconsulta -> Es decir "DONDE CLIENTEID 'ESTÁ EN' LA SUBCONSULTA Y EN LA TABLA CLIENTES"
-- POR ESO NOS MUESTRA A ANA Y LUIS YA QUE EL CLIENTEID 3 NO HA HECHO PEDIDOS Y EL CLIENTEID 4 NO TIENE UN CLIENTE EN LA TABLA CLIENTES

-- Ejemplo: Encontrar los clientes que no han hecho pedidos
SELECT ClienteID, Nombre
FROM Clientes
WHERE ClienteID NOT IN (SELECT ClienteID FROM Pedidos); -- NOS MUESTRA A MARTA YA QUE NO ESTÁ EN LA TABLA PEDIDOS ES DECIR NO HA HECHO PEDIDOS

-- ################################################################ --