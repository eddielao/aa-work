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
