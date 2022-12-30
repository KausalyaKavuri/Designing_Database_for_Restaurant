# Designing_Database_for_Restaurant
Designing a Database for Restaurants for tracking business and analyzing it.


## Creating table Queries:

#### Table Menu:

``` SQL 
CREATE TABLE menu (
id int NOT NULL,
name varchar(100) NOT NULL,
classification varchar(200),
price int NOT NULL,
description varchar(500),
PRIMARY KEY(id)
);

```
