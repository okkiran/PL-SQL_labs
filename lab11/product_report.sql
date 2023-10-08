create or replace view product_report
AS
select p.pid, pname, sum(quantity) "#ofSold"
from product p, receipt r, receipt_details rd
where rd.pid = p.pid and r.rid = rd.rid
group by p.pid, pname
order by p.pid, pname;

select * 
from product_report;
