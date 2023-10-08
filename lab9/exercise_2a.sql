SET SERVEROUTPUT ON;
DECLARE
       course_code VARCHAR2(40);
       dept VARCHAR2(4);
       code VARCHAR2(3);
BEGIN
      course_code := 'CTIS259-Database Management Systems';
      dept := SUBSTR(course_code,1,4);
      code := SUBSTR(course_code, 5,3);

      DBMS_OUTPUT.PUT('Department name: ');
      DBMS_OUTPUT.PUT_LINE(dept);
      
      DBMS_OUTPUT.PUT_LINE('Course Code: '||code);

      
      
END;
/



