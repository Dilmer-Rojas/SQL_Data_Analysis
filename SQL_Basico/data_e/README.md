# APUNTES SQL

- El siguiente código da error:

```sql
SELECT sales,
quantityordered * priceeach AS totalrevenue
FROM sales_data_sample
WHERE totalrevenue = 3200;
```
por que totalrevenue es un alias y no se puede usar con WHERE.

```sql
SELECT sales,
quantityordered * priceeach AS totalrevenue
FROM sales_data_sample
WHERE quantityordered * priceeach > 6000;
```

```sql
SELECT orderdate, sales
FROM sales_data_sample
WHERE STR_TO_DATE(orderdate, '%m-%d-%Y %H:%i:%s') > '2004-01-01';
```