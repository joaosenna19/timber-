REM PROTOTYPE !TIMBER

SET ECHO ON
SPOOL c:/cprg250s/report4prototype.txt
SET linesize 350
SET pagesize 66

REM SET language to english to avoid problems with non-english machines
alter session set NLS_LANGUAGE = ENGLISH;
rem set date format for 11g
alter session set NLS_DATE_FORMAT='dd-mon-yy';

REM 4TH REPORT
REM DISPLAY ALL CUSTOMERS AND THEIR TOTAL OF ORDERS AND AMOUNT OF THE ORDERS
REM QUERY USES SINGLE ROW, GROUP FUNCTIONS, JOIN AND OLAP
SELECT UNIQUE CASE WHEN c.customerid IS NULL THEN 'Total'
                  ELSE TO_CHAR(c.customerid)
             END AS "Customer",
       COUNT(o.orderid) AS "Number of orders",
       SUM(NVL(p.price * oi.quantity, 0)) "Amount"
FROM tbm_customer c 
LEFT JOIN tbm_order o ON c.customerid = o.customerid
LEFT JOIN tbm_order_item oi ON o.orderid = oi.orderid
LEFT JOIN tbm_product p ON oi.productid = p.productid
GROUP BY ROLLUP(c.customerid);

SPOOL OFF