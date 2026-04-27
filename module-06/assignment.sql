-- module-06 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP VIEW IF EXISTS customer_order_totals;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(80) NOT NULL
);

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems (
  order_item_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers (customer_id, customer_name) VALUES
  (1, 'Alice'),
  (2, 'Bob');

INSERT INTO Products (product_id, product_name, price) VALUES
  (1, 'Keyboard', 79.99),
  (2, 'Mouse', 29.99),
  (3, 'Monitor', 199.99);

INSERT INTO Orders (order_id, customer_id, order_date) VALUES
  (101, 1, '2026-04-10'),
  (102, 1, '2026-04-11'),
  (103, 2, '2026-04-12');

INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity) VALUES
  (1, 101, 1, 1),
  (2, 101, 2, 2),
  (3, 102, 3, 1),
  (4, 103, 1, 1);

CREATE OR REPLACE VIEW customer_order_totals AS
SELECT
  c.customer_id,
  c.customer_name,
  SUM(oi.quantity * p.price) AS total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY c.customer_id;

