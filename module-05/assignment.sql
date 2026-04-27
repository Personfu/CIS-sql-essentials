-- module-05 student SQL assignment
-- Write your SQL solution here.
DROP TABLE IF EXISTS Sales;
DROP VIEW IF EXISTS sales_summary;

CREATE TABLE Sales (
  sale_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

INSERT INTO Sales (sale_id, product_name, category, quantity, price) VALUES
  (1, 'Red T-shirt', 'Apparel', 5, 19.99),
  (2, 'Blue Jeans', 'Apparel', 3, 49.50),
  (3, 'Coffee Mug', 'Home', 10, 9.99),
  (4, 'Desk Lamp', 'Home', 2, 34.99),
  (5, 'Running Shoes', 'Apparel', 1, 79.99);

CREATE OR REPLACE VIEW sales_summary AS
SELECT
  category,
  COUNT(*) AS orders_count,
  SUM(quantity * price) AS total_sales,
  ROUND(AVG(quantity * price), 2) AS average_order_value
FROM Sales
GROUP BY category
HAVING total_sales > 0;

