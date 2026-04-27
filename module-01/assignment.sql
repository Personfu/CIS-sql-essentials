-- module-01 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category VARCHAR(50) NOT NULL
);

INSERT INTO Products (product_id, product_name, price, category) VALUES
  (1, 'Wireless Mouse', 24.99, 'Accessories'),
  (2, 'Mechanical Keyboard', 119.99, 'Accessories'),
  (3, 'USB-C Hub', 39.95, 'Accessories'),
  (4, 'Laptop Stand', 49.00, 'Furniture'),
  (5, 'Noise-Canceling Headphones', 199.50, 'Audio');

