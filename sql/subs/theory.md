## Structured VS Unstructured Data

Advantages of structured data:
  * Data consistency
  * More information from the same data
  * Improved data integrity
  * Improved security
  * Improved maintenance

Per Wikipedia, unstructured data refers to information that either does not have a pre-defined data model or is not organized in a pre-defined manner. Audio and video are examples of unstructured data.

## Elements of a Database

### Tables

The following elements are what a table is made of. Many of them have more than one name.

* Table, also known as relation
* Attributes, also known as columns
* Tuples, also known as rows
* Cardinality represents the number of rows
* Degree represents the number of columns
* Domain refers to the range of data
* Primary key uniquely identifies each row
* Foreign key is a column that references the primary key in another table

## Relational Keys

__Superkey__ is any combination of columns that uniquely identifies a row in a table.

__Candidate key__ is a superkey such that no proper subset is a superkey and has the following two properties.
  * Uniqueness
  * Irreducibility

__Primary key__ is the candidate key that is selected to identify tuples uniquely within the relation. If a relation has several candidate keys only one is chosen to be the primary key.

__Foreign key__ is an attribute or set of attributes within one relation that matches the candidate key of some other relation.

## Relational Database

Per Wikipedia, relational database is a digital database whose organization is based on the relational model of data. It has to satisfy the following integrities.

  1. Entity Integrity (primary key is unique and does not match the primary key of any other row in the table)
  2. Domain Integrity (all data items in a column fall within a defined set of valid values)
  3. Referential Integrity (A value in one table references an existing value in another table)
  4. User-defined Integrity (also called business integrity which defines business rules, regulations, policies, and procedures)

## Functional Dependency

Per Wikipedia, a functional dependency is a constraint between two sets of attributes in a relation from a database. In other words, functional dependency is a constraint that describes the relationship between attributes in a relation.
