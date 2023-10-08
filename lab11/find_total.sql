create or replace view find_total
AS
select c.cid, custname, custsurname, sum(quantity) "#of items bought"
from cust c, receipt r, receipt_details rd
where c.CID = r.cid and r.rid = rd.rid
group by c.cid, custname, custsurname;

select * 
from find_total;
