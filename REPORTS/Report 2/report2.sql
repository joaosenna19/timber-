REM PROTOTYPE !TIMBER

SET ECHO ON
SPOOL c:/cprg250s/report2prototype.txt
SET linesize 350
SET pagesize 66

REM SET language to english to avoid problems with non-english machines
alter session set NLS_LANGUAGE = ENGLISH;
rem set date format for 11g
alter session set NLS_DATE_FORMAT='dd-mon-yy';


REM 2ND REPORT
REM DISPLAY ALL CATEGORIES AND SUBCATEGORIES AND EACH PRODUCT PER Category
REM QUERY USES JOIN, SORTING AND GROUP FUNCTION
BREAK ON 'Category'
SELECT c.name "Category", p.title "Product"
FROM tbm_category c
JOIN tbm_product p ON c.categoryid = p.category
GROUP BY c.name, p.title
ORDER BY c.name;
CLEAR BREAKS

SPOOL OFF