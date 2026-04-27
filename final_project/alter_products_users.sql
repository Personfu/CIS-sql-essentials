-- Final Project ALTER table validation script

USE my_web_db;

ALTER TABLE products
  ADD COLUMN price DECIMAL(6,2) NOT NULL DEFAULT 9.99,
  ADD COLUMN date_added DATETIME NOT NULL DEFAULT NOW();

SELECT 'PRODUCTS COLUMN VALIDATION' AS section;
SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'my_web_db' AND TABLE_NAME = 'products'
  AND COLUMN_NAME IN ('price', 'date_added');

SELECT 'PRODUCTS SAMPLE ROWS' AS section;
SELECT product_id, product_name, price, date_added FROM products ORDER BY product_id;

ALTER TABLE users
  MODIFY COLUMN first_name VARCHAR(20) NOT NULL;

SELECT 'USERS COLUMN VALIDATION' AS section;
SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'my_web_db' AND TABLE_NAME = 'users'
  AND COLUMN_NAME = 'first_name';

SELECT 'USER ROW BEFORE INVALID TESTS' AS section;
SELECT user_id, email, first_name, last_name FROM users WHERE user_id = 1;

SELECT 'EXPECT ERROR: NULL first_name update' AS test;
UPDATE users
SET first_name = NULL
WHERE user_id = 1;
SELECT 'CONFIRM ROW UNAFFECTED AFTER NULL TEST' AS note;
SELECT user_id, email, first_name, last_name FROM users WHERE user_id = 1;

SELECT 'EXPECT ERROR: first_name longer than 20 chars update' AS test;
UPDATE users
SET first_name = 'ThisFirstNameIsLongerThanTwentyCharacters'
WHERE user_id = 1;
SELECT 'CONFIRM ROW UNAFFECTED AFTER LENGTH TEST' AS note;
SELECT user_id, email, first_name, last_name FROM users WHERE user_id = 1;
