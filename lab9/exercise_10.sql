SET SERVEROUTPUT ON;

DECLARE
   Emp_name           VARCHAR2(10);
   Emp_number         INTEGER;
   Empno_out_of_range EXCEPTION;
BEGIN
   Emp_number := 10001;
   IF Emp_number > 9999 OR Emp_number < 100 THEN
      RAISE Empno_out_of_range;
   ELSE
      SELECT fname INTO Emp_name FROM employee
         WHERE ssn = Emp_number;
      dbms_output.put_line ('Employee name is ' || Emp_name);
END IF;
EXCEPTION
   WHEN Empno_out_of_range THEN
      dbms_output.put_line ('Employee number  ' || Emp_number || '  is out of range.');
END;
/
