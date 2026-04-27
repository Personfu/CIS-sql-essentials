-- module-12 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Sales;
DROP VIEW IF EXISTS sales_rank;

CREATE TABLE Sales (
  sale_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  sale_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO Sales (sale_id, product_name, sale_amount) VALUES
  (1, 'Keyboard', 79.99),
  (2, 'Mouse', 29.99),
  (3, 'Monitor', 199.99),
  (4, 'Mouse', 24.99),
  (5, 'Keyboard', 89.99);

CREATE OR REPLACE VIEW sales_rank AS
SELECT
  sale_id,
  product_name,
  sale_amount,
  RANK() OVER (PARTITION BY product_name ORDER BY sale_amount DESC) AS product_rank
FROM Sales;

