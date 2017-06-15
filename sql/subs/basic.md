# Intro

This section covers some basics of SQL.

## Select Query

 `SELECT` clause specifies what columns or attributes should be in the result table and `FROM` what tables to be used to determine the results.

### Syntax

```sql
SELECT column_name_one, column_name_two, column_name_three
FROM table_name;
```
To select all columns, use the wildcard character `*` in place of the column names.

```sql
SELECT *
FROM table_name;
```
#### Where

The `WHERE` clause is to put the limiting condition to narrow into the database for area of interest.

```sql
SELECT *
FROM table_name
WHERE condition;
```

To filter all complaints to only state of New York, NY.

```sql
SELECT product_name, issue, state_name
FROM consumer_complaints
WHERE state_name = 'NY';
```
### Logical Condition, AND, OR

To find issues in the states of New York or California, `OR` is used to acheive this.

```sql
SELECT company, product_name, issue
FROM consumer_complaints
WHERE state_name = 'CA' OR state_name = 'NY';
```

To find all `Yes` timely response for `Servicemember` tag, `AND` is used.

```sql
SELECT product_name, company, tags, timely_response
FROM consumer_complaints
WHERE tags = 'Servicemember' AND timely_response = 'Yes'
```

### Wildcards % _

To find all credit related products. In other words, any `product_name` containing the word `credit` should be included in the query. The `LOWER` function is used to convert all characters into lower case so we do not need to know if they are upper or lower cases. We could also use `WHERE UPPER(product_name) LIKE '%CREDIT%'`. They make the statement to be case insensitive.

```sql
SELECT company, product_name
FROM consumer_complaints
WHERE LOWER(product_name) LIKE '%credit%';
```
For a single character, the underscore `_` can be used in place of `%`. The following query will return all companies in the zip codes starting 9. One underscore stands for one symbol.

```sql
SELECT company, zip_code
FROM consumer_complaints
WHERE zip_code like '9____'
```

### Comments in SQL

Single line (goes after): `--`
Multiline (goes inbetween the asterisks): `/* */`
