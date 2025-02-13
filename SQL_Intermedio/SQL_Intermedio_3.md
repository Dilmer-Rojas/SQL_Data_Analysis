# String Functions

- Las funciones de cadena en SQL nos permiten manipular a analizar textos.

### LENGTH(): 
- Sirve para saber la longitud de un texto.`

```sql
SELECT telefono
FROM Clientes
WHERE LENGTH(Telefono) = 9; -- Muestra todos los telefonos donde su longitud es 9
```

### UPPER() Y LOWER():
- `UPPER()`: Se usa para convertir un texto a MAYUSCULAS.
```sql
SELECT UPPER(Nombre)
FROM Clientes; -- Pasa de David => DAVID
```
- `LOWER()`: Se usa para convertir un texto a MINUSCULAS.
```sql
SELECT LOWER(Nombre)
FROM Clientes; -- Pasa de David => david
```

### TRIM(), LTRIM() Y RTRIM():
- `TRIM()`: Elimina espacios que se encuentren a la izquierda y derecha del texto.
```sql
SELECT TRIM('   David   ') -- Pasa de '   David   ' -> 'David'
```
- `LTRIM()`: Elimina espacios de la izquierda del texto.
```sql
SELECT LTRIM('   David   ') -- Pasa de '   David   ' -> 'David   '
```
- `RTRIM()`: Elimina espacios de la derecha del texto.
```sql
SELECT RTRIM('   David   ') -- Pasa de '    David   ' -> '   David'
```

### SUBSTRING():
- Se usa para extraer una porción del texto.
```sql
SELECT SUBSTRING('Hola Mundo', 1, 4) -- 'Hola' ->  H=1, o=2, l=3 y a=4 
```
```sql
SELECT SUBSTRING(telefono, 1, 3) -- +51983000664 -> Extrae +51
FROM Clientes -- Si tenemos que extraer un código de país como el +51
```

### LEFT() Y RIGHT():
- `LEFT(texto, n)`: Toma los n primeros caracteres del texto.
```sql
SELECT LEFT(telefono, 3) -- Extrae +51 
FROM Clientes;
```
- `RIGHT(texto, n)`: Toma los n últimos caracteres del texto.
```sql
SELECT RIGHT(telefono, 3) -- Extrae de +51983000664 -> 664
```

### REPLACE():
- Reemplaza una palabra con otra.
```sql
SELECT REPLACE(Nombre, 'David', 'Dilmer') AS cambio
FROM Clientes; -- Cambia el nombre David Por Dilmer de la tabla clientes.
```

### CONCAT():
- Sirve para unir textos.

```sql
SELECT CONCAT(Nombre, ' ', Apellido) AS full_name
FROM Clientes; -- Unir apellido y nombre en un solo texto separado por un espacio.
```

### LOCATE():
- Sirve para buscar una palabra o caracter dentro de un texto.
```sql
SELECT LOCATE(Nombre, 'Ana')
FROM Clientes; -- Busca Ana dentro de los nombres de clientes.
```