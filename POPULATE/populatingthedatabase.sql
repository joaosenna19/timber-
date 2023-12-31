REM Populating !Timber database

SET ECHO ON
SPOOL c:/cprg250s/timberpopulated.txt

REM SET language to english to avoid problems with non-english machines
alter session set NLS_LANGUAGE = ENGLISH;
rem set date format for 11g
alter session set NLS_DATE_FORMAT='dd-mon-yy';
SET linesize 350
SET pagesize 66

DELETE FROM tbm_order_item;
DELETE FROM tbm_product_demand;
DELETE FROM tbm_product_review;
DELETE FROM tbm_order;
DELETE FROM tbm_product;
DELETE FROM tbm_category;
DELETE FROM tbm_supplier;
DELETE FROM tbm_customer;
DELETE FROM tbm_shipping_rate;
DELETE FROM tbm_tax;


REM tbm_tax
-- Alberta (AB)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (1, 0.05, 0.07, 0); 
-- British Columbia (BC)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (2, 0.05, 0.07, 0); 
-- Manitoba (MB)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (3, 0.05, 0.07, 0); 
-- New Brunswick (NB)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (4, 0, 0, 0.15); 
-- Newfoundland and Labrador (NL)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (5, 0, 0, 0.15); 
-- Northwest Territories (NT)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (6, 0.05, 0, 0); 
-- Nova Scotia (NS)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (7, 0, 0, 0.15); 
-- Nunavut (NU)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (8, 0.05, 0, 0); 
-- Ontario (ON)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (9, 0, 0.13, 0); 
-- Prince Edward Island (PE)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (10, 0, 0, 0.15); 
-- Quebec (QC)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (11, 0.05, 0.09975, 0); 
-- Saskatchewan (SK)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (12, 0.05, 0.06, 0); 
-- Yukon (YT)
INSERT INTO tbm_tax (taxid, gst, pst, hst)
VALUES (13, 0.05, 0, 0); 

REM tbm_shipping_rate

-- SAMPLE DATA GENERATED USING CHATGPT

INSERT INTO tbm_shipping_rate (shippingrateid, weightmin, weightmax, shippingcost)
VALUES (1, 0.1, 1, 5.99);
INSERT INTO tbm_shipping_rate (shippingrateid, weightmin, weightmax, shippingcost)
VALUES (2, 1, 5, 8.99);
INSERT INTO tbm_shipping_rate (shippingrateid, weightmin, weightmax, shippingcost)
VALUES (3, 5, 10, 12.99);
INSERT INTO tbm_shipping_rate (shippingrateid, weightmin, weightmax, shippingcost)
VALUES (4, 10, 20, 16.99);
INSERT INTO tbm_shipping_rate (shippingrateid, weightmin, weightmax, shippingcost)
VALUES (5, 20, 50, 22.99);
INSERT INTO tbm_shipping_rate (shippingrateid, weightmin, weightmax, shippingcost)
VALUES (5, 50, 999, 29.99); -- DATA INSERTED BY US


REM tbm_customer

-- SAMPLE DATA GENERATED USING CHATGPT

INSERT INTO tbm_customer (customerid, phonenumber, addressstreet, addressnumber, city, province, postalcode, emailaddress, istimbermember)
VALUES (1, '123.456.7890', '123 Main St', 10, 'Toronto', 'ON', 'A1B2C3', 'john.doe@example.com', 1);
INSERT INTO tbm_customer (customerid, phonenumber, addressstreet, addressnumber, city, province, postalcode, emailaddress, istimbermember)
VALUES (2, '987.654.3210', '456 Elm St', 20, 'Vancouver', 'BC', 'D4E5F6', 'jane.smith@example.com', 0);
INSERT INTO tbm_customer (customerid, phonenumber, addressstreet, addressnumber, city, province, postalcode, emailaddress, istimbermember)
VALUES (3, '555.111.2222', '789 Oak St', 30, 'Calgary', 'AB', 'G7H8I9', 'michael.brown@example.com', 1);
INSERT INTO tbm_customer (customerid, phonenumber, addressstreet, addressnumber, city, province, postalcode, emailaddress, istimbermember)
VALUES (4, '222.333.4444', '321 Pine St', 40, 'Montreal', 'QC', 'J1K2L3', 'emily.wilson@example.com', 0);
INSERT INTO tbm_customer (customerid, phonenumber, addressstreet, addressnumber, city, province, postalcode, emailaddress, istimbermember)
VALUES (5, '444.555.6666', '567 Cedar St', 50, 'Halifax', 'NS', 'M4N5O6', 'david.jackson@example.com', 1);
INSERT INTO tbm_customer (customerid, phonenumber, addressstreet, addressnumber, city, province, postalcode, emailaddress, istimbermember)
VALUES (6, '777.888.9999', '890 Maple St', 60, 'Winnipeg', 'MB', 'P7Q8R9', 'sarah.thompson@example.com', 0);
INSERT INTO tbm_customer (customerid, phonenumber, addressstreet, addressnumber, city, province, postalcode, emailaddress, istimbermember)
VALUES (7, '666.777.8888', '123 Oak St', 70, 'Edmonton', 'AB', 'S1T2U3', 'ryan.miller@example.com', 1);


REM tbm_category

-- SAMPLE DATA GENERATED USING CHATGPT

INSERT INTO tbm_category (categoryid, name, parentcategory) VALUES (1, 'Electronics', NULL);
INSERT INTO tbm_category (categoryid, name, parentcategory) VALUES (2, 'Mobile Phones', 1);
INSERT INTO tbm_category (categoryid, name, parentcategory) VALUES (3, 'Laptops', 1);
INSERT INTO tbm_category (categoryid, name, parentcategory) VALUES (4, 'Clothing', NULL);
INSERT INTO tbm_category (categoryid, name, parentcategory) VALUES (5, 'Men Clothing', 4);
INSERT INTO tbm_category (categoryid, name, parentcategory) VALUES (6, 'Women Clothing', 4);
INSERT INTO tbm_category (categoryid, name, parentcategory) VALUES (7, 'Books', NULL);
INSERT INTO tbm_category (categoryid, name, parentcategory) VALUES (8, 'Fiction', 7);
INSERT INTO tbm_category (categoryid, name, parentcategory) VALUES (9, 'Non-fiction', 7);
INSERT INTO tbm_category (categoryid, name, parentcategory) VALUES (10, 'Kids', 7);

REM tbm_products 

-- SAMPLE DATA GENERATED USING CHATGPT

INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (1, 'iPhone 12', 'Latest Apple smartphone', 999.99, 0.2, 0, 2);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (2, 'Samsung Galaxy S21', 'High-end Android phone', 899.99, 0.2, 0, 2);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (3, 'Dell XPS 13', 'Powerful laptop for professionals', 1499.99, 2.5, 0, 3);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (4, 'Sony PlayStation 5', 'Next-gen gaming console', 499.99, 4.5, 0, 1);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (5, 'Canon EOS Rebel T7i', 'Entry-level DSLR camera', 699.99, 2.0, 0, 1);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (6, 'LG 55" 4K Smart TV', 'Ultra HD television with smart features', 899.99, 25.0, 0, 1);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (7, 'Nike Air Max 270', 'Mens running shoes', 129.99, 0.8, 0, 5);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (8, 'Adidas Ultraboost', 'Womens running shoes', 139.99, 0.7, 0, 6);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (9, 'Amazon Echo Dot', 'Smart speaker with Alexa', 49.99, 0.3, 0, 1);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (10, 'Fitbit Versa 3', 'Fitness smartwatch', 199.99, 0.4, 0, 1);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (11, 'Samsung 65" QLED TV', 'QLED TV with vibrant colors', 1499.99, 35.0, 0, 1);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (12, 'Canon EOS 5D Mark IV', 'Professional DSLR camera', 2499.99, 3.0, 0, 1);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (13, 'Apple MacBook Pro', 'Powerful laptop for creatives', 1799.99, 2.0, 0, 3);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (14, 'Sony WH-1000XM4', 'Wireless noise-canceling headphones', 349.99, 0.3, 0, 1);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (15, 'Nintendo Switch', 'Hybrid gaming console', 299.99, 0.3, 0, 1);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (16, 'Adidas Superstar', 'Classic casual shoes', 89.99, 0.6, 0, 5);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (17, 'Fitbit Charge 4', 'Activity tracker with heart rate monitor', 129.99, 0.2, 0, 1);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (18, 'Samsung Galaxy Tab S7', 'Android tablet for productivity', 649.99, 0.5, 0, 3);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (19, 'Amazon Kindle Paperwhite', 'Waterproof e-reader', 129.99, 0.2, 0, 7);
INSERT INTO tbm_product (productid, title, description, price, weight, taxexempt, category)
VALUES (20, 'Sony WH-CH710N', 'Wireless over-ear headphones', 199.99, 0.4, 0, 1);

REM tbm_product_review

-- SAMPLE DATA GENERATED USING CHATGPT

INSERT INTO tbm_product_review (productreviewid, rating, comments, dateofreview, customerid, productid)
VALUES (1, 4, 'Great phone, excellent camera quality.', TO_DATE('15-MAY-22'), 1, 1);
INSERT INTO tbm_product_review (productreviewid, rating, comments, dateofreview, customerid, productid)
VALUES (2, 5, 'Amazing laptop, fast performance.', TO_DATE('20-JUN-22'), 3, 3);
INSERT INTO tbm_product_review (productreviewid, rating, comments, dateofreview, customerid, productid)
VALUES (3, 3, 'Good quality shoes, comfortable to wear.', TO_DATE('05-JUL-22'), 5, 7);
INSERT INTO tbm_product_review (productreviewid, rating, comments, dateofreview, customerid, productid)
VALUES (4, 5, 'Impressive camera, captures great shots.', TO_DATE('10-AUG-22'), 2, 2);
INSERT INTO tbm_product_review (productreviewid, rating, comments, dateofreview, customerid, productid)
VALUES (5, 4, 'Excellent TV, vibrant colors.', TO_DATE('25-SEP-22'), 4, 11);
-- added by us
INSERT INTO tbm_product_review (productreviewid, rating, comments, dateofreview, customerid, productid)
VALUES (6, 5, 'Best tablet I have ever had!', TO_DATE('15-MAY-22'), 3, 18);
INSERT INTO tbm_product_review (productreviewid, rating, comments, dateofreview, customerid, productid)
VALUES (7, 2, 'I expected more, tbh', TO_DATE('15-MAY-22'), 2, 10);
INSERT INTO tbm_product_review (productreviewid, rating, comments, dateofreview, customerid, productid)
VALUES (8, 3, 'Good enough for the price I paid', TO_DATE('16-JUL-22'), 1, 10);
INSERT INTO tbm_product_review (productreviewid, rating, comments, dateofreview, customerid, productid)
VALUES (9, 5, 'I am so happy that I purchased this phone!', TO_DATE('15-OCT-22'), 4, 1);
INSERT INTO tbm_product_review (productreviewid, rating, comments, dateofreview, customerid, productid)
VALUES (10, 3, 'Decent phone, nice colors.', TO_DATE('15-OCT-22'), 2, 1);


REM tbm_supplier

INSERT INTO tbm_supplier (supplierid, name, emailaddress, city, province)
VALUES (1, 'ABC Corporation', 'abc_corp@example.com', 'Toronto', 'ON');
INSERT INTO tbm_supplier (supplierid, name, emailaddress, city, province)
VALUES (2, 'XYZ Enterprises', 'xyz_ent@example.com', 'Vancouver', 'BC');
INSERT INTO tbm_supplier (supplierid, name, emailaddress, city, province)
VALUES (3, 'Global Suppliers Ltd', 'globalsuppliers@example.com', 'Montreal', 'QC');
INSERT INTO tbm_supplier (supplierid, name, emailaddress, city, province)
VALUES (4, 'MegaCorp Industries', 'megacorp@example.com', 'Calgary', 'AB');


REM tbm_product_demand

-- SAMPLE DATA GENERATED USING CHATGPT

INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (1, 1, 100, 7);
-- DATA ADDED BY US
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (4, 1, 72, 10);
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (3, 1, 35, 4);
-- SAMPLE DATA GENERATED USING CHATGPT
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (2, 2, 50, 5);
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (3, 3, 200, 10);
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (4, 4, 75, 8);
-- DATA ADDED BY US
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (2, 4, 35, 5);
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (1, 5, 60, 5);
-- SAMPLE DATA GENERATED USING CHATGPT
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (2, 1, 50, 5);
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (3, 1, 75, 6);
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (4, 2, 100, 7);
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (1, 3, 150, 9);
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (3, 4, 120, 6);
INSERT INTO tbm_product_demand (supplierid, productid, quantity, estimated_delivery)
VALUES (4, 5, 90, 8);

REM tbm_order

INSERT INTO tbm_order (orderid, orderdate, estimateddate, shippingprovince, customerid, taxid, shippingrateid)
VALUES (1, TO_DATE('01-JAN-22'), TO_DATE('07-JAN-22'), 'ON', 1, 9, 1);
INSERT INTO tbm_order (orderid, orderdate, estimateddate, shippingprovince, customerid, taxid, shippingrateid)
VALUES (2, TO_DATE('01-MAR-22'), TO_DATE('07-MAR-22'), 'BC', 2, 2, 2);
INSERT INTO tbm_order(orderid, orderdate, estimateddate, shippingprovince, customerid, taxid, shippingrateid) 
VALUES (3, TO_DATE('01-MAY-22'), TO_DATE('07-MAY-22'), 'AB', 3, 1, 5);
INSERT INTO tbm_order(orderid, orderdate, estimateddate, shippingprovince, customerid, taxid, shippingrateid) 
VALUES (4, TO_DATE('05-MAY-22'), TO_DATE('12-MAY-22'), 'AB', 3, 1, 1);
INSERT INTO tbm_order (orderid, orderdate, estimateddate, shippingprovince, customerid, taxid, shippingrateid)
VALUES (5, TO_DATE('01-MAR-21'), TO_DATE('07-MAR-21'), 'BC', 2, 2, 1);
INSERT INTO tbm_order (orderid, orderdate, estimateddate, shippingprovince, customerid, taxid, shippingrateid)
VALUES (6, TO_DATE('01-MAY-23'), TO_DATE('07-MAY-23'), 'ON', 1, 9, 1); 
INSERT INTO tbm_order (orderid, orderdate, estimateddate, shippingprovince, customerid, taxid, shippingrateid)
VALUES(7, TO_DATE('01-MAY-23'), TO_DATE('07-MAY-23'), 'QC', 4, 11, 3);
INSERT INTO tbm_order (orderid, orderdate, estimateddate, shippingprovince, customerid, taxid, shippingrateid)
VALUES(8, TO_DATE('01-JAN-23'), TO_DATE('08-JAN-23'), 'QC', 4, 11, 5);
INSERT INTO tbm_order (orderid, orderdate, estimateddate, shippingprovince, customerid, taxid, shippingrateid)
VALUES(9, TO_DATE('01-JAN-22'), TO_DATE('08-JAN-22'), 'QC', 4, 11, 1);
INSERT INTO tbm_order (orderid, orderdate, estimateddate, shippingprovince, customerid, taxid, shippingrateid)
VALUES(10, TO_DATE('01-OCT-22'), TO_DATE('07-OCT-22'), 'BC', 2, 2, 1);


REM tbm_order_item

INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES(1, 1, 1);
-- ADDED
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES(1, 15, 2);
-- 
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES (2, 13, 1);
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES (3, 11, 1);
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES (4, 18, 1);
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES (5, 10, 1);
-- ADDED
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES (6, 10, 1);
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES (6, 2, 1);
--
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES (7, 4, 2);
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES (8, 11, 1);
-- ADDED
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES (9, 1, 1);
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES (9, 19, 2);
--
INSERT INTO tbm_order_item(orderid, productid, quantity)
VALUES (10, 1, 1);

SPOOL OFF