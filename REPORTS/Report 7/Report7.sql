SET ECHO ON
spool c:/cprg250s/report7prototype.txt
set linesize 360
set pagesize 66

rem Report7
rem Which customer_id ordered the same product as those who ordered in Alberta?
select customerid, title, province
from tbm_customer join tbm_order using(customerid)
	join tbm_order_item using(orderid)
	join tbm_product using(productid)
where province != 'AB'
	and title in
		(select title
		from tbm_customer join tbm_order using(customerid)
			join tbm_order_item using(orderid)
			join tbm_product using(productid)
		where province = 'AB');

spool off