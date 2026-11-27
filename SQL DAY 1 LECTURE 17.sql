--THE CASE OF ITC AND ITS SALES--
--CREATE A EXCEL DATASHEET CONTAINING THE COLUMN NAME DISTRIBUTOR ID, NAME, CITY, REGION, PHONE--
--TABLE OF DISTRIBUTION--

CREATE TABLE distributors (
  distributor_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT,
  region TEXT,
  phone TEXT
  );
  
  --DROPPING THE TABLE--
  DROP  TABLE distributors;
  
  --CREATE A TABLE WITH THE NAME PRODUCTS CONTAINING PRODUCT ID, PRODUCT NAME, BRAND, CATEGORY, PRICE AND STOCK--
CREATE TABLE products(
  product_id INTEGER PRIMARY KEY,
  product_name TEXT NOT NULL unique,
  brand TEXT,
  category TEXT not NULL,
  price REAL CHECK (price>0),
  stock INTEGER DEFAULT 0
 );
 
--CREATE A TABLE CONTAINING NAME SALES AND SHOULD HAVE SALES ID, PRODUCT ID, DISTRIBUTOR ID, SALES DATE, QUANTITY AND AMOUNT--
CREATE TABLE sales(
  sales_id INTEGER PRIMARY KEY,
  product_id INTEGER,
  distributor_id INTEGER,
  sales_date TEXT,
  quantity INTEGER CHECK (quantity>0),
  amount REAL,
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (distributor_id) REFERENCES distributors(distributor_id)
  );
  
 --CHECKING THE COLUMN--
PRAGMA table_info(sales);
PRAGMA table_info(products);
PRAGMA table_info(distributors);

--TOPIC 1: SELECT,DISTINCT and Aliases ########

--1.1 SELECT: all columns and chosen columns--
--THE SALES HEAD WANTS TO SEE THE FULL LIST OF ITC DISTRIBUTORS --
select *from distributors;

--THE MARKETING TEAM NEEDS THE PRODUCT NAME, BRAND, AND PRICE--
SELECT product_name, brand, price from products;

-- UTILISING THE FUNCTION NAME DISTINCT--
--WHICH PRODUCT CATEGORY DOES THE ITC SELL?--
SELECT DISTINCT category from products;

--WHICH BRAND AND CATEGORY COMBINATION EXIST--
SELECT DISTINCT brand, category FROM products;

--Aliases--
--THE REPORT NEEDS TO CHANGE THE NAME FOR product_name AND price AS PRODUCT NAME AND MRP--
SELECT product_name AS "PRODUCT NAME", price AS "MRP" FROM products;

-- TOPIC 2: USING THE CLAUSE- WHERE AND FILTERING WITH AND WITHOUT OPERATORES--
-- LIST ALL THE BISCUIT PRODUCTS FROM THE TABLE PRODUCTS--
SELECT product_name FROM products WHERE category = 'Biscuits';

--WHICH PRODUCTS ARE NOT IN THE STAPLES CATEGORY--
SELECT product_name FROM products WHERE category != 'Staples';

--WHICH PRODUCT COST 100 OR MORE--
SELECT product_name, price FROM products WHERE price >= 100 ;

--USING AND, OR, NOT--
--WHICH SNACKS PRODUCT COST LESS THEN RS 15--
SELECT product_name, price FROM products WHERE category = 'Snacks' AND price <15;

--SHOW PRODUCTS OF THE BINGO AND YIPPEE--
SELECT DISTINCT brand FROM products; 
SELECT product_name, brand FROM products WHERE brand = 'Yippee' or brand= 'Bingo';

--SHOW THE PRODUCTS THAT ARE NOT SNACKS AND COST LESS THEN RS 30--
SELECT product_name, price FROM products WHERE NOT category = 'Snacks' and price<30;

--USING THE OPERATORS- BETWEEN, IN and NOT IN--
--SHOW PRODUCTS PRICE FROM RS20 TO RS50--
SELECT product_name, price FROM products WHERE price BETWEEN 20 AND 50;

--SHOW PRODUCTS IN THE SNACKS, NOODLES OR CHOCOLATE CATEGORY--
SELECT DISTINCT category FROM products; 
SELECT product_name, category FROM products WHERE category IN ('Snacks','Noodles','Chocolate');

--SHOW ALL THE DISTRIBUTORS WHICH ARE NOT IN NORTH AND SOUTH REGION--
SELECT DISTINCT region FROM distributors;
SELECT name,region FROM distributors WHERE region NOT IN ('North','South');

