set serveroutput on;
DECLARE
  num NUMBER(7) := &n;
  rev NUMBER(7) := 0;
BEGIN
  WHILE(num > 0)
  LOOP
    rev := rev*10 + mod(num, 10);
    num := floor(num/10);
  END LOOP;

    dbms_output.put_line('Reverse of number is '|| rev);
  End;
/
