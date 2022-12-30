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

#### Table Stakeholders:

``` SQL
CREATE TABLE stakeholders 
(
id int NOT NULL,
phone_number varchar(100) NOT NULL,
name varchar(200) NOT NULL,
dob date,
schedule varchar(100),
designation varchar(500) NOT NULL,
PRIMARY KEY(id)
CONSTRAINT fk_iid_stakeholders FOREIGN KEY(item id) REFERENCES inventory(item id)
CONSTRAINT fk_sid_stakeholders FOREIGN KEY(schedule id) REFERENCES schedule(schedule id)
);

```

#### Table Inventory:

``` SQL
CREATE TABLE inventory (
itemid int NOT NULL,
quantity int NOT NULL,
itemname varchar(100),
PRIMARY KEY(itemid) 
);

```
#### Table Schedule:

``` SQL
CREATE TABLE schedule (
schedule_id int NOT NULL,
starttime TIMESTAMP NOT NULL,
endtime TIMESTAMP NOT NULL,
staffid int NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_sid_schedule FOREIGN KEY(staffid) REFERENCES stakeholders(id)
);

```
#### Table Order:

``` SQL
CREATE TABLE orders (
id int NOT NULL,
customerid int NOT NULL,
quantity int,
type varchar(100) NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_cid_order FOREIGN KEY(customerid) REFERENCES customer(id)
);

```
#### Table Customer:

``` SQL
CREATE TABLE customer (
id int NOT NULL,
name varchar(100) NOT NULL,
dob date,
phonenumber varchar(12),
email varchar(100) NOT NULL,
password varchar(20),
PRIMARY KEY(id) 
);

```
#### Table Payment:

``` SQL
CREATE TABLE payment 
(
id int NOT NULL,
orderid int NOT NULL,
payment_method varchar(100) NOT NULL,
gratuities int,
carddetails varchar(100),
PRIMARY KEY(id),
CONSTRAINT fk_oid_payment FOREIGN KEY(orderid) REFERENCES orders(id)
);

```
#### Table Seat_Tables:

``` SQL
CREATE TABLE tables_booked (
id int NOT NULL,
customerid int NOT NULL,
seating int NOT NULL,
name varchar(100) NOT NULL,
times TIMESTAMP NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_cid_tables FOREIGN KEY(customerid) REFERENCES customer(id)
);

```


## The data required in this application was provided to us by Professor and the SQL Queries and analysis after the data awas inserted is as follows:

### SQL Queries & Analysis:

#### Query  1: Return the name, email, phone number, date of birth for the most first customer.

``` SQL
select name, email, phonenumber, dob from customer where id in (select min(id) from customer)

```

#### Query  2: Return the various roles of restaurant Stakeholders’ in the database.

``` SQL
select distinct (designation) from stakeholders

```

#### Query  3: Return the item along with it’s quantity in the inventory.

``` SQL
select itemname, quantity
from inventory
group by itemname, quantity
order by quantity

```

#### Query  4: Return Customer contact details who has the highest payment in the restaurant to give coupon.

``` SQL
select gratuities, phonenumber, email, name
from customer c, orders r, payment p
where c.id = r.customerid and p.orderid = r.id and gratuities = (select max(gratuities) from payment)

```

#### Query  5: Return Customer and stakeholders’ born in the month of May.

``` SQL
select dob, name  from customer where dob like '%MAY%'
UNION 
select dob,name from stakeholders where dob like '%MAY%'

select dob from stakeholders where dob like '%MAY%'

```

#### Query  6: Return the table which has been booked more than 5 times.

``` SQL
select name, count(*) as number_times_booked 
from seat_table
group by name
having count (*) > 5

```
