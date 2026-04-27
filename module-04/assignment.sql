-- module-04 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Products;
DROP VIEW IF EXISTS electronics;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category VARCHAR(50) NOT NULL
);

INSERT INTO Products (product_id, product_name, price, category) VALUES
  (1, 'Smartphone', 699.00, 'Electronics'),
  (2, 'Tablet', 329.99, 'Electronics'),
  (3, 'Bluetooth Speaker', 89.95, 'Electronics'),
  (4, 'Desk Organizer', 19.50, 'Office'),
  (5, 'Monitor', 179.99, 'Electronics');

CREATE OR REPLACE VIEW electronics AS
SELECT product_name, price
FROM Products
WHERE category = 'Electronics' AND price BETWEEN 50 AND 200
ORDER BY price;

