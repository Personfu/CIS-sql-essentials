-- module-15 student SQL assignment
-- Write your SQL solution here.
DROP PROCEDURE IF EXISTS GetLowStockProducts;
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  quantity INT NOT NULL
);

INSERT INTO Products (product_id, product_name, quantity) VALUES
  (1, 'Charger', 12),
  (2, 'Power Bank', 5),
  (3, 'USB Cable', 30),
  (4, 'Travel Adapter', 3);

DELIMITER $$
CREATE PROCEDURE GetLowStockProducts()
BEGIN
  SELECT product_id, product_name, quantity
  FROM Products
  WHERE quantity < 10
  ORDER BY quantity;
END$$
DELIMITER ;

