REM Creating the !Timber tables with constraints
REM ALL THE REGULAR EXPRESSIONS WERE EXTRACTED FROM THE HOLLYWOOD NORTH SQL FILE

SET ECHO ON
SPOOL c:/cprg250s/timbermerged.txt

REM SET language to english to avoid problems with non-english machines
alter session set NLS_LANGUAGE = ENGLISH;

DROP TABLE tbm_tax CASCADE CONSTRAINTS;
DROP TABLE tbm_shipping_rate CASCADE CONSTRAINTS;
DROP TABLE tbm_product_review CASCADE CONSTRAINTS;
DROP TABLE tbm_product_demand CASCADE CONSTRAINTS;
DROP TABLE tbm_order_item CASCADE CONSTRAINTS;
DROP TABLE tbm_product CASCADE CONSTRAINTS;
DROP TABLE tbm_customer CASCADE CONSTRAINTS;
DROP TABLE tbm_order CASCADE CONSTRAINTS;
DROP TABLE tbm_category CASCADE CONSTRAINTS;
DROP TABLE tbm_supplier CASCADE CONSTRAINTS;

REM Create table with column-level constraints

CREATE TABLE tbm_tax (
    taxid NUMBER CONSTRAINT SYS_TAX_PK PRIMARY KEY,
    gst FLOAT,
    pst FLOAT, 
    hst FLOAT
);

CREATE TABLE tbm_shipping_rate (
    shippingrateid NUMBER CONSTRAINT SYS_SHIPRT_PK PRIMARY KEY,
    weightmin FLOAT CONSTRAINT SYS_SHIPRT__WEIGHT_MIN_CK 
    CHECK (weightmin > 0),
    weightmax FLOAT,
    shippingcost FLOAT
);

CREATE TABLE tbm_customer (
    customerid NUMBER CONSTRAINT SYS_CUSTOMER_PK PRIMARY KEY,
    phonenumber CHAR(12) CONSTRAINT SYS_CUSTOMER_PHONE_NUMBER_CK
    CHECK ( REGEXP_LIKE (phonenumber, '[1-9]([0-9]){2}[.]([0-9]){3}[.]([0-9]){4}')),
    addressstreet VARCHAR2(50),
    addressnumber NUMBER,
    city VARCHAR2(50) NOT NULL,
    province CHAR(2) CONSTRAINT SYS_CUSTOMER_PROV_CK CHECK (UPPER(province) IN ('AB',
   'BC', 'MB', 'NB', 'NL', 'NS', 'NT', 'NU', 'ON', 'PE', 'QC',
   'SK', 'YT')),
   postalcode CHAR(6) CONSTRAINT SYS_CUSTOMER_POSTAL_CODE_CK CHECK (REGEXP_LIKE (postalcode, '([A-Z][0-9]){3}')),
   emailaddress VARCHAR(50) CONSTRAINT SYS_CUSTOMER_EMAIL_UK UNIQUE
   CONSTRAINT SYS_CUSTOMER_EMAIL_CK 
   CHECK (REGEXP_LIKE (emailaddress, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')),
   istimbermember NUMBER(1) CONSTRAINT SYS_CUSTOMER_IS_MEMBER_CK CHECK (istimbermember IN (0,1))
);

CREATE TABLE tbm_supplier(
    supplierid NUMBER CONSTRAINT SYS_SUPPLIER_PK PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    emailaddress VARCHAR2(50) CONSTRAINT SYS_SUPPLIER_EMAIL_CK CHECK (REGEXP_LIKE (emailaddress, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')),
    city VARCHAR2(50) NOT NULL,
    province CHAR(2) CONSTRAINT SYS_SUPPLIER_PROV_CK CHECK(province IN ('AB', 'ON', 'BC', 'QC', 'NB', 'MB', 'SK', 'PE', 'NL', 'NS', 'NU', 'YT', 'NT'))
    );

CREATE TABLE tbm_order (
    orderid NUMBER CONSTRAINT SYS_ORDER_PK PRIMARY KEY,
    orderdate DATE,
    estimateddate DATE,
    shippingprovince CHAR(2) CONSTRAINT SYS_ORDER_SHIPP_PROVINCE_CK CHECK (UPPER(shippingprovince) IN ('AB',
   'BC', 'MB', 'NB', 'NL', 'NS', 'NT', 'NU', 'ON', 'PE', 'QC',
   'SK', 'YT')),
   customerid NUMBER,
   CONSTRAINT SYS_CUSTOMER_ORDER_FK FOREIGN KEY (customerid) REFERENCES tbm_customer(customerid),
   taxid NUMBER,
    CONSTRAINT SYS_TAX_ORDER_FK FOREIGN KEY (taxid) REFERENCES tbm_tax(taxid),
   shippingrateid NUMBER, 
   CONSTRAINT SYS_SHIPRT_ORDER_FK FOREIGN KEY (shippingrateid) REFERENCES tbm_shipping_rate(shippingrateid),
   CONSTRAINT SYS_ORDER_EST_DATE_CK CHECK (estimateddate >= orderdate)
);

CREATE TABLE tbm_category (
    categoryid NUMBER CONSTRAINT SYS_CATEGORY_PK PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    parentcategory NUMBER,
    CONSTRAINT SYS_CATEGORY_CATEGORY_FK FOREIGN KEY (parentcategory) REFERENCES tbm_category(categoryid)
);

CREATE TABLE tbm_product (
    productid NUMBER CONSTRAINT SYS_PRODUCT_PK PRIMARY KEY,
    title VARCHAR2(50),
    description VARCHAR2(100),
    price FLOAT CONSTRAINT SYS_PRODUCT_PRICE_CK CHECK (price > 0),
    weight FLOAT CONSTRAINT SYS_PRODUCT_WEIGHT_CK CHECK (weight > 0),
    taxexempt NUMBER(1) CONSTRAINT SYS_PRODUCT_TAX_EXEMPT_CK CHECK (taxexempt in (0,1)),
    category NUMBER NOT NULL,
    CONSTRAINT SYS_CATEGORY_PRODUCT_FK FOREIGN KEY (category) REFERENCES tbm_category(categoryid) 
);

CREATE TABLE tbm_product_demand(
    supplierid NUMBER,
    productid NUMBER,
    quantity NUMBER CONSTRAINT SYS_PRODUCT_DEMAND_QUANTITY_CK CHECK(quantity >= 0),
    estimated_delivery NUMBER(3) CONSTRAINT SYS_PRODUCT_DEMAND_EST_DELIVERY_CK CHECK(estimated_delivery >= 0),
    CONSTRAINT SYS_ORDER_PRODUCT_DEMAND_PK PRIMARY KEY (supplierid, productid),
    CONSTRAINT SYS_SUPPLIER_SUPPLIER_FK FOREIGN KEY(supplierid) REFERENCES tbm_supplier(supplierid),
    CONSTRAINT SYS_PRODUCT_ID_FK FOREIGN KEY(productid) REFERENCES tbm_product(productid)
);


CREATE TABLE tbm_product_review(
    productreviewid NUMBER CONSTRAINT SYS_PRODUCT_REVIEW_PK PRIMARY KEY,
    rating NUMBER(1) CONSTRAINT SYS_RATING_CK CHECK(rating in (1, 2, 3, 4, 5)),
    comments VARCHAR2(100),
    dateofreview DATE,
    customerid NUMBER NOT NULL,
    productid NUMBER NOT NULL,
    CONSTRAINT SYS_CUSTOMER_CUSTOMER_FK FOREIGN KEY(customerid) REFERENCES tbm_customer(customerid),
    CONSTRAINT SYS_PRODUCT_PRODUCT_FK FOREIGN KEY(productid) REFERENCES tbm_product(productid)
);

CREATE TABLE tbm_order_item (
    orderid NUMBER,
    productid NUMBER,
    quantity NUMBER NOT NULL CONSTRAINT SYS_ORDER_ITEM_QUANTITY_CK CHECK (quantity > 0),
    CONSTRAINT SYS_ORDER_ITEM_PK PRIMARY KEY (orderid, productid),
    CONSTRAINT SYS_ORDER_ORDER_ITEM_FK FOREIGN KEY (orderid) REFERENCES tbm_order(orderid),
    CONSTRAINT SYS_PRODUCT_ORDER_ITEM_FK FOREIGN KEY (productid) REFERENCES tbm_product(productid)
 );

SPOOL off