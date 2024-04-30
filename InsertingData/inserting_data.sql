-- create table
CREATE table cats (name VARCHAR(50), age INT);

-- use table
USE shop_store;

-- select database
select DATABASE();

-- insert single data
INSERT INTO cats (name, age) VALUES ("John", 4);

-- insert multiple data
INSERT INTO
    cats (name, age)
VALUES ("Temp5", 5),
    ("Temp5", 10),
    ("Temp6", 15),
    ("Temp7", 15);

-- show cats
select * FROM cats;

-- not null - create table
CREATE Table cats2 (
    name VARCHAR(50) NOT NULL, age INT NOT NULL
);

-- not null - insert
INSERT INTO cats2 (name, age) VALUES ("prince", 10);

-- not null - show table
SELECT * FROM cats2;

-- default value - create table
CREATE Table cats3 (
    name VARCHAR(50) DEFAULT "No Name", age INT DEFAULT 0
)

-- default value - insert data
INSERT INTO cats3 (age) VALUES (12);

-- default value -- show table
SELECT * from cats3;

-- primary key - method A
CREATE Table cats4(
    _id INTEGER,
    name VARCHAR(60) DEFAULT "No Name",
    age INT DEFAULT 0,
    PRIMARY KEY(_id)
);

-- primary key - method B
CREATE Table cats5(
    _id INTEGER PRIMARY KEY,
    name VARCHAR(60) DEFAULT "No Name",
    age INT DEFAULT 0
);

-- describe table 
DESC cats5;

-- auto increment - create table 

CREATE Table cats6(
    _id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60) DEFAULT "No Name",
    age INT DEFAULT 0
    );


-- describe table 
DESC cats;

-- auto increment - insert data
INSERT into cats6 (name, age) values
 ("temp1", 10),
 ("temp2", 20),
 ("temp3", 30),
 ("temp4", 40),
 ("temp5", 50),
 ("temp6", 60);

-- describe table 
SELECT * FROM cats6;
