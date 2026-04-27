-- module-16 student SQL assignment
-- Write your SQL solution here.
DROP TRIGGER IF EXISTS products_after_update;
DROP TABLE IF EXISTS Products_Audit;
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Products_Audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  old_price DECIMAL(10,2),
  new_price DECIMAL(10,2),
  changed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Products (product_id, product_name, price) VALUES
  (1, 'Tablet', 299.00),
  (2, 'Smartwatch', 149.95);

DELIMITER $$
CREATE TRIGGER products_after_update
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
  INSERT INTO Products_Audit (product_id, old_price, new_price)
  VALUES (OLD.product_id, OLD.price, NEW.price);
END$$
DELIMITER ;

