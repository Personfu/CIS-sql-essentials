-- Final Project ALTER table validation script

USE my_web_db;

-- Add the required columns to products
ALTER TABLE products
  ADD COLUMN price DECIMAL(6,2) NOT NULL DEFAULT 9.99,
  ADD COLUMN date_added DATETIME NOT NULL DEFAULT NOW();

-- Enforce users.first_name length and NOT NULL
ALTER TABLE users
  MODIFY COLUMN first_name VARCHAR(20) NOT NULL;

-- Validation checks
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'my_web_db'
  AND TABLE_NAME IN ('users', 'products');

-- Demonstrate constraint failure: NULL first name
UPDATE users
SET first_name = NULL
WHERE user_id = 1;

-- Demonstrate constraint failure: overly long first name
UPDATE users
SET first_name = 'ThisFirstNameIsLongerThanTwentyCharacters'
WHERE user_id = 1;
