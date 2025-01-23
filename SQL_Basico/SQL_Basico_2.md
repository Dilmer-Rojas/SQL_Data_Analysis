## DATA MANIPULATION LANGUAGE (DML)

Es un subconjunto de comandos para manipular la base de datos.

Los comandos que comprende son:

- `SELECT`, `FROM`, `WHERE`, `JOINs`, `GROUP BY`, `ORDER BY`, `HAVING`, `INSERT`, `UPDATE` y `DELETE`.

### SELECT:
Con este comando se utiliza para recuperar datos de una o más tablas junto con `FROM`.

Ejemplo:

<img src="./src/tabla1.png">

- Queremos recuperar los datos de la tabla `CITY`.

```sql
SELECT *
FROM CITY;
-- Lo que estamos haciendo es recuperar todos los datos de la tabla.
```


### INSERT: 
Con este comando podemos insertar datos dentro de una tabla, no es un comando DDL pero vamos a verlo.

Para hacerlo hacemos uso de:
```sql
INSERT INTO personajes VALUES
(1, "Naruto"),
(2, "Sasuke"),
(3, "Itachi");
```