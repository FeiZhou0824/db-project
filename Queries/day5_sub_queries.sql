---SUB QUERY : QUERY INSIDE ANOTHER QUERY

--FIND OUT MAX SALARY FROM EMPLOYEES

SELECT MAX(SALARY)
FROM EMPLOYEES;

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE SALARY = 24000;

--- WE HARD CODED THE VALUE OF 24000 WE GOT FROM FIRST QUERY INTO SECOND QUERY
---NOW JUST LIKE FUNCTION CALL WE CAN USE THIS QUERY
--AS A BLOCK OF QUERY THAT GENERATE MAX SALARY ANYTIME
--SO EVEN IF MAX SALARY CHANGE AT SOE POINT WE WOULD GET CORRECT RESULT

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE SALARY= (SELECT MAX(SALARY) FROM EMPLOYEES) ;

SELECT FIRST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);

---FIND OUT EVERYONE THE NAME OF EMPLOYEES THAT MAKE MORE THAN AVERAGE SALARY

SELECT AVG(SALARY)  FROM EMPLOYEES;

SELECT FIRST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEES);

---DISPLAY ALL EMPLOYEES IF SALARY IS NOT 24000;
--AND FIND MAX
--AKA SECOND MAX SALARY
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY !=(SELECT MAX(SALARY) FROM EMPLOYEES);

--FIND OUT 3RD MAX SALARY
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY< 17000 ; ---FILTER ALL SALARY LESS THAN 2ND ONE
---JUST REPLACE THE 17000 WITH ABOVE QUERY

SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY<  (SELECT MAX(SALARY)
                FROM EMPLOYEES
                WHERE SALARY !=(SELECT MAX(SALARY) FROM EMPLOYEES));


---FIND OUT THE FIRST NAME OF EMPLOYEES WHO WORKS IN THE EXCUTIVE DEPARTMENT

---find out the department id of excutive

SELECT DEPARTMENT_ID FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Executive';

SELECT FIRST_NAME FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'Executive'  ) ;





