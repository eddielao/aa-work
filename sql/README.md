# Intro

Database software used is [PostgreSQL](https://www.PostgreSQL.org). The main focus is SQL, Structured Query Language.

## Setup

Go to [PostgreSQL](https://www.PostgreSQL.org) and then to their Downland section. Follow thru the link for macOS. Proceed to download the interactive installer by EnterpriseDB. At then end of the installation, the option to install Stack is not needed. To verify installation, press `command` + `space` and then type `pgAdmin 4` and you should see it there.

Be sure to remember the installation path and the port number for later reference.

## Toy Database

url: [www.superdatascience.com/sql](www.superdatascience.com/sql)

Look under section 3 for the `ConsumerComplaints.csv` file. This database originates from Consumer Financial Protection Bureau which is available to the public.

### Steps to Import CSV into pgAdmin 4

1. Create new database
    * Right click on `Database` and select `Create`
    * Give name
2. Expand created database and then select `Schemas` -> `Tables`.
    * Right click and then select `Query Tool`
3. Paste following `create table` statement into the top right panel.

```sql
CREATE TABLE consumer_complaints (
    date_received varchar,
    product_name varchar,
    sub_product varchar,
    issue varchar,
    sub_issue varchar,
    consumer_complaint_narrative varchar,
    company_public_response varchar,
    company varchar,
    state_name varchar,
    zip_code varchar,
    tags varchar,
    consumer_consent_provided varchar,
    submitted_via varchar,
    date_sent varchar,
    company_response_to_consumer varchar,
    timely_response varchar,
    consumer_disputed varchar,
    complaint_id integer
);
```

4. To execute the query, click on the lighting bolt icon on top or press `F5`.
    * If successful, such message will be output in the `Messages` window
    * Refresh the `Tables` (by right click on it and select `Refresh`) and the table should appear under.

5. In a new `Query Tool` window, run the following command to import the CSV into the newly created table.

```sql
COPY consumer_complaints FROM '/Users/eddie/Documents/projects/aA/sql/ConsumerComplaints.csv' DELIMITER ',' CSV HEADER;
```

A message stating `COPY 65499` will be displayed if successful. The number is the number of rows successfully copied over. To further verify all rows are loaded, you can run another query with the statement `SELECT * FROM consumer_complaints;`. This should return all 65,499 rows in the `Data Output` window. From here on, further discussion are broken down into subtopics listed below.

* [Basic of SQL](./subs/basic.md)
