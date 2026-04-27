-- module-14 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Customers;
DROP VIEW IF EXISTS customer_contacts;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(120),
  signup_date DATE NOT NULL
);

INSERT INTO Customers (customer_id, first_name, last_name, email, signup_date) VALUES
  (1, 'Alice', 'Anderson', 'alice@example.com', '2026-01-15'),
  (2, 'Bob', 'Brown', NULL, '2026-02-10'),
  (3, 'Carol', 'Clark', 'carol@example.com', '2026-03-05');

CREATE OR REPLACE VIEW customer_contacts AS
SELECT
  customer_id,
  CONCAT(first_name, ' ', last_name) AS full_name,
  COALESCE(email, 'no-email@example.com') AS email_address,
  DATE_FORMAT(signup_date, '%Y-%m-%d') AS joined_on
FROM Customers
ORDER BY customer_id;

