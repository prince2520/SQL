-- create customers table 
create Table customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

-- create orders table 
create table orders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
 
-- insert data into customers table
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

-- insert data into orders table       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

-- select order placed by customer one
SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');


-- inner join 
SELECT * from customers JOIN orders ON customers.id = orders.customer_id;

-- inner join 
SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON orders.customer_id = customers.id;

-- inner join and group by
select first_name, last_name, SUM(amount) AS total from customers JOIN orders ON customers.id = orders.customer_id GROUP BY last_name, first_name;

-- left join 
select first_name, last_name, order_date, amount from customers LEFT JOIN orders ON orders.customer_id = customers.id;

-- left join - opposite 
select order_date, amount, first_name, last_name from orders LEFT JOIN customers ON orders.customer_id = customers.id;

-- left join - group by 
select first_name, last_name, IFNULL(sum(amount), 0) from customers Left JOIN orders on customers.id = orders.customer_id GROUP BY last_name, first_name; 

desc orders;

-- right join
select order_date, amount, first_name, last_name from orders RIGHT JOIN customers ON orders.customer_id = customers.id;

-- create table 
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
-- cascade delete - create table orders 
 CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON DELETE CASCADE
);

SELECT * from customers;
SELECT * from orders;
DELETE from  customers WHERE id = 1;
