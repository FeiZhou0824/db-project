SELECT * FROM EMPLOYEES;

--CASE WHEN STATEMENT TO CONDITIONALLY DISPLAY VALUES

--- DISPLAY EMPLOYEE FIRST NAME, SALARY, SALARY GRADE
--SALARY GRADE COLUMN SHOULD BE BELOW VALUES
---WHEN SALARY >8000--->"ABOVE AVERAGE"
--ELSE "BELOW AVERAGE"

SELECT FIRST_NAME, SALARY,
       CASE WHEN SALARY > 8000 THEN 'ABOVE AVERAGE'
        ELSE 'BELOW AVERAGE'
        END AS SALARY_GRADE
FROM EMPLOYEES;



--- DISPLAY EMPLOYEE FIRST NAME, SALARY, SALARY GRADE2
--SALARY GRADE COLUMN SHOULD BE BELOW VALUES
---WHEN SALARY >20000 THEN 'A'
---WHEN SALARY BETWEEN 10000 AND 20000 THEN 'B'
---WHEN SALARY BETWEEN 5000 AND 10000 THEN 'C'
--ELSE 'D'

SELECT FIRST_NAME,SALARY,CASE
                        WHEN SALARY >20000 THEN 'A'
                        WHEN SALARY BETWEEN 10000 AND 20000 THEN 'B'
                        WHEN SALARY BETWEEN 5000 AND 10000 THEN 'C'
                        ELSE 'D'
                        END AS SALARY_GRADE2
FROM EMPLOYEES
ORDER BY SALARY;


---DATE FUNCTION

---FIND OUT EVERY EMPLOYEES HIRE BEFORE DATE 2002-08-16
--TO_DATE ACCEPT 2 PARAMETERS
--THE FORMAT OF DATE PROVIDED IN PREVIOUS PARAMETER


SELECT FIRST_NAME,HIRE_DATE
FROM EMPLOYEES
--WHERE HIRE_DATE  < '2002-08-16'; WONT WORK HERE
WHERE HIRE_DATE < TO_DATE('2002-08-16','YYYY-MM-DD');

---FILTER THE RESULT BY HIRE DATE
--BETWEEN 2001-01-13 AND 2006-01-03

SELECT FIRST_NAME,HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN TO_DATE('2001-01-03', 'YYYY-MM-DD')
                AND TO_DATE('2006-01-03','YYYY-MM-DD');






