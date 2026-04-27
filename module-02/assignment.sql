-- module-02 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(80) NOT NULL,
  email VARCHAR(120)
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers (customer_id, customer_name, email) VALUES
  (1, 'Alice', 'alice@example.com'),
  (2, 'Bob', 'bob@example.com'),
  (3, 'Carol', 'carol@example.com');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
  (1001, 1, '2026-04-05', 120.00),
  (1002, 1, '2026-04-07', 85.00),
  (1003, 2, '2026-04-08', 55.50),
  (1004, 3, '2026-04-09', 99.99);

