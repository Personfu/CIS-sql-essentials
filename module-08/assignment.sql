-- module-08 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Products;
DROP VIEW IF EXISTS low_stock_products;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL
);

CREATE TABLE Inventory (
  inventory_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, product_name) VALUES
  (1, 'Notebook'),
  (2, 'Pen'),
  (3, 'Desk Organizer');

INSERT INTO Inventory (inventory_id, product_id, quantity) VALUES
  (1, 1, 25),
  (2, 2, 5),
  (3, 3, 2);

CREATE OR REPLACE VIEW low_stock_products AS
WITH stocked AS (
  SELECT p.product_name, i.quantity
  FROM Products p
  JOIN Inventory i ON p.product_id = i.product_id
)
SELECT product_name, quantity
FROM stocked
WHERE quantity < 10
ORDER BY quantity;

