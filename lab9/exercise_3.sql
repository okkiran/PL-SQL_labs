SET SERVEROUTPUT ON;
DECLARE 
   today date := sysdate;
   nMonths number := &enterN;
   
BEGIN 
   dbms_output.put_line(nMonths||' months later date will be:');
   dbms_output.put_line(ADD_MONTHS(today, nMonths)); 
END; 
/
