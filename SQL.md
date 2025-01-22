## DATA DEFINITION LANGUAGE

`CREATE`: Create tiene dos usos, uno es para crear una base de datos y el otro es para crear una tabla en la base de datos.

Por ello podemos hacer uso de:

                   DATABASE + name_db => 'CREA UNA BASE DE DATOS'
                 /
                /
        CREATE
                \
                 \
                   TABLE + name_table => 'CREA UNA TABLA EN UNA DB'

- Ejemplos:

    1. Creando una base de datos denominada `NARUTO`.

        ```sql
        CREATE DATABASE naruto;
        -- Estamos creando una base de datos llamada naruto
        ```
    2. Creando una tabla denominada `PERSONAJES_PRINCIPALES`.

        ```sql
        CREATE TABLE personajes_principales;
        -- Estamos creando una tabla llamada personajes_principales
        ```