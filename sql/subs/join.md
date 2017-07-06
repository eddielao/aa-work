# Intro

This section is all about the different types of joins used in SQL. Joins are the essence of relational database in the sense that they are how different tables can be combined logically and programmatically.

## Types of Joins

###### Table A

Customer | Gender | Age
---------|--------|-----
Adam     | male   | 24
Benjamin | male   | 32
Jack     | male   | 29
Nick     | male   | 37
Susan    | female | 31

###### Table B

Employee |  Title  | Wage
---------|---------|------
Jack     | Clerk   | 17 $/hr
John     | Clerk   | 19 $/hr
Mary     | Mgr     | 21 $/hr
Susan    | Mgr     | 19 $/hr

### Inner Join

```sql
ON A.Customer = B.Employee
```
