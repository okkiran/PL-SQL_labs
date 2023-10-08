create or replace FUNCTION find_total_sales
(in_year IN number) 
RETURN NUMBER
IS
    total_sales NUMBER := 0;
BEGIN
   SELECT sum(quantity*price) INTO  total_sales
    FROM product p, receipt r, receipt_details rd
    WHERE p.pid = rd.pid and r.rid = rd.rid
    GROUP BY EXTRACT(YEAR FROM rdate)
    HAVING EXTRACT(YEAR FROM rdate) = in_year;
    
    RETURN total_sales;
END;
/

SET SERVEROUTPUT ON;
accept given_year number prompt 'Enter the year to find the total sales: '
DECLARE
    t_sales NUMBER := 0;
    g_year number := &given_year;
BEGIN
    t_sales := find_total_sales (g_year);
    DBMS_OUTPUT.PUT_LINE('Sales '||g_year||': ' || t_sales);
END;
/
