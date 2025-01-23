## DATA MANIPULATION LANGUAGE (DML)

Es un subconjunto de comandos para manipular la base de datos.

Los comandos que comprende son:

- `SELECT`, `FROM`, `WHERE`, `JOINs`, `GROUP BY`, `ORDER BY`, `HAVING`, `INSERT`, `UPDATE` y `DELETE`.

### SELECT + FROM:
Con este comando se utiliza para recuperar datos de una o más tablas junto con `FROM`.

Ejemplo:

<img src="./src/tabla1.png">

- Queremos recuperar los datos de la tabla `CITY`.

```sql
SELECT *
FROM CITY;
-- Lo que estamos haciendo es recuperar todos los datos de la tabla.
```

Es como decir seleccionar  todos los datos de la tabla city.


### WHERE:
Se utiliza para filtrar registros específicos.

Ejemplo:

- Queremos filtrar los datos de la tabla `CITY` donde `POPULATION` sea mayor a 100000.

```sql
SELECT *
FROM CITY
WHERE POPULATION > 100000;
-- Filtrará todos los datos donde la población sea mayor a diez mil.
```

### GROUP BY:
Sirve para agrupar filas que tiene valores comunes en columnas especificadas.






### INSERT: 
Con este comando podemos insertar datos dentro de una tabla, no es un comando DDL pero vamos a verlo.

Para hacerlo hacemos uso de:
```sql
INSERT INTO personajes VALUES
(1, "Naruto"),
(2, "Sasuke"),
(3, "Itachi");
```