SET ECHO ON
spool c:/cprg250s/report5prototype.txt
set linesize 360
set pagesize 66

rem 5th REPORT
rem Show the products ordered by each customer
rem The customer number starting 1 to 7 now
Break ON customerid
select DISTINCT customerid, title
from tbm_customer join tbm_order o using(customerid)
	join tbm_order_item using(orderid)
	join tbm_product using(productid)
where customerid = '&customer_id';
clear breaks

spool off