-- unique - create table
create table contacts (
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) not null UNIQUE
);

insert into contacts(name, phone) VALUES ('John', '12345');

-- give error because phone no is not unique
insert into contacts(name, phone) VALUES ('Angry', '12345');


-- check - create table 
create table users (
    username VARCHAR(20) NOT NULL,
    age int check (age>0)
);

-- insert into users table
insert into users(username, age) VALUES ('John', 20);

-- check - create table 
CREATE table palindromes (
    word VARCHAR(100) NOT NULL check(Reverse(word) = word)
);

-- insert into palindromes table
insert into palindromes(word) VALUES ('nitin');

-- constraint
create table users2 (
    username VARCHAR(20) NOT NULL,
    age int,
    constraint age_not_negative check(age>0)
)

-- insert into users2 table
insert into users2(username, age) VALUES ('John', 20);

-- constraint - create palindromes table
create table palindromes2 (
    word VARCHAR(100),
    constraint word_is_palindrome check(reverse(word) = word)
);

-- insert into palindromes2 table
insert into palindromes2(word) VALUES ('ggkn');


-- multiple constraints - create compaines table
create table companies (
    name VARCHAR(255) not null,
    address VARCHAR(255) not null,
    constraint name_address UNIQUE(name, address)
);

-- insert into compaines table
insert into companies(name, address) VALUES ('prince', '1234');
insert into companies(name, address) VALUES ('princse', '1234');

-- select compaines table
select * from compaines;

-- multiple constraints - create houses table
create table houses (
    purchase_price int not null,
    sale_price int not null,
    constraint sprice_gt_pprice check(sale_price >= purchase_price)
);

-- insert into houses table
insert into houses(purchase_price, sale_price) values (5, 1);

-- alter table - add column
alter table companies add COLUMN phone VARCHAR(15);

-- alter table - add column
alter table companies add COLUMN employee_count int not null DEFAULT 1;

-- drop column from table
alter table companies drop COLUMN phone;

-- rename table 
rename table companies to suppliers;

-- rename table using alter table
alter table suppliers rename to companies;

-- rename column name 
alter table companies rename COLUMN name to company_name;

-- modify column 
alter table companies MODIFY company_name VARCHAR(100) default 'unknown';

-- rename and modify column
ALTER TABLE companies
CHANGE biz_name address VARCHAR(50);

-- add constraint 
alter table houses add constraint positive_pprice check(purchase_price >= 0);

insert into houses(sale_price, purchase_price)  VALUES (100, -4);

-- desc companies
DESC companies;