Purpose:
This report is to display:
	The total number of product orders,
	The total quantity of items ordered,
	The total Value of all orders by each supplier.


1. Total Number of Product's Orders:
Using the count(title) function, the report counts the total number of different product's orders for each supplier.

2. Total Number of Ordered Items:
The sum(oi.quantity) function aggregates the total quantity of items ordered by each supplier.

3. Total Value of All Orders:
The total value of all orders is calculated by multiplying the quantity (oi.quantity) of each ordered item with its respective price (p.price). 
The resulting sum is then formatted to have a currency symbol and a specific number format using the to_char function.

4. Grouping by Supplier:
To ensure the metrics are specific to each supplier, the query uses the group by name command. This groups the results by the supplier's name, ensuring that the counts and sums are specific to each individual supplier.