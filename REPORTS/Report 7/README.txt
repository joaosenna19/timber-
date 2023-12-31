Purpose:
customers (outside of Alberta) who ordered the same products as those ordered by customers in Alberta.

1. Identifying Relevant Product:
(select title
from tbm_customer join tbm_order using(customerid)
    join tbm_order_item using(orderid)
    join tbm_product using(productid)
where province = 'AB')

the above subquery lists  product titles that were ordered by customers in Alberta (province = 'AB').

2. Main Croteria:
The main query lists customerid, title, and province from the joint tables.
It filters out customers from Alberta (province != 'AB').
Using the title in... condition, it ensures that only customers who ordered products (identified in the subquery) are displayed.
