SET ECHO ON
spool c:/cprg250s/report6prototype.txt
set linesize 360
set pagesize 66

rem Report6
rem Show total number of products orders and order items, and Total value of all orders by each supplier
column 'Supplier Name' format A25
column 'Value of all orders' format A20
column 'Total value of all orders' format A25
select name "Supplier Name", count(title) "Total Number of product's orders", 
	sum(oi.quantity) "Total Number of ordered items", 
	to_char(sum(oi.quantity*p.price), '$9,990.00') "Total value of all orders"
from tbm_supplier join tbm_product_demand pd using(supplierid)
	join tbm_product p using(productid)
	join tbm_order_item oi using(productid)
	join tbm_order using(orderid)
group by name;
clear columns

spool off