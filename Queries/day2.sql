--WHAT ABOUT PARTIAL SEARCH
--WE USE LIKE AND % (WILD CARD)
-- % can represent 0 or more character of any kind
-- _ can represent exactly one character of any kind

/*
   'D%'-- anything start with D
          David, Danny, Dog
   '%d'--anything end with d
          Sid,Kid,Bid,Dad
   '%d%'--anything contains d
      Adam,Cassandra, Brandon,Aladdin
      Sid,Kid,Bid,Dad
      david, danny, dog

   'D%a'--anything thing start with D and end with a.
          Diana,Donna,Damla

   'S%e%n' -- anthing start with S end with n and has e some where in the middle
         Steven, Stephen,Selen, Serkan,Sebastian
   'T_' -- start with T and followed by exactly one character of any kind
          TJ, TD,Ta,T!,TV, T2

   '_a_'  -- start with any one character, followed by a and followed by any one character
          Dad, Man, Fat, Tab, Gap
 */

SELECT FIRST_NAME
FROM EMPLOYEES
--WHERE FIRST_NAME LIKE 'D%';--9
--WHERE FIRST_NAME LIKE '%d'; --6
--WHERE FIRST_NAME LIKE '%d%';  --15
--WHERE FIRST_NAME LIKE 'D%a';  --1
--WHERE FIRST_NAME LIKE 'S%e%n'; --3
--WHERE FIRST_NAME LIKE 'T_'; --1
WHERE FIRST_NAME LIKE '_a_'; --1

SELECT PHONE_NUMBER FROM EMPLOYEES
--WHERE PHONE_NUMBER LIKE '515%';  --start with 515,  --21
WHERE PHONE_NUMBER LIKE '%.121.%';  --Contains with 121, --8

-- YOU can optionally give an Alias nickname for your column
-- to chang the resulting column name (only changing dispaly not in databse
--using the keyword AS right after column name
--and PROVIDE NICKNAME either without " "if single word
-- Diaplay all first name, salary in employees table
-- modify the column name for salary in result to money

SELECT  FIRST_NAME, SALARY AS MONEY
FROM EMPLOYEES;

--Display all first name, last name in employees table
-- modify the column name for as below
--First name -> GIVIEN_NAME  last name ->FAMILY_NAME

SELECT FIRST_NAME AS GIVEN_NAME, LAST_NAME AS FAMILY_NAME
FROM EMPLOYEES;

--Display all first name, last name in employees table
-- modify the column name for as below
--First name -> GIVIEN NAME  last name ->FAMILY NAME

SELECT FIRST_NAME AS "GIVEN NAME", LAST_NAME AS "FAMILY NAME"
FROM EMPLOYEES;


-- CONCATENATION IN SQL USE DOUBLE PIPE || (THIS IS NOT OR)
--Display first name, last name , full name for employees

SELECT FIRST_NAME,LAST_NAME,
       FIRST_NAME ||' '|| LAST_NAME AS FULL_NAME
FROM EMPLOYEES;

-- ARITHMETIC OPERATION : + - * /
--Display EMPLOYEE NAME and SALARY
-- AND increased _salary after 5000$ raise
-- and decreased salary after 2000$cut
--and yearly _salary -- multiply by 12
-- and weekly salary -- divide by 4

SELECT FIRST_NAME, SALARY,
       SALARY+5000 AS INCREADED_SALARY,
        SALARY-2000 AS DECREASED_SALARY,
       SALARY *12 AS "YEARLY SALARY",
         SALARY /4 AS "WEEKLY SALARY"
FROM EMPLOYEES;

---SQL built -in functions:
--- reusable code that wrapped into function for common tasks
--- Single row function:
    -- it affects each and every row and return same number of row
    --Few text functions:
    --UPPER, Accept one parameter (column name ) and return uppercase
    --LOWER, Accept one parameter (column name ) and return lowercase
    --LENGTH: return the length of string

    --Display first name and uppercase first name in employee table

SELECT FIRST_NAME ,
       UPPER(FIRST_NAME) AS "UPPERCASE_NAME",
       LOWER(FIRST_NAME) AS LOWERCASE_NAME,
       LENGTH(FIRST_NAME) AS "CHAR COUNT"

FROM EMPLOYEES;


--Find out all FIRST NAME and Character Count
--only display if character count is exactly 5

SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) =5;

--only Display if first name character count is more than 10
SELECT FIRST_NAME,LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >10;
--only Display if first name character count between 7-9
SELECT FIRST_NAME,LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) BETWEEN 7 AND 9;

--only Display if first name character count NOT between 5-10

SELECT FIRST_NAME,LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) NOT BETWEEN 5 AND 10;

--only Display if first name character count is 2 or 9 or 11
SELECT FIRST_NAME,LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) IN (2,9,11);

--Find out all first name that contains d or D
SELECT FIRST_NAME,UPPER(FIRST_NAME)
FROM EMPLOYEES
--WHERE FIRST_NAME LIKE '%D%' OR FIRST_NAME LIKE '%d%';
WHERE UPPER(FIRST_NAME) LIKE '%D%';

-- You can use single row anywhere
--including in select column list, condition, order by
SELECT FIRST_NAME
FROM EMPLOYEES
ORDER BY  LENGTH(FIRST_NAME) DESC
;

-- Number functions:
--ROUND(DECIMAL NUMBER HERE) -->ROUNDER NUMBER
--ROUND(DECIMAL NUMBER HERE, DIGIT YOU WANT KEEP) --> ROUNDED NUMBER WITH DESIRED DIGIT

--FIND OUT SALARY AND DAILY SALARY OF EMPLOYEE
SELECT SALARY,
       ROUND(SALARY/30),
       ROUND(SALARY/30,2)
FROM EMPLOYEES;



---Multi row function | Group Functions | Aggregate Functions
--COUNT, MAX, MIN, SUM , AVG.

-- You can use COUNT function either with * or column name
--when used with * it will just return the raw count
--when used with column name it will return non-null row count only.
SELECT COUNT(*), COUNT(FIRST_NAME), COUNT(LAST_NAME)
FROM EMPLOYEES;


-- we have only 35 employees with commission _pct value not null
-- so the result will be 35
SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;

-- COUNT GET THE EMPLOYEE COUNT FOR EMPLOYEE WITH DEPARTMENT ID 90
SELECT COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;

--MAX
----FIND OUT THE MAX SALARY IN EMPLOYEE TABLE
SELECT MAX(SALARY)
FROM EMPLOYEES;

---FIND OUT THE MAX SALARY IN EMPLOYEES TABLE
---EXCLUDE THE SALARY 24000
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY!=24000;

--MIN
--FIND OUT THE MIN SALARY FROM EMPLOYEE TABLE.
--EXCLUDE THE SALARY 2100
SELECT MIN(SALARY)
FROM EMPLOYEES
WHERE SALARY <> 2100;


--Sum
--get sum of the entire employee


--avg
--find out average salary for all employees
SELECT AVG(SALARY), ROUND( AVG(SALARY) )
FROM EMPLOYEES;

---ALL IN ONE SHOT
SELECT COUNT(*) AS "EMPLOYEE COUNT",
       MAX(SALARY) AS  "HIGERST SALARY",
       MIN(SALARY) AS "LOWEST SALARY",
       SUM(SALARY) AS "SUM OF ALL SALARY",
       AVG(SALARY) AS "Average salary"
FROM EMPLOYEES;

---GROUP BY
--CAN BE USED ALONG WITH MULTI-ROW (AGGREGATE, GROUP)FUNCTIONS
--TO GENERATE RESULT PER GROUP INSTEAD OF WHOLE TABLE
--IT CAN ONLY BE USED ALONG WITH MULTI-ROW FUNCTION
--CAN NOT BE USE BY ITSELF

---DISPLAY COUNT OF EMPLOYEES IN EACH DEPARTMENT
SELECT DEPARTMENT_ID,
       COUNT(*) AS "DEP_EMP_COUNT"
FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID;

--DISPLAY COUNT OF EMPLOYEES IN EACH JOB_ID
SELECT  JOB_ID,
       COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;


---DISPLAY THE MAX SALARY FOR EACH DEPARTMENT
SELECT DEPARTMENT_ID,
       MAX(SALARY) AS "HIGHEST SALARY",
       MIN(SALARY) AS "LOWEST SALARY",
       SUM(SALARY) AS "TOTAL SALARY",
      ROUND( AVG(SALARY) )AS "AVERAGE SALARY"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

---DISPLAY THE AVG SALARY FOR EACH DEPARTMENT

--DISPLAY COUNT of countries in each region
SELECT REGION_ID,
       COUNT (*) AS "COUNT OF COUNTRIES"
FROM COUNTRIES
GROUP BY REGION_ID;

--HVGING
--CAN BE USED AFTER GROUP BY TO FILTER
--ALREADY COMBINED RESULT FURThER MORE
--you can only use hacing
--if youare using aggregate functions in condition after group by
--for example if count of employees


---DISPLAY COUNT OF EMPLOYEES IN EACH DEPARTMENT
--ONLY DISPLAY IF THE COUNT OF EMPLOYEES ARE MORE THAN 10
SELECT DEPARTMENT_ID,
       COUNT(*) AS "DEP_EMP_COUNT"
FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID
HAVING COUNT(*) >10;

--Display max salary in each department
--only display if the department max salary is more then 10000

SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 10000;



--Display max salary in each department
---only display if department ID is not 100
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID !=100
GROUP BY DEPARTMENT_ID
--HAVING DEPARTMENT_ID !=100
;


