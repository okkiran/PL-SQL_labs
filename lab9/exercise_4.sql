SET SERVEROUTPUT ON;
DECLARE
    pi constant number(3,2) := 3.14;
    radius number(7,2);
    area number(13,2);
    perimeter number(13,2);
BEGIN
    radius := &n;
    perimeter:= 2*pi*radius;
    area := pi* power(radius,2);
    dbms_output.put_line ('Area: '||area||' '||'perimeter: '||perimeter);
END;
/
