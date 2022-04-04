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



