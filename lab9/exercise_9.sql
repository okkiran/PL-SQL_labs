SET SERVEROUTPUT ON;
DECLARE
deptno department.dnumber%TYPE;
CURSOR emp_cursor IS 
         SELECT fname, lname
         FROM employee
         WHERE dno = deptno; 
e_row emp_cursor%ROWTYPE;

BEGIN
deptno := 3;
FOR e_row IN emp_cursor LOOP
DBMS_OUTPUT.PUT_LINE ('Employee: ' || e_row.fname || ' ' || e_row.lname);
END LOOP;
END;
/
