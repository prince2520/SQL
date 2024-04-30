-- create table
CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 

-- insert table
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

-- show specific tables;
SELECT breed FROM cats;   

-- show table with specific conditions
SELECT breed FROM cats WHERE age=4;

-- update table 
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';

-- delete all rows table
DELETE FROM cats;

-- show specific tables;
SELECT * FROM cats;