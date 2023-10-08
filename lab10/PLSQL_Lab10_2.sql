create or replace procedure find_letter
(overall IN number, letter OUT char)
IS
BEGIN
CASE 
  WHEN overall >= 85 THEN
    letter := 'A' ;
  WHEN overall >= 75 THEN
    letter := 'B' ;
  WHEN overall >= 60 THEN
    letter := 'C' ;
  WHEN overall >= 45 THEN
      letter := 'D' ;
  ELSE
    letter := 'F' ;
  END CASE;
END;
/

SET SERVEROUTPUT ON;
DECLARE
  c_grade number(5,2) := &overall;
  c_letter CHAR(1);
BEGIN
  find_letter(c_grade, c_letter);
  dbms_output.put_line('Your Letter grade is: '|| c_letter);
END;
/
