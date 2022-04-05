-- This is how you write comment in sql
-- single line comment look like this

/*
 This is how to write multi line comment
 */

-- each query you write known as sqp statement
-- * means all, here it means all columns
-- from sometable that exist in the databse
-- just like Java
-- SQL statements end in semi-colon; and it's mandatory


SELECT * FROM REGIONS;

--If you want to run second statement
-- you just need to click the query to focus the cursor and click run

SELECT * FROM COUNTRIES;

SELECT * FROM LOCATIONS;

SELECT *FROM DEPARTMENTS;

SELECT *FROM JOBS;

SELECT * FROM JOB_HISTORY;

SELECT * FROM EMPLOYEES;


-- RESTRICTIONG COLUMNS IN THE RESULT

--SQL IS SPACE INSENSITIVE
SELECT FIRST_NAME
FROM EMPLOYEES;

--if want to select more than one columns can be specified separated by comma,
SELECT FIRST_NAME, LAST_NAME, EMAIL
FROM EMPLOYEES;

/*
 TASK: SELECT SPECIFIC COLUMNS FROM OTHER TABLES
 TO GET YOURSELF FAMILIAR WITH HR DATABASE
 */

 /*
  only getting unique value from the result
for example : only get unique first name from employee's table
  */
SELECT DISTINCT FIRST_NAME
FROM EMPLOYEES;

--GET ONLY unique last name

SELECT DISTINCT LAST_NAME
FROM EMPLOYEES;

--This is looking for people with unique first and last name ,aka full name.
SELECT DISTINCT FIRST_NAME, LAST_NAME
FROM EMPLOYEES;


--RESTRICTING ROWS IN THE RESULT USING WHERE CLAUSE

-- OPERATORS =, >, >=, <,<=,!=, <>
--LOGICAL OPERATOR : AND OR

-- Display the employee information for the employee with first name Ellen
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME = 'Ellen';  --Ellen !=ellen !=ELLEN, values are case sensitive.

-- Display the employee first-name, last-name
-- for the employee with salary 11000
SELECT FIRST_NAME,LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY =11000;

-- Display the employee first-name, last-name
-- for the employee with salary 4800 AND first name David

SELECT FIRST_NAME, LAST_NAME,SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'David' AND SALARY = 4800;

-- Display the employee first-name, last-name
-- for the employee with salary 4800 OR first name David

SELECT FIRST_NAME, LAST_NAME,SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'David' OR SALARY = 4800;

--Display the employees that make more than 5000 and less than 12000
SELECT * FROM EMPLOYEES
WHERE SALARY>5000 AND SALARY <12000; --49

--Range checking is much simpler in SQL USING
-- BETWEEN .............AND
--IS SAME AS COLUMN _VALUE >= lowerlimit AND column _value <=upperlimit
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 12000;
--Display the employees that JOB ID of
                                --AD _VP
                                --AD _ASST
                                --FI_ACCOUNT
                                --AC_ACCOUNT

SELECT * FROM EMPLOYEES
WHERE JOB_ID ='AD_VP'
    OR JOB_ID ='AD_ASST'
   OR JOB_ID ='FI_ACCOUNT'
   OR JOB_ID ='AC_ACCOUNT';

--using keyword IN for multiple possible value of same column in condition
SELECT FIRST_NAME ,JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN ('AD_VP','AD_ASST','FI_ACCOUNT','AC_ACCOUNT');


--HOW TO SAY NOT IN SQL
--for equality check != <>
------find out all regions expect the region with region ID of 1

SELECT * FROM  REGIONS
WHERE REGION_ID <> 1;
--WHERE REGION_ID !=1;

SELECT *FROM  REGIONS
WHERE REGION_NAME !='Americas';

-- for BETWEEN AND -->NOT BETWEEN ....AND
--display the eomployees that does not make
--more than 5000 and less than 12000

SELECT FIRST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 5000 AND 12000;

-- for IN -->NOT IN
--Display the employees that have JOB_ID
-- is not one of these 'AD_VP','AD_ASST','FI_ACCOUNT','AC_ACCOUNT'
SELECT FIRST_NAME,JOB_ID
FROM EMPLOYEES
WHERE JOB_ID NOT IN ('AD_VP','AD_ASST','FI_ACCOUNT','AC_ACCOUNT');

-- HOW TO USE NULL IN CONDITION
--FOR EXAMPLE: FIND OUT ALL THE DEPARTMENTS THAT DOES NOT HAVE MANAGER IT
SELECT * FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;--16

--FOR EXAMPLE: find out all the departments that does HAVE MANAGER_ID
SELECT *FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL;--11

--Sorting the result is ascending (low to high)
--or descending order (high to low)
-- ORDER BY clause can be used to order the result of your query
-- It use either column name or column index
--ASC for (low to high),
-- DESC (high to low)

--Display employee first name and last name and salary
--try to sort by below criteria separately
-- first name ASC
--salary DESC
--last_name DESC
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
ORDER BY FIRST_NAME;


SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
--ORDER BY FIRST_NAME ASC;
ORDER BY SALARY DESC ;
--ORDER BY LAST_NAME DESC ;
--ORDER BY 1 DESC ; -- this means sort the result by first column
--SQL index start with 1 not 0

--what about the partial search
--we use LIKE AND % (WILD CARD)
--% can represent 0 or more character of any kind
-- _ can represent exactly one character of any kind

--Display all the first name that start with letter A in employees table

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME  LIKE 'A%';--10

--Display all the first name that end with letter a in employees tables

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE  '%a';--16

--Display all the first name that contains letter a in employees tables

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE  '%a%'--66

