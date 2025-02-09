DESCRIBE sales_data_sample; -- SIRVE PARA DESCRIBIR LOS DATOS DE MI TABLA

SELECT *
FROM sales_data_sample
LIMIT 10; -- SIRVE PARA MOSTRAR SOLO LAS 8 PRIMERAS FILAS DE DATOS DE LA TABLA

SELECT *
FROM sales_data_sample; -- SIRVE PARA MOSTRAR TODOS LOS DATOS DE LA TABLA

SELECT SUM(sales) AS total_sales
FROM sales_data_sample;

SELECT orderdate,
country,
quantityordered * priceeach AS totalrevenue
FROM sales_data_sample;

SELECT 
quantityordered * priceeach AS totalrevenue
FROM sales_data_sample
ORDER BY totalrevenue DESC;

SELECT sales,
quantityordered * priceeach AS totalrevenue
FROM sales_data_sample
WHERE quantityordered * priceeach > 6000;

SELECT country,
SUM(sales) AS sales_usa
FROM sales_data_sample
WHERE country = 'USA';

SELECT sales,
	quantityordered * priceeach AS totalrevenue
FROM sales_data_sample
ORDER BY sales DESC
LIMIT 5;

SELECT sales,
	year_id
FROM sales_data_sample
ORDER BY year_id DESC
LIMIT 10;

/*
SELECT country, territory
FROM sales_data_sample
GROUP BY country; 
-- En este caso va a dar error porque falta agregar territory al group by
*/

SELECT country, SUM(sales) AS sales_country
FROM sales_data_sample
GROUP BY country;

SELECT country,
	SUM(quantityordered * priceeach) AS totalrevenue -- Estamos sumando todos los ingresos totales 
    -- relacionados a un solo país para que no haya duplicados
FROM sales_data_sample
GROUP BY country;

SELECT country,
	SUM(quantityordered * priceeach) AS totalrevenue
FROM sales_data_sample
GROUP BY country
HAVING totalrevenue > 500000;

SELECT COUNT(DISTINCT productcode) AS total_productos_vendidos
FROM sales_data_sample;

