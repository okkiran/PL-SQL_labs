CREATE OR REPLACE PROCEDURE greetings 
IS
BEGIN 
   dbms_output.put_line('Hello World!'); 
END; 
/

SET SERVEROUTPUT ON;
--calling the procedure using execute keyword
execute greetings();

--Calling the procedure using anonymous block
BEGIN 
   greetings(); 
END; 
/
