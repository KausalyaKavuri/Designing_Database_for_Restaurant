CREATE TABLE menu (
id int NOT NULL,
name varchar(100) NOT NULL,
classification varchar(200),
price int NOT NULL,
description varchar(500),
PRIMARY KEY(id)
);

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

CREATE TABLE inventory (
itemid int NOT NULL,
quantity int NOT NULL,
itemname varchar(100),
PRIMARY KEY(itemid) 
);

CREATE TABLE schedule (
schedule_id int NOT NULL,
starttime TIMESTAMP NOT NULL,
endtime TIMESTAMP NOT NULL,
staffid int NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_sid_schedule FOREIGN KEY(staffid) REFERENCES stakeholders(id)
);

CREATE TABLE orders (
id int NOT NULL,
customerid int NOT NULL,
quantity int,
type varchar(100) NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_cid_order FOREIGN KEY(customerid) REFERENCES customer(id)
);

CREATE TABLE customer (
id int NOT NULL,
name varchar(100) NOT NULL,
dob date,
phonenumber varchar(12),
email varchar(100) NOT NULL,
password varchar(20),
PRIMARY KEY(id) 
);

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

CREATE TABLE tables_booked (
id int NOT NULL,
customerid int NOT NULL,
seating int NOT NULL,
name varchar(100) NOT NULL,
times TIMESTAMP NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_cid_tables FOREIGN KEY(customerid) REFERENCES customer(id)
);



select name, email, phonenumber, dob from customer where id in (select min(id) from customer)


select distinct (designation) from stakeholders


select itemname, quantity
from inventory
group by itemname, quantity
order by quantity


select gratuities, phonenumber, email, name
from customer c, orders r, payment p
where c.id = r.customerid and p.orderid = r.id and gratuities = (select max(gratuities) from payment)


select dob, name  from customer where dob like '%MAY%'
UNION 
select dob,name from stakeholders where dob like '%MAY%'

select dob from stakeholders where dob like '%MAY%'


select name, count(*) as number_times_booked 
from seat_table
group by name
having count (*) > 5
