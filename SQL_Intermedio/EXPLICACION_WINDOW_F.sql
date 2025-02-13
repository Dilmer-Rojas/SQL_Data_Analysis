-- ###################### --
--    Window Functions    --
-- ###################### --
-- Son funciones avanzadas que permiten realizar cálculos sobre un subconjunto de filas relacionadas con la fila actual.
/*Estructura:
window_function() OVER (PARTITION BY Columna ORDER BY Columna)
DONDE:
	- window_function() -> Es cualquier window function (ROW_NUMBER(), RANK(), DENSE_RANK(), SUM(), AVG(), ETC)
    - OVER() -> Define como se aplicará la función 
    - PARTITION BY(OPCIONAL) -> Divide las filas en grupos lógicos
    - ORDER BY(OPCIONAL) -> Ordena las filas dentro de cada grupo
*/
-- FUNCIONES DE RANKING(Ordenan y Enumeran Filas)
-- ROW_NUMBER() -> Asigna un número de fila único
-- RANK() ->  Asinga un ranking y salta números cuando hay empates
-- DENSE_RANK() -> Asigna un ranking y no salta números cuando hay empates

 -- EJEMPLO: Ranking de empleados por salario
 SELECT Nombre, Salario,
	ROW_NUMBER() OVER (ORDER BY Salario DESC) AS num_fila,
    RANK() OVER (ORDER BY Salario DESC) AS ranking,
    DENSE_RANK() OVER (ORDER BY Salario DESC) AS dense_rank_ejemplo
FROM Empleados;

-- FUNCIONES DE AGREGACIÓN CON WINDOWS (Cálculo Acumulado)
-- SUM() -> Calcula el acumulado de valores
-- AVG() -> Obtiene el promedio
-- MIN()/MAX() -> Encuentra el mínimo o máximo

-- Ejemplo: Salario total por departamento
SELECT Nombre, Departamento, Salario,
	SUM(Salario) OVER (PARTITION BY departamento) AS salario_total_por_departamento -- Calcula el salario total y lo parte por Departamento
FROM Empleados; -- Estamos mostrando los nombres de los empleados, su departamento, su salario y el salario total por departamento

-- Ejercicio1: Encuentra el ranking de pedidos por cliente

SELECT ClienteID, COUNT(Producto) AS total_productos_pedidos,
	RANK() OVER (ORDER BY COUNT(Producto) DESC) AS ranking
FROM Pedidos
GROUP BY ClienteID;