REM PROTOTYPE !TIMBER

SET ECHO ON
SPOOL c:/cprg250s/report1prototype.txt
SET linesize 350
SET pagesize 66

REM SET language to english to avoid problems with non-english machines
alter session set NLS_LANGUAGE = ENGLISH;
rem set date format for 11g
alter session set NLS_DATE_FORMAT='dd-mon-yy';


REM 1ST REPORT
REM USER CAN INPUT A PRODUCT ID AND SEE ALL REVIEWS FOR A SPECIFIC PRODUCT
REM QUERY USES SORTING, JOIN AND USER INPUT
COLUMN 'Product' FORMAT A25
COLUMN 'Comments' FORMAT A50
COLUMN 'Rating' FORMAT 9999
BREAK ON 'Product'
SELECT p.title "Product", pr.rating "Rating", pr.comments "Comments" 
FROM tbm_product_review pr
JOIN tbm_product p ON pr.productid = p.productid
WHERE pr.productid = '&productid'
ORDER BY p.title, pr.rating;
CLEAR COLUMNS
CLEAR BREAKS

SPOOL OFF