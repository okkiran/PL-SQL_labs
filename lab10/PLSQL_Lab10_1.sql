SET SERVEROUTPUT ON;
DECLARE
  n_pct    employees.commission_pct%TYPE;
  v_eval   varchar2(10);
  n_emp_id employees.employee_id%TYPE := &emp_id;
BEGIN
  SELECT commission_pct INTO n_pct
  FROM employees
  WHERE employee_id = n_emp_id;

  CASE nvl(n_pct, 0)
    WHEN 0 THEN
      v_eval := 'N/A';
    WHEN 0.1 THEN
      v_eval := 'Low';
    WHEN 0.4 THEN
      v_eval := 'High';
    ELSE
      v_eval := 'Fair';
  END CASE;  
DBMS_OUTPUT.PUT_LINE('Employee '||n_emp_id||' commission '||n_pct||' which is '||v_eval);
END;
/
