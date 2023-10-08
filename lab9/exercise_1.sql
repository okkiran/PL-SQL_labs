SET SERVEROUTPUT ON;
DECLARE
	todays_date DATE;
BEGIN
	todays_date := SYSDATE;
      DBMS_OUTPUT.PUT_LINE('Today''s date is ' );
      DBMS_OUTPUT.PUT_LINE(todays_date);
END;
/
