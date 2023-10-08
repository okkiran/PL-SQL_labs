SET SERVEROUTPUT ON;
DECLARE
e_lname employee.lname%TYPE;
e_fname employee.fname%TYPE;
	deptno department.dnumber%TYPE;
CURSOR emp_cursor IS 
         SELECT fname, lname
         FROM employee
         WHERE dno = deptno;
BEGIN
deptno := 3;
OPEN emp_cursor;
LOOP
FETCH emp_cursor INTO e_fname, e_lname;
EXIT WHEN emp_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE ('Employee: ' || e_fname || ' '|| e_lname);
END LOOP;
CLOSE emp_cursor;
END;
/

