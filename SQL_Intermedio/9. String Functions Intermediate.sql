-- ################ --
-- String Functions
-- ################ --

-- LENGTH --
SELECT first_name, LENGTH(first_name) AS longitud
FROM parks_and_recreation.employee_demographics;

SELECT first_name, LENGTH(first_name) AS longitud
FROM parks_and_recreation.employee_demographics
ORDER BY 2; -- Estamos haciendo un ordenamiento de manera ASCENDENTE en la columna 2 es decir en LONGITUD
-- caso de uso: SUPONGAMOS QUE TENEMOS NÚMEROS DE TELÉFONO Y QUEREMOS SABER SI SU LONGITUD ES MAYOR O MENOR A 9 PARA QUE SEAN VÁLIDOS
-- PARA LUEGO HACER UNA CORRECTA LIMPIEZA DE DATOS NO VÁLIDOS, PUES USAMOS LENGTH().

-- ################################################
-- UPPER Y LOWER
-- Caso de uso: Normalizar nombres a mayúsculas o minúsculas para evitar inconsistencias.
-- UPPER() -> Convierte a mayusculas
SELECT first_name, UPPER(first_name) AS mayusculas
FROM parks_and_recreation.employee_demographics;
-- LOWER() -> Convierte a minusculas 
SELECT first_name, LOWER(first_name) AS minusculas
FROM parks_and_recreation.employee_demographics;

-- ################################################
-- TRIM -> Sirve para eliminar espacios en textos tanto a izquierda como a derecha
SELECT TRIM('      	HOLA    	');
-- LTRIM -> Elimina los espacios solo de la izquierda del texto
SELECT LTRIM('          HOLA          ');
-- RTRIM -> Elimina los espacios solo de la derecha del texto
SELECT RTRIM('          HOLA          ');
-- Caso de uso: Eliminar espacios innecesarios en nombres o direcciones.

-- ################################################
-- LEFT -> Toma los 'n' primeros caracteres LEFT(cadena, n)
SELECT first_name, LEFT(first_name, 3) AS n_primeros
FROM employee_demographics;
-- RIGHT -> Toma los 'n' últimos caracteres RIGHT(cadena, n)
SELECT first_name, RIGHT(first_name, 3) AS n_ultimos
FROM employee_demographics;
-- Caso de uso: Extraer códigos de área de números de teléfono o abreviar nombres.

-- ################################################
-- Substring() -> Nos permite extraer una porción de un texto
SELECT first_name, SUBSTRING(birth_date, 1, 4) AS birth_year
FROM employee_demographics -- Extraemos solo el año de cumpleaños para cada empleado
ORDER BY 2 DESC; -- Ordenamos de manera DESCENDENTE -> DE MAYOR A MENOR
-- Caso de uso: Extraer partes específicas de telefonos(código de país) y más.

-- ################################################
-- REPLACE()-> Sustituye o remplaza una parte de una cadena por otra
SELECT first_name, REPLACE(first_name, 'a', 'z') AS a_z
FROM employee_demographics; -- Va a remplazar las 'a' minusculas por una 'z', solo las minusculas.
-- Caso de uso: Corregir datos mal ingresados o estandarizar formatos.

-- ################################################
-- LOCATE() -> Buscar palabra dentro de un texto
SELECT first_name, LOCATE('A', first_name)
FROM employee_demographics; -- Nos dice en qué posición se encuentra la letra A en cada Nombre
-- Caso de uso: Encontrar posiciones de caracteres específicos en un texto.

-- ################################################
-- CONCAT() -> Concatena(une) cadenas de texto
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics; -- Unimos el nombre con el apellido y lo separamos con un espacio.
-- Caso de uso: Unir nombres y apellidos para mostrar nombres completos.

