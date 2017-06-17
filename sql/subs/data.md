# Intro

In this section, we will be working with a different dataset. They come from the following 2 CSV files.

`ConsoleGames.csv`: list of console games released between 1980 and 2015
`ConsoleDates.csv`: list of console platforms and their info

## Downloads

Go to [Super Data Science](https://www.superdatascience.com/sql/) and download the following 3 files.

1. PostgreSQL Upload Code
2. Console Games Sales
3. Console Dates

## Setup

Run the following statements in the `Query Tool`.

```sql
CREATE TABLE console_games (
    game_rank integer,
    game_name varchar(1200),
    platform varchar(1200),
    game_year integer,
    genre varchar(20),
    publisher varchar(1200),
    na_sales float8,
    eu_sales float8,
    jp_sales float8,
    other_sales float8    
);

COPY console_games FROM '/users/ilyaeremenko/Desktop/ConsoleGames.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE console_dates (
    platform_name char(120),
    first_retail_availability date,
    discontinued date,
    units_sold_mill float8,
    platform_comment varchar(120)    
);

COPY console_dates FROM '/Users/ilyaeremenko/Desktop/ConsoleDates.csv' DELIMITER ',' CSV HEADER;

```

### Add Column to Existing Table

To add a column called `global_sales` into the table `console_games`. We use the `ALTER TABLE` statement. The `float8` is the data type for double precision floating point number.

```sql
ALTER TABLE console_games
ADD COLUMN global_sales float8;
```

### Alter, Set, and Update

To set the values for `global_sales` which equals to the sum of `na_sales`, `eu_sales`, `jp_sales`, and `other_sales`, we use the `UPDATE` statement.

```sql
UPDATE console_games
SET global_sales = na_sales + eu_sales + jp_sales + other_sales;
```

To calculate the percentage of `na_sales` from the `global_sales`, the formula is as follows. Notice that `global_sales` must be greater than zero to avoid division by 0.

```sql
ALTER TABLE console_games ADD COLUMN na_sales_percent float8;

UPDATE console_games SET na_sales_percent = na_sales / global_sales * 100 WHERE global_sales > 0;
```

### Order By

`ORDER BY` simply arrange the table in ascending order of the columns following the statement. Ascending is the default choice if not specified.

```sql
SELECT * FROM console_games ORDER BY game_rank ASC;
```

```sql
SELECT * FROM console_games ORDER BY game_rank DESC;
```

```sql
SELECT * FROM console_games ORDER BY game_name DESC, game_year ASC;
```

### String Functions

* Length(string) returns the number of character in the input string
* Left(string, integer) returns the number of characters in string from left to right
* Reverse(string) reverses the string of characters

### Working with Dates

The following statement creates a temporary column to display the number of days all the consoles have been in existence.

```sql
SELECT platform_name,
  first_retail_availability,
  discontinued,
  units_sold_mill,
  discontinued - first_retail_availability AS days_existed
FROM console_dates
ORDER BY days_existed;
```

#### DATE_PART

In PostgreSQL, to specify a date value, enclose the date in single quotes and precede with the word `date`.

```sql
date '2017-1-1'
```

`DATE_PART(unit, time)` extracts the part of time specified by the input unit. Some of the common options for unit are day, hour, week, and year. The following statement repeats the idea from last statement but, instead of measuring in `days_existed`, this one is `years_existed`.

```sql
SELECT platform_name,
  first_retail_availability,
  discontinued,
  units_sold_mill,
  DATE_PART('year', discontinued) - DATE_PART('year', first_retail_availability)
    AS years_existed
FROM console_dates
ORDER BY years_existed;
```

Please note that this will not work for `month` because it will only calculate the difference between the 2 month units disregarding the years' difference as though both months are in the same year. For example, the following statement will result in 2.

```sql
SELECT DATE_PART('month', date '2017-3-1') - DATE_PART('month', date '2017-1-30')
```

#### AGE

The `AGE` function takes 2 parameters and returns the difference by subtracting the 2nd parameter from the 1st parameter.

### Data Conversion in SQL

#### CAST

The `CAST` converts one data type to another. The following converts `game_year` into type `varchar(4)`.

```sql
SELECT CAST(game_year as varchar(4))
FROM console_games
ORDER BY game_rank;
```

The following code is the short-hand version.

```sql
SELECT game_year::varchar(4)
FROM console_games
ORDER BY game_rank;
```

### NULL

In SQL, `NULL` does not equal to any value including itself (so `NULL` != `NULL`). So use `IS NULL` or `IS NOT NULL` instead of `=` or `!=`.

The following statement finds all rows where `jp_sales IS NULL` and then sets it to equal to the average of other 3 sales values.

```sql
UPDATE console_games
SET jp_sales = ROUND((na_sales + eu_sales + other_sales) / 3)
WHERE jp_sales IS NULL;
```
