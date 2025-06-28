# 📊 README – Guía de Uso de SQL para Analistas de Datos

**Autor:** \[Tu Nombre]

**Fecha:** \[Actualiza la fecha]

**Propósito:** Servir como guía y plantilla de referencia para proyectos de análisis de datos usando SQL.



## 📌 Tabla de Contenidos

1. [Introducción](#introducción)
2. [Estructura de Proyecto Sugerida](#estructura-de-proyecto-sugerida)
3. [Conexión y Configuración](#conexión-y-configuración)
4. [Nomenclatura y Organización de Consultas](#nomenclatura-y-organización-de-consultas)
5. [Buenas Prácticas de SQL](#buenas-prácticas-de-sql)
6. [Plantillas de Consultas Comunes](#plantillas-de-consultas-comunes)
7. [Documentación de Consultas](#documentación-de-consultas)
8. [Validación y Revisión de Resultados](#validación-y-revisión-de-resultados)
9. [Formato de Entrega de Resultados](#formato-de-entrega-de-resultados)
10. [Recursos Adicionales](#recursos-adicionales)

<br>

## 🟣 Introducción

Este README sirve como guía integral para aplicar **SQL** en el trabajo diario como analista de datos. Incluye:

* Convenciones de nomenclatura.
* Organización de scripts y consultas.
* Plantillas para consultas frecuentes.
* Buenas prácticas para legibilidad, mantenimiento y validación de resultados.

Está diseñado para ser **adaptable a diferentes DBMS** (MySQL, PostgreSQL, SQL Server, SQLite, Oracle).

<br>

## 🟣 Estructura de Proyecto Sugerida

Organiza tu proyecto en carpetas y archivos claramente definidos. Ejemplo:

```
/sql-project/
│
├── README.md
├── 01-data-exploration/
│   ├── describe_tables.sql
│   └── sample_data.sql
├── 02-data-cleaning/
│   ├── remove_duplicates.sql
│   └── handle_nulls.sql
├── 03-analysis/
│   ├── sales_summary.sql
│   ├── customer_segmentation.sql
│   └── trend_analysis.sql
└── 04-exports/
    ├── sales_summary.csv
    └── customer_segments.xlsx
```

✅ Consejo: Mantén una **convención consistente** en los nombres de carpetas y archivos.

✅ Consejo: Usa **prefijos numerados** para reflejar el flujo de trabajo.

<br>

## 🟣 Conexión y Configuración

Antes de ejecutar consultas:

1️⃣ Verifica credenciales de acceso a la base de datos.
2️⃣ Conoce el DBMS (MySQL, PostgreSQL, etc.).
3️⃣ Configura cliente o IDE (DBeaver, DataGrip, Azure Data Studio, psql, mysql-cli).

Ejemplo de conexión en CLI:

```bash
mysql -u username -p -h hostname -P port database_name
```

O en PostgreSQL:

```bash
psql -U username -h hostname -d database_name
```

✅ Usa variables de entorno o archivos `.env` para credenciales sensibles.

<br>

## 🟣 Nomenclatura y Organización de Consultas

* **Tablas:** snake\_case singular o plural según convención del equipo (ej. `orders`, `customer_details`).
* **Alias:** claros y cortos (ej. `c` para customers).
* **Archivos SQL:** descriptivos y consistentes (`sales_summary.sql`).
* **Comentarios:** siempre documenta lógica compleja.

Ejemplo de comentario:

```sql
-- Selecciona el top 10 de clientes por monto total de compras en el último año
```

<br>

## 🟣 Buenas Prácticas de SQL

✅ Usa **SELECT específico** en lugar de `SELECT *`.
✅ Formatea consultas para legibilidad:

```sql
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_sales
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
WHERE
    o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY
    c.customer_id, c.customer_name
ORDER BY
    total_sales DESC
LIMIT 10;
```

✅ Usa **CTE** (Common Table Expressions) para consultas complejas:

```sql
WITH sales_per_customer AS (
    SELECT
        customer_id,
        SUM(order_amount) AS total_sales
    FROM
        orders
    GROUP BY
        customer_id
)
SELECT
    c.customer_name,
    s.total_sales
FROM
    customers c
JOIN
    sales_per_customer s ON c.customer_id = s.customer_id
ORDER BY
    s.total_sales DESC;
```

✅ Indica siempre filtros y joins explícitos.

✅ Usa transacciones en actualizaciones o eliminaciones:

```sql
START TRANSACTION;
DELETE FROM customers WHERE customer_id = 123;
COMMIT;
```

✅ Evita subconsultas innecesarias.

<br>

## 🟣 Plantillas de Consultas Comunes

✅ **Explorar estructura de tablas**:

```sql
-- MySQL
DESCRIBE table_name;

-- PostgreSQL
\d table_name;
```

✅ **Contar registros**:

```sql
SELECT COUNT(*) FROM table_name;
```

✅ **Ver muestras**:

```sql
SELECT * FROM table_name LIMIT 10;
```

✅ **Agrupación y estadísticas**:

```sql
SELECT
    category,
    COUNT(*) AS num_items,
    AVG(price) AS avg_price
FROM
    products
GROUP BY
    category;
```

✅ **Detección de valores nulos**:

```sql
SELECT
    COUNT(*) AS null_count
FROM
    customers
WHERE
    email IS NULL;
```

✅ **Remover duplicados (con clave primaria o criterio único)**:

```sql
DELETE FROM table_name
WHERE id NOT IN (
    SELECT MIN(id)
    FROM table_name
    GROUP BY field1, field2
);
```

✅ **Crear vistas**:

```sql
CREATE VIEW customer_sales_summary AS
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_sales
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.customer_name;
```

<br>

## 🟣 Documentación de Consultas

Cada archivo SQL debe tener encabezado con:

```sql
/*
File: sales_summary.sql
Author: [Tu Nombre]
Date: [Fecha]
Description:
    Genera un resumen de ventas por cliente para el período 2024.
Usage:
    Ejecutar en base de datos 'sales_db'.
Dependencies:
    - customers
    - orders
*/
```

✅ Esto facilita mantenimiento y colaboración.

<br>

## 🟣 Validación y Revisión de Resultados

Antes de compartir resultados:

1️⃣ Verifica números clave contra fuentes originales.
2️⃣ Revisa outliers y datos nulos.
3️⃣ Usa consultas de validación:

```sql
SELECT COUNT(DISTINCT customer_id) FROM customers;
```

4️⃣ Exporta resultados para validación externa (CSV, Excel).
5️⃣ Documenta supuestos o filtros aplicados.

<br>

## 🟣 Formato de Entrega de Resultados

✅ Exporte resultados con formato claro (CSV, XLSX, JSON).
✅ Incluye diccionario de datos si es necesario.
✅ Adjunta SQL usado para reproducibilidad.
✅ Para informes escritos, incluye:

* Resumen ejecutivo.
* Detalle metodológico.
* Hallazgos clave.
* Visualizaciones si aplica.

<br>

## 🟣 Recursos Adicionales

* [SQL Style Guide by Simon Holywell](https://www.sqlstyle.guide/)
* [Mode SQL Tutorial](https://mode.com/sql-tutorial/)
* [PostgreSQL Documentation](https://www.postgresql.org/docs/)
* [MySQL Documentation](https://dev.mysql.com/doc/)

---

## 🟣 Licencia

Este README es de uso personal o interno. Puedes adaptarlo libremente a tu equipo o empresa.

<br>

# 📌 Notas Finales

✅ Actualiza este README para cada nuevo proyecto.
✅ Usa el mismo estilo para tus notas y documentación.
✅ Facilita la colaboración y el mantenimiento.


