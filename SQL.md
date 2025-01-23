## DATA DEFINITION LANGUAGE

### CREATE: 
Create tiene dos usos, uno es para crear una base de datos y el otro es para crear una tabla en la base de datos.

Por ello podemos hacer uso de:

                   DATABASE + name_db => 'CREA UNA BASE DE DATOS'
                 /
                /
        CREATE
                \
                 \
                   TABLE + name_table => 'CREA UNA TABLA EN UNA DB'

- Ejemplos:

    1. Creando una base de datos denominada `NARUTO_DB`.

        ```sql
        CREATE DATABASE naruto_db;
        -- Estamos creando una base de datos llamada naruto
        ```
    2. Creando una tabla denominada `PERSONAJES_PRINCIPALES`.

        ```sql
        CREATE TABLE personajes(
            id_personaje INT NOT NULL,
            nombre VARCHAR(50),
            PRIMARY KEY (id_personaje)
        );
        -- Estamos creando una tabla llamada personajes_principales
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


### ALTER:
Este si es un comando DDL y sirve para alterar o agregar uno o más campos a una tabla.

- Ejemplo:

    1. Queremos alterar la tabla personajes y agregar un campo denominado `clan`.
    
    ```sql
    ALTER TABLE personajes
        ADD clan VARCHAR(40);
    -- Lo que estamos haciendo es agregar un nuevo campo o columna a la tabla denominada 'clan'
    ```

    2. Queremos alterar la tabla personajes y agregar campos como `aldea` y `jutsu`

    ```sql
    ALTER TABLE personajes
        ADD aldea VARCHAR(40),
        ADD jutsu VARCHAR(40);
    ```


### DROP:
Este comando DDL se usa para eliminar permanentemente una tabla completa.

Para eliminar la tabla `personajes` hacemos uso de:

```sql
DROP TABLE personajes;
-- Con esto vamos a eliminar la tabla por completo
```

### TRUNCATE:
Con este comando DDL lo que hacemos es eliminar solo los datos de una tabla mas no los campos.

En el ejemplo de la tabla personajes hasta antes de hacer el `DROP` tenemos los campos `id_personaje`, `nombre`, `aldea`, `jutsu`, `clan`.

Si hacemos uso de:

```sql
TRUNCATE TABLE personajes;
-- Lo que hará es eliminar solo los datos o registros
-- Pero menos:
-- `id_personaje`, `nombre`, `aldea`, `jutsu`, `clan` 
-- que son las columnas o campos.
```