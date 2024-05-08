-- not equal - where released_year not equal to 2017
select * from books where released_year != 2017;

-- not like - title not like 'e'
select * from books where title not like '%e%';

-- greater than - released year > 2005
select * from books where released_year > 2005;

-- greater than - pages > 500
select * from books where pages > 500;

-- less than - pages < 200
select * from books where pages < 200;

-- less than - released year < 2000
select * from books where released_year < 2000;


-- less than equal to - released year <= 1985
select * from books where released_year <= 1985;

-- and operator - released year > 2010 and author_lname="Eggers"; 
select title, author_lname, released_year from books where released_year > 2010 and author_lname='Eggers';

-- and operator - released year > 2010 and author_lname="Eggers" and title like '%novel%'
select title, author_lname, released_year from books where released_year > 2010 and author_lname="Eggers" and title like '%novel%';

-- character length of title greater than 30 and pages is greater than 500
select title, pages from books where CHAR_LENGTH(title) > 30 and pages > 500;

--  author_lname equal to 'Eggers' and released year is greater than 2010 
SELECT title, author_lname FROM books WHERE author_lname='Eggers' AND released_year > 2010;

-- author_lname is equal to 'Eggers' and released year is greater than 2010
select title, author_lname, released_year from books where author_lname='Eggers' or released_year > 2010;

-- author_lname is equal to "Eggers" and released_year is greater than 2010 
select title, author_lname, released_year from books where author_lname='Eggers' or released_year > 2010;

-- pages < 200 or title like 'stories'
select title, pages from books where pages < 200 or title like '%stories%';


-- released year <= 2015 and released year >= 2004 
select title, released_year from books where released_year <= 2015 and released_year >=2004;

-- released year <= 2015 and released year >= 2004 
select title, released_year from books where released_year BETWEEN 2004 and 2015;

-- comparing dates - 
select * from people;

-- cast string time to inbuilt time
select * from people where birthtime BETWEEN cast('12:00:00' as Time) and cast('16:00:00' as Time);

select * from people where Hour(birthtime) BETWEEN 12 and 16;


select title, author_lname from books where author_lname='Carver' OR author_lname='Lahiri' OR author_lname='Smith';

select title, author_lname from books where author_lname IN ('Carver','Lahiri','Smith');

select title, author_lname from books where author_lname Not  IN ('Carver','Lahiri','Smith');

-- released year is greater than equal to 2000 and is od 
SELECT title, released_year FROM books
WHERE released_year >= 2000 
AND released_year % 2 = 1;

-- case 
select title, released_year, 
CASE
WHEN released_year >= 2000 THEN 'modern lit'
ELSE
    '20th century lit'
END AS GENRE
from books;

SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;


SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;