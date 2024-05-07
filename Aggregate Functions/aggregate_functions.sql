-- count no of rows;
Select count(*) from books;

select * from books;

-- count lname 
SELECT COUNT(author_lname) FROM books;

-- count unique lname
SELECT COUNT(DISTINCT author_lname) FROM books;

-- group by author_lname and count lname 
select author_lname, count(*) from books GROUP BY author_lname;

-- group by author_lname, order by books written 
select author_lname, COUNT(*) as books_written from books GROUP BY author_lname ORDER BY books_written DESC;

-- show max no of pages
select max(pages) from books;

--show min in author_lname 
select min(author_lname) from books;

-- get detail of books having max pages
select title, pages from books where pages = (select max(pages) from books);

-- min released year from books
SELECT MIN(released_year) FROM books;

-- get detail of books having min released year
SELECT title, released_year FROM books 
WHERE released_year = (SELECT MIN(released_year) FROM books);

-- group by multiple column 
select author_fname, author_lname, count(*) from books GROUP BY author_lname, author_fname;

-- group by author_lname and show max released year
select author_lname, max(released_year) from books GROUP BY author_lname;

-- group by author_lname . show min and max released year 
select author_lname, max(released_year), min(released_year) from books GROUP BY author_lname;

-- group by author_lname, author_fname . show latest and earliest release year.
select
 author_lname,
 count(*) as books_written, 
 min(released_year) as earliest_release,
 max(released_year) as latest_release,
 max(pages) as longest_page_count
 from books GROUP BY author_lname, author_fname;


 -- sum pages from books
 select sum(pages) from books;

 -- group by author_lname and show author_lname, show count and  sum of pages
 select author_lname, count(*), sum(pages) from books GROUP BY author_lname;

 -- average of pages from books
 select avg(pages) from books;

-- average of released_year from books
select avg(released_year) from books;

-- group by released year and show released_year and average stock quantity
select released_year, AVG(stock_quantity), count(*) from books GROUP BY released_year;