-- module-03 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Products;
DROP VIEW IF EXISTS discounted_products;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category VARCHAR(50) NOT NULL
);

INSERT INTO Products (product_id, product_name, price, category) VALUES
  (1, 'Wireless Earbuds', 79.99, 'Audio'),
  (2, 'Gaming Mouse', 59.95, 'Accessories'),
  (3, 'Desk Lamp', 34.75, 'Lighting'),
  (4, 'Office Chair', 249.00, 'Furniture'),
  (5, 'Webcam', 89.50, 'Video');

CREATE OR REPLACE VIEW discounted_products AS
SELECT
  product_name AS Product,
  price AS Cost
FROM Products
WHERE price > 50;

