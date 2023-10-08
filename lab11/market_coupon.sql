create or replace function market_coupon
RETURN NUMBER
IS
  CURSOR market_cursor IS
  select c.cid, custname, custsurname, sum(total) TotalAmount
  from cust c, receipt r
  where c.CID = r.cid
  group by c.cid, custname, custsurname;
  
  m_rec market_cursor%ROWTYPE;
  coupon number(6,2);
  noOfCoupons number(3) := 0;
BEGIN
  FOR m_rec IN market_cursor LOOP
    CASE 
    WHEN m_rec.totalamount >= 300 THEN
    coupon := m_rec.totalamount * 0.20;
    noOfCoupons := noOfCoupons+1;
    
    WHEN m_rec.totalamount >= 200 THEN
    coupon := m_rec.totalamount * 0.10;
    noOfCoupons := noOfCoupons+1;
    
    WHEN m_rec.totalamount >= 100 THEN
    coupon := m_rec.totalamount * 0.05;
    noOfCoupons := noOfCoupons+1;
    
    ELSE
      coupon := 0;
    
    END CASE;
    
    DBMS_OUTPUT.PUT_LINE(m_rec.cid||' '||m_rec.custname||' '||m_rec.custsurname||': your total shopping amount is:  '||m_rec.totalamount);
    
    --you may display a new line using CHR(10) in  DBMS_OUTPUT.PUT_LINE function
    IF coupon = 0 THEN
      DBMS_OUTPUT.PUT_LINE('Your total shopping amount is < 100, sorry!'||CHR(10));
    ELSE
      DBMS_OUTPUT.PUT_LINE('YOU WON '||coupon||' TL MARKET COUPON :)'||CHR(10));
    END IF;
  END LOOP;  
  
  RETURN noOfCoupons;
END;
/

SET SERVEROUTPUT ON;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Total number of coupons: '||market_coupon());
END;
/

