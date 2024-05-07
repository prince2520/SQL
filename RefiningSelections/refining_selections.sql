-- show auth_lname from books table
SELECT author_lname FROM books;

-- show distinct auth_lname from books table
SELECT DISTINCT author_lname FROM books;

-- show distinct concat full name from books table
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;

-- show distinct fname and lname om books table
SELECT DISTINCT author_fname, author_lname FROM books;

-- order by lname ascending order 
SELECT * FROM books ORDER BY author_lname;

-- order by lname descending order 
SELECT * FROM books ORDER BY author_lname DESC;

-- order by released year ascending order 
SELECT * FROM books ORDER BY released_year;

-- order by 2nd column in descending order
SELECT book_id, author_fname, author_lname, pages FROM books ORDER BY 2 desc;

-- order by lname and fname in ascending order
SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY author_lname, author_fname;

-- limit result by 3 
SELECT title FROM books LIMIT 3;

-- limit by released year in descending order and limit it by 1 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1;

SELECT * FROM books ORDER BY released_year DESC;

-- limit 4 items
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 4;

-- limit 3 after skiping 4 items
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 4,2;

-- words where da is middle in author_fname
SELECT title, author_fname, author_lname, pages 
FROM books
WHERE author_fname LIKE '%da%';

-- words where % is in middle of title 
SELECT * 
FROM books
WHERE title LIKE '%\%%';

--words having length of 4 words
SELECT * FROM books
WHERE author_fname LIKE '____';

-- words having length of 4 words and a is middle in author_fname
SELECT * FROM books
WHERE author_fname LIKE '_a__';