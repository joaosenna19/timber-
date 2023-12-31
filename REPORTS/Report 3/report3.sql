REM PROTOTYPE !TIMBER

SET ECHO ON
SPOOL c:/cprg250s/report3prototype.txt
SET linesize 350
SET pagesize 66

REM SET language to english to avoid problems with non-english machines
alter session set NLS_LANGUAGE = ENGLISH;
rem set date format for 11g
alter session set NLS_DATE_FORMAT='dd-mon-yy';

REM 3RD REPORT
REM DISPLAY ALL PRODUCTS WHICH THE RAINT AVERAGE IS HIGHER THAN THE AMOUNT ENTERED BY THE USER
REM QUERY USES JOIN, SINGLE ROW FUNCTIONS, SORTING AND GROUP FUNCTIONS 
SELECT p.title "Product", AVG(pr.rating)  "Average Rating"
FROM tbm_product p
JOIN tbm_product_review pr ON p.productid = pr.productid
GROUP BY p.title
HAVING AVG(pr.rating) > TO_NUMBER('&rating');

SPOOL OFF