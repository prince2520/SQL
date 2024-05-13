-- normal query
select title, released_year, genre, rating, first_name, last_name from reviews join series on series.id = reviews.series_id join reviewers on reviewers.id = reviews.reviewer_id;

-- view from above query
CREATE View full_reviews as select title, released_year, genre, rating, first_name, last_name from reviews join series on series.id = reviews.series_id join reviewers on reviewers.id = reviews.reviewer_id;

-- gives error 
select * from full_reviews WHERE released_year = 2000 GROUP BY title;

-- select series
select * from series;

-- view ordered series 
create view ordered_series as select * from series  ORDER BY released_year;

select * from ordered_series;

-- select release_year from view
select released_year FROM  ordered_series GROUP BY released_year;

-- create or replace view ( new view )
CREATE or REPLACE VIEW ordered_series As select * from series ORDER BY released_year desc;

select * from ordered_series;

-- second method to create or replace view
alter view ordered_series as select * from series order by released_year;

-- drop view from ordered_series
DROP View ordered_series;

select * from full_reviews;

-- having used because we cannot used where in aggregate 
SELECT title, AVG(rating), COUNT(rating) as review_count from full_reviews GROUP BY title HAVING COUNT(rating)>1 ;

-- rollup gives total of avg, min and max
select title, AVG(rating) from full_reviews GROUP BY title WITH ROLLUP;

select first_name, released_year, genre, AVG(rating)
 from full_reviews GROUP BY released_year , genre , first_name WITH ROLLUP;

 -- to view modes ( change behaviour of sql)
 SELECT @@GLOBAL.sql_mode; -- Globally change mode
 SELECT @@SESSION.sql_mode; -- change mode for current session

-- to set mode 
SET GLOBAL sql_mode = 'modes';
SET SESSION sql_mode = 'modes';
