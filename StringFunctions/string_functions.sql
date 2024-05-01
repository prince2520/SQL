show DATABASE;
-- create book table
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

-- insert into books table
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- concat 
SELECT CONCAT("pi", "me");

-- concat in table
SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM books;


-- concat with separators
SELECT CONCAT_WS("-", "pi", "me", "yo");

-- extract form 1 to 4 words
SELECT SUBSTRING('Hello World', 1, 4);

-- extract after 7th word
SELECT SUBSTRING('Hello World', 7);

-- extract from last 3 words
SELECT SUBSTRING('Hello World', -3);


-- extract from table 1 to 10 words
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;

-- extract other aliases
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;

-- combining substr and concat
SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;


-- replace 
SELECT REPLACE('Hello World', 'Hell', '%$#@');

-- replace l with 7
SELECT REPLACE('Hello World', 'l', '7');

-- reverse string 
SELECT REVERSE('Hello World');

-- reverse from table
SELECT REVERSE(author_fname) FROM books;

-- revverse in table
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

-- length of character
SELECT CHAR_LENGTH('Hello World');

-- length of title in table
SELECT CHAR_LENGTH(title) as length, title FROM books;

--lenth of author lname in table
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;

-- change to upper case
SELECT UPPER('Hello World');

-- change to lower case
SELECT LOWER('Hello World');

-- uppercase title in table
SELECT UPPER(title) FROM books;

-- uppercase title in table
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;

-- lowercase author lname in table
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

-- insert after 6th word
SELECT INSERT('Hello Bobby', 6, 0, 'There'); 


-- get first left 3 words
SELECT LEFT('omghahalol!', 3);

-- get first right 4 words
SELECT RIGHT('omghahalol!', 4);

-- repeat ha four times
SELECT REPEAT('ha', 4);

-- trim spaces
SELECT TRIM('  pickle  ');



