-- create employee table
create table employees (
    empo_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

-- insert into employee table
INSERT INTO
    employees (department, salary)
VALUES ('engineering', 80000),
    ('engineering', 69000),
    ('engineering', 70000),
    ('engineering', 103000),
    ('engineering', 67000),
    ('engineering', 89000),
    ('engineering', 91000),
    ('sales', 59000),
    ('sales', 70000),
    ('sales', 159000),
    ('sales', 72000),
    ('sales', 60000),
    ('sales', 61000),
    ('sales', 61000),
    ('customer service', 38000),
    ('customer service', 45000),
    ('customer service', 61000),
    ('customer service', 40000),
    ('customer service', 31000),
    ('customer service', 56000),
    ('customer service', 55000);

select department, MIN(salary), MAX(salary)
from employees
GROUP BY
    department;

-- window function - Over (entire average salary)
select empo_no, department, salary, AVG(salary) OVER ()
from employees;

-- window function - Over (average salary per department)
select
    empo_no,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY
            department
    ) as dep_avg
from employees;

-- window function - Over (average salary per department)
select
    empo_no,
    department,
    salary,
    COUNT(*) OVER (
        PARTITION BY
            department
    ) as dept_count
from employees;

-- window function - Over (SUM salary per department)
select empo_no, department, salary, SUM(salary) OVER (
        PARTITION BY
            department
    )
from employees;

-- window function - Sum  by curr_salary + previous_sum
select empo_no, department, salary, SUM(salary) OVER (
        PARTITION BY
            department
        ORDER BY salary
    )
from employees;

-- window function - row number ( parition by department)
select empo_no, department, salary, ROW_NUMBER() OVER (
        PARTITION BY
            department
        ORDER BY salary
    )
from employees;

-- window function - rank ( parition by department)
select empo_no, department, salary, RANK() OVER (
        PARTITION BY
            department
        ORDER BY salary DESC
    )
from employees;

-- window function - row number ( order by salary )
select empo_no, department, salary, RANK() OVER (
        ORDER BY salary DESC
    )
from employees;

-- window funciton - dense rank ( order by salary ) don't skip number
select empo_no, department, salary, DENSE_RANK() OVER (
        ORDER BY salary DESC
    )
from employees;

-- window function - NTILE
select
    empo_no,
    department,
    salary,
    NTILE(4) OVER (
        PARTITION BY
            department
        ORDER BY salary DESC
    ) AS dept_salary_quartile,
    NTILE(5) OVER (
        ORDER BY salary DESC
    )
from employees;

-- give the id of first value 
select empo_no, department, salary, FIRST_VALUE(empo_no) OVER (PARTITION BY department ORDER BY salary DESC) from employees;

-- window function - lag get last 2nd salary;
select empo_no, department, salary, LAG(salary, 2) OVER ( PARTITION BY department ORDER BY salary DESC) from employees;

-- window function - lead get next salary;
select empo_no, department, salary, LEAD(salary, 2) OVER (PARTITION BY department ORDER BY salary DESC) from employees;

