CREATE OR REPLACE FUNCTION EmpCount 
RETURN number 
IS 
   total number(2) := 0; 
BEGIN 
   SELECT count(*) into total 
   FROM employees; 
    
   RETURN total; 
END; 
/ 


--Calling the function
SET SERVEROUTPUT ON;
DECLARE 
   c number(2); 
BEGIN 
   c := EMPCOUNT (); 
   dbms_output.put_line('Total no. of Employees: ' || c); 
END; 
/
