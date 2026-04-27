-- module-09 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  status VARCHAR(20) NOT NULL
);

INSERT INTO Products (product_id, product_name, price, status) VALUES
  (1, 'Gaming Chair', 249.99, 'Active'),
  (2, 'Desk Lamp', 34.99, 'Active'),
  (3, 'Mouse Pad', 12.50, 'Active'),
  (4, 'Sticker Pack', 4.99, 'Discontinued');

UPDATE Products
SET price = price * 0.90
WHERE status = 'Active';

DELETE FROM Products
WHERE status = 'Discontinued';

