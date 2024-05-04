-- CREATION OF DATABASE AND TABLES__________________

DROP DATABASE IF EXISTS `Parks_and_Recreation`;
CREATE DATABASE `Parks_and_Recreation`;
USE `Parks_and_Recreation`;



CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);


INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000,1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000,1);



CREATE TABLE parks_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name varchar(50) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),


-- EXCERCISE ---

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT first_name
FROM parks_and_recreation.employee_demographics;

SELECT first_name, 
last_name, 
birth_date,
age,
(age + 10) * 10 + 10
FROM parks_and_recreation.employee_demographics;


SELECT DISTINCT first_name
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;


# WHERE clause is use to filter records or rows of data and SELECT statment
# is use to select actual column of data


SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name = "leslie"
;


SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
;


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = "female"
;


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender != "female"
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > "1985-01-01"
;

-- AND OR NOT -- logical oprators
-- both condition must be true for the result value to be returned --
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > "1985-01-01"
AND gender = "male"
;

-- any of the condition must be true for the result value to be returned --
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > "1985-01-01"
OR gender = "male"
;


-- any of the condition must be true for the result value to be returned --
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > "1985-01-01"
OR NOT gender = "male"
;


-- Isolated statement --
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name = "leslie" AND age = 44) OR age > 55
;

-- LIKE statement --
# In this situation we are not looking for exact match but pattern#
# By do so we introduce special character (% and _)
# (%) mean anything while (_) mean specific value/condition #

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE "jer%"
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE "%er%"
;

-- first_name start with "a" --
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE "a%"
;

-- we want to return first_name sart with 'A' with two characters after it --
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE "a__"
;

-- it means the frist_name can start with character 'A' followed by, 
-- three characters and finally any characters afterwrds --

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE "a___%" 
;


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE "1989%"
;


-- GROUP BY  and ORDER BY CLAUSE --
SELECT * 
FROM parks_and_recreation.employee_demographics
;


-- when grouping select column must match with groupby column unless,
-- there is introdcution of agreggate function that take column_name as parameter --
SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;


SELECT gender, avg (age) 
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

-- We group by two coulmns --
# the result value only return the only unique value of the two columns#
SELECT occupation, salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation, salary
;


SELECT occupation, AVG (salary)
FROM parks_and_recreation.employee_salary
GROUP BY occupation
;


-- use of multiply agreggate function for GROUP BY --
# Max tellus the maximum age, Min tells us the minimum age while the count,
# tells us number of rows/values/records that was grouped by in the group by column#
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;


-- ORDER BY is a clause --
# it wil sort the result set either in ascending or decending order #

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name ASC
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name DESC
;

# by default it sort result set in ascending order, for mutiplt coulmn 
# gender will be in ascending other while age will be in decending orther #

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age DESC
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name DESC
;


-- HAVING and WHERE --
SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE "%manager%"
GROUP BY occupation
HAVING AVG(salary) > 7500
;

## NOTE: if you want to filter agreggate function use HAVING clause ##


-- LIMIT and ALIASING --
# is used to slelct the number of rows/records ##

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 3, 1
;

-- ALIASING--
SELECT gender, AVG(age) AS avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40
;



-- INNER JOINS--
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    ;


SELECT dem.employee_id, age, occupation
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


-- OUTER JOINS--
# left join brings everything from left and returne a match from right table #
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
LEFT JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    ;
    
 # while right join brings everything from right and returne a match from left and pull non match #   
 
 SELECT *
FROM parks_and_recreation.employee_demographics AS dem
RIGHT JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    ;
    
    -- SELF JOIN --
    # self-join is typical join where you the table to itself ##
    
SELECT emp1.employee_id AS emp1_santa,
 emp1.first_name AS first_name_santa,
 emp1.last_name AS last_name_santa,
 emp2.employee_id AS emp_name,
 emp2.first_name AS emp_first_name,
 emp2.last_name AS emp_last_name
FROM parks_and_recreation.employee_salary AS emp1
JOIN parks_and_recreation.employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id
	;
    
    
    -- JOIN of MULTIPLE TABLES --
    SELECT dem.first_name,  dem.last_name, age
    FROM parks_and_recreation.employee_demographics AS dem
    INNER JOIN parks_and_recreation.employee_salary AS sal
		ON dem.employee_id = sal.employee_id
	INNER JOIN parks_and_recreation.parks_departments AS dept
		ON sal.dept_id = dept.department_id
        ;
  
  
  -- UNION ---
  # we have two types of union name, UNION ALL and UNION DISTICT
  # union allow you to combine rows together #
  
  SELECT first_name, last_name
  FROM parks_and_recreation.employee_demographics
  UNION ALL
  SELECT first_name, last_name
  FROM parks_and_recreation.employee_salary
  ;
  
  # union distict unites the unique values
  SELECT first_name, last_name
  FROM parks_and_recreation.employee_demographics
  UNION DISTINCT
  SELECT first_name, last_name
  FROM parks_and_recreation.employee_salary
  ;
  
  
  SELECT first_name, last_name, "OLD" AS Label
  FROM parks_and_recreation.employee_demographics
  WHERE age > 50
  ;
  
  
  SELECT first_name, last_name, "Old buddy" AS Label
  FROM parks_and_recreation.employee_demographics
  WHERE age > 40 AND gender = "male"
  UNION 
  SELECT first_name, last_name, "Old Lady"
  FROM parks_and_recreation.employee_demographics
  WHERE age > 40 AND gender = "female"
  UNION
  SELECT first_name, last_name, "Highly paid"
  FROM parks_and_recreation.employee_salary
  WHERE salary > 70000
  ORDER BY first_name, last_name
  ;


-- STRING FUNCTION --
# LENGTH function#
SELECT first_name, length(first_name)
FROM parks_and_recreation.employee_demographics
ORDER BY 2
;

# UPPER and LOWER function #
SELECT first_name, UPPER(first_name) AS firstName
FROM parks_and_recreation.employee_demographics
;

SELECT first_name, LOWER(first_name) AS firstName
FROM parks_and_recreation.employee_demographics
;

-- TRIM --
# types of trim left , right and centre trim #
# get rid of wide space around the record/data #
SELECT ("    Maximum   ") AS Label;

-- indexing LEFT and RIGHT --
SELECT first_name, 
LEFT(first_name, 3)
FROM parks_and_recreation.employee_demographics
;

SELECT first_name, 
LEFT(first_name, 3),
RIGHT(first_name, 3)
FROM parks_and_recreation.employee_demographics
;

  -- SUNSTRING -- 
  SELECT first_name, 
LEFT(first_name, 3),
RIGHT(first_name, 3),
substring(first_name, 3,2),
birth_date,
substring(birth_date, 6, 2) AS Birth_month;

-- REPLACE CHARACTER --
SELECT first_name, REPLACE (first_name, "a", "z")
FROM parks_and_recreation.employee_demographics
;


-- LOCATE CHARACTER --
# it locare character and give length of located character #
SELECT locate("J", "NKEMJIKA") AS name
;

SELECT first_name, locate("An", first_name)
FROM parks_and_recreation.employee_demographics
;
  
  
  -- CONCATENATION OF CHARACHERS --
  # It bring characters into a single column #
  
  SELECT first_name, last_name,
  concat(first_name, "  ", last_name) AS Full_Name
  FROM parks_and_recreation.employee_demographics
  ;
  
  
  -- CASE STATEMENT --
SELECT first_name, Last_name,
  CASE
	WHEN age <= 30 THEN "YOUNG"
	END AS Label
    FROM parks_and_recreation.employee_demographics
    ;
    
SELECT first_name, last_name, age,
	CASE
    WHEN age <= 30 THEN "YOUNG"
    WHEN age BETWEEN 31 AND 50 THEN "OLD"
    ELSE
		"RETIRE"
    END AS "Age bracket"
FROM parks_and_recreation.employee_demographics
;
    

-- < 50000 5% increase 
-- > 50000 7% increase
-- finance dept 10% bonus

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
    END AS "New salary",
CASE
	WHEN dept_id = 6 THEN salary * .10
    
END AS Bonus
FROM parks_and_recreation.employee_salary
;
  

-- SUB QUERIES --
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE employee_id IN (SELECT employee_id
						FROM parks_and_recreation.employee_salary
                        WHERE dept_id = 1

)
;

SELECT first_name, last_name, salary, 
(SELECT AVG(salary)
FROM parks_and_recreation.employee_salary
)
FROM parks_and_recreation.employee_salary
;
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;


SELECT gender, AVG(`MAX(age)`), AVG(`MIN(age)`)
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS Label
GROUP BY gender
;


-- WINDOW FUNCTIONS--
# OVER (PARTITION BY), ROLLING TOTAL, ROW NUMBER, RANK
SELECT gender, AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;



SELECT dem.first_name, dem.last_name, gender, 
AVG(salary) OVER(PARTITION BY gender) AS avg_salary
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

# ROLLING TOTAL)
SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


SELECT gender, MAX(`Rolling_Total`)
FROM (
SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    ) AS Label
GROUP BY gender
;

# ROW NUMBER()
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC ) AS row_num,
RANK()  OVER(PARTITION BY gender ORDER BY salary DESC ) AS rank_num, 
DENSE_RANK()  OVER(PARTITION BY gender ORDER BY salary DESC ) AS dense_rank_num
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;