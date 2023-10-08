create or replace procedure disp_employee
(dept_id IN number)
IS
  cursor emp_cursor IS
  select last_name, first_name, salary
  from employees
  where department_id = dept_id;
  
  e_rec emp_cursor%rowtype;
BEGIN
  for e_rec IN emp_cursor loop
    dbms_output.put_line(e_rec.last_name||', '||e_rec.first_name||': '||e_rec.salary);
  end loop;
END;
/

create or replace procedure emp_sal
(dept_id IN number, s_raise IN number)
IS
BEGIN
  update employees
  set salary = salary * s_raise
  where department_id = dept_id;

  if sql%notfound then
    dbms_output.put_line('there is no employee for the dept '||dept_id);
  elsif sql%found then
    dbms_output.put_line(sql%rowcount||' records have been updated!');
    commit;
  end if;
END;
/

undefine dept_id;
undefine sal_raise;

set serveroutput on;
accept dept_id number prompt 'Please enter department id: '
accept sal_raise number prompt 'Please enter the salary raise amount: '
declare
  dept_id number := &dept_id;
  sal_raise number := &sal_raise;
begin
  emp_sal(dept_id, sal_raise);
  disp_employee(dept_id);
end;
/ 
