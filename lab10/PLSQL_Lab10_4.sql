SET SERVEROUTPUT ON;
DECLARE  
   total_rows number(2); 
BEGIN 
   UPDATE personnel 
   SET salary = salary + 500; 

   IF sql%notfound THEN 
      dbms_output.put_line('There is no personnel in the list'); 
   ELSIF sql%found THEN 
      total_rows := sql%rowcount;
      dbms_output.put_line('There are '||total_rows || ' personnel'); 
	commit;
   END IF;  
END; 
/      
