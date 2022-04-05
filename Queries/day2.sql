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


