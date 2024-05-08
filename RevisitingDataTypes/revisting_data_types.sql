-- create table with date times
CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

-- insert values into table
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

-- curtime
select curtime();

-- curdate
select curdate();

-- now
select now();

-- insert values into table
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

-- show day, week and year
select birthdate, DAY(birthdate), DAYOFWEEK(birthdate), DAYOFYEAR(birthdate) from people; 

-- show month name and year
select birthdate, MONTHNAME(birthdate), YEAR(birthdate) from people;

-- show hour, minute 
select birthtime, HOUR(birthtime), MINUTE(birthtime) from people;

-- show month, day, hour, minute 
select birthdt, MONTH(birthdt), DAY(birthdt), HOUR(birthdt), MINUTE(birthdt) from people;

-- date format ex- thu apr 11th
select birthdt, DATE_FORMAT(birthdt, '%a %b %D') from people;

-- date format ex hour:min
select birthdt, DATE_FORMAT(birthdt, '%H:%i') from people;

-- date format ex- hr:min:sec AM/PM
select birthdt, DATE_FORMAT(birthdt, 'born on: %r') from people;

-- create captions table
create table captions (
    text VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- insert into captions
INSERT INTO captions (text)
VALUES ('This is my first caption');

-- show captions table
select * from captions;

-- create captions2 table
CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- insert into captions2
INSERT INTO captions2 (text)
 VALUES ('This is my second caption');

 -- update in captions2
Update  captions2 set text='This is my updated second caption';


-- show captions2 table
 select * from captions2;
