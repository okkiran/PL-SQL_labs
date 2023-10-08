SET SERVEROUTPUT ON;
DECLARE
  v_i number(3) := 1;
  v_sum  number(5) := 0;
BEGIN
  LOOP
    v_sum := v_sum + v_i;
    v_i := v_i + 1;
    exit when v_i > 100 ;
  END LOOP;
  
   dbms_output.put_line ('The sum of the numbers: '||v_sum);
END;
/
