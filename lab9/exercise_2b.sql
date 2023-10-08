SET SERVEROUTPUT ON;

DECLARE
       course_code VARCHAR2(40);
       dept VARCHAR2(4);
       code VARCHAR2(3);
       start_pos integer;
BEGIN
      course_code := 'CTIS259-Database Management System';
      dept := SUBSTR(course_code, 1, 4);
      code := SUBSTR(course_code, 5, 3);

      dept := initcap(dept);

      DBMS_OUTPUT.PUT('Department name: ');
      DBMS_OUTPUT.PUT_LINE(dept);

      DBMS_OUTPUT.PUT('Course Code: ');
      DBMS_OUTPUT.PUT_LINE(code);

      start_pos := instr(course_code, 'Data');
      DBMS_OUTPUT.PUT_LINE('Position of the word -Data- : ' || start_pos);

END;
/






