-- PersonFu-Final: alter_products_users.sql
USE my_web_db;

-- Add product metadata columns.
ALTER TABLE products
  ADD COLUMN price DECIMAL(6,2) NOT NULL DEFAULT 9.99,
  ADD COLUMN date_added DATETIME NOT NULL DEFAULT NOW();

-- Enforce first_name constraints on users.
ALTER TABLE users
  MODIFY COLUMN first_name VARCHAR(20) NOT NULL;

-- Validation: schema checks.
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'my_web_db'
  AND TABLE_NAME IN ('users', 'products');

-- Failure demonstration: NULL first_name should violate NOT NULL.
UPDATE users
SET first_name = NULL
WHERE user_id = 1;

-- Failure demonstration: length violation should fail.
UPDATE users
SET first_name = 'ThisFirstNameIsLongerThanTwentyCharacters'
WHERE user_id = 1;
