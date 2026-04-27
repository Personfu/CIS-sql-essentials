-- module-10 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(80) NOT NULL,
  email VARCHAR(120) NOT NULL,
  signup_date DATE NOT NULL,
  UNIQUE KEY unique_email (email)
);

INSERT INTO Customers (customer_id, customer_name, email, signup_date) VALUES
  (1, 'Alice', 'alice@example.com', '2026-04-01'),
  (2, 'Bob', 'bob@example.com', '2026-04-02'),
  (3, 'Carol', 'carol@example.com', '2026-04-03');

