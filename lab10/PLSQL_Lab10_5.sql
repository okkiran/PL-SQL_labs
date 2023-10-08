SET SERVEROUTPUT ON;
DECLARE 
   CURSOR personnel_cur is 
      SELECT id, name, sname, salary  
      FROM personnel; 
   c_rec personnel_cur%rowtype; 
BEGIN 
   OPEN personnel_cur; 
   LOOP 
      FETCH personnel_cur into c_rec; 
      EXIT WHEN personnel_cur%notfound; 
      DBMS_OUTPUT.put_line(c_rec.id || ' ' || c_rec.name||' '||c_rec.sname||
			      ' earns '||c_rec.salary||' $'); 
   END LOOP; 
   CLOSE personnel_cur; 
END; 
/
